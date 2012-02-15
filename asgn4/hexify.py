#!/usr/bin/env python2

# Imports and Constants
import sys

# Use the stdout.write function for proper printing
write = sys.stdout.write

# Function Definitions

def hexifyPy(filename, C=False):
        """
        This function takes a filename and prints to stdout
        a hex-escaped string variable declaration ready for
        inclusion in a Python or C program depending on the
        value of its second parameter.
        """

        # Get the hex bytes in an easy-to-use string form
        with open(filename, 'rb') as f:
             byteStr = f.read()

        # This trick was taken from ActiveState:
        # http://code.activestate.com/recipes/510399-byte-to-hex-and-hex-to-byte-string-conversion/
        shellcode = ''.join(["%02X" % ord(x) for x in byteStr]).strip()

        # Set up a loop count for formatting the output
        loopCnt = 0
        # Show shellcode as a variable
        if not C:
                write('shellcode = \\\n')
        else:
                write('char shellcode[] = \n')

        # Loop through the shell code a byte at a time
        for idx in range(2, len(shellcode)+1, 2):
                if ((loopCnt % 16) == 0):
                        write('\t\"')

                # Always write some bytes to the screen
                write('\\x' + shellcode[idx-2 : idx])

                if (((loopCnt + 1) % 16) == 0):
                        if ((loopCnt * 2) != (len(shellcode) - 1)):
                                if not C:
                                        write('\" .\n')
                                else:
                                        write('\"\n')

                loopCnt += 1

        if not C:
                write('\"\n')
        else:
                write('\";\n')

def parseCmdLine(args):
        """
        This function checks if the -c option
        was passed on the command line, which
        will print a char array instead of the
        default which is a Python string variable.
        """
        if len(args) == 1:
                hexifyPy(args[0])
        elif args != [] and args[0] == '-c':
                hexifyPy(args[1], C=True)
        else:
                print("Usage:\n\t-c filename: shellcode for c" + \
                        "\n\t   filename: shellcode for python\n")

# Main
if __name__ == '__main__':
        parseCmdLine(sys.argv[1:])
