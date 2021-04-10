Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0655C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 05:11:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D275610CF
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 05:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D275610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JctWvB7Qv1nG7HpJpJtkHk9RTeyo5D9y1r8KSVpbLmA=; b=qnZkCtaYjfkMSXjxWxNpYl0AJ
	5NKFbsjblYTIkrwbJQDfiJQSMMeMoHfoWvbzGxrSvb7sKUCC1yf3M18oeozPLss/nkOC28VtnamD3
	DLlgnOkQ08AKHq4DOH11jl5jJMR9gaElRGJ2UMXm3PSXXAYmnLIPrapE5VTz61PMBae30bSkEj05R
	xVUhnnNxmtIfTeHTkNPF0cV2Dxxf2G3fZLsf4M0kAbN0FVeLHwug+x+ny3zZ2NZJN+dW6yLGgms+I
	3rFBIqceP3F/plGSvlRHk2xlzQU0GiBWSVwvxgHTRrFoqDc26l8gME45lWrXpE4lOreRh3HQ9L9MC
	8E9DoyQNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV5uC-002BxS-PB; Sat, 10 Apr 2021 05:11:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV5t7-002BnP-1t; Sat, 10 Apr 2021 05:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=dBk2j9PMy+AVYLFdFIoNW1NJ02hfEqwt80XAxoaeQYc=; b=kPzm5La7QmZREMUFB99dP4g7sk
 kB4hOmUsYh84Nr0xuc3o3Du4cilYqt++fr8+ebihCJOyJ9A2g74j2kpeCM8IJTandhXKTPdlei7Ag
 gA5UVIbcAvILUZ6O0BNERWYOk/3h1rHJAtpUr2syYP4kdRHFqNhgODdYn0ok/EtE3wV+CQB3RTvme
 cm5Uw+KH1cAE9IuNiUEPJFvRdYg5EvZ5CxMpwtNud7oO1hJh95bGACdDleBJFcnZIzHXOMr4MvqkB
 L0kXs/uoZb0zUq/+LfDLDPirSoeV2BtfTUBF5Tl7TCRhXnDYKG3YuANdNm4zsU+2dfBmPt3o/aFiD
 d5npDnjA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV5t3-004wGe-VM; Sat, 10 Apr 2021 05:10:27 +0000
X-UUID: 5e61d00168c148e9baba80cb9838b8b5-20210409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dBk2j9PMy+AVYLFdFIoNW1NJ02hfEqwt80XAxoaeQYc=; 
 b=LalLV9NjvJzy/18197moXkmg+QU1v4dEgAQJkqjNlGtfd1UTBdEICnrXoEocr0dLriPbQAE42Wriqz7fXQtcM+oKEXQn8vxpA9P0ijfe8kVVVKslhRsfqSGvz5iFAqroVoI28PmUY+q1X+OnbMIGXN4lnaLyzBAKh+vaLWS6tQc=;
X-UUID: 5e61d00168c148e9baba80cb9838b8b5-20210409
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 646612587; Fri, 09 Apr 2021 22:10:22 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 22:10:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 13:10:19 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Apr 2021 13:10:18 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek
 <pavel@ucw.cz>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Tianping Fang
 <tianping.fang@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, "Ikjoon
 Jang" <ikjn@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 3/5] usb: xhci-mtk: add support runtime PM
Date: Sat, 10 Apr 2021 13:10:04 +0800
Message-ID: <1618031406-15347-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618031406-15347-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1618031406-15347-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_221026_062285_52C7CB9F 
X-CRM114-Status: GOOD (  25.36  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A dedicated wakeup irq will be used to handle runtime suspend/resume,
we use dev_pm_set_dedicated_wake_irq API to take care of requesting
and attaching wakeup irq, then the suspend/resume framework will help
to enable/disable wakeup irq.

The runtime PM is default off since some platforms may not support it.
users can enable it via power/control (set "auto") in sysfs.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes, but abandon dependent patch [1], use falling edge type
    interrupt

[1]
[1/6] PM: runtime: enable wake irq after runtime_suspend hook called

https://patchwork.kernel.org/project/linux-mediatek/patch/1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com/
---
 drivers/usb/host/xhci-mtk.c | 140 +++++++++++++++++++++++++++++++-----
 1 file changed, 124 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index a74764ab914a..30927f4064d4 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -358,7 +359,6 @@ static int usb_wakeup_of_property_parse(struct xhci_hcd_mtk *mtk,
 			mtk->uwk_reg_base, mtk->uwk_vers);
 
 	return PTR_ERR_OR_ZERO(mtk->uwk);
-
 }
 
 static void usb_wakeup_set(struct xhci_hcd_mtk *mtk, bool enable)
@@ -458,6 +458,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct usb_hcd *hcd;
 	int ret = -ENODEV;
+	int wakeup_irq;
 	int irq;
 
 	if (usb_disabled())
@@ -485,6 +486,21 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	irq = platform_get_irq_byname_optional(pdev, "host");
+	if (irq < 0) {
+		if (irq == -EPROBE_DEFER)
+			return irq;
+
+		/* for backward compatibility */
+		irq = platform_get_irq(pdev, 0);
+		if (irq < 0)
+			return irq;
+	}
+
+	wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");
+	if (wakeup_irq == -EPROBE_DEFER)
+		return wakeup_irq;
+
 	mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
 	/* optional property, ignore the error if it does not exist */
 	of_property_read_u32(node, "mediatek,u3p-dis-msk",
@@ -496,9 +512,11 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	pm_runtime_set_active(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 4000);
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
-	device_enable_async_suspend(dev);
 
 	ret = xhci_mtk_ldos_enable(mtk);
 	if (ret)
@@ -508,12 +526,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_ldos;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto disable_clk;
-	}
-
 	hcd = usb_create_hcd(driver, dev, dev_name(dev));
 	if (!hcd) {
 		ret = -ENOMEM;
@@ -579,8 +591,26 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	if (ret)
 		goto dealloc_usb2_hcd;
 
+	if (wakeup_irq > 0) {
+		ret = dev_pm_set_dedicated_wake_irq(dev, wakeup_irq);
+		if (ret) {
+			dev_err(dev, "set wakeup irq %d failed\n", wakeup_irq);
+			goto dealloc_usb3_hcd;
+		}
+		dev_info(dev, "wakeup irq %d\n", wakeup_irq);
+	}
+
+	device_enable_async_suspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+	pm_runtime_forbid(dev);
+
 	return 0;
 
+dealloc_usb3_hcd:
+	usb_remove_hcd(xhci->shared_hcd);
+	xhci->shared_hcd = NULL;
+
 dealloc_usb2_hcd:
 	usb_remove_hcd(hcd);
 
@@ -601,25 +631,26 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	xhci_mtk_ldos_disable(mtk);
 
 disable_pm:
-	pm_runtime_put_sync(dev);
+	pm_runtime_put_sync_autosuspend(dev);
 	pm_runtime_disable(dev);
 	return ret;
 }
 
-static int xhci_mtk_remove(struct platform_device *dev)
+static int xhci_mtk_remove(struct platform_device *pdev)
 {
-	struct xhci_hcd_mtk *mtk = platform_get_drvdata(dev);
+	struct xhci_hcd_mtk *mtk = platform_get_drvdata(pdev);
 	struct usb_hcd	*hcd = mtk->hcd;
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	struct usb_hcd  *shared_hcd = xhci->shared_hcd;
+	struct device *dev = &pdev->dev;
 
-	pm_runtime_put_noidle(&dev->dev);
-	pm_runtime_disable(&dev->dev);
+	pm_runtime_get_sync(dev);
+	xhci->xhc_state |= XHCI_STATE_REMOVING;
+	dev_pm_clear_wake_irq(dev);
+	device_init_wakeup(dev, false);
 
 	usb_remove_hcd(shared_hcd);
 	xhci->shared_hcd = NULL;
-	device_init_wakeup(&dev->dev, false);
-
 	usb_remove_hcd(hcd);
 	usb_put_hcd(shared_hcd);
 	usb_put_hcd(hcd);
@@ -627,6 +658,10 @@ static int xhci_mtk_remove(struct platform_device *dev)
 	xhci_mtk_clks_disable(mtk);
 	xhci_mtk_ldos_disable(mtk);
 
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_set_suspended(dev);
+
 	return 0;
 }
 
@@ -690,10 +725,83 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	return ret;
 }
 
+static int check_rhub_status(struct xhci_hcd *xhci, struct xhci_hub *rhub)
+{
+	u32 suspended_ports;
+	u32 status;
+	int num_ports;
+	int i;
+
+	num_ports = rhub->num_ports;
+	suspended_ports = rhub->bus_state.suspended_ports;
+	for (i = 0; i < num_ports; i++) {
+		if (!(suspended_ports & BIT(i))) {
+			status = readl(rhub->ports[i]->addr);
+			if (status & PORT_CONNECT)
+				return -EBUSY;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * check the bus whether it could suspend or not
+ * the bus will suspend if the downstream ports are already suspended,
+ * or no devices connected.
+ */
+static int check_bus_status(struct xhci_hcd *xhci)
+{
+	int ret;
+
+	ret = check_rhub_status(xhci, &xhci->usb3_rhub);
+	if (ret)
+		return ret;
+
+	return check_rhub_status(xhci, &xhci->usb2_rhub);
+}
+
+static int __maybe_unused xhci_mtk_runtime_suspend(struct device *dev)
+{
+	struct xhci_hcd_mtk  *mtk = dev_get_drvdata(dev);
+	struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
+	int ret = 0;
+
+	if (xhci->xhc_state)
+		return -ESHUTDOWN;
+
+	if (device_may_wakeup(dev)) {
+		ret = check_bus_status(xhci);
+		if (!ret)
+			ret = xhci_mtk_suspend(dev);
+	}
+
+	/* -EBUSY: let PM automatically reschedule another autosuspend */
+	return ret ? -EBUSY : 0;
+}
+
+static int __maybe_unused xhci_mtk_runtime_resume(struct device *dev)
+{
+	struct xhci_hcd_mtk  *mtk = dev_get_drvdata(dev);
+	struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
+	int ret = 0;
+
+	if (xhci->xhc_state)
+		return -ESHUTDOWN;
+
+	if (device_may_wakeup(dev))
+		ret = xhci_mtk_resume(dev);
+
+	return ret;
+}
+
 static const struct dev_pm_ops xhci_mtk_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(xhci_mtk_suspend, xhci_mtk_resume)
+	SET_RUNTIME_PM_OPS(xhci_mtk_runtime_suspend,
+			   xhci_mtk_runtime_resume, NULL)
 };
-#define DEV_PM_OPS IS_ENABLED(CONFIG_PM) ? &xhci_mtk_pm_ops : NULL
+
+#define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &xhci_mtk_pm_ops : NULL)
 
 static const struct of_device_id mtk_xhci_of_match[] = {
 	{ .compatible = "mediatek,mt8173-xhci"},
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
