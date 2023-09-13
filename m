Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B47EEB58C
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 04:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z3Yjahx9vU9QnGy7ZpITb4HawIlKK3wiRM4IUKhA0R8=; b=hvC2RGgmXF6U23jBvYqlc7ZrAr
	uxpvRy1Fd+xXMukiXIQ1Ftl4KEj9V5Y9SVepWmmcpafu9qGt44uevldZJrueh1FYiREwRZTMG8hnE
	MNJbswA4V/5k3RNxmj2NlHbV3h3c0ZpLizbcdwBKabcPDjAz2x5AwHnPSruVx58IfhgTS92F/gdlw
	6WFMNz9Ycl3LBZ+argk8FkzslZnaiy1GqGlauxbrXLtQRm9JbBhcv8G/MPVqJwTuNJNDtgXVD4fTb
	cRksWQBWnRZWo2/YWU6q98KTY8qyUofWe2P35dWRNq6zIWbb832L4D/QGpiuR3n8+GUAqtsPmJxSz
	xEKwyzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgH8B-004YLg-1f;
	Wed, 13 Sep 2023 04:05:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgH88-004YKa-0h;
	Wed, 13 Sep 2023 04:05:33 +0000
X-UUID: c547e27051ea11ee9b7791016c24628a-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=z3Yjahx9vU9QnGy7ZpITb4HawIlKK3wiRM4IUKhA0R8=;
	b=nnmlBPqexpx3kkBVNlNDuLWYyDCc4VKF86tVSXhAEXqq3KxgusdzLVqSw6NaIFo30uTsxMHNPQ840QcFAbmxRubcdlF4D2LqZiCboV55E3mPSWDN8K8FAfqEEG7J8zGP6DvFKvcDvdr+OPIsApMZ17iLwkzNiayNVAe+E7win1U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:46c49eea-e645-4000-9df7-ec0a37108ad1,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:9b5fa2ef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: c547e27051ea11ee9b7791016c24628a-20230912
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1073103899; Tue, 12 Sep 2023 21:05:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Sep 2023 12:04:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Sep 2023 12:04:51 +0800
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
Subject: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add mt8390-evk board
Date: Wed, 13 Sep 2023 12:04:48 +0800
Message-ID: <20230913040449.29560-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.797300-8.000000
X-TMASE-MatchedRID: iSQL5szRvdHq1YwE48CuWzujYXrbVGSb+Gz435tISEEVhrI1wflQjFRE
	vM+xXlqD6fGu170eFKuyRoa4j2Wmwl0ieHN50/kHGVyS87Wb4lyy4iyjvVWTotzOQo7mTgA+kpS
	2cE3ZkFJ3I1qXcZvalI3p8NudO7SfHxPMjOKY7A/x0Der+6P8v8RB0bsfrpPInxMyeYT53RlhpP
	cp3TMWK+2s+KtXCAx7gm8QSCiqkQpWj+qkP0Qxr/6179No8WMQNvoFzIxcNi/vyKh2wp2o+Lpa2
	pwQg/QX1rLo/RSaKNkc/j4aI5S1Lnr9GD0zfOvEAaqvv/mhgrEIcy9ODq9nmVZca9RSYo/b
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.797300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 79149F659C9303CA7F43BCC1F7E2ED36479B43A947522AEAA44550B8A3F5B4922000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_210532_263080_DEC10E53 
X-CRM114-Status: GOOD (  10.74  )
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

Changess for v2:
 - drop description for multiple boards
 - update dependencies with the following patch sets
  - mt8395's bindings: v7
   - https://lore.kernel.org/linux-arm-kernel/20230913032057.3197-1-macpaul.lin@mediatek.com/T/  

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


