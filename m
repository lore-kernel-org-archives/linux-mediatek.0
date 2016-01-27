From: John Crispin <blogic@openwrt.org>
Subject: [PATCH V4 05/11] soc: mediatek: PMIC wrap: WRAP_INT_EN needs a
 different bitmask for MT2701/7623
Date: Wed, 27 Jan 2016 12:29:03 +0100
Message-ID: <1453894149-44127-5-git-send-email-blogic@openwrt.org>
References: <1453894149-44127-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1453894149-44127-1-git-send-email-blogic@openwrt.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: linux-mediatek@lists.infradead.org

MT2701 and MT7623 use a different bitmask for PWRAP_INT_EN.

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index ab2202d..948fc73 100644
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
@@ -824,6 +825,7 @@ static struct pmic_wrapper_type pwrap_mt8135 = {
 	.regs = mt8135_regs,
 	.type = PWRAP_MT8135,
 	.arb_en_all = 0x1ff,
+	.int_en_all = BIT(31) | BIT(1),
 	.init_reg_clock = pwrap_mt8135_init_reg_clock,
 	.init_special = pwrap_mt8135_init_special,
 };
@@ -832,6 +834,7 @@ static struct pmic_wrapper_type pwrap_mt8173 = {
 	.regs = mt8173_regs,
 	.type = PWRAP_MT8173,
 	.arb_en_all = 0x3f,
+	.int_en_all = BIT(31) | BIT(1),
 	.init_reg_clock = pwrap_mt8173_init_reg_clock,
 	.init_special = pwrap_mt8173_init_special,
 };
@@ -945,7 +948,7 @@ static int pwrap_probe(struct platform_device *pdev)
 			PWRAP_WDT_SRC_MASK_NO_STAUPD : PWRAP_WDT_SRC_MASK_ALL;
 	pwrap_writel(wrp, wdt_src, PWRAP_WDT_SRC_EN);
 	pwrap_writel(wrp, 0x1, PWRAP_TIMER_EN);
-	pwrap_writel(wrp, ~((1 << 31) | (1 << 1)), PWRAP_INT_EN);
+	pwrap_writel(wrp, ~wrp->master->int_en_all, PWRAP_INT_EN);
 
 	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(wrp->dev, irq, pwrap_interrupt, IRQF_TRIGGER_HIGH,
-- 
1.7.10.4
