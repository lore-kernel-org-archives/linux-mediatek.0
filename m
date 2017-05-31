From: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 4/4] mtd: nand: mediatek: add support for MT2712 NAND FLASH
 Controller
Date: Wed, 31 May 2017 16:26:41 +0800
Message-ID: <1496219201-45414-5-git-send-email-xiaolei.li@mediatek.com>
References: <1496219201-45414-1-git-send-email-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1496219201-45414-1-git-send-email-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

MT2712 NAND FLASH Controller is similar to MT2701 except those following:
(1) MT2712 supports up to 148B spare size per 1KB size sector (the same
    with 74B spare size per 512B size sector). There are three new spare
    format: 61, 67, 74.
(2) MT2712 supports up to 80 bit ecc strength. There are three new ecc
    strength level: 68, 72, 80.
(3) MT2712 ECC encode parity data register's start offset is 0x300, and
    different with 0x10 of MT2701.
(4) MT2712 improves ecc irq function. When ECC works in ECC_NFI_MODE,
    MT2701 will generate ecc irq number the same with ecc steps during
    page read. However, MT2712 can only generate one ecc irq.

Changes of this patch are:
(1) add two new variables named pg_irq_sel, encode_parity_reg0 in struct
    mtk_ecc_caps.
(2) add new bitfield ECC_PG_IRQ_SEL for register ECC_IRQ_REG.
(3) add ecc strength array of mt2712.
(4) add spare size array of mt2712.
(5) add mt2712 nfc and ecc device compatiable and data.

Signed-off-by: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/mtd/nand/mtk_ecc.c  | 39 +++++++++++++++++++++++++++++++++++----
 drivers/mtd/nand/mtk_nand.c | 14 ++++++++++++++
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
index ae51303..4958121 100644
--- a/drivers/mtd/nand/mtk_ecc.c
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -28,6 +28,7 @@
 
 #define ECC_IDLE_MASK		BIT(0)
 #define ECC_IRQ_EN		BIT(0)
+#define ECC_PG_IRQ_SEL		BIT(1)
 #define ECC_OP_ENABLE		(1)
 #define ECC_OP_DISABLE		(0)
 
@@ -37,7 +38,6 @@
 #define		ECC_MS_SHIFT		(16)
 #define ECC_ENCDIADDR		(0x08)
 #define ECC_ENCIDLE		(0x0C)
-#define ECC_ENCPAR(x)		(0x10 + (x) * sizeof(u32))
 #define ECC_ENCIRQ_EN		(0x80)
 #define ECC_ENCIRQ_STA		(0x84)
 #define ECC_DECCON		(0x100)
@@ -61,6 +61,8 @@ struct mtk_ecc_caps {
 	u32 err_mask;
 	const u8 *ecc_strength;
 	u8 num_ecc_strength;
+	u32 encode_parity_reg0;
+	int pg_irq_sel;
 };
 
 struct mtk_ecc {
@@ -76,12 +78,17 @@ struct mtk_ecc {
 	u8 *eccdata;
 };
 
-/* ecc strength that mt2701 supports */
+/* ecc strength that each IP supports */
 static const u8 ecc_strength_mt2701[] = {
 	4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36,
 	40, 44, 48, 52, 56, 60
 };
 
+static const u8 ecc_strength_mt2712[] = {
+	4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36,
+	40, 44, 48, 52, 56, 60, 68, 72, 80
+};
+
 static inline void mtk_ecc_wait_idle(struct mtk_ecc *ecc,
 				     enum mtk_ecc_operation op)
 {
@@ -254,6 +261,7 @@ struct mtk_ecc *of_mtk_ecc_get(struct device_node *of_node)
 int mtk_ecc_enable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
 {
 	enum mtk_ecc_operation op = config->op;
+	u16 reg_val;
 	int ret;
 
 	ret = mutex_lock_interruptible(&ecc->lock);
@@ -271,7 +279,15 @@ int mtk_ecc_enable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
 	writew(ECC_OP_ENABLE, ecc->regs + ECC_CTL_REG(op));
 
 	init_completion(&ecc->done);
-	writew(ECC_IRQ_EN, ecc->regs + ECC_IRQ_REG(op));
+	reg_val = ECC_IRQ_EN;
+	/*
+	 * For ECC_NFI_MODE, if ecc->caps->pg_irq_sel is 1, then it
+	 * means this chip can only generate one ecc irq during page
+	 * read / write. If is 0, generate one ecc irq each ecc step.
+	 */
+	if ((ecc->caps->pg_irq_sel) && (config->mode == ECC_NFI_MODE))
+		reg_val |= ECC_PG_IRQ_SEL;
+	writew(reg_val, ecc->regs + ECC_IRQ_REG(op));
 
 	return 0;
 }
@@ -341,7 +357,9 @@ int mtk_ecc_encode(struct mtk_ecc *ecc, struct mtk_ecc_config *config,
 	len = (config->strength * ECC_PARITY_BITS + 7) >> 3;
 
 	/* write the parity bytes generated by the ECC back to temp buffer */
-	__ioread32_copy(ecc->eccdata, ecc->regs + ECC_ENCPAR(0), round_up(len, 4));
+	__ioread32_copy(ecc->eccdata,
+			ecc->regs + ecc->caps->encode_parity_reg0,
+			round_up(len, 4));
 
 	/* copy into possibly unaligned OOB region with actual length */
 	memcpy(data + bytes, ecc->eccdata, len);
@@ -377,12 +395,25 @@ void mtk_ecc_adjust_strength(struct mtk_ecc *ecc, u32 *p)
 	.err_mask = 0x3f,
 	.ecc_strength = ecc_strength_mt2701,
 	.num_ecc_strength = 20,
+	.encode_parity_reg0 = 0x10,
+	.pg_irq_sel = 0,
+};
+
+static const struct mtk_ecc_caps mtk_ecc_caps_mt2712 = {
+	.err_mask = 0x7f,
+	.ecc_strength = ecc_strength_mt2712,
+	.num_ecc_strength = 23,
+	.encode_parity_reg0 = 0x300,
+	.pg_irq_sel = 1,
 };
 
 static const struct of_device_id mtk_ecc_dt_match[] = {
 	{
 		.compatible = "mediatek,mt2701-ecc",
 		.data = &mtk_ecc_caps_mt2701,
+	}, {
+		.compatible = "mediatek,mt2712-ecc",
+		.data = &mtk_ecc_caps_mt2712,
 	},
 	{},
 };
diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
index e428669..4d9ee27 100644
--- a/drivers/mtd/nand/mtk_nand.c
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -164,6 +164,11 @@ struct mtk_nfc {
 	16, 26, 27, 28, 32, 36, 40, 44,	48, 49, 50, 51, 52, 62, 63, 64
 };
 
+static const u8 spare_size_mt2712[] = {
+	16, 26, 27, 28, 32, 36, 40, 44, 48, 49, 50, 51, 52, 62, 61, 63, 64, 67,
+	74
+};
+
 static inline struct mtk_nfc_nand_chip *to_mtk_nand(struct nand_chip *nand)
 {
 	return container_of(nand, struct mtk_nfc_nand_chip, nand);
@@ -1327,10 +1332,19 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
 	.pageformat_spare_shift = 4,
 };
 
+static const struct mtk_nfc_caps mtk_nfc_caps_mt2712 = {
+	.spare_size = spare_size_mt2712,
+	.num_spare_size = 19,
+	.pageformat_spare_shift = 16,
+};
+
 static const struct of_device_id mtk_nfc_id_table[] = {
 	{
 		.compatible = "mediatek,mt2701-nfc",
 		.data = &mtk_nfc_caps_mt2701,
+	}, {
+		.compatible = "mediatek,mt2712-nfc",
+		.data = &mtk_nfc_caps_mt2712,
 	},
 	{}
 };
-- 
1.9.1
