; File: Switch.s
; Ce fichier gère les interrupteurs (Switch)

; Définition des offsets des registres GPIO
GPIO_O_DEN          EQU      0x0000051C     ; Offset du registre d'activation des pins du port GPIO
GPIO_I_PUR          EQU      0x00000510     ; Offset du registre de résistance de tirage GPIO (p432 datasheet de lm3s9B92.pdf)

; Broches pour les deux interrupteurs (BROCHE4 et BROCHE5)
BROCHE4_5           EQU      0xC0           ; Bits pour les deux interrupteurs (BROCHE4 et BROCHE5)

GPIO_PORTD_BASE     EQU      0x40007000     ; Adresse de la base du port GPIO D

	AREA    |.text|, CODE, READONLY
	ENTRY

	EXPORT  SWITCH_INIT

SWITCH_INIT
    PUSH {LR}
    ; Configuration des interrupteurs
    ldr r10, = GPIO_PORTD_BASE+GPIO_I_PUR   ;; Activation de la résistance de tirage (Pull-Up)
    ldr r0, = BROCHE4_5
    str r0, [r10]
    
    ldr r10, = GPIO_PORTD_BASE+GPIO_O_DEN   ;; Activation de la fonction numérique
    ldr r0, = BROCHE4_5
    str r0, [r10]

    ; NE PAS TOUCHER R10 car il contient l'état des interrupteurs
    ldr r10, = GPIO_PORTD_BASE + (BROCHE4_5<<2)
    POP {LR}
    BX LR

END
