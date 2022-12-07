Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B540C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HG+J5HwyTK0zqSoo+Xr/2QzGdLMJsWykbO9VsHfdA0=; b=z9FHofRvvrk9fXo2YOjGSdyuRE
	xUUXryYOjkvO5y09ZbN43VXFgWjg+VosqtlG1NFx/RGQg04uRsIcm6Zp/ky60gG+9s8kv2NZ/MIwT
	by0oO0X6AY/sOl5objzDrielCooUIdozQi+crp5XwFEObm1pW17bre+JAi3XKDvAD3t1Y+jdxvrlA
	9IrcbE3qeueO/9JUXeivIkQwMWpOlIwJZhkB05bFOdITAjGGjMdRFgPJYtt5wgSm3IMnIAM6B3yUs
	RHrxFqNQo9Z8yUHYC48mc5CCW/wSNpQN9DOZqVD1ADteugkqfvTAYE9omG4XqUZMaAM4tM/3NiAGX
	qKiGte4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2neJ-00CVtB-5E; Wed, 07 Dec 2022 06:11:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2neG-00CVsI-FF; Wed, 07 Dec 2022 06:11:17 +0000
X-UUID: 90149f2eaacb48459609fd693171c689-20221206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/HG+J5HwyTK0zqSoo+Xr/2QzGdLMJsWykbO9VsHfdA0=;
	b=BDbWnE83Mg+OU37ZVDOpA7QCeDkPUnF4jPeWPoMPLhyprivMQwnXdd8NAUuaWha+brNfBdr1lVZvbQR6xAAAVthKaWdk7Q+H+EVYNe9vIqhzfHRKy7W908j0Lhwp89x85eHlHjllN+YfMrilI9QjsV+d3+iOc7/AG9nZp7YS8j0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:e3f5fff9-2359-470d-be3f-757f11eab5ad,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:fad08b24-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 90149f2eaacb48459609fd693171c689-20221206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1995831695; Tue, 06 Dec 2022 23:11:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 13:51:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 13:51:09 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>, Allen-KH
 Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v6 1/3] media: dt-bindings: media: mediatek: Rename child node names for decoder
Date: Wed, 7 Dec 2022 13:51:05 +0800
Message-ID: <20221207055107.11333-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221207055107.11333-1-allen-kh.cheng@mediatek.com>
References: <20221207055107.11333-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_221116_534357_15443DBA 
X-CRM114-Status: GOOD (  10.75  )
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

In order to make the names of the child nodes more generic, we rename
"vcodec-lat" and "vcodec-core" to "video-codec" for decoder in
patternProperties and example.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 61 ++-----------------
 1 file changed, 5 insertions(+), 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index c4f20acdc1f8..46308cdaacc0 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -91,12 +91,13 @@ properties:
 
 # Required child node:
 patternProperties:
-  '^vcodec-lat@[0-9a-f]+$':
+  '^video-codec@[0-9a-f]+$':
     type: object
 
     properties:
       compatible:
         enum:
+          - mediatek,mtk-vcodec-core
           - mediatek,mtk-vcodec-lat
           - mediatek,mtk-vcodec-lat-soc
 
@@ -145,59 +146,6 @@ patternProperties:
 
     additionalProperties: false
 
-  '^vcodec-core@[0-9a-f]+$':
-    type: object
-
-    properties:
-      compatible:
-        const: mediatek,mtk-vcodec-core
-
-      reg:
-        maxItems: 1
-
-      interrupts:
-        maxItems: 1
-
-      iommus:
-        minItems: 1
-        maxItems: 32
-        description: |
-          List of the hardware port in respective IOMMU block for current Socs.
-          Refer to bindings/iommu/mediatek,iommu.yaml.
-
-      clocks:
-        maxItems: 5
-
-      clock-names:
-        items:
-          - const: sel
-          - const: soc-vdec
-          - const: soc-lat
-          - const: vdec
-          - const: top
-
-      assigned-clocks:
-        maxItems: 1
-
-      assigned-clock-parents:
-        maxItems: 1
-
-      power-domains:
-        maxItems: 1
-
-    required:
-      - compatible
-      - reg
-      - interrupts
-      - iommus
-      - clocks
-      - clock-names
-      - assigned-clocks
-      - assigned-clock-parents
-      - power-domains
-
-    additionalProperties: false
-
 required:
   - compatible
   - reg
@@ -211,6 +159,7 @@ if:
     compatible:
       contains:
         enum:
+          - mediatek,mtk-vcodec-core
           - mediatek,mtk-vcodec-lat
 
 then:
@@ -241,7 +190,7 @@ examples:
             #size-cells = <2>;
             ranges = <0 0 0 0x16000000 0 0x40000>;
             reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
-            vcodec-lat@10000 {
+            video-codec@10000 {
                 compatible = "mediatek,mtk-vcodec-lat";
                 reg = <0 0x10000 0 0x800>;
                 interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
@@ -264,7 +213,7 @@ examples:
                 power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
             };
 
-            vcodec-core@25000 {
+            video-codec@25000 {
                 compatible = "mediatek,mtk-vcodec-core";
                 reg = <0 0x25000 0 0x1000>;
                 interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
-- 
2.18.0


