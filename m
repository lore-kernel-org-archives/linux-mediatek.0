Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE32CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XHwjGk66HhZ0+SDY3+ncAm0xUFbosSi2POOttFGIO6I=; b=tuIXUDR1Kedda6
	ifSNEviQarRqolO3yrgyne9/9iXELASa1wWn+daw7Nl/O6v9oik828mKW0rsoW4QXOUGDuXVfoh51
	YdH+SqNGmUYKiqgvMogZf/vlGW/olD3pFPXBt8eySJFVLENG8tOMdUjpdTMN559HMvmbvAIKmb+Cw
	Gb+XbiCMfKO2XQcX9qCr3Aa77k8F0TjceAj+k9I9Yfi1XxaRGBj+QVr4OEshoFcAvGNRstwvf+gUn
	ijMpsb7iYHwxZjtAzjKSK4faALDypK3rDWo2bApyMhNnNJMEl41nmc28ils/nRhZKATq9X9fkGUdO
	Y+FuZysghUgcErDpkEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc7bb-006phA-Lt; Wed, 06 Apr 2022 15:29:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc7bP-006pdc-JI; Wed, 06 Apr 2022 15:29:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 85B8A1F4136D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649258984;
 bh=1NhAchyfhmSmpQJUfImxIt/WQmIDi6gHQsa7Fft+Rks=;
 h=From:To:Cc:Subject:Date:From;
 b=OQDpeJ1CvB/HRIMKBLggLHHm4RAqWhHYwby3rUsfvR/bfVO5vAKJnmfn+oetuspeA
 440NJiHS1nRDY07b8iuW/cgnQ86eDw/Ep1UI7RrYdICUUUbnsUbD5O9bf2+fmI+q5u
 1MeOw3e4oce3zdG5Q8JpghmoV2KJ52Mmn7EzvBeNK6kGFB2lfDVqG8wyP+ny1F+qXv
 fTi264g+xqUm+bT+LBUSkuGpshloy4JN3SfdmWV2yJKNYPDiTZDMDpctL5WU1/OVc4
 nJEerUftYKTv3EKDQBivUgtjHy3JS1J6Q9r0/WcAWVX9KK2EJteMRcYhLSHSttOQV3
 Qp6xHefrUW6aw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzk+dt@kernel.org, matthias.bgg@gmail.com, qii.wang@mediatek.com,
 wsa@kernel.org, kewei.xu@mediatek.com,
 angelogioacchino.delregno@collabora.com, hsinyi@chromium.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: convert i2c-mt65xx to json-schema
Date: Wed,  6 Apr 2022 17:29:40 +0200
Message-Id: <20220406152940.140224-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_082947_935924_F3D76F0A 
X-CRM114-Status: GOOD (  19.38  )
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

Convert I2C binding for MediaTek SoCs to Devicetree schema.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  53 --------
 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 118 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 119 insertions(+), 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
deleted file mode 100644
index 026985b8f61a..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ /dev/null
@@ -1,53 +0,0 @@
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
-      "mediatek,mt8168-i2c": for MediaTek MT8168
-      "mediatek,mt8173-i2c": for MediaTek MT8173
-      "mediatek,mt8183-i2c": for MediaTek MT8183
-      "mediatek,mt8186-i2c": for MediaTek MT8186
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
index 000000000000..889064f24a8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek I2C controller
+
+description:
+  This driver interfaces with the native I2C controller present in
+  various MediaTek SoCs.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+maintainers:
+  - Qii Wang <qii.wang@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt2712-i2c
+      - const: mediatek,mt6577-i2c
+      - const: mediatek,mt6589-i2c
+      - const: mediatek,mt7622-i2c
+      - const: mediatek,mt8168-i2c
+      - const: mediatek,mt8173-i2c
+      - const: mediatek,mt8183-i2c
+      - const: mediatek,mt8186-i2c
+      - const: mediatek,mt8192-i2c
+      - items:
+          - enum:
+              - mediatek,mt7629-i2c
+              - mediatek,mt8516-i2c
+          - const: mediatek,mt2712-i2c
+      - items:
+          - enum:
+              - mediatek,mt2701-i2c
+              - mediatek,mt6797-i2c
+              - mediatek,mt7623-i2c
+          - const: mediatek,mt6577-i2c
+      - items:
+          - enum:
+              - mediatek,mt8195-i2c
+          - const: mediatek,mt8192-i2c
+
+  reg:
+    items:
+      - description: Physical base address
+      - description: DMA base address
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Main clock for I2C bus
+      - description: Clock for I2C via DMA
+      - description: Bus arbitrator clock
+      - description: Clock for I2C from PMIC
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: main
+      - const: dma
+      - const: arb
+      - const: pmic
+
+  clock-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Frequency divider of clock source in I2C module
+
+  clock-frequency:
+    default: 100000
+    description:
+      SCL frequency to use (in Hz). If omitted, 100kHz is used.
+
+  mediatek,have-pmic:
+    description: Platform controls I2C from PMIC side
+    type: boolean
+
+  mediatek,use-push-pull:
+    description: Use push-pull mode I/O config
+    type: boolean
+
+  vbus-supply:
+    description: Phandle to the regulator providing power to SCL/SDA
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-div
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c0: i2c@1100d000 {
+      compatible = "mediatek,mt6577-i2c";
+      reg = <0x1100d000 0x70>, <0x11000300 0x80>;
+      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
+      clocks = <&i2c0_ck>, <&ap_dma_ck>;
+      clock-names = "main", "dma";
+      clock-div = <16>;
+      clock-frequency = <400000>;
+      mediatek,have-pmic;
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ee0b5a70aff1..28a17d4c8d12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12361,7 +12361,7 @@ MEDIATEK I2C CONTROLLER DRIVER
 M:	Qii Wang <qii.wang@mediatek.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+F:	Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
 F:	drivers/i2c/busses/i2c-mt65xx.c
 
 MEDIATEK IOMMU DRIVER
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
