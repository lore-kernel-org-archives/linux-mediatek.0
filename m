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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8788C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:19:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE86B6124B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE86B6124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9ZMbCK5gKRc3VU5ysElKwzdfkvJ62PHSCMoJrQlkfw=; b=FH11/3XJ1jwcQ+
	ZaUTRfoFjdzKxDUpW3w7L/sTRj5QMSZo8klXuHFRWiws2VAtV4T9Y4TiF6tXdWqUSpMBCM5FjVHFA
	eUFAJcIdDjy6gTT8cp8+WXssdITJDoStun6slDuaP/roeaYh1wvd7ivifmaJ+ZZg+qmeWQw1prgC+
	aqKR2sxr5ZXH+lySjm2clVaW/196f+6Kuw5gHM5znKM2bvfaj3yBvXRqceL95Du1YfvwKy+w3gc8a
	Sln41GAHhcHF8M7Dnv9NhO32+nW9ZFF5zEujcMFmsqiefsJ/i6tE4HqKv+lNWV1kRUQwtfYKbD3ri
	HmfV5qGoHlsBFw73okVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWx0-0073qW-2s; Tue, 08 Jun 2021 08:19:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWmT-006xiH-AM; Tue, 08 Jun 2021 08:08:17 +0000
X-UUID: 56d1844a3e6d4d03b44dd1c15e63acef-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zVg3bYMbSwpXzYDQCX460BuiUaY66LAEE4kHc5H9T3U=; 
 b=aq8vwVRPJLYXwUlTYiHzY7iS1zR0wXl5bYWbjLexAD6SAppHzqU57AWcxANr044SnTaR8jsK8Emc6KL8zOpqswK1R0zwX+WQHff6d3waYKSR2XOwz3BMarQOHAnzjMy8pHa+hWn46hFiPbbzm1ciId1qNDao1mL9xGBI9fUxOz0=;
X-UUID: 56d1844a3e6d4d03b44dd1c15e63acef-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 307078087; Tue, 08 Jun 2021 01:08:11 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 00:58:08 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:58:06 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH 11/23] usb: mtu3: add helper to get pointer of ssusb_mtk struct
Date: Tue, 8 Jun 2021 15:57:37 +0800
Message-ID: <1623139069-8173-12-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_010813_425189_6C73887D 
X-CRM114-Status: GOOD (  13.45  )
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

Add a helper to get pointer of ssusb_mtk struct from the pointer
of otg_switch_mtk struct.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_dr.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index 1cf56f129b15..486d26a366b8 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -14,6 +14,11 @@
 #define USB2_PORT 2
 #define USB3_PORT 3
 
+static inline struct ssusb_mtk *otg_sx_to_ssusb(struct otg_switch_mtk *otg_sx)
+{
+	return container_of(otg_sx, struct ssusb_mtk, otg_switch);
+}
+
 static void toggle_opstate(struct ssusb_mtk *ssusb)
 {
 	if (!ssusb->otg_switch.is_u3_drd) {
@@ -98,8 +103,7 @@ static void switch_port_to_device(struct ssusb_mtk *ssusb)
 
 int ssusb_set_vbus(struct otg_switch_mtk *otg_sx, int is_on)
 {
-	struct ssusb_mtk *ssusb =
-		container_of(otg_sx, struct ssusb_mtk, otg_switch);
+	struct ssusb_mtk *ssusb = otg_sx_to_ssusb(otg_sx);
 	struct regulator *vbus = otg_sx->vbus;
 	int ret;
 
@@ -126,8 +130,7 @@ static void ssusb_mode_sw_work(struct work_struct *work)
 {
 	struct otg_switch_mtk *otg_sx =
 		container_of(work, struct otg_switch_mtk, dr_work);
-	struct ssusb_mtk *ssusb =
-		container_of(otg_sx, struct ssusb_mtk, otg_switch);
+	struct ssusb_mtk *ssusb = otg_sx_to_ssusb(otg_sx);
 	struct mtu3 *mtu = ssusb->u3d;
 	enum usb_role desired_role = otg_sx->desired_role;
 	enum usb_role current_role;
@@ -164,8 +167,7 @@ static void ssusb_mode_sw_work(struct work_struct *work)
 
 static void ssusb_set_mode(struct otg_switch_mtk *otg_sx, enum usb_role role)
 {
-	struct ssusb_mtk *ssusb =
-		container_of(otg_sx, struct ssusb_mtk, otg_switch);
+	struct ssusb_mtk *ssusb = otg_sx_to_ssusb(otg_sx);
 
 	if (ssusb->dr_mode != USB_DR_MODE_OTG)
 		return;
@@ -187,8 +189,7 @@ static int ssusb_id_notifier(struct notifier_block *nb,
 
 static int ssusb_extcon_register(struct otg_switch_mtk *otg_sx)
 {
-	struct ssusb_mtk *ssusb =
-		container_of(otg_sx, struct ssusb_mtk, otg_switch);
+	struct ssusb_mtk *ssusb = otg_sx_to_ssusb(otg_sx);
 	struct extcon_dev *edev = otg_sx->edev;
 	int ret;
 
@@ -283,8 +284,7 @@ static enum usb_role ssusb_role_sw_get(struct usb_role_switch *sw)
 static int ssusb_role_sw_register(struct otg_switch_mtk *otg_sx)
 {
 	struct usb_role_switch_desc role_sx_desc = { 0 };
-	struct ssusb_mtk *ssusb =
-		container_of(otg_sx, struct ssusb_mtk, otg_switch);
+	struct ssusb_mtk *ssusb = otg_sx_to_ssusb(otg_sx);
 
 	if (!otg_sx->role_sw_used)
 		return 0;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
