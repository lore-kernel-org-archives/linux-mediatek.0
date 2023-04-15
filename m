Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82000C77B79
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Apr 2023 09:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmxkZcjuc9h3zUcXWa8XXrQDCIFUkDmlnhNQOMaskCY=; b=oWjwz4v53euQsC3X6iGGpnI84w
	i4UQrWhJ8LQAuUajk2xdKuWbqG0eLK2CyK0QYowYblXik6XDf6i8FUI85sgx/EKJurjxouq+4h7Kq
	jP8cpXQFfW2bTFwLv5GTZ22c/nBLXEMRvZiKeuRDyNeuGTmcBkClBHkpGzeSNXQJA5zamUKnU6EyZ
	ygJw10xXSh0+bClNctUkhKCvtczIG3bCoAQUg8FbEHjppUcC08+YDRjIczsKzajjxJVyT7YEd2RQe
	RqcNN6icmSRBiWvTKdmrAh3ObHvBUlBAIyVQy7MOHWJ82NaXgkhhscXe1dCsXf1HsKjzL7N4At8FQ
	etwAg1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pncfp-00Bm53-0w;
	Sat, 15 Apr 2023 09:58:25 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pncfh-00BlzW-1w
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Apr 2023 09:58:22 +0000
Received: by mail-ej1-x62e.google.com with SMTP id gc14so6587146ejc.5
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Apr 2023 02:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681552695; x=1684144695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmxkZcjuc9h3zUcXWa8XXrQDCIFUkDmlnhNQOMaskCY=;
        b=veMCUgsXeYcj50yeemx75bwT83FvJTk2oUF3q/Hp8U00+ppyS8TnLbjyVfkFLybTnB
         iAT+SvYZo2Ul7VmEb6ROQpTUYbdR7wg/zM+IC1QoeS4ZMVJewIZkRoiYIxiCEcgz1pnk
         Ia8kDjXb7ooOzWk+BgKaiVVzk5u8WOCQyOZ3zGrCenLxHTLB30YgQd33EHQpqEeWNN/h
         RiFnz+kdbeIQs7Nqn+y3t70aa9dK38iqjkx4u2S3ts1vEajN5Jvk8vg88xt2qW7OHNnD
         gwLZwCg6DhRMY1YJ6ajHQQvpXxaSJ6QEp7nqwtiTC/jHo7RtaaUzxaULAbm7jgIGDSpD
         FKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681552695; x=1684144695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmxkZcjuc9h3zUcXWa8XXrQDCIFUkDmlnhNQOMaskCY=;
        b=QOhUXtMu8PrzGUBVEK4WuIBMx4K85w0g67Pj0ZvafN8WDYy5VjQuKvui7n8S3KdGei
         iwuuHkflV6sVk1klgbmdkroFMlFZcgzLpPEBudcZwMX6Y7FQiIFvmpdShyqOwnTw5yCv
         QaQOszWmp8cA8UJE9hAAK/KvMvkJQuTx4UKgXcnqjoFs0q7CZya9+QYjhxq3lKvEgQJh
         FVw7DVkoFItBXGQuQRGeDcgHjVcjkM3Ol4Y2FJibjXJlMlBktKRL8DU9/OBabnpYHIMy
         /9TO3Buos4mK7w2ckrZuDm8bLQmL1elaNpjPqr4Gf4NUeaA4SI+HS6iTLzEOsEv4cdjx
         KHYQ==
X-Gm-Message-State: AAQBX9eOC/iDfcRlAboic6WC9Bc+BXPI54Co0xqiFVCqA90gNhaBsERD
	8TgUFkj4vrVOVJ49Gxr29OPzxw==
X-Google-Smtp-Source: AKy350bO9nbXwbWqp+m9c6xd/y0XxBKrHf9YMvk/RebBUko3pSASrl/8sZ/3IvcoHy11DMakiSbHAg==
X-Received: by 2002:a17:907:210e:b0:879:ab3:93cd with SMTP id qn14-20020a170907210e00b008790ab393cdmr1497819ejb.46.1681552695051;
        Sat, 15 Apr 2023 02:58:15 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm3594248ejc.161.2023.04.15.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 02:58:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sander Vanheule <sander@svanheule.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fu Wei <fu.wei@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Justin Chen <justinpopo6@gmail.com>,
	=?UTF-8?q?=82ecki?= <rafal@milecki.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Anson Huang <Anson.Huang@nxp.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jamie Iles <jamie@jamieiles.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
	Srinivas Neeli <srinivas.neeli@xilinx.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/6] dt-bindings: watchdog: indentation, quotes and white-space cleanup
Date: Sat, 15 Apr 2023 11:51:08 +0200
Message-Id: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_025817_680995_1DC8F952 
X-CRM114-Status: GOOD (  12.19  )
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

Minor cleanup without functional impact:
1. Indent DTS examples to preferred four-spaces (more readable for DTS),
2. Drop unneeded quotes,
3. Add/drop blank lines to make the code readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../watchdog/amlogic,meson-gxbb-wdt.yaml      | 10 +++---
 .../bindings/watchdog/arm,sbsa-gwdt.yaml      |  1 -
 .../bindings/watchdog/arm,twd-wdt.yaml        |  6 ++--
 .../bindings/watchdog/arm-smc-wdt.yaml        |  7 ++--
 .../bindings/watchdog/atmel,sama5d4-wdt.yaml  | 14 ++++----
 .../bindings/watchdog/brcm,bcm7038-wdt.yaml   |  6 ++--
 .../bindings/watchdog/faraday,ftwdt010.yaml   | 16 +++++-----
 .../watchdog/mediatek,mt7621-wdt.yaml         |  6 ++--
 .../bindings/watchdog/qcom-wdt.yaml           | 32 +++++++++----------
 .../bindings/watchdog/renesas,wdt.yaml        | 14 ++++----
 .../bindings/watchdog/snps,dw-wdt.yaml        | 32 +++++++++----------
 .../bindings/watchdog/st,stm32-iwdg.yaml      | 10 +++---
 .../watchdog/xlnx,xps-timebase-wdt.yaml       | 12 +++----
 13 files changed, 83 insertions(+), 83 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
index 497d60408ea0..f5cc7aa1b93b 100644
--- a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/watchdog/amlogic,meson-gxbb-wdt.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/watchdog/amlogic,meson-gxbb-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Meson GXBB SoCs Watchdog timer
 
@@ -36,7 +36,7 @@ unevaluatedProperties: false
 examples:
   - |
     watchdog@98d0 {
-          compatible = "amlogic,meson-gxbb-wdt";
-          reg = <0x98d0 0x10>;
-          clocks = <&xtal>;
+        compatible = "amlogic,meson-gxbb-wdt";
+        reg = <0x98d0 0x10>;
+        clocks = <&xtal>;
     };
diff --git a/Documentation/devicetree/bindings/watchdog/arm,sbsa-gwdt.yaml b/Documentation/devicetree/bindings/watchdog/arm,sbsa-gwdt.yaml
index 6bfa46353c4e..aa804f96acba 100644
--- a/Documentation/devicetree/bindings/watchdog/arm,sbsa-gwdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/arm,sbsa-gwdt.yaml
@@ -40,7 +40,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-
     watchdog@2a440000 {
         compatible = "arm,sbsa-gwdt";
         reg = <0x2a440000 0x1000>,
diff --git a/Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml
index bb8901854222..9646ac72051e 100644
--- a/Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml
@@ -44,7 +44,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     watchdog@2c000620 {
-            compatible = "arm,arm11mp-twd-wdt";
-            reg = <0x2c000620 0x20>;
-            interrupts = <GIC_PPI 14 0xf01>;
+        compatible = "arm,arm11mp-twd-wdt";
+        reg = <0x2c000620 0x20>;
+        interrupts = <GIC_PPI 14 0xf01>;
     };
diff --git a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
index fa05d6252982..b5573852ef5a 100644
--- a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - arm,smc-wdt
+
   arm,smc-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: |
@@ -30,9 +31,9 @@ unevaluatedProperties: false
 examples:
   - |
     watchdog {
-      compatible = "arm,smc-wdt";
-      arm,smc-id = <0x82003D06>;
-      timeout-sec = <15>;
+        compatible = "arm,smc-wdt";
+        arm,smc-id = <0x82003D06>;
+        timeout-sec = <15>;
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
index b28f7b57c36b..816f85ee2c77 100644
--- a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
@@ -65,13 +65,13 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     watchdog@fc068640 {
-      compatible = "atmel,sama5d4-wdt";
-      reg = <0xfc068640 0x10>;
-      interrupts = <4 IRQ_TYPE_LEVEL_HIGH 5>;
-      timeout-sec = <10>;
-      atmel,watchdog-type = "hardware";
-      atmel,dbg-halt;
-      atmel,idle-halt;
+        compatible = "atmel,sama5d4-wdt";
+        reg = <0xfc068640 0x10>;
+        interrupts = <4 IRQ_TYPE_LEVEL_HIGH 5>;
+        timeout-sec = <10>;
+        atmel,watchdog-type = "hardware";
+        atmel,dbg-halt;
+        atmel,idle-halt;
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
index 428004e7f0c3..526ff908d134 100644
--- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
@@ -37,7 +37,7 @@ required:
 examples:
   - |
     watchdog@f040a7e8 {
-      compatible = "brcm,bcm7038-wdt";
-      reg = <0xf040a7e8 0x16>;
-      clocks = <&upg_fixed>;
+        compatible = "brcm,bcm7038-wdt";
+        reg = <0xf040a7e8 0x16>;
+        clocks = <&upg_fixed>;
     };
diff --git a/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml b/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml
index 6e135f48b3ba..726dc872ad02 100644
--- a/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml
+++ b/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml
@@ -52,16 +52,16 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
     watchdog@41000000 {
-      compatible = "faraday,ftwdt010";
-      reg = <0x41000000 0x1000>;
-      interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
-      timeout-sec = <5>;
+        compatible = "faraday,ftwdt010";
+        reg = <0x41000000 0x1000>;
+        interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+        timeout-sec = <5>;
     };
   - |
     watchdog: watchdog@98500000 {
-      compatible = "moxa,moxart-watchdog", "faraday,ftwdt010";
-      reg = <0x98500000 0x10>;
-      clocks = <&clk_apb>;
-      clock-names = "PCLK";
+        compatible = "moxa,moxart-watchdog", "faraday,ftwdt010";
+        reg = <0x98500000 0x10>;
+        clocks = <&clk_apb>;
+        clock-names = "PCLK";
     };
 ...
diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
index a668d0c2f14b..18160869c378 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
@@ -34,7 +34,7 @@ additionalProperties: false
 examples:
   - |
     watchdog@100 {
-      compatible = "mediatek,mt7621-wdt";
-      reg = <0x100 0x100>;
-      mediatek,sysctl = <&sysc>;
+        compatible = "mediatek,mt7621-wdt";
+        reg = <0x100 0x100>;
+        mediatek,sysctl = <&sysc>;
     };
diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 6448b633c970..eccfd23c50f4 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -113,26 +113,26 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     watchdog@17c10000 {
-      compatible = "qcom,apss-wdt-sm8150", "qcom,kpss-wdt";
-      reg = <0x17c10000 0x1000>;
-      clocks = <&sleep_clk>;
-      interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-      timeout-sec = <10>;
+        compatible = "qcom,apss-wdt-sm8150", "qcom,kpss-wdt";
+        reg = <0x17c10000 0x1000>;
+        clocks = <&sleep_clk>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+        timeout-sec = <10>;
     };
 
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     watchdog@200a000 {
-      compatible = "qcom,kpss-wdt-ipq8064", "qcom,kpss-timer", "qcom,msm-timer";
-      interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
-                   <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
-                   <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
-                   <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
-                   <GIC_PPI 5 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
-      reg = <0x0200a000 0x100>;
-      clock-frequency = <25000000>;
-      clocks = <&sleep_clk>;
-      clock-names = "sleep";
-      cpu-offset = <0x80000>;
+        compatible = "qcom,kpss-wdt-ipq8064", "qcom,kpss-timer", "qcom,msm-timer";
+        interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
+                     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
+                     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
+                     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
+                     <GIC_PPI 5 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
+        reg = <0x0200a000 0x100>;
+        clock-frequency = <25000000>;
+        clocks = <&sleep_clk>;
+        clock-names = "sleep";
+        cpu-offset = <0x80000>;
     };
diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 50c5c48ee6fb..951a7d54135a 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -177,11 +177,11 @@ examples:
     #include <dt-bindings/power/r8a7795-sysc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     wdt0: watchdog@e6020000 {
-            compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
-            reg = <0xe6020000 0x0c>;
-            interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 402>;
-            power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-            resets = <&cpg 402>;
-            timeout-sec = <60>;
+        compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
+        reg = <0xe6020000 0x0c>;
+        interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 402>;
+        power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+        resets = <&cpg 402>;
+        timeout-sec = <60>;
     };
diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index 39139586611b..76eceeddd150 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -83,25 +83,25 @@ required:
 examples:
   - |
     watchdog@ffd02000 {
-      compatible = "snps,dw-wdt";
-      reg = <0xffd02000 0x1000>;
-      interrupts = <0 171 4>;
-      clocks = <&per_base_clk>;
-      resets = <&wdt_rst>;
+        compatible = "snps,dw-wdt";
+        reg = <0xffd02000 0x1000>;
+        interrupts = <0 171 4>;
+        clocks = <&per_base_clk>;
+        resets = <&wdt_rst>;
     };
 
   - |
     watchdog@ffd02000 {
-      compatible = "snps,dw-wdt";
-      reg = <0xffd02000 0x1000>;
-      interrupts = <0 171 4>;
-      clocks = <&per_base_clk>;
-      clock-names = "tclk";
-      snps,watchdog-tops = <0x000000FF 0x000001FF 0x000003FF
-                            0x000007FF 0x0000FFFF 0x0001FFFF
-                            0x0003FFFF 0x0007FFFF 0x000FFFFF
-                            0x001FFFFF 0x003FFFFF 0x007FFFFF
-                            0x00FFFFFF 0x01FFFFFF 0x03FFFFFF
-                            0x07FFFFFF>;
+        compatible = "snps,dw-wdt";
+        reg = <0xffd02000 0x1000>;
+        interrupts = <0 171 4>;
+        clocks = <&per_base_clk>;
+        clock-names = "tclk";
+        snps,watchdog-tops = <0x000000FF 0x000001FF 0x000003FF
+                              0x000007FF 0x0000FFFF 0x0001FFFF
+                              0x0003FFFF 0x0007FFFF 0x000FFFFF
+                              0x001FFFFF 0x003FFFFF 0x007FFFFF
+                              0x00FFFFFF 0x01FFFFFF 0x03FFFFFF
+                              0x07FFFFFF>;
     };
 ...
diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
index 2cb1a2ed0f7b..6b13bfc11e11 100644
--- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
+++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
@@ -48,11 +48,11 @@ examples:
   - |
     #include <dt-bindings/clock/stm32mp1-clks.h>
     watchdog@5a002000 {
-      compatible = "st,stm32mp1-iwdg";
-      reg = <0x5a002000 0x400>;
-      clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
-      clock-names = "pclk", "lsi";
-      timeout-sec = <32>;
+        compatible = "st,stm32mp1-iwdg";
+        reg = <0x5a002000 0x400>;
+        clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
+        clock-names = "pclk", "lsi";
+        timeout-sec = <32>;
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml b/Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml
index 493a1c954707..8444c56dd602 100644
--- a/Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml
@@ -58,11 +58,11 @@ unevaluatedProperties: false
 examples:
   - |
     watchdog@40100000 {
-      compatible = "xlnx,xps-timebase-wdt-1.00.a";
-      reg = <0x40100000 0x1000>;
-      clock-frequency = <50000000>;
-      clocks = <&clkc 15>;
-      xlnx,wdt-enable-once = <0x0>;
-      xlnx,wdt-interval = <0x1b>;
+        compatible = "xlnx,xps-timebase-wdt-1.00.a";
+        reg = <0x40100000 0x1000>;
+        clock-frequency = <50000000>;
+        clocks = <&clkc 15>;
+        xlnx,wdt-enable-once = <0x0>;
+        xlnx,wdt-interval = <0x1b>;
     };
 ...
-- 
2.34.1


