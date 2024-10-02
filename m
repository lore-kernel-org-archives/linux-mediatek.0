Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1647CF3194
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 05:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhSCBraMwebJsTv0yxGJcPfygdTG0wZoxm8bZkDpOds=; b=0Ff8W2GrK2+L/CjSCAP5JN4P4H
	4+33/9xwVmFFi6+dGFYrBGdPh3aGNDZ4kJ4NcIM7KIkTAk3AYkkjNyKlmGWA4b6GlPsXL2YP6SeTw
	OJhNVsouqCT+nXntXR8PwWDWVDviMChCcDU34QjgdNa7S+TD8LxnbqkuUa4aIRgmfAzGFsj8ShLo0
	WxXcQXUaPHW/YMlHyFrfQJ1OcYrygh0UN+Bpmb63ay+sTCL37hTWyfrJ5g5qxQT8j9EVlmYilc5v5
	nxLep7/dhvwa3m+CKGxuw3DqDYc2YGY1zOOjiJq/3rqI7mc226q6tILYg+nThOJU0qwWyZqb0JI1a
	QwDpxQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svrnx-00000004q2s-1khV;
	Wed, 02 Oct 2024 05:21:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svrj5-00000004pI1-2CuB;
	Wed, 02 Oct 2024 05:16:42 +0000
X-UUID: 7c04566c807d11efb3adad29d29602c1-20241001
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hhSCBraMwebJsTv0yxGJcPfygdTG0wZoxm8bZkDpOds=;
	b=kWB2Pu5HtoV2FkTXuDYCA9V9RAvvofItZ3/UphOcLBQ76IXIG2tkU8x6xQl4f/ShBuxg+wesHiUWaZQ8VVmZ8It+rvECwLlwm4oymd4VWEM0UM1NPp4/G4J60TfhvrEVdj/ZrLLgrCUO4S/mOdsf51w66gg/OzuNZTLhtylBtYU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:1ed8b6b3-08ff-4905-be5f-ab371fa1a896,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:ff3c93bd-085c-4112-81e0-4d6de274b71a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1|19,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7c04566c807d11efb3adad29d29602c1-20241001
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1324919393; Tue, 01 Oct 2024 22:16:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Oct 2024 13:16:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Oct 2024 13:16:26 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rohit
 Agarwal" <rohiagar@chromium.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, "Sen
 Chu" <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH v5 2/5] dt-bindings: iommu: mediatek: Fix interrupt count constraint for new SoCs
Date: Wed, 2 Oct 2024 13:16:17 +0800
Message-ID: <20241002051620.2050-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241002051620.2050-1-macpaul.lin@mediatek.com>
References: <20241002051620.2050-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.056800-8.000000
X-TMASE-MatchedRID: P0y1Pz0bU7nwBTQ+XvV6VYzb2GR6Ttd3YQXxsZnRwoIY0A95tjAn+9EQ
	LJPlYQqE0KHDXPxFjpCs8FHZk8InNB1YpEPWJiyzKaMQ6tw7oDLFUZ7q8HqQFFwpnAAvAwazMq+
	en+OaNuuJTSQ4G0hWQLlh5xXch+ETbC1/2cudIH8ve6W+IORwrePmXK6rwg5BzsQ8iRVyD45ZoZ
	UwtnkREuLzNWBegCW2wgn7iDBesS1YF3qW3Je6+yJGz/iQlWEgbjQ3HsjeQ9VvX1BD59umeavcA
	mjImT522QK4L+FfNK00VrGYKV5cSQ2TVMfnleX9CaN5RfGxsx4o8fxKaOKaUoSVUZZHNLr+RgV6
	Hsqyx11QaONuZ6Jr4g9k3l8EaYIcovpDXVQHzIN+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.056800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9854A0E68FA650A45118D093163C2FB7619D4D4BDDE09EA56A531646E776FEF52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_221639_711116_06898CAD 
X-CRM114-Status: GOOD (  13.16  )
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

The infra-iommu node in mt8195.dtsi was triggering a CHECK_DTBS error due
to an excessively long 'interrupts' property. The error message was:

  infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0],
                     [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]]
                     is too long

To address this issue, update the compatbile matching rule for
'interrupts' property. This change allows flexibility in the number
of interrupts for new SoCs like MT8195.
The purpose of these 5 interrupts is also added into description.

Fixes: bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../bindings/iommu/mediatek,iommu.yaml        | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

Changes for v2:
 - commit message: re-formatting and add a description of adding 5 interrupts.
 - add 'description' and 'maxItems: 5' for 'interrupt' property of
   'mt8195-iommu-infra'
 - others keeps 'maxItems: 1'

Changes for v3:
 - Refine the description for 'interrupts' property and fixes the compatible
   matching rules.
 - Refine commit message.

Changes for v4:
  - add missing 'minItems: 5' to 'mediatek,mt8195-iommu-infra'.
    Thanks the explanation from Conor and Krzysztof. 

Changes for v5:
  - Repharse the description for interrupts property of MT8195.

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index ea6b0f5f24de..df8b2429008e 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -96,7 +96,16 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    description: |
+      Usually, the IOMMU requires only one interrupt.
+
+      The infra IOMMU in MT8195 has five banks: each features one set
+      of APB registers. One for the normal world (set 0), three for the
+      protected world (sets 1-3), and one for the secure world (set 4).
+      and each set has its own interrupt. Therefore, five interrupts
+      are needed.
+    minItems: 1
+    maxItems: 5
 
   clocks:
     items:
@@ -210,6 +219,24 @@ allOf:
       required:
         - mediatek,larbs
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8195-iommu-infra
+
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+          maxItems: 5
+
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.45.2


