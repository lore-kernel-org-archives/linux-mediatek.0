Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E28C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 10:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trJCxgiQTwxKra4JXJsKaFbz6mieWZQMASnbXMcq7Wo=; b=IXXBGSZ2XQJNOR
	ebaCUPk1dyiXatz7E7D+d2d6fyMdyr2A1RdKLOEqgo80AoaoVYefCwWT70g4iioFn1lQ09dLWTi/p
	lACBGwMtCjmb07NuEJ+l8lrlLMbYTZx9FLaHGNplvVemj8CUGOzZ+o0Othw33QieirEZEOIcwXmdq
	gs4Zud69OjA6GGlB1eQDbvw7IcPVJYBOsBqWDEBNWMXNDxRsMQ8NuwDIiyQggUZymGfBFZKwG/B42
	7McxIn89achwiZW9oj/+FbAiGUKaBVIlH0ZlUlHYAacJr87jqNSQJT+7sUtYrD9+UOjhsAJLeWt9T
	e3heS1LJO6YhME/rTAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF6d-000sb4-MG; Thu, 09 Jun 2022 10:09:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF5J-000rkP-Mz; Thu, 09 Jun 2022 10:08:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CAD9866017CA;
	Thu,  9 Jun 2022 11:08:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654769292;
	bh=pb2gWlG7j2g032SqdnNvyy3B/6lmxFBQubwWdcY6ii4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q9sTvQ6OjmfN2Xr+h60kQLRKdH+Ux3vnvpmUoxw3cSwR++4MBAYYuBli09cSDm7R9
	 /8vEybuz6HL0qQ3LpazzQETe61gJ2WTP+h+Qoahk2WXFeRpczFWosmchVsQWu4oPoY
	 fRJV1prrWSfchOnxeH/5SNCNFV0hOgK7unGczlDq8gIL0DeVYOz9NZ2wYud5c9YuPo
	 pqwbhAOF+jlLIF807YlqGcdaP5P7aEsSjDSPsX5HjRZVOmcaWB9Pr6IL6p3/eMsCze
	 xj8V0I/woD8cOlcaRepHc2UphyFB9OkBkdrla784kO4WOQs46nyMTgvXvV+IShUwX6
	 nVaHIcLshW5hA==
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
Subject: [PATCH v3 5/6] dt-bindings: iommu: mediatek: Add mediatek,pericfg phandle
Date: Thu,  9 Jun 2022 12:08:01 +0200
Message-Id: <20220609100802.54513-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_030813_931207_58F1CB6F 
X-CRM114-Status: UNSURE (   9.23  )
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

Add property "mediatek,pericfg" to let the mtk_iommu driver retrieve
a phandle to the infracfg syscon instead of performing a per-soc
compatible lookup in the entire devicetree and set it as a required
property for MT8195's infra IOMMU.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/iommu/mediatek,iommu.yaml  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 4142a568b293..d5e3272a54e8 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -116,6 +116,10 @@ properties:
       Refer to bindings/memory-controllers/mediatek,smi-larb.yaml. It must sort
       according to the local arbiter index, like larb0, larb1, larb2...
 
+  mediatek,pericfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle to the mediatek pericfg syscon
+
   '#iommu-cells':
     const: 1
     description: |
@@ -183,6 +187,16 @@ allOf:
       required:
         - mediatek,infracfg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-iommu-infra
+
+    then:
+      required:
+        - mediatek,pericfg
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
