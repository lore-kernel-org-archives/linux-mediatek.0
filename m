From: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: [PATCH v2 4/5] mtd: rawnand: mtk: Fix wrongly assigned OOB buffer
 pointer issue
Date: Tue, 30 Apr 2019 18:02:49 +0800
Message-ID: <20190430100250.28083-5-xiaolei.li@mediatek.com>
References: <20190430100250.28083-1-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190430100250.28083-1-xiaolei.li@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: miquel.raynal@bootlin.com, richard@nod.at
Cc: linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com, linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

One main goal of the function mtk_nfc_update_ecc_stats is to check
whether sectors are all empty. If they are empty, set these sectors's
data buffer and OOB buffer as 0xff.

But now, the sector OOB buffer pointer is wrongly assigned. We always
do memset from sector 0.

To fix this issue, pass start sector number to make OOB buffer pointer
be properly assigned.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 23ebd668bbcd..48759af5c058 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -889,19 +889,21 @@ static int mtk_nfc_write_oob_std(struct nand_chip *chip, int page)
 	return mtk_nfc_write_page_raw(chip, NULL, 1, page);
 }
 
-static int mtk_nfc_update_ecc_stats(struct mtd_info *mtd, u8 *buf, u32 sectors)
+static int mtk_nfc_update_ecc_stats(struct mtd_info *mtd, u8 *buf, u32 start,
+				    u32 sectors)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
 	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
 	struct mtk_ecc_stats stats;
+	u32 reg_size = mtk_nand->fdm.reg_size;
 	int rc, i;
 
 	rc = nfi_readl(nfc, NFI_STA) & STA_EMP_PAGE;
 	if (rc) {
 		memset(buf, 0xff, sectors * chip->ecc.size);
 		for (i = 0; i < sectors; i++)
-			memset(oob_ptr(chip, i), 0xff, mtk_nand->fdm.reg_size);
+			memset(oob_ptr(chip, start + i), 0xff, reg_size);
 		return 0;
 	}
 
@@ -921,7 +923,7 @@ static int mtk_nfc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	u32 spare = mtk_nand->spare_per_sector;
 	u32 column, sectors, start, end, reg;
 	dma_addr_t addr;
-	int bitflips;
+	int bitflips = 0;
 	size_t len;
 	u8 *buf;
 	int rc;
@@ -988,14 +990,11 @@ static int mtk_nfc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	if (rc < 0) {
 		dev_err(nfc->dev, "subpage done timeout\n");
 		bitflips = -EIO;
-	} else {
-		bitflips = 0;
-		if (!raw) {
-			rc = mtk_ecc_wait_done(nfc->ecc, ECC_DECODE);
-			bitflips = rc < 0 ? -ETIMEDOUT :
-				mtk_nfc_update_ecc_stats(mtd, buf, sectors);
-			mtk_nfc_read_fdm(chip, start, sectors);
-		}
+	} else if (!raw) {
+		rc = mtk_ecc_wait_done(nfc->ecc, ECC_DECODE);
+		bitflips = rc < 0 ? -ETIMEDOUT :
+			mtk_nfc_update_ecc_stats(mtd, buf, start, sectors);
+		mtk_nfc_read_fdm(chip, start, sectors);
 	}
 
 	dma_unmap_single(nfc->dev, addr, len, DMA_FROM_DEVICE);
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
