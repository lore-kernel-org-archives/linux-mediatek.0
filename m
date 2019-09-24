From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 03/22] mtd: spi-nor: cadence-quadspi: Fix
 cqspi_command_read() definition
Date: Tue, 24 Sep 2019 07:45:58 +0000
Message-ID: <20190924074533.6618-4-tudor.ambarus@microchip.com>
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

n_tx was never used, drop it. Replace 'const u8 *txbuf' with 'u8 opcode',
to comply with the SPI NOR int (*read_reg)() method. The 'const'
qualifier has no meaning for parameters passed by value, drop it.
Going furher, the opcode was passed to cqspi_calc_rdreg() and never used,
drop it.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/ca=
dence-quadspi.c
index ebda612641a4..22008fecd326 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -285,7 +285,7 @@ static irqreturn_t cqspi_irq_handler(int this_irq, void=
 *dev)
 	return IRQ_HANDLED;
 }
=20
-static unsigned int cqspi_calc_rdreg(struct spi_nor *nor, const u8 opcode)
+static unsigned int cqspi_calc_rdreg(struct spi_nor *nor)
 {
 	struct cqspi_flash_pdata *f_pdata =3D nor->priv;
 	u32 rdreg =3D 0;
@@ -354,8 +354,7 @@ static int cqspi_exec_flash_cmd(struct cqspi_st *cqspi,=
 unsigned int reg)
 	return cqspi_wait_idle(cqspi);
 }
=20
-static int cqspi_command_read(struct spi_nor *nor,
-			      const u8 *txbuf, const unsigned n_tx,
+static int cqspi_command_read(struct spi_nor *nor, u8 opcode,
 			      u8 *rxbuf, size_t n_rx)
 {
 	struct cqspi_flash_pdata *f_pdata =3D nor->priv;
@@ -373,9 +372,9 @@ static int cqspi_command_read(struct spi_nor *nor,
 		return -EINVAL;
 	}
=20
-	reg =3D txbuf[0] << CQSPI_REG_CMDCTRL_OPCODE_LSB;
+	reg =3D opcode << CQSPI_REG_CMDCTRL_OPCODE_LSB;
=20
-	rdreg =3D cqspi_calc_rdreg(nor, txbuf[0]);
+	rdreg =3D cqspi_calc_rdreg(nor);
 	writel(rdreg, reg_base + CQSPI_REG_RD_INSTR);
=20
 	reg |=3D (0x1 << CQSPI_REG_CMDCTRL_RD_EN_LSB);
@@ -471,7 +470,7 @@ static int cqspi_read_setup(struct spi_nor *nor)
 	unsigned int reg;
=20
 	reg =3D nor->read_opcode << CQSPI_REG_RD_INSTR_OPCODE_LSB;
-	reg |=3D cqspi_calc_rdreg(nor, nor->read_opcode);
+	reg |=3D cqspi_calc_rdreg(nor);
=20
 	/* Setup dummy clock cycles */
 	dummy_clk =3D nor->read_dummy;
@@ -604,7 +603,7 @@ static int cqspi_write_setup(struct spi_nor *nor)
 	/* Set opcode. */
 	reg =3D nor->program_opcode << CQSPI_REG_WR_INSTR_OPCODE_LSB;
 	writel(reg, reg_base + CQSPI_REG_WR_INSTR);
-	reg =3D cqspi_calc_rdreg(nor, nor->program_opcode);
+	reg =3D cqspi_calc_rdreg(nor);
 	writel(reg, reg_base + CQSPI_REG_RD_INSTR);
=20
 	reg =3D readl(reg_base + CQSPI_REG_SIZE);
@@ -1087,7 +1086,7 @@ static int cqspi_read_reg(struct spi_nor *nor, u8 opc=
ode, u8 *buf, size_t len)
=20
 	ret =3D cqspi_set_protocol(nor, 0);
 	if (!ret)
-		ret =3D cqspi_command_read(nor, &opcode, 1, buf, len);
+		ret =3D cqspi_command_read(nor, opcode, buf, len);
=20
 	return ret;
 }
--=20
2.9.5
