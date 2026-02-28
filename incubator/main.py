from fastapi import FastAPI
import os

app = FastAPI()

NAME = os.getenv("APP_NAME", "Unknown-Incubator")

@app.get("/")
async def root():
    return {
        "status": "Active",
        "message": f"Welcome to the EDEN Incubator: {NAME}",
        "program": "Nurse Empowerment and Education",
        "version": "1.0.0"
    }

if __name__ == "__main__":
    import uvicorn
    port = int(os.getenv("PORT", 8000))
    uvicorn.run(app, host="0.0.0.0", port=port)
