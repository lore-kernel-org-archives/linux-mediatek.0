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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD2DC47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:13:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 185A26127A
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 185A26127A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t53Yp1RT6Pq3pj2Yj5KrDYYGWoKM09L8VA4//Eo36Ws=; b=mDuKLDTAGnqdVV
	6OFwFShzHfo6BHe+p+GYIvJzNWgJmTVjRvPvGDY/eZADWU2v3nhyjdchRM/Enlv1w7QCvnFX0ZxTK
	L4WjRA7Mvz9jHX2Xy/SYWPFxJkV+TNqWDIPcGqHnHndi7VmbbimYdngNpHsK0NA18Qva6WbnVzM2o
	pUsNoOXSDUIJ4BNArf8YCIrQV56sGHo5pfdZIGDU1BF1D68xA74kP/XxXomTeGphJzKTd1Ns6GflA
	Gh7fX2OFhq3BJgBbRa4v7Cj9zEwrg8Vuj1ZOdQqFTy6IcTFjyT3zsGW7gS84ooAkA1pqMips8g2N6
	11xBMpO+8n3GhWXv3ELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWqt-0070QW-7q; Tue, 08 Jun 2021 08:12:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWmP-006xiH-SH; Tue, 08 Jun 2021 08:08:11 +0000
X-UUID: 94c3e07321584e8a8a1f5ac535c91adf-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=S9d++EdEikmWtJufXLh2CaRFaltMx9f4Hvy+KtBQGIE=; 
 b=Dlmz7Ec3t6ay3PLnEl7g2iD6nO924mUS+AWRpEQb4gZefnvgtzeIfd7/eZn2NYL7cJ9H58Y/Wt4PSNMDnikJb9g4LdRSJ2C+x2Uur1t/iEXbb+2hzxn1E8Rk7QY1aRKE1LZt4nP2ob8uvmGYGMhuh14HbmhTLdFU96Mp7SYAWNg=;
X-UUID: 94c3e07321584e8a8a1f5ac535c91adf-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 474803605; Tue, 08 Jun 2021 01:08:04 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 00:58:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:58:05 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH 10/23] usb: mtu3: rebuild role switch flow of extcon
Date: Tue, 8 Jun 2021 15:57:36 +0800
Message-ID: <1623139069-8173-11-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_010809_994449_49B999A5 
X-CRM114-Status: GOOD (  19.82  )
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

This is a preparation patch to plan to use the same work to
handle role switch for all three supported ways.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h    |  9 +++---
 drivers/usb/mtu3/mtu3_dr.c | 61 +++++++++++++++++++++-----------------
 2 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index df2856782426..daf2b294ccdf 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -21,6 +21,7 @@
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 #include <linux/usb/otg.h>
+#include <linux/usb/role.h>
 
 struct mtu3;
 struct mtu3_ep;
@@ -193,8 +194,8 @@ struct mtu3_gpd_ring {
 * @vbus: vbus 5V used by host mode
 * @edev: external connector used to detect vbus and iddig changes
 * @id_nb : notifier for iddig(idpin) detection
-* @id_work : work of iddig detection notifier
-* @id_event : event of iddig detecion notifier
+* @dr_work : work for drd mode switch, used to avoid sleep in atomic context
+* @desired_role : role desired to switch
 * @role_sw : use USB Role Switch to support dual-role switch, can't use
 *		extcon at the same time, and extcon is deprecated.
 * @role_sw_used : true when the USB Role Switch is used.
@@ -206,8 +207,8 @@ struct otg_switch_mtk {
 	struct regulator *vbus;
 	struct extcon_dev *edev;
 	struct notifier_block id_nb;
-	struct work_struct id_work;
-	unsigned long id_event;
+	struct work_struct dr_work;
+	enum usb_role desired_role;
 	struct usb_role_switch *role_sw;
 	bool role_sw_used;
 	bool is_u3_drd;
diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index 7eabce9d5f3b..1cf56f129b15 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -7,8 +7,6 @@
  * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
  */
 
-#include <linux/usb/role.h>
-
 #include "mtu3.h"
 #include "mtu3_dr.h"
 #include "mtu3_debug.h"
@@ -124,16 +122,28 @@ int ssusb_set_vbus(struct otg_switch_mtk *otg_sx, int is_on)
 	return 0;
 }
 
-static void ssusb_set_role(struct otg_switch_mtk *otg_sx, enum usb_role role)
+static void ssusb_mode_sw_work(struct work_struct *work)
 {
+	struct otg_switch_mtk *otg_sx =
+		container_of(work, struct otg_switch_mtk, dr_work);
 	struct ssusb_mtk *ssusb =
 		container_of(otg_sx, struct ssusb_mtk, otg_switch);
 	struct mtu3 *mtu = ssusb->u3d;
+	enum usb_role desired_role = otg_sx->desired_role;
+	enum usb_role current_role;
+
+	current_role = ssusb->is_host ? USB_ROLE_HOST : USB_ROLE_DEVICE;
+
+	if (desired_role == USB_ROLE_NONE)
+		desired_role = USB_ROLE_HOST;
 
-	dev_dbg(ssusb->dev, "set role : %d\n", role);
-	mtu3_dbg_trace(ssusb->dev, "set role : %d", role);
+	if (current_role == desired_role)
+		return;
+
+	dev_dbg(ssusb->dev, "set role : %s\n", usb_role_string(desired_role));
+	mtu3_dbg_trace(ssusb->dev, "set role : %s", usb_role_string(desired_role));
 
-	switch (role) {
+	switch (desired_role) {
 	case USB_ROLE_HOST:
 		mtu3_stop(mtu);
 		switch_port_to_host(ssusb);
@@ -147,35 +157,30 @@ static void ssusb_set_role(struct otg_switch_mtk *otg_sx, enum usb_role role)
 		mtu3_start(mtu);
 		break;
 	case USB_ROLE_NONE:
-		break;
 	default:
 		dev_err(ssusb->dev, "invalid role\n");
 	}
 }
 
-static void ssusb_id_work(struct work_struct *work)
+static void ssusb_set_mode(struct otg_switch_mtk *otg_sx, enum usb_role role)
 {
-	struct otg_switch_mtk *otg_sx =
-		container_of(work, struct otg_switch_mtk, id_work);
+	struct ssusb_mtk *ssusb =
+		container_of(otg_sx, struct ssusb_mtk, otg_switch);
 
-	if (otg_sx->id_event)
-		ssusb_set_role(otg_sx, USB_ROLE_HOST);
-	else
-		ssusb_set_role(otg_sx, USB_ROLE_DEVICE);
+	if (ssusb->dr_mode != USB_DR_MODE_OTG)
+		return;
+
+	otg_sx->desired_role = role;
+	queue_work(system_freezable_wq, &otg_sx->dr_work);
 }
 
-/*
- * @ssusb_id_notifier is called in atomic context, but ssusb_set_role()
- * may sleep, so use work queue here
- */
 static int ssusb_id_notifier(struct notifier_block *nb,
 	unsigned long event, void *ptr)
 {
 	struct otg_switch_mtk *otg_sx =
 		container_of(nb, struct otg_switch_mtk, id_nb);
 
-	otg_sx->id_event = event;
-	schedule_work(&otg_sx->id_work);
+	ssusb_set_mode(otg_sx, event ? USB_ROLE_HOST : USB_ROLE_DEVICE);
 
 	return NOTIFY_DONE;
 }
@@ -199,12 +204,12 @@ static int ssusb_extcon_register(struct otg_switch_mtk *otg_sx)
 		return ret;
 	}
 
-	dev_dbg(ssusb->dev, "EXTCON_USB_HOST: %d\n",
-		extcon_get_state(edev, EXTCON_USB_HOST));
+	ret = extcon_get_state(edev, EXTCON_USB_HOST);
+	dev_dbg(ssusb->dev, "EXTCON_USB_HOST: %d\n", ret);
 
 	/* default as host, switch to device mode if needed */
-	if (extcon_get_state(edev, EXTCON_USB_HOST) == false)
-		ssusb_set_role(otg_sx, USB_ROLE_DEVICE);
+	if (!ret)
+		ssusb_set_mode(otg_sx, USB_ROLE_DEVICE);
 
 	return 0;
 }
@@ -221,10 +226,10 @@ void ssusb_mode_switch(struct ssusb_mtk *ssusb, int to_host)
 
 	if (to_host) {
 		ssusb_set_force_mode(ssusb, MTU3_DR_FORCE_HOST);
-		ssusb_set_role(otg_sx, USB_ROLE_HOST);
+		ssusb_set_mode(otg_sx, USB_ROLE_HOST);
 	} else {
 		ssusb_set_force_mode(ssusb, MTU3_DR_FORCE_DEVICE);
-		ssusb_set_role(otg_sx, USB_ROLE_DEVICE);
+		ssusb_set_mode(otg_sx, USB_ROLE_DEVICE);
 	}
 }
 
@@ -298,7 +303,7 @@ int ssusb_otg_switch_init(struct ssusb_mtk *ssusb)
 	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
 	int ret = 0;
 
-	INIT_WORK(&otg_sx->id_work, ssusb_id_work);
+	INIT_WORK(&otg_sx->dr_work, ssusb_mode_sw_work);
 
 	if (otg_sx->manual_drd_enabled)
 		ssusb_dr_debugfs_init(ssusb);
@@ -314,6 +319,6 @@ void ssusb_otg_switch_exit(struct ssusb_mtk *ssusb)
 {
 	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
 
-	cancel_work_sync(&otg_sx->id_work);
+	cancel_work_sync(&otg_sx->dr_work);
 	usb_role_switch_unregister(otg_sx->role_sw);
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
