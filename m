Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DF2C4743E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:15:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D46F6124C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D46F6124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y3U93nC1A5/f6nSz4hDAzBNwXdgO/oqohbWINFeUMB0=; b=Bl1cJ5JPM8ChMc
	Jn0I46xbq+u4ft18hwKMKLU+5VC+K1H+e09S58ugLKzA+Q+N9m7MNLgqbe/tmIjxWBeFGTBnQS5QG
	pwyuoC+ncg7Rif4m9qN/UKtrgk9+WkqDlR88uWghoxSlc8ovMIMvghKsmr6keMK8INTP/O2Axk5QC
	KMcmh2AM4rX3/VKOFYw5k1N2r79X0nxGnA7gKA3Kz9rkPdQYlOS9msCpREvht5Pbria8o0Zj5bprJ
	5zOag5s/h0orWw8wJIVxPD6bu/nL8fS8aXQzFhYVR5/EfjPXAx2sTJlLRuyKFM0OD8bwfIlJQ7QMF
	fTHPGUEEDjBZVXN7sJIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWtd-00728v-4u; Tue, 08 Jun 2021 08:15:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWmT-006xi4-7o; Tue, 08 Jun 2021 08:08:15 +0000
X-UUID: 4152953f1944433e8c301ad7c179b2b9-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zkpRghi38jUugljhWE0F0byx3DLRQoYnpERQrP2ov+U=; 
 b=uixK9TQ0KerMAzBBbqGwWkMie2T2fR9XaMKsjM3Wl8+2teUChT49yOcVeMyP++pz0JuYRdQikwGeTb8lvtzZOvIlwnJFyj1vKGAd7pzfxMKTBtFvrydoVEMHq5PYMSJaZ9ikWHY40wmVYmm97M/K3MPhoAoGfwyA0A8GENDi6ko=;
X-UUID: 4152953f1944433e8c301ad7c179b2b9-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1772956473; Tue, 08 Jun 2021 01:08:04 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 00:58:15 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:58:13 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH 19/23] usb: mtu3: support runtime PM for host mode
Date: Tue, 8 Jun 2021 15:57:45 +0800
Message-ID: <1623139069-8173-20-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_010813_372380_7A089261 
X-CRM114-Status: GOOD (  20.40  )
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

Use a dedicated wakeup irq for runtime suspend/resume, and interrupts
names are provided if using wakeup irq, this patch only support host
mode.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h      |  1 +
 drivers/usb/mtu3/mtu3_core.c | 13 ++++++--
 drivers/usb/mtu3/mtu3_plat.c | 62 +++++++++++++++++++++++++++++++++---
 3 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 710abe83ba1a..1f479a867ed1 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -247,6 +247,7 @@ struct ssusb_mtk {
 	void __iomem *ippc_base;
 	struct phy **phys;
 	int num_phys;
+	int wakeup_irq;
 	/* common power & clock */
 	struct regulator *vusb33;
 	struct clk *sys_clk;
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 562f4357831e..6d23acb4fffc 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -888,9 +888,16 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 	if (mtu == NULL)
 		return -ENOMEM;
 
-	mtu->irq = platform_get_irq(pdev, 0);
-	if (mtu->irq < 0)
-		return mtu->irq;
+	mtu->irq = platform_get_irq_byname_optional(pdev, "device");
+	if (mtu->irq < 0) {
+		if (mtu->irq == -EPROBE_DEFER)
+			return mtu->irq;
+
+		/* for backward compatibility */
+		mtu->irq = platform_get_irq(pdev, 0);
+		if (mtu->irq < 0)
+			return mtu->irq;
+	}
 	dev_info(dev, "irq %d\n", mtu->irq);
 
 	mtu->mac_base = devm_platform_ioremap_resource_byname(pdev, "mac");
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 30b940ebe9b4..9f8f2759b08e 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -13,6 +13,7 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 
 #include "mtu3.h"
 #include "mtu3_dr.h"
@@ -266,6 +267,10 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	if (IS_ERR(ssusb->ippc_base))
 		return PTR_ERR(ssusb->ippc_base);
 
+	ssusb->wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");
+	if (ssusb->wakeup_irq == -EPROBE_DEFER)
+		return ssusb->wakeup_irq;
+
 	ssusb->dr_mode = usb_get_dr_mode(dev);
 	if (ssusb->dr_mode == USB_DR_MODE_UNKNOWN)
 		ssusb->dr_mode = USB_DR_MODE_OTG;
@@ -353,14 +358,25 @@ static int mtu3_probe(struct platform_device *pdev)
 	ssusb_debugfs_create_root(ssusb);
 
 	/* enable power domain */
+	pm_runtime_set_active(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 4000);
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
-	device_enable_async_suspend(dev);
 
 	ret = ssusb_rscs_init(ssusb);
 	if (ret)
 		goto comm_init_err;
 
+	if (ssusb->wakeup_irq > 0) {
+		ret = dev_pm_set_dedicated_wake_irq(dev, ssusb->wakeup_irq);
+		if (ret) {
+			dev_err(dev, " failed to set wakeup irq %d\n", ssusb->wakeup_irq);
+			goto comm_exit;
+		}
+		dev_info(dev, "wakeup irq %d\n", ssusb->wakeup_irq);
+	}
+
 	ssusb_ip_sw_reset(ssusb);
 
 	if (IS_ENABLED(CONFIG_USB_MTU3_HOST))
@@ -411,6 +427,11 @@ static int mtu3_probe(struct platform_device *pdev)
 		goto comm_exit;
 	}
 
+	device_enable_async_suspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+	pm_runtime_forbid(dev);
+
 	return 0;
 
 host_exit:
@@ -431,6 +452,8 @@ static int mtu3_remove(struct platform_device *pdev)
 {
 	struct ssusb_mtk *ssusb = platform_get_drvdata(pdev);
 
+	pm_runtime_get_sync(&pdev->dev);
+
 	switch (ssusb->dr_mode) {
 	case USB_DR_MODE_PERIPHERAL:
 		ssusb_gadget_exit(ssusb);
@@ -448,9 +471,10 @@ static int mtu3_remove(struct platform_device *pdev)
 	}
 
 	ssusb_rscs_exit(ssusb);
-	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 	ssusb_debugfs_remove_root(ssusb);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
 
 	return 0;
 }
@@ -459,7 +483,7 @@ static int mtu3_remove(struct platform_device *pdev)
  * when support dual-role mode, we reject suspend when
  * it works as device mode;
  */
-static int __maybe_unused mtu3_suspend(struct device *dev)
+static int mtu3_suspend_common(struct device *dev, pm_message_t msg)
 {
 	struct ssusb_mtk *ssusb = dev_get_drvdata(dev);
 
@@ -477,7 +501,7 @@ static int __maybe_unused mtu3_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mtu3_resume(struct device *dev)
+static int mtu3_resume_common(struct device *dev, pm_message_t msg)
 {
 	struct ssusb_mtk *ssusb = dev_get_drvdata(dev);
 	int ret;
@@ -506,8 +530,36 @@ static int __maybe_unused mtu3_resume(struct device *dev)
 	return ret;
 }
 
+static int __maybe_unused mtu3_suspend(struct device *dev)
+{
+	return mtu3_suspend_common(dev, PMSG_SUSPEND);
+}
+
+static int __maybe_unused mtu3_resume(struct device *dev)
+{
+	return mtu3_resume_common(dev, PMSG_SUSPEND);
+}
+
+static int __maybe_unused mtu3_runtime_suspend(struct device *dev)
+{
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	return mtu3_suspend_common(dev, PMSG_AUTO_SUSPEND);
+}
+
+static int __maybe_unused mtu3_runtime_resume(struct device *dev)
+{
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	return mtu3_resume_common(dev, PMSG_AUTO_SUSPEND);
+}
+
 static const struct dev_pm_ops mtu3_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(mtu3_suspend, mtu3_resume)
+	SET_RUNTIME_PM_OPS(mtu3_runtime_suspend,
+			   mtu3_runtime_resume, NULL)
 };
 
 #define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &mtu3_pm_ops : NULL)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
