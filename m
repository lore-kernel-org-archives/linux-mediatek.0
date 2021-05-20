Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1B2C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 11:21:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD8661073
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 11:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECD8661073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8gwA0+jlsKYoxYJjlt965OThShcEwzLPDbqVDS47nw8=; b=CKtQsqpfNxo6iLPsZ97rEErIpP
	TCsB5HiDcuFRl1xL24Ru0gvfEkhMu/PAih+7t2l7MAd9IZ2AvbS9FST+n9xwTpwFS7q8ufMpwjD8j
	0XymX8Il8goqJxpKiF7uG53qrOJQX8YHb5dXGpBOdrq6F7BTFg3epW9xBCZlCCS+HLvcno12oiD5R
	gn6N1Dc38YvgrtFvtFrtN/DIXPeXOp8UOMoKndCcAkJuABezEvlL32UDmwmmPXrXurPmllsuXa+X+
	GqsoBgmPojnkWkUCVvhYPoaqefQsYSvEr/6m6KDPu2YW74a90e6Qc07lskATpa4KK99g8EP6RnvKl
	QlZZflMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljgkG-000QGz-Qn; Thu, 20 May 2021 11:21:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljgjq-000QB5-2G
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 11:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=hkbd3ZNvjGsOfD3AtfBISF0Ql1q34vUavLh2tmeeXiY=; b=qAQSwgqS1FEi//8S2VVFwgj8JL
 fy/R8RedtLfg3wgdGBG6WmTkKXM0E5vIAJE6xM7PBNfR6h/nK6GErmDYF2n3vql9273wTn4syj7ln
 m86J4oDANJ84xY2R8VAROOHuRJQOfVmSzlIBs1y5yBuaFMfkBJn84/dbkI3c2gD9O5Xho2wJ4oxcZ
 np+FdEBFTJNAnxzvB/6tEFZwrKJa0kM2HVt+zAeSus14NhG6xgWKwXeZLXxbxyTeBQ3NAmjS+GQ+Q
 o96Zp+4CO9keNqUeQeTySXMtSP+mLAIObZkz2YaLZktipm+tRhdvIYEMTKjXnVAoYDJC7febAT45f
 CgiqXflA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljgjn-00GEj9-0J
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 11:21:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso4865576wmc.1
 for <linux-mediatek@lists.infradead.org>; Thu, 20 May 2021 04:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hkbd3ZNvjGsOfD3AtfBISF0Ql1q34vUavLh2tmeeXiY=;
 b=AbuR8D31D0aEydN9/qBTqKVe762diEtY52hlBCNUqPOBMR1/4MruCFDWdmypmSvYlx
 mjXBc56vIghamZhnPYqYkTblnJmeGyYXEk5+zM013Cniioh2svZjE2a2Yg+gdNhJ2Gkw
 AFueyd3oABPgMAPqKW/B2RRrPWpi2h8J3fG56vYLjllgEPoi+2Su3aO5I8pAjTvHHXUn
 h/b9OQXH4XgRx3C0+rHXKlB4hIKGzl9i8K5VYNVoovqKM9eLUAabQaSuzmmXg5g8JIRT
 orAeQgRTIg6ATo/vZX4mwx9kHLmUs6yx2R1qkzKvs3uy3NR3B6oFy5p0dhR1BVxTHxNc
 1HhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hkbd3ZNvjGsOfD3AtfBISF0Ql1q34vUavLh2tmeeXiY=;
 b=J023IwMfalj0qyP0RCP573pITGOFiqj+6ZOi6QrdQ9c1KZOOshQOuueOMDcyPZp0TI
 GjQcE+WQTmVg+mXauZC2/PnNmFAN/zwGcHki/bxF/mSHJ1jkZ9c2KLI91tI+v7HoELpK
 yb4kr97CFEKbjjJ6AQXRH+MiQuKOmq7RLX3FP38q1ow38imi1JaKWnRyXTApsPHYBA/Y
 6HtWeK4G0qU0gx3LzS5ZeRi5XnYFF7wOrzOKvydU/rC5VJ49O3Ejcpsum6EqhiDjGw7e
 EYVB3djC1MtL02pv4ZFkMy61750JFnHiCrvQe6aVDxZBkMJMJz1CumC/5vWdBX/m9cGm
 6J7g==
X-Gm-Message-State: AOAM531nB2BkTxoCmAhk1fsgQjZspBQDreqcTYdg21Twugdt15U6sjaF
 K5NtFaq0/AIfvBfFX2a48XnqjA==
X-Google-Smtp-Source: ABdhPJy+OPM9ZufNRM9UA5H8yhwkRCjRB2XrMMPH+JnjStcV7z59I2irWFSKsO0DLI6rCBvVPUaCSw==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr3511825wmj.157.1621509669146; 
 Thu, 20 May 2021 04:21:09 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id o11sm2756646wrq.93.2021.05.20.04.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:21:08 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: i2c: i2c-mt65xx: convert doc to yaml
 schema format
Date: Thu, 20 May 2021 13:21:02 +0200
Message-Id: <20210520112106.77190-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_042111_055707_62E6E44F 
X-CRM114-Status: GOOD (  19.36  )
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

v2:
	* write compatibles in a more compact way
	* set the node pattern to be "^i2c@[0-9a-f]+$" instead of
		"^i2c[0-9]*@[0-9a-f]+"$

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    | 49 ----------
 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 93 +++++++++++++++++++
 2 files changed, 93 insertions(+), 49 deletions(-)
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
index 000000000000..41cedb4930de
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -0,0 +1,93 @@
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
