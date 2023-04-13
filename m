Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A81C77B6F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gg5XIv0JoxYh7+Q/MXFr/X6SWUKuH88SYwHbABhmj9Y=; b=XeENh1krV2EiynzHAMcV2QcXxh
	OgZ8ntdIlSo1mC8M/QVuxsO1BGYZgiTWg2DCJDs2YS7ayJEBpdfUZIe6Y2sI5K0xS77TUmezmIPU4
	UvlvsV/kJ1h6j+fBZM9MPBrJmA/lgXf1gDg/Xg8HZQzgrVugWuPxSErlIXc1dGFeakvFvTGQpako6
	W1x7094qTBNrIUdNta3+duaw3Y9zqNvk3rRPnbqeIL/H2lZm4dFkc2jfdn15FNH6/lk6KgOFDwLjg
	dj3z6Y2Vimj92q44zBysX73WeNA3tqIE+sMpaVxd+aX086wfzpmjB/mdYghPjXvfmkXCuVGKPMJyg
	5iA8UMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuUP-005ukz-2S;
	Thu, 13 Apr 2023 10:47:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuUE-005ufp-1M;
	Thu, 13 Apr 2023 10:47:32 +0000
X-UUID: 921bf6ead9e811edb7d8d11f642b8e78-20230413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gg5XIv0JoxYh7+Q/MXFr/X6SWUKuH88SYwHbABhmj9Y=;
	b=SvUp+XcAtYKDtvp6YSsytflb2YVFvLuJYu3mCWxDDunScK075N8hvAtEeVE/CZon2nrtRHm2PkTx7/tLLBpM4TpnmpkcVu71L5ALCZFifnhjGpXkHM10PTwuaMSEyVRmItGYJhAUdQhckzfAJHSGfJGi9uKOB8/ZT8HKqjixHj4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:0566b545-9ba0-4d73-b985-f5dcd3d8492b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:3abc37a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 921bf6ead9e811edb7d8d11f642b8e78-20230413
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 931579528; Thu, 13 Apr 2023 03:47:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 18:47:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 18:47:18 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 7/7] ASoC: dt-bindings: mediatek,mt8188-afe: add audio properties
Date: Thu, 13 Apr 2023 18:47:13 +0800
Message-ID: <20230413104713.7174-8-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230413104713.7174-1-trevor.wu@mediatek.com>
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_034730_461226_1E5413F1 
X-CRM114-Status: UNSURE (   9.05  )
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

Assign top_a1sys_hp clock to 26M, and add apll1_d4 to clocks for switching
the parent of top_a1sys_hp dynamically
On the other hand, "mediatek,infracfg" is included for bus protection.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../bindings/sound/mediatek,mt8188-afe.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
index 82ccb32f08f2..03301d5082f3 100644
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
 
@@ -37,6 +41,7 @@ properties:
       - description: 26M clock
       - description: audio pll1 clock
       - description: audio pll2 clock
+      - description: audio pll1 divide 4
       - description: clock divider for i2si1_mck
       - description: clock divider for i2si2_mck
       - description: clock divider for i2so1_mck
@@ -58,6 +63,7 @@ properties:
       - const: clk26m
       - const: apll1
       - const: apll2
+      - const: apll1_d4
       - const: apll12_div0
       - const: apll12_div1
       - const: apll12_div2
@@ -74,6 +80,12 @@ properties:
       - const: i2si2_m_sel
       - const: adsp_audio_26m
 
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
   mediatek,etdm-in1-cowork-source:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -147,6 +159,8 @@ required:
   - power-domains
   - clocks
   - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
 
 additionalProperties: false
 
@@ -170,6 +184,7 @@ examples:
         clocks = <&clk26m>,
                  <&apmixedsys 9>, //CLK_APMIXED_APLL1
                  <&apmixedsys 10>, //CLK_APMIXED_APLL2
+                 <&topckgen 136>, //CLK_TOP_APLL1_D4
                  <&topckgen 186>, //CLK_TOP_APLL12_CK_DIV0
                  <&topckgen 187>, //CLK_TOP_APLL12_CK_DIV1
                  <&topckgen 188>, //CLK_TOP_APLL12_CK_DIV2
@@ -188,6 +203,7 @@ examples:
         clock-names = "clk26m",
                       "apll1",
                       "apll2",
+                      "apll1_d4",
                       "apll12_div0",
                       "apll12_div1",
                       "apll12_div2",
@@ -203,6 +219,8 @@ examples:
                       "i2si1_m_sel",
                       "i2si2_m_sel",
                       "adsp_audio_26m";
+        assigned-clocks = <&topckgen 83>; //CLK_TOP_A1SYS_HP
+        assigned-clock-parents =  <&clk26m>;
     };
 
 ...
-- 
2.18.0


