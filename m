Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CACD606A32C
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 16:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XSTTFyyh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zaucxQLM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=; b=XSTTFyyhBfg6Rz
	yznZ8zm0Gi9iHKjhYe0j34+fEiNzfQF1NBzwG9wGUbom9qIBJTxtfAd+xJ2xKYKiUFTfNutha769R
	+ENi+NTNGqJ4CEY5YmPwLG2d9CVAtDYbzBcuCYXEy0gZ1tb7ObvOl2y+RBLloEmp8KwOkf52oJKDx
	wnbhF14XPdflf1mo7syenG7c5sIn5EuwFpdOV1MMscwcql2cksA9LwEqNTvKRVTK0QZM7yoPtb9qB
	c6easu8kF5JXf5ViP0cClQoOkbnSs9DIprLq2ZD3M4EBU559SfApc5E0Oz5NauVFKRSB8o1WoeV2j
	T+TmlylcaOqERVNvJf1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiMK-00000009RH7-0AwH;
	Wed, 18 Nov 2026 16:18:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiMH-00000009RDt-0LEp
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 16:18:06 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-49d64a88222so1493071f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 08:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018682; x=1795623482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
        b=zaucxQLMQLdSlMUuJcXtEu4+umNa6gLv39bK3fbHs2406TShPyEb5V6MTiiORACeOh
         odb3jXiNq0S0kptcKAtdH2nKXHwCIh4p2UONekt5vk4ZQF1zd7Dfldm/bIjM79tRf8Ru
         LZaqT61kSMEOhy+zMe7KfQJJI646nD8Wc7OesTNRWsLIsaxHyxcUJnZ4HcDjjVeSF0e5
         owhGy0oyO3qvHrE77TmNMPz8dXzdebYd0sBoPwFkFjfSfTz25o2rUQKmL0yEtpvhWqAw
         nmo7GiLyGgHUpn5ba/OSaY5PgLa8QFk2Y5tDw6bbZf3KIBzgbR28SP2mFrgMSZJeIF2N
         J1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018682; x=1795623482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xD6Dy3y4d1wnxROTLCHN7ijMhBMBe0bu6u+PB8rbtjg=;
        b=KUVDRbH4Sp5bwx02GeZwixFSQxKdvlpS9wwDID2kO8XyPRb+xncIBfBZ+3rEoU0+MG
         4QphWjvmgQRXlmIRpKz6q/A1qbFaQ2VcdDXduzt5/6p0sECml1fEyLbglsnoC005p2rE
         wwe/ylvUudkiEZ1IWFrz720ypcvxMasMsW5QltNIsrWiXGd/clq5niCXdCPkYsDvVima
         jT3SykCtuhDedtzVIknLDw/UVcoU55LmcJmhC0QiOW7Vg7m/kVrYrPSH+elOgidvfZGf
         6funoSEjnYrWD72BKOnZEmeclzd+HJ5B686x4NFA86lgTm7s7B53jCfjG+ux6G4XZPmh
         ptZw==
X-Forwarded-Encrypted: i=1; AL+hErGg4231f+2OzWoWJ8LQA63hUPk9hqFp4OClQoyDobj8V6e2kDI5lG4o8agwSf8+7lGxw/1DZet2GPe+Kmh+KQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8dC9ixpCu+NnPj0hgqFoOFHCbPxs2P7IeFQG4b8ZLnj6dzcgYB
	l6AFYcKY5B/NvL3c0LKCjFdi2Y2NqGSNNvbn4aGxc5MAosp12QPFzLeP
X-Gm-Gg: AZFdTZcDMxPBN3Iz050ukc2qfUctJ9RtkmaXMwXwdRxYLvjGym1OAak8kpHhOLX9bG9
	6g4gXFZqP3klU2aQcHd4lZRRTna9EV8gvkqaXkvxEKY1MPeIYfnZL09cFf5YBk4w4m8DzmUtKKN
	n8ZrljkJqlB144EDqkjTTSZxuccbyfOCIBzcmeZfB/Kg6qS5KSIWffhfRtgshNzFx66AWYBfatf
	b5J8YAEZlEdK/dzppt6y0iwS2hWbXYSg1xBE760X1dcvYmCc5k/AJhbkCSxiwmpVRYkG1FZ9v3o
	/F56dt9sbECYTQPW6cZ3ZwKj6AJnLYIkUsZfcJxfNDaWzkbMmBbUBv15ug3xoakBfYM59bNvVOl
	/cHfRQqpnAErXNb3YsOHiYpD6Tfwl3I5OCEfPv3dpNP013pIubTkBTwjVV5v4B+0aslxD4HpqnL
	PNRy7JTmgLSLrFl6NrDbFX49bm7SktrqituL3qWVIgRfvV8HWrSTGvlQQU6pwDBHRp5irR4Nqy6
	QLRfKi7SykLR1WrwQTKX75OqS2r9HCYAdAYh1uWob9Zbm2DuuifjuNaj2I5RGahTDgEJvnoUQtm
	VsyxXWUU1nN8CMYBny/x5mN4mI/QJZTJYhwN/Y5LBPtTFEchECYY4fVXKNDU0kNhFfZHEooT1jy
	l5ETXhLTK8HrDR4Lw3P4ymMpwfZaOvv87wA==
X-Received: by 2002:a05:6000:29c8:b0:4a3:c963:c1c3 with SMTP id ffacd0b85a97d-4a63937fce8mr4376849f8f.15.1795018682433;
        Wed, 18 Nov 2026 08:18:02 -0800 (PST)
Received: from [10.161.246.232] (host-164-37-100-34.net.onlyservers.com. [164.37.100.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100bf42sm5329699f8f.1.2026.11.18.08.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:18:02 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Wed, 18 Nov 2026 19:17:36 +0300
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: mediatek: Document MT6895 pin
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-pinctrl-mt6895-v2-1-0728c4eddcac@gmail.com>
References: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
In-Reply-To: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_081805_234638_FCFD0A59 
X-CRM114-Status: GOOD (  15.39  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add device tree bindings for the pin controller found in the MediaTek
Dimensity 8000/8100 (MT6895) SoC.

The controller has 227 GPIOs spread over a GPIO base and 13 IOCFG
blocks, and an EINT controller made of five blocks (W, E, S, N, C).

Pins with PUPD/R1/R0 or RSEL pull-ups take the raw MTK_PUPD_SET_R1R0_*
and MTK_PULL_SET_RSEL_* values in bias-pull-up and bias-pull-down.
There is no public table of the RSEL resistances for this SoC, so the
binding does not offer the ohm-based values used on MT8188 and MT8195.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  | 228 +++++++++++++++++++++
 1 file changed, 228 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6895-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6895-pinctrl.yaml
new file mode 100644
index 000000000000..e3ecfffc084e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6895-pinctrl.yaml
@@ -0,0 +1,228 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6895-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6895 Pin Controller
+
+maintainers:
+  - Alexander Letuchiy <asalde.le1@gmail.com>
+
+description:
+  The MediaTek MT6895 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt6895-pinctrl
+
+  reg:
+    items:
+      - description: pin controller base
+      - description: rm group IO
+      - description: rt group IO
+      - description: rmm group IO
+      - description: bl group IO
+      - description: bm group IO
+      - description: br group IO
+      - description: brr group IO
+      - description: lb group IO
+      - description: lm group IO
+      - description: rtt group IO
+      - description: tr group IO
+      - description: tl group IO
+      - description: lt group IO
+      - description: EINT controller W block
+      - description: EINT controller E block
+      - description: EINT controller S block
+      - description: EINT controller N block
+      - description: EINT controller C block
+
+  reg-names:
+    items:
+      - const: base
+      - const: rm
+      - const: rt
+      - const: rmm
+      - const: bl
+      - const: bm
+      - const: br
+      - const: brr
+      - const: lb
+      - const: lm
+      - const: rtt
+      - const: tr
+      - const: tl
+      - const: lt
+      - const: eint-w
+      - const: eint-e
+      - const: eint-s
+      - const: eint-n
+      - const: eint-c
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
+      the amount of cells must be specified as 2. See the below mentioned gpio
+      binding representation for description of particular cells.
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names:
+    maxItems: 247
+
+  interrupts:
+    description: EINT controller interrupt
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+# PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^pins':
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        description:
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+
+        properties:
+          pinmux:
+            description:
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux are defined as macros in
+              arch/arm64/boot/dts/mediatek/mt6895-pinfunc.h for this SoC.
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          drive-strength-microamp:
+            enum: [125, 250, 500, 1000]
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+                description: normal pull down.
+              - enum: [100, 101, 102, 103]
+                description: PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+                description: RSEL pull down type. See MTK_PULL_SET_RSEL_ defines
+                  in dt-bindings/pinctrl/mt65xx.h.
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+                description: normal pull up.
+              - enum: [100, 101, 102, 103]
+                description: PUPD/R1/R0 pull up type. See MTK_PUPD_SET_R1R0_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
+                description: RSEL pull up type. See MTK_PULL_SET_RSEL_ defines
+                  in dt-bindings/pinctrl/mt65xx.h.
+
+          bias-disable: true
+
+          output-high: true
+
+          output-low: true
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt65xx.h>
+    #define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
+    #define PINMUX_GPIO6__FUNC_SCL0 (MTK_PIN_NO(6) | 1)
+    #define PINMUX_GPIO7__FUNC_SDA0 (MTK_PIN_NO(7) | 1)
+
+    pio: pinctrl@10005000 {
+        compatible = "mediatek,mt6895-pinctrl";
+        reg = <0x10005000 0x1000>,
+              <0x11c20000 0x1000>,
+              <0x11c30000 0x1000>,
+              <0x11c40000 0x1000>,
+              <0x11d10000 0x1000>,
+              <0x11d30000 0x1000>,
+              <0x11d40000 0x1000>,
+              <0x11d50000 0x1000>,
+              <0x11d60000 0x1000>,
+              <0x11e10000 0x1000>,
+              <0x11ea0000 0x1000>,
+              <0x11eb0000 0x1000>,
+              <0x11f20000 0x1000>,
+              <0x11f30000 0x1000>,
+              <0x11e50000 0x1000>,
+              <0x11ce0000 0x1000>,
+              <0x11de0000 0x1000>,
+              <0x11fe0000 0x1000>,
+              <0x1c01e000 0x1000>;
+        reg-names = "base", "rm", "rt", "rmm", "bl", "bm", "br",
+                    "brr", "lb", "lm", "rtt", "tr", "tl", "lt",
+                    "eint-w", "eint-e", "eint-s", "eint-n", "eint-c";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 227>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
+        #interrupt-cells = <2>;
+
+        gpio-pins {
+            pins {
+                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+                bias-pull-up;
+                drive-strength = <6>;
+            };
+        };
+
+        i2c0-pins {
+            pins-bus {
+                pinmux = <PINMUX_GPIO6__FUNC_SCL0>,
+                         <PINMUX_GPIO7__FUNC_SDA0>;
+                bias-pull-up = <MTK_PULL_SET_RSEL_111>;
+                drive-strength-microamp = <1000>;
+            };
+        };
+    };

-- 
2.56.0


