# Sorting-Fortran

A collection of quicksort implementations in Fortran 2003, demonstrating both recursive and iterative approaches with robust error handling and file I/O capabilities.

## Files Overview

### Core Modules
- **`StackADT.f03`** - Stack Abstract Data Type implementation for iterative quicksort
- **`intIO.f03`** - Input/Output module for reading unsorted data and writing sorted results
- **`iqsort.f03`** - Iterative quicksort implementation using stack-based approach
- **`rqsort.f03`** - Recursive quicksort implementation

### Documentation
- **`reflection Report.pdf`** - Detailed analysis and comparison of sorting algorithms

## Features

### Stack ADT (`StackADT.f03`)
- Dynamic memory allocation with configurable stack size (default: 1000 elements)
- Push/pop operations for storing partition boundaries
- Stack overflow/underflow protection
- Memory management utilities

### File I/O (`intIO.f03`)
- Robust file reading with error handling
- Dynamic array allocation based on file content
- Automatic output to `sortedNUM.txt`
- Input validation and error reporting

### Iterative Quicksort (`iqsort.f03`)
- Stack-based non-recursive implementation
- Bounds checking to prevent array access violations
- Memory-efficient partitioning strategy
- Handles edge cases and empty arrays

### Recursive Quicksort (`rqsort.f03`)
- Classic recursive implementation
- Efficient in-place sorting
- Median-of-three pivot selection
- Tail recursion optimization

## Usage

### Compilation
```bash
# Compile iterative quicksort
gfortran -o iqsort StackADT.f03 intIO.f03 iqsort.f03

# Compile recursive quicksort
gfortran -o rqsort intIO.f03 rqsort.f03
```

### Running the Programs
```bash
# Run iterative quicksort
./iqsort
# Enter filename when prompted

# Run recursive quicksort
./rqsort
# Enter filename when prompted
```

### Input Format
- Create a text file with integers, one per line
- The program will automatically detect the number of elements
- Example input file (`numbers.txt`):
```
42
17
89
3
56
```

### Output
- Sorted numbers are written to `sortedNUM.txt`
- One integer per line in ascending order

## Algorithm Comparison

| Feature | Iterative | Recursive |
|---------|-----------|-----------|
| **Memory Usage** | Stack-based (controlled) | System call stack |
| **Stack Overflow Risk** | Configurable protection | Dependent on input size |
| **Performance** | Consistent | Slight overhead from recursion |
| **Code Complexity** | More complex | Cleaner, more readable |

## Error Handling

- **File Not Found**: Graceful error message and program termination
- **Empty Files**: Validation and appropriate error reporting
- **Memory Issues**: Stack overflow protection and dynamic allocation
- **Invalid Input**: Robust parsing with error recovery

## Technical Details

- **Language**: Fortran 2003
- **Compilation**: GNU Fortran (gfortran)
- **Memory Management**: Dynamic allocation with proper cleanup
- **I/O**: Formatted file operations with error checking

## Author
Rajin Uddin

## License
Academic project - please refer to institutional guidelines for usage.