Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ED5C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 14:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IV4t0pNrZLc8K3zjbiMUiExRG0rwvdrAQLRnesERno=; b=QiAWbo+vCTyz48xj0duPzNHnRA
	g51hdAgK+nN5meREhgEMJUwHRZEKa9ioCTa78KIjt7ctwKCqQb3I1aVLoW5ytxlJ7bknQJEuLXtSR
	cJEBUoMdpSAB+66jslm+73jJxn9DnA6VkRrdwpi/Y2bgoU+feoX5K71GFNILVkK5Jrc0WGqJyxn5Z
	6jqhq6jjgDJf4szf3RFVDnjwsUOeYrZidDs6NJlS5C4XYfGPwoftUG68fNXQodrYZffrRh7QWgUJC
	z3RBQhqzSidvYpOuU24JT25Ypbb/ya/5ysN8c0efgGLNeELLmBl1G89DuogzRNl1fwrMfmbxIQ+FC
	JGk0ozYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4Z-00000006eN2-0cHt;
	Tue, 30 Apr 2024 14:03:07 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4C-00000006e50-1QQV
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 14:02:54 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a4702457ccbso758681066b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485762; x=1715090562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IV4t0pNrZLc8K3zjbiMUiExRG0rwvdrAQLRnesERno=;
        b=TepLFGsYBaZ1O/LxIA1eEnPrMagcFrhJXFRuzW8nhWV/geOH9Ug7v8fZcoQX51UGM+
         qZ3DorJxiYoOiqufNKW5ZMf9j12L+YkYc8MEea5m/RRo4yQFxx9Kr0npnCRNUwkzKDyV
         vK6/BGa8Qdp7P1VI7RWLPl6hMjsRLR2GrbG3FPEykuSOI1dtJkOdQxoKV4LDFQKrO3CC
         Juk8+1Gc382Ss7sz140S9fYToXxzwhTozJhlfH5BN1AFhdha9+QZK2TLG9ixiXigiRYu
         x6+wVHg6g5akshbHRIxHmzeCdIRXeR2PBeNCktmhW8COI72OHErbiKL+39konDdKSjCT
         jb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485762; x=1715090562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IV4t0pNrZLc8K3zjbiMUiExRG0rwvdrAQLRnesERno=;
        b=H7369MpO40uLKK+Wsn2zzyyAU1AASZXfCvvyoTP7zev1JHPkL/e3SDBs+vQh1xvULt
         Rd03r4m1ASEaNTOHOX3rP9p5bEF+o7Mw5/Hxl6m4GXidspWFPa8bukL7PthP/cTdD/8Z
         WGRdkYYh8uGQNsI04rLenm3hxoH83ZzqyFvors8Em+RQ0uXLzZO2LCRTTWaxnf0W3yTC
         JxRDSMlV8DnN/yLJmvWpnUP0oSBjt3361NwSedckmqSoK4/tkZUxeWn6BD8o7CgOTqys
         EQE+8eyQvt26VpMIjcnJld67K/I9EJmM32AR7vAFnuTTx4/7U4Pn0hJ6ZrkS87ngG7La
         TFPw==
X-Forwarded-Encrypted: i=1; AJvYcCXvGLFe0+6s/nL5mt04PPUPyO7M7k+ia/7eQmo65nPxbz1fpiq2lNPdA/uvQBY3FVGcLtK0MTRvsDGO9Xp6CqRKN+lj6j8egGzN9FD0ZXobkdrP
X-Gm-Message-State: AOJu0Yy3G2H9JgsWOoel/xFtBuqM0rr3+ARhfwnBgTKXPI4ZVXT3bBLr
	gKXr0Q+3+SX8dQ28j4e3QZd7O+J3B3eMzWarTdABo6hGEgzMrDixJzjg1vsWVSM=
X-Google-Smtp-Source: AGHT+IHiryIlMBuC9NM2KOjVX/FiEZN10FwJJA8ZsqNvWyktK2eDEXsG0W+ylaSuA6HZE7/EUxYrVw==
X-Received: by 2002:a17:906:5851:b0:a52:54d8:6d21 with SMTP id h17-20020a170906585100b00a5254d86d21mr10321769ejs.7.1714485761837;
        Tue, 30 Apr 2024 07:02:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:11 +0200
Subject: [PATCH 02/13] ASoC: tegra: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-2-6f8a8902b479@linaro.org>
References: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2412;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NWayqZgMTQyhrridkNgCIJtQs25nYri5VnM17XYp3Mo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnuu9RjFk0ZahGK7moh34+XMb8y5IAinmHhw
 3VHDPhugCqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD57gAKCRDBN2bmhouD
 1zWOD/4+tyzs1xgp6ykzyyJogYehC2MKqc9o7BAwaYhBihjzf+kvS/a49wjR8gzDJ7Vh3y3/hwL
 aLdHFckj8wwv4l0ss9+e4sAMLoHDo7uUPKc+rfA+yOS8XjuXoRm8FI6LehOSZcU8NK5w+LQWJ3U
 ceuoYZ1qz1qlNuzBLWh3xpsoRbk5sjR2sakihrnAleKyfoasgq6+XdUIQ0VJqWO3MEUcYPC/eXU
 h0snq64j4az27aiyUMbwLNSs6H3gn3+qoBo7CHTzJnJ0JDyk11jeRzxeQyznlPWuSUIqCMkCeft
 uT+ECq9fYZbdwFZIupds9jdP/39elefh2kxAnzlm5ROlK2Z/TDTgDQeaEvraSuji6ucd/CTWMOv
 VkU3vwo2GtZi3mVhPPnkMo6Nz5ObAvyQbuIY180agGlUo1VC1+m9LeJ98LBIPAdLIkbp6biPcfM
 6AHQapXJgPIkZGgszpxcOMdIHIf7X4eaVUkr12gdIijUr7p/VilIGXBzL7mADqRC3+Pzk5Q590A
 8MyHOr4aKOGAWSWyPRn1clfTUJnmOg92ZBgTm7yfpzUeQRED96dVL+70aCGXXlCP1V+EwhgZecx
 m2VLP4rPyvCJT3suEVLW0aKsOrnHxRm5mvO2RcJ5U/k/EfE5uCaHFZFgyQE+iEqtAyQa0sQ1Vex
 ffzIPP9MiKJu/1A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_070245_001416_3049FB55 
X-CRM114-Status: GOOD (  12.44  )
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

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/tegra/tegra_asoc_machine.c | 2 +-
 sound/soc/tegra/tegra_pcm.c          | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 192e9692bdf2..775ce433fdbf 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -290,7 +290,7 @@ static unsigned int tegra_machine_mclk_rate_6mhz(unsigned int srate)
 static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 42acb56543db..4bdbcd2635ef 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -76,7 +76,7 @@ EXPORT_SYMBOL_GPL(tegra_pcm_platform_unregister);
 int tegra_pcm_open(struct snd_soc_component *component,
 		   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_dmaengine_dai_dma_data *dmap;
 	struct dma_chan *chan;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -127,7 +127,7 @@ EXPORT_SYMBOL_GPL(tegra_pcm_open);
 int tegra_pcm_close(struct snd_soc_component *component,
 		    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	if (rtd->dai_link->no_pcm)
 		return 0;
@@ -142,7 +142,7 @@ int tegra_pcm_hw_params(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream,
 			struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_dmaengine_dai_dma_data *dmap;
 	struct dma_slave_config slave_config;
 	struct dma_chan *chan;

-- 
2.43.0


