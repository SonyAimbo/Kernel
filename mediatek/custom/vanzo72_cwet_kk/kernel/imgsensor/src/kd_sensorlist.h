//s_add new sensor driver here
//export funtions

#ifdef OV5645_MIPI_YUV_CHENXING
    #define OV5645_MIPI_YUV
#endif
#ifdef GC0329_YUV_CHENXING
    #define GC0329_YUV
#endif

#ifdef  SP0A28_YUV
    #define SP0A28_MIPI_YUV
#endif

UINT32 OV5645_MIPI_YUV_SensorInit(PSENSOR_FUNCTION_STRUCT *pfFunc);
UINT32 GC0329_YUV_SensorInit(PSENSOR_FUNCTION_STRUCT *pfFunc);

//! Add Sensor Init function here
//! Note:
//! 1. Add by the resolution from ""large to small"", due to large sensor
//!    will be possible to be main sensor.
//!    This can avoid I2C error during searching sensor.
//! 2. This file should be the same as mediatek\custom\common\hal\imgsensor\src\sensorlist.cpp
ACDK_KD_SENSOR_INIT_FUNCTION_STRUCT kdSensorList[MAX_NUM_OF_SUPPORT_SENSOR+1] =
{
#if defined(OV5645_MIPI_YUV)
		{OV5645MIPI_SENSOR_ID, SENSOR_DRVNAME_OV5645_MIPI_YUV, OV5645_MIPI_YUV_SensorInit}, 
#endif
#if defined(GC0329_YUV)
    {GC0329_SENSOR_ID, SENSOR_DRVNAME_GC0329_YUV, GC0329_YUV_SensorInit}, 
#endif
#if defined(SP0A28_MIPI_YUV) 
    {SP0A28_SENSOR_ID, SENSOR_DRVNAME_SP0A28_MIPI_YUV, SP0A28_YUV_SensorInit},
#endif

{0,{0},NULL}, //end of list
};

