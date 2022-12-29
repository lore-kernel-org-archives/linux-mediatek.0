Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72DFC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdrLgZ7kHEHZCcXHBTGh4SDP3w9h0DuG6QN4UIa1As8=; b=SvlJ0Q90TE12RU
	22gtabSyE9BfTpu2A4OAW8DxkMQGqlfBAGplfzhI4bEgvAN1qEZxjOLwOogNpoJ0DcJF449w/EuHD
	lxP4Ffvc0jeC+dbmal70OPsVrRwSskUw7C5MEYZfNe1w0M67sM3TKzyPVR+Nhp+A22uqC/igVrbCG
	th6H37WR8N0aSbrcgbAtfZBnh86wh+s37WO96PW11tg8cz95Y+AgaO3oPDigE1RxxVnAvrIZGvQLF
	TF2wpxXflBcKWvC7I6g2d7qe0A0Nwxs6mTk0Z6LpLLc9Hp257jV09eXj7a1Q7kK4/FObo919ZaBCv
	6lumUgSlyXfX33OWjoRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAuFT-00GiKa-EA; Thu, 29 Dec 2022 14:51:11 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAuEv-00Gi4c-UN; Thu, 29 Dec 2022 14:50:39 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id E021D40122;
	Thu, 29 Dec 2022 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1672325433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NdrLgZ7kHEHZCcXHBTGh4SDP3w9h0DuG6QN4UIa1As8=;
	b=O1trYHL+ocAAPXPyAq8oLw4wu1KDtEgMhref6YrJPHBwQW/xXSBmT4eqeoo6jo6LHKQ/n5
	6SgwMTRYx01gegLg3CFuPKIEnhx3DteVN3Jb09fazf3nIVkfwe0qLe8TKn+zIZejU3dJ8z
	AHKDvOgW1lPt087kzOr0SrCc8gTOPM0=
Received: from frank-G5.. (fttx-pool-80.245.77.213.bambit.de [80.245.77.213])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id A96631226AC;
	Thu, 29 Dec 2022 14:50:32 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v8 2/5] arm64: dts: mt7986: add usb related device nodes
Date: Thu, 29 Dec 2022 15:50:20 +0100
Message-Id: <20221229145023.55713-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229145023.55713-1-linux@fw-web.de>
References: <20221229145023.55713-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_065038_211386_76F4365A 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

This patch adds USB support for MT7986.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
changes compared to sams original version:
- reorder xhci-clocks based on yaml binding

v5:
 - update ranges/reg of usb-phy
 - not added RB from AngeloGioacchino for v4 because of these changes

v6:
- remove unused usb regulators
- remove 3v3 regulator (will be added with emmc-patch)
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts |  8 +++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 55 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts |  8 +++
 3 files changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 9b83925893b7..58089fcf4d16 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -140,6 +140,10 @@ &spi1 {
 	status = "okay";
 };
 
+&ssusb {
+	status = "okay";
+};
+
 &switch {
 	ports {
 		#address-cells = <1>;
@@ -201,6 +205,10 @@ &uart2 {
 	status = "okay";
 };
 
+&usb_phy {
+	status = "okay";
+};
+
 &wifi {
 	status = "okay";
 	pinctrl-names = "default", "dbdc";
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 0e9406fc63e2..9ff2968152ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -323,6 +323,61 @@ spi1: spi@1100b000 {
 			status = "disabled";
 		};
 
+		ssusb: usb@11200000 {
+			compatible = "mediatek,mt7986-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11200000 0 0x2e00>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_IUSB_SYS_CK>,
+				 <&infracfg CLK_INFRA_IUSB_CK>,
+				 <&infracfg CLK_INFRA_IUSB_133_CK>,
+				 <&infracfg CLK_INFRA_IUSB_66M_CK>,
+				 <&topckgen CLK_TOP_U2U3_XHCI_SEL>;
+			clock-names = "sys_ck",
+				      "ref_ck",
+				      "mcu_ck",
+				      "dma_ck",
+				      "xhci_ck";
+			phys = <&u2port0 PHY_TYPE_USB2>,
+			       <&u3port0 PHY_TYPE_USB3>,
+			       <&u2port1 PHY_TYPE_USB2>;
+			status = "disabled";
+		};
+
+		usb_phy: t-phy@11e10000 {
+			compatible = "mediatek,mt7986-tphy",
+				     "mediatek,generic-tphy-v2";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x11e10000 0x1700>;
+			status = "disabled";
+
+			u2port0: usb-phy@0 {
+				reg = <0x0 0x700>;
+				clocks = <&topckgen CLK_TOP_DA_U2_REFSEL>,
+					 <&topckgen CLK_TOP_DA_U2_CK_1P_SEL>;
+				clock-names = "ref", "da_ref";
+				#phy-cells = <1>;
+			};
+
+			u3port0: usb-phy@700 {
+				reg = <0x700 0x900>;
+				clocks = <&topckgen CLK_TOP_USB3_PHY_SEL>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+
+			u2port1: usb-phy@1000 {
+				reg = <0x1000 0x700>;
+				clocks = <&topckgen CLK_TOP_DA_U2_REFSEL>,
+					 <&topckgen CLK_TOP_DA_U2_CK_1P_SEL>;
+				clock-names = "ref", "da_ref";
+				#phy-cells = <1>;
+			};
+		};
+
 		ethsys: syscon@15000000 {
 			 #address-cells = <1>;
 			 #size-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index 243760cd3011..188ce82ae56c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -167,10 +167,18 @@ &spi1 {
 	status = "okay";
 };
 
+&ssusb {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
 
+&usb_phy {
+	status = "okay";
+};
+
 &wifi {
 	status = "okay";
 	pinctrl-names = "default", "dbdc";
-- 
2.34.1


