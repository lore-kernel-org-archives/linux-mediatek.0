Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD589C63705
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xI7XT67CqYlVW3+/XRkZxk2brg5+ceAOUtpu7n5qfPw=; b=pdmr5/1dndmEog
	mQbYC5LY583XoL/RYWA31fpPnKgaMV/HJ0sJnhHYMCm5tqU3RDlHhNa5+Ou76oUVlmcCGkT0ArdZN
	G5fTdpsMsTN79dPi65R2G3WNrkrbQHKwjYI4E8dLoMI247gOQmJJteN8R8rQnWQV+gBbInpzIfXQ5
	HfXHVEH5Y/uUcN66IaoG3NBbUF4D1Hu+8SvBS2hUijYYbrFbV380iW/LdtyTOhpHvUumAgeuwlmqT
	UG+k9OQgPQW7zbn/XKEaqA93CFX4pBZrUwPzDG3G7cjDOz7XcgpwAMJkbq89rJ0b1GoXTyTprJOLA
	XVw9p+Wdi87HPFYO0Mfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDofZ-009HZB-P5; Fri, 06 Jan 2023 15:30:09 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDoeX-009GPW-6F; Fri, 06 Jan 2023 15:29:08 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 161394043F;
	Fri,  6 Jan 2023 15:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1673018942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xI7XT67CqYlVW3+/XRkZxk2brg5+ceAOUtpu7n5qfPw=;
	b=Fj+y/9wVUc6PO8ycGF8fokZUvCbRG7DSHgX43NNLMsXgLfaCKNSvTMsKUb2wr//V3xEM2M
	vvy6hOsUe0quXOzlvujcRVHtE8x4Mki7wplgJPAKQtnA5aZmC66gLTc8d7guyMD0snmLcK
	i7P1NLTuNRIf5V6JYYsIa1/lDJ0RCYU=
Received: from frank-G5.. (fttx-pool-217.61.159.6.bambit.de [217.61.159.6])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 85A011226D4;
	Fri,  6 Jan 2023 15:29:00 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v9 3/5] arm64: dts: mt7986: add mmc related device nodes
Date: Fri,  6 Jan 2023 16:28:43 +0100
Message-Id: <20230106152845.88717-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230106152845.88717-1-linux@fw-web.de>
References: <20230106152845.88717-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_072905_623075_71174329 
X-CRM114-Status: GOOD (  12.28  )
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

This patch adds mmc support for MT7986.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- update mmc-node because clocks changed

v3:
- fix pullups/pulldowns for mt7986a-rfb to have generic bias-pull-*

v6:
- add 3v3 regulator in mt7986a-rfb (was in usb patch before)
- dropped AngeloGioacchino RB because of this change
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 96 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 15 +++
 2 files changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 58089fcf4d16..c7a2ac764a30 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -5,6 +5,8 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/pinctrl/mt65xx.h>
+
 #include "mt7986a.dtsi"
 
 / {
@@ -23,6 +25,24 @@ memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x40000000>;
 	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &crypto {
@@ -58,7 +78,83 @@ switch: switch@0 {
 	};
 };
 
+&mmc0 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_pins_default>;
+	pinctrl-1 = <&mmc0_pins_uhs>;
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	hs400-ds-delay = <0x14014>;
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	status = "okay";
+};
+
 &pio {
+	mmc0_pins_default: mmc0-pins {
+		mux {
+			function = "emmc";
+			groups = "emmc_51";
+		};
+		conf-cmd-dat {
+			pins = "EMMC_DATA_0", "EMMC_DATA_1", "EMMC_DATA_2",
+			       "EMMC_DATA_3", "EMMC_DATA_4", "EMMC_DATA_5",
+			       "EMMC_DATA_6", "EMMC_DATA_7", "EMMC_CMD";
+			input-enable;
+			drive-strength = <4>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
+		};
+		conf-clk {
+			pins = "EMMC_CK";
+			drive-strength = <6>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
+		};
+		conf-ds {
+			pins = "EMMC_DSL";
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
+		};
+		conf-rst {
+			pins = "EMMC_RSTB";
+			drive-strength = <4>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
+		};
+	};
+
+	mmc0_pins_uhs: mmc0-uhs-pins {
+		mux {
+			function = "emmc";
+			groups = "emmc_51";
+		};
+		conf-cmd-dat {
+			pins = "EMMC_DATA_0", "EMMC_DATA_1", "EMMC_DATA_2",
+			       "EMMC_DATA_3", "EMMC_DATA_4", "EMMC_DATA_5",
+			       "EMMC_DATA_6", "EMMC_DATA_7", "EMMC_CMD";
+			input-enable;
+			drive-strength = <4>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
+		};
+		conf-clk {
+			pins = "EMMC_CK";
+			drive-strength = <6>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
+		};
+		conf-ds {
+			pins = "EMMC_DSL";
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
+		};
+		conf-rst {
+			pins = "EMMC_RSTB";
+			drive-strength = <4>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
+		};
+	};
+
 	spi_flash_pins: spi-flash-pins {
 		mux {
 			function = "spi";
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 9ff2968152ae..9c552442c02d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -346,6 +346,21 @@ ssusb: usb@11200000 {
 			status = "disabled";
 		};
 
+		mmc0: mmc@11230000 {
+			compatible = "mediatek,mt7986-mmc";
+			reg = <0 0x11230000 0 0x1000>,
+			      <0 0x11c20000 0 0x1000>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_EMMC_416M_SEL>,
+				 <&infracfg CLK_INFRA_MSDC_HCK_CK>,
+				 <&infracfg CLK_INFRA_MSDC_CK>,
+				 <&infracfg CLK_INFRA_MSDC_133M_CK>,
+				 <&infracfg CLK_INFRA_MSDC_66M_CK>;
+			clock-names = "source", "hclk", "source_cg", "bus_clk",
+				      "sys_cg";
+			status = "disabled";
+		};
+
 		usb_phy: t-phy@11e10000 {
 			compatible = "mediatek,mt7986-tphy",
 				     "mediatek,generic-tphy-v2";
-- 
2.34.1


