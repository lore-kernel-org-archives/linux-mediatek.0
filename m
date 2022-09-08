Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C0BC54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 14:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fS9vijZ9QzG1Z8C7/0pv2576shzReIwJ0BLHaXEu/bI=; b=hQenu2M+KfcOOe/im5GgfzYryX
	AwbtPuHbyaOgD/YC3NQl858OdxQwm9wG0QKyiT1txoHEYEWpxPa/KdweEJIH0VCkfp5GLsBhxAGyk
	SG0thZgsWwf3MF2PuIjT9WjXj97rRQ2m2Tsw2L69svk6ng9wAMYsnhd4ZvD2iRDxxNpzKQg/8ICtN
	8vs2Q1zIBfPNg6pk8ku0FL4wd8Z+CeApoJkU3MEBV7Eo94AOafQ7zHHVcYSWrOA1ZxYPnO8dFGBS1
	r9R6spjUF69ZDhQl4oX022h6Jsp0ihGgsWJbzoQHRmlleuG5rMP+HclqMvDDAloA8pRcClY4i5NXM
	omAFd8Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIJr-004W4s-3H; Thu, 08 Sep 2022 14:15:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIJf-004Vr5-RA; Thu, 08 Sep 2022 14:15:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6F4B561C28;
	Thu,  8 Sep 2022 14:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28410C433C1;
	Thu,  8 Sep 2022 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662646538;
	bh=PD99PoYY/6qzvj7XP3fGAjLRFdQyyNhFVurMX4/wCMk=;
	h=From:To:Cc:Subject:Date:From;
	b=VnOJKY2BhVpISb9cCg4aQ8onLjhyI4chS0OqnTblN6TuwgoftGwhR8KICP76goz7Y
	 t5wEZAc7uT7TeUGUV1C4vPFWBvlpp89l90wPtVdTtFKqSWM5nvhqP+M5QJM/261beQ
	 /TsD2NMAtbi6du/vObDXSlmWmgNHl63Hf7PzlZX2CZwWpnFOTixOVExRzUu7rdJfff
	 S9G+fjAap8domifhRYrHTWG4pgpjrTofrnMqzR0d3D+MJcKT3YPXGDz94wevMTCV/j
	 rMcxKO0f/Y+TbBuw48Ul1I2fXCaydhfKg1E1GoKD2mwFoLdud0/8z72skRLlVYA7w5
	 4b11qs0RvpSew==
From: matthias.bgg@kernel.org
To: Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v2] dt-bindings: iommu: mediatek: mt8195: Fix max interrupts
Date: Thu,  8 Sep 2022 16:15:29 +0200
Message-Id: <20220908141529.1478-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_071539_939542_55272035 
X-CRM114-Status: GOOD (  10.97  )
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

From: Matthias Brugger <mbrugger@suse.com>

The mt8195-iommu-infra has five banks and one interrupt for each.
Reflect that in the binding.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>

---

Changes in v2:
- keep wide constrains for minItems and maxItems
- delete unrealted required: - interrupts
- use minItems for mediatek,mt8195-iommu-infra case

 .../bindings/iommu/mediatek,iommu.yaml         | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index fee0241b50988..4461dc027d1c4 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -91,7 +91,9 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 5
+    description: each bank has one dedicated interrupt
 
   clocks:
     items:
@@ -183,6 +185,17 @@ allOf:
       required:
         - mediatek,infracfg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-iommu-infra
+
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+
   - if: # The IOMMUs don't have larbs.
       not:
         properties:
@@ -191,6 +204,9 @@ allOf:
               const: mediatek,mt8195-iommu-infra
 
     then:
+      properties:
+        interrupts:
+          maxItems: 1
       required:
         - mediatek,larbs
 
-- 
2.37.3


