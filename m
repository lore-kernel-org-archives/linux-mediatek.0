Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11354EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 10:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CJ/JsGlde5cwlzOw5Tu+oif75NN/96g5IbWro2lrg0=; b=3qZ567/yS7cpQcAuRFeMZKBMSe
	OwDYz5trt0D51Q/0d4NSLG69il/HMxZA/9QsVoWg60aSpb3zCqLY8pIcrhbP5IkX54YkeuoNwnM4A
	k+jsu9RPCFPHqxiMzS0P4+oG4e6OYGm0jaQmFySjVkAKAznqRYWr0URn85n81bn1zFoo+a1wPnViK
	Bo/k4P96w1WSmGFkmZihiR8+QdTJw92kwJWnGmiD4RkjBs1lJ52fI9OPPZJtUb2xMWIM29bFhsAr8
	vllcLHpkYb7ObcIEh6K735JhJ88PgitaFQ3KQ7xjdsNUaM9rp/L1E77khY0nZl5TKyFklszEs76I0
	gNV1yDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWa1H-0060wm-2v;
	Thu, 17 Aug 2023 10:14:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWa12-0060qB-2N;
	Thu, 17 Aug 2023 10:14:10 +0000
X-UUID: ca60c45c3ce611ee83ed1395ce914268-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2CJ/JsGlde5cwlzOw5Tu+oif75NN/96g5IbWro2lrg0=;
	b=WtDe/OYetjt9KZVkaTmzamyQRmEMvanKF42RtmFhTPY28ZfDy+n9xzf591TsWWWOLpv97fFL6DEPAF8VfNPvGdhuKp8L9AIqWV4EmB/COKCksNSk/eZIiEElOaHkJmBvj1pmAfNjNr4u7h3TNF+fQ6g8XuQEeo4b2rEX7quGdcc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:a9a4c2f8-72e6-406c-8085-417a2d0ea382,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:95
X-CID-INFO: VERSION:1.1.31,REQID:a9a4c2f8-72e6-406c-8085-417a2d0ea382,IP:0,URL
	:25,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:95
X-CID-META: VersionHash:0ad78a4,CLOUDID:6514f7c1-1e57-4345-9d31-31ad9818b39f,B
	ulkID:23081718140461GYGS8L,BulkQuantity:1,Recheck:0,SF:28|17|19|48|38|29,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD,TF_CID_SPAM_ULN
X-UUID: ca60c45c3ce611ee83ed1395ce914268-20230817
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 181934383; Thu, 17 Aug 2023 03:14:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Aug 2023 18:14:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Aug 2023 18:14:01 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Mars Chen
	<chenxiangrui@huaqin.corp-partner.google.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v4 6/6] ASoC: dt-bindings: mediatek,mt7986-afe: add audio afe document
Date: Thu, 17 Aug 2023 18:13:38 +0800
Message-ID: <20230817101338.18782-7-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230817101338.18782-1-maso.huang@mediatek.com>
References: <20230817101338.18782-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_031408_793036_92E6EA14 
X-CRM114-Status: GOOD (  12.56  )
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

Add mt7986 audio afe document.

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/sound/mediatek,mt7986-afe.yaml   | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
new file mode 100644
index 000000000000..398efdfe00f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
@@ -0,0 +1,160 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt7986-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek AFE PCM controller for MT7986
+
+maintainers:
+  - Maso Huang <maso.huang@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt7986-afe
+      - items:
+          - enum:
+              - mediatek,mt7981-afe
+              - mediatek,mt7988-afe
+          - const: mediatek,mt7986-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 5
+    items:
+      - description: audio bus clock
+      - description: audio 26M clock
+      - description: audio intbus clock
+      - description: audio hopping clock
+      - description: audio pll clock
+      - description: mux for pcm_mck
+      - description: audio i2s/pcm mck
+
+  clock-names:
+    minItems: 5
+    items:
+      - const: bus_ck
+      - const: 26m_ck
+      - const: l_ck
+      - const: aud_ck
+      - const: eg2_ck
+      - const: sel
+      - const: i2s_m
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7986-afe
+    then:
+      properties:
+        clocks:
+          items:
+            - description: audio bus clock
+            - description: audio 26M clock
+            - description: audio intbus clock
+            - description: audio hopping clock
+            - description: audio pll clock
+        clock-names:
+          items:
+            - const: bus_ck
+            - const: 26m_ck
+            - const: l_ck
+            - const: aud_ck
+            - const: eg2_ck
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7981-afe
+    then:
+      properties:
+        clocks:
+          items:
+            - description: audio bus clock
+            - description: audio 26M clock
+            - description: audio intbus clock
+            - description: audio hopping clock
+            - description: audio pll clock
+            - description: mux for pcm_mck
+        clock-names:
+          items:
+            - const: bus_ck
+            - const: 26m_ck
+            - const: l_ck
+            - const: aud_ck
+            - const: eg2_ck
+            - const: sel
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7988-afe
+    then:
+      properties:
+        clocks:
+          items:
+            - description: audio bus clock
+            - description: audio 26M clock
+            - description: audio intbus clock
+            - description: audio hopping clock
+            - description: audio pll clock
+            - description: mux for pcm_mck
+            - description: audio i2s/pcm mck
+        clock-names:
+          items:
+            - const: bus_ck
+            - const: 26m_ck
+            - const: l_ck
+            - const: aud_ck
+            - const: eg2_ck
+            - const: sel
+            - const: i2s_m
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt7986-clk.h>
+
+    afe@11210000 {
+        compatible = "mediatek,mt7986-afe";
+        reg = <0x11210000 0x9000>;
+        interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&infracfg_ao CLK_INFRA_AUD_BUS_CK>,
+                 <&infracfg_ao CLK_INFRA_AUD_26M_CK>,
+                 <&infracfg_ao CLK_INFRA_AUD_L_CK>,
+                 <&infracfg_ao CLK_INFRA_AUD_AUD_CK>,
+                 <&infracfg_ao CLK_INFRA_AUD_EG2_CK>;
+        clock-names = "bus_ck",
+                      "26m_ck",
+                      "l_ck",
+                      "aud_ck",
+                      "eg2_ck";
+        assigned-clocks = <&topckgen CLK_TOP_A1SYS_SEL>,
+                          <&topckgen CLK_TOP_AUD_L_SEL>,
+                          <&topckgen CLK_TOP_A_TUNER_SEL>;
+        assigned-clock-parents = <&topckgen CLK_TOP_APLL2_D4>,
+                                 <&apmixedsys CLK_APMIXED_APLL2>,
+                                 <&topckgen CLK_TOP_APLL2_D4>;
+    };
+
+...
-- 
2.18.0


