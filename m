Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4427C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:24:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F3C561205
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F3C561205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iC6tUUD4NUOCb8Ud7CfDgpUK64Lw8TnGtC4dCTgbMWY=; b=aa4HGy6W1ldlud
	PjIHlRk+IJIi1NTmFZIu97Jte4le77tBS/bNaeVeEIAN1udqm5QnQQ3mPjoL9dbuXEBY6QH9O117g
	WHuDfU/2VIej5AvGpas7veTVOFITQSkLOKsHle84QIJ2CG4vUffaJ3+Rob6Ir0/U/+9oaqUciImyl
	UvUonzacHGYT1EOFT0lZLESpVXuHIMZ3XaJG2dME/8/EtRGXpMuWSsLY8txa7RGG8JzuLtoRmFEz1
	NViquUyoZ4M+o4QSBTXujTPMY4IaoMK0qNmS9G+SgWMMcDCDeKTYXRFFP2yjg+fnFvr5+L9lSQx3/
	vpiiW/tf1+E42+Kdm/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktDI-0068JM-Ob; Wed, 10 Nov 2021 19:24:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktD3-0068E0-Ii
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 19:24:39 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so2769451wmz.2
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 11:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TkI4GyDCSIwmbXr9V/MQ9+7DcTXEuCd0g4gBgL+0EyA=;
 b=i7Z1Pn8QdFKfxUDCIMDU7Nl9er7l71NiK2V1C90wAjvXBpTR0hSMvTNt2R+6QFxiZc
 B9NzrWeTGyq9I1dGtU6DW9LmHuWZaQ8YqHkROyvYY5z6D9YUHiDs+bfg/nCilHhvZE+H
 8v0G7m8bOqLOhSUx3RG/nR6sxnmclH1TjGzbxs158ez2Ig5k22E/oRoz1V4HsYBz+L65
 B51Q0GyZ8VwUtJY3k9R4oHTgz/oVV3fjU5Ib1UeoQasvv4dO7KvguV77bIO6Kg8Rv5W9
 ALMO+d9fLuS3+Z5ddKtCfzLjKSeiSyu7CXvW+9ZBdzkHLQBSNrJ3UCrEn230+xVjreqB
 qdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TkI4GyDCSIwmbXr9V/MQ9+7DcTXEuCd0g4gBgL+0EyA=;
 b=LRIUS8j+LHUTcLgbhiWbw75ENfEYFG+xXwHrLwTCMf9UQ0zj2zDyMnX+lsqrsmne5x
 GpoMcFrxs/sQHLQba0SmniEwDoUfcGMnD4SE8fhuxf6jbwwoiayhyrPw39w9LEeKXVcA
 eUMg+YYN1ZqpcUzRRbEOJpwapbp3f/1OCKu1t/4z2uGRHOkfXB3A4FJVRATNPz+pfzxV
 OJi9hpEDMpSh+U1xK2sYa1osMNyGIZU4u6VinRY3Y55tulvOqZJ/RnCiuiVJDb60XD+1
 buQAPAsHqXcrDaLcuF5ISyIa+wwOzXo6P36nlG9PyfH8PROuE9DUIvkSuMQyyVaL5h5/
 TtJg==
X-Gm-Message-State: AOAM531t7IZZ18Q+VMp0zfc7h0bA6YvpxremNeIe1ftwasJRdcqDS0Je
 BiRNbWnCqY9VGm1NNnNKY9WTlA==
X-Google-Smtp-Source: ABdhPJzRUmYbyJGZmJg6Yqk42aKpyaRMUXbxlNPTEK2WhaJfvzp/Rwxnr7av9EPW/dLsGsYFs6jjjQ==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr19188607wmc.31.1636572275780; 
 Wed, 10 Nov 2021 11:24:35 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id d16sm6250113wmb.37.2021.11.10.11.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:24:35 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8183-pumpkin: add HDMI support
Date: Wed, 10 Nov 2021 20:24:16 +0100
Message-Id: <20211110192417.4177741-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211110192417.4177741-1-fparent@baylibre.com>
References: <20211110192417.4177741-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_112437_647282_68D16B1C 
X-CRM114-Status: GOOD (  11.39  )
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
 .../boot/dts/mediatek/mt8183-pumpkin.dts      | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index ee912825cfc6..d5a6628e9c5b 100644
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
@@ -332,6 +379,61 @@ pins_clk {
 			input-enable;
 		};
 	};
+
+	ite_pins: ite-pins {
+		pins_rst {
+			pinmux = <PINMUX_GPIO160__FUNC_GPIO160>;
+			output-high;
+		};
+	};
+
+	dpi_pins_func: dpi-pins-func {
+		pins_dpi {
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
+	dpi_pins_idle: dpi-pins-idle {
+		pins_gpio {
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
@@ -381,3 +483,16 @@ &scp {
 &dsi0 {
 	status = "disabled";
 };
+
+&dpi0 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&dpi_pins_func>;
+	pinctrl-1 = <&dpi_pins_idle>;
+	status = "okay";
+
+	port {
+		dpi_out: endpoint {
+			remote-endpoint = <&it66121_in>;
+		};
+	};
+};
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
