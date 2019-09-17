From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH 18/23] mtd: spi-nor: Rework macronix_quad_enable()
Date: Tue, 17 Sep 2019 15:55:38 +0000
Message-ID: <20190917155426.7432-19-tudor.ambarus@microchip.com>
References: <20190917155426.7432-1-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917155426.7432-1-tudor.ambarus@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: vigneshr@ti.com, boris.brezillon@collabora.com, marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, joel@jms.id.au, andrew@aj.id.au, matthias.bgg@gmail.com, vz@mleia.com, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Tudor.Ambarus@microchip.com
List-Id: linux-mediatek@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Rename method to a generic name: spi_nor_sr1_bit6_quad_enable().

Use spi_nor_write_sr1_and_check(). Now we check the validity of all
the eight bits of the Status Register, not just of the SR1_QUAD_EN_BIT6.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 34 ++++++++++------------------------
 include/linux/mtd/spi-nor.h   |  2 +-
 2 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 4a513ed13807..2f79923e7db5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1938,16 +1938,15 @@ static int spi_nor_is_locked(struct mtd_info *mtd, =
loff_t ofs, uint64_t len)
 }
=20
 /**
- * macronix_quad_enable() - set QE bit in Status Register.
+ * spi_nor_sr1_bit6_quad_enable() - Set the Quad Enable BIT(6) in the Stat=
us
+ * Register 1.
  * @nor:	pointer to a 'struct spi_nor'
  *
- * Set the Quad Enable (QE) bit in the Status Register.
- *
- * bit 6 of the Status Register is the QE bit for Macronix like QSPI memor=
ies.
+ * Bit 6 of the Status Register 1 is the QE bit for Macronix like QSPI mem=
ories.
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int macronix_quad_enable(struct spi_nor *nor)
+static int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
 {
 	int ret;
=20
@@ -1955,25 +1954,12 @@ static int macronix_quad_enable(struct spi_nor *nor=
)
 	if (ret)
 		return ret;
=20
-	if (nor->bouncebuf[0] & SR_QUAD_EN_MX)
+	if (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)
 		return 0;
=20
-	nor->bouncebuf[0] |=3D SR_QUAD_EN_MX;
+	nor->bouncebuf[0] |=3D SR1_QUAD_EN_BIT6;
=20
-	ret =3D spi_nor_write_sr(nor, &nor->bouncebuf[0], 1);
-	if (ret)
-		return ret;
-
-	ret =3D spi_nor_read_sr(nor, &nor->bouncebuf[0]);
-	if (ret)
-		return ret;
-
-	if (!(nor->bouncebuf[0] & SR_QUAD_EN_MX)) {
-		dev_err(nor->dev, "Macronix Quad bit not set\n");
-		return -EIO;
-	}
-
-	return 0;
+	return spi_nor_write_sr1_and_check(nor, nor->bouncebuf[0], 0xFF);
 }
=20
 /**
@@ -2277,7 +2263,7 @@ static void gd25q256_default_init(struct spi_nor *nor=
)
 	 * indicate the quad_enable method for this case, we need
 	 * to set it in the default_init fixup hook.
 	 */
-	nor->flash.quad_enable =3D macronix_quad_enable;
+	nor->flash.quad_enable =3D spi_nor_sr1_bit6_quad_enable;
 }
=20
 static struct spi_nor_fixups gd25q256_fixups =3D {
@@ -3661,7 +3647,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
=20
 	case BFPT_DWORD15_QER_SR1_BIT6:
 		nor->flags &=3D ~SNOR_F_HAS_16BIT_SR;
-		flash->quad_enable =3D macronix_quad_enable;
+		flash->quad_enable =3D spi_nor_sr1_bit6_quad_enable;
 		break;
=20
 	case BFPT_DWORD15_QER_SR2_BIT7:
@@ -4558,7 +4544,7 @@ static int spi_nor_setup(struct spi_nor *nor,
=20
 static void macronix_set_default_init(struct spi_nor *nor)
 {
-	nor->flash.quad_enable =3D macronix_quad_enable;
+	nor->flash.quad_enable =3D spi_nor_sr1_bit6_quad_enable;
 	nor->flash.set_4byte =3D macronix_set_4byte;
 }
=20
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index fc3a8f5209f0..3a835de90b6a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -133,7 +133,7 @@
 #define SR_E_ERR		BIT(5)
 #define SR_P_ERR		BIT(6)
=20
-#define SR_QUAD_EN_MX		BIT(6)	/* Macronix Quad I/O */
+#define SR1_QUAD_EN_BIT6	BIT(6)
=20
 /* Enhanced Volatile Configuration Register bits */
 #define EVCR_QUAD_EN_MICRON	BIT(7)	/* Micron Quad I/O */
--=20
2.9.5
