Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9D0C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 02:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLaKgE/eIrJMWqUe/2X8txAC/OlA0l+Ka/LbCZAUBuA=; b=KiM3oegPzGLNtf
	vJHtbBXYbKpCQW8COM6dYB7dbGpAJiQ0+hcJ5Nz2onhK0nrQlQAd88227tDww58Wsy/qpyiFkHJFe
	ZyoZ7pwbdzDc30++28Zy/1v1JHlGRqgHFANWib1vz1RdKnju8/kKWkl9T8GweJo3ZxbCQpx5zyHid
	xr5jfkBvmYyxblQyYXLu/sjcruOeqNVF6Lh+pgK98Fg4sRjNWUtZGH7GwjdXvuixOjHhCcCTAuMvz
	jEtmobEs4luDTPzxUi80IQgRmwMO+QsH5f+1UNgdrRb5o0PRXtUmjvOtEPCfE87Mx7xOcxfoh91/h
	E11icYwPv8GAaFAOWRQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nge2g-001DHo-0q; Tue, 19 Apr 2022 02:56:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nge2K-001D3l-SK; Tue, 19 Apr 2022 02:56:18 +0000
X-UUID: 9387defdee5e49d995e691fc733e1140-20220418
X-UUID: 9387defdee5e49d995e691fc733e1140-20220418
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 586087954; Mon, 18 Apr 2022 19:56:04 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Apr 2022 19:56:02 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 Apr 2022 10:56:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 Apr 2022 10:56:00 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Allen-KH
 Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: mediatek: mt8192: complete clocks and
 clock-names
Date: Tue, 19 Apr 2022 10:55:56 +0800
Message-ID: <20220419025557.22262-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220419025557.22262-1-allen-kh.cheng@mediatek.com>
References: <20220419025557.22262-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_195617_031435_9955C690 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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

From: Jiaxin Yu <jiaxin.yu@mediatek.com>

Complete all clocks and clock-names be used for mt8192 SoC into dt-bindings.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 .../bindings/sound/mt8192-afe-pcm.yaml        | 165 +++++++++++++++++-
 1 file changed, 157 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 7a25bc9b8060..1b6b22a5732e 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -39,20 +39,67 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: AFE clock
-      - description: ADDA DAC clock
-      - description: ADDA DAC pre-distortion clock
-      - description: audio infra sys clock
-      - description: audio infra 26M clock
+    minItems: 56
+    maxItems: 56
 
   clock-names:
     items:
       - const: aud_afe_clk
       - const: aud_dac_clk
       - const: aud_dac_predis_clk
+      - const: aud_adc_clk
+      - const: aud_adda6_adc_clk
+      - const: aud_apll22m_clk
+      - const: aud_apll24m_clk
+      - const: aud_apll1_tuner_clk
+      - const: aud_apll2_tuner_clk
+      - const: aud_tdm_clk
+      - const: aud_tml_clk
+      - const: aud_nle
+      - const: aud_dac_hires_clk
+      - const: aud_adc_hires_clk
+      - const: aud_adc_hires_tml
+      - const: aud_adda6_adc_hires_clk
+      - const: aud_3rd_dac_clk
+      - const: aud_3rd_dac_predis_clk
+      - const: aud_3rd_dac_tml
+      - const: aud_3rd_dac_hires_clk
       - const: aud_infra_clk
       - const: aud_infra_26m_clk
+      - const: top_mux_audio
+      - const: top_mux_audio_int
+      - const: top_mainpll_d4_d4
+      - const: top_mux_aud_1
+      - const: top_apll1_ck
+      - const: top_mux_aud_2
+      - const: top_apll2_ck
+      - const: top_mux_aud_eng1
+      - const: top_apll1_d4
+      - const: top_mux_aud_eng2
+      - const: top_apll2_d4
+      - const: top_i2s0_m_sel
+      - const: top_i2s1_m_sel
+      - const: top_i2s2_m_sel
+      - const: top_i2s3_m_sel
+      - const: top_i2s4_m_sel
+      - const: top_i2s5_m_sel
+      - const: top_i2s6_m_sel
+      - const: top_i2s7_m_sel
+      - const: top_i2s8_m_sel
+      - const: top_i2s9_m_sel
+      - const: top_apll12_div0
+      - const: top_apll12_div1
+      - const: top_apll12_div2
+      - const: top_apll12_div3
+      - const: top_apll12_div4
+      - const: top_apll12_divb
+      - const: top_apll12_div5
+      - const: top_apll12_div6
+      - const: top_apll12_div7
+      - const: top_apll12_div8
+      - const: top_apll12_div9
+      - const: top_mux_audio_h
+      - const: top_clk26m_clk
 
 required:
   - compatible
@@ -88,13 +135,115 @@ examples:
         clocks = <&audsys CLK_AUD_AFE>,
                  <&audsys CLK_AUD_DAC>,
                  <&audsys CLK_AUD_DAC_PREDIS>,
+                 <&audsys CLK_AUD_ADC>,
+                 <&audsys CLK_AUD_ADDA6_ADC>,
+                 <&audsys CLK_AUD_22M>,
+                 <&audsys CLK_AUD_24M>,
+                 <&audsys CLK_AUD_APLL_TUNER>,
+                 <&audsys CLK_AUD_APLL2_TUNER>,
+                 <&audsys CLK_AUD_TDM>,
+                 <&audsys CLK_AUD_TML>,
+                 <&audsys CLK_AUD_NLE>,
+                 <&audsys CLK_AUD_DAC_HIRES>,
+                 <&audsys CLK_AUD_ADC_HIRES>,
+                 <&audsys CLK_AUD_ADC_HIRES_TML>,
+                 <&audsys CLK_AUD_ADDA6_ADC_HIRES>,
+                 <&audsys CLK_AUD_3RD_DAC>,
+                 <&audsys CLK_AUD_3RD_DAC_PREDIS>,
+                 <&audsys CLK_AUD_3RD_DAC_TML>,
+                 <&audsys CLK_AUD_3RD_DAC_HIRES>,
                  <&infracfg CLK_INFRA_AUDIO>,
-                 <&infracfg CLK_INFRA_AUDIO_26M_B>;
+                 <&infracfg CLK_INFRA_AUDIO_26M_B>,
+                 <&topckgen CLK_TOP_AUDIO_SEL>,
+                 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+                 <&topckgen CLK_TOP_MAINPLL_D4_D4>,
+                 <&topckgen CLK_TOP_AUD_1_SEL>,
+                 <&topckgen CLK_TOP_APLL1>,
+                 <&topckgen CLK_TOP_AUD_2_SEL>,
+                 <&topckgen CLK_TOP_APLL2>,
+                 <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
+                 <&topckgen CLK_TOP_APLL1_D4>,
+                 <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
+                 <&topckgen CLK_TOP_APLL2_D4>,
+                 <&topckgen CLK_TOP_APLL_I2S0_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S1_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S2_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S3_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S4_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S5_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S6_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S7_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S8_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S9_M_SEL>,
+                 <&topckgen CLK_TOP_APLL12_DIV0>,
+                 <&topckgen CLK_TOP_APLL12_DIV1>,
+                 <&topckgen CLK_TOP_APLL12_DIV2>,
+                 <&topckgen CLK_TOP_APLL12_DIV3>,
+                 <&topckgen CLK_TOP_APLL12_DIV4>,
+                 <&topckgen CLK_TOP_APLL12_DIVB>,
+                 <&topckgen CLK_TOP_APLL12_DIV5>,
+                 <&topckgen CLK_TOP_APLL12_DIV6>,
+                 <&topckgen CLK_TOP_APLL12_DIV7>,
+                 <&topckgen CLK_TOP_APLL12_DIV8>,
+                 <&topckgen CLK_TOP_APLL12_DIV9>,
+                 <&topckgen CLK_TOP_AUDIO_H_SEL>,
+                 <&clk26m>;
         clock-names = "aud_afe_clk",
                       "aud_dac_clk",
                       "aud_dac_predis_clk",
+                      "aud_adc_clk",
+                      "aud_adda6_adc_clk",
+                      "aud_apll22m_clk",
+                      "aud_apll24m_clk",
+                      "aud_apll1_tuner_clk",
+                      "aud_apll2_tuner_clk",
+                      "aud_tdm_clk",
+                      "aud_tml_clk",
+                      "aud_nle",
+                      "aud_dac_hires_clk",
+                      "aud_adc_hires_clk",
+                      "aud_adc_hires_tml",
+                      "aud_adda6_adc_hires_clk",
+                      "aud_3rd_dac_clk",
+                      "aud_3rd_dac_predis_clk",
+                      "aud_3rd_dac_tml",
+                      "aud_3rd_dac_hires_clk",
                       "aud_infra_clk",
-                      "aud_infra_26m_clk";
+                      "aud_infra_26m_clk",
+                      "top_mux_audio",
+                      "top_mux_audio_int",
+                      "top_mainpll_d4_d4",
+                      "top_mux_aud_1",
+                      "top_apll1_ck",
+                      "top_mux_aud_2",
+                      "top_apll2_ck",
+                      "top_mux_aud_eng1",
+                      "top_apll1_d4",
+                      "top_mux_aud_eng2",
+                      "top_apll2_d4",
+                      "top_i2s0_m_sel",
+                      "top_i2s1_m_sel",
+                      "top_i2s2_m_sel",
+                      "top_i2s3_m_sel",
+                      "top_i2s4_m_sel",
+                      "top_i2s5_m_sel",
+                      "top_i2s6_m_sel",
+                      "top_i2s7_m_sel",
+                      "top_i2s8_m_sel",
+                      "top_i2s9_m_sel",
+                      "top_apll12_div0",
+                      "top_apll12_div1",
+                      "top_apll12_div2",
+                      "top_apll12_div3",
+                      "top_apll12_div4",
+                      "top_apll12_divb",
+                      "top_apll12_div5",
+                      "top_apll12_div6",
+                      "top_apll12_div7",
+                      "top_apll12_div8",
+                      "top_apll12_div9",
+                      "top_mux_audio_h",
+                      "top_clk26m_clk";
     };
 
 ...
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
