Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E7FC19F53
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 14:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVmB3IwNsO++LEmxsGA1Of52OGeiLTZOoIEqlaO4Y6U=; b=wEKJTfi6cY1zBY5O7tMV2qYJ0o
	xiUX+rMN7LJzzCBoWiNJGhuYYnTk/Ulu2MKFHWZVtm9xC2r7/ZPYrBXTFXnf8ZpuIuhn39YA4wNaA
	7T3vQAeAxA/e8AaVr4fzXNeUqW9YLJpOtvMNoRcjF0GduovtctpgzEbSYYzk/NBkJijARvADITeJv
	DhJE63idX4r8qqd5nHiRb+H5uLAU7DIP7x5pALaDA0tG9Cu4bI+xwimXk9HRQteCOZhWsh8Dh2dEX
	Yn9Ui5zD2+zMfSLB0qlU1BMI9L5DFaohzDtHUKCpGVYQBSL+PvGIeREv3xbPVSYPWM5WfZf7tdM2o
	f+3geuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4X-00000006eMM-3iEr;
	Tue, 30 Apr 2024 14:03:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4M-00000006eDQ-2fTx
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Apr 2024 14:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sVmB3IwNsO++LEmxsGA1Of52OGeiLTZOoIEqlaO4Y6U=; b=efJAurpMnKSA1z72fAJESBB2gk
	PgP+feXapX0zKGdS0PgeX8bJ6bc3xUpuCuFeCCBqQr+GHE5i8BKUZle8V4cIZ8ly/btxZn4EpPM7X
	qBgDJLN3zjObg62ItvPi+t3ad5zhV+MNKj62mTMrhbxLRkFaI1lnODpk0sTPNY4ZfA04MoE5b+pgN
	fCVchL4VhCvCMcoc31H7z/UJA0IebMwnc5LdcTZt1zcq5y/MQpIBPV20ORChQFS2Q3sJOvkLxT3yN
	hmp/skbWLYIIdXy8FZH5etrDN1+bmTQIUxT9qC3vDAgQzRHxnbQBb28j7+9B2YGIdw9yYlZewx44b
	Maj7xwWg==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4G-0000000GyZU-2ZYM
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 14:02:53 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a58872c07d8so1172672866b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 07:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485767; x=1715090567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVmB3IwNsO++LEmxsGA1Of52OGeiLTZOoIEqlaO4Y6U=;
        b=SyoJPUz+g8MNowiayIrGIBJNNTJvuq5PR1522kaGZlTy0SfO9f7C2pEIkzSlAH9AIy
         GjTl3exqPCTiXmwPrQO/OnU8fITjzVOeLbkG9CxJyHxN/XBK0Yuvmeh4qT1b2HuTGEo2
         mWWPCNWaqgo0L+lXvA/S3mpqNpYnXc3uSVlrIeMWfdOaJ5qfBR+9cXjtQdDXs9uhoQKY
         p0rnrzjlqkGhOiLt8ExMY8f4YGGi06saDka5NhyZsYJ9OSgzHih6wOf4AvFfXdpYNJs3
         XSOQsxZn/3cx8ETKwSa4SC9xfy4aIXvsYf0qgbqWJLQPor9XnZqgN5/mGmYceMDvr3zL
         iKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485767; x=1715090567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVmB3IwNsO++LEmxsGA1Of52OGeiLTZOoIEqlaO4Y6U=;
        b=HxeXviNYB5A0onasFPoJ9JoB3KflmuBNLfQ2qBXaUJmL6swQNnxo0A8LeHX7wYY87M
         XkYvfZaYY17h1ZqBMi97KHoBYxajbU9omgUf0HJnf+spmsp9VQNbtDQd0GPsZe6kIxIq
         8UwthFYu3u5sqTC7ZwiHTSGae9kDaikQhcBw2Ux7r3i0RIi+j1NxcmCGt8ZKmsFcZDWj
         fU5jSsky70Kg+k5z97cqgQnusjXzDFFZhFayYuYIROp2i1wYi3SBh/IOJLv/9yta3Bdp
         do8uCYh5kk9+4h3b4Ut9Woqlw7kd4v9KxTcrX4szCKqQbqxr7k4l1LMK1LPYwdl1WETi
         47TA==
X-Forwarded-Encrypted: i=1; AJvYcCX4u4AKGuADpOMsp9mwMLiiLhq32FkupoPoCasS/GuQzqpTRhNBqZfgnyRH2W+1lieJlnEHzTbHPQ9koAQzTJS7j4//N7zwHN4XHHEKKX38vurw
X-Gm-Message-State: AOJu0YwGM6tq3maFZukv7eOoRL7FZzeWAfWGI/de86HS/H/RC92suOVj
	0l57FMIEnXUXHGVwNwr6FAFSY8MS0fmunzqud5BJz/huz4BVQVLdFKgSkFbrGoU=
X-Google-Smtp-Source: AGHT+IFp03X1JFPDrIujOHhWiOUjRy/996U+B0l6yK76tZHW13kgA6dvKPQweqrNY0l31/l3LaTzjw==
X-Received: by 2002:a17:906:3ac3:b0:a58:ebdd:8aa4 with SMTP id z3-20020a1709063ac300b00a58ebdd8aa4mr2360562ejd.20.1714485766998;
        Tue, 30 Apr 2024 07:02:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:13 +0200
Subject: [PATCH 04/13] ASoC: arm: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-4-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=eDseprbctVXAhiZOvRsQsRjQ1srjlolDCUwu7Poiuqc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnwqTKqjOWhyghuqcWCQALMCLVh7T8zMCEGN
 dvM+Z0GdNKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD58AAKCRDBN2bmhouD
 18RiD/4qLIFwqpuprQ1tMuUxq4zKnCWe3121KK341e3C6K9aJyN/BTLnFTKGCeHCS8O34sFL66W
 T7sO0tVkpzvEVFOfhdAxTxVSNxk8b8r6nlylo9rzqkM9QzU1SQsGJxog0QKojxAO0I6sntjpOI1
 C4eLl6KKsV1j1hvxU76kJP6e32eMeIdiZaAxMmQsQSK0v013+TK6DZ0Pzoka7GW21s3JFCovROF
 vXxmHvtZZeMHmbCCg5y/XZBWunSMfsNrjjgO+mIu7XV7gkK7P9MQYjLZJqqQZ+vhoD2Qg9UAnk7
 OQE9DLavtk9A5wwayHHudVq/E4K3OsGqYV+1R5o5G1+IXBsr5pk5VcYEwd60z1VKxXXSO/b83Yc
 ENbgYWPE1yLUGcTgo4uG5za0uVWxDFi/b7wDRbmmROHuH09+9ryGv2cvKPGHQDn8f6u5L/cH8NS
 Ks+CcsLhi9wVjDnpMDTWNA/8OLpqgOgk1oqEI3Ef0cIjYKbQDoqPj8qg/30LXXJWsi3ixd/UGXX
 LNNqCHmIDRExk6Qjid/ky+fQP2yP3ITflnWYCAlkkGB6jsfhk/qkiIbv4uytjIVSSs+x9OJUdPk
 73ZmPvgfk/AnUFwJpDnK2XdUlBKSk6Z3H5g0na7JWMYATpXKrxMAJjcyW1bMqbdfGqkv8gNWzrz
 mSfEosfDuUmcoLg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_150248_896445_D888FFD5 
X-CRM114-Status: GOOD (  12.19  )
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
 sound/arm/pxa2xx-pcm-lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/arm/pxa2xx-pcm-lib.c b/sound/arm/pxa2xx-pcm-lib.c
index 51d2ff80df16..571e9d909cdf 100644
--- a/sound/arm/pxa2xx-pcm-lib.c
+++ b/sound/arm/pxa2xx-pcm-lib.c
@@ -33,7 +33,7 @@ int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params)
 {
 	struct dma_chan *chan = snd_dmaengine_pcm_get_chan(substream);
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_dmaengine_dai_dma_data *dma_params;
 	struct dma_slave_config config;
 	int ret;
@@ -79,7 +79,7 @@ EXPORT_SYMBOL(pxa2xx_pcm_prepare);
 
 int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_dmaengine_dai_dma_data *dma_params;
 	int ret;

-- 
2.43.0


