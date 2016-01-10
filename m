From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH V2 4/4] soc: mediatek: PMIC wrap: add support for MT7623/6323
Date: Sun, 10 Jan 2016 17:04:44 +0100
Message-ID: <1452441884-25882-4-git-send-email-blogic@openwrt.org>
References: <1452441884-25882-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1452441884-25882-1-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

MT6323 is yet another PMIC made by MTK. This version of the PMIC is used in
combination with MT7623.

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c |  176 +++++++++++++++++++++++++++++++++-
 1 file changed, 174 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index ceeac3a..556a531 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -52,6 +52,8 @@
 #define PWRAP_DEW_WRITE_TEST_VAL	0xa55a
 
 /* macro for manual command */
+#define PWRAP_MAN_CMD_SPI_WRITE_NEW	(1 << 14)
+#define PWRAP_MAN_CMD_PMIC_SEL_NEW	(1 << 13)
 #define PWRAP_MAN_CMD_SPI_WRITE		(1 << 13)
 #define PWRAP_MAN_CMD_OP_CSH		(0x0 << 8)
 #define PWRAP_MAN_CMD_OP_CSL		(0x1 << 8)
@@ -82,6 +84,12 @@ enum pwrap_dew_regs {
 	PWRAP_DEW_CIPHER_MODE,
 	PWRAP_DEW_CIPHER_SWRST,
 
+	/* MT6323 only regs */
+	PWRAP_DEW_CRC_SWRST,
+	PWRAP_DEW_CIPHER_EN,
+	PWRAP_DEW_RDDMY_NO,
+	PWRAP_DEW_RDATA_DLY_SEL,
+
 	/* MT8173 only regs */
 	PWRAP_DEW_CIPHER_IV0,
 	PWRAP_DEW_CIPHER_IV1,
@@ -91,6 +99,24 @@ enum pwrap_dew_regs {
 	PWRAP_DEW_CIPHER_IV5,
 };
 
+static int mt6323_dew_regs[] = {
+	[PWRAP_DEW_DIO_EN]		= 0xa,
+	[PWRAP_DEW_READ_TEST]		= 0xc,
+	[PWRAP_DEW_WRITE_TEST]		= 0xe,
+        [PWRAP_DEW_CRC_SWRST]		= 0x10,
+	[PWRAP_DEW_CRC_EN]		= 0x12,
+	[PWRAP_DEW_CRC_VAL]		= 0x14,
+	[PWRAP_DEW_MON_GRP_SEL]		= 0x16,
+	[PWRAP_DEW_CIPHER_KEY_SEL]	= 0x18,
+	[PWRAP_DEW_CIPHER_IV_SEL]	= 0x1a,
+	[PWRAP_DEW_CIPHER_EN]		= 0x1c,
+	[PWRAP_DEW_CIPHER_RDY]		= 0x1e,
+	[PWRAP_DEW_CIPHER_MODE]		= 0x20,
+	[PWRAP_DEW_CIPHER_SWRST]	= 0x22,
+	[PWRAP_DEW_RDDMY_NO]		= 0x24,
+	[PWRAP_DEW_RDATA_DLY_SEL]	= 0x26,
+};
+
 static int mt8135_dew_regs[] = {
 	[PWRAP_DEW_EVENT_OUT_EN]	= 0x0,
 	[PWRAP_DEW_DIO_EN]		= 0x2,
@@ -236,6 +262,103 @@ enum pwrap_regs {
 	PWRAP_DVFS_WDATA7,
 	PWRAP_SPMINF_STA,
 	PWRAP_CIPHER_EN,
+
+	/* MT7623 only regs */
+	PWRAP_OP_TYPE,
+	PWRAP_MSB_FIRST,
+	PWRAP_ADC_CMD_ADDR,
+	PWRAP_ADC_CMD,
+	PWRAP_ADC_RDY_ADDR,
+	PWRAP_ADC_RDATA_ADDR1,
+	PWRAP_ADC_RDATA_ADDR2,
+};
+
+static int mt7623_regs[] = {
+	[PWRAP_MUX_SEL] =		0x0,
+	[PWRAP_WRAP_EN] =		0x4,
+	[PWRAP_DIO_EN] =		0x8,
+	[PWRAP_SIDLY] =			0xc,
+	[PWRAP_OP_TYPE] =		0x10,
+	[PWRAP_MSB_FIRST] =		0x14,
+	[PWRAP_RDDMY] =			0x18,
+	[PWRAP_SI_CK_CON] =		0x1c,
+	[PWRAP_CSHEXT_WRITE] =		0x20,
+	[PWRAP_CSHEXT_READ] =		0x24,
+	[PWRAP_CSLEXT_START] =		0x28,
+	[PWRAP_CSLEXT_END] =		0x2c,
+	[PWRAP_STAUPD_PRD] =		0x30,
+	[PWRAP_STAUPD_GRPEN] =		0x34,
+	[PWRAP_STAUPD_MAN_TRIG] =	0x38,
+	[PWRAP_STAUPD_STA] =		0x3C,
+	[PWRAP_WRAP_STA] =		0x44,
+	[PWRAP_HARB_INIT] =		0x48,
+	[PWRAP_HARB_HPRIO] =		0x4c,
+	[PWRAP_HIPRIO_ARB_EN] =		0x50,
+	[PWRAP_HARB_STA0] =		0x54,
+	[PWRAP_HARB_STA1] =		0x58,
+	[PWRAP_MAN_EN] =		0x5c,
+	[PWRAP_MAN_CMD] =		0x60,
+	[PWRAP_MAN_RDATA] =		0x6c,
+	[PWRAP_MAN_VLDCLR] =		0x68,
+	[PWRAP_WACS0_EN] =		0x6c,
+	[PWRAP_INIT_DONE0] =		0x70,
+	[PWRAP_WACS0_CMD] =		0x74,
+	[PWRAP_WACS0_RDATA] =		0x78,
+	[PWRAP_WACS0_VLDCLR] =		0x7c,
+	[PWRAP_WACS1_EN] =		0x80,
+	[PWRAP_INIT_DONE1] =		0x84,
+	[PWRAP_WACS1_CMD] =		0x88,
+	[PWRAP_WACS1_RDATA] =		0x9c,
+	[PWRAP_WACS1_VLDCLR] =		0x90,
+	[PWRAP_WACS2_EN] =		0x94,
+	[PWRAP_INIT_DONE2] =		0x98,
+	[PWRAP_WACS2_CMD] =		0x9c,
+	[PWRAP_WACS2_RDATA] =		0xa0,
+	[PWRAP_WACS2_VLDCLR] =		0xa4,
+	[PWRAP_INT_EN] =		0xa8,
+	[PWRAP_INT_FLG_RAW] =		0xac,
+	[PWRAP_INT_FLG] =		0xb0,
+	[PWRAP_INT_CLR] =		0xb4,
+	[PWRAP_SIG_ADR] =		0xb8,
+	[PWRAP_SIG_MODE] =		0xbc,
+	[PWRAP_SIG_VALUE] =		0xc0,
+	[PWRAP_SIG_ERRVAL] =		0xc4,
+	[PWRAP_CRC_EN] =		0xc8,
+	[PWRAP_TIMER_EN] =		0xcc,
+	[PWRAP_TIMER_STA] =		0xd0,
+	[PWRAP_WDT_UNIT] =		0xd4,
+	[PWRAP_WDT_SRC_EN] =		0xd8,
+	[PWRAP_WDT_FLG] =		0xdc,
+	[PWRAP_DEBUG_INT_SEL] =		0xe0,
+	[PWRAP_DVFS_ADR0] =		0xe4,
+	[PWRAP_DVFS_WDATA0] =		0xe8,
+	[PWRAP_DVFS_ADR1] =		0xec,
+	[PWRAP_DVFS_WDATA1] =		0xf0,
+	[PWRAP_DVFS_ADR2] =		0xf4,
+	[PWRAP_DVFS_WDATA2] =		0xf8,
+	[PWRAP_DVFS_ADR3] =		0xfc,
+	[PWRAP_DVFS_WDATA3] =		0x100,
+	[PWRAP_DVFS_ADR4] =		0x104,
+	[PWRAP_DVFS_WDATA4] =		0x108,
+	[PWRAP_DVFS_ADR5] =		0x10c,
+	[PWRAP_DVFS_WDATA5] =		0x110,
+	[PWRAP_DVFS_ADR6] =		0x114,
+	[PWRAP_DVFS_WDATA6] =		0x118,
+	[PWRAP_DVFS_ADR7] =		0x11c,
+	[PWRAP_DVFS_WDATA7] =		0x120,
+	[PWRAP_CIPHER_KEY_SEL] =	0x124,
+	[PWRAP_CIPHER_IV_SEL] =		0x128,
+	[PWRAP_CIPHER_EN] =		0x12c,
+	[PWRAP_CIPHER_RDY] =		0x130,
+	[PWRAP_CIPHER_MODE] =		0x134,
+	[PWRAP_CIPHER_SWRST] =		0x138,
+	[PWRAP_DCM_EN] =		0x13c,
+	[PWRAP_DCM_DBC_PRD] =		0x140,
+	[PWRAP_ADC_CMD_ADDR] =		0x144,
+	[PWRAP_ADC_CMD] =		0x148,
+	[PWRAP_ADC_RDY_ADDR] =		0x14C,
+	[PWRAP_ADC_RDATA_ADDR1] =	0x150,
+	[PWRAP_ADC_RDATA_ADDR2] =	0x154,
 };
 
 static int mt8173_regs[] = {
@@ -394,6 +517,7 @@ static int mt8135_regs[] = {
 };
 
 enum pwrap_type {
+	PWRAP_MT7623,
 	PWRAP_MT8135,
 	PWRAP_MT8173,
 };
@@ -408,6 +532,17 @@ struct pmic_wrapper_type {
 	u32 man_cmd_spi_w;
 };
 
+static struct pmic_wrapper_type pwrap_mt7623 = {
+	.regs = mt7623_regs,
+	.dew_regs = mt6323_dew_regs,
+	.dew_base = 0x180,
+	.type = PWRAP_MT7623,
+	.arb_en_all = 0x1ff,
+	.int_en_all = BIT(31) | BIT(2),
+	.man_cmd_spi_w = PWRAP_MAN_CMD_SPI_WRITE_NEW |
+			 PWRAP_MAN_CMD_PMIC_SEL_NEW,
+};
+
 static struct pmic_wrapper_type pwrap_mt8135 = {
 	.regs = mt8135_regs,
 	.dew_regs = mt8135_dew_regs,
@@ -447,6 +582,11 @@ struct pmic_wrapper {
 	void __iomem *bridge_base;
 };
 
+static inline int pwrap_is_mt7623(struct pmic_wrapper *wrp)
+{
+	return wrp->type == PWRAP_MT7623;
+}
+
 static inline int pwrap_is_mt8135(struct pmic_wrapper *wrp)
 {
 	return wrp->type == PWRAP_MT8135;
@@ -642,6 +782,13 @@ static int pwrap_init_reg_clock(struct pmic_wrapper *wrp)
 		pwrap_writel(wrp, 0x4, PWRAP_CSHEXT_READ);
 		pwrap_writel(wrp, 0x0, PWRAP_CSLEXT_START);
 		pwrap_writel(wrp, 0x0, PWRAP_CSLEXT_END);
+	} else if (pwrap_is_mt7623(wrp)) {
+		pwrap_writel(wrp, 0x8, PWRAP_RDDMY);
+		pwrap_dew_write(wrp, 0x8, PWRAP_DEW_RDDMY_NO);
+		pwrap_writel(wrp, 0x5, PWRAP_CSHEXT_WRITE);
+		pwrap_writel(wrp, 0x0, PWRAP_CSHEXT_READ);
+		pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_START);
+		pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_END);
 	} else {
 		pwrap_writel(wrp, 0x0, PWRAP_CSHEXT_WRITE);
 		pwrap_writel(wrp, 0x4, PWRAP_CSHEXT_READ);
@@ -691,8 +838,12 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_SWRST, 0x0);
 	pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_KEY_SEL, 0x1);
 	pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_IV_SEL, 0x2);
-	pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_LOAD, 0x1);
-	pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_START, 0x1);
+	if (pwrap_is_mt7623(wrp)) {
+		pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_EN, 0x1);
+	} else {
+		pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_LOAD, 0x1);
+		pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_START, 0x1);
+	}
 
 	/* wait for cipher data ready@AP */
 	ret = pwrap_wait_for_state(wrp, pwrap_is_cipher_ready);
@@ -743,6 +894,14 @@ static int pwrap_init(struct pmic_wrapper *wrp)
 		/* Enable DCM */
 		pwrap_writel(wrp, 3, PWRAP_DCM_EN);
 		pwrap_writel(wrp, 0, PWRAP_DCM_DBC_PRD);
+	} else if (pwrap_is_mt7623(wrp)) {
+		/* Enable DCM */
+		pwrap_writel(wrp, 1, PWRAP_DCM_EN);
+		pwrap_writel(wrp, 0, PWRAP_DCM_DBC_PRD);
+
+		/* Setup SPI for MT6323 */
+		pwrap_writel(wrp, 0, PWRAP_OP_TYPE);
+		pwrap_writel(wrp, 1, PWRAP_MSB_FIRST);
 	}
 
 	/* Reset SPI slave */
@@ -756,6 +915,10 @@ static int pwrap_init(struct pmic_wrapper *wrp)
 
 	pwrap_writel(wrp, 1, PWRAP_WACS2_EN);
 
+	if (pwrap_is_mt7623(wrp))
+		/* MT6323 expects 0xf dummy cycles */
+		pwrap_writel(wrp, 0xf, PWRAP_RDDMY);
+
 	ret = pwrap_init_reg_clock(wrp);
 	if (ret)
 		return ret;
@@ -828,6 +991,12 @@ static int pwrap_init(struct pmic_wrapper *wrp)
 			dev_err(wrp->dev, "enable dewrap fail\n");
 			return -EFAULT;
 		}
+	} else if (pwrap_is_mt7623(wrp)) {
+		pwrap_writel(wrp, 0x076c, PWRAP_ADC_CMD_ADDR);
+		pwrap_writel(wrp, 0x8000, PWRAP_ADC_CMD);
+		pwrap_writel(wrp, 0x072c, PWRAP_ADC_RDY_ADDR);
+		pwrap_writel(wrp, 0x072e, PWRAP_ADC_RDATA_ADDR1);
+		pwrap_writel(wrp, 0x0730, PWRAP_ADC_RDATA_ADDR2);
 	} else {
 		/* PMIC_DEWRAP enables */
 		if (pwrap_write(wrp, PWRAP_DEW_EVENT_OUT_EN, 0x1) ||
@@ -875,6 +1044,9 @@ static const struct regmap_config pwrap_regmap_config = {
 
 static struct of_device_id of_pwrap_match_tbl[] = {
 	{
+		.compatible = "mediatek,mt7623-pwrap",
+		.data = &pwrap_mt7623,
+	}, {
 		.compatible = "mediatek,mt8135-pwrap",
 		.data = &pwrap_mt8135,
 	}, {
-- 
1.7.10.4
