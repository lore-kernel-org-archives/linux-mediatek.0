From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v3 2/6] usb: host: xhci-plat: get optional clock by devm_clk_get_optional()
Date: Wed, 17 Apr 2019 16:28:17 +0800
Message-ID: <b61f41ecccde4f4fee4796a1da67a1c8bf8bbbcb.1555488276.git.chunfeng.yun@mediatek.com>
References: <bacafa9a60c2f437e2be0ccdf504492343fc0a66.1555488276.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bacafa9a60c2f437e2be0ccdf504492343fc0a66.1555488276.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

When the driver tries to get optional clock, it ignores all errors except
-EPROBE_DEFER, but if only ignores -ENOENT, it will cover some real errors,
such as -ENOMEM, so use devm_clk_get_optional() to get optional clock.

Cc: Mathias Nyman <mathias.nyman@intel.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: modify changelog comment
v2: no changes
---
 drivers/usb/host/xhci-plat.c | 39 +++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 0ac4ec975547..998241f5fce3 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -165,8 +165,6 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	struct xhci_hcd		*xhci;
 	struct resource         *res;
 	struct usb_hcd		*hcd;
-	struct clk              *clk;
-	struct clk              *reg_clk;
 	int			ret;
 	int			irq;
 
@@ -235,31 +233,32 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	hcd->rsrc_start = res->start;
 	hcd->rsrc_len = resource_size(res);
 
+	xhci = hcd_to_xhci(hcd);
+
 	/*
 	 * Not all platforms have clks so it is not an error if the
 	 * clock do not exist.
 	 */
-	reg_clk = devm_clk_get(&pdev->dev, "reg");
-	if (!IS_ERR(reg_clk)) {
-		ret = clk_prepare_enable(reg_clk);
-		if (ret)
-			goto put_hcd;
-	} else if (PTR_ERR(reg_clk) == -EPROBE_DEFER) {
-		ret = -EPROBE_DEFER;
+	xhci->reg_clk = devm_clk_get_optional(&pdev->dev, "reg");
+	if (IS_ERR(xhci->reg_clk)) {
+		ret = PTR_ERR(xhci->reg_clk);
 		goto put_hcd;
 	}
 
-	clk = devm_clk_get(&pdev->dev, NULL);
-	if (!IS_ERR(clk)) {
-		ret = clk_prepare_enable(clk);
-		if (ret)
-			goto disable_reg_clk;
-	} else if (PTR_ERR(clk) == -EPROBE_DEFER) {
-		ret = -EPROBE_DEFER;
+	ret = clk_prepare_enable(xhci->reg_clk);
+	if (ret)
+		goto put_hcd;
+
+	xhci->clk = devm_clk_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(xhci->clk)) {
+		ret = PTR_ERR(xhci->clk);
 		goto disable_reg_clk;
 	}
 
-	xhci = hcd_to_xhci(hcd);
+	ret = clk_prepare_enable(xhci->clk);
+	if (ret)
+		goto disable_reg_clk;
+
 	priv_match = of_device_get_match_data(&pdev->dev);
 	if (priv_match) {
 		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
@@ -271,8 +270,6 @@ static int xhci_plat_probe(struct platform_device *pdev)
 
 	device_wakeup_enable(hcd->self.controller);
 
-	xhci->clk = clk;
-	xhci->reg_clk = reg_clk;
 	xhci->main_hcd = hcd;
 	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
 			dev_name(&pdev->dev), hcd);
@@ -348,10 +345,10 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	usb_put_hcd(xhci->shared_hcd);
 
 disable_clk:
-	clk_disable_unprepare(clk);
+	clk_disable_unprepare(xhci->clk);
 
 disable_reg_clk:
-	clk_disable_unprepare(reg_clk);
+	clk_disable_unprepare(xhci->reg_clk);
 
 put_hcd:
 	usb_put_hcd(hcd);
-- 
2.21.0
