Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFADCCA473
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 10:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBJYlTZ9zZdbwG6U9SXvqLBm8fGGvDsM+MMMpiSmLao=; b=eIlQZmZLOQKa/b
	NPcHH9nVEZg/BD3l7g0JIR3c8r1H3uYaOir+dTIsEJ7iFO7CZpJVvKlsZfQ8WDH+JEbnO+7A4IBq1
	Ut6OyMQgwoJCKxVNkHE1/DZ4gbSIlGfeaWZFN7GGMMXcDWNtZdZvfIRCTuuPJ4DRO8nAvGGx3wuaZ
	CkCnHih3T53h5bGARxg/v+I3cG/kYh3wfaSG25wZhS7iDz6rRQ0cBT3xNvDsWxyBNYJB2i07TG3nw
	1zEZ9NJAFjJvUhbDiTcLr9xZdo49+hjiEO21gUYrymDC7KU1z8++L/R6kIE3Z23EQ0B/lXsrbT3rx
	G4N/u1RTCYuUaQ8bFbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF5o-000s1g-TF; Thu, 09 Jun 2022 10:08:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF5I-000rjD-LY; Thu, 09 Jun 2022 10:08:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5839A66017C7;
	Thu,  9 Jun 2022 11:08:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654769289;
	bh=HGU3F/fPzfALJBmgYOFXFZVVSN1REtbO7A5z7wOIIZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B4zoEc3kuavp5jU+vdoOQdnw6/dPK/kfiEiqQx4QU5cgAXifm+z3TfYRX1Siej/qw
	 tXs4c40wF8cUIsiQpPmsEtxtfuaV/t1dZKHL9IboZ/WtZJQ/HB9YZ3z4Qfj6wDQJvl
	 sz2PC7QAC/m09CBmCzffnGWDHDcdIb5wE7r0ifWgu5l0tr49uboZWzILqc6pjeur9N
	 D/9YT2Sz3Onn0OQ/ZfYz3Ggc5nSG2ZMhQVUP97vtQiLMZHywzrM9lR1rJzbKoVJNLE
	 Vm86cY1OvO3TzLOkDmKB3joUZW2hOLDb5D+M1ajkmmMKxternyYnK1yWVtJFtz/VkZ
	 Rb33r5B+uwMdQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org,
	will@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 1/6] dt-bindings: iommu: mediatek: Add mediatek,infracfg phandle
Date: Thu,  9 Jun 2022 12:07:57 +0200
Message-Id: <20220609100802.54513-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_030812_920312_9F81E8D1 
X-CRM114-Status: UNSURE (   8.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add property "mediatek,infracfg" to let the mtk_iommu driver retrieve
a phandle to the infracfg syscon instead of performing a per-soc
compatible lookup in the entire devicetree and set it as a required
property for MT2712 and MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/iommu/mediatek,iommu.yaml           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 2ae3bbad7f1a..4142a568b293 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -101,6 +101,10 @@ properties:
     items:
       - const: bclk
 
+  mediatek,infracfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle to the mediatek infracfg syscon
+
   mediatek,larbs:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     minItems: 1
@@ -167,6 +171,18 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt2712-m4u
+              - mediatek,mt8173-m4u
+
+    then:
+      required:
+        - mediatek,infracfg
+
   - if: # The IOMMUs don't have larbs.
       not:
         properties:
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
