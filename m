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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A52AC4743D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 07:59:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 601F961287
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 07:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 601F961287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pe3i9jw7fm9iGMGgqTgm1/S94sGL/gXrBnUKHZK5fKs=; b=IL6QlFSFb0wqnp
	KYpNiv0kJUIQlp6QBdsRKo17f44HZIMkd0bRB4FhcWW1fOpNCvalhK+YeKflWoYh7kn1GdLFyooR3
	1QndihRTYcZZ7uy8cK1CumJ781SAeI9B4K41tDweiy1PNGLAqwVWahy5ZFbbCCGLhUQSJksFzfflV
	A69UbNYLx19DbHpFlIlv3I/axbiI4i8htJqOmSlbkhgI47GCa9+dIcV6eepRPbBKiooX/2zoSSQyC
	iAGA0HUt83XqJlmyywK+Wk9pnKxQkEsSdDNNmv/dzzcYj5t4d249hlWGtFsERu0FKXCoZcFvgJ8HQ
	F/rh1svael47wLlYVjbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWdw-006u9O-JI; Tue, 08 Jun 2021 07:59:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWck-006tXm-DC; Tue, 08 Jun 2021 07:58:12 +0000
X-UUID: 3ab5d879dbaf4482b7d625484e218848-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6E/V1pqdmfvvIX8d4x5nuUtzLctZ+c4gY2sbDCZ0cco=; 
 b=rkJPwjFHyelcUjzzb3qxLolr5DVfSdaiBAcGJOvPV5j3nz/onOYbjmO6vt8e36btLzivxTRdtuaA2f9vi9zBakVXrF0FLJBPqU/HiLCv1V4V5FfU+ZiKtSXZztp3yKgss5m/KyXq/3FGGnGQKmEz7oC0/w9ekCxSYUuO/JmUM7M=;
X-UUID: 3ab5d879dbaf4482b7d625484e218848-20210608
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 356529443; Tue, 08 Jun 2021 00:58:07 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 00:58:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:58:03 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH 08/23] usb: mtu3: drop support vbus detection
Date: Tue, 8 Jun 2021 15:57:34 +0800
Message-ID: <1623139069-8173-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_005810_480013_1C7A4936 
X-CRM114-Status: GOOD (  16.60  )
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

Until now it's never used on any platform, and will not used
later.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h    |  7 ------
 drivers/usb/mtu3/mtu3_dr.c | 50 ++------------------------------------
 2 files changed, 2 insertions(+), 55 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 531b9c78d7c3..df2856782426 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -192,10 +192,6 @@ struct mtu3_gpd_ring {
 /**
 * @vbus: vbus 5V used by host mode
 * @edev: external connector used to detect vbus and iddig changes
-* @vbus_nb: notifier for vbus detection
-* @vbus_work : work of vbus detection notifier, used to avoid sleep in
-*		notifier callback which is atomic context
-* @vbus_event : event of vbus detecion notifier
 * @id_nb : notifier for iddig(idpin) detection
 * @id_work : work of iddig detection notifier
 * @id_event : event of iddig detecion notifier
@@ -209,9 +205,6 @@ struct mtu3_gpd_ring {
 struct otg_switch_mtk {
 	struct regulator *vbus;
 	struct extcon_dev *edev;
-	struct notifier_block vbus_nb;
-	struct work_struct vbus_work;
-	unsigned long vbus_event;
 	struct notifier_block id_nb;
 	struct work_struct id_work;
 	unsigned long id_event;
diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index 82301001f2f6..89ad448f2b2d 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -147,10 +147,6 @@ int ssusb_set_vbus(struct otg_switch_mtk *otg_sx, int is_on)
 	return 0;
 }
 
-/*
- * switch to host: -> MTU3_VBUS_OFF --> MTU3_ID_GROUND
- * switch to device: -> MTU3_ID_FLOAT --> MTU3_VBUS_VALID
- */
 static void ssusb_set_mailbox(struct otg_switch_mtk *otg_sx,
 	enum mtu3_vbus_id_state status)
 {
@@ -163,6 +159,7 @@ static void ssusb_set_mailbox(struct otg_switch_mtk *otg_sx,
 
 	switch (status) {
 	case MTU3_ID_GROUND:
+		mtu3_stop(mtu);
 		switch_port_to_host(ssusb);
 		ssusb_set_vbus(otg_sx, 1);
 		ssusb->is_host = true;
@@ -171,11 +168,6 @@ static void ssusb_set_mailbox(struct otg_switch_mtk *otg_sx,
 		ssusb->is_host = false;
 		ssusb_set_vbus(otg_sx, 0);
 		switch_port_to_device(ssusb);
-		break;
-	case MTU3_VBUS_OFF:
-		mtu3_stop(mtu);
-		break;
-	case MTU3_VBUS_VALID:
 		mtu3_start(mtu);
 		break;
 	default:
@@ -194,17 +186,6 @@ static void ssusb_id_work(struct work_struct *work)
 		ssusb_set_mailbox(otg_sx, MTU3_ID_FLOAT);
 }
 
-static void ssusb_vbus_work(struct work_struct *work)
-{
-	struct otg_switch_mtk *otg_sx =
-		container_of(work, struct otg_switch_mtk, vbus_work);
-
-	if (otg_sx->vbus_event)
-		ssusb_set_mailbox(otg_sx, MTU3_VBUS_VALID);
-	else
-		ssusb_set_mailbox(otg_sx, MTU3_VBUS_OFF);
-}
-
 /*
  * @ssusb_id_notifier is called in atomic context, but @ssusb_set_mailbox
  * may sleep, so use work queue here
@@ -221,18 +202,6 @@ static int ssusb_id_notifier(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
-static int ssusb_vbus_notifier(struct notifier_block *nb,
-	unsigned long event, void *ptr)
-{
-	struct otg_switch_mtk *otg_sx =
-		container_of(nb, struct otg_switch_mtk, vbus_nb);
-
-	otg_sx->vbus_event = event;
-	schedule_work(&otg_sx->vbus_work);
-
-	return NOTIFY_DONE;
-}
-
 static int ssusb_extcon_register(struct otg_switch_mtk *otg_sx)
 {
 	struct ssusb_mtk *ssusb =
@@ -244,14 +213,6 @@ static int ssusb_extcon_register(struct otg_switch_mtk *otg_sx)
 	if (!edev)
 		return 0;
 
-	otg_sx->vbus_nb.notifier_call = ssusb_vbus_notifier;
-	ret = devm_extcon_register_notifier(ssusb->dev, edev, EXTCON_USB,
-					&otg_sx->vbus_nb);
-	if (ret < 0) {
-		dev_err(ssusb->dev, "failed to register notifier for USB\n");
-		return ret;
-	}
-
 	otg_sx->id_nb.notifier_call = ssusb_id_notifier;
 	ret = devm_extcon_register_notifier(ssusb->dev, edev, EXTCON_USB_HOST,
 					&otg_sx->id_nb);
@@ -260,15 +221,12 @@ static int ssusb_extcon_register(struct otg_switch_mtk *otg_sx)
 		return ret;
 	}
 
-	dev_dbg(ssusb->dev, "EXTCON_USB: %d, EXTCON_USB_HOST: %d\n",
-		extcon_get_state(edev, EXTCON_USB),
+	dev_dbg(ssusb->dev, "EXTCON_USB_HOST: %d\n",
 		extcon_get_state(edev, EXTCON_USB_HOST));
 
 	/* default as host, switch to device mode if needed */
 	if (extcon_get_state(edev, EXTCON_USB_HOST) == false)
 		ssusb_set_mailbox(otg_sx, MTU3_ID_FLOAT);
-	if (extcon_get_state(edev, EXTCON_USB) == true)
-		ssusb_set_mailbox(otg_sx, MTU3_VBUS_VALID);
 
 	return 0;
 }
@@ -285,12 +243,10 @@ void ssusb_mode_switch(struct ssusb_mtk *ssusb, int to_host)
 
 	if (to_host) {
 		ssusb_set_force_mode(ssusb, MTU3_DR_FORCE_HOST);
-		ssusb_set_mailbox(otg_sx, MTU3_VBUS_OFF);
 		ssusb_set_mailbox(otg_sx, MTU3_ID_GROUND);
 	} else {
 		ssusb_set_force_mode(ssusb, MTU3_DR_FORCE_DEVICE);
 		ssusb_set_mailbox(otg_sx, MTU3_ID_FLOAT);
-		ssusb_set_mailbox(otg_sx, MTU3_VBUS_VALID);
 	}
 }
 
@@ -365,7 +321,6 @@ int ssusb_otg_switch_init(struct ssusb_mtk *ssusb)
 	int ret = 0;
 
 	INIT_WORK(&otg_sx->id_work, ssusb_id_work);
-	INIT_WORK(&otg_sx->vbus_work, ssusb_vbus_work);
 
 	if (otg_sx->manual_drd_enabled)
 		ssusb_dr_debugfs_init(ssusb);
@@ -382,6 +337,5 @@ void ssusb_otg_switch_exit(struct ssusb_mtk *ssusb)
 	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
 
 	cancel_work_sync(&otg_sx->id_work);
-	cancel_work_sync(&otg_sx->vbus_work);
 	usb_role_switch_unregister(otg_sx->role_sw);
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
