From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/2] usb: xhci-mtk: fix checkpatch warning and erorr
Date: Tue, 7 Mar 2017 14:57:21 +0800
Message-ID: <1488869841-9959-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1488869841-9959-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1488869841-9959-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

there are two warnings and a erorr when checked by checkpatch.pl
as following:

WARNING:BLOCK_COMMENT_STYLE: Block comments should align
the * on each line

ERROR:COMPLEX_MACRO: Macros with complex values should be
enclosed in parentheses

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/host/xhci-mtk.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 9636884..22c94fe 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -287,9 +287,9 @@ static void usb_wakeup_ip_sleep_dis(struct xhci_hcd_mtk *mtk)
 }
 
 /*
-* for line-state wakeup mode, phy's power should not power-down
-* and only support cable plug in/out
-*/
+ * for line-state wakeup mode, phy's power should not power-down
+ * and only support cable plug in/out
+ */
 static void usb_wakeup_line_state_en(struct xhci_hcd_mtk *mtk)
 {
 	u32 tmp;
@@ -350,10 +350,10 @@ static int usb_wakeup_of_property_parse(struct xhci_hcd_mtk *mtk,
 	struct device *dev = mtk->dev;
 
 	/*
-	* wakeup function is optional, so it is not an error if this property
-	* does not exist, and in such case, no need to get relative
-	* properties anymore.
-	*/
+	 * wakeup function is optional, so it is not an error if this property
+	 * does not exist, and in such case, no need to get relative
+	 * properties anymore.
+	 */
 	of_property_read_u32(dn, "mediatek,wakeup-src", &mtk->wakeup_src);
 	if (!mtk->wakeup_src)
 		return 0;
@@ -796,7 +796,7 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 static const struct dev_pm_ops xhci_mtk_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(xhci_mtk_suspend, xhci_mtk_resume)
 };
-#define DEV_PM_OPS IS_ENABLED(CONFIG_PM) ? &xhci_mtk_pm_ops : NULL
+#define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &xhci_mtk_pm_ops : NULL)
 
 #ifdef CONFIG_OF
 static const struct of_device_id mtk_xhci_of_match[] = {
-- 
1.7.9.5
