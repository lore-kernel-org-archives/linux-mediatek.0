Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DA0C41513
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcgRT6J7wC414Y9vh8O8T/2Y7BfPzj9BpWBdf/k3LDQ=; b=cGJlmrPuajXDlNHhmVj1qxowGp
	F4no4rxC3CffaJW8LDB9ThD7Rg+N9UgbncZq/rNdoER5g1kL9fzuxaexlWVywNALdb9iWoi7jjc/a
	jXoCs9ahTSQ0mIwCsUJ53W8F0lPVeIZ8q03G8E2MMCuy4EKcNT421VWNwqp/SZgHoG1jOjKkEFvjN
	s5ih/2PDqL4aYOhXQUeV7AvLdqo2xyAiRpzFc/rakWgxc65th9BKaMfBIQC+UmFX2L8xOthOY8hpu
	mY4m5PMDdrhlTdb5Sy5Eqn3Asi2BSKym2lr0BtK7sBmu7vwT86K065wdJuzX/HWl6pedSN/XJrf7g
	47HfDXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfZx-00000009aSz-3vIV;
	Fri, 21 Jun 2024 14:49:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfZn-00000009aNZ-3Dx6;
	Fri, 21 Jun 2024 14:49:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 48939CE2DCA;
	Fri, 21 Jun 2024 14:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF17C2BBFC;
	Fri, 21 Jun 2024 14:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718981356;
	bh=u2HF2BfpyUNmuOCq2K29l3mxTzrcir390lZ7LUajRi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qd9uhgLdRfFD1KPKC+duj+/haw+NcpLoZteMIPEgJKfbZMPIO8yV0/LnKPMzlptrw
	 R4rHee8GSY/j7VAd0k+LRl7OiKFyHQxqWVW7ytug1jXadzyFYkVpKvT3xxz9KqNGJV
	 6uy16QZIO7kuqqU+43GKA/DKvb7vqf3vcy0txtKoqPdPciakFA52oiyr1JsKQL/GwO
	 YWhzMOsOjUE/ozZYcbpz96x0yOxTg5RQPCOZwoaUxqmRO695/LowRY5jJx2ap3XMSk
	 kE63Mg70vEGp4H8hYOtp1cKm09u6l4vtUhz4e0+Zwr2yfMNCLLHliiDwLLyHQdcEWj
	 Z7U60X42FwZtA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com,
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
Subject: [PATCH 1/4] dt-bindings: PCI: mediatek-gen3: add support for Airoha EN7581
Date: Fri, 21 Jun 2024 16:48:47 +0200
Message-ID: <a215d6d8a91fccdbd1a28dd3262a3e5db1b728fd.1718980864.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718980864.git.lorenzo@kernel.org>
References: <cover.1718980864.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_074920_089942_8315FF71 
X-CRM114-Status: UNSURE (   8.27  )
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
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 76d742051f73..0f35cf49de63 100644
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
@@ -186,6 +187,20 @@ allOf:
             - const: tl_26m
             - const: peri_26m
             - const: top_133m
+  - if:
+      properties:
+        compatible:
+          const: airoha,en7581-pcie
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: sys_ck
+        reset-names:
+          items:
+            - const: phy-lane0
+            - const: phy-lane1
+            - const: phy-lane2
 
 unevaluatedProperties: false
 
-- 
2.45.2


