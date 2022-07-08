Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8961CCA47F
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jC0WEDQobilqf5uMSBZUSDPVhThq35u/DqxpnTxMo8A=; b=oHlLUrZ7OM04bnY/eaLoGjPucP
	PAIMuMoXyxmoko4lvj7iXnRpn4E/R3j7Ll6pv9U09YabdqgjcEj/LRHUnV/5DHzSlFGTcP0dBD7Fp
	N5eugZNnRkAXmwL3thgeZQ38iD89kbFAxASsdGxAS4FBOQ0y/vMNjpqjuCM3pCy2MvdRnQxEO6d3/
	SVAN7XzqIUVt6w33tNX0Utt0Z2lwlxWzvHE7wQIZoHOenqocNXhVO1ZMneU7AhDT3iDr3Y79gylp2
	tyzp0BE1TkhvgPTIDDqCRpikMs3rmmFAz8ySyDV8C8ztvY4PzrvOl5oBXDjGRcOIY9vIoFEFUp/w9
	UVXH+6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9iHL-002C50-50; Fri, 08 Jul 2022 07:19:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9iHH-002C38-A2; Fri, 08 Jul 2022 07:19:53 +0000
X-UUID: 9e2ea04eb0424c998a784108b965791c-20220708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:2a953a71-b06c-44d9-b9f2-bf6286940d7b,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:1101e486-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9e2ea04eb0424c998a784108b965791c-20220708
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1386929025; Fri, 08 Jul 2022 00:19:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 15:19:09 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 15:19:08 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>
Subject: [PATCH 5/5] usb: mtu3: support function remote wakeup
Date: Fri, 8 Jul 2022 15:19:03 +0800
Message-ID: <20220708071903.25752-5-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708071903.25752-1-chunfeng.yun@mediatek.com>
References: <20220708071903.25752-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_001951_410976_AB58CFFE 
X-CRM114-Status: GOOD (  16.86  )
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

Add function wake notification to support function remote wakeup,
currently assume the composite device only enable function wake
for the first interface.

Forward request to function driver when the recipient is an interface,
including:
GetStatus() request to the first interface in a function returns the
information about 'function remote wakeup' and 'function remote wakeup
capalbe';
SetFeature request of FUNCTION_SUSPEND to an interface recipient, the
controller driver saves the suspend option;

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_gadget.c     | 18 ++++++++++++++++++
 drivers/usb/mtu3/mtu3_gadget_ep0.c |  8 ++++----
 drivers/usb/mtu3/mtu3_hw_regs.h    | 16 ++++++++++++++++
 3 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index a751e0533c2d..291ec53c6c75 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -433,6 +433,13 @@ static int mtu3_gadget_get_frame(struct usb_gadget *gadget)
 	return (int)mtu3_readl(mtu->mac_base, U3D_USB20_FRAME_NUM);
 }
 
+static void function_wake_notif(struct mtu3 *mtu, u8 intf)
+{
+	mtu3_writel(mtu->mac_base, U3D_DEV_NOTIF_0,
+		    TYPE_FUNCTION_WAKE | DEV_NOTIF_VAL_FW(intf));
+	mtu3_setbits(mtu->mac_base, U3D_DEV_NOTIF_0, SEND_DEV_NOTIF);
+}
+
 static int mtu3_gadget_wakeup(struct usb_gadget *gadget)
 {
 	struct mtu3 *mtu = gadget_to_mtu3(gadget);
@@ -446,7 +453,18 @@ static int mtu3_gadget_wakeup(struct usb_gadget *gadget)
 
 	spin_lock_irqsave(&mtu->lock, flags);
 	if (mtu->g.speed >= USB_SPEED_SUPER) {
+		/*
+		 * class driver may do function wakeup even UFP is in U0,
+		 * and UX_EXIT only takes effect in U1/U2/U3;
+		 */
 		mtu3_setbits(mtu->mac_base, U3D_LINK_POWER_CONTROL, UX_EXIT);
+		/*
+		 * Assume there's only one function on the composite device
+		 * and enable remote wake for the first interface.
+		 * FIXME if the IAD (interface association descriptor) shows
+		 * there is more than one function.
+		 */
+		function_wake_notif(mtu, 0);
 	} else {
 		mtu3_setbits(mtu->mac_base, U3D_POWER_MANAGEMENT, RESUME);
 		spin_unlock_irqrestore(&mtu->lock, flags);
diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index 7e7013508af6..e4fd1bb14a55 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -226,6 +226,8 @@ ep0_get_status(struct mtu3 *mtu, const struct usb_ctrlrequest *setup)
 
 		break;
 	case USB_RECIP_INTERFACE:
+		/* status of function remote wakeup, forward request */
+		handled = 0;
 		break;
 	case USB_RECIP_ENDPOINT:
 		epnum = (u8) le16_to_cpu(setup->wIndex);
@@ -397,10 +399,8 @@ static int ep0_handle_feature(struct mtu3 *mtu,
 		/* superspeed only */
 		if (value == USB_INTRF_FUNC_SUSPEND &&
 		    mtu->g.speed >= USB_SPEED_SUPER) {
-			/*
-			 * forward the request because function drivers
-			 * should handle it
-			 */
+			/* forward the request for function suspend */
+			mtu->may_wakeup = !!(index & USB_INTRF_FUNC_SUSPEND_RW);
 			handled = 0;
 		}
 		break;
diff --git a/drivers/usb/mtu3/mtu3_hw_regs.h b/drivers/usb/mtu3/mtu3_hw_regs.h
index 072db1f6470e..519a58301f45 100644
--- a/drivers/usb/mtu3/mtu3_hw_regs.h
+++ b/drivers/usb/mtu3/mtu3_hw_regs.h
@@ -341,6 +341,8 @@
 #define U3D_LINK_UX_INACT_TIMER	(SSUSB_USB3_SYS_CSR_BASE + 0x020C)
 #define U3D_LINK_POWER_CONTROL	(SSUSB_USB3_SYS_CSR_BASE + 0x0210)
 #define U3D_LINK_ERR_COUNT	(SSUSB_USB3_SYS_CSR_BASE + 0x0214)
+#define U3D_DEV_NOTIF_0		(SSUSB_USB3_SYS_CSR_BASE + 0x0290)
+#define U3D_DEV_NOTIF_1		(SSUSB_USB3_SYS_CSR_BASE + 0x0294)
 
 /*---------------- SSUSB_USB3_SYS_CSR FIELD DEFINITION ----------------*/
 
@@ -365,6 +367,20 @@
 #define CLR_LINK_ERR_CNT	BIT(16)
 #define LINK_ERROR_COUNT	GENMASK(15, 0)
 
+/* U3D_DEV_NOTIF_0 */
+#define DEV_NOTIF_TYPE_SPECIFIC_LOW_MSK		GENMASK(31, 8)
+#define DEV_NOTIF_VAL_FW(x)		(((x) & 0xff) << 8)
+#define DEV_NOTIF_VAL_LTM(x)	(((x) & 0xfff) << 8)
+#define DEV_NOTIF_VAL_IAM(x)	(((x) & 0xffff) << 8)
+#define DEV_NOTIF_TYPE_MSK		GENMASK(7, 4)
+/* Notification Type */
+#define TYPE_FUNCTION_WAKE			(0x1 << 4)
+#define TYPE_LATENCY_TOLERANCE_MESSAGE		(0x2 << 4)
+#define TYPE_BUS_INTERVAL_ADJUST_MESSAGE	(0x3 << 4)
+#define TYPE_HOST_ROLE_REQUEST			(0x4 << 4)
+#define TYPE_SUBLINK_SPEED			(0x5 << 4)
+#define SEND_DEV_NOTIF			BIT(0)
+
 /*---------------- SSUSB_USB2_CSR REGISTER DEFINITION ----------------*/
 
 #define U3D_POWER_MANAGEMENT		(SSUSB_USB2_CSR_BASE + 0x0004)
-- 
2.18.0


