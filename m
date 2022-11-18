Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3946C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 19:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMKZcxPTghRdN2Z6t+oSFK4Mz3I0ecfUNW4MAmMP6yg=; b=4JBggqiMHxg3mP
	8jYa0JPtrnR31YDPSsENRfH3UD8V4wApFVQCfuEYbs/sDauuva6wcnivL1wUWfWd1w4i55p97ztDa
	fHtAnNaMFnWQyIS+LimYulKExP6QEe/VvuxAzkEuSzcP3lJ2LzT3ovbOQGAB9VwtsLO+IN9zMTpfK
	GkQWHlVEebhljjNryhPTeOyoA6WfmPMyvOuwHwiqB4hVHXZ7/VqSDUrcY5Oq2SnI8OUh0pm1s2urR
	tuZJ6PmofWLqYFEzByNTGVkhrvmOhvBWPb39LcIe7d2WikemibTKMgnrWOS6d96H/LgiHzvMM5ZyB
	41fN8TA2M9ErRJT0CUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6sJ-007W3P-WC; Fri, 18 Nov 2022 19:18:08 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6cQ-007Odc-Mu; Fri, 18 Nov 2022 19:01:46 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 956D31005E9;
	Fri, 18 Nov 2022 19:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1668798098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KMKZcxPTghRdN2Z6t+oSFK4Mz3I0ecfUNW4MAmMP6yg=;
	b=caQomNfxXqeRFI/X2YhG/TRtW3cKKwQZh3s32bxXdu/no+Kkcsh1g4dUlqud7nbNUH16FE
	Jt+ILYwIAyXjVCyzwlI7sb+EJ9QRzDUvKkPJ7+wKT87HxXFtMmUoWxBVA8HkVg0q0uWqMN
	yDsxB0JjsXqHi50lv0DUsM3tteL3n8c=
Received: from frank-G5.. (fttx-pool-80.245.77.125.bambit.de [80.245.77.125])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 47AC112271E;
	Fri, 18 Nov 2022 19:01:38 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v6 07/11] arm64: dts: mt7986: add usb related device nodes
Date: Fri, 18 Nov 2022 20:01:22 +0100
Message-Id: <20221118190126.100895-8-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118190126.100895-1-linux@fw-web.de>
References: <20221118190126.100895-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_110143_152746_613269BF 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Sam Shih <sam.shih@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

This patch adds USB support for MT7986.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
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
index 006878e3f2b2..828d504a4e48 100644
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
index 29da9b8ed753..c69b8bff7f4a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -281,6 +281,61 @@ spi1: spi@1100b000 {
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
index 2c7f1d4fb352..cdfc292002cf 100644
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


