Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422B4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9tRWmtBaoaK4zweAqPk3c9H280G8/Evn02sKDLL9NA=; b=22cjYb4LG9i53t
	mxdinVCXYG6fJ+L9nFihnQh7jhAu9tslD+gFwymXosD72oxM9C0neLE79rvfINvPVCksNDDtSU4hT
	OshWaFfyRgcIPa2rdoaPS+EXTpxwZgZr+U7YZRYzmjjzBXF+PHNIAq7PgITjv2cblphqbIupLPgqO
	+qyp5Fi0Fxa3NUr8bBSsr8hWN48/WfwnBOVVelczQLXnLoLQ+d4b2YEsD317Tq84P6PSJw2Hsccsh
	Xb/DuF2qn7lIBwql3NQMpFGkQIagj6tMU0xAkun/7Pr1pCsz+A9Q6ViU7jhq1fD37x3QLGnbat5A5
	I1hXbyos6/wtZmiQgeYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKhLx-00Apqd-C9; Thu, 17 Feb 2022 14:01:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKhCq-00Al7v-W6; Thu, 17 Feb 2022 13:52:30 +0000
X-UUID: a53541df274a496489c84402d7511a21-20220217
X-UUID: a53541df274a496489c84402d7511a21-20220217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1488184057; Thu, 17 Feb 2022 06:52:19 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 05:42:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 17 Feb 2022 21:42:25 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 21:42:25 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <perex@perex.cz>, <p.zabel@pengutronix.de>,
 <geert+renesas@glider.be>, <trevor.wu@mediatek.com>, <tzungbi@google.com>,
 <aaronyu@google.com>, <zhangqilong3@huawei.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [v2 13/17] dt-bindings: mediatek: mt8186: add audio afe document
Date: Thu, 17 Feb 2022 21:42:01 +0800
Message-ID: <20220217134205.15400-14-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_055225_097072_D4144A58 
X-CRM114-Status: GOOD (  10.93  )
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

This patch adds mt8186 audio afe document.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 .../bindings/sound/mt8186-afe-pcm.yaml        | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
new file mode 100644
index 000000000000..88f82d096443
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek AFE PCM controller for mt8186
+
+maintainers:
+  - Jiaxin Yu <jiaxin.yu@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8186-sound
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: audiosys
+
+  mediatek,apmixedsys:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of the mediatek apmixedsys controller
+
+  mediatek,infracfg:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of the mediatek infracfg controller
+
+  mediatek,topckgen:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of the mediatek topckgen controller
+
+  clocks:
+    items:
+      - description: audio infra sys clock
+      - description: audio infra 26M clock
+      - description: audio top mux
+      - description: audio intbus mux
+      - description: mainpll 136.5M clock
+      - description: faud1 mux
+      - description: apll1 clock
+      - description: faud2 mux
+      - description: apll2 clock
+      - description: audio engen1 mux
+      - description: apll1_d8 22.5792M clock
+      - description: audio engen2 mux
+      - description: apll2_d8 24.576M clock
+      - description: i2s0 mclk mux
+      - description: i2s1 mclk mux
+      - description: i2s2 mclk mux
+      - description: i2s4 mclk mux
+      - description: tdm mclk mux
+      - description: i2s0_mck divider
+      - description: i2s1_mck divider
+      - description: i2s2_mck divider
+      - description: i2s4_mck divider
+      - description: tdm_mck divider
+      - description: audio hires mux
+      - description: 26M clock
+
+  clock-names:
+    items:
+      - const: aud_infra_clk
+      - const: mtkaif_26m_clk
+      - const: top_mux_audio
+      - const: top_mux_audio_int
+      - const: top_mainpll_d2_d4
+      - const: top_mux_aud_1
+      - const: top_apll1_ck
+      - const: top_mux_aud_2
+      - const: top_apll2_ck
+      - const: top_mux_aud_eng1
+      - const: top_apll1_d8
+      - const: top_mux_aud_eng2
+      - const: top_apll2_d8
+      - const: top_i2s0_m_sel
+      - const: top_i2s1_m_sel
+      - const: top_i2s2_m_sel
+      - const: top_i2s4_m_sel
+      - const: top_tdm_m_sel
+      - const: top_apll12_div0
+      - const: top_apll12_div1
+      - const: top_apll12_div2
+      - const: top_apll12_div4
+      - const: top_apll12_div_tdm
+      - const: top_mux_audio_h
+      - const: top_clk26m_clk
+
+required:
+  - compatible
+  - interrupts
+  - resets
+  - reset-names
+  - mediatek,apmixedsys
+  - mediatek,infracfg
+  - mediatek,topckgen
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe: mt8186-afe-pcm@11210000 {
+        compatible = "mediatek,mt8186-sound";
+        reg = <0x11210000 0x2000>;
+        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&watchdog 17>; //MT8186_TOPRGU_AUDIO_SW_RST
+        reset-names = "audiosys";
+        mediatek,apmixedsys = <&apmixedsys>;
+        mediatek,infracfg = <&infracfg>;
+        mediatek,topckgen = <&topckgen>;
+        clocks = <&infracfg_ao 44>, //CLK_INFRA_AO_AUDIO
+                 <&infracfg_ao 54>, //CLK_INFRA_AO_AUDIO_26M_BCLK
+                 <&topckgen 15>, //CLK_TOP_AUDIO
+                 <&topckgen 16>, //CLK_TOP_AUD_INTBUS
+                 <&topckgen 70>, //CLK_TOP_MAINPLL_D2_D4
+                 <&topckgen 17>, //CLK_TOP_AUD_1
+                 <&apmixedsys 12>, //CLK_APMIXED_APLL1
+                 <&topckgen 18>, //CLK_TOP_AUD_2
+                 <&apmixedsys 13>, //CLK_APMIXED_APLL2
+                 <&topckgen 19>, //CLK_TOP_AUD_ENGEN1
+                 <&topckgen 101>, //CLK_TOP_APLL1_D8
+                 <&topckgen 20>, //CLK_TOP_AUD_ENGEN2
+                 <&topckgen 104>, //CLK_TOP_APLL2_D8
+                 <&topckgen 63>, //CLK_TOP_APLL_I2S0_MCK_SEL
+                 <&topckgen 64>, //CLK_TOP_APLL_I2S1_MCK_SEL
+                 <&topckgen 65>, //CLK_TOP_APLL_I2S2_MCK_SEL
+                 <&topckgen 66>, //CLK_TOP_APLL_I2S4_MCK_SEL
+                 <&topckgen 67>, //CLK_TOP_APLL_TDMOUT_MCK_SEL
+                 <&topckgen 131>, //CLK_TOP_APLL12_CK_DIV0
+                 <&topckgen 132>, //CLK_TOP_APLL12_CK_DIV1
+                 <&topckgen 133>, //CLK_TOP_APLL12_CK_DIV2
+                 <&topckgen 134>, //CLK_TOP_APLL12_CK_DIV4
+                 <&topckgen 135>, //CLK_TOP_APLL12_CK_DIV_TDMOUT_M
+                 <&topckgen 44>, //CLK_TOP_AUDIO_H
+                 <&clk26m>;
+        clock-names = "aud_infra_clk",
+                      "mtkaif_26m_clk",
+                      "top_mux_audio",
+                      "top_mux_audio_int",
+                      "top_mainpll_d2_d4",
+                      "top_mux_aud_1",
+                      "top_apll1_ck",
+                      "top_mux_aud_2",
+                      "top_apll2_ck",
+                      "top_mux_aud_eng1",
+                      "top_apll1_d8",
+                      "top_mux_aud_eng2",
+                      "top_apll2_d8",
+                      "top_i2s0_m_sel",
+                      "top_i2s1_m_sel",
+                      "top_i2s2_m_sel",
+                      "top_i2s4_m_sel",
+                      "top_tdm_m_sel",
+                      "top_apll12_div0",
+                      "top_apll12_div1",
+                      "top_apll12_div2",
+                      "top_apll12_div4",
+                      "top_apll12_div_tdm",
+                      "top_mux_audio_h",
+                      "top_clk26m_clk";
+    };
+
+...
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
