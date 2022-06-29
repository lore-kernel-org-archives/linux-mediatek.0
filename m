Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618D6C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 02:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iU423iLzkuHk2kchp+fAn2j5VZQ1kMd5PphhgBJTFlA=; b=nOtw8KsbVOLWQQclLxy4lt8D5/
	OmogsNPGMxIPKRaplRt7fb7y8MF4M+L2zBwqhbmurcPiTIwy5F15nyopC3nC22s3YUGKz/fDKUnRL
	umwJq3qIg3rC3bOfUy78Hk+iSQS3nJO+9DhEqkwoa7b82LHWxGEj4baAAHT2v9sEe0ZOWczr43L8x
	1erYNcrJjU8ToGn0USklzg1KKEWi7Yto9jnAHgx2j1Vfe7kx0JOyNO6PwcFRs9QEkaw7BkBII3FOn
	Fnh1A7OmdIxpKoxPwjjlDNAEGsm1wfab9OcK8mXWX9uPwgQBAmOqIpFKbiPisR3Z09jFeM8MZB+H6
	k5FgdnCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6NgL-0097Bh-Cs; Wed, 29 Jun 2022 02:43:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6NgI-0097Ab-Hp; Wed, 29 Jun 2022 02:43:56 +0000
X-UUID: 5f0c7a6e3d614756a0283d4f41a23d6c-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:03aa571e-7d37-4d59-acfa-1102485cda9a,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:87442a2,CLOUDID:53a1e762-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5f0c7a6e3d614756a0283d4f41a23d6c-20220628
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 350736381; Tue, 28 Jun 2022 19:43:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 29 Jun 2022 10:13:07 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 29 Jun 2022 10:13:07 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Pavel Hofman <pavel.hofman@ivitera.com>, "Julian
 Scheel" <julian@jusst.de>, Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	"Chunfeng Yun" <chunfeng.yun@mediatek.com>, Yunhao Tian
	<t123yh.xyz@gmail.com>, xin lin <xin.lin@mediatek.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] usb: gadget: f_uac1: add interface association descriptor
Date: Wed, 29 Jun 2022 10:13:04 +0800
Message-ID: <20220629021304.21725-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_194354_636488_34E934F3 
X-CRM114-Status: GOOD (  15.21  )
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

When we want to use a composite device that supports UVC, UAC1 and
ADB at the same time, encounter that UAC1 can't work when connected
to windows 10 system.
From the online documents of microsoft, "overview of enumeration of
interface collections on usb composite devices", it recommends that
vendors use IADs (interface association descriptor) to define
interface collections.
After addding IAD, we can fix the issue.

Signed-off-by: xin lin <xin.lin@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: modify commit log suggested by Greg
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


