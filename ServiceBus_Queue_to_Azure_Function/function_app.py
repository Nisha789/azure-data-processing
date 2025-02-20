import azure.functions as func
import logging

app = func.FunctionApp()

@app.service_bus_queue_trigger(arg_name="azservicebus", queue_name="demo-queue",
                               connection="demoservicebusneu_SERVICEBUS") 
def ServicebusQueueTrigger(azservicebus: func.ServiceBusMessage):
    logging.info('Python ServiceBus Queue trigger processed a message: %s',
                azservicebus.get_body().decode('utf-8'))
