From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 15/22] mtd: spi-nor: Drop spansion_quad_enable()
Date: Tue, 24 Sep 2019 07:46:41 +0000
Message-ID: <20190924074533.6618-16-tudor.ambarus@microchip.com>
References: <20190924074533.6618-1-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190924074533.6618-1-tudor.ambarus@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: vigneshr@ti.com, boris.brezillon@collabora.com, marek.vasut@gmail.com, linux-mtd@lists.infradead.org, geert+renesas@glider.be, jonas@norrbonn.se
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at, joel@jms.id.au, andrew@aj.id.au, matthias.bgg@gmail.com, vz@mleia.com, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Tudor.Ambarus@microchip.com
List-Id: linux-mediatek@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Drop the default spansion_quad_enable() method and replace it with
spansion_read_cr_quad_enable().

The function was buggy, it didn't care about the previous values
of the Status and Configuration Registers. spansion_read_cr_quad_enable()
is a Read-Modify-Write-Check function that keeps track of what were
the previous values of the Status and Configuration Registers.

In terms of instruction types sent to the flash, the only difference
between the spansion_quad_enable() and spansion_read_cr_quad_enable()
is that the later calls spi_nor_read_sr(). We can safely assume that all
flashes support spi_nor_read_sr(), because all flashes call it in
spi_nor_sr_ready(). The transition from spansion_quad_enable() to
spansion_read_cr_quad_enable() will not affect anybody, drop the buggy
code.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 58 ++++-----------------------------------=
----
 1 file changed, 5 insertions(+), 53 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d971f5a4b11f..668afa9a8c87 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1869,54 +1869,6 @@ static int macronix_quad_enable(struct spi_nor *nor)
 }
=20
 /**
- * spansion_quad_enable() - set QE bit in Configuraiton Register.
- * @nor:	pointer to a 'struct spi_nor'
- *
- * Set the Quad Enable (QE) bit in the Configuration Register.
- * This function is kept for legacy purpose because it has been used for a
- * long time without anybody complaining but it should be considered as
- * deprecated and maybe buggy.
- * First, this function doesn't care about the previous values of the Stat=
us
- * and Configuration Registers when it sets the QE bit (bit 1) in the
- * Configuration Register: all other bits are cleared, which may have unwa=
nted
- * side effects like removing some block protections.
- * Secondly, it uses the Read Configuration Register (35h) instruction tho=
ugh
- * some very old and few memories don't support this instruction. If a pul=
l-up
- * resistor is present on the MISO/IO1 line, we might still be able to pas=
s the
- * "read back" test because the QSPI memory doesn't recognize the command,
- * so leaves the MISO/IO1 line state unchanged, hence spi_nor_read_cr(nor,=
 cr)
- * gets the 0xFF value.
- *
- * bit 1 of the Configuration Register is the QE bit for Spansion like QSP=
I
- * memories.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int spansion_quad_enable(struct spi_nor *nor)
-{
-	u8 *sr_cr =3D nor->bouncebuf;
-	int ret;
-
-	sr_cr[0] =3D 0;
-	sr_cr[1] =3D CR_QUAD_EN_SPAN;
-	ret =3D spi_nor_write_sr(nor, sr_cr, 2);
-	if (ret)
-		return ret;
-
-	/* read back and check it */
-	ret =3D spi_nor_read_cr(nor, &nor->bouncebuf[0]);
-	if (ret)
-		return ret;
-
-	if (!(nor->bouncebuf[0] & CR_QUAD_EN_SPAN)) {
-		dev_err(nor->dev, "Spansion Quad bit not set\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-/**
  * spansion_no_read_cr_quad_enable() - set QE bit in Configuration Registe=
r.
  * @nor:	pointer to a 'struct spi_nor'
  *
@@ -2071,9 +2023,9 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
  *
  * Read-modify-write function that clears the Block Protection bits from t=
he
  * Status Register without affecting other bits. The function is tightly
- * coupled with the spansion_quad_enable() function. Both assume that the =
Write
- * Register with 16 bits, together with the Read Configuration Register (3=
5h)
- * instructions are supported.
+ * coupled with the spansion_read_cr_quad_enable() function. Both assume t=
hat
+ * the Write Register with 16 bits, together with the Read Configuration
+ * Register (35h) instructions are supported.
  *
  * Return: 0 on success, -errno otherwise.
  */
@@ -4560,7 +4512,7 @@ static void spi_nor_info_init_flash_params(struct spi=
_nor *nor)
 	u8 i, erase_mask;
=20
 	/* Initialize legacy flash parameters and settings. */
-	flash->quad_enable =3D spansion_quad_enable;
+	flash->quad_enable =3D spansion_read_cr_quad_enable;
 	flash->set_4byte =3D spansion_set_4byte;
 	flash->setup =3D spi_nor_default_setup;
=20
@@ -4776,7 +4728,7 @@ static int spi_nor_init(struct spi_nor *nor)
 	int err;
=20
 	if (nor->clear_sr_bp) {
-		if (nor->flash.quad_enable =3D=3D spansion_quad_enable)
+		if (nor->flash.quad_enable =3D=3D spansion_read_cr_quad_enable)
 			nor->clear_sr_bp =3D spi_nor_spansion_clear_sr_bp;
=20
 		err =3D nor->clear_sr_bp(nor);
--=20
2.9.5
