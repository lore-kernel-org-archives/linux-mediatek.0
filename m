Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDB7C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 08:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYNcRZnMPdoGHbaAS4t9PS2B+ZTfta3AIIoWlDFqlTw=; b=uy2wOM5lVz7rD5
	VvoSJX6AARJ2JarH8jJwleUcFT1qjMikeHtLhjimgQNhxEjHZKyGkKgE/LVQ33LIqMSvBHH9c/25X
	1ZcxYmuyWjQ1u/O2vTEhIWxqAghmW0aUsWLzqQgEH3YP8rxXOBTQ4VZ7oyFaisAMISj+Q4LKrU1UI
	KTljhSNP3AkbjSiBjPqc2XCjcbMJvdTJnYVRYVG+M/Jv8kHfrjcw5Cz3mH7DLmvy00TplD884sOXi
	MsryxDbQDWzYEHaYzOaba+t1E7XWjNa4+afml2l1Qhb/e7FLGJTOtJ2xFqsUHjXlTwVCPvwym7w6v
	vkYYJheCemhlWPd7BFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orbNO-007kV7-56; Sun, 06 Nov 2022 08:51:34 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orbMd-007k9u-Dg; Sun, 06 Nov 2022 08:50:49 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 1E0FC5FC9C;
	Sun,  6 Nov 2022 08:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667724641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GYNcRZnMPdoGHbaAS4t9PS2B+ZTfta3AIIoWlDFqlTw=;
	b=To0GmVD1oJ7wRU5IxtM2W/I9sU6/10P6cKksfxP/8orHs1FjpBpUMdXaLRui9/l8KQ9T66
	pqqA976yB3FTC7g92741hb6gtI7VUzohQbhljhBmQQ8wshdjk/4LFRY3C/BUE/4VZCgcdk
	rqvZx8jX2j48AKDat9aeu9aAX9BqWR4=
Received: from frank-G5.. (fttx-pool-80.245.79.199.bambit.de [80.245.79.199])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 6E700360707;
	Sun,  6 Nov 2022 08:50:40 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v3 02/11] arm64: dts: mt7986: add spi related device nodes
Date: Sun,  6 Nov 2022 09:50:25 +0100
Message-Id: <20221106085034.12582-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106085034.12582-1-linux@fw-web.de>
References: <20221106085034.12582-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: bbcea1ed-018e-4fdf-8a18-fe66a1ecf973
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_015047_771781_85DE4F68 
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

This patch adds spi support for MT7986.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 35 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 28 ++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 35 ++++++++++++++++++++
 3 files changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 6189436fe31d..58f7e6b169bf 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -55,6 +55,20 @@ switch: switch@0 {
 };
 
 &pio {
+	spi_flash_pins: spi-flash-pins {
+		mux {
+			function = "spi";
+			groups = "spi0", "spi0_wp_hold";
+		};
+	};
+
+	spic_pins: spic-pins {
+		mux {
+			function = "spi";
+			groups = "spi1_2";
+		};
+	};
+
 	uart1_pins: uart1-pins {
 		mux {
 			function = "uart";
@@ -101,6 +115,27 @@ conf {
 	};
 };
 
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi_flash_pins>;
+	cs-gpios = <0>, <0>;
+	status = "okay";
+	spi_nand: spi_nand@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <10000000>;
+		spi-tx-buswidth = <4>;
+		spi-rx-buswidth = <4>;
+	};
+};
+
+&spi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spic_pins>;
+	cs-gpios = <0>, <0>;
+	status = "okay";
+};
+
 &switch {
 	ports {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 226648f48df2..6d881095d933 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -112,6 +112,34 @@ infracfg: infracfg@10001000 {
 			#clock-cells = <1>;
 		};
 
+		spi0: spi@1100a000 {
+			compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x1100a000 0 0x100>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_MPLL_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI0_CK>,
+				 <&infracfg CLK_INFRA_SPI0_HCK_CK>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			status = "disabled";
+		};
+
+		spi1: spi@1100b000 {
+			compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x1100b000 0 0x100>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_MPLL_D2>,
+				 <&topckgen CLK_TOP_SPIM_MST_SEL>,
+				 <&infracfg CLK_INFRA_SPI1_CK>,
+				 <&infracfg CLK_INFRA_SPI1_HCK_CK>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			status = "disabled";
+		};
+
 		topckgen: topckgen@1001b000 {
 			compatible = "mediatek,mt7986-topckgen", "syscon";
 			reg = <0 0x1001B000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index 7459ddb6b6f0..7673aa3fa6ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -96,6 +96,20 @@ fixed-link {
 };
 
 &pio {
+	spi_flash_pins: spi-flash-pins {
+		mux {
+			function = "spi";
+			groups = "spi0", "spi0_wp_hold";
+		};
+	};
+
+	spic_pins: spic-pins {
+		mux {
+			function = "spi";
+			groups = "spi1_2";
+		};
+	};
+
 	wf_2g_5g_pins: wf-2g-5g-pins {
 		mux {
 			function = "wifi";
@@ -128,6 +142,27 @@ conf {
 	};
 };
 
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi_flash_pins>;
+	cs-gpios = <0>, <0>;
+	status = "okay";
+	spi_nand: spi_nand@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <10000000>;
+		spi-tx-buswidth = <4>;
+		spi-rx-buswidth = <4>;
+	};
+};
+
+&spi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spic_pins>;
+	cs-gpios = <0>, <0>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.34.1


