FROM python:3.11

WORKDIR /usr/src/app

# Copy the Pipfile and Pipfile.lock
COPY Pipfile Pipfile.lock ./

# Install any needed packages specified in Pipfile
RUN pip install pipenv && pipenv install --system --deploy

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Set the environment variables
ENV DISCORD_TOKEN=${DISCORD_TOKEN}
ENV OPENAI_API_KEY=${OPENAI_API_KEY}
ENV DISCORD_CLIENT_ID=${DISCORD_CLIENT_ID}
ENV ALLOWED_SERVER_IDS=${ALLOWED_SERVER_IDS}
ENV SERVER_TO_MODERATION_CHANNEL=${SERVER_TO_MODERATION_CHANNEL}
ENV DEFAULT_MODEL=${DEFAULT_MODEL}


# Run main.py when the container launches
CMD ["python", "./src/main.py"]

# Add this line to expose port 8080
EXPOSE 8080