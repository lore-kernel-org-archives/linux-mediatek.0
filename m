Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7001AC77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 09:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sfj8k51ecj9c8HcMdn1rWW9Isz6l/fhmsTFfGJOkg14=; b=ea0crhLY8qRMpX7VFrd/x9SnPP
	ofyosEJFUykrFIJQsVBjP6Jo69nciKi+CGHYJRQFTm+4RteLtQ7q9uYWztBzUALO1f317N+wGy0WR
	R4YsvRei8Q8Zb8i0Xpzb4T7EpYpyC677oyc54Puy+yKvOB3ibIIjRlGjSUv0SHYL6OHDrOoZ/bMXL
	oq+eKq8iG58d0dmYRi8TPAL73krYtxzmAaSRndOtP6YogIiz61W9EYeFDHNiPjAPQXpJZ+55G0K9H
	ZoJdRdnB2n4wrMadmCiir7j1jOOxNGSCc19Kqipy3h28+rx6nPwJv2QsADQEtUaY1Q/lkuGjSNips
	hcTddX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Tnu-001oSn-25;
	Fri, 26 May 2023 09:32:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Tnr-001oPE-0N;
	Fri, 26 May 2023 09:32:08 +0000
X-UUID: 27b0ddcafba811ed83ed1395ce914268-20230526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Sfj8k51ecj9c8HcMdn1rWW9Isz6l/fhmsTFfGJOkg14=;
	b=PMtNN8f0I02IMJxHiXNLipLef9S7DJVtDHY6A5lQK+x87YD97DcFieM8KB6YP1r62mfIJB1KGmvpX1vCSuhgKBXe0RexEXEqr8XmlNT5OmvZHPDnglCblgF5iaXeRbNyE0X9eH2t0xKVLvo8osWI0PRTzHOngqik33MHJl1/7NE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:79201260-f5a4-4d7f-b134-56ae76e5fc53,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.25,REQID:79201260-f5a4-4d7f-b134-56ae76e5fc53,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:d5b0ae3,CLOUDID:3d0b753c-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:2305261731580SAXLWX8,BulkQuantity:0,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 27b0ddcafba811ed83ed1395ce914268-20230526
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 760575186; Fri, 26 May 2023 02:31:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 May 2023 17:31:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 May 2023 17:31:53 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <amergnat@baylibre.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 7/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: add NAU8825 support
Date: Fri, 26 May 2023 17:31:50 +0800
Message-ID: <20230526093150.22923-8-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230526093150.22923-1-trevor.wu@mediatek.com>
References: <20230526093150.22923-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_023207_164589_CAB5BF6E 
X-CRM114-Status: GOOD (  10.96  )
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

Add compatible string "mediatek,mt8188-nau8825" to support new board
with nau8825 codec.

Introduce two properties "dai-format" and "mediatek,clk-provider" under
dai-link subnode to configure dai-link parameters via dts.

"codec" property is removed from required property of dai-link subnode.
For co-clock case, it's possible two dai-links should be configured to
the same dai format, but only one cpu dai is bound with codec.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../sound/mediatek,mt8188-mt6359.yaml         | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 3d2c01b693be..05e532b5d50a 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: mediatek,mt8188-mt6359-evb
+    enum:
+      - mediatek,mt8188-mt6359-evb
+      - mediatek,mt8188-nau8825
 
   model:
     $ref: /schemas/types.yaml#/definitions/string
@@ -61,11 +63,28 @@ patternProperties:
         required:
           - sound-dai
 
+      dai-format:
+        description: audio format.
+        items:
+          enum:
+            - i2s
+            - right_j
+            - left_j
+            - dsp_a
+            - dsp_b
+
+      mediatek,clk-provider:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Indicates dai-link clock master.
+        items:
+          enum:
+            - cpu
+            - codec
+
     additionalProperties: false
 
     required:
       - link-name
-      - codec
 
 additionalProperties: false
 
@@ -86,7 +105,8 @@ examples:
             "AIN1", "Headset Mic";
         dai-link-0 {
             link-name = "ETDM3_OUT_BE";
-
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
             codec {
                 sound-dai = <&hdmi0>;
             };
-- 
2.18.0


