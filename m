Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C51C36002
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Mar 2025 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0wZXYw/CdldU5EsbECLrO9WocLpwGBA/zXElKTd/+8=; b=ln0Nwwoe5VAKEFW9IAXi723j04
	p20hDELzzaCn9rIGYTCbG2s4VTXi1+5sLhYKH1I4hXvDiGE3uivUVV6QJ67TgHuF7YxiYUqgY/ayN
	h7Dc3PkqSra4eG7S8/yjCLfMHQe3hPQAC7DnwnZG148PXCJptT7TJhs/Enp0xFFcREmT1tJ0AgINa
	OL2xwOTsW/oHol7PYBhwfkSJDt10sY2uM0t/+Fowx+J5+P9OxJoZl9n3+OUI6pbFJIO4117mjx6rt
	j8LMkCz/jdILVSzuwARNoX1hknxs9ac14bidxe5K/luUH6YajfnbemQUX8EPhW4Gr1NTvTlP7wA/5
	CAko4Mlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhKH-000000037Ig-1NAD;
	Mon, 24 Mar 2025 12:54:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhGr-000000035Xl-2Upp
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Mar 2025 12:51:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3912a28e629so208160f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Mar 2025 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820672; x=1743425472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0wZXYw/CdldU5EsbECLrO9WocLpwGBA/zXElKTd/+8=;
        b=OW666iFCe6VIRHg1TJ07TN1EVGRU+ugtay07MDvdb7q2iN9WaOjDQIe08cpT334D3U
         xMTYrqPA8OteapPcIU4YGA4O5Nms/grEOKOALAxsaU0I8jYyoXYEseprmt8df2ZxCqkE
         S0YvzTZ88+DzQz6/GEbP61NDTrox/044vfGUhJszMAD/VH4MnYJIkpq3br/okOojG4Nq
         Pn72c2ig/xHEIhMQV9GfWb+QinI8GjaosLEfR8CYjTJpSYE/AmDfLkzu+yT1KfdQ4amL
         FNEBhCJ4ywHQ6T9WSdocXxq4ejAmmFuRI9qcUOh84NtM6aR0uXdoFymN9EX9I7c/jVhF
         kzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820672; x=1743425472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0wZXYw/CdldU5EsbECLrO9WocLpwGBA/zXElKTd/+8=;
        b=Wlgh/PPIPpB/f1v5CMg3wCH3PDQdH7311hcKFGpmHUjsWwAOqvBikRzHdxGgECKfJV
         0XN40jFIqgT4stsQRZPKwEBtpAJyZ4mcO3bd4EA2JWzy6368RoVxjnyn1XzDZhn3z8ND
         3V68Cf7WulLEFyAz6gbBnLGszeva8Hdxxx46eaBoWmQ7gOUYcWC1Pmy0M1liWWbf03i7
         9zvkwZE3gdjeS4SsdvJb0DmUTY7djbi1FVLikS0oibexHn44kF1l/APk8UCZQQhRyocu
         fP0dXRSttNXh2isqTAfq1sBwu/7LLzxZc/LEkmkgm7aUzeq5IjXvpnbd9kHJNXKPxOEt
         +vbw==
X-Forwarded-Encrypted: i=1; AJvYcCWS9eABlht1spkiH9Zm6MrOHVZ/vuZ3Q4zIPOMizUGVOIBw1Jmv3HgrJBv/Ol1N9OFkotdmc9A+tEnz9VLr0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjT7Xld54zSG/pN4UAsmNjlezpGN8BmYuoT0gs2UWo5WRjWjn3
	evGIOOIzFd4azm6xBO7RhvNlthb5vZx0TbsFjmVOFnodB6I7l/jHbgCIf4Dvv7w=
X-Gm-Gg: ASbGncsGcmoji2XVYNKx357IdYuIyvLj/7MphRpPxMrvhwCVQNPD3TwMPd1nZ5cgB56
	m/BADBAfTOV9RGfMFaVwvLyUz6/ISQQNPoK/NzRj5Jy9nI9RkEMvzMBSAQ8xqes8mT4sB72AA/c
	uZd+3YzD1L7vr1X4YpWbTotNGyyQp8L/6dYNbaSY9AMoqOn0xWvnLtM9RbHcevqrDfmznw1FATP
	QdR599kvxVye7Qj4C+AQFowR5QL9wXUnw2mS6zyrfC4fTluCSVEWw9pVNGPbdIUul5pKFMmilLY
	dyBZLiTyIku1iWFrQ0A8LhGFHvqubY5DWtEDkgMwBo3AvsDBXqEkE1DJjQ==
X-Google-Smtp-Source: AGHT+IEep6+lmKtICEdnNtWzicMc4Pz1nJNEZsn02KrzcQwbPTHzgPUylKQvXQKSLa9/kBn7lVLGVg==
X-Received: by 2002:a5d:5f8f:0:b0:38f:2b3c:569e with SMTP id ffacd0b85a97d-3997f9403bcmr4678022f8f.11.1742820671758;
        Mon, 24 Mar 2025 05:51:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b517csm11117180f8f.51.2025.03.24.05.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:51:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: pinctrl: mediatek: Correct indentation and style in DTS example
Date: Mon, 24 Mar 2025 13:51:05 +0100
Message-ID: <20250324125105.81774-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
References: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_055113_626729_F5F42D2E 
X-CRM114-Status: GOOD (  10.56  )
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 83 +++++++------------
 .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 48 +++++------
 .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 68 +++++++--------
 .../pinctrl/mediatek,mt8192-pinctrl.yaml      | 76 ++++++++---------
 4 files changed, 127 insertions(+), 148 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index 5f2808212f39..b9680b896f12 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -137,64 +137,43 @@ examples:
         #size-cells = <2>;
 
         pinctrl@1c20800 {
-          compatible = "mediatek,mt8135-pinctrl";
-          reg = <0 0x1000B000 0 0x1000>;
-          mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
-          gpio-controller;
-          #gpio-cells = <2>;
-          interrupt-controller;
-          #interrupt-cells = <2>;
-          interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
-              <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
-              <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+            compatible = "mediatek,mt8135-pinctrl";
+            reg = <0 0x1000B000 0 0x1000>;
+            mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 
-          i2c0_pins_a: i2c0-pins {
-            pins1 {
-              pinmux = <MT8135_PIN_100_SDA0__FUNC_SDA0>,
-                <MT8135_PIN_101_SCL0__FUNC_SCL0>;
-              bias-disable;
-            };
-          };
-
-          i2c1_pins_a: i2c1-pins {
-            pins {
-              pinmux = <MT8135_PIN_195_SDA1__FUNC_SDA1>,
-                <MT8135_PIN_196_SCL1__FUNC_SCL1>;
-              bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
-            };
-          };
-
-          i2c2_pins_a: i2c2-pins {
-            pins1 {
-              pinmux = <MT8135_PIN_193_SDA2__FUNC_SDA2>;
-              bias-pull-down;
+            i2c0_pins_a: i2c0-pins {
+                pins1 {
+                    pinmux = <MT8135_PIN_100_SDA0__FUNC_SDA0>,
+                             <MT8135_PIN_101_SCL0__FUNC_SCL0>;
+                    bias-disable;
+                };
             };
 
-            pins2 {
-              pinmux = <MT8135_PIN_49_WATCHDOG__FUNC_GPIO49>;
-              bias-pull-up;
-            };
-          };
-
-          i2c3_pins_a: i2c3-pins {
-            pins1 {
-              pinmux = <MT8135_PIN_40_DAC_CLK__FUNC_GPIO40>,
-                <MT8135_PIN_41_DAC_WS__FUNC_GPIO41>;
-              bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+            i2c1_pins_a: i2c1-pins {
+                pins {
+                    pinmux = <MT8135_PIN_195_SDA1__FUNC_SDA1>,
+                             <MT8135_PIN_196_SCL1__FUNC_SCL1>;
+                    bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+                };
             };
 
-            pins2 {
-              pinmux = <MT8135_PIN_35_SCL3__FUNC_SCL3>,
-                <MT8135_PIN_36_SDA3__FUNC_SDA3>;
-              output-low;
-              bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
-            };
+            i2c2_pins_a: i2c2-pins {
+                pins1 {
+                    pinmux = <MT8135_PIN_193_SDA2__FUNC_SDA2>;
+                    bias-pull-down;
+                };
 
-            pins3 {
-              pinmux = <MT8135_PIN_57_JTCK__FUNC_GPIO57>,
-                <MT8135_PIN_60_JTDI__FUNC_JTDI>;
-              drive-strength = <32>;
+                pins2 {
+                    pinmux = <MT8135_PIN_49_WATCHDOG__FUNC_GPIO49>;
+                    bias-pull-up;
+                };
             };
-          };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index d74cae9d4d65..9acca85184fa 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -366,34 +366,34 @@ examples:
         #size-cells = <2>;
 
         pio: pinctrl@10211000 {
-          compatible = "mediatek,mt7622-pinctrl";
-          reg = <0 0x10211000 0 0x1000>;
-          gpio-controller;
-          #gpio-cells = <2>;
+            compatible = "mediatek,mt7622-pinctrl";
+            reg = <0 0x10211000 0 0x1000>;
+            gpio-controller;
+            #gpio-cells = <2>;
 
-          pinctrl_eth_default: eth-pins {
-            mux-mdio {
-              groups = "mdc_mdio";
-              function = "eth";
-              drive-strength = <12>;
-            };
+            pinctrl_eth_default: eth-pins {
+                mux-mdio {
+                    groups = "mdc_mdio";
+                    function = "eth";
+                    drive-strength = <12>;
+                };
 
-            mux-gmac2 {
-              groups = "rgmii_via_gmac2";
-              function = "eth";
-              drive-strength = <12>;
-            };
+                mux-gmac2 {
+                    groups = "rgmii_via_gmac2";
+                    function = "eth";
+                    drive-strength = <12>;
+                };
 
-            mux-esw {
-              groups = "esw";
-              function = "eth";
-              drive-strength = <8>;
-            };
+                mux-esw {
+                    groups = "esw";
+                    function = "eth";
+                    drive-strength = <8>;
+                };
 
-            conf-mdio {
-              pins = "MDC";
-              bias-pull-up;
+                conf-mdio {
+                    pins = "MDC";
+                    bias-pull-up;
+                };
             };
-          };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
index 8507bd15f243..464879274cae 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
@@ -195,43 +195,43 @@ examples:
         #size-cells = <2>;
 
         pio: pinctrl@10005000 {
-          compatible = "mediatek,mt8183-pinctrl";
-          reg = <0 0x10005000 0 0x1000>,
-                <0 0x11f20000 0 0x1000>,
-                <0 0x11e80000 0 0x1000>,
-                <0 0x11e70000 0 0x1000>,
-                <0 0x11e90000 0 0x1000>,
-                <0 0x11d30000 0 0x1000>,
-                <0 0x11d20000 0 0x1000>,
-                <0 0x11c50000 0 0x1000>,
-                <0 0x11f30000 0 0x1000>,
-                <0 0x1000b000 0 0x1000>;
-          reg-names = "iocfg0", "iocfg1", "iocfg2",
-                "iocfg3", "iocfg4", "iocfg5",
-                "iocfg6", "iocfg7", "iocfg8",
-                "eint";
-          gpio-controller;
-          #gpio-cells = <2>;
-          gpio-ranges = <&pio 0 0 192>;
-          interrupt-controller;
-          interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
-          #interrupt-cells = <2>;
+            compatible = "mediatek,mt8183-pinctrl";
+            reg = <0 0x10005000 0 0x1000>,
+                  <0 0x11f20000 0 0x1000>,
+                  <0 0x11e80000 0 0x1000>,
+                  <0 0x11e70000 0 0x1000>,
+                  <0 0x11e90000 0 0x1000>,
+                  <0 0x11d30000 0 0x1000>,
+                  <0 0x11d20000 0 0x1000>,
+                  <0 0x11c50000 0 0x1000>,
+                  <0 0x11f30000 0 0x1000>,
+                  <0 0x1000b000 0 0x1000>;
+            reg-names = "iocfg0", "iocfg1", "iocfg2",
+                  "iocfg3", "iocfg4", "iocfg5",
+                  "iocfg6", "iocfg7", "iocfg8",
+                  "eint";
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pio 0 0 192>;
+            interrupt-controller;
+            interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+            #interrupt-cells = <2>;
 
-          i2c0_pins_a: i2c0-pins {
-            pins1 {
-              pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
-                <PINMUX_GPIO49__FUNC_SDA5>;
-              mediatek,pull-up-adv = <3>;
-              drive-strength-microamp = <1000>;
+            i2c0_pins_a: i2c0-pins {
+                pins1 {
+                  pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
+                           <PINMUX_GPIO49__FUNC_SDA5>;
+                    mediatek,pull-up-adv = <3>;
+                    drive-strength-microamp = <1000>;
+                };
             };
-          };
 
-          i2c1_pins_a: i2c1-pins {
-            pins {
-              pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
-                <PINMUX_GPIO51__FUNC_SDA3>;
-              mediatek,pull-down-adv = <2>;
+            i2c1_pins_a: i2c1-pins {
+                pins {
+                    pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
+                             <PINMUX_GPIO51__FUNC_SDA3>;
+                    mediatek,pull-down-adv = <2>;
+                };
             };
-          };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
index 1686427eb854..949dcd6fd847 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
@@ -142,43 +142,43 @@ additionalProperties: false
 
 examples:
   - |
-            #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
-            #include <dt-bindings/interrupt-controller/arm-gic.h>
-            pio: pinctrl@10005000 {
-                    compatible = "mediatek,mt8192-pinctrl";
-                    reg = <0x10005000 0x1000>,
-                          <0x11c20000 0x1000>,
-                          <0x11d10000 0x1000>,
-                          <0x11d30000 0x1000>,
-                          <0x11d40000 0x1000>,
-                          <0x11e20000 0x1000>,
-                          <0x11e70000 0x1000>,
-                          <0x11ea0000 0x1000>,
-                          <0x11f20000 0x1000>,
-                          <0x11f30000 0x1000>,
-                          <0x1000b000 0x1000>;
-                    reg-names = "iocfg0", "iocfg_rm", "iocfg_bm",
-                          "iocfg_bl", "iocfg_br", "iocfg_lm",
-                          "iocfg_lb", "iocfg_rt", "iocfg_lt",
-                          "iocfg_tl", "eint";
-                    gpio-controller;
-                    #gpio-cells = <2>;
-                    gpio-ranges = <&pio 0 0 220>;
-                    interrupt-controller;
-                    interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH 0>;
-                    #interrupt-cells = <2>;
+    #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pio: pinctrl@10005000 {
+        compatible = "mediatek,mt8192-pinctrl";
+        reg = <0x10005000 0x1000>,
+              <0x11c20000 0x1000>,
+              <0x11d10000 0x1000>,
+              <0x11d30000 0x1000>,
+              <0x11d40000 0x1000>,
+              <0x11e20000 0x1000>,
+              <0x11e70000 0x1000>,
+              <0x11ea0000 0x1000>,
+              <0x11f20000 0x1000>,
+              <0x11f30000 0x1000>,
+              <0x1000b000 0x1000>;
+        reg-names = "iocfg0", "iocfg_rm", "iocfg_bm",
+              "iocfg_bl", "iocfg_br", "iocfg_lm",
+              "iocfg_lb", "iocfg_rt", "iocfg_lt",
+              "iocfg_tl", "eint";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 220>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH 0>;
+        #interrupt-cells = <2>;
 
-                    spi1-default-pins {
-                            pins-cs-mosi-clk {
-                                    pinmux = <PINMUX_GPIO157__FUNC_SPI1_A_CSB>,
-                                             <PINMUX_GPIO159__FUNC_SPI1_A_MO>,
-                                             <PINMUX_GPIO156__FUNC_SPI1_A_CLK>;
-                                    bias-disable;
-                            };
-
-                            pins-miso {
-                                    pinmux = <PINMUX_GPIO158__FUNC_SPI1_A_MI>;
-                                    bias-pull-down;
-                            };
-                    };
+        spi1-default-pins {
+            pins-cs-mosi-clk {
+                pinmux = <PINMUX_GPIO157__FUNC_SPI1_A_CSB>,
+                         <PINMUX_GPIO159__FUNC_SPI1_A_MO>,
+                         <PINMUX_GPIO156__FUNC_SPI1_A_CLK>;
+                bias-disable;
             };
+
+            pins-miso {
+                pinmux = <PINMUX_GPIO158__FUNC_SPI1_A_MI>;
+                bias-pull-down;
+            };
+        };
+    };
-- 
2.43.0


