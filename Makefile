#============================================================
# Author: Drew Smothers
# File: Makefile
# Last Modified: 2026-02-20
# Purpose: Compile and link Employee, Officer, Supervisor classes
#          and main program into executable 'employee'
#============================================================

# Compiler to use
CC = g++

# Name of the final executable
TARGET = employee

# Compile flags: -c for compile only, -Wall and -Wextra for warnings
CFLAGS = -c -Wall -Wextra

# List of object files
OBJS = main.o Employee.o Officer.o Supervisor.o

#============================================================
# Default target: builds the executable
#============================================================
all: $(TARGET)

#============================================================
# Link all object files to create the executable
#============================================================
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

#============================================================
# Compile individual source files to object files
#============================================================
main.o: main.cpp Employee.h Supervisor.h Officer.h
	$(CC) $(CFLAGS) main.cpp

Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) Employee.cpp

Officer.o: Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) Officer.cpp

Supervisor.o: Supervisor.cpp Supervisor.h Employee.h
	$(CC) $(CFLAGS) Supervisor.cpp

#============================================================
# Clean up compiled objects, backups, and the executable
#============================================================
clean:
	rm -f *.o *~ $(TARGET)
