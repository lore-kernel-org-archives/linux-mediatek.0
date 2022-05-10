Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2D8C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qOzwz7eXnCbXfbMnqwVl5rgkYn0NQAeHBbEG/8piF4U=; b=eFccPb/WFBuIQl
	kiv6hrQ5ih9FAioO1PCuBFBRLKb5wsrx+xp028iFO0+kkk42xfeG9TYSV0r2d2wK6xGGkoVKV0TDI
	9Im3IWcFhNsFptHeHK6hOqX7BYOGoB88fl/8YLQCbEOihYM5/DQ7ae4drnOiNKvC8+LgBP0owz3ya
	TJETJIUmOKBdk7VO1NrUUna2xrmQvpRL5VoVKUc3iFpVvYrFuML4RhmFfwkp6DkNdtiNyxuumXGjW
	+c6JbSv9lkJDg7mfP8qy7KrURfRo30BryDnb412XZ7I1LIU7he0COdZRf4oFQF3lJyqK/ZaGL7S+/
	Azk86KySspnZDjsTR89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noOrH-001pJ7-RI; Tue, 10 May 2022 12:20:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noOr6-001pDw-6c; Tue, 10 May 2022 12:20:47 +0000
X-UUID: bc0d3efa0d9d4bf187b6eae0a9cb4b32-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:50869460-75e9-49fc-a1eb-63349d355a02,
 OB:-327
 68,LOB:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:-32768,SF:-32768,FILE:0,RULE:R
 elease_Ham,ACTION:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:d227e916-2e53-443e-b81a-655c13977218,
 C
 OID:nil,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: bc0d3efa0d9d4bf187b6eae0a9cb4b32-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 681560934; Tue, 10 May 2022 05:20:32 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 05:10:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 20:10:29 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 10 May 2022 20:10:28 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Macpaul Lin <macpaul.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH next v3 1/2] arm64: dts: mediatek: mt8195: add efuse node and
 cells
Date: Tue, 10 May 2022 20:10:26 +0800
Message-ID: <20220510121027.19041-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_052044_295379_8F2CB756 
X-CRM114-Status: GOOD (  10.33  )
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

Add efuse node and cells used by t-phy to fix the bit shift issue

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3:
  add reviewed-by and tested-by;
  fix duplicated unit-address warning;

NOTE:
  based on v5.18-next/dts64 of matthias.bgg's branch;

v2: no changes, just based on new mt8195.dtsi

---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index b57e620c2c72..d5bc4cf5f4ac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -691,6 +691,53 @@
 			status = "disabled";
 		};
 
+		efuse: efuse@11c10000 {
+			compatible = "mediatek,mt8195-efuse", "mediatek,efuse";
+			reg = <0 0x11c10000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			u3_tx_imp_p0: usb3-tx-imp@184,1 {
+				reg = <0x184 0x1>;
+				bits = <0 5>;
+			};
+			u3_rx_imp_p0: usb3-rx-imp@184,2 {
+				reg = <0x184 0x2>;
+				bits = <5 5>;
+			};
+			u3_intr_p0: usb3-intr@185 {
+				reg = <0x185 0x1>;
+				bits = <2 6>;
+			};
+			comb_tx_imp_p1: usb3-tx-imp@186,1 {
+				reg = <0x186 0x1>;
+				bits = <0 5>;
+			};
+			comb_rx_imp_p1: usb3-rx-imp@186,2 {
+				reg = <0x186 0x2>;
+				bits = <5 5>;
+			};
+			comb_intr_p1: usb3-intr@187 {
+				reg = <0x187 0x1>;
+				bits = <2 6>;
+			};
+			u2_intr_p0: usb2-intr-p0@188,1 {
+				reg = <0x188 0x1>;
+				bits = <0 5>;
+			};
+			u2_intr_p1: usb2-intr-p1@188,2 {
+				reg = <0x188 0x2>;
+				bits = <5 5>;
+			};
+			u2_intr_p2: usb2-intr-p2@189,1 {
+				reg = <0x189 0x1>;
+				bits = <2 5>;
+			};
+			u2_intr_p3: usb2-intr-p3@189,2 {
+				reg = <0x189 0x2>;
+				bits = <7 5>;
+			};
+		};
+
 		u3phy2: t-phy@11c40000 {
 			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v3";
 			#address-cells = <1>;
@@ -873,6 +920,10 @@
 				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M>,
 					 <&topckgen CLK_TOP_SSUSB_PHY_P1_REF>;
 				clock-names = "ref", "da_ref";
+				nvmem-cells = <&comb_intr_p1>,
+					      <&comb_rx_imp_p1>,
+					      <&comb_tx_imp_p1>;
+				nvmem-cell-names = "intr", "rx_imp", "tx_imp";
 				#phy-cells = <1>;
 			};
 		};
@@ -897,6 +948,10 @@
 				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M>,
 					 <&topckgen CLK_TOP_SSUSB_PHY_REF>;
 				clock-names = "ref", "da_ref";
+				nvmem-cells = <&u3_intr_p0>,
+					      <&u3_rx_imp_p0>,
+					      <&u3_tx_imp_p0>;
+				nvmem-cell-names = "intr", "rx_imp", "tx_imp";
 				#phy-cells = <1>;
 			};
 		};
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
