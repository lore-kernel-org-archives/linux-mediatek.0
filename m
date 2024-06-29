Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA65C27C4F
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jun 2024 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qu8aExIQb4k01ijmFyVLo33cLScLgyNnx9UQ9mtnOw=; b=Gdo/6JcOLpvcES4XStH9cElLQP
	rXlASUugnotoRRRFZFXLFLaAPykp7IE8eH3yFn/XhoCHLWDjpXjLbegHS/ofT2C6kDBVMs9RjPTX7
	cSzN/5z35GoJ5k2IvKOyg4mee9495s4iH5Ug+fjBp/bvRVrLm87YURUfguCntOjELS4SdDREHVuNU
	pIRieUUa78tqJvAu1Bfc1Vss9y1u00ZH1s43Dtd6vo6zzLZTaZ8yjd+xhewkV75i/eolF0ueABJxA
	tF6B/4W550brEmO2Aon2lY5ym6wkJZHRmtoR8Ccs6/QjYoFAs/eYXefkgahfgZJcUatrA921j+3aA
	Cz0L/etA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNYVf-0000000GTux-2GmH;
	Sat, 29 Jun 2024 13:52:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNYVP-0000000GTlW-0zir;
	Sat, 29 Jun 2024 13:52:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C11D060B76;
	Sat, 29 Jun 2024 13:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D42C2BBFC;
	Sat, 29 Jun 2024 13:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719669162;
	bh=NH5YlDzpIizrxdfHfOmD4jXJlwYT9YVWnCsdWswrG5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gb7f+fK5tttDbM2PemYKGQP/53uVT9dsijwpGkzLDWlHHcCGHemnglpTh7IYGEDGi
	 DoZ45HcANLaPahQlADcGklqa1Jy8mu4nHu0c3+rN95oj11cn4ZJgBB9DLsfxPLBjBn
	 bWERAmbWieTpR3Qj6LQzX9xghX1LBF2nz0kdY1ocPyr+BVtZgL7FCooulrD/P7lUcV
	 9oDezm51pIKbKa/i1mx6RPKSYzt8OQm4v1y5TUIttfLy1PhfBjFifTShep+RMIoTDq
	 LYXFWzelJW5v7YR9wxpo9y8aOTB9KVuvQdZJaZisCuMqXkCfTyVWSsAkyh+hWLd1my
	 /jMOOToTrpWiQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	nbd@nbd.name,
	dd@embedd.com,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v3 1/4] dt-bindings: PCI: mediatek-gen3: add support for Airoha EN7581
Date: Sat, 29 Jun 2024 15:51:51 +0200
Message-ID: <7622715d622413d1b4d8752657f87ea81001deb9.1719668763.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719668763.git.lorenzo@kernel.org>
References: <cover.1719668763.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_065243_379662_B59621BB 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

Introduce Airoha EN7581 entry in mediatek-gen3 PCIe controller binding

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 68 +++++++++++++++++--
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 76d742051f73..898c1be2d6a4 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -53,6 +53,7 @@ properties:
               - mediatek,mt8195-pcie
           - const: mediatek,mt8192-pcie
       - const: mediatek,mt8192-pcie
+      - const: airoha,en7581-pcie
 
   reg:
     maxItems: 1
@@ -76,20 +77,20 @@ properties:
 
   resets:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   reset-names:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
     items:
-      enum: [ phy, mac ]
+      enum: [ phy, mac, phy-lane0, phy-lane1, phy-lane2 ]
 
   clocks:
-    minItems: 4
+    minItems: 1
     maxItems: 6
 
   clock-names:
-    minItems: 4
+    minItems: 1
     maxItems: 6
 
   assigned-clocks:
@@ -147,6 +148,9 @@ allOf:
           const: mediatek,mt8192-pcie
     then:
       properties:
+        clocks:
+          minItems: 4
+
         clock-names:
           items:
             - const: pl_250m
@@ -155,6 +159,15 @@ allOf:
             - const: tl_32k
             - const: peri_26m
             - const: top_133m
+
+        resets:
+          minItems: 1
+          maxItems: 2
+
+        reset-names:
+          minItems: 1
+          maxItems: 2
+
   - if:
       properties:
         compatible:
@@ -164,6 +177,9 @@ allOf:
               - mediatek,mt8195-pcie
     then:
       properties:
+        clocks:
+          minItems: 4
+
         clock-names:
           items:
             - const: pl_250m
@@ -172,6 +188,15 @@ allOf:
             - const: tl_32k
             - const: peri_26m
             - const: peri_mem
+
+        resets:
+          minItems: 1
+          maxItems: 2
+
+        reset-names:
+          minItems: 1
+          maxItems: 2
+
   - if:
       properties:
         compatible:
@@ -180,6 +205,9 @@ allOf:
               - mediatek,mt7986-pcie
     then:
       properties:
+        clocks:
+          minItems: 4
+
         clock-names:
           items:
             - const: pl_250m
@@ -187,6 +215,36 @@ allOf:
             - const: peri_26m
             - const: top_133m
 
+        resets:
+          minItems: 1
+          maxItems: 2
+
+        reset-names:
+          minItems: 1
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          const: airoha,en7581-pcie
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          items:
+            - const: sys-ck
+
+        resets:
+          minItems: 3
+
+        reset-names:
+          items:
+            - const: phy-lane0
+            - const: phy-lane1
+            - const: phy-lane2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.45.2


