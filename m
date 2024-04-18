Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85878C04FFF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 14:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LxZnDfBBsSZsbOynZIpZWzKEzA7XkCmlsLul0hC9xI=; b=3H3XzaLo1kswwxSTni6heFo6pe
	Ul9v1xyans7jffIRvrpKyRBQcH/5D5xbpvIot5qaTwcHU6WbOuE7dCns6aU9ka6LHWyMxrjjjwj7W
	P54G3Fg8kFE1mTmt9zhvaxpSX+ESzu0S/FLDn2+nnvmT14FmLcuIoaYiHdzz1YrX0YEUM3AcO0jBi
	fdCSWswzCtpchYWyWXoRgW6Efba2Nii9TQbwd1857J7A0W48S/871yaDQKwNbU6vKlvPk3jX9kArL
	DbJFd5tDzXeM54FWBNwof56qY+VFpuNAxSomQB3yRKhXVtGjuJsCvrREkeqDkP4Mo0OlRWF7s5IJq
	bRX0oZvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSbG-00000002ZXM-3uEm;
	Thu, 18 Apr 2024 14:18:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSa9-00000002YqR-1GfM
	for linux-mediatek@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=2LxZnDfBBsSZsbOynZIpZWzKEzA7XkCmlsLul0hC9xI=; b=ROwhQmL7S1gYuuLH1MAYTx7tBc
	M/sq3FeVsDyuQHic7UhkNKrfVsNPX/BkFtJp4IVMrgrs3+uYqV3Xgx4yT3+K7ZZDj1+Y123vLFTUt
	q9ioCfJUq2oPC395STjNKjxRI47GASS8tubJgiF8+Sdl4ulBDNWf78qLJzkYzE5XEpMdQrEMEkook
	IlT7C/D1lbgZrpg5/ewL1NTclhxXiv6QfCS6t/xyrskeh/UU2EsEWuqLZv+I+SgfXXTH+aGPtIZNQ
	qQ7kUV8UuGruO4LxOepL0MlQd0XpVeeLJuuq9Z9QmKQT10wO8Gx8EJS6zmJY3R45Knxhb5S45WWwa
	GrlJt9/w==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSa3-00000005Ux3-3JXR
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3465921600dso776458f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449858; x=1714054658; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LxZnDfBBsSZsbOynZIpZWzKEzA7XkCmlsLul0hC9xI=;
        b=mSyBESpXNw2u2HxZeAON1I2sLyGmyG0FDWnSVxNQssAsHC/FjCFhhiX53MdFL2Yp8D
         5FSP97ejrcW3zprAUTLTJCdKfAVgoHgd2L3cXfZ0mExBbhuJV3QeWCgh6gRc1/SZnI/o
         m49EcrB0z67sxZN1IE7FRGdUUUMQjqZjwiAo+M0UPXXqfYrEXWS4IMPOHI8bO+wWuRj8
         MnRPHaxX6I3Q1g1HI1C/KRwka2ZQ3gdKM+m6SMxYhkKsZ4r8Xzytz41w5DjtsJHNblSf
         E2lHoGB0TQxecOfjswP9BBf+bmJWzgyWHFHnK9YjMlz+CSNrDZQAmD/MxImoShImKKkU
         RtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449858; x=1714054658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LxZnDfBBsSZsbOynZIpZWzKEzA7XkCmlsLul0hC9xI=;
        b=f0J0EqlkZhyyFAjvUszkl512kCsfum5tPGwrudfYTuN7NJx5ytbiT3/MlfaWRAcLyG
         wC2mgt6v982C8Y+9h4opp+IYcuTW5wTd1b5Tg4MJd9eT+xiOXtai1p8XVszqEdUvLthS
         NaPpdKA5lwlrX66gjv2nRguxxEBZySJkclE2HqUd6mpzSBIbfjM2qDvxeIB5xrNrEMRm
         dz/x2YlajB/UQV4rNaGg/Ohf75alMEcJBjJ+mr7oVowhkd0zfaPgwmdcDsa1+sW/gdNS
         WtD1afKSCy9Lhywl6scLycuZk2VI1C8pYuiqVP6pQrAvg1bQxVX8+mAXJ/lGwNnxLGVT
         j5Rw==
X-Forwarded-Encrypted: i=1; AJvYcCV1HtmNN5oDvOO2fGhqCTqCC+SRncIgskiVMDyrbbAPKq1UKvClU1j2Pv9hZ+BSOJYQ3VGx1Bji8QgyJxZzNTGxnwHuGvr7iQgI3/0mzdulHpOc
X-Gm-Message-State: AOJu0Yx3hOVWRrMEkN7t2n2YiLFrvnz8BPwwA+Ay99msfFYgWLJ38kmD
	SuOT4WmEGSVRX9Y0cj+Ps9Yzh5jZDTfcf5EmYrQsSSwcKMx/eXO95079Nj2kNHc=
X-Google-Smtp-Source: AGHT+IEU/vGe7iKZX75StE6zV/YVZi9beeEUMWK/cihBcPSqLnKclRzqeY7lx/4gLXX5NVON66alWw==
X-Received: by 2002:a5d:560e:0:b0:34a:6be:6565 with SMTP id l14-20020a5d560e000000b0034a06be6565mr1567571wrv.64.1713449857877;
        Thu, 18 Apr 2024 07:17:37 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:17:05 +0200
Subject: [PATCH v3 17/17] arm64: dts: mediatek: add display support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-17-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5974; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=7BtbvWn/1WLef8Gz6HxaX5K+etTb0ncuoq9W1NCXqak=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjLgW3EAk32znYUVI1ZaO0Xua5lmE2DEFI+Qdh
 8LCDdASJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHURSngEA
 Ch/ENx3t4Ig79YfihJ3EREr6shdqqEyaJN/2srC67mJJOLMNsqAE6RVsiENe/Yv/xh6QKuRwpbZmOs
 kB64M2L/9cYH1TdjKz0nCzouFeg31PFSNyW/CIpLctTSgqnpoV9yLQgUj1hDn3QRxvVmdZYjxePTAS
 qd/m0yDFqJxV58o0+WPSUx4af/If+zvo9jQF0ouC30IVzXAbsZ+98uiqpUb0kfHT5zey4mbL9SRW/O
 bTs5UxtgZCBs/4I/gZwqFoLQfWBjDL18Qhjg39RyXRi9PnumSIn0TvxDV76EWvvE1xU5Y16RBebxVr
 vSK1Sk7gc6K8WiIU/2I8TyUJUS4wLQyGuZbvqcmg0sBwJnVcOBObz4e3WscNROfpZpnTKPxaMT+k4y
 NVenlRTtisW7id6oH9jwt0y7MHbdqqzmSQEc3RPpKbdsk2ETLaIqQIGlp1e81HxAsQBwR1MLeg3OQW
 2S+ymgH4RyjSeL/1BQTt1OOCK6MPHaizS6W8ZaBcHG7PID6ec0K+8o3EDtHf1ZV08kIUHQEqQgyvJM
 Hg81/kyHax7kmUIY0dxKwV/66aoLXkw2rjFQqm+D5job+Ijra0/OyoDEVHYZZ5n7xXRgh9z30HP2y8
 bqnayBKJ6L/pgZoZv3Qlqb0CFswo2bv5WGGho08yodYcr20GP1pKqqFf3cCw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151739_918103_4F17B4ED 
X-CRM114-Status: GOOD (  11.91  )
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

MIPI DSI:
- Add "vsys_lcm_reg" regulator support and setup the "mt6357_vsim1_reg",
to power the pannel plugged to the DSI connector.
- Setup the Display Parallel Interface.
  - Add the startek kd070fhfid015 pannel support.

HDMI:
- Add HDMI connector support.
- Add the "ite,it66121" HDMI bridge support, driven by I2C1.
- Setup the Display Parallel Interface.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 180 ++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..1aa3426f561b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -26,6 +26,18 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
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
+
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -86,6 +98,55 @@ optee_reserved: optee@43200000 {
 			reg = <0 0x43200000 0 0x00c00000>;
 		};
 	};
+
+	vsys_lcm_reg: regulator-vsys-lcm {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 129 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vsys_lcm";
+	};
+};
+
+&dpi0 {
+	pinctrl-0 = <&dpi_default_pins>;
+	pinctrl-1 = <&dpi_idle_pins>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+
+	port {
+		dpi_out: endpoint {
+			remote-endpoint = <&it66121_in>;
+		};
+	};
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "startek,kd070fhfid015";
+		reg = <0>;
+		enable-gpios = <&pio 67 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
+		iovcc-supply = <&mt6357_vsim1_reg>;
+		power-supply = <&vsys_lcm_reg>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+
+	port {
+		dsi_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 };
 
 &cpu0 {
@@ -138,6 +199,50 @@ &i2c0 {
 	status = "okay";
 };
 
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-div = <2>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	it66121_hdmi: hdmi@4c {
+		#sound-dai-cells = <0>;
+		compatible = "ite,it66121";
+		interrupt-parent = <&pio>;
+		interrupts = <68 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&ite_pins>;
+		pinctrl-names = "default";
+		reg = <0x4c>;
+		reset-gpios = <&pio 69 GPIO_ACTIVE_LOW>;
+		vcn18-supply = <&mt6357_vsim2_reg>;
+		vcn33-supply = <&mt6357_vibr_reg>;
+		vrf12-supply = <&mt6357_vrf12_reg>;
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
+};
+
 &mmc0 {
 	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
 	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
@@ -180,7 +285,55 @@ &mt6357_pmic {
 	#interrupt-cells = <2>;
 };
 
+&mt6357_vsim1_reg {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
+
 &pio {
+	dpi_default_pins: dpi-default-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_DPI_D0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_DPI_D1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_DPI_D2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_DPI_D3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_DPI_D4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_DPI_D5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_DPI_D6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_DPI_D7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_DPI_D8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_DPI_D9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_DPI_D10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_DPI_D11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_DPI_DE>,
+				 <MT8365_PIN_13_GPIO13__FUNC_DPI_VSYNC>,
+				 <MT8365_PIN_14_GPIO14__FUNC_DPI_CK>,
+				 <MT8365_PIN_15_GPIO15__FUNC_DPI_HSYNC>;
+			drive-strength = <4>;
+		};
+	};
+
+	dpi_idle_pins: dpi-idle-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_GPIO0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_GPIO1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_GPIO2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_GPIO3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_GPIO4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_GPIO5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_GPIO6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_GPIO7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_GPIO8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_GPIO9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_GPIO10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_GPIO11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_GPIO12>,
+				 <MT8365_PIN_13_GPIO13__FUNC_GPIO13>,
+				 <MT8365_PIN_14_GPIO14__FUNC_GPIO14>,
+				 <MT8365_PIN_15_GPIO15__FUNC_GPIO15>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
@@ -222,6 +375,33 @@ pins {
 		};
 	};
 
+	i2c1_pins: i2c1-pins {
+		pins {
+			pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>,
+				 <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
+			bias-pull-up;
+		};
+	};
+
+	ite_pins: ite-pins {
+		irq_ite_pins {
+			pinmux = <MT8365_PIN_68_CMDAT0__FUNC_GPIO68>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pwr_pins {
+			pinmux = <MT8365_PIN_70_CMDAT2__FUNC_GPIO70>,
+				 <MT8365_PIN_71_CMDAT3__FUNC_GPIO71>;
+			output-high;
+		};
+
+		rst_ite_pins {
+			pinmux = <MT8365_PIN_69_CMDAT1__FUNC_GPIO69>;
+			output-high;
+		};
+	};
+
 	mmc0_default_pins: mmc0-default-pins {
 		clk-pins {
 			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;

-- 
2.25.1


