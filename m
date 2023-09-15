Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027DFEE6446
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LAKMG6uB4XgSWM5980hEv1iFhTPZbK1VjP997k8//RI=; b=YTF7HdfqUqlID2IAHs2K4M+GK4
	NxFvrz12MATaKod4tQecKFo/VW/VPq6J2JU7Vo1jPmZMcg+54lkpy22C3w18f3imEBc1fmLw5Vwtg
	QNcSIqjwclGeO1H+A59sikWyBh7Q4QYut2ktEwK7pa2aZrn4OX6PWkzCw7RnIruMeg+k6h5Wv1FGi
	uOD6UTIYNI1uRqcvDEMY4WhF4aJvSVrtPxNQtt0t+hLI7l4Uvj5LuMc4zbvS06YfQYgptjR4R0Dwc
	Un0IHKeaeJ80/lLWMXo3vjnFSxBQc4qGwzEKIHVy9P9GMTxLBfjqrkd8q46r2Ox1s1oUs4Gvoq4oM
	Nm00+rlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3wu-00A7WI-2i;
	Fri, 15 Sep 2023 08:13:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3wo-00A7SO-1r;
	Fri, 15 Sep 2023 08:13:11 +0000
X-UUID: af7f5278539f11ee86758d4a7c00f3a0-20230915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LAKMG6uB4XgSWM5980hEv1iFhTPZbK1VjP997k8//RI=;
	b=ilQ9C45opWTjSumFSoKQ6lz10by6KfIOghvMkeVhgEgla/k5ruP7EenNHSFaGuFqzegqJw36xUI5mT5TbDbMp8pt5hFHWgHFKF+ff54H4qxYV7rzZBzUUDDgcyBOCOE/uO2V0LxCOZVNCTaO3bX8UhmFKFwKOluEGcmLLvsf27E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:3c7887e7-673c-4cbd-8f45-6cdb6333d59f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:72a8dfbe-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: af7f5278539f11ee86758d4a7c00f3a0-20230915
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1381948799; Fri, 15 Sep 2023 01:13:00 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Sep 2023 16:12:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Sep 2023 16:12:23 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Macpaul Lin
	<macpaul.lin@mediatek.com>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?=
	<bero@baylibre.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm64: mediatek: add mt8390-evk board
Date: Fri, 15 Sep 2023 16:12:11 +0800
Message-ID: <20230915081212.13959-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_011306_640495_A6C8D739 
X-CRM114-Status: GOOD (  10.69  )
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

1. Add compatible for MT8390.
2. Add bindings for the MediaTek mt8390-evk board, also known
as the "Genio 700-EVK".

The MT8390 and MT8188 belong to the same SoC family,
with only minor differences in their physical characteristics.
They utilize unique efuse values for differentiation.

The booting process and configurations are managed by boot
loaders, firmware, and TF-A. Consequently, the part numbers
and procurement channels vary.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
 1 file changed, 5 insertions(+)

dependencies for v1:
 - This patch should be applied after the following patch set
  - mt8365's bindings
   - https://lore.kernel.org/linux-arm-kernel/20230912092444.31635-1-macpaul.lin@mediatek.com/T/
  - mt8395's bindings: v6
   - https://lore.kernel.org/lkml/20230911115717.26184-1-macpaul.lin@mediatek.com/T/
  - mt8188's bindings
   - https://lore.kernel.org/lkml/a4e1a80ebd19896410f50b0297e05dce06fb47cc.camel@mediatek.com/T/

Changes for v2:
 - drop description for multiple boards
 - update dependencies with the following patch sets
  - mt8395's bindings: v7
   - https://lore.kernel.org/linux-arm-kernel/20230913032057.3197-1-macpaul.lin@mediatek.com/T/  

Changes for v3:
 - drop "dts: " in $subject by Conor's suggestion.
 - Update "Reviewed-by" and "Acked-by" tags, Thanks.  
 - update dependencies with the following patch sets
  - mt8395's bindings: v8
   - https://lore.kernel.org/lkml/20230914055145.16801-1-macpaul.lin@mediatek.com/T/

Changes for v4:
 - add more "Reviewed-by" tag, Thanks.

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 0248bb458180..3968d5934fa2 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -252,6 +252,11 @@ properties:
           - enum:
               - mediatek,mt8365-evk
           - const: mediatek,mt8365
+      - items:
+          - enum:
+              - mediatek,mt8390-evk
+          - const: mediatek,mt8390
+          - const: mediatek,mt8188
       - items:
           - enum:
               - mediatek,mt8395-evk
-- 
2.18.0


