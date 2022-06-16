Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3ABC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 11:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLnfaZP4RsvDCAGk97ZR7f3XsDEWRVj5eyUFJC00ifI=; b=PmKGssy5icpLqhphsS4Rl7xYQG
	f83WtsewvThxJJrrVUMKHv25vMod7LM1Jib5fUr4aYhX8T/+mumumKCt/JU9tG1yOEgWF0tBXPN21
	cyAOqmC9dZ6PHPuiXPxpR0BVODoYDb3SRP8tho2ZyqhsxIurdX/b2gzfJ044mGnfGstxa1DLqpQyZ
	1uSWFGjRVJ21uRAB2uf6Zovo2y3g/wqxfHXySxPbeRFw6gZ6InHQ5u1iKDOqTTA3DltyO56OhNNR0
	MslVeX4keX+/n7b//noOjwiFbxApjBRu57qZIMdcPJNyxKpe5qnMBXwpAGV+IKucT7Ofo5BQfKrLN
	lky6UDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1nN1-0020Ae-JF; Thu, 16 Jun 2022 11:09:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1nMg-001zxU-8v; Thu, 16 Jun 2022 11:08:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 47FA5660174C;
	Thu, 16 Jun 2022 12:08:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655377720;
	bh=JcxQv5eisp72VR6ziotoygEYFijE1my8ajQHmQfSnPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mrjA6BFXLCa8xCLLpLd9AqjCPd6qOqYEKdO+mTDGdMfaHWX5mg16VaFTdEIEsSTH1
	 vwvoVikh7KrO4nZFSt/XyXab153cG31FWduHrHgwa30Ndn1G+DrXWM4iorI2dwMhP8
	 UeoPt6PCCmp3iiE1U51ypgOJoQCti9a+JF7PFXajrUgFI8SDGwRgkEefWrkOFqVAu7
	 QNu57zAjyf2b2g8bwpJ25r//++44tOWt3rIVDdqyE7wx1K0LLHB4+z4FVT1YZ9eoqU
	 5qrKykUIQG4Ro/3s0IQv19xqjL2DjV5ItBZ6r9zgP4y4G5i6OqwnqaN951bnTWXvBU
	 BPqXbOJvvbviQ==
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
	miles.chen@mediatek.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 1/5] dt-bindings: iommu: mediatek: Add mediatek,infracfg phandle
Date: Thu, 16 Jun 2022 13:08:26 +0200
Message-Id: <20220616110830.26037-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616110830.26037-1-angelogioacchino.delregno@collabora.com>
References: <20220616110830.26037-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_040842_501633_83B807FD 
X-CRM114-Status: UNSURE (   9.41  )
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

Add property "mediatek,infracfg" to let the mtk_iommu driver retrieve
a phandle to the infracfg syscon instead of performing a per-soc
compatible lookup in the entire devicetree and set it as a required
property for MT2712 and MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/iommu/mediatek,iommu.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 2ae3bbad7f1a..fee0241b5098 100644
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
@@ -191,6 +207,7 @@ examples:
             interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
             clocks = <&infracfg CLK_INFRA_M4U>;
             clock-names = "bclk";
+            mediatek,infracfg = <&infracfg>;
             mediatek,larbs = <&larb0>, <&larb1>, <&larb2>,
                              <&larb3>, <&larb4>, <&larb5>;
             #iommu-cells = <1>;
-- 
2.35.1


