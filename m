From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 08/22] mtd: spi-nor: Rework write_enable/disable()
Date: Tue, 24 Sep 2019 07:46:18 +0000
Message-ID: <20190924074533.6618-9-tudor.ambarus@microchip.com>
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

static int write_enable(struct spi_nor *nor)
static int write_disable(struct spi_nor *nor)
become
static int spi_nor_write_enable(struct spi_nor *nor)
static int spi_nor_write_disable(struct spi_nor *nor)

Check for errors after each call to them. Move them up in the
file as the first SPI NOR Register Operations, to avoid further
forward declarations.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 175 +++++++++++++++++++++++++++++---------=
----
 1 file changed, 120 insertions(+), 55 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 0fb124bd2e77..0aee068a5835 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -389,6 +389,64 @@ static ssize_t spi_nor_write_data(struct spi_nor *nor,=
 loff_t to, size_t len,
 }
=20
 /**
+ * spi_nor_write_enable() - Set write enable latch with Write Enable comma=
nd.
+ * @nor:        pointer to 'struct spi_nor'
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_write_enable(struct spi_nor *nor)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =3D
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREN, 1),
+				   SPI_MEM_OP_NO_ADDR,
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_NO_DATA);
+
+		ret =3D spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret =3D nor->controller_ops->write_reg(nor, SPINOR_OP_WREN,
+						     NULL, 0);
+	}
+
+	if (ret)
+		dev_err(nor->dev, "error %d on Write Enable\n", ret);
+
+	return ret;
+}
+
+/**
+ * spi_nor_write_disable() - Send Write Disable instruction to the chip.
+ * @nor:        pointer to 'struct spi_nor'
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_write_disable(struct spi_nor *nor)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =3D
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRDI, 1),
+				   SPI_MEM_OP_NO_ADDR,
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_NO_DATA);
+
+		ret =3D spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret =3D nor->controller_ops->write_reg(nor, SPINOR_OP_WRDI,
+						     NULL, 0);
+	}
+
+	if (ret)
+		dev_err(nor->dev, "error %d on Write Disable\n", ret);
+
+	return ret;
+}
+
+/**
  * spi_nor_read_sr() - Read the Status Register.
  * @nor:        pointer to 'struct spi_nor'
  * @sr:		buffer where the value of the Status Register will be written.
@@ -500,43 +558,6 @@ static int write_sr(struct spi_nor *nor, u8 val)
 					      nor->bouncebuf, 1);
 }
=20
-/*
- * Set write enable latch with Write Enable command.
- * Returns negative if error occurred.
- */
-static int write_enable(struct spi_nor *nor)
-{
-	if (nor->spimem) {
-		struct spi_mem_op op =3D
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREN, 1),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_NO_DATA);
-
-		return spi_mem_exec_op(nor->spimem, &op);
-	}
-
-	return nor->controller_ops->write_reg(nor, SPINOR_OP_WREN, NULL, 0);
-}
-
-/*
- * Send write disable instruction to the chip.
- */
-static int write_disable(struct spi_nor *nor)
-{
-	if (nor->spimem) {
-		struct spi_mem_op op =3D
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRDI, 1),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_NO_DATA);
-
-		return spi_mem_exec_op(nor->spimem, &op);
-	}
-
-	return nor->controller_ops->write_reg(nor, SPINOR_OP_WRDI, NULL, 0);
-}
-
 static struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 {
 	return mtd->priv;
@@ -645,9 +666,15 @@ static int st_micron_set_4byte(struct spi_nor *nor, bo=
ol enable)
 {
 	int ret;
=20
-	write_enable(nor);
+	ret =3D spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
 	ret =3D macronix_set_4byte(nor, enable);
-	write_disable(nor);
+	if (ret)
+		return ret;
+
+	ret =3D spi_nor_write_disable(nor);
=20
 	return ret;
 }
@@ -701,9 +728,15 @@ static int winbond_set_4byte(struct spi_nor *nor, bool=
 enable)
 	 * Register to be set to 1, so all 3-byte-address reads come from the
 	 * second 16M. We must clear the register to enable normal behavior.
 	 */
-	write_enable(nor);
+	ret =3D spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
 	ret =3D spi_nor_write_ear(nor, 0);
-	write_disable(nor);
+	if (ret)
+		return ret;
+
+	ret =3D spi_nor_write_disable(nor);
=20
 	return ret;
 }
@@ -1219,7 +1252,9 @@ static int spi_nor_erase_multi_sectors(struct spi_nor=
 *nor, u64 addr, u32 len)
 	list_for_each_entry_safe(cmd, next, &erase_list, list) {
 		nor->erase_opcode =3D cmd->opcode;
 		while (cmd->count) {
-			write_enable(nor);
+			ret =3D spi_nor_write_enable(nor);
+			if (ret)
+				goto destroy_erase_cmd_list;
=20
 			ret =3D spi_nor_erase_sector(nor, addr);
 			if (ret)
@@ -1274,7 +1309,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct=
 erase_info *instr)
 	if (len =3D=3D mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
 		unsigned long timeout;
=20
-		write_enable(nor);
+		ret =3D spi_nor_write_enable(nor);
+		if (ret)
+			goto erase_err;
=20
 		if (erase_chip(nor)) {
 			ret =3D -EIO;
@@ -1302,7 +1339,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct=
 erase_info *instr)
 	/* "sector"-at-a-time erase */
 	} else if (spi_nor_has_uniform_erase(nor)) {
 		while (len) {
-			write_enable(nor);
+			ret =3D spi_nor_write_enable(nor);
+			if (ret)
+				goto erase_err;
=20
 			ret =3D spi_nor_erase_sector(nor, addr);
 			if (ret)
@@ -1323,7 +1362,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct=
 erase_info *instr)
 			goto erase_err;
 	}
=20
-	write_disable(nor);
+	ret =3D spi_nor_write_disable(nor);
=20
 erase_err:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_ERASE);
@@ -1336,7 +1375,10 @@ static int write_sr_and_check(struct spi_nor *nor, u=
8 status_new, u8 mask)
 {
 	int ret;
=20
-	write_enable(nor);
+	ret =3D spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
 	ret =3D write_sr(nor, status_new);
 	if (ret)
 		return ret;
@@ -1681,7 +1723,9 @@ static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr=
)
 {
 	int ret;
=20
-	write_enable(nor);
+	ret =3D spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
=20
 	if (nor->spimem) {
 		struct spi_mem_op op =3D
@@ -1733,7 +1777,9 @@ static int macronix_quad_enable(struct spi_nor *nor)
 	if (nor->bouncebuf[0] & SR_QUAD_EN_MX)
 		return 0;
=20
-	write_enable(nor);
+	ret =3D spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
=20
 	write_sr(nor, nor->bouncebuf[0] | SR_QUAD_EN_MX);
=20
@@ -1936,7 +1982,9 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	/* Update the Quad Enable bit. */
 	*sr2 |=3D SR2_QUAD_EN_BIT7;
=20
-	write_enable(nor);
+	ret =3D spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
=20
 	ret =3D spi_nor_write_sr2(nor, sr2);
 	if (ret < 0) {
@@ -1978,7 +2026,9 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
 	if (ret)
 		return ret;
=20
-	write_enable(nor);
+	ret =3D spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
=20
 	ret =3D write_sr(nor, nor->bouncebuf[0] & ~mask);
 	if (ret) {
@@ -2601,7 +2651,9 @@ static int sst_write(struct mtd_info *mtd, loff_t to,=
 size_t len,
 	if (ret)
 		return ret;
=20
-	write_enable(nor);
+	ret =3D spi_nor_write_enable(nor);
+	if (ret)
+		goto unlock_and_unprep;
=20
 	nor->sst_write_second =3D false;
=20
@@ -2640,14 +2692,19 @@ static int sst_write(struct mtd_info *mtd, loff_t t=
o, size_t len,
 	}
 	nor->sst_write_second =3D false;
=20
-	write_disable(nor);
+	ret =3D spi_nor_write_disable(nor);
+	if (ret)
+		goto sst_write_err;
+
 	ret =3D spi_nor_wait_till_ready(nor);
 	if (ret)
 		goto sst_write_err;
=20
 	/* Write out trailing byte if it exists. */
 	if (actual !=3D len) {
-		write_enable(nor);
+		ret =3D spi_nor_write_enable(nor);
+		if (ret)
+			goto sst_write_err;
=20
 		nor->program_opcode =3D SPINOR_OP_BP;
 		ret =3D spi_nor_write_data(nor, to, 1, buf + actual);
@@ -2658,11 +2715,16 @@ static int sst_write(struct mtd_info *mtd, loff_t t=
o, size_t len,
 		ret =3D spi_nor_wait_till_ready(nor);
 		if (ret)
 			goto sst_write_err;
-		write_disable(nor);
+
+		ret =3D spi_nor_write_disable(nor);
+		if (ret)
+			goto sst_write_err;
+
 		actual +=3D 1;
 	}
 sst_write_err:
 	*retlen +=3D actual;
+unlock_and_unprep:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
 	return ret;
 }
@@ -2710,7 +2772,10 @@ static int spi_nor_write(struct mtd_info *mtd, loff_=
t to, size_t len,
=20
 		addr =3D spi_nor_convert_addr(nor, addr);
=20
-		write_enable(nor);
+		ret =3D spi_nor_write_enable(nor);
+		if (ret)
+			goto write_err;
+
 		ret =3D spi_nor_write_data(nor, addr, page_remain, buf + i);
 		if (ret < 0)
 			goto write_err;
--=20
2.9.5
