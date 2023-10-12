Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8980ECDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sU5EEYWlspN5kkmtOJdylKS0jIRF0xzJLsP+2D3sg2g=; b=dp4WRHWR4pzTbuBZob3SsEUSMz
	ZRtulXXi0Z68RFedSP/bwfz4Yr/5ukncp2kM02N42h7IuNYyQdqUmnKSuRYCp8dTN2FsduyQNF/Mr
	dHeSaT6Yc9zreHsksbzsLltk7yoTi0I9UIVw2YZycs8/qtUzOk3S66em80q/E8AxKA3ErDce+e5ok
	jmqSzLoEAais3L1tNifNMce1LLFZc0YiC8WfEe5K4CzlMfl6nLtNAZZDTCO9HxQQzgCPB1yXpw+UR
	kzz2jG6xk74VapRgVnec/r4IxgK32Nlq9t33dPhruKV3bHEVwSiRgbD9GPQurQmyJk4l6E2zPbhAF
	/efKgj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrZI-000IKb-1M;
	Thu, 12 Oct 2023 09:01:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrZE-000IJY-2z;
	Thu, 12 Oct 2023 09:01:18 +0000
X-UUID: e56ce1d668dd11ee9b7791016c24628a-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sU5EEYWlspN5kkmtOJdylKS0jIRF0xzJLsP+2D3sg2g=;
	b=ZzzzE3Xs2HIuYkO0XjLGRmeNj+6zwx7nS3XAhPwlrbeRryyM0i2m2YFpbN2G5HzvrB+qkOqQ1E4dgoDtZSL4KCvBBNBRZ80Wn2ZFfSON0CpGMK4LxPSJsiKwu3YKv1VQfgEJoZdT6zwzs6rl3+tUHPV0qjG6n5y9Zmt+3NQnKBo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:c296e803-2c58-4c03-8520-60a4d7a08957,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:d960f314-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e56ce1d668dd11ee9b7791016c24628a-20231012
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1013151306; Thu, 12 Oct 2023 02:01:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
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
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Moudy
 Ho <moudy.ho@mediatek.com>
Subject: [PATCH v7 03/16] dt-bindings: media: mediatek: mdp3: add config for MT8195 RDMA
Date: Thu, 12 Oct 2023 16:40:24 +0800
Message-ID: <20231012084037.19376-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231012084037.19376-1-moudy.ho@mediatek.com>
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_020116_967279_55B0956D 
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
---
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index c043204cf210..504334a76fb3 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -22,6 +22,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt8183-mdp3-rdma
+      - mediatek,mt8195-mdp3-rdma
       - mediatek,mt8195-vdo1-rdma
 
   reg:
@@ -58,7 +59,7 @@ properties:
 
   mboxes:
     minItems: 1
-    maxItems: 2
+    maxItems: 5
 
   interrupts:
     maxItems: 1
@@ -98,6 +99,29 @@ allOf:
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
+          items:
+            - description: RDMA clock
+
+        mboxes:
+          items:
+            - description: used for 1st data pipe from RDMA
+            - description: used for 2nd data pipe from RDMA
+            - description: used for 3rd data pipe from RDMA
+            - description: used for 4th data pipe from RDMA
+            - description: used for the data pipe from SPLIT
+
+      required:
+        - mediatek,gce-events
+
   - if:
       properties:
         compatible:
-- 
2.18.0


