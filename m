Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF0CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 21:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrnhK9BuqgIlPuDS/+lEAkUgNAqDZaeVN+hT9b5SKw0=; b=lca0iDOKDNey+w
	qFlbiKB/MPu57zUx/P1wP3hJO0VwymNwQd+cK4MZHuJvSHVu5orxcZYZykd/rq36SLxC6Zr05+krL
	suuCOi+OhvM3J7G/K23Aj0Figglz2Mft7q9wLmUHdfP8tIBxlGmM97VuAOF3VaFaudr1pojwstfPM
	JTsZy+VlmkGi4whk4yBzSLPHSJ9dDuyrp88GjZqUKxr/kMKFgo9xFM+DR0FZpEvZZ7/OBC48xIRya
	UKRQSCS+lMWnC0YSZtztq90AgnWQT86e2WIpA7Yt77zkTfl6eHcusMZtG/RiPUkwG5pW3sRpi3Kbh
	JEA0OflBhKsOr6+T9+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmbv-008LN8-RQ; Mon, 30 May 2022 21:07:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmbJ-008L9Q-Bs
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 21:07:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id o9so7045261wmd.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 14:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hDUErSF+n1k4cG7IQv0rQoHbdfQHDvgwLI/ub82oI98=;
        b=Z+INMB7KL0W830LFilyrsOF47m5fBPC24BsIx5pOXHkuenlM43QGXwtrPRW1zUE+ly
         VTNOcRCRqFhsdKGfXsRD+g+dvTczYTHlIZiJUmH5zqCwXCTkd7ryV46wFVj2txHieIQ9
         Ytt5usk4Djvi/TGBK14yHatzMqavoxJ0Mq/+E8l3/XQsLHKhEeHoYi8/0KZ5tdc9HsIz
         K13j054GXV3EN4RxvR1NPin+SiYjZQRLkJixUUg5GPnicknqsry18NZw+Zz/wpeByNfV
         MuTZ5qad/P4rAlAqBBH7gsWWT0vX7QqJ9WZBZfQwvf0gpFI9xMcMjneUb4SK50O/N8xV
         bL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hDUErSF+n1k4cG7IQv0rQoHbdfQHDvgwLI/ub82oI98=;
        b=bStZiqE6ooCeDoQzPk9IMd/K4L8mORQ3yog2WkluUUFWsfEkJJqZ4tCZlD04pMes60
         7/kwpvz3dclIaKHuePTIeuePfbMrH/acVlIiQOI68DJ/3e05fYBsblHLYQjt/W0nWPJI
         wmRqwq5Vu3YE3yMUmrENAWYIzgHhY0qTN7a2dk9T0OFIWkUumrSvBHo+GZkpXcgFwKZD
         bko2iya0E0FzqQRdVt1sG2rvUwUx2Xyc9zP3vgU3b64+YUiBkEARzsDWrUpZa+B21Zt9
         a+mT8X0DuwjGJOFFOA+zh7pLh6rhFwIxjVwX/3GEgVMcE2KBl9BSG4DNavN90PVn4jUi
         RKNA==
X-Gm-Message-State: AOAM531jmdYfuZn7Zk/9zqYa8s+E2qwqFRSX2SjyarHD1UgkbCqz0QMl
	yFEz1IZIR3rW8gTeo2NQ8xWi8w==
X-Google-Smtp-Source: ABdhPJyOZOHShGwmaDvr1ydNfXBcoRLLSzyL9oqhfqyoKaFJdOtQap1lAoVeSU6ZldwbTAyAfnfCGg==
X-Received: by 2002:a05:600c:190b:b0:394:880f:ae2c with SMTP id j11-20020a05600c190b00b00394880fae2cmr20118086wmq.79.1653944815073;
        Mon, 30 May 2022 14:06:55 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c15c700b003958af7d0c8sm270910wmf.45.2022.05.30.14.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 14:06:54 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 2/2] arm64: dts: mediatek: mt8183-pumpkin: add HDMI support
Date: Mon, 30 May 2022 23:06:40 +0200
Message-Id: <20220530210640.927733-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530210640.927733-1-fparent@baylibre.com>
References: <20220530210640.927733-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_140657_432326_E71562BD 
X-CRM114-Status: GOOD (  11.58  )
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
