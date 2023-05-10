Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9B8C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 03:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddcLOnX/BO6Na/TZ45he0GMlEEE79LI3w2KyhqO/UCY=; b=SrTdbfKWs5FStvqycWpCwLqDX8
	ZevLOsJjjrIGZP3pEanzBKrhxXmm6fdHgkHt30MjHTaL2MJXGBITth65gZ2P4ye4HHVCW10oLXUvp
	fJz6Kc77EeN54U9p2mTLcaD35fxaaWG5gArKilm4mmvPKf4hTvqkvGV++b16N+zZk+8auBDfZY6jq
	X/mKEq10IkNW4WK22K4i5QlZheEPmJ3JXD8iXc+LG0ZqukHDBLWkmKJYJbLEmfSOZGiyMuvhIn+iE
	ymmkLDsztDcg94zMVMFgTfCoV7VOfCxa/hxedhCD0FoBgh65LpDLmuMP9lXE0LKzhHWAQmVJuHGRU
	Mt0GLuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwaw5-004xgH-0V;
	Wed, 10 May 2023 03:56:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwavx-004xb9-25;
	Wed, 10 May 2023 03:56:12 +0000
X-UUID: 95e32ae2eee611ed912e1518a6540028-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ddcLOnX/BO6Na/TZ45he0GMlEEE79LI3w2KyhqO/UCY=;
	b=uz2k0e4aVvaX2AeJrNAt7/ReltNgN60+zho6nRjN5F0Disja+hTPLZuOynC1g5oOKbnNWbmdKbpmu5txRAajVAmoRclMhphXrW5uq+xQWlJbQ84HHJesSYIKUz2W4Qvg4FckEgyJrG4YFlG3PuSiSok+FCcpBHkhfe23m27x1A4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:19cedbae-b3ef-469a-8dea-2da48e1effc9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:178d4d4,CLOUDID:e022516b-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 95e32ae2eee611ed912e1518a6540028-20230509
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1351517829; Tue, 09 May 2023 20:56:04 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 May 2023 11:55:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 11:55:29 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 9/9] ASoC: dt-bindings: mediatek,mt8188-afe: add audio properties
Date: Wed, 10 May 2023 11:55:26 +0800
Message-ID: <20230510035526.18137-10-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230510035526.18137-1-trevor.wu@mediatek.com>
References: <20230510035526.18137-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_205609_691711_40898DEC 
X-CRM114-Status: GOOD (  11.25  )
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
dynamically and add property "mediatek,infracfg" for bus protection.

Because no mt8188 upstream dts exists, the change won't break anything.
In addition, apll2_d4, apll12_div4, top_a2sys and top_aud_iec are also
included in clocks, because these clocks are possibly used in the future.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../bindings/sound/mediatek,mt8188-afe.yaml   | 30 +++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
index 9e877f0d19fb..e6cb711ece77 100644
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
 
@@ -52,6 +56,11 @@ properties:
       - description: mux for i2si1_mck
       - description: mux for i2si2_mck
       - description: audio 26m clock
+      - description: audio pll1 divide 4
+      - description: audio pll2 divide 4
+      - description: clock divider for iec
+      - description: mux for a2sys clock
+      - description: mux for aud_iec
 
   clock-names:
     items:
@@ -73,6 +82,11 @@ properties:
       - const: top_i2si1
       - const: top_i2si2
       - const: adsp_audio_26m
+      - const: apll1_d4
+      - const: apll2_d4
+      - const: apll12_div4
+      - const: top_a2sys
+      - const: top_aud_iec
 
   mediatek,etdm-in1-cowork-source:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -144,6 +158,7 @@ required:
   - resets
   - reset-names
   - mediatek,topckgen
+  - mediatek,infracfg
   - power-domains
   - clocks
   - clock-names
@@ -162,6 +177,7 @@ examples:
         resets = <&watchdog 14>;
         reset-names = "audiosys";
         mediatek,topckgen = <&topckgen>;
+        mediatek,infracfg = <&infracfg_ao>;
         power-domains = <&spm 13>; //MT8188_POWER_DOMAIN_AUDIO
         mediatek,etdm-in2-cowork-source = <2>;
         mediatek,etdm-out2-cowork-source = <0>;
@@ -184,7 +200,12 @@ examples:
                  <&topckgen 78>, //CLK_TOP_I2SO2
                  <&topckgen 79>, //CLK_TOP_I2SI1
                  <&topckgen 80>, //CLK_TOP_I2SI2
-                 <&adsp_audio26m 0>; //CLK_AUDIODSP_AUDIO26M
+                 <&adsp_audio26m 0>, //CLK_AUDIODSP_AUDIO26M
+                 <&topckgen 132>, //CLK_TOP_APLL1_D4
+                 <&topckgen 133>, //CLK_TOP_APLL2_D4
+                 <&topckgen 183>, //CLK_TOP_APLL12_CK_DIV4
+                 <&topckgen 84>, //CLK_TOP_A2SYS
+                 <&topckgen 82>; //CLK_TOP_AUD_IEC>;
         clock-names = "clk26m",
                       "apll1",
                       "apll2",
@@ -202,7 +223,12 @@ examples:
                       "top_i2so2",
                       "top_i2si1",
                       "top_i2si2",
-                      "adsp_audio_26m";
+                      "adsp_audio_26m",
+                      "apll1_d4",
+                      "apll2_d4",
+                      "apll12_div4",
+                      "top_a2sys",
+                      "top_aud_iec";
     };
 
 ...
-- 
2.18.0


