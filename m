Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ED6C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vb24kkSmzFqLkYt275IGRO8kfWGasUiCdUh0M9mkibA=; b=UYc2s3qk8WWoR3l7kuA0pbotL0
	7aQCvSKpNWy2Ut5b64sh2QaXAb09uJbaXcKSLUPG2aQqmAWVSu9rmE6qNjIufTNXc+sM0hK17TeRV
	QnvwxuMj2L2Z2pnX8OrFB2uwKZYzYeuFMU6zRdBEovAI3Irwmzz1dPhRkZ5uxFO0xmi2rIhsAR2fd
	RGTIt1XcX4CWCeHhkG8pabzO7DPur1U/wx2vfrc/pWopFxLHs2QDSn7q+ObsdtI1csJtWWb3r3i39
	EihJN6QQ07D8x5sTOjZoHRlJMgOmvMkMqyADh1S1HJlZr9OLl2nEd6faJ8426YfiuzJRyPfrC0SN+
	Z4XoEJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxP5S-002yuh-2R;
	Mon, 30 Oct 2023 10:01:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxP50-002yXW-2n;
	Mon, 30 Oct 2023 10:01:12 +0000
X-UUID: 3a548f1a770b11ee9b7791016c24628a-20231030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Vb24kkSmzFqLkYt275IGRO8kfWGasUiCdUh0M9mkibA=;
	b=cz8KbRmE809VyeKtXsd2hQJjie8LYpcPLi//xgyDqyOX5/gWl35rQs8KP4GnNXENVchLl9oUZUixo4uGzQI6kjOecJsC624fl+C2L7uH3NLtyBsnVOkud6SfOO6cPzPyrqJwqreYQsr7ZhbQrYndoMnjB2gx3thxN8LF+t02FT8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:069a7f6a-e27d-495e-a2d6-29a5341c4d4f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:40c5cb94-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3a548f1a770b11ee9b7791016c24628a-20231030
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 196460969; Mon, 30 Oct 2023 03:01:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Oct 2023 18:00:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Oct 2023 18:00:23 +0800
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
Subject: [PATCH v8 05/16] dt-bindings: media: mediatek: mdp3: add compatible for MT8195 WROT
Date: Mon, 30 Oct 2023 18:00:11 +0800
Message-ID: <20231030100022.9262-6-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231030100022.9262-1-moudy.ho@mediatek.com>
References: <20231030100022.9262-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.551500-8.000000
X-TMASE-MatchedRID: cAwOsowI+VIDh1tb/sWFHED6z8N1m1ALTJDl9FKHbrmYBF1C0J2QPjQz
	47GqDWjpxMujmXyGahWAMuqetGVetnyef22ep6XYro1URZJFbJug7sWlw3XsXlfh9ESKeQDv1jG
	8ZsDHeH7T/jdn/4Yucx21lASq3oFNV576su74nzHxfCoIocRdvUEyMtVsBYOoljIESwJjC1eOh+
	wyNBrFXDJiNuKohDcKzKSG3JdyKAPqtV2AGMNPavWdclq8lU1q
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.551500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DAAA71397983D472F97DB71C9C2BBF27E7EAD127AA1673109FCD3EF250F2D3152000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_030106_939907_3A27A795 
X-CRM114-Status: UNSURE (   9.09  )
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

MT8195 WROT inherited from MT8183, add the corresponding
compatible name to it.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/mediatek,mdp3-wrot.yaml       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
index 64ea98aa0592..53a679338402 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
@@ -15,9 +15,13 @@ description: |
 
 properties:
   compatible:
-    items:
+    oneOf:
       - enum:
           - mediatek,mt8183-mdp3-wrot
+      - items:
+          - enum:
+              - mediatek,mt8195-mdp3-wrot
+          - const: mediatek,mt8183-mdp3-wrot
 
   reg:
     maxItems: 1
-- 
2.18.0


