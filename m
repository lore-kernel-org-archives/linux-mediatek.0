Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9E2C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 14:57:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15518610E9
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 14:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15518610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kgr+QnqHwl3xDNjlIV8fiUwTdqa7bOoxI8Cz88zyL2g=; b=junnz6fnquctyRxJMjdDva5nso
	AQXFtTs5ADn7C8HM94SpmhVlXfv+vsDhsh3nUM3ubJxzdN9hYdGREvC/ur/vTHsJvNsdf08r6HENR
	uFAFYey6orjgvbYLWQFOp9+tRp2dJJ+xE7duFFf26WS+2pHsbVgvvIo2Uf1JMvqWuwOALgbZ++YJH
	OC7xASTQrolP+msjOwZOmYH7P48noFCc5krY3tb22viK427/xJWF/Hv4RIu7adpkV3Y5uV5qw4JBI
	G8NC6ZRNN+xVYpUijPefLXaIWgbfCx4EUarvibn+am5g6nbnkmof3rFd5iav1FR6/HnbgHg9dxNcl
	EzrZeACg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj1A2-0017Rt-6X; Tue, 18 May 2021 14:57:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj19z-0017R0-OG
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 14:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=nnvJ8osbkowWmqtn9NFdggrDzHVnx44WWHnS4UTIDOM=; b=nffRL3MC+JE2a+iX095Msb35aF
 mxywmXufgveu8pjOiDjtxlgxbKuAJDkaUv6oFKkJUxWq10I17+EFbwr5eS5VdPvxFU0IEDdqC9XN6
 BrNi7+vYDCPh+H0v7lN3yA0fpJn0Wv6bLj1arezQBZ5F9tRlThjDDEGT7Uj1YcXwiA1qd48WikVjY
 eURs8p/ARfe5ZDzr1L9RgwoyCPb+98vI4rrywiL0eiKyPPcLjG21oce9O7+76Kl2OGTsiYL8pwYo6
 Xi7LXHDMh5lLkJjkzTJqyEz++Q7ViHcQEBhtjIioEysh2x4cBK/ZsH6vg3ueJQPCB9tUzieMEd+A1
 HxYILSqA==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj19w-00EkSc-5o
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 14:57:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 f19-20020a05600c1553b02901794fafcfefso1081553wmg.2
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 07:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nnvJ8osbkowWmqtn9NFdggrDzHVnx44WWHnS4UTIDOM=;
 b=dqKKErEgkRlR/pYnicFKmswieuRIFj7bEca/bsTnapwvj2d7DrbFobFVAB/igJPDPH
 UfbaKjLSc4YwuLqpfz4YuA8+JSRGcf6B2IAiFPw803FOmrM5P1DKzXCEH90/QzwSx2dT
 BL2cO/+aNcxil+n6LKy4wjvEWD5eqlxSnlGqOAmk2QRQkcKq8hyalmI1x5F0CwW6to79
 xVjjpqTzopTJhSXfjNkSN0zuA9/0QS4+l4yZBudznhcwL+7GhrGE2E7819lc+BM5w8Ca
 GUBBgTjXeKrdBzX7XAwZOedzp0eRVerGZgUWpjwQeV3nBLYoIRyhklIZ6pb9fO1Vhz0q
 /0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nnvJ8osbkowWmqtn9NFdggrDzHVnx44WWHnS4UTIDOM=;
 b=PkRctjZGhQd5aIhfaAYZN3LRIP7GPieLRdCwopBdh3l2U3nM7lMHTJwABastCYeU1t
 40y8cpGTtt4cvc2PnJ3qiMuG8RSrsphj5XRTmt3tooANmjshPOgPOuye8eBEfaXoJabk
 6nN65Q1O6k+nQ1skJ0ytJy4KvYb6vaBfdWbTJtlaBhWo8REWoXDV+3bCdgDLhK2SWmh2
 W3lXTa1gWQrbiHEg+xm77ItVsnUvwGQakiBKJbezT5pJNF3dhjoroOtRkDgyVsUM62sB
 bzYuOGAgZZ8W8+gR/EqwzOzkZzF+Bs5duheJJERXFz6HkDQSz7QQ3hFb1eabrtShQsjP
 TZsw==
X-Gm-Message-State: AOAM530x/lvNyQlpR8g8eVQT0AgMIKrr4obSIIfT5sibevFZ4AVYsTdY
 0NgFdJnljOdM9futlywKRv6lUg==
X-Google-Smtp-Source: ABdhPJykHbrqVuGSot4jl0mtKbOsvhBcfbVcGuhfK+eptPr3NLTg0KErO+dWYOEgB6dOfCldaFg29g==
X-Received: by 2002:a1c:2507:: with SMTP id l7mr5969715wml.188.1621349841534; 
 Tue, 18 May 2021 07:57:21 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id a18sm2928386wmb.13.2021.05.18.07.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 07:57:20 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: i2c: i2c-mt65xx: convert doc to yaml schema
 format
Date: Tue, 18 May 2021 16:55:20 +0200
Message-Id: <20210518145522.2420135-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_075724_292099_59E11493 
X-CRM114-Status: GOOD (  19.23  )
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

Convert the binding documentation for i2c-mt65xx driver to the
YAML schema format.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/i2c/i2c-mt65xx.txt    | 49 ----------
 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 97 +++++++++++++++++++
 2 files changed, 97 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
deleted file mode 100644
index 7f0194fdd0cc..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-* MediaTek's I2C controller
-
-The MediaTek's I2C controller is used to interface with I2C devices.
-
-Required properties:
-  - compatible: value should be either of the following.
-      "mediatek,mt2701-i2c", "mediatek,mt6577-i2c": for MediaTek MT2701
-      "mediatek,mt2712-i2c": for MediaTek MT2712
-      "mediatek,mt6577-i2c": for MediaTek MT6577
-      "mediatek,mt6589-i2c": for MediaTek MT6589
-      "mediatek,mt6797-i2c", "mediatek,mt6577-i2c": for MediaTek MT6797
-      "mediatek,mt7622-i2c": for MediaTek MT7622
-      "mediatek,mt7623-i2c", "mediatek,mt6577-i2c": for MediaTek MT7623
-      "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek MT7629
-      "mediatek,mt8173-i2c": for MediaTek MT8173
-      "mediatek,mt8183-i2c": for MediaTek MT8183
-      "mediatek,mt8192-i2c": for MediaTek MT8192
-      "mediatek,mt8516-i2c", "mediatek,mt2712-i2c": for MediaTek MT8516
-  - reg: physical base address of the controller and dma base, length of memory
-    mapped region.
-  - interrupts: interrupt number to the cpu.
-  - clock-div: the fixed value for frequency divider of clock source in i2c
-    module. Each IC may be different.
-  - clocks: clock name from clock manager
-  - clock-names: Must include "main" and "dma", "arb" is for multi-master that
-    one bus has more than two i2c controllers, if enable have-pmic need include
-    "pmic" extra.
-
-Optional properties:
-  - clock-frequency: Frequency in Hz of the bus when transfer, the default value
-    is 100000.
-  - mediatek,have-pmic: platform can control i2c form special pmic side.
-    Only mt6589 and mt8135 support this feature.
-  - mediatek,use-push-pull: IO config use push-pull mode.
-
-Example:
-
-	i2c0: i2c@1100d000 {
-			compatible = "mediatek,mt6577-i2c";
-			reg = <0x1100d000 0x70>,
-			      <0x11000300 0x80>;
-			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
-			clock-frequency = <400000>;
-			mediatek,have-pmic;
-			clock-div = <16>;
-			clocks = <&i2c0_ck>, <&ap_dma_ck>;
-			clock-names = "main", "dma";
-	};
-
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
new file mode 100644
index 000000000000..0f445d2ab727
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek I2C Controller
+
+maintainers:
+  - Qii Wang <qii.wang@mediatek.com>
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  $nodename:
+    pattern: "^i2c[0-9]*@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2712-i2c
+          - mediatek,mt6577-i2c
+          - mediatek,mt6589-i2c
+          - mediatek,mt7622-i2c
+          - mediatek,mt8173-i2c
+          - mediatek,mt8183-i2c
+          - mediatek,mt8192-i2c
+      - items:
+          - const: mediatek,mt2701-i2c
+          - const: mediatek,mt6577-i2c
+      - items:
+          - const: mediatek,mt6797-i2c
+          - const: mediatek,mt6577-i2c
+      - items:
+          - const: mediatek,mt7623-i2c
+          - const: mediatek,mt6577-i2c
+      - items:
+          - const: mediatek,mt7629-i2c
+          - const: mediatek,mt2712-i2c
+      - items:
+          - const: mediatek,mt8516-i2c
+          - const: mediatek,mt2712-i2c
+
+  clocks:
+    minItems: 2
+    maxItems: 4
+    items:
+      - description: Controller clock
+      - description: DMA clock
+      - description: ARB clock for multi-master when a bus has more than
+          one i2c controllers
+      - description: PMIC clock. Only when mediatek,have-pmic is set.
+
+  clock-names:
+    minItems: 2
+    maxItems: 4
+    items:
+      - const: main
+      - const: dma
+      - const: arb
+      - const: pmic
+
+  mediatek,have-pmic:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Platform can control I2C from the PMIC
+
+  mediatek,use-push-pull:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: IO config use push-pull mode.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - clock-div
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c0: i2c@1100d000 {
+            compatible = "mediatek,mt6577-i2c";
+            reg = <0x1100d000 0x70>,
+                  <0x11000300 0x80>;
+            interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
+            clock-frequency = <400000>;
+            mediatek,have-pmic;
+            clock-div = <16>;
+            clocks = <&i2c0_ck>, <&ap_dma_ck>;
+            clock-names = "main", "dma";
+    };
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
