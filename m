Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19DDCA0FED
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Sep 2025 08:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7helsjCaB629vV4qjBn8l0wrUMObxM41RAtZzXyrUgA=; b=3Rj1gonh3DRhgEMnuTAsJZEpfq
	jNcFSB0g57wc5zaN4p4pocacs3/VNwNhU4AgVDAxEfrJVqXmSF+xQeDA9t2StOwb9AWqHoIneOHcR
	5TeQBaVK30IoNDwgRg3BD6YQbWQ04gBXY/VnYkY2QfymXDIACimpvRBI//UJeT1a3gdI+iKbNCLKi
	fxRo0w/52/nNSHSy2yQQ16Ys88ZoSC6Y5UmEMtrgfU2YQstYSYxvSG/dpGHRwwjJvLYle0ZyHflmx
	qI78bGcRcTkUXRuZi/vVpC/D2KgosocYJwFpwYl1qVgPDPigUMLbFML6MofJRsTmMmwrwWixEJeSJ
	Tmz0lpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRyu-00000000QgT-0foy;
	Fri, 05 Sep 2025 08:39:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQhg-0000000HXzr-1ywm;
	Fri, 05 Sep 2025 07:17:49 +0000
X-UUID: 6c8461b88a2811f09eb0dd999d3936bf-20250905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7helsjCaB629vV4qjBn8l0wrUMObxM41RAtZzXyrUgA=;
	b=qeEdog0oSIVimXCLIMkr4sS+EwoYCNujQgXvGyYwFKqaYK0rVQ4WR39WMDkWg/MzWbp0S8MrQ3AQsP+L5HskbjF+6xKYx6LljVOS0QYzwo2KTNbCrIH+q+FR9TM/K9FoIoC4o42paN3L+7K6xjnfGPywdov7IvmziGAcz1d/aec=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:7f2eb54c-766c-484a-9a6b-6cf7e55a8bb6,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:f1326cf,CLOUDID:e4267784-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6c8461b88a2811f09eb0dd999d3936bf-20250905
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2100374517; Fri, 05 Sep 2025 00:17:47 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 5 Sep 2025 15:17:41 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 5 Sep 2025 15:17:40 +0800
From: Cyril Chao <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Darren Ye
	<darren.ye@mediatek.com>, Cyril Chao <cyril.chao@mediatek.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Cyril Chao
	<Cyril.Chao@mediatek.com>
Subject: [PATCH v2 09/10] ASoC: dt-bindings: mediatek,mt8189-nau8825: add mt8189-nau8825 document
Date: Fri, 5 Sep 2025 15:15:54 +0800
Message-ID: <20250905071659.25805-10-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250905071659.25805-1-Cyril.Chao@mediatek.com>
References: <20250905071659.25805-1-Cyril.Chao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_001748_556736_60474418 
X-CRM114-Status: GOOD (  12.92  )
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

Add document for mt8189 board with nau8825.

Signed-off-by: Cyril Chao <Cyril.Chao@mediatek.com>
---
 .../sound/mediatek,mt8189-nau8825.yaml        | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml
new file mode 100644
index 000000000000..db3a70c0b9d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8189-nau8825.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8189 ASoC sound card
+
+maintainers:
+  - Darren Ye <darren.ye@mediatek.com>
+  - Cyril Chao <cyril.chao@mediatek.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8189-nau8825
+      - mediatek,mt8189-rt5650
+      - mediatek,mt8189-rt5682s
+      - mediatek,mt8189-rt5682i
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8189 ASoC platform.
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
+            - I2SOUT0_BE
+            - I2SIN0_BE
+            - I2SOUT1_BE
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
+        enum:
+          - cpu
+          - codec
+
+    additionalProperties: false
+
+    required:
+      - link-name
+
+required:
+  - compatible
+  - mediatek,platform
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8189-nau8825";
+        model = "mt8189_rt9123_8825";
+        mediatek,platform = <&afe>;
+        dai-link-0 {
+            link-name = "I2SOUT1_BE";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&nau8825>;
+            };
+        };
+    };
+
+...
-- 
2.45.2


