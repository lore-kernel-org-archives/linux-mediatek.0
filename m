Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3430C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 05:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyiQSTtf/H+J6bLVY9o8xyIPf4F3imFPrSDWm8b80ZU=; b=OWYoe9Bd50IDcoMn8jAh0opOi1
	hSCYH4DlfgxOe2NQOuSzyUt0fR1P5STVk6yCZefxL8oxBJno5zbBzGa9BUljFvelEIkQgXAUTEHkR
	CMqMM98hqswUv7uUsKJqie/nPUD0BWVr6qDUkXRuXpOfX/b/oMW6HzVh5jFX5szsFbz+79j+T2Z44
	z2iPYpse9nD923Bav98qbTb/CguHS38ExIOJxghv1Xj5IDHCL19ziuXkDR6TqxSC14bO3FaT2zbG4
	JUH+KmWjq/yl5pPQnqTnKYImzvuYJldXlAInm7ceByCwpVxMIsU6J947FvhO8xpDMmcHnEyfX84MT
	beayr+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPd9a-00E8s4-Qc; Wed, 08 Feb 2023 05:37:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPd9X-00E8pa-LQ; Wed, 08 Feb 2023 05:37:57 +0000
X-UUID: b83d31fca77211edbbe3f76fe852e059-20230207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VyiQSTtf/H+J6bLVY9o8xyIPf4F3imFPrSDWm8b80ZU=;
	b=K9SuRt+yiY6wvuZwKFW31Tuzil4jBBjRKKykfsAItZGc6yagZoDYXTdKypywcdaWfqGLrrWvO6k6hZmw8EOh0GLMjYqBtxkOg3khWXX6hAVnIaHSXfRDGsfNIQP1lNvzjgUdABrDiHkg/boZA1igVKMAxxG2/qdOSicnNPKBEYs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:f3038cbb-afb9-4e38-892a-dd265ecf1844,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:885ddb2,CLOUDID:1f1ccdf7-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: b83d31fca77211edbbe3f76fe852e059-20230207
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1421668114; Tue, 07 Feb 2023 22:37:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 8 Feb 2023 13:37:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 8 Feb 2023 13:37:23 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, <nfraprado@collabora.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <libo.kang@mediatek.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, Yong Wu
	<yong.wu@mediatek.com>, Bin Liu <bin.liu@mediatek.com>, Xia Jiang
	<xia.jiang@mediatek.com>
Subject: [PATCH v2 02/10] dt-bindings: media: mediatek,jpeg: Remove dma-ranges property
Date: Wed, 8 Feb 2023 13:36:35 +0800
Message-ID: <20230208053643.28249-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230208053643.28249-1-yong.wu@mediatek.com>
References: <20230208053643.28249-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_213755_718168_82888A5C 
X-CRM114-Status: GOOD (  11.00  )
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

After commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
controllers"), the dma-ranges of the leaf node doesn't work. Remove
it for jpeg here.

Currently there is only mt8195 jpeg node has this property in upstream,
and it already uses parent-child node, this property did work. But instead,
MediaTek iommu will control the masters' iova ranges by the master's
larb/port id internally, then this property is unnecessary.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Bin Liu <bin.liu@mediatek.com>
Cc: kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
Cc: Xia Jiang <xia.jiang@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml | 7 -------
 .../devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml | 7 -------
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml   | 5 -----
 3 files changed, 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
index 71595c013dbb..e5448c60e3eb 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -26,11 +26,6 @@ properties:
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
       Ports are according to the HW.
 
-  dma-ranges:
-    maxItems: 1
-    description: |
-      Describes the physical address space of IOMMU maps to memory.
-
   "#address-cells":
     const: 2
 
@@ -89,7 +84,6 @@ required:
   - compatible
   - power-domains
   - iommus
-  - dma-ranges
   - ranges
 
 additionalProperties: false
@@ -115,7 +109,6 @@ examples:
                      <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA1>,
                      <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
                      <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
-            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
             #address-cells = <2>;
             #size-cells = <2>;
             ranges;
diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
index 95990539f7c0..596186497b68 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -26,11 +26,6 @@ properties:
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
       Ports are according to the HW.
 
-  dma-ranges:
-    maxItems: 1
-    description: |
-      Describes the physical address space of IOMMU maps to memory.
-
   "#address-cells":
     const: 2
 
@@ -89,7 +84,6 @@ required:
   - compatible
   - power-domains
   - iommus
-  - dma-ranges
   - ranges
 
 additionalProperties: false
@@ -113,7 +107,6 @@ examples:
                      <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
                      <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
                      <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
-            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
             #address-cells = <2>;
             #size-cells = <2>;
             ranges;
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index c8412e8ab353..37800e1908cc 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -44,11 +44,6 @@ properties:
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
       Ports are according to the HW.
 
-  dma-ranges:
-    maxItems: 1
-    description: |
-      Describes the physical address space of IOMMU maps to memory.
-
 required:
   - compatible
   - reg
-- 
2.18.0


