Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CF1C77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 09:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxShFp+vG3MU9eevaMFduyVR3LMcUEQ6+o4e6xI3KTk=; b=qKulPuOzw5Q4Bcm+lz7mGVb/Y3
	//uDJxpLdqSPjLo0UVKsqEFsZjOASwhb5LbuRu5IPjkaKu3usMhm7gJKY4hfQHPBHvATpFbwH/Rwi
	0gGMPtbabMqkqJ0VwsrcflBeX3g9GYu5gx03oHcYVRVu25KhLmXA7Vv/DLpj2TSk0NKNqTjz9ohKn
	ZIb5aLR1D8dg0zvhaTas8kzE2DU/BtFP6Gr2Msz28u38sNH3/Iueus5y5w+YdxgSzSd2eOz2iMkEf
	qFt7fwk2ib/G2n3wJcYWdLbB/xa1vDL2GSvtw4Ck9OXbrfycW3ntHNn/aVYZBukLQUVMZNnKI7JM+
	0RpsaByQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQqm-007ZZe-2v;
	Thu, 20 Apr 2023 09:45:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQqP-007ZO4-1e;
	Thu, 20 Apr 2023 09:44:51 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B514660326A;
	Thu, 20 Apr 2023 10:44:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681983887;
	bh=fC1d8huFvPOOCW64+wcCniknUVcXFTC03FCZg2pqhtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZBhwgTosEEVyMRd/PfHblTVCBMZCItX0xFo8dyPJxD/t2veFZ0KIncrUT/m1Ng7x4
	 Zcjs7F7US6oCH54PwAE86mZx7Vlj2Fe0UudxO4ssmZmgtqaOixgaINt8zokeXorNTV
	 fEV9FtPe9Fc8kfM7PrjsfrZOc/ZRpmkaNsFSP+agyun1CJsshWA9vjkVyrB7D2A/bv
	 PMVijfFWYkKJyy5UOtMAo7QfLmXKS4sXEfIIxhqdcSERIKdosWQRkKNAohDZRjMyov
	 2fQVn1+J0cWZFjRdmq1YAXGzbu/xX0y7KUm7BG3CO+YeIKmjUOEsBwG44yBrDGG5AR
	 SIFHJZJJlsUzA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/5] arm64: dts: mediatek: cherry: Configure eDP and internal display
Date: Thu, 20 Apr 2023 11:44:31 +0200
Message-Id: <20230420094433.42794-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_024449_695932_61D0C3D4 
X-CRM114-Status: UNSURE (   9.37  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the required nodes to enable the DisplayPort interface, connected
to the Embedded DisplayPort port, where we have an internal display.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 918380697a9a..46f1c8091498 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -49,6 +49,18 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x80000000>;
 	};
 
+	pp3300_disp_x: regulator-pp3300-disp-x {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_disp_x";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&pio 55 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_fixed_pins>;
+		regulator-always-on;
+	};
+
 	/* system wide LDO 3.3V power rail */
 	pp3300_z5: regulator-pp3300-ldo-z5 {
 		compatible = "regulator-fixed";
@@ -290,6 +302,20 @@ port@1 {
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
@@ -929,6 +955,12 @@ pins-cs {
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
2.40.0


