From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 3/5] usb: misc: usb3503: get optional clock by
 devm_clk_get_optional()
Date: Sat, 30 Mar 2019 17:28:18 +0800
Message-ID: <ae25effac3e4e6f559a4e043caf6607f7cee5cac.1553937592.git.chunfeng.yun@mediatek.com>
References: <2ec86ffd7de45dabaa7257019a79f1e80751934c.1553937592.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2ec86ffd7de45dabaa7257019a79f1e80751934c.1553937592.git.chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dongjin Kim <tobetter@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Use devm_clk_get_optional() to get optional clock

Cc: Dongjin Kim <tobetter@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/misc/usb3503.c | 48 ++++++++++++++------------------------
 1 file changed, 18 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index d5141aa79dd4..72f39a9751b5 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -172,7 +172,6 @@ static int usb3503_probe(struct usb3503 *hub)
 		hub->gpio_reset		= pdata->gpio_reset;
 		hub->mode		= pdata->initial_mode;
 	} else if (np) {
-		struct clk *clk;
 		u32 rate = 0;
 		hub->port_off_mask = 0;
 
@@ -198,34 +197,29 @@ static int usb3503_probe(struct usb3503 *hub)
 			}
 		}
 
-		clk = devm_clk_get(dev, "refclk");
-		if (IS_ERR(clk) && PTR_ERR(clk) != -ENOENT) {
+		hub->clk = devm_clk_get_optional(dev, "refclk");
+		if (IS_ERR(hub->clk)) {
 			dev_err(dev, "unable to request refclk (%ld)\n",
-					PTR_ERR(clk));
-			return PTR_ERR(clk);
+					PTR_ERR(hub->clk));
+			return PTR_ERR(hub->clk);
 		}
 
-		if (!IS_ERR(clk)) {
-			hub->clk = clk;
-
-			if (rate != 0) {
-				err = clk_set_rate(hub->clk, rate);
-				if (err) {
-					dev_err(dev,
-						"unable to set reference clock rate to %d\n",
-						(int) rate);
-					return err;
-				}
-			}
-
-			err = clk_prepare_enable(hub->clk);
+		if (rate != 0) {
+			err = clk_set_rate(hub->clk, rate);
 			if (err) {
 				dev_err(dev,
-					"unable to enable reference clock\n");
+					"unable to set reference clock rate to %d\n",
+					(int)rate);
 				return err;
 			}
 		}
 
+		err = clk_prepare_enable(hub->clk);
+		if (err) {
+			dev_err(dev, "unable to enable reference clock\n");
+			return err;
+		}
+
 		property = of_get_property(np, "disabled-ports", &len);
 		if (property && (len / sizeof(u32)) > 0) {
 			int i;
@@ -324,8 +318,7 @@ static int usb3503_i2c_remove(struct i2c_client *i2c)
 	struct usb3503 *hub;
 
 	hub = i2c_get_clientdata(i2c);
-	if (hub->clk)
-		clk_disable_unprepare(hub->clk);
+	clk_disable_unprepare(hub->clk);
 
 	return 0;
 }
@@ -348,8 +341,7 @@ static int usb3503_platform_remove(struct platform_device *pdev)
 	struct usb3503 *hub;
 
 	hub = platform_get_drvdata(pdev);
-	if (hub->clk)
-		clk_disable_unprepare(hub->clk);
+	clk_disable_unprepare(hub->clk);
 
 	return 0;
 }
@@ -358,18 +350,14 @@ static int usb3503_platform_remove(struct platform_device *pdev)
 static int usb3503_suspend(struct usb3503 *hub)
 {
 	usb3503_switch_mode(hub, USB3503_MODE_STANDBY);
-
-	if (hub->clk)
-		clk_disable_unprepare(hub->clk);
+	clk_disable_unprepare(hub->clk);
 
 	return 0;
 }
 
 static int usb3503_resume(struct usb3503 *hub)
 {
-	if (hub->clk)
-		clk_prepare_enable(hub->clk);
-
+	clk_prepare_enable(hub->clk);
 	usb3503_switch_mode(hub, hub->mode);
 
 	return 0;
-- 
2.20.1
