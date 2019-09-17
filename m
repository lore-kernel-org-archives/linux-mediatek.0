From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH 06/23] mtd: spi-nor: Rework read_fsr()
Date: Tue, 17 Sep 2019 15:55:00 +0000
Message-ID: <20190917155426.7432-7-tudor.ambarus@microchip.com>
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

static int read_fsr(struct spi_nor *nor)
becomes
static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)

The new function returns 0 on success and -errno otherwise.
We let the callers pass the pointer to the buffer where the
value of the Flag Status Register will be written. This way
we avoid the casts between int and u8, which can be confusing.

Prepend spi_nor_ to the function name, all functions should begin
with that.

S/pr_err/dev_err and drop duplicated dev_err in callers, in case the
function returns error.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 42 ++++++++++++++++++++++-----------------=
---
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a23783641146..8cd1cadcb8b1 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -417,12 +417,15 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *s=
r)
 	return ret;
 }
=20
-/*
- * Read the flag status register, returning its value in the location
- * Return the status register value.
- * Returns negative if error occurred.
+/**
+ * spi_nor_read_fsr() - Read the Flag Status Register.
+ * @nor:	pointer to 'struct spi_nor'
+ * @fsr:	buffer where the value of the Flag Status Register will be
+ *		written.
+ *
+ * Return: 0 on success, -errno otherwise.
  */
-static int read_fsr(struct spi_nor *nor)
+static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 {
 	int ret;
=20
@@ -431,20 +434,18 @@ static int read_fsr(struct spi_nor *nor)
 			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDFSR, 1),
 				   SPI_MEM_OP_NO_ADDR,
 				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
+				   SPI_MEM_OP_DATA_IN(1, fsr, 1));
=20
 		ret =3D spi_mem_exec_op(nor->spimem, &op);
 	} else {
 		ret =3D nor->controller_ops->read_reg(nor, SPINOR_OP_RDFSR,
-						    nor->bouncebuf, 1);
+						    fsr, 1);
 	}
=20
-	if (ret < 0) {
-		pr_err("error %d reading FSR\n", ret);
-		return ret;
-	}
+	if (ret)
+		dev_err(nor->dev, "error %d reading FSR\n", ret);
=20
-	return nor->bouncebuf[0];
+	return ret;
 }
=20
 /*
@@ -787,25 +788,26 @@ static int spi_nor_clear_fsr(struct spi_nor *nor)
=20
 static int spi_nor_fsr_ready(struct spi_nor *nor)
 {
-	int fsr =3D read_fsr(nor);
-	if (fsr < 0)
-		return fsr;
+	int ret =3D spi_nor_read_fsr(nor, &nor->bouncebuf[0]);
+
+	if (ret)
+		return ret;
=20
-	if (fsr & (FSR_E_ERR | FSR_P_ERR)) {
-		if (fsr & FSR_E_ERR)
+	if (nor->bouncebuf[0] & (FSR_E_ERR | FSR_P_ERR)) {
+		if (nor->bouncebuf[0] & FSR_E_ERR)
 			dev_err(nor->dev, "Erase operation failed.\n");
 		else
 			dev_err(nor->dev, "Program operation failed.\n");
=20
-		if (fsr & FSR_PT_ERR)
+		if (nor->bouncebuf[0] & FSR_PT_ERR)
 			dev_err(nor->dev,
-			"Attempted to modify a protected sector.\n");
+				"Attempted to modify a protected sector.\n");
=20
 		spi_nor_clear_fsr(nor);
 		return -EIO;
 	}
=20
-	return fsr & FSR_READY;
+	return nor->bouncebuf[0] & FSR_READY;
 }
=20
 static int spi_nor_ready(struct spi_nor *nor)
--=20
2.9.5
