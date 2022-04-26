Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F91BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrnhK9BuqgIlPuDS/+lEAkUgNAqDZaeVN+hT9b5SKw0=; b=SgmIDbYtCfn9Un
	cXsZNjgI+ZkjNyY2csswtpDQrXCl+WjkEytiW3Mzdk2lhWYEsH9kUgRaQkWA7GGOXM9T+WCXO45GI
	22EvbmvLCP1xZd0ec0aYTO345Cyt9eVvEybIzt6+kYcdw6FyIwNFHmSDFnhV/RnVWSZQ3IPKX+G51
	H2shPfykAQnlZpbnYbhxXuDSNiGdu+/uWGkJmND8DxBZ3pkRTDKMcWUr9FLT0seY/5pQ31lLsG6rv
	D7MLfYmcLrlWek+KFD0npNB3lyEy1Y1WwQxOp8TiiqC//le9l4VPCRq9jIcGLeEzyTNTPnpt2I38a
	9kyF1ztvbbwD2rn0QvdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njOKu-00FOpc-Vs; Tue, 26 Apr 2022 16:46:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njOKR-00FOXP-SQ
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 16:46:21 +0000
Received: by mail-wr1-x42c.google.com with SMTP id e2so20018079wrh.7
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 09:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hDUErSF+n1k4cG7IQv0rQoHbdfQHDvgwLI/ub82oI98=;
 b=kN1kjMj3AUcIxo+isiGbvhu7TC4PV+So7N1BvAQzcaE48QfCfbPjXiHPKOG6zQliuA
 ER+yoD75Uc33LlmE99guO8c7Ubxx8haampaZds46hwE/b6ZhPM5C3oAdiylNdirL+STx
 pSbXgv5rwilHw+43iW3IOCZJ0Hmt1GDZULXi0LPGK6KEPf6JUVJ3OuyEUn/EgoZin51p
 1JNHrR9MhvYCpXQ060nrxpEA7dqfa+hPyl/+5eFJlGKlyns+DEyoSsL6NAU5g/Drtpp2
 IQIvnM7ReE15C7n+NtMbu4ig2qJLOtcMrAOu8/xnFtvC0Gxa1duo6KQVTWkylLVfcnvm
 EQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hDUErSF+n1k4cG7IQv0rQoHbdfQHDvgwLI/ub82oI98=;
 b=Ldh+ulKBfgJkoPI9NbEp0kXigeU8VJwLlgFze6UBq2lAOUFc8xdc/P+wrE16HGfFdC
 mYg3864CQIMYAywY4uF5CFlryUQRl46iT24WXexrZDSma/+ZnnxHsvE5YHMaO2HpWdU7
 DzwE/E9yEeY/MZUpTosT2rHt9UshMdGc8XEletcNdTqKwkRgGJrG97bSWd0Ql870RKGi
 1nLJDM//PKy3Bdm7m0MLf8v89uZ2IFnls7yCG7P+KJSZFGmWFyfax/F/7n0PONoy4FqS
 lq6ijZ12rxenjlNyCKtquVFBALV2ONJxl2O5d+VLOPIX0VNM/5mBTFH5pNI2i7P0mpVo
 yewQ==
X-Gm-Message-State: AOAM530FWkmEfWc/Eracx9f/KDaxfNdOc+zm1lKKInGocQcedVaqTn3y
 ajvJMsgCKxNB2NciQuPxhv6q9A==
X-Google-Smtp-Source: ABdhPJwDpUz3osm/6WMOLqtZWzpqkpSglRhHXyNOzKVIBhSeAfIer9VL6SBEZjBTZd3EB5JnlNnqcw==
X-Received: by 2002:adf:fe47:0:b0:20a:c899:829f with SMTP id
 m7-20020adffe47000000b0020ac899829fmr18600290wrs.165.1650991575214; 
 Tue, 26 Apr 2022 09:46:15 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a1c2506000000b0038e6fe8e8d8sm14499539wml.5.2022.04.26.09.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:46:14 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8183-pumpkin: add HDMI support
Date: Tue, 26 Apr 2022 18:45:47 +0200
Message-Id: <20220426164547.434324-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426164547.434324-1-fparent@baylibre.com>
References: <20220426164547.434324-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_094619_967110_F37EFF13 
X-CRM114-Status: GOOD (  11.53  )
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

The MT8183 Pumpkin board has a micro-HDMI connector. HDMI support is
provided by an IT66121 DPI <-> HDMI bridge.

This commit enables DPI and add the node for the IT66121 bridge.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
v2: rename pinctrl node names to not include any underscore

 .../boot/dts/mediatek/mt8183-pumpkin.dts      | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index ee912825cfc6..10b2c0500219 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -62,6 +62,18 @@ ntc {
 		pulldown-ohm = <0>;
 		io-channels = <&auxadc 0>;
 	};
+
+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_connector_out>;
+			};
+		};
+	};
 };
 
 &auxadc {
@@ -120,6 +132,41 @@ &i2c6 {
 	pinctrl-0 = <&i2c6_pins>;
 	status = "okay";
 	clock-frequency = <100000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	it66121hdmitx: hdmitx@4c {
+		compatible = "ite,it66121";
+		pinctrl-names = "default";
+		pinctrl-0 = <&ite_pins>;
+		vcn33-supply = <&mt6358_vcn33_wifi_reg>;
+		vcn18-supply = <&mt6358_vcn18_reg>;
+		vrf12-supply = <&mt6358_vrf12_reg>;
+		reset-gpios = <&pio 160 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&pio>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x4c>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				it66121_in: endpoint {
+					bus-width = <12>;
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				hdmi_connector_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
 };
 
 &mmc0 {
@@ -332,6 +379,67 @@ pins_clk {
 			input-enable;
 		};
 	};
+
+	ite_pins: ite-pins {
+		pins-irq {
+			pinmux = <PINMUX_GPIO4__FUNC_GPIO4>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pins-rst {
+			pinmux = <PINMUX_GPIO160__FUNC_GPIO160>;
+			output-high;
+		};
+	};
+
+	dpi_func_pins: dpi-func-pins {
+		pins-dpi {
+			pinmux = <PINMUX_GPIO12__FUNC_I2S5_BCK>,
+				 <PINMUX_GPIO46__FUNC_I2S5_LRCK>,
+				 <PINMUX_GPIO47__FUNC_I2S5_DO>,
+				 <PINMUX_GPIO13__FUNC_DBPI_D0>,
+				 <PINMUX_GPIO14__FUNC_DBPI_D1>,
+				 <PINMUX_GPIO15__FUNC_DBPI_D2>,
+				 <PINMUX_GPIO16__FUNC_DBPI_D3>,
+				 <PINMUX_GPIO17__FUNC_DBPI_D4>,
+				 <PINMUX_GPIO18__FUNC_DBPI_D5>,
+				 <PINMUX_GPIO19__FUNC_DBPI_D6>,
+				 <PINMUX_GPIO20__FUNC_DBPI_D7>,
+				 <PINMUX_GPIO21__FUNC_DBPI_D8>,
+				 <PINMUX_GPIO22__FUNC_DBPI_D9>,
+				 <PINMUX_GPIO23__FUNC_DBPI_D10>,
+				 <PINMUX_GPIO24__FUNC_DBPI_D11>,
+				 <PINMUX_GPIO25__FUNC_DBPI_HSYNC>,
+				 <PINMUX_GPIO26__FUNC_DBPI_VSYNC>,
+				 <PINMUX_GPIO27__FUNC_DBPI_DE>,
+				 <PINMUX_GPIO28__FUNC_DBPI_CK>;
+		};
+	};
+
+	dpi_idle_pins: dpi-idle-pins {
+		pins-idle {
+			pinmux = <PINMUX_GPIO12__FUNC_GPIO12>,
+				 <PINMUX_GPIO46__FUNC_GPIO46>,
+				 <PINMUX_GPIO47__FUNC_GPIO47>,
+				 <PINMUX_GPIO13__FUNC_GPIO13>,
+				 <PINMUX_GPIO14__FUNC_GPIO14>,
+				 <PINMUX_GPIO15__FUNC_GPIO15>,
+				 <PINMUX_GPIO16__FUNC_GPIO16>,
+				 <PINMUX_GPIO17__FUNC_GPIO17>,
+				 <PINMUX_GPIO18__FUNC_GPIO18>,
+				 <PINMUX_GPIO19__FUNC_GPIO19>,
+				 <PINMUX_GPIO20__FUNC_GPIO20>,
+				 <PINMUX_GPIO21__FUNC_GPIO21>,
+				 <PINMUX_GPIO22__FUNC_GPIO22>,
+				 <PINMUX_GPIO23__FUNC_GPIO23>,
+				 <PINMUX_GPIO24__FUNC_GPIO24>,
+				 <PINMUX_GPIO25__FUNC_GPIO25>,
+				 <PINMUX_GPIO26__FUNC_GPIO26>,
+				 <PINMUX_GPIO27__FUNC_GPIO27>,
+				 <PINMUX_GPIO28__FUNC_GPIO28>;
+		};
+	};
 };
 
 &mfg {
@@ -381,3 +489,16 @@ &scp {
 &dsi0 {
 	status = "disabled";
 };
+
+&dpi0 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&dpi_func_pins>;
+	pinctrl-1 = <&dpi_idle_pins>;
+	status = "okay";
+
+	port {
+		dpi_out: endpoint {
+			remote-endpoint = <&it66121_in>;
+		};
+	};
+};
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
