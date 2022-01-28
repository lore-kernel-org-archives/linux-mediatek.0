Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E12C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 06:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcDIkkpi5rLZ4UFLzSNwo1VxZ9DZzlG2YVR7jOb/jBM=; b=FJ2nCUxUEy9Aaw
	FIeNKURl5gjyUyz4nkBa3rh72exqtM3HOL4w2IdxTUQHf1ZkkvaFFj45mHaqumpZFUc5AkgAaLHcE
	spOul1/FbWf+thmh6DtQGo+X01YRAvE1rUDZB9AY5BWHt5LeDpMu0kP3Plk0V5hqT9Ab0S/lu4lEg
	NXuD7LVa9aXXiFQQCW03NwNf+JbmkiKAYkwtl+3xM572jzJHw8zOxyl78S20K/8Ay6icXb7WL/H91
	h7+J5lmGSLd1VN/EUsKeJtWvG+nBHajuZRGV2esgMFZLSZ6F21AfdmYT/LDk6xu3JTTw0Vu0HXQe2
	ITRKJpoDpHeMzXK/bbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDKnm-000bzU-Gn; Fri, 28 Jan 2022 06:32:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDKmp-000bZR-FO; Fri, 28 Jan 2022 06:31:08 +0000
X-UUID: 0012fc8bdbb94d0cbeb549f97f6ce897-20220127
X-UUID: 0012fc8bdbb94d0cbeb549f97f6ce897-20220127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 453706840; Thu, 27 Jan 2022 23:31:03 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 22:29:12 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 28 Jan 2022 14:29:05 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 14:29:04 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Tianping Fang <tianping.fang@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/4] usb: xhci-mtk: add support ip-sleep wakeup for mt8195
Date: Fri, 28 Jan 2022 14:29:00 +0800
Message-ID: <20220128062902.26273-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128062902.26273-1-chunfeng.yun@mediatek.com>
References: <20220128062902.26273-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_223107_571641_BA6ED480 
X-CRM114-Status: GOOD (  13.19  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add reviewed-by Matthias & AngeloGioacchino
---
 drivers/usb/host/xhci-mtk.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 91738af0ab14..96a0ff0bb11e 100644
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
@@ -308,6 +325,26 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
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
