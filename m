Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B189AC48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 09:38:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77726613C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 09:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77726613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05AkMDOqvfchY/3tAesrGEqB3hCJsaIOjh1Xkg5UKU8=; b=WU6Ui8rbLUb547
	RP93CN3tOR3afHOJt0PBev7FfQXaKJYMcZX4Z41qQGJCi85eDbscGnhm7d9vmChC93ILIpEjGmGtZ
	j2u/j3uNTNclgJP0KHDeCz/Rk5zsITO+OawLD3tTYlSvsdYl4oj1s4P3ROPFcARHhuaO2C0H19xJy
	UxPDpCT+BII1NsQ3M+b0LSA5eXfQ//H41qca0yapZ3ZxBFWZlSPIDU1+W0EC2sriDHJVsoR5yZI6P
	4LYO8uOw9TuWHIBfi/E2823FTU/eQoGs8y0w5eAuXiml7246SQcBQIVze7l38XRfiABYHyolJQHUO
	+s1lyI19c9WshZ36JDOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luAwz-00DXec-4b; Fri, 18 Jun 2021 09:38:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luArN-00DU7i-Ae; Fri, 18 Jun 2021 09:32:23 +0000
X-UUID: 0ab102d98f114c8db8d185b2300dfa08-20210618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fgYEIXRDa20lK2Z/5FlNGHYB/6BP/LuEPBqhSrkrwbA=; 
 b=g+6BKDjwq+ypnytVgrNxm71XyQVkweUblnn1lcYX0zmSfAuotjJtZsisAvxOpj5V8BCGlRRu6xav/NDTSW80xsOc7bJRENSnSST3uT+i3JmFpSgLd/eUhc4LkIVARx0rZxU/XwBez0we8x89kQtd3NIOeFRezFi/Gm5R/XPnjYA=;
X-UUID: 0ab102d98f114c8db8d185b2300dfa08-20210618
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1471165560; Fri, 18 Jun 2021 02:32:17 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 02:29:58 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 17:29:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Jun 2021 17:29:48 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 10/13] usb: mtu3: support runtime PM for host mode
Date: Fri, 18 Jun 2021 17:29:15 +0800
Message-ID: <1624008558-16949-11-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A8E76CF6F5F0CEB819C6F4253F299C8187AD8C2C2C539AA228B621D38F94508E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_023221_426121_5374E65B 
X-CRM114-Status: GOOD (  20.85  )
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
v2: no changes
---
 drivers/usb/mtu3/mtu3.h      |  1 +
 drivers/usb/mtu3/mtu3_core.c | 13 ++++++--
 drivers/usb/mtu3/mtu3_plat.c | 62 +++++++++++++++++++++++++++++++++---
 3 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 0ae9b33b50ea..171e5b383063 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -246,6 +246,7 @@ struct ssusb_mtk {
 	void __iomem *ippc_base;
 	struct phy **phys;
 	int num_phys;
+	int wakeup_irq;
 	/* common power & clock */
 	struct regulator *vusb33;
 	struct clk_bulk_data clks[BULK_CLKS_CNT];
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
index a906b24723e6..61d5c7cfd4db 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -12,6 +12,7 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 
 #include "mtu3.h"
 #include "mtu3_dr.h"
@@ -208,6 +209,10 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	if (IS_ERR(ssusb->ippc_base))
 		return PTR_ERR(ssusb->ippc_base);
 
+	ssusb->wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");
+	if (ssusb->wakeup_irq == -EPROBE_DEFER)
+		return ssusb->wakeup_irq;
+
 	ssusb->dr_mode = usb_get_dr_mode(dev);
 	if (ssusb->dr_mode == USB_DR_MODE_UNKNOWN)
 		ssusb->dr_mode = USB_DR_MODE_OTG;
@@ -295,14 +300,25 @@ static int mtu3_probe(struct platform_device *pdev)
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
+			dev_err(dev, "failed to set wakeup irq %d\n", ssusb->wakeup_irq);
+			goto comm_exit;
+		}
+		dev_info(dev, "wakeup irq %d\n", ssusb->wakeup_irq);
+	}
+
 	ssusb_ip_sw_reset(ssusb);
 
 	if (IS_ENABLED(CONFIG_USB_MTU3_HOST))
@@ -353,6 +369,11 @@ static int mtu3_probe(struct platform_device *pdev)
 		goto comm_exit;
 	}
 
+	device_enable_async_suspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+	pm_runtime_forbid(dev);
+
 	return 0;
 
 host_exit:
@@ -373,6 +394,8 @@ static int mtu3_remove(struct platform_device *pdev)
 {
 	struct ssusb_mtk *ssusb = platform_get_drvdata(pdev);
 
+	pm_runtime_get_sync(&pdev->dev);
+
 	switch (ssusb->dr_mode) {
 	case USB_DR_MODE_PERIPHERAL:
 		ssusb_gadget_exit(ssusb);
@@ -390,9 +413,10 @@ static int mtu3_remove(struct platform_device *pdev)
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
@@ -401,7 +425,7 @@ static int mtu3_remove(struct platform_device *pdev)
  * when support dual-role mode, we reject suspend when
  * it works as device mode;
  */
-static int __maybe_unused mtu3_suspend(struct device *dev)
+static int mtu3_suspend_common(struct device *dev, pm_message_t msg)
 {
 	struct ssusb_mtk *ssusb = dev_get_drvdata(dev);
 
@@ -419,7 +443,7 @@ static int __maybe_unused mtu3_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mtu3_resume(struct device *dev)
+static int mtu3_resume_common(struct device *dev, pm_message_t msg)
 {
 	struct ssusb_mtk *ssusb = dev_get_drvdata(dev);
 	int ret;
@@ -448,8 +472,36 @@ static int __maybe_unused mtu3_resume(struct device *dev)
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
