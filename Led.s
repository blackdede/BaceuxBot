; File: Led.s
; Ce fichier gère les LED

; Définition des constantes pour les broches et adresses GPIO
BROCHE_LED1         EQU     0x10         ; Broche pour LED1
BROCHE_LED2         EQU     0x20         ; Broche pour LED2
GPIO_PORTF_BASE     EQU     0x40025000   ; Adresse de la base du port GPIO F
GPIO_O_DIR          EQU     0x00000400   ; Offset du registre de direction du port GPIO
GPIO_O_DR2R         EQU     0x00000500   ; Offset du registre de drive strength du port GPIO
GPIO_O_DEN          EQU     0x0000051C   ; Offset du registre d'activation des pins du port GPIO
BROCHE2_3           EQU     0x30         ; LED1 et LED2 sur broches 2 et 3

	AREA    |.text|, CODE, READONLY
	ENTRY

	EXPORT  LED1_ON
	EXPORT  LED1_OFF
	EXPORT  LED2_ON
	EXPORT  LED2_OFF
	EXPORT  LED_INIT

; Fonction pour allumer la LED1
LED1_ON
    PUSH {LR}
    ldr R0, =BROCHE_LED1
    ldr R12, =GPIO_PORTF_BASE + (BROCHE_LED1 << 2)
    str R0, [R12]
    POP {LR}
    BX LR

; Fonction pour allumer la LED2
LED2_ON
    PUSH {LR}
    ldr R0, =BROCHE_LED2
    ldr R12, =GPIO_PORTF_BASE + (BROCHE_LED2 << 2)
    str R0, [R12]
    POP {LR}
    BX LR

LED_INIT
    PUSH {LR}
    ; Configuration des LEDs

    ldr r12, = GPIO_PORTF_BASE+GPIO_O_DIR    ;; Configurer le port F en sortie (broches 2 et 3)
    ldr r0, = BROCHE2_3 
    str r0, [r12]
    
    ldr r12, = GPIO_PORTF_BASE+GPIO_O_DEN    ;; Activation de la fonction numérique
    ldr r0, = BROCHE2_3       
    str r0, [r12]
    
    ldr r12, = GPIO_PORTF_BASE+GPIO_O_DR2R   ;; Choix de l'intensité de sortie (2mA)
    ldr r0, = BROCHE2_3          
    str r0, [r12]
    
    ; NE PAS TOUCHER R12 car il contient l'état des LEDS
    ldr r12, = GPIO_PORTF_BASE + (BROCHE2_3<<2)
    POP {LR}
    BX LR

; Fonction pour éteindre la LED1
LED1_OFF
    LDR R12, =GPIO_PORTF_BASE + (BROCHE_LED1 << 2)
    MOV R0, #0x000
    STR R0, [R12]
    BX LR

; Fonction pour éteindre la LED2
LED2_OFF
    LDR R12, =GPIO_PORTF_BASE + (BROCHE_LED2 << 2)
    MOV R0, #0x000
    STR R0, [R12]
    BX LR

END
