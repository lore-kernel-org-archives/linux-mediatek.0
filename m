Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7DBC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmyXJeXOh9aIrCgjS6ftss8a4dPzBjoQogZkMKVqyWc=; b=QLuCsTp+fyqldz6HfWgRuCQnVg
	xcaD1GMmRTy9OHfjgbcP+RyLbaVV/CQ/smPDREikaKMN0lQqsLWtKOprw+VfTiTfkWCaRpKbcRWxk
	8RYkWjO65OUCn26JBzIK7NeqfFaPf74pzQUoZMqxQpqh9FM+DA2S0JUE2jkyzacAoqPK05WkU7tw4
	GjyMODNtxe8xWoKxhGLShYV1dnG7ciG1WVFS6ngs/z+twjneIfp3KIiWBqxVTp6wkxxRFaG7kZT0o
	UEkqzw7X8dF/VEiZjPIV2J/7lDJWT24vhoKaelpgCXdg9CC/DyHbM8xIj1fvJjCTqQbhEKuQT0Q0S
	6tOdjITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Jpg-005GXK-6y; Thu, 08 Dec 2022 16:33:12 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3IrI-003Ugc-4N
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 15:30:54 +0000
Received: by mail-wr1-x441.google.com with SMTP id f18so2036422wrj.5
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Dec 2022 07:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmyXJeXOh9aIrCgjS6ftss8a4dPzBjoQogZkMKVqyWc=;
        b=hqrjX4JfWZoBrCAot0Pdqad0u+00X9VWJckZrhwVPufe+2y50mIxI6lywOceVZThj+
         EMVQMeHYlXsdRurNXflgvx/2yY/K0z67n/5UmTyMsKnlyfPr20WuF0IBCL3kgVJMpSXM
         4CspMocxDypnIzhQd3iUG6tyDySfWRuLsUrfalMhn3UR8FE+oOgwMcZG4n1JsbYdb6Tf
         hTR7MdGKQ1F19TSfBYlovRbvzqRATKkQ02qOpJPT3uV62wSxH7K0NHVm3Cd/z9HonmEA
         EyFBusJ/cT7pELthYlgxfBlvK7rOWgU3wIRdT9uKSPGqSwmb2mr1NKd9DsphUBjV4cIU
         pHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmyXJeXOh9aIrCgjS6ftss8a4dPzBjoQogZkMKVqyWc=;
        b=55MbgEiillLDGRFVhVwBQRihy5aLNL3TOImGZs7v2gkChwoj0e57OD8FMuG0SnarSI
         o84l5xdldmdCWhVlH5UH/V1IvdibuAXSgPda9n/9xqMRLlKjNeLwaWKC9eQYaLCHeqRx
         znx/qt+ZiI4Voq45ygMGSGYJtXAuK3dnA1R+Y+4km6pGrKcFcRBwbXSOd8n0auPYmtW4
         qGh60nDA1rg4q266c/itRTdY+KoyaDWIyQDu89e4xctrU+vBHc1wJuxmsWrh7FVksGDB
         SZ0UPE9oTxwnlgZZQciqMWZYwrq0OOQarF1Ic73WwJOl7UXYQrfZv7Zats3Nbtll3LMm
         /RFw==
X-Gm-Message-State: ANoB5pkjtqXq14w5gKoxblKX3kDkh69k8Sc3fU+4wdPifrFShXRLJIPq
	xWWfGMYMYzZIk6LZ5KvcEroX0aenRvwnB25LL1eKIg==
X-Google-Smtp-Source: AA0mqf4WGrL7QmgPKiJfmGndgA7HOEsLEFGcRF2+/P6E7r6tgmdnm/eY825sb/6L3ogndviMGn7Zxw==
X-Received: by 2002:a05:6000:11cf:b0:242:2e74:7930 with SMTP id i15-20020a05600011cf00b002422e747930mr1762192wrx.10.1670513445960;
        Thu, 08 Dec 2022 07:30:45 -0800 (PST)
Received: from predatorhelios.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d504a000000b002366553eca7sm10673239wrt.83.2022.12.08.07.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 07:30:45 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v4 4/7] dt-bindings: pinctrl: add bindings for Mediatek MT8365 SoC
Date: Thu,  8 Dec 2022 16:30:37 +0100
Message-Id: <20221208153041.3965378-5-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208153041.3965378-1-bero@baylibre.com>
References: <20221208153041.3965378-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_073048_234353_88407F72 
X-CRM114-Status: GOOD (  17.21  )
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

Add devicetree bindings for Mediatek MT8365 pinctrl driver.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 197 ++++++++++++++++++
 1 file changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
new file mode 100644
index 0000000000000..9560e1d2898d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
@@ -0,0 +1,197 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8365-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8365 Pin Controller
+
+maintainers:
+  - Zhiyong Tao <zhiyong.tao@mediatek.com>
+  - Bernhard Rosenkränzer <bero@baylibre.com>
+
+description: |+
+  The MediaTek's MT8365 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt8365-pinctrl
+
+  reg:
+    maxItems: 1
+
+  mediatek,pctl-regmap:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      maxItems: 1
+    minItems: 1
+    maxItems: 2
+    description: |
+      Should be phandles of the syscfg node.
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      Number of cells in GPIO specifier. Since the generic GPIO
+      binding is used, the amount of cells must be specified as 2. See the below
+      mentioned gpio binding representation for description of particular cells.
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 2
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      'pins$':
+        type: object
+        additionalProperties: false
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pinmux:
+            description:
+              integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are
+              defined as macros in <soc>-pinfunc.h directly.
+
+          bias-disable: true
+
+          bias-pull-up:
+            description: |
+              Besides generic pinconfig options, it can be used as the pull up
+              settings for 2 pull resistors, R0 and R1. User can configure those
+              special pins.
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          input-disable: true
+
+          output-low: true
+
+          output-high: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          mediatek,drive-strength-adv:
+            description: |
+              Describe the specific driving setup property.
+              For I2C pins, the existing generic driving setup can only support
+              2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
+              can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
+              driving setup, the existing generic setup will be disabled.
+              The specific driving setup is controlled by E1E0EN.
+              When E1=0/E0=0, the strength is 0.125mA.
+              When E1=0/E0=1, the strength is 0.25mA.
+              When E1=1/E0=0, the strength is 0.5mA.
+              When E1=1/E0=1, the strength is 1mA.
+              EN is used to enable or disable the specific driving setup.
+              Valid arguments are described as below:
+              0: (E1, E0, EN) = (0, 0, 0)
+              1: (E1, E0, EN) = (0, 0, 1)
+              2: (E1, E0, EN) = (0, 1, 0)
+              3: (E1, E0, EN) = (0, 1, 1)
+              4: (E1, E0, EN) = (1, 0, 0)
+              5: (E1, E0, EN) = (1, 0, 1)
+              6: (E1, E0, EN) = (1, 1, 0)
+              7: (E1, E0, EN) = (1, 1, 1)
+              So the valid arguments are from 0 to 7.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+          mediatek,pull-up-adv:
+            description: |
+              Pull up setings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          mediatek,pull-down-adv:
+            description: |
+              Pull down settings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          mediatek,tdsel:
+            description: |
+              An integer describing the steps for output level shifter duty
+              cycle when asserted (high pulse width adjustment). Valid arguments
+              are from 0 to 15.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          mediatek,rdsel:
+            description: |
+              An integer describing the steps for input level shifter duty cycle
+              when asserted (high pulse width adjustment). Valid arguments are
+              from 0 to 63.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+        required:
+          - pinmux
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pio: pinctrl@1000b000 {
+          compatible = "mediatek,mt8365-pinctrl";
+          reg = <0 0x1000b000 0 0x1000>;
+          mediatek,pctl-regmap = <&syscfg_pctl>;
+          gpio-controller;
+          #gpio-cells = <2>;
+          interrupt-controller;
+          #interrupt-cells = <2>;
+          interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+
+          pio-pins {
+            pins {
+              pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>, <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
+              mediatek,pull-up-adv = <3>;
+              mediatek,drive-strength-adv = <00>;
+              bias-pull-up;
+            };
+          };
+        };
+    };
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+allOf:
+  - $ref: pinctrl.yaml#
-- 
2.38.1


