import azure.functions as func
import logging

app = func.FunctionApp()

@app.service_bus_topic_trigger(arg_name="azservicebus", subscription_name="filter-based-subs", topic_name="demo-topic",
                               connection="demoservicebusneu_SERVICEBUS") 
def servicebusTopicTrigger(azservicebus: func.ServiceBusMessage):
    logging.info('Python ServiceBus Topic trigger processed a message: %s',
                azservicebus.get_body().decode('utf-8'))
