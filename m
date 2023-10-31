Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1F6C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GuaatKpJJKQ8P3UzwE+5PZkOWfDZVusyH/8yORVTn1k=; b=Dv+IMsvoE3KGHevvodOrklIyB4
	uOTL9/Oio6a64DUg6Zt3yWGPQifnTR+gxeun4yK5QwxBhoxFRaeuGXg4b0kNi1R+Yi9/RvvZNG2tk
	I73sXGEKZ5d+2e50EbeyQHzcko7FkrBGj9joMApF12+kfEZNOrp0W4vlHjdJPTUkGuo7YkQHx1eNQ
	l+lSmXjDrmFwFTRIhVMDn+tYYvGBF3patxxBTF7HFoqnNJy3kw3BGT4pMvP2IHLv/ZQA00xhYeiGr
	4uK1Hw5i9zZ1T2t/eKqk+d31RiRhAH4nMPFZuvwT2U9pDgExXSbMNKxrSJHDz7S2dW/jOjJ+luYXp
	MN7kM3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkWK-004oQa-1J;
	Tue, 31 Oct 2023 08:54:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkWH-004oPs-08;
	Tue, 31 Oct 2023 08:54:42 +0000
X-UUID: 1e21b7da77cb11ee9b7791016c24628a-20231031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GuaatKpJJKQ8P3UzwE+5PZkOWfDZVusyH/8yORVTn1k=;
	b=NuICN6GsegAlnDszhWA3doFlY+XyBeA3O3Z6rLOpXJL+KXa0ffrGhFyqIjHNt9GD7tqFyL32MScKwQWQqXLfyxpy2/ZdbjlK2AnkjuKILmfo9bIyLqkVsfoyDoRKFJFA6FU/H7LqTeE0uImelkjHrKbhtvB+uJzFg9M8qq7p1DQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:8a0d4f13-c26f-4567-a911-4ab77b825237,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:b107fafb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1e21b7da77cb11ee9b7791016c24628a-20231031
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1774287905; Tue, 31 Oct 2023 01:54:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 31 Oct 2023 16:33:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 31 Oct 2023 16:33:59 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Moudy
 Ho <moudy.ho@mediatek.com>
Subject: [PATCH v9 04/16] dt-bindings: media: mediatek: mdp3: add compatible for MT8195 RSZ
Date: Tue, 31 Oct 2023 16:33:45 +0800
Message-ID: <20231031083357.13775-5-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231031083357.13775-1-moudy.ho@mediatek.com>
References: <20231031083357.13775-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_015441_092433_1AB9A177 
X-CRM114-Status: GOOD (  10.29  )
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

MT8195 RSZ inherited from MT8183, add the corresponding
compatible name to it.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/mediatek,mdp3-rsz.yaml        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
index 78f9de6192ef..f5676bec4326 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
@@ -15,9 +15,13 @@ description: |
 
 properties:
   compatible:
-    items:
+    oneOf:
       - enum:
           - mediatek,mt8183-mdp3-rsz
+      - items:
+          - enum:
+              - mediatek,mt8195-mdp3-rsz
+          - const: mediatek,mt8183-mdp3-rsz
 
   reg:
     maxItems: 1
-- 
2.18.0


