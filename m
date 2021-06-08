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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4B4C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:21:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABF7C61246
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABF7C61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKqmihyOwnvMWOj11HLHSgxiNUJ0DpHpI/e03RNcxWw=; b=skpHLsPddQGGKv
	VT0m78ND1v7C7Fo/o9OekqlEGTDRyJgMv7zK2To1l7tGT64p+PkyTh2lFAI69N+vc7m2Jv9yy3kAw
	4+3aUatjYWFe6TALGi5D6e3jGDeVm7tacH2hmVW/d7XpAdJtJ7BdauNqB6gvb5eU/qY4ZmFcmFA8r
	lTajLug9O4bt/3qXWTqt2vuFkOND3fsYHwDninJXjnbRSG/tkBMW3n0PVMTQV+zZWzIvbYalnNLb8
	9j05tOddQgKDAe8uykm2h38NDhTk3QK7UA/D9goynHGj0UHa5nYztttQuUEnDw+yMYa225AGGtrKE
	5JC5nW6f6qvRUiouhXZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWzK-0074r2-JU; Tue, 08 Jun 2021 08:21:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWmY-006xiH-TK; Tue, 08 Jun 2021 08:08:21 +0000
X-UUID: b33dd16b8f8d467fa9c55616e9138fd9-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UVrxPO62VVrdseY1Z7C+8tFfNEl12B55SsGODIGje/o=; 
 b=NpsGyIXChU5Z6JQIUHLKgbNfIhwuxxyRas15SlvMG5e1OQma7FpJkTnXBBpx1XY8ThY8RWKAhroDCyXFA7mDiYMOQTzGNuk3bCVlYVE7lxfJz3d3X7wCoEf+v7NiZj6pLG58/jcTXiBOMjBnlm5/FURQceRbKdpjsaL6t/rQYyY=;
X-UUID: b33dd16b8f8d467fa9c55616e9138fd9-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 837278488; Tue, 08 Jun 2021 01:08:11 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 00:58:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:58:14 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH 21/23] usb: mtu3: support suspend/resume for device mode
Date: Tue, 8 Jun 2021 15:57:47 +0800
Message-ID: <1623139069-8173-22-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_010819_047953_0FBAB388 
X-CRM114-Status: GOOD (  21.24  )
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

Support suspend/resume for device mode if the device is not
connected with a host, otherwise reject to suspend.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h        |  1 +
 drivers/usb/mtu3/mtu3_core.c   | 68 +++++++++++++++++++++++++++++++++-
 drivers/usb/mtu3/mtu3_dr.h     | 14 +++++++
 drivers/usb/mtu3/mtu3_gadget.c |  5 +++
 drivers/usb/mtu3/mtu3_plat.c   | 47 +++++++++++++++++------
 5 files changed, 121 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 1f479a867ed1..ad063fec7f17 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -360,6 +360,7 @@ struct mtu3 {
 	unsigned is_u3_ip:1;
 	unsigned delayed_status:1;
 	unsigned gen2cp:1;
+	unsigned connected:1;
 
 	u8 address;
 	u8 test_mode_nr;
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 648e970d77ba..a800920d38b9 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -380,6 +381,24 @@ void mtu3_stop(struct mtu3 *mtu)
 	mtu3_dev_power_down(mtu);
 }
 
+static void mtu3_dev_suspend(struct mtu3 *mtu)
+{
+	if (!mtu->is_active)
+		return;
+
+	mtu3_intr_disable(mtu);
+	mtu3_dev_power_down(mtu);
+}
+
+static void mtu3_dev_resume(struct mtu3 *mtu)
+{
+	if (!mtu->is_active)
+		return;
+
+	mtu3_dev_power_on(mtu);
+	mtu3_intr_enable(mtu);
+}
+
 /* for non-ep0 */
 int mtu3_config_ep(struct mtu3 *mtu, struct mtu3_ep *mep,
 			int interval, int burst, int mult)
@@ -700,11 +719,15 @@ static irqreturn_t mtu3_link_isr(struct mtu3 *mtu)
 	mtu->g.speed = udev_speed;
 	mtu->g.ep0->maxpacket = maxpkt;
 	mtu->ep0_state = MU3D_EP0_STATE_SETUP;
+	mtu->connected = !!(udev_speed != USB_SPEED_UNKNOWN);
 
-	if (udev_speed == USB_SPEED_UNKNOWN)
+	if (udev_speed == USB_SPEED_UNKNOWN) {
 		mtu3_gadget_disconnect(mtu);
-	else
+		pm_runtime_put(mtu->dev);
+	} else {
+		pm_runtime_get(mtu->dev);
 		mtu3_ep0_setup(mtu);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -984,3 +1007,44 @@ void ssusb_gadget_exit(struct ssusb_mtk *ssusb)
 	device_init_wakeup(ssusb->dev, false);
 	mtu3_hw_exit(mtu);
 }
+
+int ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg)
+{
+	struct mtu3 *mtu = ssusb->u3d;
+	void __iomem *ibase = mtu->ippc_base;
+	u32 value;
+	int ret = 0;
+
+	if (!mtu->gadget_driver)
+		return 0;
+
+	if (mtu->connected)
+		return -EBUSY;
+
+	mtu3_dev_suspend(mtu);
+	synchronize_irq(mtu->irq);
+
+	/* wait for ip to sleep */
+	if (mtu->is_active && mtu->softconnect) {
+		ret = readl_poll_timeout(ibase + U3D_SSUSB_IP_PW_STS1,
+				value, (value & SSUSB_IP_SLEEP_STS), 100, 100000);
+		if (ret) {
+			dev_err(mtu->dev, "ip sleep failed!!!\n");
+			ret = -EBUSY;
+		}
+	}
+
+	return ret;
+}
+
+int ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg)
+{
+	struct mtu3 *mtu = ssusb->u3d;
+
+	if (!mtu->gadget_driver)
+		return 0;
+
+	mtu3_dev_resume(mtu);
+
+	return 0;
+}
diff --git a/drivers/usb/mtu3/mtu3_dr.h b/drivers/usb/mtu3/mtu3_dr.h
index 70dbf4706138..5286f9f5ee18 100644
--- a/drivers/usb/mtu3/mtu3_dr.h
+++ b/drivers/usb/mtu3/mtu3_dr.h
@@ -57,6 +57,8 @@ static inline void ssusb_wakeup_set(struct ssusb_mtk *ssusb, bool enable)
 #if IS_ENABLED(CONFIG_USB_MTU3_GADGET) || IS_ENABLED(CONFIG_USB_MTU3_DUAL_ROLE)
 int ssusb_gadget_init(struct ssusb_mtk *ssusb);
 void ssusb_gadget_exit(struct ssusb_mtk *ssusb);
+int ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg);
+int ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg);
 #else
 static inline int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 {
@@ -65,6 +67,18 @@ static inline int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 
 static inline void ssusb_gadget_exit(struct ssusb_mtk *ssusb)
 {}
+
+static inline int
+ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg)
+{
+	return 0;
+}
+
+static inline int
+ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg)
+{
+	return 0;
+}
 #endif
 
 
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 5e21ba05ebf0..7b54631ca335 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -469,6 +469,8 @@ static int mtu3_gadget_pullup(struct usb_gadget *gadget, int is_on)
 	dev_dbg(mtu->dev, "%s (%s) for %sactive device\n", __func__,
 		is_on ? "on" : "off", mtu->is_active ? "" : "in");
 
+	pm_runtime_get_sync(mtu->dev);
+
 	/* we'd rather not pullup unless the device is active. */
 	spin_lock_irqsave(&mtu->lock, flags);
 
@@ -482,6 +484,7 @@ static int mtu3_gadget_pullup(struct usb_gadget *gadget, int is_on)
 	}
 
 	spin_unlock_irqrestore(&mtu->lock, flags);
+	pm_runtime_put(mtu->dev);
 
 	return 0;
 }
@@ -499,6 +502,7 @@ static int mtu3_gadget_start(struct usb_gadget *gadget,
 	}
 
 	dev_dbg(mtu->dev, "bind driver %s\n", driver->function);
+	pm_runtime_get_sync(mtu->dev);
 
 	spin_lock_irqsave(&mtu->lock, flags);
 
@@ -509,6 +513,7 @@ static int mtu3_gadget_start(struct usb_gadget *gadget,
 		mtu3_start(mtu);
 
 	spin_unlock_irqrestore(&mtu->lock, flags);
+	pm_runtime_put(mtu->dev);
 
 	return 0;
 }
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 9f8f2759b08e..4c50b3663b66 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -479,21 +479,32 @@ static int mtu3_remove(struct platform_device *pdev)
 	return 0;
 }
 
-/*
- * when support dual-role mode, we reject suspend when
- * it works as device mode;
- */
 static int mtu3_suspend_common(struct device *dev, pm_message_t msg)
 {
 	struct ssusb_mtk *ssusb = dev_get_drvdata(dev);
+	int ret = 0;
 
 	dev_dbg(dev, "%s\n", __func__);
 
-	/* REVISIT: disconnect it for only device mode? */
-	if (!ssusb->is_host)
-		return 0;
+	switch (ssusb->dr_mode) {
+	case USB_DR_MODE_PERIPHERAL:
+		ret = ssusb_gadget_suspend(ssusb, msg);
+		if (ret)
+			return ret;
 
-	ssusb_host_suspend(ssusb);
+		break;
+	case USB_DR_MODE_HOST:
+		ssusb_host_suspend(ssusb);
+		break;
+	case USB_DR_MODE_OTG:
+		if (!ssusb->is_host)
+			return 0;
+
+		ssusb_host_suspend(ssusb);
+		break;
+	default:
+		return -EINVAL;
+	}
 	ssusb_phy_power_off(ssusb);
 	ssusb_clks_disable(ssusb);
 	ssusb_wakeup_set(ssusb, true);
@@ -508,9 +519,6 @@ static int mtu3_resume_common(struct device *dev, pm_message_t msg)
 
 	dev_dbg(dev, "%s\n", __func__);
 
-	if (!ssusb->is_host)
-		return 0;
-
 	ssusb_wakeup_set(ssusb, false);
 	ret = ssusb_clks_enable(ssusb);
 	if (ret)
@@ -520,7 +528,22 @@ static int mtu3_resume_common(struct device *dev, pm_message_t msg)
 	if (ret)
 		goto phy_err;
 
-	ssusb_host_resume(ssusb, false);
+	switch (ssusb->dr_mode) {
+	case USB_DR_MODE_PERIPHERAL:
+		ssusb_gadget_resume(ssusb, msg);
+		break;
+	case USB_DR_MODE_HOST:
+		ssusb_host_resume(ssusb, false);
+		break;
+	case USB_DR_MODE_OTG:
+		if (!ssusb->is_host)
+			return 0;
+
+		ssusb_host_resume(ssusb, true);
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	return 0;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
