Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC124C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 06:02:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9105860EB8
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 06:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9105860EB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RskIaCkI8Zmb9u4A9hw9+z2bwjtx1wX/f7qiNuk80V0=; b=SI3FLvTGGnpHd6
	JNPOxxdPaKI0/7pUy188ECb+K4yvf4pYUVTJ2mn+tr0Rx1PbCWtFiWPNNzSzKHqkFgI7BYJohkdMv
	1uvSWk9fN8//ZWIyC1VKHUQ5hYL/RMJmZnHqYLlmpFfE6kAXSaorPKDe0Y0NVMdZ/9KhebYbLUIEu
	bAP26EJT4vesEKbczUTuJRKHWTb3ED+jdrnhooXLg2MFed1/oRMrMfFNkcdins46JjpByjrN54/gM
	DtP0sQKU8FRrTKYozs2l0HwDNR5WyNZhvW/k6klXgSaUGHusiv6ZymLv53tT4P0riZUfIdP5p7tHn
	hAGH1/4270UPEBSnD1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhmsH-000cC5-Ga; Tue, 02 Nov 2021 06:02:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhms3-000c7D-UJ; Tue, 02 Nov 2021 06:02:09 +0000
X-UUID: f530bd4889e349a09b29bba0045ac7e6-20211101
X-UUID: f530bd4889e349a09b29bba0045ac7e6-20211101
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1988608332; Mon, 01 Nov 2021 23:02:06 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Nov 2021 23:00:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Nov 2021 14:00:58 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 2 Nov 2021 14:00:57 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] usb: xhci-mtk: add support ip-sleep wakeup for mt8195
Date: Tue, 2 Nov 2021 14:00:48 +0800
Message-ID: <20211102060049.1843-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102060049.1843-1-chunfeng.yun@mediatek.com>
References: <20211102060049.1843-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_230208_005761_BF9AAB60 
X-CRM114-Status: GOOD (  13.83  )
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

Add support ip-sleep wakeup for mt8195, it's a specific revision for
each USB controller, and not following IPM rule.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index c53f6f276d5c..63f4b6984667 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -95,6 +95,19 @@
 #define WC0_SSUSB0_CDEN		BIT(6)
 #define WC0_IS_SPM_EN		BIT(1)
 
+/* mt8195 */
+#define PERI_WK_CTRL0_8195	0x04
+#define WC0_IS_P_95		BIT(30)	/* polarity */
+#define WC0_IS_C_95(x)		((u32)(((x) & 0x7) << 27))
+#define WC0_IS_EN_P3_95		BIT(26)
+#define WC0_IS_EN_P2_95		BIT(25)
+#define WC0_IS_EN_P1_95		BIT(24)
+
+#define PERI_WK_CTRL1_8195	0x20
+#define WC1_IS_C_95(x)		((u32)(((x) & 0xf) << 28))
+#define WC1_IS_P_95		BIT(12)
+#define WC1_IS_EN_P0_95		BIT(6)
+
 /* mt2712 etc */
 #define PERI_SSUSB_SPM_CTRL	0x0
 #define SSC_IP_SLEEP_EN	BIT(4)
@@ -105,6 +118,10 @@ enum ssusb_uwk_vers {
 	SSUSB_UWK_V2,
 	SSUSB_UWK_V1_1 = 101,	/* specific revision 1.01 */
 	SSUSB_UWK_V1_2,		/* specific revision 1.2 */
+	SSUSB_UWK_V1_3,		/* mt8195 IP0 */
+	SSUSB_UWK_V1_4,		/* mt8195 IP1 */
+	SSUSB_UWK_V1_5,		/* mt8195 IP2 */
+	SSUSB_UWK_V1_6,		/* mt8195 IP3 */
 };
 
 /*
@@ -307,6 +324,26 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
 		msk = WC0_SSUSB0_CDEN | WC0_IS_SPM_EN;
 		val = enable ? msk : 0;
 		break;
+	case SSUSB_UWK_V1_3:
+		reg = mtk->uwk_reg_base + PERI_WK_CTRL1_8195;
+		msk = WC1_IS_EN_P0_95 | WC1_IS_C_95(0xf) | WC1_IS_P_95;
+		val = enable ? (WC1_IS_EN_P0_95 | WC1_IS_C_95(0x1)) : 0;
+		break;
+	case SSUSB_UWK_V1_4:
+		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8195;
+		msk = WC0_IS_EN_P1_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
+		val = enable ? (WC0_IS_EN_P1_95 | WC0_IS_C_95(0x1)) : 0;
+		break;
+	case SSUSB_UWK_V1_5:
+		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8195;
+		msk = WC0_IS_EN_P2_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
+		val = enable ? (WC0_IS_EN_P2_95 | WC0_IS_C_95(0x1)) : 0;
+		break;
+	case SSUSB_UWK_V1_6:
+		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8195;
+		msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
+		val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) : 0;
+		break;
 	case SSUSB_UWK_V2:
 		reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
 		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
