Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED19AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 07:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cBicAVLaZ59rtgjQ7BC7LjaaqFHXGqsWDbkvPU5fDk=; b=HscycYX/LADH+t
	+3E+SxlzkXdc4VG79JdwhVODzz/KFw6t/E+sZCXBns+Ii6O00s8NOgH08f9CFWV2rDAxgL+j4bbky
	LAeDMcedsgL0CyCwl8FDHK+YmOoycqa6g7nyZ8pTg1m1+98LR8fgnfD2JhluekeoEv5Edlf8N2WWx
	XTfQibrgGNKAHeB+RczP5HaLiP67Il56fRNYMAeuknLen+bm1KvgAxPVRgGkdwjU79vOVOw3298LK
	WnU0rkoS5js0Y0ZOu4lMmAlRPSBQBqpD8x7TqP+cDsNCWscveC59Vqu27C16O5iJSFsTpDgMWboN/
	ELdw/GkSiNI99obUUBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxOHD-00H3HD-Dc; Wed, 15 Dec 2021 07:00:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxOFS-00H2SK-IM; Wed, 15 Dec 2021 06:58:48 +0000
X-UUID: 89eeba6bd01342b8867aed07115728ac-20211214
X-UUID: 89eeba6bd01342b8867aed07115728ac-20211214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1337858571; Tue, 14 Dec 2021 23:58:40 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Dec 2021 22:58:39 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 15 Dec 2021 14:58:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 15 Dec 2021 14:58:37 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <jiaxin.yu@mediatek.com>, <shumingf@realtek.com>
Subject: [PATCH 2/2] dt-bindings: mediatek: mt8195: add clock property to
 sound node
Date: Wed, 15 Dec 2021 14:58:35 +0800
Message-ID: <20211215065835.3074-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211215065835.3074-1-trevor.wu@mediatek.com>
References: <20211215065835.3074-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_225846_660548_3CB15D4F 
X-CRM114-Status: GOOD (  10.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

clocks and clock-names are added to provide MCLK phandle for sound card.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml  | 12 ++++++++++++
 .../bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml  | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
index cf6ad7933e23..b57c856d0cf3 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
@@ -32,11 +32,21 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of MT8195 HDMI codec node.
 
+  clocks:
+    items:
+      - description: phandle and clock specifier for codec MCLK.
+
+  clock-names:
+    items:
+      - const: i2so1_mclk
+
 additionalProperties: false
 
 required:
   - compatible
   - mediatek,platform
+  - clocks
+  - clock-names
 
 examples:
   - |
@@ -44,6 +54,8 @@ examples:
     sound: mt8195-sound {
         compatible = "mediatek,mt8195_mt6359_rt1011_rt5682";
         mediatek,platform = <&afe>;
+        clocks = <&topckgen 235>; //CLK_TOP_APLL12_DIV2
+        clock-names = "i2so1_mclk";
         pinctrl-names = "default";
         pinctrl-0 = <&aud_pins_default>;
     };
diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
index 8f177e02ad35..e4720f76f66b 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
@@ -42,11 +42,21 @@ properties:
       A list of the desired dai-links in the sound card. Each entry is a
       name defined in the machine driver.
 
+  clocks:
+    items:
+      - description: phandle and clock specifier for codec MCLK.
+
+  clock-names:
+    items:
+      - const: i2so1_mclk
+
 additionalProperties: false
 
 required:
   - compatible
   - mediatek,platform
+  - clocks
+  - clock-names
 
 examples:
   - |
@@ -54,6 +64,8 @@ examples:
     sound: mt8195-sound {
         compatible = "mediatek,mt8195_mt6359_rt1019_rt5682";
         mediatek,platform = <&afe>;
+        clocks = <&topckgen 235>; //CLK_TOP_APLL12_DIV2
+        clock-names = "i2so1_mclk";
         pinctrl-names = "default";
         pinctrl-0 = <&aud_pins_default>;
     };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
