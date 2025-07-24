Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE009C87FD2
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/vtfK9wMv9MhQSnxWidExF7KHKn1WTt2YiNVb2zkLI=; b=1Y0Lbpem7Vxonr
	tuNpLYhvcY4DNvfzHqMoN5VjPWxWx+1Z9VGmZhLojyLyFqjxJupdVmE4pW+ZLRXBgLiZp7rLHpoao
	KzOAFhdtL3RxQ45PuuSXj6r430oXPOWWQk69Oy4Cg6xLTamCZP1WrCMeAxVB7roBtDwY/Ad9yGPAI
	buv7891eFLVMAU9mjYXVfRg5OQ8OGWV3pdVGexpP7Dp+Wou6J71tfPFUDdZXUimkyU2APggdyhSsw
	YKb30guEA9dGtVOBjxqA2gcKw5JiNeelQL3SqwS7b8CcCK3hWyQBUV9bivldjk+/r2RGAyvYXy/v6
	miPYWDnAs0gInOANsSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesYh-000000076I0-2wCc;
	Thu, 24 Jul 2025 09:48:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerUH-00000006tFa-2woD;
	Thu, 24 Jul 2025 08:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346376;
	bh=TGYeEn4rASoelIzUMmy2maV8vGwdr+8gRNZVgzYxZXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YqSRG/fCxQRunFFV1yGdU6hNqpqitP4mUJtNHR93jnSyNVDd3Sk8tGhDtEzxJAMXQ
	 sD6xmva1gESfpH1fDDwHsbrXi/KruWYbrpyQ8GdEfI05FnHdMGF7BApomejzwxxRaC
	 HLJEp2BhbB1VDYvszNp7zyD/wPULNWnqTwE2Il5GdP527r78pWae5QbIZqg5VybC5f
	 bRpZckGWQBfIPfyc3KDRBE2QYnr1yv1p/lmfjDVSDwu2i160GYGFAc3fPu/aDKZtYu
	 6S4GPENKRehIwdZjMcl0r1qzPbMClhKcA8bXFW9WoAEV1n7RYt3nelGmR3E6gWHV0E
	 0vM1jkRwenw3g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C4ED17E129C;
	Thu, 24 Jul 2025 10:39:33 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 04/38] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
Date: Thu, 24 Jul 2025 10:38:40 +0200
Message-ID: <20250724083914.61351-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_013937_920725_5C78CAC8 
X-CRM114-Status: UNSURE (   8.86  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Both clocks and clock-names are missing (a lot of) entries: add
all the used audio clocks and their description and also fix the
example node.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/sound/mt8192-afe-pcm.yaml        | 106 +++++++++++++++++-
 1 file changed, 104 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 8ddf49b0040d..96ee0a47360d 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -47,16 +47,118 @@ properties:
       - description: AFE clock
       - description: ADDA DAC clock
       - description: ADDA DAC pre-distortion clock
-      - description: audio infra sys clock
-      - description: audio infra 26M clock
+      - description: ADDA ADC clock
+      - description: ADDA6 ADC clock
+      - description: Audio low-jitter 22.5792m clock
+      - description: Audio low-jitter 24.576m clock
+      - description: Audio PLL1 tuner clock
+      - description: Audio PLL2 tuner clock
+      - description: Audio Time-Division Multiplexing interface clock
+      - description: ADDA ADC Sine Generator clock
+      - description: audio Non-LE clock
+      - description: Audio DAC High-Resolution clock
+      - description: Audio High-Resolution ADC clock
+      - description: Audio High-Resolution ADC SineGen clock
+      - description: Audio ADDA6 High-Resolution ADC clock
+      - description: Tertiary ADDA DAC clock
+      - description: Tertiary ADDA DAC pre-distortion clock
+      - description: Tertiary ADDA DAC Sine Generator clock
+      - description: Tertiary ADDA DAC High-Resolution clock
+      - description: Audio infra sys clock
+      - description: Audio infra 26M clock
+      - description: Mux for audio clock
+      - description: Mux for audio internal bus clock
+      - description: Mux main divider by 4
+      - description: Primary audio mux
+      - description: Primary audio PLL
+      - description: Secondary audio mux
+      - description: Secondary audio PLL
+      - description: Primary audio en-generator clock
+      - description: Primary PLL divider by 4 for IEC
+      - description: Secondary audio en-generator clock
+      - description: Secondary PLL divider by 4 for IEC
+      - description: Mux selector for I2S port 0
+      - description: Mux selector for I2S port 1
+      - description: Mux selector for I2S port 2
+      - description: Mux selector for I2S port 3
+      - description: Mux selector for I2S port 4
+      - description: Mux selector for I2S port 5
+      - description: Mux selector for I2S port 6
+      - description: Mux selector for I2S port 7
+      - description: Mux selector for I2S port 8
+      - description: Mux selector for I2S port 9
+      - description: APLL1 and APLL2 divider for I2S port 0
+      - description: APLL1 and APLL2 divider for I2S port 1
+      - description: APLL1 and APLL2 divider for I2S port 2
+      - description: APLL1 and APLL2 divider for I2S port 3
+      - description: APLL1 and APLL2 divider for I2S port 4
+      - description: APLL1 and APLL2 divider for IEC
+      - description: APLL1 and APLL2 divider for I2S port 5
+      - description: APLL1 and APLL2 divider for I2S port 6
+      - description: APLL1 and APLL2 divider for I2S port 7
+      - description: APLL1 and APLL2 divider for I2S port 8
+      - description: APLL1 and APLL2 divider for I2S port 9
+      - description: Top mux for audio subsystem
+      - description: 26MHz clock for audio subsystem
 
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
-- 
2.50.1


