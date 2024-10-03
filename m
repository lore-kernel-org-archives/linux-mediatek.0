Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF1BCF8555
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 03:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KhrERn+x95fmVwYoycNWzZQMILdQBU+L1WFDe4D2c4=; b=qyseDINuJmsIeeEa7Eq+Hvu2TS
	ow1Kgk9uwbHHe4E8qd9CdlYEsvgYKXlXgSQe2IuP3xwo34Z0AFEZx7EqWliBDOaRbizQZao0s7kQy
	BU4NFEgIOKdZrQJlllINpozvr/+7xFsk/iDjZOKIf0IOTQF7KDcWvIfUC35Mb/6g5FSvh/2GphzlG
	b9rvFw3Gk/nukZcIQ5z5VtP62FsYBdNm4gUCbFb/UTSwofUmcDdIRC89uDxBZWhZqOshlgRFxcfGz
	gdw7GWaHU1bEUCKC90z0PHPe2WhUuCGB6GzuKx28r+sgLM657wAS+p44Qijt/Li9wt2y+tqCMcLGZ
	UDezuKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swCEw-000000083Gt-33Ph;
	Thu, 03 Oct 2024 03:10:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swCDe-000000082vF-1Trj;
	Thu, 03 Oct 2024 03:09:35 +0000
X-UUID: e77c2f84813411efb3adad29d29602c1-20241002
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0KhrERn+x95fmVwYoycNWzZQMILdQBU+L1WFDe4D2c4=;
	b=H2PRcJarZfgkj83veVJL8Ap65D1C09uePxPBx8jWi1OF5wCI7XbnEw0cwuDkCWFb6IvNx+QxOcU4mqiAs/umgIgAoaUq+ar4hW/vhGg3y5uiifi7H6t13Cj5fYrq7oddQhf8SNRQTue1o4cNuUZ4aMFnERDcWMaNId3H/LkyAiw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:48e29c93-87af-4e0b-8308-aacddcced430,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:6dc6a47,CLOUDID:5bc9c1b1-6e7c-4b8d-ba9a-fdc1bd14cd31,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1|19,IP:nil
	,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: e77c2f84813411efb3adad29d29602c1-20241002
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 459202983; Wed, 02 Oct 2024 20:09:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Oct 2024 20:09:25 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Oct 2024 11:09:25 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, Joerg
 Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rohit
 Agarwal <rohiagar@chromium.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen
 Chu <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v6 4/4] dt-bindings: display: mediatek: dpi: correct power-domains property
Date: Thu, 3 Oct 2024 11:09:19 +0800
Message-ID: <20241003030919.17980-4-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241003030919.17980-1-macpaul.lin@mediatek.com>
References: <20241003030919.17980-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_200934_429090_4166033E 
X-CRM114-Status: GOOD (  17.11  )
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

Changes for v6:
 - No change.

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


