Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066E8CCA481
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j7sU4gDIYph2KPsVscr91HsJM5uIS9QH9unPQVmwu14=; b=DYWTB2XOEI8o+E/lkEI3pn6bef
	fmBxjZW/cQQ2Y5NbzdvkJi7FlGzu/rQxr4yuLVQS1PaRzCFIwOc1BP6GlXW1NE3Ahe7FYX0qvUCWq
	Slpms0EaQTIgLAeTpQb51VNOtGCVo9kKciz/5QYl9iTiv9IKXwqca6nrhUgcgM2JQDeKVy/rW2S+3
	1Tpuo1OJEyrYO6kwJffFx8VynBmeT3c1nOMHxkc0+e3m2cBm0IEM/bXeu5GUPTRcPfbTp9o3nw3ko
	AjnFopHbkqxxWg5Fetuev2Nkhly44gs4dwsE1Fom/OFhbhOee/eEjHkWOGFaP6yg6MZk2h2Z3pFG5
	XwHpyJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wJB-009StB-4d; Wed, 22 Jun 2022 09:05:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wIs-009Skx-Fe; Wed, 22 Jun 2022 09:05:40 +0000
X-UUID: 055f02f6254f4f12b0a7b0e7c47068c7-20220622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:dae9de69-2536-4dfd-9a2b-dcba9d433732,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:e34e2a38-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 055f02f6254f4f12b0a7b0e7c47068c7-20220622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1339094607; Wed, 22 Jun 2022 02:05:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 01:58:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 16:58:00 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 16:57:59 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Pavel Hofman <pavel.hofman@ivitera.com>, "Julian
 Scheel" <julian@jusst.de>, xin lin <xin.lin@mediatek.com>, Yunhao Tian
	<t123yh.xyz@gmail.com>, Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Eddie Hung <eddie.hung@mediatek.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH] usb: gadget: f_uac1: add IAD descriptor
Date: Wed, 22 Jun 2022 16:57:57 +0800
Message-ID: <20220622085757.23437-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_020538_579786_929E34C5 
X-CRM114-Status: GOOD (  13.26  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: xin lin <xin.lin@mediatek.com>

Win10 can not enumerate composite device of UVC+UAC1+ADB without IAD descriptor
in uac1.0, so add it.

Signed-off-by: xin lin <xin.lin@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/gadget/function/f_uac1.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 6f0e1d803dc2..8390207bc513 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -71,6 +71,17 @@ static inline struct f_uac1_opts *g_audio_to_uac1_opts(struct g_audio *audio)
  * ALSA_Playback -> IT_3 -> OT_4 -> USB-IN
  */
 
+static struct usb_interface_assoc_descriptor iad_desc = {
+	.bLength = sizeof(iad_desc),
+	.bDescriptorType = USB_DT_INTERFACE_ASSOCIATION,
+
+	.bFirstInterface = 0,
+	.bInterfaceCount = 3,
+	.bFunctionClass = USB_CLASS_AUDIO,
+	.bFunctionSubClass = 0,
+	.bFunctionProtocol = UAC_VERSION_1,
+};
+
 /* B.3.1  Standard AC Interface Descriptor */
 static struct usb_interface_descriptor ac_interface_desc = {
 	.bLength =		USB_DT_INTERFACE_SIZE,
@@ -259,6 +270,7 @@ static struct uac_iso_endpoint_descriptor as_iso_in_desc = {
 };
 
 static struct usb_descriptor_header *f_audio_desc[] = {
+	(struct usb_descriptor_header *)&iad_desc,
 	(struct usb_descriptor_header *)&ac_interface_desc,
 	(struct usb_descriptor_header *)&ac_header_desc,
 
@@ -293,6 +305,7 @@ static struct usb_descriptor_header *f_audio_desc[] = {
 };
 
 enum {
+	STR_ASSOC,
 	STR_AC_IF,
 	STR_USB_OUT_IT,
 	STR_USB_OUT_IT_CH_NAMES,
@@ -310,6 +323,7 @@ enum {
 
 static struct usb_string strings_uac1[] = {
 	/* [STR_AC_IF].s = DYNAMIC, */
+	[STR_ASSOC].s = "Source/Sink",
 	[STR_USB_OUT_IT].s = "Playback Input terminal",
 	[STR_USB_OUT_IT_CH_NAMES].s = "Playback Channels",
 	[STR_IO_OUT_OT].s = "Playback Output terminal",
@@ -1058,6 +1072,7 @@ static void setup_descriptor(struct f_uac1_opts *opts)
 	as_out_header_desc.bTerminalLink = usb_out_it_desc.bTerminalID;
 	as_in_header_desc.bTerminalLink = usb_in_ot_desc.bTerminalID;
 
+	iad_desc.bInterfaceCount = 1;
 	ac_header_desc->wTotalLength = cpu_to_le16(ac_header_desc->bLength);
 
 	if (EPIN_EN(opts)) {
@@ -1068,6 +1083,7 @@ static void setup_descriptor(struct f_uac1_opts *opts)
 		if (FUIN_EN(opts))
 			len += in_feature_unit_desc->bLength;
 		ac_header_desc->wTotalLength = cpu_to_le16(len);
+		iad_desc.bInterfaceCount++;
 	}
 	if (EPOUT_EN(opts)) {
 		u16 len = le16_to_cpu(ac_header_desc->wTotalLength);
@@ -1077,9 +1093,11 @@ static void setup_descriptor(struct f_uac1_opts *opts)
 		if (FUOUT_EN(opts))
 			len += out_feature_unit_desc->bLength;
 		ac_header_desc->wTotalLength = cpu_to_le16(len);
+		iad_desc.bInterfaceCount++;
 	}
 
 	i = 0;
+	f_audio_desc[i++] = USBDHDR(&iad_desc);
 	f_audio_desc[i++] = USBDHDR(&ac_interface_desc);
 	f_audio_desc[i++] = USBDHDR(ac_header_desc);
 
@@ -1217,6 +1235,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 		}
 	}
 
+	iad_desc.iFunction = us[STR_ASSOC].id;
 	ac_interface_desc.iInterface = us[STR_AC_IF].id;
 	usb_out_it_desc.iTerminal = us[STR_USB_OUT_IT].id;
 	usb_out_it_desc.iChannelNames = us[STR_USB_OUT_IT_CH_NAMES].id;
@@ -1302,6 +1321,8 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	status = usb_interface_id(c, f);
 	if (status < 0)
 		goto err_free_fu;
+
+	iad_desc.bFirstInterface = status;
 	ac_interface_desc.bInterfaceNumber = status;
 	uac1->ac_intf = status;
 	uac1->ac_alt = 0;
-- 
2.18.0


