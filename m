Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B062DC25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 13:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGBeDHbqNgsnmKFfngjGLY+pCx0gqO+ijLhKaQFLTCg=; b=3SztcQtxuEM6pcZ8YomFqFSse4
	4TlgVz2tfqwMFW1uDsqQXtKvgDwWrvulWXyvUeMHAiwZ/+b7kXCqmpohq7dKvD6gjpiXXidp4RSji
	Ji+02jTgkwLsj9RgXm5hEn8y74ynLtLZzZpr5hsu4/cnZ+f/Bb8+pz8zt+X/PnY3vpPIEawE4ilSK
	gXU07YViOoNfehDb5esqBUn01VV2ZeKh653xRBg6pc6cifKgBe+h18gm6GCRxkOv2gcfCm7Y+qIWd
	2TLievd8DAorSPllGXizDIksZCP8p5ZiAxkgtCNLpYoq6g6cPv3TRZh85NUzc8dEEzqeT1v3lhKlX
	+btrC2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJQP-002WoX-Hm; Wed, 17 Aug 2022 13:49:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJQA-002Wh2-9q; Wed, 17 Aug 2022 13:49:26 +0000
X-UUID: 06b76ee545894ef4823b8292f6fc3c0b-20220817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cGBeDHbqNgsnmKFfngjGLY+pCx0gqO+ijLhKaQFLTCg=;
	b=EirlS+lst9JGopA0uiF7K908RHJMXUlQui+a6x+Agi7WV4DxWLzoOgyBoRaezespzK9yIqUzSkMUCRvMpStKDvJ6mxNkacjJnUB9/+0voQ+Wb3sPzBdBRm4WBOGrGJo7p/l6tgjol+7+F53k8CtHgUakIOsw3Mo7Hzm8XVbpyBc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:c3be8911-6f00-4264-8fa3-a081becb2eaf,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:e2fa18af-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 06b76ee545894ef4823b8292f6fc3c0b-20220817
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 329996871; Wed, 17 Aug 2022 06:49:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 17 Aug 2022 20:48:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 17 Aug 2022 20:48:37 +0800
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yi.kuo@mediatek.com>,
	<anthony.huang@mediatek.com>, <wendy-st.lin@mediatek.com>, Chengci.Xu
	<chengci.xu@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v5 1/4] dt-bindings: memory: mediatek: Add mt8188 smi binding
Date: Wed, 17 Aug 2022 20:46:05 +0800
Message-ID: <20220817124608.10062-2-chengci.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817124608.10062-1-chengci.xu@mediatek.com>
References: <20220817124608.10062-1-chengci.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_064922_432595_94524164 
X-CRM114-Status: GOOD (  11.92  )
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

Add mt8188 smi supporting in the bindings.

In mt8188, there are two smi-common HW, one is for vdo(video output),
the other is for vpp(video processing pipe). They connect with different
smi-larbs, then some setting(bus_sel) is different. Differentiate them
with the compatible string.

Something like this:

   IOMMU(VDO)          IOMMU(VPP)
       |                   |
SMI_COMMON_VDO       SMI_COMMON_VPP
----------------     ----------------
   |     |   ...       |     |    ...
 larb0 larb2 ...     larb1 larb3  ...

Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
---
 .../bindings/memory-controllers/mediatek,smi-common.yaml      | 4 +++-
 .../bindings/memory-controllers/mediatek,smi-larb.yaml        | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 4f5dd0a20109..a8fda30cccbb 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -16,7 +16,7 @@ description: |
   MediaTek SMI have two generations of HW architecture, here is the list
   which generation the SoCs use:
   generation 1: mt2701 and mt7623.
-  generation 2: mt2712, mt6779, mt8167, mt8173, mt8183, mt8186, mt8192 and mt8195.
+  generation 2: mt2712, mt6779, mt8167, mt8173, mt8183, mt8186, mt8188, mt8192 and mt8195.
 
   There's slight differences between the two SMI, for generation 2, the
   register which control the iommu port is at each larb's register base. But
@@ -37,6 +37,8 @@ properties:
           - mediatek,mt8173-smi-common
           - mediatek,mt8183-smi-common
           - mediatek,mt8186-smi-common
+          - mediatek,mt8188-smi-common-vdo
+          - mediatek,mt8188-smi-common-vpp
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 59dcd163668f..5f4ac3609887 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -25,6 +25,7 @@ properties:
           - mediatek,mt8173-smi-larb
           - mediatek,mt8183-smi-larb
           - mediatek,mt8186-smi-larb
+          - mediatek,mt8188-smi-larb
           - mediatek,mt8192-smi-larb
           - mediatek,mt8195-smi-larb
 
@@ -78,6 +79,7 @@ allOf:
           enum:
             - mediatek,mt8183-smi-larb
             - mediatek,mt8186-smi-larb
+            - mediatek,mt8188-smi-larb
             - mediatek,mt8195-smi-larb
 
     then:
@@ -111,6 +113,7 @@ allOf:
               - mediatek,mt2712-smi-larb
               - mediatek,mt6779-smi-larb
               - mediatek,mt8186-smi-larb
+              - mediatek,mt8188-smi-larb
               - mediatek,mt8192-smi-larb
               - mediatek,mt8195-smi-larb
 
-- 
2.25.1


