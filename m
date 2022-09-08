Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6F1C6FA8A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 13:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d+GPskGRqjJsCPYthGHDYTsngcYMpnS6QMFp+zEL8vY=; b=S1NzrTrcWG964i4C1IQNpWFDoX
	nXaJv2y9vyIBmIKi3uvjYH8DI0yV/vKbuzccLff8zvNf75hr0rf9SaJC6DB/uOqyBW+396xBNwogk
	15oYvlPGwkV6S9coqGZUzIf48qHujfShBKz1F/7LfgyB7lV0XOmCF/RalAAfd7cKn/BWwaqdjA8uz
	iPH/wgZcsVOiWvhdGvDHmk5E+v74UBEHxqwQNDkkuwnFLKVemTKTej4ItXyfKCztFmVT0I63HwpOM
	uhfBC1McCJmJdRiGuDq4QJguvEK2r/QsbrIbSpnbY89mY4kH7psPvXpoxOL7PGV1OQDCGhvV12L9S
	9YwrYeTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHXa-003nHm-2P; Thu, 08 Sep 2022 13:25:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHXN-003n9r-Uu; Thu, 08 Sep 2022 13:25:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DFF2161919;
	Thu,  8 Sep 2022 13:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10000C43470;
	Thu,  8 Sep 2022 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662643544;
	bh=vKmdZnSEqQsgGYqX0IyUeu5ecemFZS/PREfqX8Z3614=;
	h=From:To:Cc:Subject:Date:From;
	b=QCBpWX3Yd+k88zciOQ5QXOLEW9QXWpWmKrfzwp+BYl1BmLURpPXKrBbUGuxum5r/u
	 NmXJ/oBKrOy864Aj0w4szD96VRM82oc6fGsmNeaOL/qY57Rl+zNldk85SvsFKnqxkY
	 QSLaBRdaBlfMGPTBJrcMZTGoB9/SBrR1B6a5nKQEx9YZ1zj+nLXxuZRDnGA9hdgh1V
	 S5g/fRHMEorYRXxx4Sd5bnxorRW0o7wNDjJ3jfWc+71Z+oWYNZUcuSprSWsd8QeRRR
	 D4WLSTXtkVyE52HU8DLgIkylxcX2lplcdWryOJj0tMpY+m3ZguGlnqnCPWojBKNRBe
	 zcA5kvua4pqLg==
From: matthias.bgg@kernel.org
To: Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	iommu@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v1] dt-bindings: iommu: mediatek: mt8195: Fix max interrupts
Date: Thu,  8 Sep 2022 15:25:35 +0200
Message-Id: <20220908132535.9350-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_062546_076374_485583FE 
X-CRM114-Status: GOOD (  10.99  )
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

 .../bindings/iommu/mediatek,iommu.yaml        | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index fee0241b50988..621aca2adfb7f 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -91,7 +91,7 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    description: each bank has one dedicated interrupt
 
   clocks:
     items:
@@ -183,6 +183,19 @@ allOf:
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
+          maxItems: 5
+      required:
+        - interrupts
+
   - if: # The IOMMUs don't have larbs.
       not:
         properties:
@@ -191,8 +204,12 @@ allOf:
               const: mediatek,mt8195-iommu-infra
 
     then:
+      properties:
+        interrupts:
+          maxItems: 1
       required:
         - mediatek,larbs
+        - interrupts
 
 additionalProperties: false
 
-- 
2.37.3


