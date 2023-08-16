Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E014C18E72
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 19:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E6GD7d7dLWCTW1Is0uOy0UQaSZ2XDHsQ06AcHL+ampQ=; b=PfTqpl6CyADVXidwGwt6RPHAXj
	+x2wzsEQmqrIoyDTR2k3XsDkL3pZ8ifqOR/ur1YlWL2AuLylb2Aeksvixg1IiedQo9dMesMQy1IR0
	x+RlOG4BmIvQTgV6CdQvtiWvnfDqsuLcsrEAL4JQXikGDXhNY3YKzR1eFZkkztYieUMf9GCezWMzy
	W89rA6AbI98C8rnzm9Jn2mXukYqDhHRWfwrQMW8wDrgL55U69tIV++65/ggp9+srd7EvQZzVHUt/V
	lGsji+W9UJGS+vQ0M3Rjs8vJq6lmlQnZ39PqBQ1Qrs3kTs9Ov0bK5KEdlv8T+HL+jGSZOHm3TGy0u
	uiBSNeQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWLp2-004rPW-0s;
	Wed, 16 Aug 2023 19:04:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWLoy-004rOm-2o;
	Wed, 16 Aug 2023 19:04:46 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E1DA566031F9;
	Wed, 16 Aug 2023 20:04:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692212679;
	bh=grEIxwyKWyaQ5DQD9LOQJqFA2qXty1UB693xBcBE02o=;
	h=From:To:Cc:Subject:Date:From;
	b=eFFZtCQKOPsXXlPcCnjRMP15CAFzGizQJgr5QYp+Mfj+/l+tbetzvVq3HpVTKjesY
	 gOfMVulywRu6DLrb0cBBahI0u6kfLWArgTt1hMeKpu9GQWGhKvbG54C3MxD6DGn8pU
	 S9ox2TscEfiS6pf8IlgA4ruK0ntjR99q44vRx4fA7ExLZM6KURcJ3Hwmc65f7/cl+z
	 Dzml/H2zBnKKZT+oI2xqbTjmrjNvs3xbF+dKsJqdsUySbDqeR6NP8HE5KRR+y/RFfg
	 OqXJ/PLHXhhUAz4tDqwW1+k0JIKjV8M9Kvuxj0l37Nznv109H8nmGaXW/A4ce+7XkF
	 A7jqZiES2tYSw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3] arm64: dts: mediatek: cherry: Configure eDP and internal display
Date: Wed, 16 Aug 2023 15:04:16 -0400
Message-ID: <20230816190427.2137768-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_120445_081318_1786C12E 
X-CRM114-Status: GOOD (  12.64  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add the required nodes to enable the DisplayPort interface, connected
to the Embedded DisplayPort port, where we have an internal display.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
[nfraprado: removed always-on, added vin-supply and enable delay]
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---
The MediaTek DRM changes needed for MT8195 have already been queued for
v6.6 [1], so this DT patch is the last missing piece needed to get
a working display on MT8195 Tomato.

[1] https://lore.kernel.org/all/20230813152726.14802-1-chunkuang.hu@kernel.org/

Changes in v3:
- Split from "MT8195 Acer Tomato - devicetrees Part 3" series
- Removed regulator-always-on as it's no longer needed
- Added missing vin-supply and regulator-enable-delay

 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 37a3e9de90ff..dd5b89b73190 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -47,6 +47,19 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x80000000>;
 	};
 
+	pp3300_disp_x: regulator-pp3300-disp-x {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_disp_x";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-enable-ramp-delay = <2500>;
+		enable-active-high;
+		gpio = <&pio 55 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_fixed_pins>;
+		vin-supply = <&pp3300_z2>;
+	};
+
 	/* system wide LDO 3.3V power rail */
 	pp3300_z5: regulator-pp3300-ldo-z5 {
 		compatible = "regulator-fixed";
@@ -217,6 +230,20 @@ port@1 {
 			reg = <1>;
 			edp_out: endpoint {
 				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+			power-supply = <&pp3300_disp_x>;
+			backlight = <&backlight_lcd0>;
+			port {
+				panel_in: endpoint {
+					remote-endpoint = <&edp_out>;
+				};
 			};
 		};
 	};
@@ -881,6 +908,12 @@ pins-bus {
 		};
 	};
 
+	panel_fixed_pins: panel-pwr-default-pins {
+		pins-vreg-en {
+			pinmux = <PINMUX_GPIO55__FUNC_GPIO55>;
+		};
+	};
+
 	pio_default: pio-default-pins {
 		pins-wifi-enable {
 			pinmux = <PINMUX_GPIO58__FUNC_GPIO58>;
-- 
2.41.0


