From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 21/22] mtd: spi-nor: Update sr2_bit7_quad_enable()
Date: Tue, 24 Sep 2019 07:47:00 +0000
Message-ID: <20190924074533.6618-22-tudor.ambarus@microchip.com>
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

Rename the method to spi_nor_sr2_bit7_quad_enable(). Do the
read back test on all the eight bits of the Status Register,
not just the QE one.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 8fd1c04f75d9..a53e2cdc564c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2038,7 +2038,7 @@ static int spi_nor_sr2_bit1_quad_enable(struct spi_no=
r *nor)
 }
=20
 /**
- * sr2_bit7_quad_enable() - set QE bit in Status Register 2.
+ * spi_nor_sr2_bit7_quad_enable() - set QE bit in Status Register 2.
  * @nor:	pointer to a 'struct spi_nor'
  *
  * Set the Quad Enable (QE) bit in the Status Register 2.
@@ -2049,10 +2049,11 @@ static int spi_nor_sr2_bit1_quad_enable(struct spi_=
nor *nor)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int sr2_bit7_quad_enable(struct spi_nor *nor)
+static int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 {
 	u8 *sr2 =3D nor->bouncebuf;
 	int ret;
+	u8 sr2_written;
=20
 	/* Check current Quad Enable bit value. */
 	ret =3D spi_nor_read_sr2(nor, sr2);
@@ -2069,13 +2070,15 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor=
)
 	if (ret)
 		return ret;
=20
+	sr2_written =3D *sr2;
+
 	/* Read back and check it. */
 	ret =3D spi_nor_read_sr2(nor, sr2);
 	if (ret)
 		return ret;
=20
-	if (!(*sr2 & SR2_QUAD_EN_BIT7)) {
-		dev_err(nor->dev, "SR2 Quad bit not set\n");
+	if (*sr2 !=3D sr2_written) {
+		dev_err(nor->dev, "Read back test failed\n");
 		return -EIO;
 	}
=20
@@ -3649,7 +3652,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
=20
 	case BFPT_DWORD15_QER_SR2_BIT7:
 		nor->flags &=3D ~SNOR_F_HAS_16BIT_SR;
-		flash->quad_enable =3D sr2_bit7_quad_enable;
+		flash->quad_enable =3D spi_nor_sr2_bit7_quad_enable;
 		break;
=20
 	case BFPT_DWORD15_QER_SR2_BIT1:
--=20
2.9.5
