Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B475C3ABC3
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 May 2025 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cDh5uh+/6rnhbfj9TY9faubbv1WlwPVvrXMeeob/qY=; b=lFOPc65hzsddPS
	rBjka4jNxvhDjhpW/zhhnU9Xl1yq/iAfuFoUzGMA34vefzSgIlrV6hQFDZ3OOeYmsB87dGrfo5jIK
	6bEkwsdMGe58FvB+4ShBpoqq3ejjJh6U8pey5+JVPH7BsxUoOklfRWiEHQzxwJh9Oipz+YQDG4Y5n
	S/d0yLbXhILxTM4OPcXBBAvmzPTqwuptLkgydA6uJjrsZnttPH56AC5xfo7mvrdCSj1MjxcPO+1aE
	wo0qnhempV+Du19od8Z2jZFs9aCfH3psCGjXdGuMi3wAfZjvwjWLD9PzEC7M3NBAhwykEhN4FdxHC
	MJsjVbuTSanYjBLcsUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7l2-00000007NGs-29eI;
	Sun, 11 May 2025 14:34:24 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7XB-00000007LXa-3igD;
	Sun, 11 May 2025 14:20:07 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id E330A1006D9;
	Sun, 11 May 2025 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1746973201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6cDh5uh+/6rnhbfj9TY9faubbv1WlwPVvrXMeeob/qY=;
	b=mvcPPEZ0JofA5yJBa34DKnVnQ39OHE8Jl0QE68ysaLb3Z0RK6eN4L3IhgD2uaDw7x15gPn
	0TRERockw1gTolEetcB36gBPiWfhzYP0V1lIWbBbGLEIrI2djce+WvrvzQHT5dV0TE5lIv
	/vd5a+LwzRUt0vp2d+EAlnwp64zQprI=
Received: from frank-u24.. (fttx-pool-194.15.84.99.bambit.de [194.15.84.99])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id A5D6D100787;
	Sun, 11 May 2025 14:20:00 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 09/14] arm64: dts: mediatek: mt7988: add switch node
Date: Sun, 11 May 2025 16:19:25 +0200
Message-ID: <20250511141942.10284-10-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511141942.10284-1-linux@fw-web.de>
References: <20250511141942.10284-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: a24ecea1-b7fd-4cb4-a93d-b29036e2e6ac
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_072006_214063_B6567726 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add mt7988 builtin mt753x switch nodes.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 166 ++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index aa0947a555aa..ab7612916a13 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -5,6 +5,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mt65xx.h>
 #include <dt-bindings/reset/mediatek,mt7988-resets.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	compatible = "mediatek,mt7988a";
@@ -742,6 +743,171 @@ ethsys: clock-controller@15000000 {
 			#reset-cells = <1>;
 		};
 
+		switch: switch@15020000 {
+			compatible = "mediatek,mt7988-switch";
+			reg = <0 0x15020000 0 0x8000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&ethwarp MT7988_ETHWARP_RST_SWITCH>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gsw_port0: port@0 {
+					reg = <0>;
+					label = "wan";
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy0>;
+				};
+
+				gsw_port1: port@1 {
+					reg = <1>;
+					label = "lan1";
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy1>;
+				};
+
+				gsw_port2: port@2 {
+					reg = <2>;
+					label = "lan2";
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy2>;
+				};
+
+				gsw_port3: port@3 {
+					reg = <3>;
+					label = "lan3";
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy3>;
+				};
+
+				port@6 {
+					reg = <6>;
+					ethernet = <&gmac0>;
+					phy-mode = "internal";
+
+					fixed-link {
+						speed = <10000>;
+						full-duplex;
+						pause;
+					};
+				};
+			};
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				mediatek,pio = <&pio>;
+
+				gsw_phy0: ethernet-phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <0>;
+					interrupts = <0>;
+					phy-mode = "internal";
+					nvmem-cells = <&phy_calibration_p0>;
+					nvmem-cell-names = "phy-cal-data";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy0_led0: led@0 {
+							reg = <0>;
+							function = LED_FUNCTION_LAN;
+							status = "disabled";
+						};
+
+						gsw_phy0_led1: led@1 {
+							reg = <1>;
+							function = LED_FUNCTION_LAN;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy1: ethernet-phy@1 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <1>;
+					interrupts = <1>;
+					phy-mode = "internal";
+					nvmem-cells = <&phy_calibration_p1>;
+					nvmem-cell-names = "phy-cal-data";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy1_led0: led@0 {
+							reg = <0>;
+							function = LED_FUNCTION_LAN;
+							status = "disabled";
+						};
+
+						gsw_phy1_led1: led@1 {
+							reg = <1>;
+							function = LED_FUNCTION_LAN;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy2: ethernet-phy@2 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <2>;
+					interrupts = <2>;
+					phy-mode = "internal";
+					nvmem-cells = <&phy_calibration_p2>;
+					nvmem-cell-names = "phy-cal-data";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy2_led0: led@0 {
+							reg = <0>;
+							function = LED_FUNCTION_LAN;
+							status = "disabled";
+						};
+
+						gsw_phy2_led1: led@1 {
+							reg = <1>;
+							function = LED_FUNCTION_LAN;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy3: ethernet-phy@3 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <3>;
+					interrupts = <3>;
+					phy-mode = "internal";
+					nvmem-cells = <&phy_calibration_p3>;
+					nvmem-cell-names = "phy-cal-data";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy3_led0: led@0 {
+							reg = <0>;
+							function = LED_FUNCTION_LAN;
+							status = "disabled";
+						};
+
+						gsw_phy3_led1: led@1 {
+							reg = <1>;
+							function = LED_FUNCTION_LAN;
+							status = "disabled";
+						};
+					};
+				};
+			};
+		};
+
 		ethwarp: clock-controller@15031000 {
 			compatible = "mediatek,mt7988-ethwarp";
 			reg = <0 0x15031000 0 0x1000>;
-- 
2.43.0


