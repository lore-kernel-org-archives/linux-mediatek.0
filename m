Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD9DC5AD4E
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 08:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67itLQpWkT3nHAkDca2XQ66Vsg3pd/iTwYazZWQUnDU=; b=q5c7jEU0Hd3OkUGZVfX6exQYDe
	72Jroo7llZB8ZJmLXc1Hev3pCQA1u8rtTO2DB+lpuQorkXJjx/B/awBbyAcvcLHFpZTZdbSbHbpvV
	hGEMzX7Rfb0CK7l3wrvLxqgtL4xz5NM5a8LIBJ9BjIYi7Z9r5GSDcrHG+rq0ph4QEUaF+5rsPS8lQ
	oPjFAUQM3VGOrIuIDRWGX+fBLNdVUh3AaHhsWxSebOR4ANDL4OICOIJxO2jlqz//DHMiLsRocTJXp
	bfxmNMQFwUSGSBJJETDCp6rXNGMZrtyBWpVnJ01owyjm/NFNtWpNp95/On1e1PHk7LkVi2X564oFD
	DFbzu42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsyX8-0000000A545-028F;
	Sun, 09 Aug 2026 08:05:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsyX5-0000000A53K-3dNq
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 08:05:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso7086635ad.3
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786262723; x=1786867523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67itLQpWkT3nHAkDca2XQ66Vsg3pd/iTwYazZWQUnDU=;
        b=bw0iukrxXMOgCAl1QcxZcob0+JAIq9CwH4nHkp8L96u7vq2nVt6+sUnBaSqdSr8B/W
         uB19LUbxzIJhVRMqo9Sscp+zUiNVnIERoTsH8J8bUseQz2sZi/4cqUVLs1AWxDV7xpgh
         3WoLFBbat2GdL41gbnxO/n4GKZxyvmlyk9Lp0Iki/51MyiqKs+s/93UvP05QMpg4e1ha
         kfT+ZWbvkpRCH14F6hz3kFYW8pX2T0+1q8NXWSvy0utEk9SnpUkrJvXTqAZu6vHCm5ip
         pY/lg5gEKWllT8iQYXo1W60E1kIHJ52GvMHYiaAZl/T/dPUWHK77uF0XIUCp+yz/bnvF
         Cn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786262723; x=1786867523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=67itLQpWkT3nHAkDca2XQ66Vsg3pd/iTwYazZWQUnDU=;
        b=DNcm0FYeKiaVATW7cS4E74jHuB6JBODCxS90CqHnqloCo9LLGCOt+3uaK348eGUBPp
         6iOYOR1Njk6FySbIqwRE/so6YHWw9qOLtlCA8HWg9N7Q14UiYX4A67e5od27OKNEuVf8
         89htvDZgLtNF7bs+mVXh0bXl8UPqdwuX0VNrX1uR3Ss0QHd3NY1fzACuUb9EzYMLBSRM
         IC7xrG8NCttDkaQKLcSK2qHuayFC1b2KHGzjYvB4LvYwN6ObpJQzwvoXUJkhN2OOV+7s
         IG6XjTUauR5Eji//fiuqFdD/Vxr2NOVzT0t1pTo9spceOdz9KN5fvMxZ/KaM/2e3wbMv
         IGlw==
X-Forwarded-Encrypted: i=1; AHgh+RpVQ1pbqAHAA4AHbnfopNiwl7JQmzVrZOBmDLNTpe4FRlB8PONvCpZzgS4HdffIbYN0ays2B3FvGg6CTAZQAg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzun9ShDF6Yf6ZPpWy8v0tjai+Oy8A2rrTU90GPRmPuESB7uZI6
	6oDSH0AyxjzI12CzkZpqPLKGMhCnlCCw0AGsnT47boAC/wjzdXhR3lxr
X-Gm-Gg: AR+sD11TvkJELlBjH4HyvZX8qe8vgEY++xJO80g6GgdiaeRnCu7Dbj7/7xfRFRBJyaw
	QddW+QfA/PRSoGSQPmo/6WmDifRdORZVj/G05qoNUK4rl5F4fqRvudN3GwpROsWx1posyvkhXWs
	oMLMX5vIQg5ohV8ieAnHkX86jVxlXbNBNsp4bLzoG1pETFikK0T1ktIL9GhJczVipgjlnw7Soeu
	p/beWAfWUw7NRsrbkfpUXful0FoT9Yho1C1d/eWGnkqHQPWcT23DdY8xiK5ULNCBTnmFw8Utu37
	+EIbpKUP4xOAZ1Mnup76rg22rQFaVBbKR0wvfRDF7U6pW8UcE8RVLkZbmN56qxd4kZ420z2zDRS
	82V/ScmoZTs8xyLSDN/7sDTeYFlfiRXMWC6SAHCkhbyjwGB94r7PBL3ply3cjDlsnUINmE0pPKR
	37VDS/wwF0w7cD9cxbNvBOJ4LPxQ62KwKwpjjKV9/rfiM1/PP3ovbNP+zsDV3TI78B/G1wUzvt8
	dWrp0s=
X-Received: by 2002:a17:90b:3c90:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-3928236ff5fmr12382406a91.12.1786262722632;
        Sun, 09 Aug 2026 01:05:22 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7b39bsm23315598c88.14.2026.08.09.01.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:05:21 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin controller
Date: Sun,  9 Aug 2026 12:04:59 +0400
Message-Id: <7e6150b186c2d16820d7382bce065596a0854a47.1786262697.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1786262697.git.naseefkm@gmail.com>
References: <cover.1786262697.git.naseefkm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_010523_920604_65F6ABA9 
X-CRM114-Status: GOOD (  15.18  )
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
index 000000000000..574285939c9d
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
+allOf:
+  - $ref: pinctrl.yaml#
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


