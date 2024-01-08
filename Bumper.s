; File: Bumper.s
; Ce fichier gère les pare-chocs (Bumper)

; Définition des offsets des registres GPIO
GPIO_O_DEN          EQU     0x0000051C     ; Offset du registre d'activation des pins du port GPIO
GPIO_I_PUR          EQU     0x00000510     ; Offset du registre de résistance de tirage GPIO (p432 datasheet de lm3s9B92.pdf)
GPIO_PORTE_BASE     EQU     0x40024000     ; Adresse de la base du port GPIO E
BROCHE0_1           EQU     0x03    ; Broches pour les pare-chocs gauche et droit (Bumper_L&R sur broches 0 et 1)       

	AREA    |.text|, CODE, READONLY
	ENTRY

	EXPORT  BUMPERS_INIT

BUMPERS_INIT
    PUSH {LR}
    ; Configuration des pare-chocs
    ldr r11, = GPIO_PORTE_BASE+GPIO_I_PUR   ;; Activation de la résistance de tirage (Pull-Up)
    ldr r0, = BROCHE0_1
    str r0, [r11]
    
    ldr r11, = GPIO_PORTE_BASE+GPIO_O_DEN   ;; Activation de la fonction numérique
    ldr r0, = BROCHE0_1
    str r0, [r11]

    ; NE PAS TOUCHER R11 car il contient l'état des bumpers
    ldr r11, = GPIO_PORTE_BASE + (BROCHE0_1<<2)
    POP {LR}
    BX LR

END
