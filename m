Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEB4CF6497
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 07:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwWXCGAW/ByfoA2er9EQDpwMhHapKsGPkQ088kaxyr0=; b=0+i3qN3Zm2kvDsZupaIybJtl32
	1Oa6gFO3BEGpHbVh57iMxP0dGIxlCUQr0aswOUJpiNJwNEZM3r2wdtq60Eay6p4K6xnjFIAxrEEQH
	8UJp2sr35JdIN49rEp5DyzVRmj/hBRNUw/Tl46ituLNhzDk6nlEITUCL3wRY1fxGNsazy+09LrIJM
	zxjOUFByA2l1yPG1RL/p2Q8cq0eKMKYK4W3XhbBowzrAmzl/XN9sdoPswFnyw6kcjal8j4CIAC/lx
	MKvgEXC6TA8GBxsPpxKwrD8FNV6wFIXUUmY6PMtkfQ+fdR9xXjdQTrQ0LTc36fxNq5plKJvx4n37X
	RBi4b3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svAvU-0000000GBwz-09Gv;
	Mon, 30 Sep 2024 07:34:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svAuS-0000000GBgY-18Gu;
	Mon, 30 Sep 2024 07:33:33 +0000
X-UUID: 48d6f0727efe11efba0aef63c0775dbf-20240930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KwWXCGAW/ByfoA2er9EQDpwMhHapKsGPkQ088kaxyr0=;
	b=gWmFQxiPxXRBZWxF6/VUcY6rT+gYITJ1itSSHxJmn+z77BIBRG4HeYUJJ37Ka16O+4E7JfrJ419TiENlu4+ahXUN7VQdUByFhk4KQ3MICsw+LEUj9huPoDwAgceF5L0zdfT48cMRH8KOvtNtrV09zRoZRjfwpR0yyjsb3aWgFm8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:4c33dd46-977c-415a-8d4e-30011018f54c,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6dc6a47,CLOUDID:6f757718-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 48d6f0727efe11efba0aef63c0775dbf-20240930
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1286554413; Mon, 30 Sep 2024 00:33:28 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Sep 2024 15:33:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Sep 2024 15:33:24 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones
	<lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu
	<sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Macpaul Lin
	<macpaul.lin@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli
	<f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sebastian
 Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-sound@vger.kernel.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH v7 2/3] ASoC: dt-bindings: mt6358: Convert to DT Schema
Date: Mon, 30 Sep 2024 15:33:10 +0800
Message-ID: <20240930073311.1486-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240930073311.1486-1-macpaul.lin@mediatek.com>
References: <20240930073311.1486-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_003332_343031_997E5803 
X-CRM114-Status: GOOD (  19.14  )
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

Convert the MediaTek MT6358 Audio CODEC bindings to DT schema.

This change implements the following updates:
1. Compatible property: Added the const 'mediatek,mt6358-sound'
   to ensure alignment with the schema in the actual (DTS) file
   "mt8186-corsola.dtsi" with 'mediatek,mt6366-sound'.
2. Example: Removed the example section, as it should be relocated to
   the MT6397 PMIC file 'mfd/mediatek,mt6397.yaml'.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../devicetree/bindings/sound/mt6358.txt      | 26 ------------
 .../devicetree/bindings/sound/mt6358.yaml     | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6358.txt
 create mode 100644 Documentation/devicetree/bindings/sound/mt6358.yaml

Changess for v1~v6:
 - It was not in the origin patch set.

Changes for v7:
 - It is seperated from the origin patch set (2/2, v6).
   It could simplifies the audio-codec node in next patch (3/3, v7)
   of 'mfd/mediatek,mt6397.yaml'

diff --git a/Documentation/devicetree/bindings/sound/mt6358.txt b/Documentation/devicetree/bindings/sound/mt6358.txt
deleted file mode 100644
index fbe9e55c68f5..000000000000
--- a/Documentation/devicetree/bindings/sound/mt6358.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Mediatek MT6358 Audio Codec
-
-The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
-For more detail, please visit Mediatek PMIC wrapper documentation.
-
-Must be a child node of PMIC wrapper.
-
-Required properties:
-
-- compatible - "string" - One of:
-    "mediatek,mt6358-sound"
-    "mediatek,mt6366-sound"
-- Avdd-supply : power source of AVDD
-
-Optional properties:
-- mediatek,dmic-mode : Indicates how many data pins are used to transmit two
-	channels of PDM signal. 0 means two wires, 1 means one wire. Default
-	value is 0.
-
-Example:
-
-mt6358_snd {
-	compatible = "mediatek,mt6358-sound";
-	Avdd-supply = <&mt6358_vaud28_reg>;
-	mediatek,dmic-mode = <0>;
-};
diff --git a/Documentation/devicetree/bindings/sound/mt6358.yaml b/Documentation/devicetree/bindings/sound/mt6358.yaml
new file mode 100644
index 000000000000..5f7611e26a89
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt6358.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt6358.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6358 Audio Codec
+
+maintainers:
+  - Jiaxin Yu <jiaxin.yu@mediatek.com>
+  - Macpaul Lin <macpaul.lin@mediatek.com>
+
+description: |
+  The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
+  For more detail, please visit Mediatek PMIC wrapper documentation.
+  Must be a child node of PMIC wrapper.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6366-sound
+      - mediatek,mt6358-sound
+    const: mediatek,mt6358-sound
+
+  Avdd-supply:
+    description: Power source of AVDD
+
+  mediatek,dmic-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Indicates how many data pins are used to transmit two channels of PDM
+      signal. 0 means two wires, 1 means one wire. Default value is 0.
+    enum:
+      - 0 # two wires
+      - 1 # one wire
+
+required:
+  - compatible
+  - Avdd-supply
+
+additionalProperties: false
-- 
2.45.2


