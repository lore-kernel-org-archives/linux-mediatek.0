Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EBAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:50:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D6066117A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D6066117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HuKg+G2C2G4K7RMjUbkO9wLVK81x/TOVgPlMXbcji4s=; b=elYajIDmBtLd6A
	uUkMwOaBfHBRTl4PcbBtkLaqtKshN71dDmm4Ci5Az8HX+wZqKQ96WH21uKuhtNISmXle7gTvjnJYT
	mpLGcTqZOsil2y1SQdl4InkWTMSkkEGHEgfNZgLhMFMUNXUC9KmxXLCgqnvAF4oxfFNLdvHvIYkV3
	m0Kos03haBmgFsb25jt9xGyKDxuaP36kGnaSvu+oc7Sp+4MCFwJXp201TJSHl/6ktUjkY+WZp1hph
	D7gGtsQglLgPwZljGVUgfxphS9yZY4RCOnZzoQOx89Wfh6eAfssLoyMQLOMZGpNUPPCaldehuZ367
	2jWrFDDETj2dGeZNyxTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktcC-006Cyw-2H; Wed, 10 Nov 2021 19:50:36 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktbs-006Crj-CI
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 19:50:18 +0000
Received: by mail-wr1-x433.google.com with SMTP id w29so5904450wra.12
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 11:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=geLSRi4FCt+c/I7zdRe9IBFISJEgU+7yaWXyBuqJoC0=;
 b=AMC6DtiKrW4/kJuXCMqBXLO7d30/NDkVUgjoA3xt+8BDTPIkBASbs44NsB50hOfgdY
 wSrETvChMAyi7bBSePP6Vpzdu4PLQ7mpt4r67adfpEisJnhsFzn6xih+P9qzcgRzDSGS
 YhIg+UY8waGnEBKytlQxiRmTRkpq6hSYsiwNKBzp8t8VdhmNF4lIr9AZqOI2nlaua9BQ
 M9GQnrbHOtbkAcKehmnVtZ0fbBERNj2tCnWdgo/wbN3R2C4qqeA743+brPK8LOYm+2BU
 GwJcJneUJhJkC912U1neV887JwYzj4eB4kuYLxI9nTsYslD4IQMY/qN1qUWqb+Ak6oPx
 ifdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=geLSRi4FCt+c/I7zdRe9IBFISJEgU+7yaWXyBuqJoC0=;
 b=20X2vRdBDm2BHPV/sJe87YtSIArJV3+jmKKmsc0b4toSowDZPFCu0BZredM+xrpYDr
 p2iaLJZBTgPo/PSTDcrZ5P3EuF97H/TLPkNLRD2oYEjT8MkOai7b/eQ6PBgojbh5Ex1I
 D2U6wvy7nHp+6sdwRZQSvlYjFUF4yEqOEN1nkrV7W1uNH/4ewgHfaRBtK1SufzanOAtv
 HQO5tD6wS4h9ncZ0xnhuPyE7AsYGgSGqVIjMeCf+UQBu+ac0E0WMe54tRwtEpuy0h5/0
 D7Bg5+wbai6ISX2eYLVotTzYbI5+0JSeeRx+J3Ab6/pdpkRb1zsvMnjl8IdKv/70ABr3
 Ecuw==
X-Gm-Message-State: AOAM533GX4QO14OwlQ/vzStNHDMOEqd5cbqIDowGXmqkqxiXoHjUSH96
 YsWOiQu3IN6keEBOWMIYp5l10A==
X-Google-Smtp-Source: ABdhPJxhONkOR/1gFrmkF2ek8fxt5sSiYcS+5fvMHATAmxkVKqAjKFDEM6j4DBnNKFKTEfoZrwf5tQ==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr1926086wrh.220.1636573815138; 
 Wed, 10 Nov 2021 11:50:15 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id k15sm750935wrx.53.2021.11.10.11.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:50:14 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: i2c: i2c-mt65xx: convert doc to yaml
 schema format
Date: Wed, 10 Nov 2021 20:49:56 +0100
Message-Id: <20211110194959.20611-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_115016_452836_5B372885 
X-CRM114-Status: GOOD (  19.58  )
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

v3:
	* rebased: added new compatible since last revision + added vbus-supply
		description
	* added clock-div description

v2:
	* write compatibles in a more compact way
	* set the node pattern to be "^i2c@[0-9a-f]+$" instead of
		"^i2c[0-9]*@[0-9a-f]+"$

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  51 ---------
 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 106 ++++++++++++++++++
 2 files changed, 106 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
deleted file mode 100644
index 5ea216ae7084..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ /dev/null
@@ -1,51 +0,0 @@
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
-      "mediatek,mt8195-i2c", "mediatek,mt8192-i2c": for MediaTek MT8195
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
-  - vbus-supply: phandle to the regulator that provides power to SCL/SDA.
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
index 000000000000..af0880fcc22b
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -0,0 +1,106 @@
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
+    pattern: "^i2c@[0-9a-f]+$"
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
+          - enum:
+              - mediatek,mt2701-i2c
+              - mediatek,mt6797-i2c
+              - mediatek,mt7623-i2c
+          - const: mediatek,mt6577-i2c
+      - items:
+          - enum:
+              - mediatek,mt7629-i2c
+              - mediatek,mt8516-i2c
+          - const: mediatek,mt2712-i2c
+      - items:
+          - enum:
+              - mediatek,mt8195-i2c
+          - const: mediatek,mt8192-i2c
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
+  vbus-supply:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the regulator that provides power to SCL/SDA.
+
+  clock-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Fixed frequency divider for I2C clock source.
+    minimum: 1
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
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
