Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A250C6FA86
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 17:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Uw4aOs61bh7W8XBQOEbHbx2DS1ofwiw0rEbtffModY=; b=aBmcxiDWbyicn756VvwB+z4WZF
	NrvG2qr7MKEGYu6kxVNf2pjgMjrx9NVYV3kn/U/SopwYYwVj3JewHMnL1abXGF5yoyQH/ZlLSm68K
	NPisWq5JKS2XMcF34idxrdaLOwU0Fl97tFBsgMnmCYP8XaW5V81xs5E82Rdkk/ti/HjN34trY4Rh/
	qaRIZsuxhfScTX9XRerpErJMmBZ33wZ8pElsano15x3A4Roks8ap4OFr9Ae1rSMzpkMxXu/8YgSB3
	y8tyWncpoQkYxNtXnBYck5Fpcl0GeuxaJMMoYJ/SXWFm5mm8sl0r3GiLk1IjMY7zxOr2GYj2XpodF
	VW9J+UAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWL6M-006BNO-DW; Thu, 08 Sep 2022 17:14:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWL4O-0069by-R5; Thu, 08 Sep 2022 17:12:06 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 515486601F99;
	Thu,  8 Sep 2022 18:12:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662657123;
	bh=O6Q6pQLSe215V4afYGc/Z7qOQ/faIT1gKwtDzzYCHdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UuZXr7ryQqAQ8jwQdLPJnw8K+vSwFlAsJoPNZk4pVXjUB+7fpq2wUKQocv3BXVyTe
	 uiY96G6ooylMqN+c5PXIyU7q0t9Hh5WB46YqYnxGYNqBLP+F5SVtHZcAbvqUeRf2lM
	 RNjmwnLHdr2ITaPKaka7c5gykGqQSbxRjo/9+9EJMInEsUx1N82m7FHXV63hQhlJuw
	 Y6ZjCOLOsYRzK7kZPKZ9sNpoQ1Vc87WNvSUi4LwxYiJL50CHNZGfyhAjZVXBR21NqR
	 5Re6hH0nRa86G+wnbfwo4vHFOV6Of964YTn5THyAsov+wO4ta30RZxUubUTcZI9ZxB
	 2z1v8vHZmkdkw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: mediatek: asurada: Enable internal display
Date: Thu,  8 Sep 2022 13:11:53 -0400
Message-Id: <20220908171153.670762-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908171153.670762-1-nfraprado@collabora.com>
References: <20220908171153.670762-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_101205_061699_6766CE21 
X-CRM114-Status: GOOD (  10.73  )
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

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 33ef55b6dbe1..fde8548f67ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -200,6 +200,14 @@ wifi_restricted_dma_region: wifi@c0000000 {
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
 
@@ -248,6 +256,53 @@ &i2c3 {
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
@@ -258,6 +313,10 @@ &i2c7 {
 	pinctrl-0 = <&i2c7_pins>;
 };
 
+&mipi_tx0 {
+	status = "okay";
+};
+
 &mmc0 {
 	status = "okay";
 
@@ -589,6 +648,20 @@ &pio {
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


