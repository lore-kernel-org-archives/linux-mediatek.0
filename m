From: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: [PATCH 5/5] mtd: rawnand: mtk: Setup empty page threshold correctly
Date: Mon, 29 Apr 2019 14:38:34 +0800
Message-ID: <20190429063834.45967-6-xiaolei.li@mediatek.com>
References: <20190429063834.45967-1-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190429063834.45967-1-xiaolei.li@mediatek.com>
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

MTK NAND Controller has the ability to check whether read data are
mostly 0xff by comparing zero bit conut of read data with empty
threshold automatically.

But now we never set this threshold and always make it be default value
which is 10.

This patch fixes this problem by setting empty threshold as the product
of read sector count and ecc strength.

Fixes: 93db446a424c ("mtd: nand: move raw NAND related code to the raw/ subdir")
Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index cf5e50e704ae..675d4faa3480 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -94,6 +94,7 @@
 #define NFI_MASTER_STA		(0x224)
 #define		MASTER_STA_MASK		(0x0FFF)
 #define NFI_EMPTY_THRESH	(0x23C)
+#define		EMPTY_THRESH_MASK	GENMASK(7, 0)
 
 #define MTK_NAME		"mtk-nand"
 #define KB(x)			((x) * 1024UL)
@@ -931,6 +932,10 @@ static int mtk_nfc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 		return -EINVAL;
 	}
 
+	/* Setup empty threshold */
+	reg = max(sectors * chip->ecc.strength, EMPTY_THRESH_MASK);
+	nfi_writel(nfc, reg, NFI_EMPTY_THRESH);
+
 	reg = nfi_readw(nfc, NFI_CNFG);
 	reg |= CNFG_READ_EN | CNFG_DMA_BURST_EN | CNFG_AHB;
 	if (!raw) {
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
