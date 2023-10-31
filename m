Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFA1C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 08:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gsqcfd85Q6zMJMfP8HzmSlifHtyjYo/vIuwiYWQflu4=; b=YHLam7uqL57Iu9rZwyS5M1GIzB
	4vK377U9R4LW5eJ9OHUzP7ttoNnQgghmQHz9nA1IiMee4tk7gih5W3/IE+gmGBP7W1hP4MCxXRxp5
	+gtdpYHZAu/fI0NKurRb8O7DC4z/f7i6aL5lodKgQ1xP/srrRGOZqJkJ0oexKbRDRQW2XpAcBcpmr
	W0O1Co643YEsqyZ+Cyb0nIlkrMrvGH0/wqIRwXz/JqcSDBI8XKAMYBqTIw91ctgWISZp7X9pYFNSr
	XCAV9ofrBs7Xs93yAYgLRc9rCxyrx4lHgR7nAQ8VvZplw3SkXgP6Hm9g4TfbszeupWYVm5F6Gpbt9
	9zDidEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkCR-004lZv-2y;
	Tue, 31 Oct 2023 08:34:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkCO-004lYZ-0n;
	Tue, 31 Oct 2023 08:34:09 +0000
X-UUID: 3ebbddb677c811ee9b7791016c24628a-20231031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Gsqcfd85Q6zMJMfP8HzmSlifHtyjYo/vIuwiYWQflu4=;
	b=oufODS147+SJRo4ToCaGP+D0ejJ6UDTOzQlvFA4X7gOv+NYQy/EpeP4SEOiLPVKDJC0JoTxS9Hf/yizQr1wFadnQRsRD56H+0YdNEcw9fMgdimDcS9JBpwgiBFLkf9rkI/I6EcuMAa8HSRVtJnyHVrjagBj5vq3wNcMo4CKVjU8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:b3304f02-761c-4fbb-b3ea-a93099fd46bf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:12dc85d7-04a0-4e50-8742-3543eab8cb8e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3ebbddb677c811ee9b7791016c24628a-20231031
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1866498399; Tue, 31 Oct 2023 01:34:02 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 31 Oct 2023 16:33:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 31 Oct 2023 16:33:58 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Moudy
 Ho" <moudy.ho@mediatek.com>
Subject: [PATCH v9 03/16] dt-bindings: media: mediatek: mdp3: add config for MT8195 RDMA
Date: Tue, 31 Oct 2023 16:33:44 +0800
Message-ID: <20231031083357.13775-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231031083357.13775-1-moudy.ho@mediatek.com>
References: <20231031083357.13775-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.708700-8.000000
X-TMASE-MatchedRID: ANwZAW3tAaok8jpRZkMC+dYpUOCigMK3QKuv8uQBDjr/evmlVf9xZpeS
	PuHyHNrhj6kCfX0Edc5fvtuIsaf1ZRUyniZSq5xegNMFzGNLElDlOkM7VYqzaZsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNUDUSn95NqmT2TZ/FUz+0QM85sUeDXgIYLwg/VM4b/Vtnq1SwwsENorA8O
	m+k4sSDMuMLCIhEz/LndAL4Ry6+kYDty5ERD23gKCjNWMcfCKKdATQdtPksR+3/JiWOe6GXXSWg
	Q2GpXdZhztLVWA1eE9DDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.708700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 49B687300759B140B04CFD0DF43C505CF2BB465597ED38056A3138C5D5A5E94D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_013408_312032_211DCF39 
X-CRM114-Status: UNSURE (   9.12  )
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

Added the configuration for MT8195 RDMA. In comparison to MT8183, it
no longer shares SRAM with RSZ, and there are now preconfigured 5 mbox.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index 13f915d4d76f..0a897431561b 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -22,6 +22,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt8183-mdp3-rdma
+      - mediatek,mt8195-mdp3-rdma
       - mediatek,mt8195-vdo1-rdma
 
   reg:
@@ -62,6 +63,9 @@ properties:
     items:
       - description: used for 1st data pipe from RDMA
       - description: used for 2nd data pipe from RDMA
+      - description: used for 3rd data pipe from RDMA
+      - description: used for 4th data pipe from RDMA
+      - description: used for the data pipe from SPLIT
     minItems: 1
 
   interrupts:
@@ -98,6 +102,23 @@ allOf:
         - mboxes
         - mediatek,gce-events
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-mdp3-rdma
+
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        mboxes:
+          minItems: 5
+
+      required:
+        - mediatek,gce-events
+
   - if:
       properties:
         compatible:
-- 
2.18.0


