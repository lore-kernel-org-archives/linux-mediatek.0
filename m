From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH V5 03/11] soc: mediatek: PMIC wrap: add wrapper callbacks for
 init_reg_clock
Date: Sun,  7 Feb 2016 11:42:50 +0100
Message-ID: <1454841778-35529-4-git-send-email-blogic@openwrt.org>
References: <1454841778-35529-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1454841778-35529-1-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
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
Cc: Steven Liu <steven.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Split init_reg_clock up into SoC specific callbacks. The patch also
reorders the code to avoid the need for callback function prototypes.

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c |   70 ++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 340c4b5..b22b664 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -354,24 +354,6 @@ enum pwrap_type {
 	PWRAP_MT8173,
 };
 
-struct pmic_wrapper_type {
-	int *regs;
-	enum pwrap_type type;
-	u32 arb_en_all;
-};
-
-static struct pmic_wrapper_type pwrap_mt8135 = {
-	.regs = mt8135_regs,
-	.type = PWRAP_MT8135,
-	.arb_en_all = 0x1ff,
-};
-
-static struct pmic_wrapper_type pwrap_mt8173 = {
-	.regs = mt8173_regs,
-	.type = PWRAP_MT8173,
-	.arb_en_all = 0x3f,
-};
-
 struct pmic_wrapper {
 	struct device *dev;
 	void __iomem *base;
@@ -385,6 +367,13 @@ struct pmic_wrapper {
 	void __iomem *bridge_base;
 };
 
+struct pmic_wrapper_type {
+	int *regs;
+	enum pwrap_type type;
+	u32 arb_en_all;
+	int (*init_reg_clock)(struct pmic_wrapper *wrp);
+};
+
 static inline int pwrap_is_mt8135(struct pmic_wrapper *wrp)
 {
 	return wrp->master->type == PWRAP_MT8135;
@@ -578,20 +567,23 @@ static int pwrap_init_sidly(struct pmic_wrapper *wrp)
 	return 0;
 }
 
-static int pwrap_init_reg_clock(struct pmic_wrapper *wrp)
+static int pwrap_mt8135_init_reg_clock(struct pmic_wrapper *wrp)
 {
-	if (pwrap_is_mt8135(wrp)) {
-		pwrap_writel(wrp, 0x4, PWRAP_CSHEXT);
-		pwrap_writel(wrp, 0x0, PWRAP_CSHEXT_WRITE);
-		pwrap_writel(wrp, 0x4, PWRAP_CSHEXT_READ);
-		pwrap_writel(wrp, 0x0, PWRAP_CSLEXT_START);
-		pwrap_writel(wrp, 0x0, PWRAP_CSLEXT_END);
-	} else {
-		pwrap_writel(wrp, 0x0, PWRAP_CSHEXT_WRITE);
-		pwrap_writel(wrp, 0x4, PWRAP_CSHEXT_READ);
-		pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_START);
-		pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_END);
-	}
+	pwrap_writel(wrp, 0x4, PWRAP_CSHEXT);
+	pwrap_writel(wrp, 0x0, PWRAP_CSHEXT_WRITE);
+	pwrap_writel(wrp, 0x4, PWRAP_CSHEXT_READ);
+	pwrap_writel(wrp, 0x0, PWRAP_CSLEXT_START);
+	pwrap_writel(wrp, 0x0, PWRAP_CSLEXT_END);
+
+	return 0;
+}
+
+static int pwrap_mt8173_init_reg_clock(struct pmic_wrapper *wrp)
+{
+	pwrap_writel(wrp, 0x0, PWRAP_CSHEXT_WRITE);
+	pwrap_writel(wrp, 0x4, PWRAP_CSHEXT_READ);
+	pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_START);
+	pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_END);
 
 	return 0;
 }
@@ -699,7 +691,7 @@ static int pwrap_init(struct pmic_wrapper *wrp)
 
 	pwrap_writel(wrp, 1, PWRAP_WACS2_EN);
 
-	ret = pwrap_init_reg_clock(wrp);
+	ret = wrp->master->init_reg_clock(wrp);
 	if (ret)
 		return ret;
 
@@ -814,6 +806,20 @@ static const struct regmap_config pwrap_regmap_config = {
 	.max_register = 0xffff,
 };
 
+static struct pmic_wrapper_type pwrap_mt8135 = {
+	.regs = mt8135_regs,
+	.type = PWRAP_MT8135,
+	.arb_en_all = 0x1ff,
+	.init_reg_clock = pwrap_mt8135_init_reg_clock,
+};
+
+static struct pmic_wrapper_type pwrap_mt8173 = {
+	.regs = mt8173_regs,
+	.type = PWRAP_MT8173,
+	.arb_en_all = 0x3f,
+	.init_reg_clock = pwrap_mt8173_init_reg_clock,
+};
+
 static struct of_device_id of_pwrap_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt8135-pwrap",
-- 
1.7.10.4
