Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E493CA0EEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 14:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rNgLa+HhSNZr9Hjy39soCUFNOV2RX95rmgWgPtyQNEQ=; b=qYF15jUrbwGRLuUsSGnWkcIoNp
	LkBqb/CDFaEI15NEYFAsMXRhqljkQmw6lUBjnD25l96/q7IM7VGt3ay6LveL77d3CvPaOZA+VNDjo
	3RNHlyHPfZ9lLxsrtp1w5iVoQWUvm3Nb/9NQSoRZDQ1UMNxETyQ1eIxOGidC7oMP6kOiN9nYQmeV1
	kH3nX0CZJyQqkpNi4SlYvOfIvIDxC/nMpELhxomzKchWh3gNnCb6mfu6Ak3Kbm4z0CUqi2DIwa/3r
	8Q/0JeA9sgJPqLQsJQBle6qfzB6pAlBR6aOP1tL1sHCRQzmvFe+ddfX9EeOkyddaRy6bsY5QEpBuc
	q/WnSwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4Bq-003ViK-2w;
	Tue, 12 Sep 2023 14:16:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4Bn-003Vhz-2M;
	Tue, 12 Sep 2023 14:16:29 +0000
X-UUID: f2a07b16517611ee9b7791016c24628a-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rNgLa+HhSNZr9Hjy39soCUFNOV2RX95rmgWgPtyQNEQ=;
	b=kwGQgt17GkFS8Y84rpG9K7rbs8wL+AAWPh/VPYLbGCLl5LlQaBvkhjaNwz+S/nEhe2h4O0/ygJtyMxyICw37dK8pekx7hLgFccVgdBDjrez8SFHwZ07/JJvoyBg7o4xhxjsy/QtDf+REpbDxuaIXbaC1X2V9ZYrgKiD2d6M9SLQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:f09f9b27-ab3c-405e-aa93-2debc150e375,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:5bb39cef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: f2a07b16517611ee9b7791016c24628a-20230912
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1249010043; Tue, 12 Sep 2023 07:16:21 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 22:06:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 22:06:16 +0800
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
Subject: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: add mt8390-evk board
Date: Tue, 12 Sep 2023 22:06:12 +0800
Message-ID: <20230912140613.6528-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.599100-8.000000
X-TMASE-MatchedRID: wDTc/wNgEcPq1YwE48CuWzujYXrbVGSb+Gz435tISEEVhrI1wflQjFRE
	vM+xXlqD6fGu170eFKuyRoa4j2Wmwl0ieHN50/kHGVyS87Wb4lxMK/nxnH1Imt9RlPzeVuQQgUU
	VL8XjqG1MBruKEpUm1YAy6p60ZV62rpt78afcDNfdB/CxWTRRuwihQpoXbuXFYGD0jtQn7uY4k+
	tw8+90FWv7iqfaN5JJ8IcYCFSkrV+H3NS75geVYsvXQ70MBOo/sGmU/3v9/UDy5NNKxZqzmBRRg
	vUvjjq9aaeeX2Q5bK9+HGPweyal2mGdUezV59DHQZpgl3CshRSeqD9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.599100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: CA750230478EBDA7B5581D811481455AAC4A8857A58B2B196E3FF117102DCEB02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_071627_802565_3FE1FDCA 
X-CRM114-Status: UNSURE (   9.99  )
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
 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

dependencies for v1:
 - This patch should be applied after the following patch set
  - mt8365's bindings
   - https://lore.kernel.org/linux-arm-kernel/20230912092444.31635-1-macpaul.lin@mediatek.com/T/
  - mt8395's bindings
   - https://lore.kernel.org/lkml/20230911115717.26184-1-macpaul.lin@mediatek.com/T/
  - mt8188's bindings
   - https://lore.kernel.org/lkml/a4e1a80ebd19896410f50b0297e05dce06fb47cc.camel@mediatek.com/T/

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index d8e449c6a7d7..047204a4aff5 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -251,6 +251,12 @@ properties:
       - items:
           - const: mediatek,mt8365-evk
           - const: mediatek,mt8365
+      - description: MediaTek Genio 700 Boards (Genio 700 EVK)
+        items:
+          - enum:
+              - mediatek,mt8390-evk
+          - const: mediatek,mt8390
+          - const: mediatek,mt8188
       - description: MediaTek Genio 1200 Boards (Genio 1200 EVK)
         items:
           - enum:
-- 
2.18.0


