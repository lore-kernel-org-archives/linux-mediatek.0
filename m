Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C871C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 05:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAEkU9IlvDkl+cHlDk0RadZcO9c0TKDMcOBXEeCPpks=; b=ZcyUFZUd5/Y9N+
	tuU2PsMqbUoBCwEMx4rrXce7ZDbs2uQ7Sp2z07Q7ihf2L53kqEEyAsfSlQaKDfYAvBnxTmE+YYE9u
	D7LCwA4lwd1HvSG2E5c2GTiBRtVfvRggbb2JZ2ClYCokDTMfalAq6W+Kn6kYrlCPF1QOg9Cldp3D/
	+VY+iYVX5Hmc5aa3WOwnNyqPxNSWzz9ebc8Q4PxBZlwp0yL3kjBKalGFKwGjaCCIFry7CAj6R+U1q
	OXZHnk1dliU6tPmjM+DPYSd9SfBhKQupfPrYGoeZZBTCE1P0B+UdYBwvu+jLqTC5HGvgzho9qnHlc
	X6w2n3tltRTfCg26YGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXGKU-00Fg67-P2; Thu, 24 Mar 2022 05:48:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXGKR-00Fg5I-Bz; Thu, 24 Mar 2022 05:48:13 +0000
X-UUID: 1f1aa534e8564c6e94cfb6e04ba59b3d-20220323
X-UUID: 1f1aa534e8564c6e94cfb6e04ba59b3d-20220323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2007002332; Wed, 23 Mar 2022 22:48:03 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 22:38:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 13:38:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Mar 2022 13:38:56 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <aaronyu@google.com>, <angelogioacchino.delregno@collabora.com>,
 <tzungbi@google.com>, <miles.chen@mediatek.com>, <yc.hung@mediatek.com>
Subject: [PATCH v4 3/6] ASoC: dt-bindings: mediatek: mt8195: merge mt8195
 machine yaml
Date: Thu, 24 Mar 2022 13:38:48 +0800
Message-ID: <20220324053851.27350-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220324053851.27350-1-trevor.wu@mediatek.com>
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_224811_452936_427A2533 
X-CRM114-Status: GOOD (  12.32  )
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

Because the same binding components can be shared by all codecs
combinations, we only reserve one binding file for mt8195 machine driver
and rename to a generic name.

We use compatible string to separate different codec combination instead
of creating a new binding file for new codec combination.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../sound/mt8195-mt6359-rt1011-rt5682.yaml    | 51 -------------------
 ...-rt1019-rt5682.yaml => mt8195-mt6359.yaml} |  8 +--
 2 files changed, 5 insertions(+), 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
 rename Documentation/devicetree/bindings/sound/{mt8195-mt6359-rt1019-rt5682.yaml => mt8195-mt6359.yaml} (87%)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
deleted file mode 100644
index cf6ad7933e23..000000000000
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
+++ /dev/null
@@ -1,51 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/mt8195-mt6359-rt1011-rt5682.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mediatek MT8195 with MT6359, RT1011 and RT5682 ASoC sound card driver
-
-maintainers:
-  - Trevor Wu <trevor.wu@mediatek.com>
-
-description:
-  This binding describes the MT8195 sound card with RT1011 and RT5682.
-
-properties:
-  compatible:
-    const: mediatek,mt8195_mt6359_rt1011_rt5682
-
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
-  mediatek,platform:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of MT8195 ASoC platform.
-
-  mediatek,dptx-codec:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of MT8195 Display Port Tx codec node.
-
-  mediatek,hdmi-codec:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of MT8195 HDMI codec node.
-
-additionalProperties: false
-
-required:
-  - compatible
-  - mediatek,platform
-
-examples:
-  - |
-
-    sound: mt8195-sound {
-        compatible = "mediatek,mt8195_mt6359_rt1011_rt5682";
-        mediatek,platform = <&afe>;
-        pinctrl-names = "default";
-        pinctrl-0 = <&aud_pins_default>;
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
similarity index 87%
rename from Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
rename to Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
index 8f177e02ad35..04953f5b44a4 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/mt8195-mt6359-rt1019-rt5682.yaml#
+$id: http://devicetree.org/schemas/sound/mt8195-mt6359.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT8195 with MT6359, RT1019 and RT5682 ASoC sound card driver
+title: MediaTek MT8195 ASoC sound card driver
 
 maintainers:
   - Trevor Wu <trevor.wu@mediatek.com>
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt8195_mt6359_rt1019_rt5682
+    enum:
+      - mediatek,mt8195_mt6359_rt1019_rt5682
+      - mediatek,mt8195_mt6359_rt1011_rt5682
 
   model:
     $ref: /schemas/types.yaml#/definitions/string
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
