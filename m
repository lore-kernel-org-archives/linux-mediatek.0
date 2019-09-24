From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 00/22] mtd: spi-nor: Quad Enable and (un)lock methods
Date: Tue, 24 Sep 2019 07:45:45 +0000
Message-ID: <20190924074533.6618-1-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: vigneshr@ti.com, boris.brezillon@collabora.com, marek.vasut@gmail.com, linux-mtd@lists.infradead.org, geert+renesas@glider.be, jonas@norrbonn.se
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at, joel@jms.id.au, andrew@aj.id.au, matthias.bgg@gmail.com, vz@mleia.com, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Tudor.Ambarus@microchip.com
List-Id: linux-mediatek@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Patches 1 - 14 are just clean up patches for the Flash Register
Operations.

Patches 15 - 22 deal with the Quad Enable and the (un)lock methods.
Fixed the clearing of QE bit on (un)lock() operations. Reworked the
Quad Enable methods and the disabling of the block write protection
at power-up.

Again, this is just compile tested, I don't have (yet) a relevant
spansion-like flash memory to test the (un)lock() methods, so I'll need
your help for testing this patch set.

The patch set can be tested using mtd-utils:
1/ do a read-erase-write-read-back test immediately after boot, to check
the spi_nor_unlock_all() method. The focus is on the erase/write
methods, we want to see if the flash is unlocked at power-up.
        mtd_debug read /dev/mtd-yours offset size read-file
        hexdump read-file
        mtd_debug erase /dev/mtd-yours offset size
        dd if=3D/dev/urandom of=3Dwrite-file bs=3Dplease-choose count=3Dple=
ase-choose
        mtd_debug write /dev/mtd-yours offset write-file-size write-file
        mtd_debug read /dev/mtd-yours offset write-file-size read-file
        sha1sum read-file write-file
2/ lock flash then try to erase/write it, to see if the lock works
        flash_lock /dev/mtd-yours offset block-count
        Do the read-erase-write-read-back test from 1/. The contents of
        flash should not change in the erase and write steps.
3/ unlock flash and do the read-erase-write-read-back from 1/. The value of=
 the
   QEE should not change and you should be able to erase and write the flas=
h.
   Test 1/ should be successful.

v2:
- Introduce spi_nor_write_16bit_cr_and_check() as per Vignesh's suggestion.=
 The
  Configuration Register contains bits that can be updated in future: FREEZ=
E,
  CMP. Provide a generic method that allows updating all bits of the
  Configuration Register.
- Fix SNOR_F_NO_READ_CR case in
  "mtd: spi-nor: Rework the disabling of block write protection". When the =
flash
  doesn't support the CR Read command, we make an assumption about the valu=
e of
  the QE bit. In spi_nor_init(), call spi_nor_quad_enable() first, then
  spi_nor_unlock_all(), so that at the spi_nor_unlock_all() time we can be =
sure
  the QE bit has value one, because of the previous call to spi_nor_quad_en=
able().
- Fix if statement in spi_nor_write_sr_and_check():
  if (nor->flags & SNOR_F_HAS_16BIT_SR)
- Fix documentation warnings.
- New patch: "mtd: spi-nor: Check all the bits written, not just the BP one=
s".
- Drop Global Unlock patches, will send them in a different patch set.

Tudor Ambarus (22):
  mtd: spi-nor: hisi-sfc: Drop nor->erase NULL assignment
  mtd: spi-nor: Introduce 'struct spi_nor_controller_ops'
  mtd: spi-nor: cadence-quadspi: Fix cqspi_command_read() definition
  mtd: spi-nor: Rename nor->params to nor->flash
  mtd: spi-nor: Rework read_sr()
  mtd: spi-nor: Rework read_fsr()
  mtd: spi-nor: Rework read_cr()
  mtd: spi-nor: Rework write_enable/disable()
  mtd: spi-nor: Fix retlen handling in sst_write()
  mtd: spi-nor: Rework write_sr()
  mtd: spi-nor: Rework spi_nor_read/write_sr2()
  mtd: spi-nor: Report error in spi_nor_xread_sr()
  mtd: spi-nor: Void return type for spi_nor_clear_sr/fsr()
  mtd: spi-nor: Drop duplicated new line
  mtd: spi-nor: Drop spansion_quad_enable()
  mtd: spi-nor: Fix errno on quad_enable methods
  mtd: spi-nor: Check all the bits written, not just the BP ones
  mtd: spi-nor: Fix clearing of QE bit on lock()/unlock()
  mtd: spi-nor: Rework macronix_quad_enable()
  mtd: spi-nor: Rework spansion(_no)_read_cr_quad_enable()
  mtd: spi-nor: Update sr2_bit7_quad_enable()
  mtd: spi-nor: Rework the disabling of block write protection

 drivers/mtd/spi-nor/aspeed-smc.c      |   23 +-
 drivers/mtd/spi-nor/cadence-quadspi.c |   54 +-
 drivers/mtd/spi-nor/hisi-sfc.c        |   23 +-
 drivers/mtd/spi-nor/intel-spi.c       |   24 +-
 drivers/mtd/spi-nor/mtk-quadspi.c     |   25 +-
 drivers/mtd/spi-nor/nxp-spifi.c       |   23 +-
 drivers/mtd/spi-nor/spi-nor.c         | 1716 ++++++++++++++++++-----------=
----
 include/linux/mtd/spi-nor.h           |   74 +-
 8 files changed, 1058 insertions(+), 904 deletions(-)

--=20
2.9.5
