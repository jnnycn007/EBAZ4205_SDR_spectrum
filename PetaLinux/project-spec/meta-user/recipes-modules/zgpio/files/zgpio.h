
// ioctl command definition
#define ZGPIO_IOC_MAGIC 'm'
#define ZGPIO_IOCRESET _IO(ZGPIO_IOC_MAGIC, 0)
#define ZGPIO_IOCSET _IOW(ZGPIO_IOC_MAGIC, 1, int)
#define ZGPIO_IOCGET _IOR(ZGPIO_IOC_MAGIC, 2, int)
#define ZGPIO_IOCSET2 _IOW(ZGPIO_IOC_MAGIC, 3, int)
#define ZGPIO_IOCGET2 _IOR(ZGPIO_IOC_MAGIC, 4, int)
#define ZGPIO_IOCSETGINT _IOW(ZGPIO_IOC_MAGIC, 5, int)
#define ZGPIO_IOCSETINT _IOW(ZGPIO_IOC_MAGIC, 6, int)
#define ZGPIO_IOCSETINT2 _IOW(ZGPIO_IOC_MAGIC, 7, int)
#define ZGPIO_IOCSETTBUF _IOW(ZGPIO_IOC_MAGIC, 8, int)
#define ZGPIO_IOCGETTBUF _IOR(ZGPIO_IOC_MAGIC, 9, int)
#define ZGPIO_IOCSETTBUF2 _IOW(ZGPIO_IOC_MAGIC, 10, int)
#define ZGPIO_IOCGETTBUF2 _IOR(ZGPIO_IOC_MAGIC, 11, int)
#define ZGPIO_IOC_MAXNR 11

