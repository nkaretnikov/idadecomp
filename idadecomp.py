import idaapi
import idc

def main():
    tty = idc.ARGV[1]
    ea = int(idc.ARGV[2], 16)  # function address

    idaapi.load_plugin('hexrays')  # need to load the decompiler first
    idaapi.load_plugin('hexx64')

    f = idaapi.get_func(ea)
    fdec = idaapi.decompile(f)

    # Print to stdout instead of the Output window.
    with open(tty, 'w') as fh:
        fh.write("{}\n".format(fdec))

    idc.Exit(0)

if __name__ == "__main__":
    main()
