Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE883C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aeveSHt2Dhl0OrC5qhe/Wqr/CxYyS8zrYtet/bJxa3I=; b=w+s0g7gmsPngYyOppSmNEcYRXN
	cUeifFgvvc17yrp1iB+/MxsodRK/Xn+M7ea1dyOYnWQkjnlq2I901lRoo3aV2qzPXN+Mb4yYOL3nW
	bGA/lb+Ase8ncjMcPz6XOLrFPDrWYpMeBl7Xr44Mf5OzduoXZ1eXc71rybwxZ98rseg/Xi53AqqMk
	plL6HqpDBjTCugjIjsKs7woZDzeg7MNUyKf7RLHsgIxkKyArTy2IBZcFSlfl5RyD3Q28mkxxp5iGq
	P3lBgVNU2/h4REOYUETDHeZfHMcZ0Jhlx01EzpUbie2YuXXjCnfdefDTM56y3PDW0coykhzpn50TQ
	SIs4CEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg1JT-00000001Ojx-2gQi;
	Mon, 19 Aug 2024 12:16:43 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg1Ay-00000001Mdp-1P72
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Aug 2024 12:07:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2020b730049so19392285ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Aug 2024 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724069275; x=1724674075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeveSHt2Dhl0OrC5qhe/Wqr/CxYyS8zrYtet/bJxa3I=;
        b=hfaDf95GCt0CDE4iqaunnO7d0iBoyuLFPn66a7kFI5DhZ6+66hI7I0/T/6iIs3RHIT
         QP4Y29xAlHwWWzipKGhEI9XhFaFHY5y5EzoiMcZZ4DkApDJBNiVcJRK7R2pwPf2xqcYV
         S27b4lh74C1H7v9TLNkXKGQ+Zp3yo5Z/qHHVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724069275; x=1724674075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeveSHt2Dhl0OrC5qhe/Wqr/CxYyS8zrYtet/bJxa3I=;
        b=dHwN7ATygGCu1K32vAVI6lGPZU+HzJoUvprJsSb0tzYsbxUplmLS4KA9DTcq7Zqec3
         Awb10SUXCvnQLVAwdbjfaxJx7foxfQjMClxuv3CBlxaDeSB9bQ/0PU5EX5V+e9RZKFca
         zd3Mww88f0AAM/8dX0yWt0xHQiXLwLOy4eYHcSOPn9nSMhvYyajJxFnTTbikzh5y5Br0
         uHBusHh6gQntcGfnORGjT+uhCwFyal6oVK+q436EycadCV3AFXYvbCjBE8Bb2+b0/Z9Y
         Szl0ruVFfQnsXt3bGNLRStgZ417AGtboBjxJgx4RaG5k6Jp9nnFmx/+KjUL6+RqZvfDj
         f91Q==
X-Forwarded-Encrypted: i=1; AJvYcCVP1buCGCLl75AmOKmEjfScHXh4gwRq3XfaI51hx/iO88I/dM7Y4ZVJM3j7ijFuNwpBN1uIFbd58mrvtqvlAE83nGXIybL5lWPTkfEWnkcVQxB8
X-Gm-Message-State: AOJu0YyeiFbtp1CGWUgderx58eMXNW1BeNCCAOTBUrH8sIcp1GxRs3xt
	5dT6wXUEPiEoeII+VQjCVOhUkqQf5exBPvxjOjgjawg0XsCqBbjRDnyT2s5FPQ==
X-Google-Smtp-Source: AGHT+IF+bdj7mCBrUTJIkD7ifKIfTYDhTVpu/VvDtc8O/oxVCH4g0Le2wu0pqP/J1FsdhwQ99TPpDA==
X-Received: by 2002:a17:902:da8b:b0:201:fac8:ff67 with SMTP id d9443c01a7336-20203e9b6c1mr107454945ad.17.1724069274816;
        Mon, 19 Aug 2024 05:07:54 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:923a:77c1:913c:bcb8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f02fab02sm61802005ad.48.2024.08.19.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 05:07:54 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	Fabien Parent <fparent@baylibre.com>,
	Pin-yen Lin <treapking@chromium.org>
Subject: [RESEND PATCH v2 2/2] arm64: dts: mediatek: mt8183-pumpkin: add HDMI support
Date: Mon, 19 Aug 2024 20:05:56 +0800
Message-ID: <20240819120735.1508789-2-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819120735.1508789-1-treapking@chromium.org>
References: <20240819120735.1508789-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_050756_442467_5B44E5C8 
X-CRM114-Status: GOOD (  10.94  )
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

From: Fabien Parent <fparent@baylibre.com>

The MT8183 Pumpkin board has a micro-HDMI connector. HDMI support is
provided by an IT66121 DPI <-> HDMI bridge.

This commit enables DPI and add the node for the IT66121 bridge.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

(no changes since v1)

 .../boot/dts/mediatek/mt8183-pumpkin.dts      | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 1aa668c3ccf9..ecc237355b56 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -63,6 +63,18 @@ thermistor {
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
 
 &keyboard {
@@ -362,6 +409,67 @@ pins_clk {
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
 
 &pmic {
@@ -415,3 +523,16 @@ &scp {
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
2.46.0.184.g6999bdac58-goog


