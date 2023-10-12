Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68368CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWFyCiicj39sUxQv9CnWjC1tBy0Hri5NcSqxRkzu0Ss=; b=AXH8AgSRPaCaYVk9IgQ5Ii4QgP
	jmEcQvmt0/mzOMmkdrwziAqzQ+6S9/K1tcdgDcnMoM67B3Mnv6TgcAs8cs6mGAkP6Lkhm4eQT/2Fv
	Zi5ziXGuJwQVMQnCU0yHH/TZS7CE5yn2jbC1I+Mh6zRqUkwZxtocCr4DLouvWrGmzw+HapNeLZZkD
	gsds0mLBozSkcMTdDNqRZPMmoxH7/yhqRhkkLUpB67Pv8mNFIwCGnYkVyzLD5nlS+5SFeZA3SBUo0
	xp0HBMEdBnur9mdFu1oImgmoSbX1nG85GytrwHDW4EspoO99fAAKvXt0WyIhUp7OZXTnsc2T6v4eo
	JK4pP1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsGH-000Qok-1j;
	Thu, 12 Oct 2023 09:45:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrG3-000DLV-2W;
	Thu, 12 Oct 2023 08:41:29 +0000
X-UUID: 1e70ce6468db11ee9b7791016c24628a-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MWFyCiicj39sUxQv9CnWjC1tBy0Hri5NcSqxRkzu0Ss=;
	b=iFqAQCSAFOwyytuxkLOmqJSdmi+e6f8BcRj02dSNx9AVWR72vs6BVMJ5KEbgH9pupGeOTkEi/W77DfX6gI4QB0lzMjt1z4SlSQPdt2xeYApUplsbGDmdESTIMcvq8i9YDq8/8MMnzpVn8sEvT3Yp9VYIG5lXPfjnE7GQ4ufkDCg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:2c2cf61a-2443-4137-b780-2b2435b360ce,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:b2dfd8bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1e70ce6468db11ee9b7791016c24628a-20231012
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 877875975; Thu, 12 Oct 2023 01:41:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Oct 2023 16:40:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Oct 2023 16:40:39 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Moudy
 Ho" <moudy.ho@mediatek.com>
Subject: [PATCH v7 04/16] dt-bindings: media: mediatek: mdp3: add compatible for MT8195 RSZ
Date: Thu, 12 Oct 2023 16:40:25 +0800
Message-ID: <20231012084037.19376-5-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231012084037.19376-1-moudy.ho@mediatek.com>
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.519300-8.000000
X-TMASE-MatchedRID: jhJi18RLqAIdj9vNGYhpkSmjEOrcO6AyFuNF4lJG6xtqXTlXpEy00aPF
	jJEFr+olAmPpbGBYlhvkwjHXXC/4I66NVEWSRWybBYrOm8wcgAgH9t0pBydIMHH0sxhCh8dBhhq
	AZqrjLCoBpPFIMRIW1wOez9WygIisH1M1nGtXSytvtgJmb1gxM9urduiIJaUEjofsMjQaxVwyYj
	biqIQ3CsykhtyXcigD6rVdgBjDT2r1nXJavJVNag==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.519300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3BD59FFC53B881691F4FE3F4FDBDF5E43A2FCA457F2769B520212BD571532D4D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_014127_848034_4C6C947C 
X-CRM114-Status: UNSURE (   9.52  )
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

MT8195 RSZ inherited from MT8183, add the corresponding
compatible name to it.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
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


