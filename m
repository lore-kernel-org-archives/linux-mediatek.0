Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50DDC61DCB
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 15:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCeTc9lFzVngFgqZDJ957kMMyxZG+4tMbEHn+5tCb/Y=; b=mJ+KVJ3ar+pME1iRvH2/rEyvTw
	vy1e9B9mS7I7jmJfGzLJKuT11Yx3qbWD7hXjOknz+7ggVzVT/fNgmFZyCZ/0izB6gSljg0Sdi3ERq
	X5zwMn9Wi2Ko+r86UCCOdB0WC6h+seyOJQUk2IahBvxWS6MmC2dVYBPsa6kGPHae5GSDJu6xT6Jtu
	dDYgRGfs8pKBJ1SkSIe/G0qtYvX72IjICJvWXppX4IORUAEBXqqic3i8CIHFx+5Km+lHP4MX6xXUm
	wqcoT8emf7qNK0lKmW8/RBpbv5kRjxIQx6HJsKm1zhU1oLhxUBYg0M7i5HzB10bGjka5SxzYQ27qu
	B7WQAviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzycN-000000066vM-3Iu8;
	Fri, 28 Aug 2026 15:35:47 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzycM-000000066uM-0mAW
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 15:35:47 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1158756a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931345; x=1788536145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCeTc9lFzVngFgqZDJ957kMMyxZG+4tMbEHn+5tCb/Y=;
        b=ZuDb2y6fkvVdeYUf+fI/ft2Q2y9oQS93G1VRYJZmBN4JhuP3FtfNDAFDBgilDInwwi
         5DXaCgpBeCJIOzSpFrePQAXJlAKYf+YPmkF9T+xrnlhArrnDh+2bi3x5KSpqi1CaM5qc
         eoFf12Z42UYW6Kk2+J1Nonfb8n/b7avMwdH9e5P5EKdm69+QOzL+84QCxCE2osy5nWK5
         Dt+ZzACGApOUBRqeuCCbLmmzoJJX/oh9M7LZQsolKDh+boSX/iedewx9EhQWkMU/rNtz
         v2F6gPT/Tzgnu4fiW+3OA0rRtJpfaIR4oEtZ8jjmNG7GcbVe1WK4KE4qOt5gnCO/uEc9
         FJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931345; x=1788536145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCeTc9lFzVngFgqZDJ957kMMyxZG+4tMbEHn+5tCb/Y=;
        b=SyHd8Cn+qj77ZHQcbQ5QhQaVbFZ5ZVPp0yZTjhizxN8sd3qT8jusiZi/jk2kJWN+TJ
         FOd3Fp8ShRPpfY01tYA1waQsTiO5d0tNXEy7fhV6mc5YcQBq/vO6Vp0TjZWJEgsk9CKY
         WqbvLp111oGmXakUW7Hy+Bp465yx2BUrXkSbNsPOtlKwbpbuWehG8IG9lQY8iBZ9vsPP
         nnhC56nZQGQNHHafbvjuvBb2U0Ymb2aTQ/IY7CEaVouK/knw+ZrgBkpSL7WK1vZrjcno
         DNPPpDS8ey7OrmmkPiVXH3nZ1JQnahP7e+KKdVP0PLoNhiYxsNgszXd5n0uV0r/JX1i1
         ussw==
X-Forwarded-Encrypted: i=1; AHgh+Ro43vrZAI7qwop2rmf00NAY4GykM5PtMxEmtMnh0z7wy0POGJG8M5LGs81Zb++lDIN7IB0zAZ22BzpK/a6/Xw==@lists.infradead.org
X-Gm-Message-State: AFuF++mYvYKduqqAq/BVscEYB/mB25V9xuyKFXsiNLXEl7cTBWHMAPa1
	fg4mr/jCYq/Ula4uJm924JMQHCq5PzVKpyv85DZ7NbM465nzY4jqdwta
X-Gm-Gg: AR+sD10q7Ra1yQuZPDxYzom37wadVcu+yyxL2IvSN5i720aDqKLh1Ctv2y2f6l0n6Oz
	OpIB8uSgr149nLKNgc5htA2FUUUD1XKRyQkkFETTN02tAMPsVvIojimLdhUYx3JukCJfnM0s6no
	4rBDpz/Z150nJUKaeja4C+wV22DlZztxEqsEYyFyTKy+AYgxbA1L6eU6oQUdDDOOCZobU8opPCo
	cKNfzoLomCN+V/YuXA8r2oRsF/05OtaN9j7YeYOS1PdzQlXST7ViQWD/0NGo4zggLV95gzKqand
	0YCgNfQvUbNb88zOPyUxT3heZWZsYc0ldMj1JEsLw4v6U5WkQg6HjS1Cd/G6nwgEGZ5J0L0k9jf
	Iel9qfr3vvNxhHyiUhEo/Pk5ROMlOB3MhpWAv6J8GoUNsiJga3DitUuk7s0AQoHqgylFR8kgEIT
	vzBTltFsoXbcNp9VtFXXNOtej8T+vANGeh7bJ8xnIoVR3b96i6QPO8rx/27oaMu2i6LV0JdCRF
X-Received: by 2002:a17:90a:d410:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-3969ba3c165mr21493038a91.3.1787931345118;
        Fri, 28 Aug 2026 08:35:45 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([157.51.224.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm6256824eec.23.2026.08.28.08.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:35:44 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin controller
Date: Fri, 28 Aug 2026 19:35:14 +0400
Message-Id: <c20005a81b4069f3ff68311629ff7d4678fa92dd.1787931313.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1787931313.git.naseefkm@gmail.com>
References: <cover.1787931313.git.naseefkm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_083546_233141_C3E7C92A 
X-CRM114-Status: GOOD (  14.88  )
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

Add the binding for the pin controller found on the EcoNet EN7528 MIPS
SoC. It shares the IP with the Airoha pin controllers, but its IOMUX and
pin configuration registers have a different layout, so it gets its own
compatible.

The CHIP SCU holding those registers is referenced by the airoha,chip-scu
phandle.

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 .../pinctrl/econet,en7528-pinctrl.yaml        | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
new file mode 100644
index 000000000000..3ce1a5309d09
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/econet,en7528-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet EN7528 Pin Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
+  IP with the Airoha pin controllers, but its IOMUX and pin configuration
+  registers have a different layout.
+
+properties:
+  compatible:
+    const: econet,en7528-pinctrl
+
+  airoha,chip-scu:
+    description: phandle to the chip SCU syscon
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+patternProperties:
+  '-pins$':
+    type: object
+
+    patternProperties:
+      '^mux(-|$)':
+        type: object
+
+        description:
+          pinmux configuration nodes.
+
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
+                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
+                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+            items:
+              enum: [pon, sipo, sipo_rclk, uart2, uart2_cts_rts, uart3,
+                     ejtag, pcm1, pcm2, spi_quad, spi_cs1, pcm_spi,
+                     pcm_spi_int, pcm_spi_rst, pcm_spi_cs1, pcm_spi_cs2,
+                     pcm_spi_cs3, pcm_spi_cs4, pcm_spi_cs5, pcm_spi_cs6,
+                     pcm_spi_cs7, pnand, gpio0, gpio1, gpio2, gpio3, gpio4,
+                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11,
+                     gpio12, gpio13, gpio14, gpio15, gpio16, gpio17,
+                     gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
+                     gpio24, gpio25, gpio26, gpio27, gpio28, gpio29,
+                     gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
+                     gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
+                     pcie_reset0, pcie_reset1]
+
+        required:
+          - function
+          - groups
+
+        additionalProperties: false
+
+      '^conf(-|$)':
+        type: object
+
+        description:
+          pinconf configuration nodes.
+
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                     gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                     gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                     gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
+                     gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
+                     gpio38, gpio39, pcie_reset0, pcie_reset1, i2c_sda,
+                     i2c_scl, uart_txd, uart_rxd, spi_cs0, spi_clk,
+                     spi_mosi, spi_miso]
+            minItems: 1
+            maxItems: 50
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          drive-strength:
+            description:
+              Selects the drive strength for the pin, in mA.
+            enum: [2, 4]
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - airoha,chip-scu
+  - interrupts
+  - gpio-controller
+  - gpio-ranges
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pinctrl {
+      compatible = "econet,en7528-pinctrl";
+
+      airoha,chip-scu = <&chip_scu>;
+
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      gpio-ranges = <&pinctrl 0 0 42>;
+
+      uart2-pins {
+        mux {
+          function = "uart";
+          groups = "uart2";
+        };
+
+        conf {
+          pins = "gpio28", "gpio29";
+          bias-pull-up;
+        };
+      };
+
+      pwm-pins {
+        mux {
+          function = "pwm";
+          groups = "gpio30";
+        };
+      };
+    };
-- 
2.34.1


