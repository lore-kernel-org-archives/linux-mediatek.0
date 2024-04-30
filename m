Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905CAC10F16
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 19:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQq1oWqrCF0TfrogSNrGXKQjYOwjvsMuDYhQTiGCeqo=; b=xYs02FRFHenPd3B5z5x/yOSqKY
	xfMzsCmIjpR51bAM8er34Ep/D999vXS8G0fFBHG9czmDdsf0+osbd9by4htasCoeaFN7v9ZrOFaH3
	sGGboZI+yiUgem/tL3G2jj0XtZggLI29+EVoxeGygaPkAo3phe+kr16o2za0w9y5IHeroSgBjkBD8
	8SrC7iykQIYVv7M99f98K83/wpmP8Z5xPrfWF44rm/llMLCrK0hfHcYbHkKMx0dO/rwBj7TTZZanc
	53loDfDRBDzxteOIC0UsWtAwuVVLx3uzhrk0deWIRxp9JPCxcuyHqSSB8X24q3gk1zHf1CIvpJ4Mt
	DAkeCKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tYI-00000007lmK-2FBR;
	Tue, 30 Apr 2024 19:54:11 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tY4-00000007lhs-2Aod;
	Tue, 30 Apr 2024 19:53:58 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a51a7d4466bso676636366b.2;
        Tue, 30 Apr 2024 12:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714506833; x=1715111633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQq1oWqrCF0TfrogSNrGXKQjYOwjvsMuDYhQTiGCeqo=;
        b=Axzx2sTiLta5kb6UocddvHHGBeVNVFloztVg6t/BM/dZMAMlN+nqstUiRT7YPcBpua
         hkuEpknIixQSzXE/815bub2RToOTJS++/ntSb8WrlLFOxuQZBoRqwLu4RoyBcIYbajTg
         /LbQl1aCd2iph2nddhVEyW67LB2ogwTXF9k3hVdNsM7pdK2uXcJJz43P48QGZkUMaAJd
         hmC81zMR/08mBkgF6YkoUqdDeaibOLrwenEVm0AeC9p5+71TpDyj9MQVU2BUFED0PWrF
         dzgCiO3Do6BNRZOrQsOOo/7012KM0ONlbVIrwlKeqJS2MZ7wOS+ZTtXTcbhboJDX/d1x
         7TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714506833; x=1715111633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQq1oWqrCF0TfrogSNrGXKQjYOwjvsMuDYhQTiGCeqo=;
        b=V0NLafOQx4YqnQpfg/YSD1nAp+YIetV6s/Ip+nu0GWBHPuUoPTqqby3ekEFEpcFeQi
         MKu9omo9Vy6JHwUy29W84JJ4sSp7R6rEv0OKb/Y7pTRL+UvVwO2Rz5Ww0WwVuce/PJ1u
         aMk/MoafWuIBl8jLOSKnk3hLYsUEUYy3W5/SgWicepYFAPm6YXKhUJJNMk9U7K4QCU1+
         foyPFNI5njfE2xgqoWyYkWjr70oS1Q4o0aUD+IDlUk4f5Hgz3XVeD0uJ0Mm25/IWSVwk
         F8LBSqN2Wyv1qYeCfKuBEeMo/7HliF8U1EVfTAPeRLFUC8tSXpiphZxi5CjSySJVGwOc
         rCkA==
X-Forwarded-Encrypted: i=1; AJvYcCV3wYK0CtCq3wxu8XIYXYvoC6UiVl6WV8j2hgeYMtrtiOGYefPyn286ZsKhMQ9J50bsBAkusqXELyzPfez4+ZX/o6lp6Fxqzmvx7sW2c9U5p7AAg2RlGFzNBYfTj63IoS6sfZla1asgxAic9ltOqDwlMy7DAXl5OI3qtmdGKGdQkx01QpQzwh8I7Xluwrm/gqHksdeETHwrGt6cRw==
X-Gm-Message-State: AOJu0YwaEcakA1yXjFCjjulFD63HeELORaneaeF9FgO5eubiuinmjIgU
	J3lB2rXNO+1HwgKtClPObuEllqsKiQhpvuQg3xC3eHb5cMRH+AiR
X-Google-Smtp-Source: AGHT+IHcHyFMebv11hNczXbfOSBPzOfPEK56ZS5IQDWu8DzPrwNQuSSocR8UcDfVrVvZhY8lrKqE1g==
X-Received: by 2002:a17:906:a084:b0:a55:387b:eef9 with SMTP id q4-20020a170906a08400b00a55387beef9mr455005ejy.10.1714506832645;
        Tue, 30 Apr 2024 12:53:52 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 13-20020a170906058d00b00a522d34fee8sm15418045ejn.114.2024.04.30.12.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 12:53:52 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
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
 Samuel Holland <samuel@sholland.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 13/13] ASoC: sunxi: Use snd_soc_substream_to_rtd() for accessing
 private_data
Date: Tue, 30 Apr 2024 21:53:49 +0200
Message-ID: <3292058.44csPzL39Z@jernej-laptop>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-13-6f8a8902b479@linaro.org>
References: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
 <20240430-asoc-snd-substream-clean-v1-13-6f8a8902b479@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_125356_705620_7BAC9355 
X-CRM114-Status: GOOD (  16.10  )
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

Dne torek, 30. april 2024 ob 16:02:22 GMT +2 je Krzysztof Kozlowski napisal(a):
> Do not open-code snd_soc_substream_to_rtd().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun50i-dmic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
> index c76628bc86c6..fedfa4fc95fb 100644
> --- a/sound/soc/sunxi/sun50i-dmic.c
> +++ b/sound/soc/sunxi/sun50i-dmic.c
> @@ -74,7 +74,7 @@ static const struct dmic_rate dmic_rate_s[] = {
>  static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
>  			       struct snd_soc_dai *cpu_dai)
>  {
> -	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
>  
>  	/* only support capture */
> 
> 





