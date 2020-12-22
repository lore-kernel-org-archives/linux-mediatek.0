Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54D9C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 09:35:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51BF523103
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 09:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51BF523103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YD57H9/Pl78y3TnCaMxCZXYku5yr/X005PRoBUICgIE=; b=CxFOGcr9+w8QnZiQKSBLYRzGW
	K6vFbooruEf8GUEbixfmd37aJ/IHIWNNk+3lj9aGvJjPx6SPneqfbssteFk2qFiqnu7Sb/H9P9dMG
	ApmBzt9HG7uvCHRJwnO7+sx5zq/YYEio9NgblEJ2GRw7C5KEO9w4IR/dfXqXrBgjyKcDOSBZK0vL1
	wKmSlK7Tvks0/FRJIfVbqgmGjxeAAVAjKAP4ZWAFlIjYK3P+45UfLtmAyFUYp/3Lf0YmFdYY7bEPF
	8+dMjCqYgFHvekOZNDK6PJ80bU48uW0lGa2MmIrRmJpfAuElar2cCOBmPmlLNXhvsmg8Iu2iLGSjA
	ioJpLuACg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kre4T-00012E-Ht; Tue, 22 Dec 2020 09:35:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kre4O-0000z7-Rv
 for linux-mediatek@lists.infradead.org; Tue, 22 Dec 2020 09:35:07 +0000
X-UUID: 52d01136dc0b4f2a8126b46ad7de7e4d-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=up9yDO7WaXYp4EzpFS7bLWMZOpddUkTw8JCfasOGGUI=; 
 b=FF3ok+G6GW+ZceOsc3YrUBCvjuCco56UQFkKi9NBbT5yqFObTP1uiW6lZz1hF41l6atl4Jn9rxxGMPkVBiH19GEul29Nv2+M4QhXJF4ktTmlryDYN8TPoJDmlBrBhbYP2gwSj992vsEjZoRuxlFvob+5CQoFvv1YC6RitPaX/wk=;
X-UUID: 52d01136dc0b4f2a8126b46ad7de7e4d-20201222
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1393046013; Tue, 22 Dec 2020 01:35:01 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 01:34:59 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 17:34:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Dec 2020 17:34:55 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Subject: [RFC PATCH v3 4/5] usb: xhci-mtk: add support runtime pm
Date: Tue, 22 Dec 2020 17:34:41 +0800
Message-ID: <1608629682-8535-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1608629682-8535-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1608629682-8535-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_043505_129493_55FC562D 
X-CRM114-Status: GOOD (  21.69  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Zhanyong Wang <zhangyong.wang@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: CK Hu <ck.hu@mediatek.com>

add support runtime pm feature

Signed-off-by: Zhanyong Wang <zhanyong.wang@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3:
  1. fix some issues
  2. remove attribute files

v2: fix error caused by request irq suggested by CK
---
 drivers/usb/host/xhci-mtk.c | 285 +++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-mtk.h |  14 ++
 2 files changed, 294 insertions(+), 5 deletions(-)
 mode change 100755 => 100644 drivers/usb/host/xhci-mtk.c

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
old mode 100755
new mode 100644
index 34bd3de090b1..c07d54acbcb7
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -14,6 +14,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -77,6 +78,72 @@ enum ssusb_uwk_vers {
 	SSUSB_UWK_V3,
 };
 
+int xhci_mtk_runtime_ready;
+
+static int xhci_mtk_runtime_resume(struct device *dev);
+
+static void xhci_mtk_seal_work(struct work_struct *work)
+{
+	struct xhci_hcd_mtk *mtk =
+			container_of(work, struct xhci_hcd_mtk, seal.work);
+	struct usb_hcd *hcd = mtk->hcd;
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	xhci_dbg(xhci, "spm unseals xHCI controller %i\n", mtk->seal_status);
+	if (mtk->seal_status == SEAL_SUSPENDED) {
+		mtk->seal_status = SEAL_RESUMING;
+		pm_runtime_mark_last_busy(mtk->dev);
+		pm_runtime_put_sync_autosuspend(mtk->dev);
+	} else {
+		/*
+		 * FIXME: Sometimes seal_status will keep it on SEAL_RESUMING staus not to expect
+		 * since pm_runtime_put_sync_autosuspend doesn't invoke runtime_resume of callback.
+		 * and to survey why not to invoke runtime_resume callback named
+		 * xhci_mtk_runtime_resume in time in short feature, Herely provide one solution
+		 * that make sure seal_status to match h/w state machine,and MTK xHCI clocks
+		 * on as soon as unseal event received.
+		 */
+		if (mtk->seal_status == SEAL_RESUMING)
+			xhci_mtk_runtime_resume(mtk->dev);
+		else
+			xhci_warn(xhci,
+				"Ignore seal wakeup source disordered in xHCI controller\n");
+	}
+}
+
+static irqreturn_t xhci_mtk_seal_irq(int irq, void *data)
+{
+	struct xhci_hcd_mtk *mtk = data;
+	struct usb_hcd *hcd = mtk->hcd;
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	xhci_dbg(xhci, "seal irq ISR invoked\n");
+
+	schedule_delayed_work(&mtk->seal, 0);
+
+	return IRQ_HANDLED;
+}
+
+static void xhci_mtk_seal_wakeup_enable(struct xhci_hcd_mtk *mtk, bool enable)
+{
+	struct irq_desc *desc;
+	struct device *dev = mtk->dev;
+
+	if (mtk && mtk->seal_irq) {
+		desc = irq_to_desc(mtk->seal_irq);
+		if (enable) {
+			desc->irq_data.chip->irq_ack(&desc->irq_data);
+			enable_irq(mtk->seal_irq);
+			dev_dbg(dev, "%s: enable_irq %i\n",
+				 __func__, mtk->seal_irq);
+		} else {
+			disable_irq(mtk->seal_irq);
+			dev_dbg(dev, "%s: disable_irq %i\n",
+				 __func__, mtk->seal_irq);
+		}
+	}
+}
+
 static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
 {
 	struct mu3c_ippc_regs __iomem *ippc = mtk->ippc_regs;
@@ -347,7 +414,6 @@ static int usb_wakeup_of_property_parse(struct xhci_hcd_mtk *mtk,
 			mtk->uwk_reg_base, mtk->uwk_vers);
 
 	return PTR_ERR_OR_ZERO(mtk->uwk);
-
 }
 
 static void usb_wakeup_set(struct xhci_hcd_mtk *mtk, bool enable)
@@ -482,9 +548,11 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	pm_runtime_set_active(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev,
+				CONFIG_USB_AUTOSUSPEND_DELAY * 1000);
 	pm_runtime_enable(dev);
-	pm_runtime_get_sync(dev);
-	device_enable_async_suspend(dev);
 
 	ret = xhci_mtk_ldos_enable(mtk);
 	if (ret)
@@ -499,6 +567,14 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		ret = irq;
 		goto disable_clk;
 	}
+	dev_dbg(dev, "irq %i\n", irq);
+
+	mtk->seal_irq = platform_get_irq_optional(pdev, 1);
+	if (mtk->seal_irq < 0) {
+		ret = mtk->seal_irq;
+		goto disable_clk;
+	}
+	dev_dbg(dev, "seal_irq %i\n", mtk->seal_irq);
 
 	hcd = usb_create_hcd(driver, dev, dev_name(dev));
 	if (!hcd) {
@@ -565,6 +641,27 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	if (ret)
 		goto dealloc_usb2_hcd;
 
+	INIT_DELAYED_WORK(&mtk->seal, xhci_mtk_seal_work);
+	snprintf(mtk->seal_descr, sizeof(mtk->seal_descr), "seal%s:usb%d",
+		 hcd->driver->description, hcd->self.busnum);
+	ret = devm_request_irq(dev, mtk->seal_irq, &xhci_mtk_seal_irq,
+			  IRQF_TRIGGER_FALLING,	mtk->seal_descr, mtk);
+	if (ret != 0) {
+		dev_err(dev, "seal request interrupt %d failed\n",
+			mtk->seal_irq);
+		goto dealloc_usb2_hcd;
+	}
+	xhci_mtk_seal_wakeup_enable(mtk, false);
+
+	device_enable_async_suspend(dev);
+	xhci_mtk_runtime_ready = 1;
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	dev_dbg(dev, "%s: xhci_mtk_runtime_ready %i",
+		 __func__, xhci_mtk_runtime_ready);
+
 	return 0;
 
 dealloc_usb2_hcd:
@@ -587,7 +684,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	xhci_mtk_ldos_disable(mtk);
 
 disable_pm:
-	pm_runtime_put_sync(dev);
+	pm_runtime_put_sync_autosuspend(dev);
 	pm_runtime_disable(dev);
 	return ret;
 }
@@ -602,6 +699,7 @@ static int xhci_mtk_remove(struct platform_device *dev)
 	pm_runtime_put_noidle(&dev->dev);
 	pm_runtime_disable(&dev->dev);
 
+	xhci_mtk_runtime_ready = 0;
 	usb_remove_hcd(shared_hcd);
 	xhci->shared_hcd = NULL;
 	device_init_wakeup(&dev->dev, false);
@@ -638,6 +736,7 @@ static int __maybe_unused xhci_mtk_suspend(struct device *dev)
 	xhci_mtk_host_disable(mtk);
 	xhci_mtk_clks_disable(mtk);
 	usb_wakeup_set(mtk, true);
+
 	return 0;
 }
 
@@ -659,10 +758,185 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused xhci_mtk_bus_status(struct device *dev)
+{
+	struct xhci_hcd_mtk *mtk = dev_get_drvdata(dev);
+	struct usb_hcd *hcd;
+	struct xhci_hcd *xhci;
+	struct xhci_hub *usb2_rhub;
+	struct xhci_hub *usb3_rhub;
+	struct xhci_bus_state *bus_state;
+	struct xhci_port *port;
+	u32	usb2_suspended_ports = -1;
+	u32	usb3_suspended_ports = -1;
+	u16 status;
+	int num_ports;
+	int ret = 0;
+	int i;
+
+	if (!mtk->hcd)
+		return -ESHUTDOWN;
+
+	hcd = mtk->hcd;
+	xhci = hcd_to_xhci(hcd);
+	if ((xhci->xhc_state & XHCI_STATE_REMOVING) ||
+			(xhci->xhc_state & XHCI_STATE_HALTED)) {
+		return -ESHUTDOWN;
+	}
+
+	usb2_rhub = &xhci->usb2_rhub;
+	if (usb2_rhub) {
+		bus_state  = &usb2_rhub->bus_state;
+		num_ports  = usb2_rhub->num_ports;
+		usb2_suspended_ports  = bus_state->suspended_ports;
+		usb2_suspended_ports ^= (BIT(num_ports) - 1);
+		usb2_suspended_ports &= (BIT(num_ports) - 1);
+		for (i = 0; i < num_ports; i++) {
+			if (usb2_suspended_ports & (1UL << i)) {
+				port = usb2_rhub->ports[i];
+				status = readl(port->addr);
+
+				xhci_dbg(xhci,
+					  "USB20: portsc[%i]: 0x%04X\n",
+					  i, status);
+
+				if (!(status & PORT_CONNECT))
+					usb2_suspended_ports &= ~(1UL << i);
+			}
+		}
+
+		if (usb2_suspended_ports) {
+			ret = -EBUSY;
+			goto ebusy;
+		}
+	}
+
+	usb3_rhub = &xhci->usb3_rhub;
+	if (usb3_rhub) {
+		bus_state  = &usb3_rhub->bus_state;
+		num_ports  = usb3_rhub->num_ports;
+		usb3_suspended_ports  = bus_state->suspended_ports;
+		usb3_suspended_ports ^= (BIT(num_ports) - 1);
+		usb3_suspended_ports &= (BIT(num_ports) - 1);
+		for (i = 0; i < num_ports; i++) {
+			if (usb3_suspended_ports & BIT(i)) {
+				port = usb3_rhub->ports[i];
+				status = readl(port->addr);
+
+				xhci_dbg(xhci, "USB3: portsc[%i]: 0x%04X\n",
+					  i, status);
+
+				if (!(status & PORT_CONNECT))
+					usb3_suspended_ports &= ~BIT(i);
+			}
+		}
+
+		if (usb3_suspended_ports) {
+			ret = -EBUSY;
+			goto ebusy;
+		}
+	}
+
+ebusy:
+	xhci_dbg(xhci, "%s: USB2: 0x%08X, USB3: 0x%08X ret: %i\n",
+		  __func__, usb2_suspended_ports,
+		  usb3_suspended_ports, ret);
+
+	return ret;
+}
+
+static int __maybe_unused xhci_mtk_runtime_suspend(struct device *dev)
+{
+	bool wakeup = device_may_wakeup(dev);
+	struct xhci_hcd_mtk  *mtk = dev_get_drvdata(dev);
+	struct usb_hcd *hcd;
+	struct xhci_hcd *xhci;
+	int ret = 0;
+
+	if (!mtk->hcd)
+		return -ESHUTDOWN;
+
+	hcd = mtk->hcd;
+	xhci = hcd_to_xhci(hcd);
+	if ((xhci->xhc_state & XHCI_STATE_REMOVING) ||
+			(xhci->xhc_state & XHCI_STATE_HALTED)) {
+		return -ESHUTDOWN;
+	}
+
+	mtk->seal_status = SEAL_BUSY;
+	ret = xhci_mtk_bus_status(dev);
+	if (wakeup && !ret) {
+		mtk->seal_status = SEAL_SUSPENDING;
+		xhci_mtk_suspend(dev);
+		xhci_mtk_seal_wakeup_enable(mtk, true);
+		mtk->seal_status = SEAL_SUSPENDED;
+		xhci_dbg(xhci, "%s: seals xHCI controller\n", __func__);
+	}
+
+	xhci_dbg(xhci, "%s: seals wakeup = %i, ret = %i!\n",
+		  __func__, wakeup, ret);
+
+	return ret;
+}
+
+static int __maybe_unused xhci_mtk_runtime_resume(struct device *dev)
+{
+	bool wakeup = device_may_wakeup(dev);
+	struct xhci_hcd_mtk  *mtk = dev_get_drvdata(dev);
+	struct usb_hcd *hcd;
+	struct xhci_hcd *xhci;
+
+	if (!mtk->hcd)
+		return -ESHUTDOWN;
+
+	hcd = mtk->hcd;
+	xhci = hcd_to_xhci(hcd);
+	if ((xhci->xhc_state & XHCI_STATE_REMOVING) ||
+			(xhci->xhc_state & XHCI_STATE_HALTED)) {
+		return -ESHUTDOWN;
+	}
+
+	/*
+	 *  list cases by one extra interrupt named seal to process!!!
+	 *  Who to process these module reinitilization after SPM wakeup
+	 *  case 1: usb remote wakeup, therefore xHCI need reinitilizate also.
+	 *  case 2: other-wakeup-source wakeup, therefore, xHCI need reinit
+	 *  case 3: usb client driver can invoke it in runtime mechanism
+	 *  case 4: user active
+	 */
+	if (wakeup) {
+		xhci_mtk_seal_wakeup_enable(mtk, false);
+		xhci_mtk_resume(dev);
+		xhci_dbg(xhci, "%s: unseals xHCI controller\n", __func__);
+	}
+	mtk->seal_status = SEAL_RESUMED;
+
+	xhci_dbg(xhci, "%s: unseals wakeup = %i\n", __func__, wakeup);
+
+	return 0;
+}
+
+static int __maybe_unused xhci_mtk_runtime_idle(struct device *dev)
+{
+	int ret = 0;
+
+	dev_dbg(dev, "%s: xhci_mtk_runtime_ready %i",
+		 __func__, xhci_mtk_runtime_ready);
+
+	if (!xhci_mtk_runtime_ready)
+		ret = -EAGAIN;
+
+	return ret;
+}
+
 static const struct dev_pm_ops xhci_mtk_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(xhci_mtk_suspend, xhci_mtk_resume)
+	SET_RUNTIME_PM_OPS(xhci_mtk_runtime_suspend,
+			   xhci_mtk_runtime_resume,
+			   xhci_mtk_runtime_idle)
 };
-#define DEV_PM_OPS IS_ENABLED(CONFIG_PM) ? &xhci_mtk_pm_ops : NULL
+
+#define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &xhci_mtk_pm_ops : NULL)
 
 #ifdef CONFIG_OF
 static const struct of_device_id mtk_xhci_of_match[] = {
@@ -686,6 +960,7 @@ MODULE_ALIAS("platform:xhci-mtk");
 
 static int __init xhci_mtk_init(void)
 {
+	xhci_mtk_runtime_ready = 0;
 	xhci_init_driver(&xhci_mtk_hc_driver, &xhci_mtk_overrides);
 	return platform_driver_register(&mtk_xhci_driver);
 }
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 323b281933b9..103d83ce6a3e 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -133,6 +133,14 @@ struct mu3c_ippc_regs {
 	__le32 reserved3[33]; /* 0x80 ~ 0xff */
 };
 
+enum xhci_mtk_seal {
+	SEAL_BUSY = 0,
+	SEAL_SUSPENDING,
+	SEAL_SUSPENDED,
+	SEAL_RESUMING,
+	SEAL_RESUMED
+};
+
 struct xhci_hcd_mtk {
 	struct device *dev;
 	struct usb_hcd *hcd;
@@ -158,6 +166,12 @@ struct xhci_hcd_mtk {
 	struct regmap *uwk;
 	u32 uwk_reg_base;
 	u32 uwk_vers;
+
+	/* usb eint wakeup source */
+	int seal_irq;
+	enum xhci_mtk_seal seal_status;
+	struct delayed_work  seal;
+	char   seal_descr[32];	/* "seal" + driver + bus # */
 };
 
 static inline struct xhci_hcd_mtk *hcd_to_mtk(struct usb_hcd *hcd)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
