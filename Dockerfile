# Start by building the application in a builder image
FROM golang:1.17 as builder

# Set the working directory inside the builder stage
WORKDIR /app

# Copy the go mod file
COPY go.mod ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the application, disable CGO and ensure static link
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o heightConverter .

# Start a new stage from scratch
FROM scratch

# Copy the binary from the builder stage to the scratch stage
COPY --from=builder /app/heightConverter /heightConverter

# Command to run the executable
CMD ["/heightConverter"]


