Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0A2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 09:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnJwCGTXe0oLT3zJeQyGTmUbztOVoOwj7qUjEB0zvsw=; b=JtbMy2rnveK19q
	ibnISVZiZlei9Ba+D0sGVMdOUDUM5kV928mGFwtJQLktXdVvArHGiR2hfU3HmehlljKC2SSrodRwR
	hzilOWrp0ZKWGd0F/Yj1yn/qkthpjCHqpvvN8uuNAY+RWy0aAfm4YHPZtIttI0agTpcEt0FDR2BR5
	e2JkcqMRX0wdP8hStXz7V9kOhBJFqYOAd6GsRGlrvCPs9r/OtV8cnauilaY+31q76Y5v8Cqdb8ZJA
	T4rruCzikstP8z36iZvu/Yp0n+OCBQ9jg0Og3goNPme3cf/YzQg7tNmmFkbDKOm3YlZNzGPqLExh7
	av5UDI5ymZVj7SK+Gxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk0oP-005sEU-Cy; Thu, 28 Apr 2022 09:51:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk0gv-005oZh-Q1; Thu, 28 Apr 2022 09:44:08 +0000
X-UUID: 816aaae8b36f4e75aee8d3cc18e45cf0-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:781d60f4-31e2-4b7f-a221-fe4e015aec87, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:b7b4082f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 816aaae8b36f4e75aee8d3cc18e45cf0-20220428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1443432959; Thu, 28 Apr 2022 02:44:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 02:34:18 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 28 Apr 2022 17:34:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 17:34:15 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
CC: <aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, 
 <tzungbi@google.com>, <julianbraha@gmail.com>,
 <alsa-devel@alsa-project.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>
Subject: [v4 18/18] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-rt1019-rt5682s document
Date: Thu, 28 Apr 2022 17:33:55 +0800
Message-ID: <20220428093355.16172-19-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_024405_889877_DF1206BB 
X-CRM114-Status: GOOD (  10.17  )
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

Add document for mt8186 board with mt6366, rt1019 and rt5682s.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
new file mode 100644
index 000000000000..060f778c4efd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8186 with MT6366, RT1019 and RT5682S ASoC sound card driver
+
+maintainers:
+  - Jiaxin Yu <jiaxin.yu@mediatek.com>
+
+description:
+  This binding describes the MT8186 sound card.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8186_mt6366_rt1019_rt5682s_sound
+
+  mediatek,platform:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8186 ASoC platform.
+
+  headset-codec:
+    type: object
+    properties:
+      sound-dai:
+        $ref: /schemas/types.yaml#/definitions/phandle
+    required:
+        - sound-dai
+
+  playback-codecs:
+    type: object
+    properties:
+      sound-dai:
+        minItems: 2
+        maxItems: 3
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+    required:
+        - sound-dai
+
+additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,platform
+  - headset-codec
+  - playback-codecs
+
+examples:
+  - |
+
+    sound: mt8186-sound {
+        compatible = "mediatek,mt8186_mt6366_rt1019_rt5682s_sound";
+        mediatek,platform = <&afe>;
+        pinctrl-names = "aud_clk_mosi_off",
+                        "aud_clk_mosi_on";
+        pinctrl-0 = <&aud_clk_mosi_off>;
+        pinctrl-1 = <&aud_clk_mosi_on>;
+
+        headset-codec {
+            sound-dai = <&rt5682s>;
+        };
+
+        playback-codecs {
+             sound-dai = <&it6505dptx>,
+                         <&rt1019p>;
+        };
+    };
+
+...
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
