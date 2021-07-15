Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4885C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 09:13:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B19FF61260
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 09:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B19FF61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWEPj5ouOcXE9HVe/3+dPUoFmYQoHHeQhTM15ErapFs=; b=efULt+ZrEWLxLC
	NQMRYcg2B7YJE9LmbcBRhWAlaj7AVxnVf3Iyh15hsc5R1iA9VyQTXrXs75KY55UPGC0g8S4sAwdGU
	5/ZOALaBd+9sWJIQ3Yw8YQDgaNWChz5vg0yuEkPbTckLF0l1+UcIrfRWUJesZj7M6R/f+fwxDT1iO
	ICMU3x2FnJRswsTQeLRCK7JIDgNZCRzEUOpqdPojZEyXNpjNCz2NJ4hKOaYxCztsGhBCPCuYcEpg6
	PcpGCci6TP2OlAVn9AplZTyTdGnY+DI/msA0Zmw6pwRFZHIijXWdBK7uMkg+3Ew/VXQPCyhSlOkMs
	2emhNe5PC/FuBStyxpAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3xQO-0004gN-Pf; Thu, 15 Jul 2021 09:12:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3xPL-0004Fi-Uo; Thu, 15 Jul 2021 09:11:53 +0000
X-UUID: 5f428155a82a43b090f54ee94631097d-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ICkfU6KL9E+0Yr7HRR1HmONSW+Qy18NKx5NFyETjBBk=; 
 b=pCENnXqoaBX4OyXIJumttpAHeRUcgplm7IwSK3GF0sDkejBSW2FBmQehuQ5Sg8WtITcJOxEY60GjCh5JoXvz1F6RP648lYDuDduawhDVOCPr32bsk04wf77NqiOGcRjEagi+ul1QcpzK2YGbs9219qZGYdxu0vdIbMfk6uaJHV0=;
X-UUID: 5f428155a82a43b090f54ee94631097d-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 553485435; Thu, 15 Jul 2021 02:11:46 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 02:08:22 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 17:08:20 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 17:08:20 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH v3 10/13] usb: mtu3: support runtime PM for host mode
Date: Thu, 15 Jul 2021 17:07:55 +0800
Message-ID: <1626340078-29111-11-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1626340078-29111-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1626340078-29111-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_021152_043307_E9039831 
X-CRM114-Status: GOOD (  20.19  )
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
v3: fix free-after-use issue
v2: no changes
---
 drivers/usb/mtu3/mtu3.h      |  1 +
 drivers/usb/mtu3/mtu3_core.c | 13 ++++++--
 drivers/usb/mtu3/mtu3_plat.c | 64 ++++++++++++++++++++++++++++++++----
 3 files changed, 69 insertions(+), 9 deletions(-)

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
index a906b24723e6..2be890f84c94 100644
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
@@ -362,7 +383,7 @@ static int mtu3_probe(struct platform_device *pdev)
 comm_exit:
 	ssusb_rscs_exit(ssusb);
 comm_init_err:
-	pm_runtime_put_sync(dev);
+	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
 	ssusb_debugfs_remove_root(ssusb);
 
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
