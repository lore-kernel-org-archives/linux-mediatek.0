Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E951C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETG24WDlQ2uPL5EVj2vGSSok7fEm7bbdqh1C2k70J14=; b=OmXULkwc8ozm8nyfVTkZhGcs/n
	cqcoio3MbkEGrvBpa144qSnRqwoVs5elJJy/OY42GZVf1oB9dSVNmuN1BZtl6jhKpYvVlcxorQ0UT
	URfbLutu4zHqy8pfKG1vA4gt/pfC0i7DABVNtvKSFSjixJVakGF2XA5l+m5/tPCTY7DeHIJBQVCvZ
	aaFK7EvhZKj//0zgY9UWzefmMNeYvMZxVm4zaLKxglh5yqfa3y8fKChPbhPkVJnZub8alPOB5rDR1
	kPPbH0pV39xbbl7B8TIxGvTB6D0ihIV5gij9ksWzHF7tsrx3WdCQGAmdcPeWKJxrX1zZ3T1borm7L
	Afe+2MQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeIHc-00AODZ-SD; Fri, 30 Sep 2022 15:50:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeIFV-00ANA1-8L; Fri, 30 Sep 2022 15:48:27 +0000
X-UUID: a49f8f410145456094f1e6fd1fa03644-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ETG24WDlQ2uPL5EVj2vGSSok7fEm7bbdqh1C2k70J14=;
	b=UYP3fTEG3JKwlfggAfRNzA3YKLuT+YCyzFEVA19l5fFSPA4RUn9uBzvmIaVp9NTCaDEvvtBjPfAHk7B7CjoRE+zUoy9xrnEItf6iMIVKhBXIn+AtUe6QEWqnY6U8MhLTVbXfIbAv3q/fm1PAgsxYzWkyHlSJoUIlpdGA1HgI95Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b6251401-278b-4fcf-8953-ea129ed18969,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:39a5ff1,CLOUDID:89d0cde4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a49f8f410145456094f1e6fd1fa03644-20220930
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 669425022; Fri, 30 Sep 2022 08:48:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Sep 2022 22:57:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 22:57:09 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 12/12] dt-bindings: mediatek: mt8188: add mt8188-mt6359 document
Date: Fri, 30 Sep 2022 22:57:01 +0800
Message-ID: <20220930145701.18790-13-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220930145701.18790-1-trevor.wu@mediatek.com>
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_084825_335774_EB51F9D2 
X-CRM114-Status: GOOD (  13.37  )
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
 .../bindings/sound/mt8188-mt6359.yaml         | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
new file mode 100644
index 000000000000..57c7c5ceef8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8188-mt6359.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8188 ASoC sound card driver
+
+maintainers:
+  - Trevor Wu <trevor.wu@mediatek.com>
+
+description:
+  This binding describes the MT8188 sound card.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8188-sound
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
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8188 ASoC platform.
+
+  mediatek,dptx-codec:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8188 Display Port Tx codec node.
+
+  mediatek,hdmi-codec:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8188 HDMI codec node.
+
+  mediatek,dai-link:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      A list of the desired dai-links in the sound card. Each entry is a
+      name defined in the machine driver.
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
+        compatible = "mediatek,mt8188-sound";
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


