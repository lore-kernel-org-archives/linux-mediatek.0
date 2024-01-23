Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE295C47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 06:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t4qORfUlpEqFlYNvW/x/uQF2RSEyUxdmLIwXBI7kmUk=; b=VGUH1PD2QdWG43fuOtBOn0NGV8
	DtSLi/hd2H3DsfgqyGm7D5KHilqfpXt0jvYAlMCSfeK04uQBGmDx38e3dGSGi+N9jxbC6LrjZF8Wd
	L4EEgnW+7cyuoi7A6yHHNUL21vxZ4uuJ/bA/Fqd/jcO/F/VBRmYu1sYpMme/8pg2LkJODGkstulEJ
	zVvpifLrsykImepn0x6CQp0lrgjgy3vjiiCW9qFOJ96ZZ6OyLBTfSkWu28mJR7yzkWTzGP+jYKtoE
	dKv2EG6dcoGu2oqcJxednGuTbgPERle3tDLc8DENxtKS2bo7yPexgut40FFVGr/VsKMu8OXaIstWS
	X9zeoNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS9xS-00FDQs-04;
	Tue, 23 Jan 2024 06:08:26 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS9xO-00FDNs-2w;
	Tue, 23 Jan 2024 06:08:24 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50eabd1c701so4302622e87.3;
        Mon, 22 Jan 2024 22:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705990092; x=1706594892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4qORfUlpEqFlYNvW/x/uQF2RSEyUxdmLIwXBI7kmUk=;
        b=UXv9imUsXWNsdGT0mQOp3To5orXaovZ7Ux7kaYsH/xUcJjV6DGbFEgxmRG2630Ckfn
         vo68He4FN+v2Hbu4gB0iswjs7zMFb+c1ECLgPQpYb4ZpoLtdyuaJNHw357CFNhrqHIwQ
         UbzxeUlkXEj4IckKRM/aR9aSHHv9n9F7XsI+JeQCcLFBFqe4DIc+mKp5Mk9hToECc4RN
         5ZYdzNLMCmfqfz2xjQ+7pfMdYS0a5xqaOP26ZX5KxQeySjO2uBtaRTjLwdnzRjadl6ld
         VkiAXPIxWUWjKle/naMhlFX2sU+oMJw2ipKRqoA3XJMKGPvMFylHQLtP9gOzDhCQQNBC
         9hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705990092; x=1706594892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4qORfUlpEqFlYNvW/x/uQF2RSEyUxdmLIwXBI7kmUk=;
        b=sva2NY1bKoUGj1dcLEbtnsUD4BdgnF67Xf34nR6X8h924mR5XI05AY206KE9SNfUaC
         22iZbQurLa43ts56wMBSYxK1Nbo4D0dGPPyIzoWfFsgiDDD0lIU1LDaxXFVQp+wShrhM
         ffB4hEF1RWiHp7aCGmZWhtxLqrdl1+WnTKdbhw/Zr/tOuuL9y59vjjH0zMkE3pmLAPuV
         6U224dmQoX64Vx1tlnGKzxGIUVRbU8nEcgWKw55GwLZf0pMwizeam1x70GnnlKqGcvb7
         DMdrEoyA4yDDzq3KboGeoSgBYoOA7rP65YsFpO6Jv6cdbBZIVtTxSiOZJNsd+rKu9Kgp
         Y6Og==
X-Gm-Message-State: AOJu0Yzdjx8HUbYtGB8Tz31t4Hl3yAMeYe8mELHyRLsYGooGmsszQ7Hr
	5M7f7rEXQhNfxFOVtuseerQaMO5hoRWXa2ZlWvgtK0q5ofu0mWFZ
X-Google-Smtp-Source: AGHT+IG6xtqGKymYk8+JRle5ViKMEL/w01zGchfO3OMVWOXeHFp4ZehD2KI0mPvKHeRC4vXp91HPXA==
X-Received: by 2002:a05:6512:3c94:b0:50e:8d0c:5eeb with SMTP id h20-20020a0565123c9400b0050e8d0c5eebmr2981468lfv.85.1705990091798;
        Mon, 22 Jan 2024 22:08:11 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906311700b00a269b4692a9sm11727880ejx.84.2024.01.22.22.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 22:08:11 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: interrupt-controller: convert MediaTek sysirq to the json-schema
Date: Tue, 23 Jan 2024 07:08:04 +0100
Message-Id: <20240123060804.32254-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_220822_946478_6DFC3FB0 
X-CRM114-Status: GOOD (  15.27  )
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

This helps validating DTS files.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../mediatek,mt6577-sysirq.yaml               | 85 +++++++++++++++++++
 .../interrupt-controller/mediatek,sysirq.txt  | 44 ----------
 2 files changed, 85 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
new file mode 100644
index 000000000000..e1a379c052e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek sysirq
+
+description:
+  MediaTek SOCs sysirq support controllable irq inverter for each GIC SPI
+  interrupt.
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt6577-sysirq
+      - items:
+          - enum:
+              - mediatek,mt2701-sysirq
+              - mediatek,mt2712-sysirq
+              - mediatek,mt6580-sysirq
+              - mediatek,mt6582-sysirq
+              - mediatek,mt6589-sysirq
+              - mediatek,mt6592-sysirq
+              - mediatek,mt6755-sysirq
+              - mediatek,mt6765-sysirq
+              - mediatek,mt6779-sysirq
+              - mediatek,mt6795-sysirq
+              - mediatek,mt6797-sysirq
+              - mediatek,mt7622-sysirq
+              - mediatek,mt7623-sysirq
+              - mediatek,mt7629-sysirq
+              - mediatek,mt8127-sysirq
+              - mediatek,mt8135-sysirq
+              - mediatek,mt8173-sysirq
+              - mediatek,mt8183-sysirq
+              - mediatek,mt8365-sysirq
+              - mediatek,mt8516-sysirq
+          - const: mediatek,mt6577-sysirq
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    $ref: "arm,gic.yaml#/properties/#interrupt-cells"
+
+required:
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6797-sysirq
+    then:
+      properties:
+        reg:
+          minItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    interrupt-controller@10200620 {
+        compatible = "mediatek,mt6797-sysirq", "mediatek,mt6577-sysirq";
+        reg = <0x10220620 0x20>,
+              <0x10220690 0x10>;
+        interrupt-parent = <&gic>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
deleted file mode 100644
index 3ffc60184e44..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-MediaTek sysirq
-
-MediaTek SOCs sysirq support controllable irq inverter for each GIC SPI
-interrupt.
-
-Required properties:
-- compatible: should be
-	"mediatek,mt8516-sysirq", "mediatek,mt6577-sysirq": for MT8516
-	"mediatek,mt8183-sysirq", "mediatek,mt6577-sysirq": for MT8183
-	"mediatek,mt8173-sysirq", "mediatek,mt6577-sysirq": for MT8173
-	"mediatek,mt8135-sysirq", "mediatek,mt6577-sysirq": for MT8135
-	"mediatek,mt8127-sysirq", "mediatek,mt6577-sysirq": for MT8127
-	"mediatek,mt7622-sysirq", "mediatek,mt6577-sysirq": for MT7622
-	"mediatek,mt7623-sysirq", "mediatek,mt6577-sysirq": for MT7623
-	"mediatek,mt7629-sysirq", "mediatek,mt6577-sysirq": for MT7629
-	"mediatek,mt6795-sysirq", "mediatek,mt6577-sysirq": for MT6795
-	"mediatek,mt6797-sysirq", "mediatek,mt6577-sysirq": for MT6797
-	"mediatek,mt6779-sysirq", "mediatek,mt6577-sysirq": for MT6779
-	"mediatek,mt6765-sysirq", "mediatek,mt6577-sysirq": for MT6765
-	"mediatek,mt6755-sysirq", "mediatek,mt6577-sysirq": for MT6755
-	"mediatek,mt6592-sysirq", "mediatek,mt6577-sysirq": for MT6592
-	"mediatek,mt6589-sysirq", "mediatek,mt6577-sysirq": for MT6589
-	"mediatek,mt6582-sysirq", "mediatek,mt6577-sysirq": for MT6582
-	"mediatek,mt6580-sysirq", "mediatek,mt6577-sysirq": for MT6580
-	"mediatek,mt6577-sysirq": for MT6577
-	"mediatek,mt2712-sysirq", "mediatek,mt6577-sysirq": for MT2712
-	"mediatek,mt2701-sysirq", "mediatek,mt6577-sysirq": for MT2701
-	"mediatek,mt8365-sysirq", "mediatek,mt6577-sysirq": for MT8365
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
-- reg: Physical base address of the intpol registers and length of memory
-  mapped region. Could be multiple bases here. Ex: mt6797 needs 2 reg, others
-  need 1.
-
-Example:
-	sysirq: intpol-controller@10200620 {
-		compatible = "mediatek,mt6797-sysirq",
-			     "mediatek,mt6577-sysirq";
-		interrupt-controller;
-		#interrupt-cells = <3>;
-		interrupt-parent = <&gic>;
-		reg = <0 0x10220620 0 0x20>,
-		      <0 0x10220690 0 0x10>;
-	};
-- 
2.35.3


