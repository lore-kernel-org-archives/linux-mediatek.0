Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9376DC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 10:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhfk3FqNlNnTIC11+3AiswpDac8u08Q0N1jKnCvU8fs=; b=xHpbDP5HO3C1eA/4m2EQ2XUWqX
	A667AjsEFtS6mqn22dQiRWp+QFhFFzG6gRQ6cGLqXhSuTtefpQsbJD6Slcb392yZ3nAi/8f6+UrD8
	k+nZi4JBRESKzTlKfIwZDRNlCctfBcIw8Ek45XVu+UZIBrv2uQdR/a1a1wGyeMBRR1yLHtqOhrjZi
	u5fKo9Cv8uC+QSFoijRnSp0fHFX8YzwZdZXh1Vm/S73E5IejqqbQxPhoLRfONmlMGi9ZFhS7CVXPP
	E0k5LGsErvntpOejbNjtmySfHNtl7FZ7Du3gGPvdjzckLZCe73KIyB5EPY/FqRSWd7sN2c4IfTV+2
	/9JJEQww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtVr-00Gq2j-1G;
	Wed, 20 Dec 2023 10:09:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtVe-00Gppf-2x;
	Wed, 20 Dec 2023 10:09:05 +0000
X-UUID: ca2856da9f1f11ee958cff29c719f35b-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mhfk3FqNlNnTIC11+3AiswpDac8u08Q0N1jKnCvU8fs=;
	b=haMzCh1DObPNY0aHo4JfO1Z6rkMKdflNUIEXNkEOfzyrl5soMjCYt+2CCznyMtLkRTqfM9dwQDNuw5vt9qsku+qufYXdPRjVUgnPkEhWX/HZlr1tfmA5e1IynOgYbxpmsPaW5N9OOAV74Mhp/O7NOyDY6hniMi6RtPzMFDUoxCE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:a2292a81-902b-478a-b320-943efcae0202,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-35
X-CID-META: VersionHash:5d391d7,CLOUDID:7f5d618d-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,D
	KR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ca2856da9f1f11ee958cff29c719f35b-20231220
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 707528251; Wed, 20 Dec 2023 03:08:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 18:08:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 18:08:55 +0800
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
Subject: [PATCH v10 03/16] dt-bindings: media: mediatek: mdp3: add config for MT8195 RDMA
Date: Wed, 20 Dec 2023 18:08:40 +0800
Message-ID: <20231220100853.20616-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231220100853.20616-1-moudy.ho@mediatek.com>
References: <20231220100853.20616-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_020902_962519_B7F74D16 
X-CRM114-Status: GOOD (  10.89  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index e9955639ce19..f9ca66413d51 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -22,6 +22,7 @@ properties:
   compatible:
     oneOf:
       - const: mediatek,mt8183-mdp3-rdma
+      - const: mediatek,mt8195-mdp3-rdma
       - const: mediatek,mt8195-vdo1-rdma
       - items:
           - const: mediatek,mt8188-vdo1-rdma
@@ -73,6 +74,9 @@ properties:
     items:
       - description: used for 1st data pipe from RDMA
       - description: used for 2nd data pipe from RDMA
+      - description: used for 3rd data pipe from RDMA
+      - description: used for 4th data pipe from RDMA
+      - description: used for the data pipe from SPLIT
     minItems: 1
 
   interrupts:
@@ -109,6 +113,23 @@ allOf:
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


