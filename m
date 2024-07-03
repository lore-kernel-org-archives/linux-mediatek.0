Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBFBC2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 16:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRSZuTD/rVvxnT1HuN8JTGq0oscHj9dEPELFtTLVmkA=; b=aNZYw68U1ojvtSNfyhX4xARxuP
	+70SbX5urcE5WrYD65JACa+R4fZIA3uaQAnUa3wguCQSJcNMVtBwklpPzQSzBH1sBwBOjIJTl2pF9
	FpW8GWvxjBSCZm2jmLAydZ4iHkWIiV3y7WqZqyc+UXWQDYmegDuq1qcnRQHekGjcPeA4wL3CYKpx0
	XIfNVqEJWNcANf1RXXFqB4TO3PJD3VCFoV7yNnW4dfAEKJx3PFiohDgY+As0lxYGinV19rb8s8mKg
	2xl+Nlpra5IISfYUf1a0/jWMHtjJ3VDzB29BFr4vkt0Dl5dR+70Us/L1iPbl3ALaR2CdVGuVgLU/z
	3xYbAs0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2bu-0000000AocF-0S5E;
	Wed, 03 Jul 2024 16:13:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2ba-0000000AoTn-3UGT;
	Wed, 03 Jul 2024 16:13:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 160A86235B;
	Wed,  3 Jul 2024 16:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42420C2BD10;
	Wed,  3 Jul 2024 16:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720023193;
	bh=iqoQv7Ea5scHNcYdRFyf2CSEBTLYhaq8j8HUyjyvcz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eYV/dY/cHyP+cmCUv/VsrHAyPVwF3d1gKs/GRcMmxj5rKT0ymZmXJAgEtgt7K7xg+
	 19XziyLAintY+YJ1A3ndS3hFV7kznsUy+QPnwU3eIYUJgcn8ECkdqj1oC77RmmUATt
	 QV6OvL76i0Z3RzzsJyRx05zWjpt6fVPajtQWLXRhEegGnyIYmSikfO5cTgjZ9v6rSO
	 aN0aWpznyW5hNuvWz1khpJfXWFSxV1r237b3ycwj0wLs/pZug+ppPUqBH119LbLCBl
	 2qnH2L7baM111KPr33WCYAl3q5Kt1YB+cConJbZ+6Rs0eUoBZDYayI42OPC+gKV3W3
	 rIyBOn8sUYDxQ==
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
Subject: [PATCH v4 1/4] dt-bindings: PCI: mediatek-gen3: add support for Airoha EN7581
Date: Wed,  3 Jul 2024 18:12:41 +0200
Message-ID: <138d65a140c3dcf2a6aefecc33ba6ba3ca300a23.1720022580.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720022580.git.lorenzo@kernel.org>
References: <cover.1720022580.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_091314_973041_1F91EAF7 
X-CRM114-Status: UNSURE (   8.34  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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


