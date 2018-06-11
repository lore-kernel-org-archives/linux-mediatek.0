From: <argus.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH V5 3/4] soc: mediatek: pwrap: add pwrap driver for mt6797 SoCs
Date: Mon, 11 Jun 2018 18:49:59 +0800
Message-ID: <1528714200-2500-4-git-send-email-argus.lin@mediatek.com>
References: <1528714200-2500-1-git-send-email-argus.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1528714200-2500-1-git-send-email-argus.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: argus.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Argus Lin <argus.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

mt6797 is a highly integrated SoCs, it uses mt6351 for power management.
This patch adds pwrap driver to access mt6351. Pwrap of mt6797 support
dynamic priority meichanism, sequence monitor and starvation mechanism
to make transaction more reliable.

A big change from V4 to V5 is we remove INT1 interrupt declaration since
it is only for debug purpose. The PWRAP_RDDMY, RESET and DCM can use legacy
setting, it is backwards compatible. The new caps flag declaration is not
needed, just remove it.

Signed-off-by: Argus Lin <argus.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 9a01e30..d03e2d4 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -366,6 +366,39 @@ enum pwrap_regs {
 	[PWRAP_ADC_RDATA_ADDR2] =	0x154,
 };
 
+static int mt6797_regs[] = {
+	[PWRAP_MUX_SEL] =		0x0,
+	[PWRAP_WRAP_EN] =		0x4,
+	[PWRAP_DIO_EN] =		0x8,
+	[PWRAP_SIDLY] =			0xC,
+	[PWRAP_RDDMY] =			0x10,
+	[PWRAP_CSHEXT_WRITE] =		0x18,
+	[PWRAP_CSHEXT_READ] =		0x1C,
+	[PWRAP_CSLEXT_START] =		0x20,
+	[PWRAP_CSLEXT_END] =		0x24,
+	[PWRAP_STAUPD_PRD] =		0x28,
+	[PWRAP_HARB_HPRIO] =		0x50,
+	[PWRAP_HIPRIO_ARB_EN] =		0x54,
+	[PWRAP_MAN_EN] =		0x60,
+	[PWRAP_MAN_CMD] =		0x64,
+	[PWRAP_WACS0_EN] =		0x70,
+	[PWRAP_WACS1_EN] =		0x84,
+	[PWRAP_WACS2_EN] =		0x98,
+	[PWRAP_INIT_DONE2] =		0x9C,
+	[PWRAP_WACS2_CMD] =		0xA0,
+	[PWRAP_WACS2_RDATA] =		0xA4,
+	[PWRAP_WACS2_VLDCLR] =		0xA8,
+	[PWRAP_INT_EN] =		0xC0,
+	[PWRAP_INT_FLG_RAW] =		0xC4,
+	[PWRAP_INT_FLG] =		0xC8,
+	[PWRAP_INT_CLR] =		0xCC,
+	[PWRAP_TIMER_EN] =		0xF4,
+	[PWRAP_WDT_UNIT] =		0xFC,
+	[PWRAP_WDT_SRC_EN] =		0x100,
+	[PWRAP_DCM_EN] =		0x1CC,
+	[PWRAP_DCM_DBC_PRD] =		0x1D4,
+};
+
 static int mt7622_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
@@ -641,6 +674,7 @@ enum pmic_type {
 
 enum pwrap_type {
 	PWRAP_MT2701,
+	PWRAP_MT6797,
 	PWRAP_MT7622,
 	PWRAP_MT8135,
 	PWRAP_MT8173,
@@ -1067,6 +1101,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 		pwrap_writel(wrp, 1, PWRAP_CIPHER_START);
 		break;
 	case PWRAP_MT2701:
+	case PWRAP_MT6797:
 	case PWRAP_MT8173:
 		pwrap_writel(wrp, 1, PWRAP_CIPHER_EN);
 		break;
@@ -1396,6 +1431,18 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 	.init_soc_specific = pwrap_mt2701_init_soc_specific,
 };
 
+static const struct pmic_wrapper_type pwrap_mt6797 = {
+	.regs = mt6797_regs,
+	.type = PWRAP_MT6797,
+	.arb_en_all = 0x01fff,
+	.int_en_all = 0xffffffc6,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.has_bridge = 0,
+	.init_reg_clock = pwrap_common_init_reg_clock,
+	.init_soc_specific = NULL,
+};
+
 static const struct pmic_wrapper_type pwrap_mt7622 = {
 	.regs = mt7622_regs,
 	.type = PWRAP_MT7622,
@@ -1437,6 +1484,9 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 		.compatible = "mediatek,mt2701-pwrap",
 		.data = &pwrap_mt2701,
 	}, {
+		.compatible = "mediatek,mt6797-pwrap",
+		.data = &pwrap_mt6797,
+	}, {
 		.compatible = "mediatek,mt7622-pwrap",
 		.data = &pwrap_mt7622,
 	}, {
-- 
1.9.1
