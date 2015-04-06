#define GPIO_ON_P7	(int*) 0x400f629c
#define GPIO_OFF_P7	(int*) 0x400f631c
#define REDLED		0x20
#define DELAY		0xFFFFF

void sleep(void) {
	unsigned int i;
	for(i = 0; i < DELAY; i++);
}

int c_entry(void) {
	while(1) {
		sleep();
		*(GPIO_ON_P7) = REDLED;
		sleep();
		*(GPIO_OFF_P7) = REDLED;
	}
	return 0;
}
