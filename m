From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 1/2] watchdog: add wdt suspend/resume support
Date: Thu, 23 Jul 2015 13:49:10 +0800
Message-ID: <1437630551-39650-2-git-send-email-eddie.huang@mediatek.com>
References: <1437630551-39650-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437630551-39650-1-git-send-email-eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Greta Zhang <greta.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Roger Lu <roger.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

From: Greta Zhang <greta.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

add wdt driver suspend/resume support

Signed-off-by: Greta Zhang <greta.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Roger Lu <roger.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/watchdog/mtk_wdt.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 938b987..056412c 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -221,17 +221,47 @@ static int mtk_wdt_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int mtk_wdt_suspend(struct device *dev)
+{
+	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&mtk_wdt->wdt_dev))
+		mtk_wdt_stop(&mtk_wdt->wdt_dev);
+
+	return 0;
+}
+
+static int mtk_wdt_resume(struct device *dev)
+{
+	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&mtk_wdt->wdt_dev)) {
+		mtk_wdt_start(&mtk_wdt->wdt_dev);
+		mtk_wdt_ping(&mtk_wdt->wdt_dev);
+	}
+
+	return 0;
+}
+#endif
+
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
 
+static const struct dev_pm_ops mtk_wdt_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_wdt_suspend,
+				mtk_wdt_resume)
+};
+
 static struct platform_driver mtk_wdt_driver = {
 	.probe		= mtk_wdt_probe,
 	.remove		= mtk_wdt_remove,
 	.driver		= {
 		.name		= DRV_NAME,
+		.pm		= &mtk_wdt_pm_ops,
 		.of_match_table	= mtk_wdt_dt_ids,
 	},
 };
-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
