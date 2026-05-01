# ---------- BUILD STAGE ----------
FROM golang:1.25 AS builder

WORKDIR /app

# Install git (needed for some Go dependencies)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copy dependency files first (for caching)
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -o app ./cmd/api


# ---------- RUN STAGE ----------
FROM alpine:latest

WORKDIR /app

# Install wget (for healthcheck)
RUN apk add --no-cache wget

# Create non-root user (security best practice)
RUN adduser -D appuser

# Copy compiled binary from builder stage
COPY --from=builder /app/app .

# Copy dotenv file
COPY .env .env

# Use non-root user
USER appuser

# Expose app port
EXPOSE 8080

# Health check
HEALTHCHECK CMD wget --spider http://localhost:8080/ping || exit 1

# Run the application
CMD ["./app"]