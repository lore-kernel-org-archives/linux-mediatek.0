Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B9DCF3195
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 05:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bg67y45sJLDWjIhf42JgILUWAHQQxL5OwkXAp+pyoUM=; b=gr4akkOv5VBQv+iB6fWAbXMKvR
	bo7xZKngO1PJPyp6RVo5C3Of/1wCuzHbPETmf3TR5cyZh6sxvKMYhbqjGOFdQufr7P6qWmwEBe2HU
	UashsI0CNAHr5LSv7uEJE5tuadMk3rJ/9+mXtXX6UgTYhHPxVjt2ITj/iR6V3r/2prOu8uAk+71sx
	uf+IL99MfS24+yW7K1AIKXJHoRuS75m906bSJQdc9RrVe2dkfURLqmKhiijJdFu6KJMA/rCfQyqcU
	ZMHDFwaUbXAxxhMrY3DyUJ+cJ49w5fksrNwn8tWjYgtCkBRcwzEw5LQdbswL8rq+79l9bb4GcDnEA
	11cWTNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svrlZ-00000004pol-3x8g;
	Wed, 02 Oct 2024 05:19:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svrj3-00000004pI2-3mbH;
	Wed, 02 Oct 2024 05:16:40 +0000
X-UUID: 7c3d9ecc807d11efb3adad29d29602c1-20241001
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Bg67y45sJLDWjIhf42JgILUWAHQQxL5OwkXAp+pyoUM=;
	b=TL/sHVuJ/HkEd0sGs5OyZ8Wm2AgpNJgS29R3/mC1HDOSSnP4iFS9MZPUCyVnzAj1lRv0wjMm9dQ7+/ZxVcEAG/izkWf/9Vegvge6AYD5OMA8TsWRa10zKDHGVGrciYjllEtfUz7/unR29FQIpplLIcovNeBdDVUXQqZFME+R2tI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:5f4a8cbe-8c45-488e-ab73-dabbaac0a47f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:6dc6a47,CLOUDID:1b1de09e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1|19,IP:nil
	,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7c3d9ecc807d11efb3adad29d29602c1-20241001
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1309960684; Tue, 01 Oct 2024 22:16:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Oct 2024 13:16:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Oct 2024 13:16:27 +0800
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
	<wenst@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v5 5/5] dt-bindings: display: mediatek: dpi: correct power-domains property
Date: Wed, 2 Oct 2024 13:16:20 +0800
Message-ID: <20241002051620.2050-5-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241002051620.2050-1-macpaul.lin@mediatek.com>
References: <20241002051620.2050-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.634400-8.000000
X-TMASE-MatchedRID: qW4A1GTxjidpqqYAQ+J6uSYRREGYqtmUmoKXVHfiMM9KUzR+o2IehUGW
	yClQhQkvKY6B7sY8Ci7dRIKCUEZlk77J5yv1W35KY1bQMCMvmn4wCmrLlx+Sdd9RlPzeVuQQ5Jl
	eqmLDfgeWjiti7ndJY6woSk24kDBQaxXbwRJk57z0hv/rD7WVZA+jS+LRpl81pzPA3TKVblhgIS
	cCiWkKENIS3Y3mrYfnGcJ+wyELRguQwm5+b+ZNPWwbuvhCHs3cmyqQJWNsuklnuv8pVwMzSaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrfkaNMSfS/D+K5v8OQfnaBP6qsC2xx+Wmy4ZRUSszZeETiVC
	Ktsw/v8=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.634400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 08878B16980C801A2C015D8BC46D98EC4BC1ADCE8371B370D402AF6CB3CBE6B22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_221637_986305_A45F76D3 
X-CRM114-Status: GOOD (  16.65  )
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

The MediaTek DPI module is typically associated with one of the
following multimedia power domains:
 - POWER_DOMAIN_DISPLAY
 - POWER_DOMAIN_VDOSYS
 - POWER_DOMAIN_MM
The specific power domain used varies depending on the SoC design.

These power domains are shared by multiple devices within the SoC.
In most cases, these power domains are enabled by other devices.
As a result, the DPI module of legacy SoCs often functions correctly
even without explicit configuration.

It is recommended to explicitly add the appropriate power domain
property to the DPI node in the device tree. Hence drop the
compatible checking for specific SoCs.

Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power domains")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../display/mediatek/mediatek,dpi.yaml        | 24 ++++++++-----------
 1 file changed, 10 insertions(+), 14 deletions(-)

Changes for v2:
 - Because of the corresponding dts fix has been reviewed with a Reviewed-by: tag.
   [1] https://lore.kernel.org/all/20240925080515.16377-1-macpaul.lin@mediatek.com/
   We still need this change to fix the 2 dtbs_check errors.
   So keeps no change here.

Changes for v3:
 - The origin patch is [2]
   https://lore.kernel.org/all/20240926111449.9245-2-macpaul.lin@mediatek.com/
 - Thanks for Conor's reminding, after MediaTek's internal discussion,
   This patch v3 is the replacement of [2] v2.
   Because the DPI module should has a explicit configuration with power domain.
 - Drop Acked-by: tag since v3 is nearly a new patch for different approach.

Changes for v4:
 - No change. Please help to review it again.

Changes for v5:
 - Add missing Reviewed-by Tag from Krzysztof. Thanks.

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 3a82aec9021c..497c0eb4ed0b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -63,6 +63,16 @@ properties:
       - const: sleep
 
   power-domains:
+    description: |
+      The MediaTek DPI module is typically associated with one of the
+      following multimedia power domains:
+        POWER_DOMAIN_DISPLAY
+        POWER_DOMAIN_VDOSYS
+        POWER_DOMAIN_MM
+      The specific power domain used varies depending on the SoC design.
+
+      It is recommended to explicitly add the appropriate power domain
+      property to the DPI node in the device tree.
     maxItems: 1
 
   port:
@@ -79,20 +89,6 @@ required:
   - clock-names
   - port
 
-allOf:
-  - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              enum:
-                - mediatek,mt6795-dpi
-                - mediatek,mt8173-dpi
-                - mediatek,mt8186-dpi
-    then:
-      properties:
-        power-domains: false
-
 additionalProperties: false
 
 examples:
-- 
2.45.2


