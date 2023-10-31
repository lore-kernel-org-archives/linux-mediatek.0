Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854ADC41535
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 08:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vb24kkSmzFqLkYt275IGRO8kfWGasUiCdUh0M9mkibA=; b=v2d0DzxfRqwSHiq6bCLuj1GOMW
	s5eI3yd6CtZcI9hgzllOn536bcY9bIK8sSC1+Q5Iie+ZATTZ6s3+462ro90DFpT9motmpHgofN+tl
	z8ORc1xxsFX2nZrH8+nXW2wTmyhLIrj5SK1Tt9c2kVrNjNbUx58ACEBQ2/F8QIiENscQHtsGU8KW/
	uK49YlYTbFSQtyow/ALl2mtTCCVTtvfGEsCW/YukVbsBA3EsH8Ic9oUxkUUdmIPWQAy99Y12RkY73
	rAsmHrwQf3QweDso6l24FgFiRsSJkm26ZlJcfWIK0Yz8pzALovmbxtyiHEzAPZyKwFIClFDbtGglg
	av5qxYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkCd-004lmS-0t;
	Tue, 31 Oct 2023 08:34:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkCX-004lf3-2k;
	Tue, 31 Oct 2023 08:34:21 +0000
X-UUID: 43292e1277c811ee86758d4a7c00f3a0-20231031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Vb24kkSmzFqLkYt275IGRO8kfWGasUiCdUh0M9mkibA=;
	b=TgYrSn2rNLIZ0hM2u4DCw6nw9amkPT1uY9UvtmjoOqENdIJjIn7h7bktOXCilnjoE7GT9+1y3sm6jhmLYnRGrruwNrQ7MNUqUo35azQOVG+ez8FAscN+oekZfXnG97HHrNZhUy4qs8LnWkRs1dFAeKp+XURw8VodDF6bcvnMNus=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:e31d182a-ac7a-4b02-9689-c749f2d3c2ae,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:74dc85d7-04a0-4e50-8742-3543eab8cb8e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 43292e1277c811ee86758d4a7c00f3a0-20231031
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2063038057; Tue, 31 Oct 2023 01:34:09 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
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
Subject: [PATCH v9 05/16] dt-bindings: media: mediatek: mdp3: add compatible for MT8195 WROT
Date: Tue, 31 Oct 2023 16:33:46 +0800
Message-ID: <20231031083357.13775-6-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231031083357.13775-1-moudy.ho@mediatek.com>
References: <20231031083357.13775-1-moudy.ho@mediatek.com>
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
X-TM-SNTS-SMTP: 6BA3B0C8D8F4947D1DB81D2675B357AC193575BEA2A7D4134E350EBE33344EBF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_013417_898579_A9C12F4D 
X-CRM114-Status: UNSURE (   9.54  )
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


