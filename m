Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8708CCCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 07:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlnNEhXRofWMhAnm76CEKduewEiEJ3KrrHEcej/gPKY=; b=iY67+0i26WciDAkY0wiY8KtUhu
	QVkJib7DwZGYc4Z6osDHzTnkr/2Borsx9lXh7x299iCkNpSavNrNuyLDi4CJB5jgoyc5rZXcYeHcC
	EkP9WuGAGYre95cWs0ez9mO3mZzgjVCxQKlS+zWqfz+I3h554xW6jNmxJDc9D8+3jDVNa70zzDdqd
	0e3yF7Xt8HPBT4y+Old8p1Zm8jAHV+Auhkztod50kG8ru09PM+iTY+q1WAuRWfKMJcX/oHjqO795Y
	offaXruCSbR8y36MGrQS5nEkiy+XwtyaLwXqFLIJw6Z/wVnK6nCDDtt8OVxBWzmx8WDxpTb5IL9FL
	oKcODxRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stiop-00000007URq-2Ta3;
	Thu, 26 Sep 2024 07:21:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stiYl-00000007ROU-3qbl;
	Thu, 26 Sep 2024 07:05:09 +0000
X-UUID: a69c76f47bd511efb3adad29d29602c1-20240926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hlnNEhXRofWMhAnm76CEKduewEiEJ3KrrHEcej/gPKY=;
	b=pFFHsbGFPWGqylBrtus1adQbZYPETocRhjR6iTUylt+sLoXOi7svGhGqwEUekps1Ix6PvEW82tsptiLFB2kxzl1hQig4bSM7ndCvB7HEgCafEd3S2qeVwXARMH6EK34JVGRK5/WWuda6BNhno8/6DnXZ+jlsIjh+M7IesEamoLo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:87f3da0a-eb24-46b1-8460-1d928f95d44f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:b1fc4718-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a69c76f47bd511efb3adad29d29602c1-20240926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 711497797; Thu, 26 Sep 2024 00:05:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Sep 2024 15:04:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Sep 2024 15:04:59 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH 2/2] dt-bindings: mmc: mtk-sd: Add support for MT8196
Date: Thu, 26 Sep 2024 15:03:18 +0800
Message-ID: <20240926070405.20212-3-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240926070405.20212-1-andy-ld.lu@mediatek.com>
References: <20240926070405.20212-1-andy-ld.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_000508_010370_16532BFB 
X-CRM114-Status: GOOD (  10.95  )
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

Extend the devicetree bindings to include the MT8196 mmc controller
by adding the compatible string 'mediatek,msdc-v2', which could be
also used for future compatible SoCs that support new tx/rx.

Add three properties for MT8196 settings:
- 'mediatek,prohibit-gate-cg', indicate if the source clock CG could
  be disabled when CPU access IP registers.

- 'mediatek,stop-dly-sel', configure read data clock stops at block gap.

- 'mediatek,pop-en-cnt', configure the margins of write and read
  pointers while begin to pop data transfer.

Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>
---
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index c532ec92d2d9..82d1a9fac67c 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -25,6 +25,7 @@ properties:
           - mediatek,mt8173-mmc
           - mediatek,mt8183-mmc
           - mediatek,mt8516-mmc
+          - mediatek,msdc-v2
       - items:
           - const: mediatek,mt7623-mmc
           - const: mediatek,mt2701-mmc
@@ -154,6 +155,30 @@ properties:
     enum: [32, 64]
     default: 32
 
+  mediatek,stop-dly-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Some SoCs need to set appropriate stop-dly-sel to configure read data clock
+      stops at block gap. The valid range is from 0 to 0xf.
+    minimum: 0
+    maximum: 0xf
+
+  mediatek,pop-en-cnt:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Some SoCs need to set appropriate pop-en-cnt to configure the margins of write
+      and read pointers while begin to pop data transfer. The valid range is from 0
+      to 0xf.
+    minimum: 0
+    maximum: 0xf
+
+  mediatek,prohibit-gate-cg:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Decide if source clock CG could be disabled when CPU access IP registers.
+      If present, source clock CG could not be disabled.
+      If not present, source clock CG could be disabled.
+
   resets:
     maxItems: 1
 
@@ -191,6 +216,7 @@ allOf:
             - mediatek,mt8188-mmc
             - mediatek,mt8195-mmc
             - mediatek,mt8516-mmc
+            - mediatek,msdc-v2
     then:
       properties:
         clocks:
-- 
2.46.0


