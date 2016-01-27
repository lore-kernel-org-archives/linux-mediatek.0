From: John Crispin <blogic@openwrt.org>
Subject: [PATCH V3 3/4] mfd: mt6397: add support for different Slave types
Date: Wed, 27 Jan 2016 12:47:37 +0100
Message-ID: <1453895258-44369-3-git-send-email-blogic@openwrt.org>
References: <1453895258-44369-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1453895258-44369-1-git-send-email-blogic@openwrt.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: linux-mediatek@lists.infradead.org

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/mfd/mt6397-core.c |   58 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 75ad0fe..aa91606 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -24,6 +24,9 @@
 #define MT6397_RTC_BASE		0xe000
 #define MT6397_RTC_SIZE		0x3e
 
+#define MT6391_CID_CODE		0x91
+#define MT6397_CID_CODE		0x97
+
 static const struct resource mt6397_rtc_resources[] = {
 	{
 		.start = MT6397_RTC_BASE,
@@ -232,39 +235,60 @@ static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_irq_suspend,
 static int mt6397_probe(struct platform_device *pdev)
 {
 	int ret;
-	struct mt6397_chip *mt6397;
+	unsigned int id;
+	struct mt6397_chip *pmic;
 
-	mt6397 = devm_kzalloc(&pdev->dev, sizeof(*mt6397), GFP_KERNEL);
-	if (!mt6397)
+	pmic = devm_kzalloc(&pdev->dev, sizeof(*pmic), GFP_KERNEL);
+	if (!pmic)
 		return -ENOMEM;
 
-	mt6397->dev = &pdev->dev;
-	mt6397->int_con[0] = MT6397_INT_CON0;
-	mt6397->int_con[1] = MT6397_INT_CON1;
-	mt6397->int_status[0] = MT6397_INT_STATUS0;
-	mt6397->int_status[1] = MT6397_INT_STATUS1;
+	pmic->dev = &pdev->dev;
 
 	/*
 	 * mt6397 MFD is child device of soc pmic wrapper.
 	 * Regmap is set from its parent.
 	 */
-	mt6397->regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	if (!mt6397->regmap)
+	pmic->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!pmic->regmap)
 		return -ENODEV;
 
-	platform_set_drvdata(pdev, mt6397);
+	platform_set_drvdata(pdev, pmic);
+
+	ret = regmap_read(pmic->regmap, MT6397_CID, &id);
+	if (ret) {
+		dev_err(pmic->dev, "Failed to read chip id: %d\n", ret);
+		goto fail_irq;
+	}
+
+	switch (id & 0xff) {
+	case MT6397_CID_CODE:
+	case MT6391_CID_CODE:
+		pmic->int_con[0] = MT6397_INT_CON0;
+		pmic->int_con[1] = MT6397_INT_CON1;
+		pmic->int_status[0] = MT6397_INT_STATUS0;
+		pmic->int_status[1] = MT6397_INT_STATUS1;
+		ret = mfd_add_devices(&pdev->dev, -1, mt6397_devs,
+				ARRAY_SIZE(mt6397_devs), NULL, 0, NULL);
+		break;
+
+	default:
+		dev_err(&pdev->dev, "unsupported chip: %d\n", id);
+		ret = -ENODEV;
+		break;
+	}
 
-	mt6397->irq = platform_get_irq(pdev, 0);
-	if (mt6397->irq > 0) {
-		ret = mt6397_irq_init(mt6397);
+	pmic->irq = platform_get_irq(pdev, 0);
+	if (pmic->irq > 0) {
+		ret = mt6397_irq_init(pmic);
 		if (ret)
 			return ret;
 	}
 
-	ret = mfd_add_devices(&pdev->dev, -1, mt6397_devs,
-			ARRAY_SIZE(mt6397_devs), NULL, 0, NULL);
-	if (ret)
+fail_irq:
+	if (ret) {
+		irq_domain_remove(pmic->irq_domain);
 		dev_err(&pdev->dev, "failed to add child devices: %d\n", ret);
+	}
 
 	return ret;
 }
-- 
1.7.10.4
