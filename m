From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 07/32] mtd: rawnand: fsl_ifc: convert driver to nand_scan()
Date: Wed,  4 Jul 2018 00:00:04 +0200
Message-ID: <20180703220029.19565-8-miquel.raynal@bootlin.com>
References: <20180703220029.19565-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180703220029.19565-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wenyou Yang <wenyou.yang@microchip.com>, Josh Wu <rainyfeeling@outlook.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Xiaolei Li <xiaolei.li@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Marc Gonzalez <marc.w.gonzalez@f>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Two helpers have been added to the core to make ECC-related
configuration between the detection phase and the final NAND scan. Use
these hooks and convert the driver to just use nand_scan() instead of
both nand_scan_ident() and nand_scan_tail().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 382b67e97174..faefa186e9d3 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -714,9 +714,9 @@ static int fsl_ifc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	return nand_prog_page_end_op(chip);
 }
 
-static int fsl_ifc_chip_init_tail(struct mtd_info *mtd)
+static int fsl_ifc_attach_chip(struct nand_chip *chip)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
 
 	dev_dbg(priv->dev, "%s: nand->numchips = %d\n", __func__,
@@ -1046,15 +1046,8 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	if (ret)
 		goto err;
 
-	ret = nand_scan_ident(mtd, 1, NULL);
-	if (ret)
-		goto err;
-
-	ret = fsl_ifc_chip_init_tail(mtd);
-	if (ret)
-		goto err;
-
-	ret = nand_scan_tail(mtd);
+	priv->chip.controller->attach_chip = fsl_ifc_attach_chip;
+	ret = nand_scan(mtd, 1);
 	if (ret)
 		goto err;
 
-- 
2.14.1
