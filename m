From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH V5 05/11] soc: mediatek: PMIC wrap: WRAP_INT_EN needs a
 different bitmask for MT2701/7623
Date: Sun,  7 Feb 2016 11:42:52 +0100
Message-ID: <1454841778-35529-6-git-send-email-blogic@openwrt.org>
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

MT2701 and MT7623 use a different bitmask for PWRAP_INT_EN.

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
Changes in V5
* move the logic invert from call to declaration

 drivers/soc/mediatek/mtk-pmic-wrap.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index e3bbee5..2fd795f 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -371,6 +371,7 @@ struct pmic_wrapper_type {
 	int *regs;
 	enum pwrap_type type;
 	u32 arb_en_all;
+	u32 int_en_all;
 	int (*init_reg_clock)(struct pmic_wrapper *wrp);
 	int (*init_special)(struct pmic_wrapper *wrp);
 };
@@ -825,6 +826,7 @@ static struct pmic_wrapper_type pwrap_mt8135 = {
 	.regs = mt8135_regs,
 	.type = PWRAP_MT8135,
 	.arb_en_all = 0x1ff,
+	.int_en_all = ~(BIT(31) | BIT(1)),
 	.init_reg_clock = pwrap_mt8135_init_reg_clock,
 	.init_special = pwrap_mt8135_init_special,
 };
@@ -833,6 +835,7 @@ static struct pmic_wrapper_type pwrap_mt8173 = {
 	.regs = mt8173_regs,
 	.type = PWRAP_MT8173,
 	.arb_en_all = 0x3f,
+	.int_en_all = ~(BIT(31) | BIT(1)),
 	.init_reg_clock = pwrap_mt8173_init_reg_clock,
 	.init_special = pwrap_mt8173_init_special,
 };
@@ -946,7 +949,7 @@ static int pwrap_probe(struct platform_device *pdev)
 			PWRAP_WDT_SRC_MASK_NO_STAUPD : PWRAP_WDT_SRC_MASK_ALL;
 	pwrap_writel(wrp, wdt_src, PWRAP_WDT_SRC_EN);
 	pwrap_writel(wrp, 0x1, PWRAP_TIMER_EN);
-	pwrap_writel(wrp, ~((1 << 31) | (1 << 1)), PWRAP_INT_EN);
+	pwrap_writel(wrp, wrp->master->int_en_all, PWRAP_INT_EN);
 
 	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(wrp->dev, irq, pwrap_interrupt, IRQF_TRIGGER_HIGH,
-- 
1.7.10.4
