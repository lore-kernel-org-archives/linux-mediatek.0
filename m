Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E69C369A2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Apr 2025 12:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAbvFEC9Kt8P81+V2sHCH2GZ+SfpkGkZ983AinyulB0=; b=yxaWNYyRW438Nnm2aCprAtIEtl
	H2190cvD8jZinhKOa+T7niAUSOpyQ3tsBqtoKUFqm+Z3YVbmj80ktY893ZN7ndICi8k8z9QYYmHz7
	69RfosKI40JcJX3Xzk9bKqMLZ2GNv5HCQ9GDIAv9GtLf9vEM72acbggTub86cOC9EwWQm0noumfWH
	dktkO0IS5mqo93jLMOOIZdJEjj7tKUnNXYPzC2eurMgUeceDSsdNul7DJAT26p5Hr5gf5WVvFZhY8
	FP03EV+kHvVzcL37vsAV4s3Q8hBF1JHUrFpoyxsKsOubLtxTGA362QVMuhfs9LpTcBYsE/6UGlBfx
	JsbMZepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lDx-000000009Zt-3Ilk;
	Mon, 07 Apr 2025 12:05:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ky2-000000004rq-2yCe;
	Mon, 07 Apr 2025 11:48:44 +0000
X-UUID: 3f29135613a611f0a1e849db4cc18d44-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JAbvFEC9Kt8P81+V2sHCH2GZ+SfpkGkZ983AinyulB0=;
	b=g+SZDsLkvjKbQxs5p066AGN5gh2k8U3h9Adi1CSuEDmSxz1Q2AJw4bK5hstY9jKXCGCOj2zgsmo0fKHWtcR20ucFALmwiFTmw8kCPe9JUgnPvjM+Kzu4DdzeGSxO6rBrAciXdmoquefy7n7AFofl8Np1QziyFW0is0486e4jynE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c9a04a74-1160-41eb-8aa6-6ed27e4f4af8,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:0ef645f,CLOUDID:73eec6a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 3f29135613a611f0a1e849db4cc18d44-20250407
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1193778182; Mon, 07 Apr 2025 04:48:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 19:48:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 19:48:35 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>
Subject: [PATCH 11/11] ASoC: dt-bindings: mediatek,mt8196-mt6681: add mt8196-mt6681 document
Date: Mon, 7 Apr 2025 19:47:24 +0800
Message-ID: <20250407114759.24835-13-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250407114759.24835-1-darren.ye@mediatek.com>
References: <20250407114759.24835-1-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_044842_748627_7BE09953 
X-CRM114-Status: GOOD (  14.43  )
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

From: Darren Ye <darren.ye@mediatek.com>

Add document for mt8196 board with mt6681.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 .../sound/mediatek,mt8196-mt6681.yaml         | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-mt6681.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-mt6681.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-mt6681.yaml
new file mode 100644
index 000000000000..2c1b0df05c27
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-mt6681.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8196-mt6681.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 ASoC sound card
+
+maintainers:
+  - Darren Ye <darren.ye@mediatek.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt8196-mt6681-sound
+          - mediatek,mt8196-nau8825-sound
+          - mediatek,mt8196-rt5682s-sound
+          - mediatek,mt8196-rt5650-sound
+
+  audio-routing:
+    description:
+      Valid names could be the input or output widgets of audio components,
+      power supplies, MicBias of codec and the software switch.
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8188 ASoC platform.
+
+  mediatek,adsp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the MT8188 ADSP platform, which is the optional Audio DSP
+      hardware that provides additional audio functionalities if present.
+      The AFE will link to ADSP when the phandle is provided.
+
+patternProperties:
+  "^dai-link-[0-9]+$":
+    type: object
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      link-name:
+        description:
+          This property corresponds to the name of the BE dai-link to which
+          we are going to update parameters in this node.
+        items:
+          enum:
+            - TDM_DPTX_BE
+            - I2SOUT6_BE
+            - I2SIN6_BE
+            - I2SOUT4_BE
+            - I2SOUT3_BE
+
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        additionalProperties: false
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+        required:
+          - sound-dai
+
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
+    additionalProperties: false
+
+    required:
+      - link-name
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - mediatek,platform
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8196-mt6681-sound";
+        model = "mt8196-mt6681";
+        mediatek,platform = <&afe>;
+        dai-link-0 {
+            link-name = "I2SOUT6_BE";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&nau8825>;
+            };
+        };
+    };
+
-- 
2.45.2


