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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798C7C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:10:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43F0661246
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43F0661246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8XJfla+YteUiaBSj3GDaE6qhhcv0z5c9RNZScui4c0=; b=VQWfOJwiA+UnQk
	g3Qpj78nj/MHq348wNuYYsIYdWhrdT4kcmACcXgsudvIrDhI/F8USAaKau/Ew61hAumMblvx3eGtt
	iWIuBaIBKP41Q4rEkzSTxROsyJ8fAqmr7Hy/Y1EXeCbMHKZH62iNMkOOyjKrCCf8qzPIj/JNF0JMl
	ewv4tiqklO/dfafHC7E5kLlBJgqJUyYQUrHaLppRVDfXIv3TJO7lupwhm55/1bM0JVjEj851Lpvaj
	TnjBzV++B1owtJalYEFvuLGPg+JWD8EzYSpt2HOElj0P6kdbHQEvYXWrfMgOOD4xHEtBth4BwoOHG
	7taz508yQW1VjQYQn+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWoj-006ypY-1u; Tue, 08 Jun 2021 08:10:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWmO-006xiH-9O; Tue, 08 Jun 2021 08:08:09 +0000
X-UUID: 142cd9e01efc439f85f6052f7c6f9d45-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uCzsy6AvKJpWVvF6qwcecws9YuBDSaCk79zzhaLMlio=; 
 b=XcSR03bj+I8ofJque9ul1fZ41IfQr+K4FK5vURN1VLSAfBYug/bSmuEXzfn60H7QrVYn35D7x3NFurkKWjKdrkkEDOSONIt99a3rtwrW0jx72rctD3NW+BJFZTMWIEof/ezTh7WiVUiXSYIye8q3z0eu+F7l1Kw/FxGssZTgYrE=;
X-UUID: 142cd9e01efc439f85f6052f7c6f9d45-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1079473698; Tue, 08 Jun 2021 01:08:04 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 00:58:11 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:58:10 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH 16/23] usb: mtu3: support property role-switch-default-mode
Date: Tue, 8 Jun 2021 15:57:42 +0800
Message-ID: <1623139069-8173-17-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_010808_375744_7376445D 
X-CRM114-Status: GOOD (  17.36  )
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

Support default mode config when use usb-role-switch

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3.h    |  2 ++
 drivers/usb/mtu3/mtu3_dr.c | 24 ++++++++++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index daf2b294ccdf..b56284d28c71 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -196,6 +196,7 @@ struct mtu3_gpd_ring {
 * @id_nb : notifier for iddig(idpin) detection
 * @dr_work : work for drd mode switch, used to avoid sleep in atomic context
 * @desired_role : role desired to switch
+* @default_role : default mode while usb role is USB_ROLE_NONE
 * @role_sw : use USB Role Switch to support dual-role switch, can't use
 *		extcon at the same time, and extcon is deprecated.
 * @role_sw_used : true when the USB Role Switch is used.
@@ -209,6 +210,7 @@ struct otg_switch_mtk {
 	struct notifier_block id_nb;
 	struct work_struct dr_work;
 	enum usb_role desired_role;
+	enum usb_role default_role;
 	struct usb_role_switch *role_sw;
 	bool role_sw_used;
 	bool is_u3_drd;
diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index 318fbc618137..30e7e5fc0f88 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -137,8 +137,12 @@ static void ssusb_mode_sw_work(struct work_struct *work)
 
 	current_role = ssusb->is_host ? USB_ROLE_HOST : USB_ROLE_DEVICE;
 
-	if (desired_role == USB_ROLE_NONE)
+	if (desired_role == USB_ROLE_NONE) {
+		/* the default mode is host as probe does */
 		desired_role = USB_ROLE_HOST;
+		if (otg_sx->default_role == USB_ROLE_DEVICE)
+			desired_role = USB_ROLE_DEVICE;
+	}
 
 	if (current_role == desired_role)
 		return;
@@ -274,17 +278,29 @@ static int ssusb_role_sw_register(struct otg_switch_mtk *otg_sx)
 {
 	struct usb_role_switch_desc role_sx_desc = { 0 };
 	struct ssusb_mtk *ssusb = otg_sx_to_ssusb(otg_sx);
+	struct device *dev = ssusb->dev;
+	enum usb_dr_mode mode;
 
 	if (!otg_sx->role_sw_used)
 		return 0;
 
+	mode = usb_get_role_switch_default_mode(dev);
+	if (mode == USB_DR_MODE_PERIPHERAL)
+		otg_sx->default_role = USB_ROLE_DEVICE;
+	else
+		otg_sx->default_role = USB_ROLE_HOST;
+
 	role_sx_desc.set = ssusb_role_sw_set;
 	role_sx_desc.get = ssusb_role_sw_get;
-	role_sx_desc.fwnode = dev_fwnode(ssusb->dev);
+	role_sx_desc.fwnode = dev_fwnode(dev);
 	role_sx_desc.driver_data = ssusb;
-	otg_sx->role_sw = usb_role_switch_register(ssusb->dev, &role_sx_desc);
+	otg_sx->role_sw = usb_role_switch_register(dev, &role_sx_desc);
+	if (IS_ERR(otg_sx->role_sw))
+		return PTR_ERR(otg_sx->role_sw);
 
-	return PTR_ERR_OR_ZERO(otg_sx->role_sw);
+	ssusb_set_mode(otg_sx, otg_sx->default_role);
+
+	return 0;
 }
 
 int ssusb_otg_switch_init(struct ssusb_mtk *ssusb)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
