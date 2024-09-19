Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7C1CE8D64
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 09:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dDumzV+jL/bjpzSzdfVGLcrQ8rzaUr73VYrD39mPLZs=; b=h1qGaTzgngvAzvcGBg+EGAYqXj
	x7cxCCP9qnAljZV6dY/lXmo2KcEbRc7DmDcIdOMeddtXU8aHLvrPG3dcbJ02a1axQl6C1cHRsVVTl
	tzvSNgVw1H5s5VsmOJ566W5mzVa21669wLUjwjabzVCnwehMuevfLz4VKGYXFGc97wk7QM0ZqdMYI
	UFbCFW9qvg2sOGvtKmDR6ZH5CVdwpVH+HOViGMhQIa3t9u2uPliWhHFHTahOO5CDbxgQBac63ZI+X
	Qm0dGXoNRPZMrjB3BWNaeiITIBozAZT3oVAmtu+ahdy2tOsfUWq43Oukr5cwKk3SVpCaT3NRmgLqP
	p/oZII1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srDgA-00000009x41-2NiB;
	Thu, 19 Sep 2024 09:42:26 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srDg8-00000009x3H-0dUl
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Sep 2024 09:42:25 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7191df6b5f5so447239b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Sep 2024 02:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726738942; x=1727343742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dDumzV+jL/bjpzSzdfVGLcrQ8rzaUr73VYrD39mPLZs=;
        b=VrpLh22D47fy9KNe1SGV4j+Qn4fhASvMWEK9/gJ4Ob4LKkn+1u8t4mk6DF2W2Mw71i
         kgWyQa1umYy1pAv2aD0o1a3biZAq0kaThD3OD+EXMzvOG75lsx54+T8vLeOhx8SRa5Q0
         t0rndBJDJvpZC+rhauwpXkfP63HYWQzxMLKno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726738942; x=1727343742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDumzV+jL/bjpzSzdfVGLcrQ8rzaUr73VYrD39mPLZs=;
        b=CodYZ+jg6OEejazQ4pr7WJMZX0rWiHx/dr60svr6wdMZ0e+tXrDl0a/+YKzrevFn1j
         xZNJANoTd1RNHICMGCRhUcv/f+FKYTQsApvj2BZbILnWi5uNLKNQFO0C0O6PCO0ukarK
         SnEcLDoNSbLGn8/aEER0buAsUKUFzEygIEvj/rSAnjg26UE+AlhyCh0E2jumbqydxkjP
         asO9/hYtIx8xc8O/bRZgHvZ8fkszaAXzgnAj+px6Nuk1CnP0a26Ty3acPk/0RKzW3npp
         5bz0+ma4Nl7ajMpWPpYCis1pR2pr3bK15Ju4z7GEpTg8ltjluqOKsODsvVWJ2f0uenok
         /JJA==
X-Gm-Message-State: AOJu0YzeoVZ9jrXknJiEQYHIR7fZkm3ktIKxoRD/cxcZL9u5clShvv4P
	+q1u3GEeC6mHKBu6S+cNagQSJrumJw6oeFfXs3OYCa8KT106MFO7/47x3sBuCw==
X-Google-Smtp-Source: AGHT+IF2vMJ+2AOCj5R87zBh9VHuLayxTQFzkC/Vn/4crABU7xxMMc8HPnxxeHtzrF1F0wZet9xAAw==
X-Received: by 2002:a05:6a21:398b:b0:1cf:658e:50fe with SMTP id adf61e73a8af0-1cf75efe88dmr36657324637.29.1726738942615;
        Thu, 19 Sep 2024 02:42:22 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:457c:125e:bb1f:8cd1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ad2dsm7913170b3a.101.2024.09.19.02.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 02:42:22 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>,
	Pin-yen Lin <treapking@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v3] arm64: dts: mediatek: mt8183-pumpkin: add HDMI support
Date: Thu, 19 Sep 2024 17:41:49 +0800
Message-ID: <20240919094212.1902073-1-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_024224_203547_FBAF0128 
X-CRM114-Status: GOOD (  12.12  )
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

Enable the DPI and add the node for the IT66121 bridge.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Co-developed-by: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v3:
- Update commit message and fix formatting issues
- Fix the label name of vcn33 regulator

 .../boot/dts/mediatek/mt8183-pumpkin.dts      | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 1aa668c3ccf9..61a6f66914b8 100644
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
@@ -120,6 +132,43 @@ &i2c6 {
 	pinctrl-0 = <&i2c6_pins>;
 	status = "okay";
 	clock-frequency = <100000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	it66121hdmitx: hdmitx@4c {
+		compatible = "ite,it66121";
+		reg = <0x4c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ite_pins>;
+		reset-gpios = <&pio 160 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&pio>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		vcn33-supply = <&mt6358_vcn33_reg>;
+		vcn18-supply = <&mt6358_vcn18_reg>;
+		vrf12-supply = <&mt6358_vrf12_reg>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				it66121_in: endpoint {
+					bus-width = <12>;
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_connector_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
 };
 
 &keyboard {
@@ -362,6 +411,67 @@ pins_clk {
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
@@ -415,3 +525,16 @@ &scp {
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
2.46.0.662.g92d0881bb0-goog


