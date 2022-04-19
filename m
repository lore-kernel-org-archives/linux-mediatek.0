Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18631C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 18:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrK8M259oqlPsFnZTOpuGuVSLQODStO79xfpDSkbFn8=; b=JQwFfZmp31bkyw
	Zaal3a2KG6aHQdXz0V7jJ19N1fFlGB6HJXGK3IBLQwyOJLa2XbrTh4rmUOqM/8Gu0/hX+XAdd8blN
	CdGXl+Pc7k13k/UjomTEdiiLXPfbV+QgxrPJilhb+Goh5IhoXOfld31FEgQtX9Czgaqtp1PYfiPmO
	o0d47PDUlyS3XAIK5BHDoBlpnnmrQQvmj3NQzbOcAxm1L1FkVkfj49nXU7tU8LmdejDUzXtdUVMdH
	9cKlvcgPdzQLKXn22RnNiXjQpOXfIgnVEnR/aihpja4XDwRZIl+OlFaNMXGIBHK290IuMjF973GtO
	lmiPEjvU3obgQSWczjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsMu-005Yh8-FQ; Tue, 19 Apr 2022 18:14:28 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsLE-005XbG-TM; Tue, 19 Apr 2022 18:12:47 +0000
Received: by mail-ej1-x631.google.com with SMTP id ks6so34636351ejb.1;
 Tue, 19 Apr 2022 11:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T8WZXYOCLzRkmpLF9jgUFJORJhr+qxoHhiRi9zpd0ak=;
 b=KKC135UwYK8aFfg6KnPB2uae0AGzdqsE2qCEZfPPQkakgr3W9ZpC0gS7cAyPJCSZgu
 iAfkP/W64GRzTOJAbKKbTWbUcfQg4azyTFIdj4PCl9eqHuIeCIdcXiT1u4Wu/CRNwqHC
 8rglGa0q4v0eHNhHItJ5efTBi2aCewf9I4HhHG1S12AMZg06omh4WmT7kuQKBy0CUgZn
 8lp3foWbTEMGMBert1cn+XCAaMlUAn4titeD1M6GCN6cdnq5ImqOJBuSCg6U/H1xxlTi
 n3G2TCkSTLgrz+JMDOJBbW7tz1GL8rLePx22kNZiiQdN4Ahov2irzEFvoSRbULcuDydX
 0s/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T8WZXYOCLzRkmpLF9jgUFJORJhr+qxoHhiRi9zpd0ak=;
 b=uktdVC4DxTacfHglbvdui9Ou2gkr5REYDHca51dl2axpFYN88SaSjkQSqAckirbW8f
 lNT42hlqnKkk5iPsl457i8FQFY5Qa868WEFgKzgOa1kRb/f7N1N8BELu99KvXtwKYJOs
 ODPaqBvDHZXgDw6C17C/vMQkn1uUX2KckW4Tqt70W4XZmH9LEA+BrAswAzBZZkALmCqO
 xPeuJLHOqYIOa/hApfSrxBsZU8U/69Btm1R7E0WmS1XqjAzvOmBaIMzj5mrxwFLpWunv
 WvP23vltS137GA/sFYXysVqQ/XsQ/FcmnFJeazRAfEfRdlK1rF015gJAM6XJko4nO+Ae
 GUyA==
X-Gm-Message-State: AOAM530kUNA4dyySgSsADCXXEyK/z4bEhCMGlURjNUDMVT9uVkXu+ViQ
 sqNXmi3q7ch4hXCNfZAKBDQ=
X-Google-Smtp-Source: ABdhPJySoL89++QqvT+oP9zBi5KoJWlUpMj4I7Bj+2B8C2b9jxLYAeVHWiypffHVq3yANRc52Hhwgw==
X-Received: by 2002:a17:906:c1d6:b0:6d6:e0a3:bbc7 with SMTP id
 bw22-20020a170906c1d600b006d6e0a3bbc7mr14665249ejb.484.1650391961210; 
 Tue, 19 Apr 2022 11:12:41 -0700 (PDT)
Received: from localhost.localdomain ([212.102.35.230])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a1709063f9400b006e12836e07fsm5930614ejj.154.2022.04.19.11.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 11:12:40 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryder Lee <ryder.lee@kernel.org>,
 Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: arm: mediatek: infracfg: Convert to DT schema
Date: Tue, 19 Apr 2022 22:09:39 +0400
Message-Id: <20220419180938.19397-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220419180938.19397-1-y.oudjana@protonmail.com>
References: <20220419180938.19397-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_111245_042994_9CE0956B 
X-CRM114-Status: GOOD (  16.72  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Convert infracfg bindings to DT schema format. Not all drivers
currently implement resets, so #reset-cells is made a required
property only for those that do. Using power-controller in the
example node name makes #power-domain-cells required causing
a dt_binding_check error. To solve this, the node is renamed to
syscon@10001000.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../arm/mediatek/mediatek,infracfg.txt        | 42 ----------
 .../arm/mediatek/mediatek,infracfg.yaml       | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
deleted file mode 100644
index f66bd720571d..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Mediatek infracfg controller
-============================
-
-The Mediatek infracfg controller provides various clocks and reset
-outputs to the system.
-
-Required Properties:
-
-- compatible: Should be one of:
-	- "mediatek,mt2701-infracfg", "syscon"
-	- "mediatek,mt2712-infracfg", "syscon"
-	- "mediatek,mt6765-infracfg", "syscon"
-	- "mediatek,mt6779-infracfg_ao", "syscon"
-	- "mediatek,mt6797-infracfg", "syscon"
-	- "mediatek,mt7622-infracfg", "syscon"
-	- "mediatek,mt7623-infracfg", "mediatek,mt2701-infracfg", "syscon"
-	- "mediatek,mt7629-infracfg", "syscon"
-	- "mediatek,mt7986-infracfg", "syscon"
-	- "mediatek,mt8135-infracfg", "syscon"
-	- "mediatek,mt8167-infracfg", "syscon"
-	- "mediatek,mt8173-infracfg", "syscon"
-	- "mediatek,mt8183-infracfg", "syscon"
-	- "mediatek,mt8516-infracfg", "syscon"
-- #clock-cells: Must be 1
-- #reset-cells: Must be 1
-
-The infracfg controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-Also it uses the common reset controller binding from
-Documentation/devicetree/bindings/reset/reset.txt.
-The available reset outputs are defined in
-dt-bindings/reset/mt*-resets.h
-
-Example:
-
-infracfg: power-controller@10001000 {
-	compatible = "mediatek,mt8173-infracfg", "syscon";
-	reg = <0 0x10001000 0 0x1000>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
new file mode 100644
index 000000000000..4f43fe9f103e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,infracfg.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Infrastructure System Configuration Controller
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description:
+  The Mediatek infracfg controller provides various clocks and reset outputs
+  to the system.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt2701-infracfg
+              - mediatek,mt2712-infracfg
+              - mediatek,mt6765-infracfg
+              - mediatek,mt6779-infracfg_ao
+              - mediatek,mt6797-infracfg
+              - mediatek,mt7622-infracfg
+              - mediatek,mt7629-infracfg
+              - mediatek,mt7986-infracfg
+              - mediatek,mt8135-infracfg
+              - mediatek,mt8167-infracfg
+              - mediatek,mt8173-infracfg
+              - mediatek,mt8183-infracfg
+              - mediatek,mt8516-infracfg
+          - const: syscon
+      - items:
+          - const: mediatek,mt7623-infracfg
+          - const: mediatek,mt2701-infracfg
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - mediatek,mt2701-infracfg
+          - mediatek,mt2712-infracfg
+          - mediatek,mt7622-infracfg
+          - mediatek,mt7986-infracfg
+          - mediatek,mt8135-infracfg
+          - mediatek,mt8173-infracfg
+          - mediatek,mt8183-infracfg
+then:
+  required:
+    - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    infracfg: syscon@10001000 {
+        compatible = "mediatek,mt8173-infracfg", "syscon";
+        reg = <0x10001000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
