From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH V2 2/4] soc: mediatek: PMIC wrap: INT_EN mask may vary
Date: Sun, 10 Jan 2016 17:04:42 +0100
Message-ID: <1452441884-25882-2-git-send-email-blogic@openwrt.org>
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

The MT7623 and possible other SoCs have a different INT_EN mask. Change
the driver so that it handles the interrupt mask in the same was as
arb_en_all.

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index f3fccea..82350d0 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -404,6 +404,7 @@ struct pmic_wrapper_type {
 	u32 dew_base;
 	enum pwrap_type type;
 	u32 arb_en_all;
+	u32 int_en_all;
 };
 
 static struct pmic_wrapper_type pwrap_mt8135 = {
@@ -412,6 +413,7 @@ static struct pmic_wrapper_type pwrap_mt8135 = {
 	.dew_base = 0xbc00,
 	.type = PWRAP_MT8135,
 	.arb_en_all = 0x1ff,
+	.int_en_all = BIT(31) | BIT(1),
 };
 
 static struct pmic_wrapper_type pwrap_mt8173 = {
@@ -420,6 +422,7 @@ static struct pmic_wrapper_type pwrap_mt8173 = {
 	.dew_base = 0xbc00,
 	.type = PWRAP_MT8173,
 	.arb_en_all = 0x3f,
+	.int_en_all = BIT(31) | BIT(1),
 };
 
 struct pmic_wrapper {
@@ -431,6 +434,7 @@ struct pmic_wrapper {
 	u32 dew_base;
 	enum pwrap_type type;
 	u32 arb_en_all;
+	u32 int_en_all;
 	struct clk *clk_spi;
 	struct clk *clk_wrap;
 	struct reset_control *rstc;
@@ -900,6 +904,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	wrp->dew_regs = type->dew_regs;
 	wrp->dew_base = type->dew_base;
 	wrp->arb_en_all = type->arb_en_all;
+	wrp->int_en_all = type->int_en_all;
 	wrp->dev = &pdev->dev;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwrap");
@@ -974,7 +979,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	pwrap_writel(wrp, 0xf, PWRAP_WDT_UNIT);
 	pwrap_writel(wrp, 0xffffffff, PWRAP_WDT_SRC_EN);
 	pwrap_writel(wrp, 0x1, PWRAP_TIMER_EN);
-	pwrap_writel(wrp, ~((1 << 31) | (1 << 1)), PWRAP_INT_EN);
+	pwrap_writel(wrp, ~wrp->int_en_all, PWRAP_INT_EN);
 
 	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(wrp->dev, irq, pwrap_interrupt, IRQF_TRIGGER_HIGH,
-- 
1.7.10.4
