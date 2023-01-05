Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62666C5479D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 19:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiHpouo8paE/ryLEO7IwUWgZkFbg6K8fZ6A4yrPxUTc=; b=k2Lq9oPDO57AM3Is7+Tgqq6gb8
	UmhgIbHsr3jjElGhBE9/V28J/HZvvw5PD6OPBTZYql5q1d3pHCeli9MAqdJwES3ujOpNx8GgLWZEN
	8ePmvhaWVsueTFNCO/QJyKR2Tuow5WqaKVJWSwEUZznFYkBgKRlYwWkQ8Fxw6UTP4Z0bmPDKk02nn
	C8h2GGi6FCecu1whrZ+UNJphol5Yj5rn9Iq7VpZntTMdtOgo2hK7WES20TmfMJ6I5kf3DcKBbOL59
	TpbroeV6quGWNWe9PmumxpLwVoHRM9l/QgRmiH1wYskBOtY9Ozvr2vV7KZ911wxVhImDvoGOsq50v
	JxLWOULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVpB-00E53A-Uh; Thu, 05 Jan 2023 19:22:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDLQv-008T8C-2z; Thu, 05 Jan 2023 08:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OiHpouo8paE/ryLEO7IwUWgZkFbg6K8fZ6A4yrPxUTc=; b=BWnvRp0PrDT3oZvuMAuigelMkk
	H1JceK32yxNLQOYzzSREBwcC9xUYWjih0S9+xNFD2WqGJW+VJDfoWt9gxbywJOoksBkPJhKP7kqsz
	B7Vnnu/zLnzEYmt6rpO15tAEJH96Lo1NBkU2Z9J63JAcc/wPnNf65tI/gNkbBtlRgKbZNPTHWlL+n
	eQSIjop99r+EVCZe8J9Xn/szMbzBleMYQjcknonABmhRq+u+BYRYajPvU0J0Y8Q2RyvKSFzM4cFyT
	OBwn36lQhm0XlVuExgtfJrzOrvWOxdoL6nvh8AJmrqT1Zj+lRC8asbyCVTcGFrC0K3B0tQIKUFZDK
	ImPmAAUw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDLQh-001Fdl-2f;
	Thu, 05 Jan 2023 08:16:57 +0000
X-UUID: 7cf908265f6c4aee81bd3ea0b5b34dea-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OiHpouo8paE/ryLEO7IwUWgZkFbg6K8fZ6A4yrPxUTc=;
	b=lS5nggqzp3qbC5Bu94lEeubXdKYSNGysy8ExYWObUR9Ibe2FgZerpYQ4LM0XYaorawZWsgbeO/kQNeJVubLVc1vsQ0U+55+oIwF0HRwLAf5SkFqL+ioFPG5JFDJL4vtHl5zd2HME0zGS/JEvpK0R+I9IFxDOrt1t82g2kqdIOec=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:11d012fa-eaa1-4457-9053-43982ece04cd,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:543e81c,CLOUDID:be33b953-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 7cf908265f6c4aee81bd3ea0b5b34dea-20230105
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 874967315; Thu, 05 Jan 2023 01:16:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 Jan 2023 16:16:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 5 Jan 2023 16:16:16 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v5 13/13] ASoC: dt-bindings: mediatek,mt8188-mt6359: add mt8188-mt6359 document
Date: Thu, 5 Jan 2023 16:16:06 +0800
Message-ID: <20230105081606.6582-14-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230105081606.6582-1-trevor.wu@mediatek.com>
References: <20230105081606.6582-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_081653_406649_218812BD 
X-CRM114-Status: GOOD (  13.39  )
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

Add document for mt8188 board with mt6359.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../sound/mediatek,mt8188-mt6359.yaml         | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
new file mode 100644
index 000000000000..6640272b3f4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8188 ASoC sound card
+
+maintainers:
+  - Trevor Wu <trevor.wu@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8188-mt6359-evb
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      sink/source pair of strings. Valid names could be the input or output
+      widgets of audio components, power supplies, MicBias of codec and the
+      software switch.
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8188 ASoC platform.
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
+            - ADDA_BE
+            - DPTX_BE
+            - ETDM1_IN_BE
+            - ETDM2_IN_BE
+            - ETDM1_OUT_BE
+            - ETDM2_OUT_BE
+            - ETDM3_OUT_BE
+            - PCM1_BE
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
+    additionalProperties: false
+
+    required:
+      - link-name
+      - codec
+
+additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,platform
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8188-mt6359-evb";
+        mediatek,platform = <&afe>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&aud_pins_default>;
+        audio-routing =
+            "Headphone", "Headphone L",
+            "Headphone", "Headphone R",
+            "AIN1", "Headset Mic";
+        dai-link-0 {
+            link-name = "ETDM3_OUT_BE";
+
+            codec {
+                sound-dai = <&hdmi0>;
+            };
+        };
+    };
+
+...
-- 
2.18.0


