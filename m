From: RogerCC Lin <rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 2/2] mtd: nand: fix chances to create incomplete ECC data
 when writing
Date: Mon, 19 Sep 2016 10:53:26 +0800
Message-ID: <1474253606-9965-3-git-send-email-rogercc.lin@mediatek.com>
References: <1474253606-9965-1-git-send-email-rogercc.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1474253606-9965-1-git-send-email-rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, steven.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: RogerCC Lin <rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

When mtk_nfc_do_write_page() comparing the sector number,because the
sector number field is at the 12th-bit position of NFI_BYTELEN
register,the masked register should be shifted 12 bits before being
compared.The result of this bug may cause the second subpage has
incomplete ECC parity bytes.

Signed-off-by: RogerCC Lin <rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Acked-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/nand/mtk_nand.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
index ddaa2ac..5223a21 100644
--- a/drivers/mtd/nand/mtk_nand.c
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -93,6 +93,9 @@
 #define		NFI_FSM_MASK		(0xf << 16)
 #define NFI_ADDRCNTR		(0x70)
 #define		CNTR_MASK		GENMASK(16, 12)
+#define		ADDRCNTR_SEC_SHIFT	(12)
+#define		ADDRCNTR_SEC(val) \
+		(((val) & CNTR_MASK) >> ADDRCNTR_SEC_SHIFT)
 #define NFI_STRADDR		(0x80)
 #define NFI_BYTELEN		(0x84)
 #define NFI_CSEL		(0x90)
@@ -699,7 +702,7 @@ static int mtk_nfc_do_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	ret = readl_poll_timeout_atomic(nfc->regs + NFI_ADDRCNTR, reg,
-					(reg & CNTR_MASK) >= chip->ecc.steps,
+					ADDRCNTR_SEC(reg) >= chip->ecc.steps,
 					10, MTK_TIMEOUT);
 	if (ret)
 		dev_err(dev, "hwecc write timeout\n");
@@ -902,7 +905,7 @@ static int mtk_nfc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 		dev_warn(nfc->dev, "read ahb/dma done timeout\n");
 
 	rc = readl_poll_timeout_atomic(nfc->regs + NFI_BYTELEN, reg,
-				       (reg & CNTR_MASK) >= sectors, 10,
+				       ADDRCNTR_SEC(reg) >= sectors, 10,
 				       MTK_TIMEOUT);
 	if (rc < 0) {
 		dev_err(nfc->dev, "subpage done timeout\n");
-- 
1.7.0.4
