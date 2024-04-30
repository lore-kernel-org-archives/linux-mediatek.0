Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B06DC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KNDmF6F3m74+nDreAw5/fBepQ+vGW6wvqeA9DbjkOo=; b=K7HL9IpKoSEjVxI1rlb/xD7x0b
	KvuO6DrX8MpxLq9FwFrJBp5AirTTPlJxUV+s9DlME8N5rXj9OGMNwHPG3SpE+29nHvD7JL2nwSRkf
	Kb5NibcMifb07JLz7tamTBNClnWriHd2gx5z8T8iH8WyBhywkHhjNBkInSQ8AiNunFF5gGzRpYCWr
	IxiuNkSSZZgnJAqMpRIreSfveCu661vwutoDQoBeGQcxVUEuiiWjeqMtheDw+cfWPp7w8SBbvHCNZ
	CQ4zY3zvFAe2haN9rzCtziUDKCkUON6TJikDL4FlF3wJshh2uW+XJDwQ3YoJOM2rxz6Dzi3u+KFZI
	W8x8bSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o5I-00000006exP-0rBH;
	Tue, 30 Apr 2024 14:03:52 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4M-00000006eDI-1H4M
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 14:03:10 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a58e787130fso533420966b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 07:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485773; x=1715090573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KNDmF6F3m74+nDreAw5/fBepQ+vGW6wvqeA9DbjkOo=;
        b=dECVjYic2OVdCURmbj104Dp8Mvv93nwidVqyxgLLP+yz5rWTrOBpqTDeyvLkFNLYEI
         NB1rNnjZSR3SPSL1qeczR+Bwihj5DQQL5RFaWcpjMn/GaUSDfE7FFNHFdCshaHg6JDlw
         O6E012pM+UWauIr0AMHtLGyK1lc0LBhW3F0d9KaFogZSc85yySr7bvgV3V1GvkxMd5dR
         7WExAAchSM41VW7+m0p0rnY8Pa0D0anXU0in4dstgyrxQR3qGoRQGT+f/wl6kjrUbzNQ
         Jms7p++imWOGY5TBz2HJTCbe65uOKXkz1Cx+fK2CRfw6zaiesYVkllrdWVEoUq1lYCej
         uU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485773; x=1715090573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KNDmF6F3m74+nDreAw5/fBepQ+vGW6wvqeA9DbjkOo=;
        b=Dl6wIvZUQIHjPMdYQipkvBt/3CxX2IaB4jeyQYv89+KkBFw0iMBEIRrr2bJeSE94nD
         nqkKxeSoUN25cC03rdbunl4kxNT9zGI97HepdBghEgkLRgGA8zUTvRIBrlbzThQ0Gr2a
         z8xXESBQYi8E9c8xBr5jJxBOBrf96GvMOJPvEruu/pIItvZ2fix5Yaxlkpc3AfbT07Tn
         F8XGnP5jtXcctcRT38SqPqv/c6/8GgKvPCLzrlHbIQJxlrB+4/Zot3a4ShuBWwKKMWKr
         Y49KuRYZ0kb+S1blyrDdOovkUqOCifDAGlv8md9dcLD03LGPMZdnwLacZsIot5BihVgt
         TQ9g==
X-Forwarded-Encrypted: i=1; AJvYcCUm47Wm6/HGGw0AhtSndYjjb5WKD/EtoijkTkn1c2wwqzmb4XadNzdR4lyX2goW8wmoogVz4EXOlFvL/7qSxSmaiJro6FrNTk4N6OlIf5miJgRi
X-Gm-Message-State: AOJu0Yxba+XY1pekjW/aWfffnWW4l8niE4eLTW1JJqv6e9KLqheG1R5m
	1WpXmxnuYTCjQlzy9sxLKNc2Ng3d7SLEteIL7UfdsB2QN5nIb/Eh6G6xsMzFLPk=
X-Google-Smtp-Source: AGHT+IG/ZiponzJElmGagl83BnX3KT4uxCge8Ge47biNA19yQUZRpq529TvSC+CjU+ZaC4bHHg0f4A==
X-Received: by 2002:a17:907:7892:b0:a51:abd8:8621 with SMTP id ku18-20020a170907789200b00a51abd88621mr2756333ejc.19.1714485772679;
        Tue, 30 Apr 2024 07:02:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:14 +0200
Subject: [PATCH 05/13] ASoC: amd: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-5-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2245;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/1R0OmMKMV4s3Y8w3vGDBextL0ongiiaeIRyC36ykHM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnxeEAVYc1UmVefhlabtyjgdGe38YIR/9kHe
 88Pd0erXViJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD58QAKCRDBN2bmhouD
 13M+D/4v2IeMte5vzz35J+GSwt7AUvJI6iiLCBM0Feu/9wQWRBj36O7yPQreb40lyCMtfUWWmb8
 PShQ3rPb8K6XWqMorWGoy5zD+sdIlhb3aWdBInfWwoMeTWxADZZqB+m8/PW3NnAEd9TqRNPKDzQ
 jWO60UiF8okwGVwjHAgprvGmhVSjbNI5b5g/PnV4ttO98aUjFne8AK3/v4C1DcS3awukX5VnTy1
 o1tZft+T6oiNutSPknPNyp2e5UMWDq8hNQzw3jdk4AaoJE9hpFvcrsQPZ+VnqOYZgBEvVVxzBvP
 F2I2uZ0c0mauf6GMEdHrqzLHGBc1gp99UZ8uAQssnSLSezJhM1SeIt5OCFiN9uy9UuvLStU2nks
 AQ2HWvKuN0XC7sRtuOgRTf8M30UUcO1Dm1iNeyQ3t4JdCEiXZ/ZQnG0+G8T2RN2gTcHBw76uZtA
 wt6P3w7TbxrYOWmPYbdW3DPPI4BMRNgYcPkq2qUpO3Ni0yaF5U/tH7Zprko1lynY03aPlkdyyeH
 p0Fg98AeEb7XYDd0cAJPC/j2leODUWvm/g8HvufxNzL7j78grTfc59M1lb9ogOQp9e2K1UDEAvB
 Efq5+HYBjP++8fA9Gwf5msphLx/h/eRifC+99A5yPh9l9gtluGNv38A8cEcrlAMPbo/N0GbTHXH
 R12gBWVNQAkbTwQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_070254_641569_F9369411 
X-CRM114-Status: GOOD (  12.61  )
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
 sound/soc/amd/acp/acp-mach-common.c  | 2 +-
 sound/soc/amd/acp3x-rt5682-max9836.c | 2 +-
 sound/soc/amd/ps/ps-sdw-dma.c        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 665a6ea0a2a8..a36300a4ed8a 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -217,7 +217,7 @@ static void acp_card_shutdown(struct snd_pcm_substream *substream)
 static int acp_card_rt5682_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index d6cdb6d9fdd6..357dfd016baf 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -143,7 +143,7 @@ static int rt5682_clk_enable(struct snd_pcm_substream *substream)
 static int acp3x_1015_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int srate, i, ret;
 
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 66b800962f8c..2f630753278d 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -218,7 +218,7 @@ static int acp63_sdw_dma_open(struct snd_soc_component *component,
 	struct acp_sdw_dma_stream *stream;
 	struct snd_soc_dai *cpu_dai;
 	struct amd_sdw_manager *amd_manager;
-	struct snd_soc_pcm_runtime *prtd = substream->private_data;
+	struct snd_soc_pcm_runtime *prtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	runtime = substream->runtime;

-- 
2.43.0


