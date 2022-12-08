Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26EFC4708D
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 03:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcBCrYwvYK7ah28O3JMQ2UxBDeByxAxxoE2p8W3FOG4=; b=cn9whb0NMAjTt82GoIRe3jorrN
	PXKPkaYQOuJAGqeYqfp303kk9Xq2H4eEkGSa37F5TVFlEv+CmYqsDxQhEhUv/4odzbSJf5IAkV1YG
	CUC5/Lsz+rz1Mli5JzwzpT6BpHd+7ioH//v0oHHd1WWxlLaGXc3l1w80WDVs9DCW4mTVcWYzjgdYO
	oWXRElmtsQOQzHzXesXf3/uSB/9ig7WLvkqW7NmpThAUmQTwlQquYxouaI5FYulzdFgFJmdG+2sbn
	mn1mDPVYYcpHmDFh29CyasPbvAvK9adwpXem9qhB4br3rTH8Xf8v2JBTvVFFS6yw/WEHA7UEl8fFy
	YHzTqPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p37jR-00113g-Ni; Thu, 08 Dec 2022 03:37:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p37gG-000yOf-Jy; Thu, 08 Dec 2022 03:34:42 +0000
X-UUID: ac9437bbd3ae42469ea1f75713409687-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QcBCrYwvYK7ah28O3JMQ2UxBDeByxAxxoE2p8W3FOG4=;
	b=XO7LaGNCClEn9qahKZWbneT+qmorbxAviYJ9olYTDDybF8n14tKEj8sznzV/ViLnVGJnYc+hZus1lvcl51kIfwdyBKQ3FZEAKZXH3vVfFYNKWRxUfExDi/w+AU8r35Ol6dRDqZ7zhcPLiMMW71BQwHbhlKJwfaB83ifu/VH3S28=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:bbc306ab-a362-42eb-be07-4b11ec1b7164,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:dcaaed0,CLOUDID:112ba524-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ac9437bbd3ae42469ea1f75713409687-20221207
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 459361586; Wed, 07 Dec 2022 20:34:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Dec 2022 11:32:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 8 Dec 2022 11:32:14 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 12/12] dt-bindings: mediatek: mt8188: add mt8188-mt6359 document
Date: Thu, 8 Dec 2022 11:31:48 +0800
Message-ID: <20221208033148.21866-13-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221208033148.21866-1-trevor.wu@mediatek.com>
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_193440_709998_AB2D2D03 
X-CRM114-Status: GOOD (  12.04  )
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
 .../bindings/sound/mt8188-mt6359.yaml         | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
new file mode 100644
index 000000000000..eac1c87b693a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8188-mt6359.yaml#
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
+  mediatek,dptx-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8188 Display Port Tx codec node.
+
+  mediatek,hdmi-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8188 HDMI codec node.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,platform
+
+examples:
+  - |
+
+    sound: mt8188-sound {
+        compatible = "mediatek,mt8188-mt6359-evb";
+        mediatek,platform = <&afe>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&aud_pins_default>;
+        audio-routing =
+            "Headphone", "Headphone L",
+            "Headphone", "Headphone R",
+            "AIN1", "Headset Mic";
+    };
+
+...
-- 
2.18.0


