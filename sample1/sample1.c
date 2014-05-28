#define bFM3_GPIO_PFRF_P3                      *((volatile unsigned int*)(0x4266078CUL))
#define bFM3_GPIO_DDRF_P3                      *((volatile unsigned int*)(0x4266478CUL))
#define bFM3_GPIO_PDIRF_P3                     *((volatile unsigned int*)(0x4266678CUL))
#define bFM3_GPIO_PDORF_P3                     *((volatile unsigned int*)(0x4266878CUL))
#define bFM3_GPIO_PZRF_P3                      *((volatile unsigned int*)(0x4266E78CUL))

int main() {
    bFM3_GPIO_PFRF_P3 = 0;   // PF3 set to GPIO
    bFM3_GPIO_PZRF_P3 = 1;   // PF3 set to Open-drain mode
    bFM3_GPIO_DDRF_P3 = 1;   // PF3 set to output
    bFM3_GPIO_PDORF_P3 = 0;  // PF3 set to lowlevel.
    for(;;) {};
}
void SystemInit(void) {
}
