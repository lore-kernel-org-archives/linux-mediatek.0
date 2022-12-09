Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184E9C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 18:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4w6shm/Wpz6ggc4zMRhzb9FfoJ4MU+lSfUxwokG/Em0=; b=S5xesbbotInclRqhcazjrHzHZ8
	yYIbMoErsVG5ElRewE/Syi18p9aL+2zdYuwsrA5Qyitp0qsnTwJE34LtLprA5FcK+QsAPDRGQ5fzn
	A4zjztL73wnwFsVNaQgLSOOa75ILcVhPki/mTqixQyVFljB5xbf7Q7j+YXiynQdKfAXMHWSwfHoG3
	D8ZX8SjPlxf/UkX+zbnrGcbjyDlJjPyzxs3nIgAjE7E09uQULITEn6mZwo87+DOaSlF1rFhezD7Z6
	rOEpqh+ZHUbA5rNhyfWv1eDja+ZpQyKz9FM6drzUgR8RqDliO7inA/9S5PSUnLrORSdWLL31gsIfx
	uBnUFkqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3i63-00AKec-5F; Fri, 09 Dec 2022 18:27:43 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3i5s-00AKap-Qe
	for linux-mediatek@lists.infradead.org; Fri, 09 Dec 2022 18:27:34 +0000
Received: by mail-pj1-x1031.google.com with SMTP id js9so4622304pjb.2
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Dec 2022 10:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4w6shm/Wpz6ggc4zMRhzb9FfoJ4MU+lSfUxwokG/Em0=;
        b=DqcJe4694wkG976PjUOU2TsLdZ6AqSNNqB4CDir8muiXDWFziOVnaq4bgef+IpjXW8
         BYCQq5+CHK3zagU/kQNl2fkY6yAAgIpwkoAVkUIYm/XP0BCpkFNUmrSx6WUMKNIunWS/
         1ViUlrZGecXnoABDCfXZA+HP7XhWCtki3CYVZNe/URC5mvmJsTg1fmdWfpTdQb+s30jy
         iky6uaWQ1JeV7UkhbEB9sz0HKcP5gFKiIBEMvDIBl6xuabikBdYiLwVnjo5oCpMoS1lp
         pHALstRMOaJaOjvi7AyQNg38g3aS4UMkURCioktQVwm0X3dUqcYQyWVi54s1+DtPa0IZ
         ETeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4w6shm/Wpz6ggc4zMRhzb9FfoJ4MU+lSfUxwokG/Em0=;
        b=MQnhY57v005Pn3jytwEOnk1iEQgwWK6N61++monRgMaJmIDVZpKlLFmwKrHKdY6VGB
         L1o7TfTR56qkqgw6HujNBA7HxPGgHkyYv19q0RWxsiIIN2jWKL7nEVSO+YJwAoYbbfhX
         /B9VQFwkOPZx0ekB7jNIapW/qZZOmElMftHDnYwSbjOg4pxVKks6hz8zWrXRVraTyts2
         vywWmH5G1/pRt5mvxyjdC2CoSNaQ9O7WfHly2NpmEzX7b/ZmM80tixC9iPksFOXBuHWL
         vU7s7RaN5G7a6LmjYCqchNMnRwkUg9LD/sQo8YGzF3pevdHFmz0u0O83T5H9qnpEsiyo
         8p2Q==
X-Gm-Message-State: ANoB5pmGj6T/3FOjIsi6yvaS6ijdotigA8Ua/kOtY7jlV7wcqwYgT1Lu
	l0nW1R1ZxiChNvM6M/s1e1ThQ2zlZpXnJIpA3W4rcQ==
X-Google-Smtp-Source: AA0mqf52WgiM//CGJflKjihIpmk/MVk3JEVMl+QooKQ81VQl/XzLSTIwuVjhLP1uqMx5c86DO4csqdVJSz8AjkOnz1M=
X-Received: by 2002:a17:90b:290:b0:219:2b00:8d23 with SMTP id
 az16-20020a17090b029000b002192b008d23mr57659625pjb.167.1670610446237; Fri, 09
 Dec 2022 10:27:26 -0800 (PST)
MIME-Version: 1.0
References: <20221209031053.8444-1-yc.hung@mediatek.com>
In-Reply-To: <20221209031053.8444-1-yc.hung@mediatek.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 9 Dec 2022 10:27:14 -0800
Message-ID: <CAOReqxh=27P7PogzhFr+37XBfRh5Nxu1x46JpdCH=ZRDVhRbeQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: add sof be ops to check audio active
To: YC Hung <yc.hung@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, 
	"Nicolas F . R . A . Prado" <nfraprado@collabora.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Curtis Malainey <cujomalainey@chromium.org>, whalechang@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_102732_877775_749422B7 
X-CRM114-Status: GOOD (  20.93  )
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

On Thu, Dec 8, 2022 at 7:11 PM YC Hung <yc.hung@mediatek.com> wrote:
>
> In MT8195 SOF design, both DSP and audio driver would access audio
> registers. Before DSP accesses audio registers, audio power and clock
> should be enabled. DSP will hang up if DSP access audio register but
> audio power and clock are disabled. Therefore, we add audio pm runtime
> active checking before accessing audio registers in SOF BE's callback
> hw_params function to avoid this situation.
>
> Signed-off-by: YC Hung <yc.hung@mediatek.com>

Acked-by: Curtis Malainey <cujomalainey@chromium.org>

> ---
>  sound/soc/mediatek/mt8195/mt8195-mt6359.c | 30 +++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> index 61be66f47723..4682748d82be 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> @@ -633,6 +633,32 @@ static const struct snd_soc_ops mt8195_rt1011_etdm_ops = {
>         .hw_params = mt8195_rt1011_etdm_hw_params,
>  };
>
> +static int mt8195_sof_be_hw_params(struct snd_pcm_substream *substream,
> +                                  struct snd_pcm_hw_params *params)
> +{
> +       struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +       struct snd_soc_component *cmpnt_afe = NULL;
> +       struct snd_soc_pcm_runtime *runtime;
> +
> +       /* find afe component */
> +       for_each_card_rtds(rtd->card, runtime) {
> +               cmpnt_afe = snd_soc_rtdcom_lookup(runtime, AFE_PCM_NAME);
> +               if (cmpnt_afe)
> +                       break;
> +       }
> +
> +       if (cmpnt_afe && !pm_runtime_active(cmpnt_afe->dev)) {
> +               dev_err(rtd->dev, "afe pm runtime is not active!!\n");
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct snd_soc_ops mt8195_sof_be_ops = {
> +       .hw_params = mt8195_sof_be_hw_params,
> +};
> +
>  static int mt8195_rt1011_init(struct snd_soc_pcm_runtime *rtd)
>  {
>         struct snd_soc_card *card = rtd->card;
> @@ -1272,24 +1298,28 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
>                 .name = "AFE_SOF_DL2",
>                 .no_pcm = 1,
>                 .dpcm_playback = 1,
> +               .ops = &mt8195_sof_be_ops,
>                 SND_SOC_DAILINK_REG(AFE_SOF_DL2),
>         },
>         [DAI_LINK_SOF_DL3_BE] = {
>                 .name = "AFE_SOF_DL3",
>                 .no_pcm = 1,
>                 .dpcm_playback = 1,
> +               .ops = &mt8195_sof_be_ops,
>                 SND_SOC_DAILINK_REG(AFE_SOF_DL3),
>         },
>         [DAI_LINK_SOF_UL4_BE] = {
>                 .name = "AFE_SOF_UL4",
>                 .no_pcm = 1,
>                 .dpcm_capture = 1,
> +               .ops = &mt8195_sof_be_ops,
>                 SND_SOC_DAILINK_REG(AFE_SOF_UL4),
>         },
>         [DAI_LINK_SOF_UL5_BE] = {
>                 .name = "AFE_SOF_UL5",
>                 .no_pcm = 1,
>                 .dpcm_capture = 1,
> +               .ops = &mt8195_sof_be_ops,
>                 SND_SOC_DAILINK_REG(AFE_SOF_UL5),
>         },
>  };
> --
> 2.18.0
>

