import azure.functions as func
import logging

app = func.FunctionApp()

@app.blob_trigger(arg_name="myblob", path="landing-zn/{name}",
                               connection="demoblobtriggerstgacc_STORAGE") 
def blobTriggerDemo(myblob: func.InputStream):
    logging.info(f"Python blob trigger function processed blob"
                f"Name: {myblob.name}"
                f"Blob Content: {myblob}")
