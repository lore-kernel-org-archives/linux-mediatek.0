Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CF0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 21:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcUt1G5eSERhpbWw6ymN9Buvbsup0lANmSz+IPDuvNs=; b=M/2day4VN9NW7/PaEg/8bOXaKn
	FnHbUahK3XJW+cmZx9nGRnFpFKSoCJwpCmFIS9YkZmGW5fMHI5FNV/yYNye3bkV4Mh+eaZLObgJlc
	S/zx7lI5uvkVuxNM6b6YRVkiRzHpQv7K/3219+VDgbdM4A1yz3LOe9X41TPx547msEjsEnuuHs157
	EzhCW3F6mENSPCxuH3frC8WNX6MhuF+f25aiPHmEzdcGVIS+Yvl1k/qI0RMIIIS9EeAKhEGSUEMJu
	dqKVWLQTNQ6q5d+oHnY70dNDOGsaOHEY//RuxCIzecYHMzAJ5t9BcGY5LhSDasYz0KkTCyW2/oZLa
	TukjO8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogYNr-005Mg6-1l; Thu, 06 Oct 2022 21:26:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogYN9-005MJz-72; Thu, 06 Oct 2022 21:25:41 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CDF20660231F;
	Thu,  6 Oct 2022 22:25:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665091538;
	bh=dXF4O4gpDnjt0O5eIiuVLOMCgRI/gmY9KdHbdkGVZ3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XUD8hw3DmVqJhDC4Io8seOVm10K/f+Z6vxROh99D/QSplerbbCjYnYGkkUCO1ETaK
	 xtEYx0e/O3RSL6TwWdH9hUewsd65TwGAGpf4BLkUkcwAQdG5dNybJMzfJink0loOws
	 6mZsYWCJ0lPfBLSh9MhlXSQjijPNSkQlYgxuOIZ7kE5QKgmjGtZMNWKwpB1SteWTgd
	 gXXRf46tZCISp+KHlHQtEzi6+e7HKDnblxWN3oks1HrTdrbgfcSk7Nine58hqjSU1y
	 vf8RTumusWH2jEuwzP+93tWY8HRHSR3Qq5AXVgUB2dDfsOzu/vH02gPWkPHrkQ6Q7S
	 x7Uk0M6vYM/Og==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/5] arm64: dts: mediatek: asurada: Enable internal display
Date: Thu,  6 Oct 2022 17:25:26 -0400
Message-Id: <20221006212528.103790-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006212528.103790-1-nfraprado@collabora.com>
References: <20221006212528.103790-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_142539_427269_0CAE5B13 
X-CRM114-Status: GOOD (  10.01  )
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

The asurada platform has an ANX7625 bridge connecting the DSI's output
to the internal eDP panel. Add and enable these devices in order to get
a usable internal display.

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

(no changes since v1)

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 666021ca4d4f..ace44827de17 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -198,6 +198,14 @@ wifi_restricted_dma_region: wifi@c0000000 {
 	};
 };
 
+&dsi0 {
+	status = "okay";
+};
+
+&dsi_out {
+	remote-endpoint = <&anx7625_in>;
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -246,6 +254,53 @@ &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c3_pins>;
+
+	anx_bridge: anx7625@58 {
+		compatible = "analogix,anx7625";
+		reg = <0x58>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&anx7625_pins>;
+		enable-gpios = <&pio 41 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 42 GPIO_ACTIVE_HIGH>;
+		vdd10-supply = <&pp1000_mipibrdg>;
+		vdd18-supply = <&pp1800_mipibrdg>;
+		vdd33-supply = <&pp3300_mipibrdg>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				anx7625_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				anx7625_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+
+		aux-bus {
+			panel: panel {
+				compatible = "edp-panel";
+				power-supply = <&pp3300_mipibrdg>;
+				backlight = <&backlight_lcd0>;
+
+				port {
+					panel_in: endpoint {
+						remote-endpoint = <&anx7625_out>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &i2c7 {
@@ -256,6 +311,10 @@ &i2c7 {
 	pinctrl-0 = <&i2c7_pins>;
 };
 
+&mipi_tx0 {
+	status = "okay";
+};
+
 &mmc0 {
 	status = "okay";
 
@@ -587,6 +646,20 @@ &pio {
 			  "AUD_DAT_MISO0",
 			  "AUD_DAT_MISO1";
 
+	anx7625_pins: anx7625-default-pins {
+		pins-out {
+			pinmux = <PINMUX_GPIO41__FUNC_GPIO41>,
+				 <PINMUX_GPIO42__FUNC_GPIO42>;
+			output-low;
+		};
+
+		pins-in {
+			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
 	cr50_int: cr50-irq-default-pins {
 		pins-gsc-ap-int-odl {
 			pinmux = <PINMUX_GPIO171__FUNC_GPIO171>;
-- 
2.37.3


