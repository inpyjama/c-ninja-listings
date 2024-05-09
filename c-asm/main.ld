/*
 * Copyright 2023 inpyjama.com. All Rights Reserved.
 * Author: Piyush Itankar <piyush@inpyjama.com>
 */

MEMORY
{
  RAM : ORIGIN = 0x80000000, LENGTH = 4k
}

SECTIONS
{
.text : {
    *(.text*)
  } > RAM
}
