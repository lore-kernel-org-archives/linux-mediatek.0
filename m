Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E245C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 06:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcuh0pGOUxZCiGoi9xgIWuWX+Oauk633Hmkwmj03ejU=; b=4RJp8z5t1mA1xa
	r0CsVeFu2MAKWeJOASZKcnrWbn0flNetJqRig9vpVB7Az56vHj6xo+QX063V0heWFkUD1hqEVGt3h
	e8/ekMqhilQIAvmlHqgWdFuow82J1lH8VawGTyhLy8nu7ydeNM2TIZHuqFdvrBxSFHaObLjv4CRZa
	jeQH06Zy9IraYT+jXReWRq65CQWKd9AROZp/N4Avhg2n2cr2TcC2pHx67SvbfILm5c3XLgqlFtCj9
	80nU2VzdlePPBBtdWIRSJ4tez2caLmCgB7r4Mh+hVtb/bbwy0MCcahyLh68CcELCITI/D/GVL3D7P
	CubZ9tPHMHw/+No53yWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDKvD-000fBi-3X; Fri, 28 Jan 2022 06:39:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDKuf-000f2H-V0; Fri, 28 Jan 2022 06:39:15 +0000
X-UUID: 4d0c4c6ed2b74870a88f6deb059c793c-20220127
X-UUID: 4d0c4c6ed2b74870a88f6deb059c793c-20220127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 452240287; Thu, 27 Jan 2022 23:39:10 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 22:29:08 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Jan 2022 14:29:06 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 14:29:05 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Tianping Fang <tianping.fang@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v2 4/4] arm64: dts: mediatek: mt8195: enable usb remote wakeup
Date: Fri, 28 Jan 2022 14:29:02 +0800
Message-ID: <20220128062902.26273-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128062902.26273-1-chunfeng.yun@mediatek.com>
References: <20220128062902.26273-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_223914_040190_3240355C 
X-CRM114-Status: GOOD (  10.14  )
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

Enable USB remote wakeup of all four xHCI controllers

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: based on new mt8195 base dts, no need add usb nodes

Note:

 depend on the reviewing patch:

[v9,3/3] arm64: dts: Add mediatek SoC mt8195 and evaluation board
https://patchwork.kernel.org/patch/12711296

---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 240a21708806..444e5448c9b1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -573,6 +573,8 @@
 				 <&apmixedsys CLK_APMIXED_USB1PLL>,
 				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 103>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -636,6 +638,8 @@
 				 <&apmixedsys CLK_APMIXED_USB1PLL>,
 				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "mcu_ck","xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 104>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -655,6 +659,8 @@
 				 <&topckgen CLK_TOP_SSUSB_P2_REF>,
 				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 105>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -674,6 +680,8 @@
 				 <&topckgen CLK_TOP_SSUSB_P3_REF>,
 				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
+			wakeup-source;
 			/* This controller is connected with a BT device.
 			 * Disable usb2 lpm to prevent konwn issues.
 			 */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
