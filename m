Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A554606A33C
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 06:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DKXW9eoX;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=df1wUcnN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y3zhTjpPZpXjLDk8y+TcI0f+3J+puzNWogbkrOaTR3c=; b=DKXW9eoX7eS/uRAKnYv8L/DvBf
	d0MLIvaVV35bqUpSY7h2JFWx7mFCqFti55JQ+gvDTBIezFTDqjXc/Xv05rxVDKzdXl82XWQ6PurFX
	o9RwW4aiFVyttbx9UXbuYXSFt9iW+NpKyvN3p4BHEVDnm9M4g1LEUrvVwWgsi4cutf2T+Ppdi1L1K
	eE9V+tmrD59Q4R2+RN/oYy9x4y3zrjQtCoPZ1ladclk0LJmS5tXmQ08gArDyVKezc9nQFLKmssyFr
	1KB1ZSXksPHV1vqc8gDR/9djvlPtc92QjRdTyBzjV5ZIWl8VV4NJ9kPuYY1IdX9GfKfEHnw6zQQWz
	ooc6aBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6KH-00000008alq-2Cc9;
	Wed, 25 Nov 2026 06:17:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6J6-00000008YuH-3aq4;
	Wed, 25 Nov 2026 06:16:46 +0000
X-UUID: c4be2eb2e89711f1acbe4559397dec65-20261124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=y3zhTjpPZpXjLDk8y+TcI0f+3J+puzNWogbkrOaTR3c=;
	b=df1wUcnNv4n870bwSxQcqVvUg5N19NAkavWXCfX/KSBRmQtwnRA5kldzltOY8L0xhYpbM1cVxJBXbMM/20vSw04N9vB1A4vPP6c4q1MOsbMtLpxTHMmsd9oqFui3clqEGHScZZ2bNtegFhn39EWwjSrGy3t1mHakjj5KSE5H+2o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:9c6abdd7-aa5c-4184-8b61-84d0afc198f4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:74937e4e-207c-4400-a70f-7c2d09e2f912,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c4be2eb2e89711f1acbe4559397dec65-20261124
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1606060568; Tue, 24 Nov 2026 23:16:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:16:34 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:16:33 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil
	<hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v20 13/15] dt-bindings: media: mediatek,jpeg: Add MT8196 encoder SMMU configuration
Date: Wed, 25 Nov 2026 14:16:16 +0800
Message-ID: <20261125061618.2544386-14-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
References: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_221640_938959_5CC4BB26 
X-CRM114-Status: GOOD (  12.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the mediatek,smmu-config phandle to the MT8196 JPEG SMMU
configuration syscon used to program an encoder core's GUSER_ID fields.
Require the property for MT8196 encoder cores.

Document SMMU stream IDs for MT8196 in the parent and child iommus
descriptions while retaining the MT8195 hardware master-port description.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../media/mediatek,mt8195-jpegenc.yaml        | 31 ++++++++++++++++---
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
index e2d772ea0..46597003e 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -24,9 +24,11 @@ properties:
   iommus:
     maxItems: 4
     description:
-      Points to the respective IOMMU block with master port as argument, see
-      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
-      Ports are according to the HW.
+      Phandles to the respective IOMMU blocks. For MT8195, the argument is
+      a hardware master port; see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml.
+      For MT8196, the argument is an SMMU stream ID; see
+      Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml.
 
   "#address-cells":
     const: 2
@@ -57,8 +59,11 @@ patternProperties:
         minItems: 1
         maxItems: 32
         description:
-          List of the hardware port in respective IOMMU block for current Socs.
-          Refer to bindings/iommu/mediatek,iommu.yaml.
+          Phandles to the respective IOMMU blocks. For MT8195, the argument is
+          a hardware master port; see
+          Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml.
+          For MT8196, the argument is an SMMU stream ID; see
+          Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml.
 
       interrupts:
         maxItems: 1
@@ -73,6 +78,22 @@ patternProperties:
       power-domains:
         maxItems: 1
 
+      mediatek,smmu-config:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          Phandle to the MT8196 JPEG SMMU configuration syscon used to
+          program this encoder's GUSER_ID fields.
+
+    allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: mediatek,mt8196-jpgenc-hw
+        then:
+          required:
+            - mediatek,smmu-config
+
     required:
       - compatible
       - reg
-- 
2.51.0.windows.2


