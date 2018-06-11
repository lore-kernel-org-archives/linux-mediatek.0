From: <argus.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH V5 4/4] soc: mediatek: pwrap: add mt6351 driver for mt6797 SoCs
Date: Mon, 11 Jun 2018 18:50:00 +0800
Message-ID: <1528714200-2500-5-git-send-email-argus.lin@mediatek.com>
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

MT6351 is a new power management IC and it is used for mt6797 SoCs. To define
mt6351_regs for pmic register mapping and pmic_mt6351 for
accessing register.

Signed-off-by: Argus Lin <argus.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index d03e2d4..4cf9496 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -146,6 +146,21 @@ enum dew_regs {
 	[PWRAP_DEW_CIPHER_SWRST] =	0xbc24,
 };
 
+static const u32 mt6351_regs[] = {
+	[PWRAP_DEW_DIO_EN] =		0x02F2,
+	[PWRAP_DEW_READ_TEST] =		0x02F4,
+	[PWRAP_DEW_WRITE_TEST] =	0x02F6,
+	[PWRAP_DEW_CRC_EN] =		0x02FA,
+	[PWRAP_DEW_CRC_VAL] =		0x02FC,
+	[PWRAP_DEW_CIPHER_KEY_SEL] =	0x0300,
+	[PWRAP_DEW_CIPHER_IV_SEL] =	0x0302,
+	[PWRAP_DEW_CIPHER_EN] =		0x0304,
+	[PWRAP_DEW_CIPHER_RDY] =	0x0306,
+	[PWRAP_DEW_CIPHER_MODE] =	0x0308,
+	[PWRAP_DEW_CIPHER_SWRST] =	0x030A,
+	[PWRAP_DEW_RDDMY_NO] =		0x030C,
+};
+
 enum pwrap_regs {
 	PWRAP_MUX_SEL,
 	PWRAP_WRAP_EN,
@@ -668,6 +683,7 @@ enum pwrap_regs {
 
 enum pmic_type {
 	PMIC_MT6323,
+	PMIC_MT6351,
 	PMIC_MT6380,
 	PMIC_MT6397,
 };
@@ -1124,6 +1140,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 			    0x1);
 		break;
 	case PMIC_MT6323:
+	case PMIC_MT6351:
 		pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_EN],
 			    0x1);
 		break;
@@ -1400,6 +1417,15 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 	.pwrap_write = pwrap_write16,
 };
 
+static const struct pwrap_slv_type pmic_mt6351 = {
+	.dew_regs = mt6351_regs,
+	.type = PMIC_MT6351,
+	.regmap = &pwrap_regmap_config16,
+	.caps = 0,
+	.pwrap_read = pwrap_read16,
+	.pwrap_write = pwrap_write16,
+};
+
 static const struct of_device_id of_slave_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6323",
@@ -1414,6 +1440,9 @@ static irqreturn_t pwrap_interrupt(int irqno, void *dev_id)
 		.compatible = "mediatek,mt6397",
 		.data = &pmic_mt6397,
 	}, {
+		.compatible = "mediatek,mt6351",
+		.data = &pmic_mt6351,
+	}, {
 		/* sentinel */
 	}
 };
-- 
1.9.1
