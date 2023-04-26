Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92080C7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 05:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfA0LdoxFOdzbOhOzbH0wz/ZeMwbs/1gRdyK3bwQCXQ=; b=yVdel6bnOzH1/y7cSzkCYGO1LT
	WcMtRgcKsiksb7oojeMIm3DUkT4/f/hJ/5hc3Ktum3ooBC89AfOJZXUg8tJIjjzjrYU/xLJxjQQQw
	DSItyGJitKFo+2ZrjabPYd+oM1niRBVhAeu7gsbPgyCw8FMYA3ZhlOvKzVo4ROAMzCu7a+ekEDpbP
	rXdZL/THxaSaiZUBf2D4anuYNmvKop/oHSNMj+7wCWZAp2QCXfPzFgZpCmStuZnj9b/L/8a8KSI6P
	f7G61aQuJ2Kgv/4NUJcbkQ34olyz/cxSitBtfkDyPD2laNFrsTU1uhdRD1SBC4zFTm4uJDMLUKWYl
	fKWtAGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prY45-002rOk-2Q;
	Wed, 26 Apr 2023 05:51:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prY3y-002rKS-2r;
	Wed, 26 Apr 2023 05:51:36 +0000
X-UUID: 6417c0f4e3f611ed8687db9d93187ff1-20230425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MfA0LdoxFOdzbOhOzbH0wz/ZeMwbs/1gRdyK3bwQCXQ=;
	b=oIYAYKr7PqkJ+Fj27YSs6eKSOl0/rOgj7BqAj33l+lzLuXIQOffg6xQQd6d5rSfkHHBpwXTXpQm1O7XYQuuj1lT5c+2JRAR0zuYWqj34Fp0MRrqZHdIwkCVZdP+3ay1S0etrP24RLjnkQefwWXAALdQ7PWGVjjyyWtJUYCBsIkA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:6eb0d20e-fafe-4aed-a577-600f549e5c0d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:6eb0d20e-fafe-4aed-a577-600f549e5c0d,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:c7472dec-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:230426135132K14MMIEE,BulkQuantity:0,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 6417c0f4e3f611ed8687db9d93187ff1-20230425
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 35354925; Tue, 25 Apr 2023 22:51:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Apr 2023 13:51:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 26 Apr 2023 13:51:26 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 7/7] ASoC: dt-bindings: mediatek,mt8188-afe: add audio properties
Date: Wed, 26 Apr 2023 13:51:24 +0800
Message-ID: <20230426055124.16529-8-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230426055124.16529-1-trevor.wu@mediatek.com>
References: <20230426055124.16529-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_225134_949684_56741380 
X-CRM114-Status: GOOD (  10.37  )
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

Add apll1_d4 to clocks for switching the parent of top_a1sys_hp
dynamically. On the other hand, "mediatek,infracfg" is included for bus
protection.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../bindings/sound/mediatek,mt8188-afe.yaml          | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
index 82ccb32f08f2..eb58de8c0e68 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
@@ -29,6 +29,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek topckgen controller
 
+  mediatek,infracfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the mediatek infracfg controller
+
   power-domains:
     maxItems: 1
 
@@ -52,6 +56,7 @@ properties:
       - description: mux for i2si1_mck
       - description: mux for i2si2_mck
       - description: audio 26m clock
+      - description: audio pll1 divide 4
 
   clock-names:
     items:
@@ -73,6 +78,7 @@ properties:
       - const: i2si1_m_sel
       - const: i2si2_m_sel
       - const: adsp_audio_26m
+      - const: apll1_d4
 
   mediatek,etdm-in1-cowork-source:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -184,7 +190,8 @@ examples:
                  <&topckgen 78>, //CLK_TOP_I2SO2
                  <&topckgen 79>, //CLK_TOP_I2SI1
                  <&topckgen 80>, //CLK_TOP_I2SI2
-                 <&adsp_audio26m 0>; //CLK_AUDIODSP_AUDIO26M
+                 <&adsp_audio26m 0>, //CLK_AUDIODSP_AUDIO26M
+                 <&topckgen 136>; //CLK_TOP_APLL1_D4
         clock-names = "clk26m",
                       "apll1",
                       "apll2",
@@ -202,7 +209,8 @@ examples:
                       "i2so2_m_sel",
                       "i2si1_m_sel",
                       "i2si2_m_sel",
-                      "adsp_audio_26m";
+                      "adsp_audio_26m",
+                      "apll1_d4";
     };
 
 ...
-- 
2.18.0


