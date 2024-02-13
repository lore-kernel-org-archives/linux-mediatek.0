Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3EFC48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 06:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+8pt6VHhKtuQrCkrL4eYU+g664w9Q1Xy3QJwOydZtt8=; b=R1KJNFKBb7uiZTSseFhf7FM0MG
	Oub1RhTuReI8DyhjH7W8e/jeOlVZ04geJ+MYLtQ1qS2A6n2mFZCF2aE8HOGqAA3huTF4mGiloV9DR
	xt5Kze8l9knLMv+PZgeFJN3xk8NXJUsKEwBLt0LX5h2dTQNeKgN3bPOW4rZPfie3SqGKMB6dLZgxQ
	GVYJwIE9AH1m10TqWKl1JBjmm+OIhl13z/XLREqjAaZ7utdN42ZtIU8diXXAG0SUnNgXnniK+xec3
	CTpa79+kudwrEzvvwe4Me0RPTzbYRxlUMZKOZLG9CE16V02Eu7fFWCGWtuqCzov5ksMfq9EvBpv2k
	0mZ6jf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZmSI-000000089mo-3nhr;
	Tue, 13 Feb 2024 06:39:46 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZmSF-000000089mE-2MtH;
	Tue, 13 Feb 2024 06:39:44 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-55fe4534e9bso5103236a12.0;
        Mon, 12 Feb 2024 22:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707806382; x=1708411182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+8pt6VHhKtuQrCkrL4eYU+g664w9Q1Xy3QJwOydZtt8=;
        b=Ww8wtSU/3WV7IPeUKvHN1+Apza5GTf2YlTfHQ6etT22GhesD6B8DKwmkhs8OxdzWFe
         69eOJihsCbKVli2Liss6nU1F2toHyaIs+63SPsk/joyVdN1/JFsJU4U5+BofKLpxrTHE
         DLIcOJuWQuR88/zA0x2X22yZA224xx3EQ5defetsYxufvJjv6ybFuKDmO7DoF9WJKGth
         2SfQOokk2Yev1jE9qJI79Wdb3yDSQY8DobSui7S5sxmMkI10M45CJI/npS1leHzCqH+b
         AHCf82aakkW5oSpYI0X3zK3lRngXTQVcOJjzkAtCqMfQZpVBEXwrhSvypYaCp8SBxbqJ
         VeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707806382; x=1708411182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8pt6VHhKtuQrCkrL4eYU+g664w9Q1Xy3QJwOydZtt8=;
        b=Bu6Q7EkCMxq3FHkIyCuoksJeoduJlKe4YZnubzcpIE7M50kNnAfp9QwGX/allvlImQ
         bZ61rkLpe8HQ8eCW1966chr8p7n7GT5yLjCgX2Nwqqhm/2bUxvzIjKsmtVqvLlOA3JvG
         Ths1hyTVLwQTIx2Coas/WcOm+owfAz4RqviXQePi61/v6lzUI4+5dFEGK2DYRI8VHU28
         CCpOM6ZpqD+H1V52H8o/ANCG/WcKtj0LujGOUQqkXhLWKXtMl7yrLhMtUGkXukkBfWMV
         rCOy5eJbtQ/o/PrhaP0F6Fn2a100tAm5l2B4CwYOiZ1bLjh9f/Rjg+QytDKgNhya0uJz
         3TfA==
X-Forwarded-Encrypted: i=1; AJvYcCWvYER/6uUVZodha7riYvrYaAf41ZcM96FP0hyOdwJu4QyZdfKejXr8YNijI3Mmr0EpzHGLCRF0+ZXoEW5a2WL+ExwH2jp52NTdDnc5UukC/d/EfbenSLHvfNk5PZqIfgGiqj1Kce0iAW7l3Kl2CoIZfSmCPJg58EI=
X-Gm-Message-State: AOJu0Yyv34InAS2s4uSqWT6vLyJ1cQaMNc6KDn4nlpr4kihX4WJfLj7i
	Z97pDH/lVRLdm7FgLMEMo+p1EeDS7gS4uZkomEuadmhsHf8+0X3f
X-Google-Smtp-Source: AGHT+IEqTmOc0sq5TASgr87A4NKy6RXgxM2CfARszUCki67UusO4d/oDgeciP7n5Wq9/B0mV0FG0vQ==
X-Received: by 2002:a05:6402:22ec:b0:561:f77b:c0b0 with SMTP id dn12-20020a05640222ec00b00561f77bc0b0mr366141edb.39.1707806381728;
        Mon, 12 Feb 2024 22:39:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmM20RiFucNWcWudlwle5UIyivsj+VmyDj7ESp8ItNoGl5Yc18W9SP3AlsHqwsqVhGWO2jvgKyufk2AkNY/kAD7VeW+AyCnXMFpNiPKQE3S/sTlke2zF7/3CBJL6u/KU058BjWwOxnhM9KyOH/OT1e7xPJ+XrN3Qclo5vCGFpkhzC0uM6UVp7b3W5clFIF3+c0ap7yZxWuPUH8SSwwE3/okSnIeLpnOOqlMcrWHE5+ZHlBEvgpSVlwDRm5Bb4QfaLsswyoKzvTAWoIwwj3ctKeudkLu5+8ggfaIUscp8N3YO7D16b5lH2WMzFppilQ/WYcW7t8DM8Yb5sP3RKNnI7XSiAhQYMK2JQPMLlQY/MiMiZ9enOfMxvC11YJWP5KpcqWyhPiy40pWVS5tlb88WdcYF6fEs3I1rIfmmHdYdlYuC8P/uhwKKWjS+XIFHD6Nhdfyz+iU7ca6CBmaMbcDGUc7rjLOZgrUXJh
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id fg5-20020a056402548500b00561814de0easm2847074edb.62.2024.02.12.22.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 22:39:41 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: dma: convert MediaTek High-Speed controller to the json-schema
Date: Tue, 13 Feb 2024 07:39:19 +0100
Message-Id: <20240213063919.20196-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_223943_657166_7A35B074 
X-CRM114-Status: GOOD (  18.30  )
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

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files. Introduced changes:
1. Adjusted "reg" in example
2. Added includes to example

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/dma/mediatek,mt7622-hsdma.yaml   | 63 +++++++++++++++++++
 .../devicetree/bindings/dma/mtk-hsdma.txt     | 33 ----------
 2 files changed, 63 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/mediatek,mt7622-hsdma.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/mtk-hsdma.txt

diff --git a/Documentation/devicetree/bindings/dma/mediatek,mt7622-hsdma.yaml b/Documentation/devicetree/bindings/dma/mediatek,mt7622-hsdma.yaml
new file mode 100644
index 000000000000..3f1e120e40a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/mediatek,mt7622-hsdma.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/mediatek,mt7622-hsdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek High-Speed DMA Controller
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7622-hsdma
+      - mediatek,mt7623-hsdma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: hsdma
+
+  power-domains:
+    maxItems: 1
+
+  "#dma-cells":
+    description: Channel number
+    const: 1
+
+required:
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt2701-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt2701-power.h>
+
+    dma-controller@1b007000 {
+        compatible = "mediatek,mt7623-hsdma";
+        reg = <0x1b007000 0x1000>;
+        interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&ethsys CLK_ETHSYS_HSDMA>;
+        clock-names = "hsdma";
+        power-domains = <&scpsys MT2701_POWER_DOMAIN_ETH>;
+        #dma-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/dma/mtk-hsdma.txt b/Documentation/devicetree/bindings/dma/mtk-hsdma.txt
deleted file mode 100644
index 4bb317359dc6..000000000000
--- a/Documentation/devicetree/bindings/dma/mtk-hsdma.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-MediaTek High-Speed DMA Controller
-==================================
-
-This device follows the generic DMA bindings defined in dma/dma.txt.
-
-Required properties:
-
-- compatible:	Must be one of
-		  "mediatek,mt7622-hsdma": for MT7622 SoC
-		  "mediatek,mt7623-hsdma": for MT7623 SoC
-- reg:		Should contain the register's base address and length.
-- interrupts:	Should contain a reference to the interrupt used by this
-		device.
-- clocks:	Should be the clock specifiers corresponding to the entry in
-		clock-names property.
-- clock-names:	Should contain "hsdma" entries.
-- power-domains: Phandle to the power domain that the device is part of
-- #dma-cells: 	The length of the DMA specifier, must be <1>. This one cell
-		in dmas property of a client device represents the channel
-		number.
-Example:
-
-        hsdma: dma-controller@1b007000 {
-		compatible = "mediatek,mt7623-hsdma";
-		reg = <0 0x1b007000 0 0x1000>;
-		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&ethsys CLK_ETHSYS_HSDMA>;
-		clock-names = "hsdma";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_ETH>;
-		#dma-cells = <1>;
-	};
-
-DMA clients must use the format described in dma/dma.txt file.
-- 
2.35.3


