Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CA8C77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqVR2v7ZkYxssEYFiD1aCjMmvqT466hEfnZaJrdFhkU=; b=geMcoSWziwx6kzl7WmHjDbpWDL
	wrjb2Ld/lzQy1O3/dAE3mKctyNQ1XLYq4ci2XUvUWtHI6xj6aUO6C40toPrhHw4ViopsFjmKc5YWz
	h9u3ctvH7K/NcZNJQDjLV8xN+WsGEhDfPwTRaT+5KfCyDtUJIGX0ucdCmWnosP894QGK0C8vSzUVU
	F9iYLz3UH7YaxlmuFKKlfU1bfSYrKmvoLqkGjbhC5SWvvG6oBX9bY7X1vkRKrl3H5v5QX1Xp549KL
	ZcbXIHnTbwASJZXlQXn/gLw5fIusCJV1bRmErHWWD8uJvYrAX7cn1KXHsIsiSCKi2a+uVp/8T7KAG
	6LJzckQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzF8r-009ZbQ-1i;
	Wed, 17 May 2023 11:16:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzF8i-009ZX6-2F;
	Wed, 17 May 2023 11:16:18 +0000
X-UUID: 3ac2f55cf4a411ed83ed1395ce914268-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XqVR2v7ZkYxssEYFiD1aCjMmvqT466hEfnZaJrdFhkU=;
	b=qHZ12JHFv1DnOE7JdDHAS5OzFBkVbJUxX0G+9Rh+skFib8o7h5aA+tpysNRk1ahe720Kdq08wHxmYE4TuC/drkJrz7DMTZskPE/zQtNgyk1bVxSN7MYl2OGkp1S9G9WDoxXELFMio+F7oRjen5fEIFMCr6FjmWFcn8RlaH9r4Co=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:84294fd4-df44-4865-89ad-1e771635aeac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.25,REQID:84294fd4-df44-4865-89ad-1e771635aeac,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:d5b0ae3,CLOUDID:4c7b25c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:230517191537KSX9L8LU,BulkQuantity:1,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 3ac2f55cf4a411ed83ed1395ce914268-20230517
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1691482850; Wed, 17 May 2023 04:16:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 19:15:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 19:15:36 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 5/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: update properties
Date: Wed, 17 May 2023 19:15:34 +0800
Message-ID: <20230517111534.32630-6-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230517111534.32630-1-trevor.wu@mediatek.com>
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_041616_736799_45CE5CC5 
X-CRM114-Status: GOOD (  12.72  )
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

ADDA_BE is used to connect to mt6359. For the machine, it must be
fixed to the same codec and configured on the machine driver. Remove
ADDA_BE from items of link-name.

Introduce two properties "dai-format" and "mediatek,clk-provider" under
dai-link subnode to configure dai-link parameters via dts.

"codec" property is removed from required property of dai-link subnode.
For co-clock case, it's possible two dai-links should be configured to
the same format, but only one dai-link builds link with codec.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../sound/mediatek,mt8188-mt6359.yaml         | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 6640272b3f4f..05e532b5d50a 100644
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
@@ -42,7 +44,6 @@ patternProperties:
           we are going to update parameters in this node.
         items:
           enum:
-            - ADDA_BE
             - DPTX_BE
             - ETDM1_IN_BE
             - ETDM2_IN_BE
@@ -62,11 +63,28 @@ patternProperties:
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
 
@@ -87,7 +105,8 @@ examples:
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


