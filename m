Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C9ECF11CF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 11:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wm6MZYXLSHo1dcmzMTR+ZzKs3r2Jrq8C9K6nZwy4g50=; b=MGlRrRcqhowjkd7NHpR1P0mFg9
	wlGdH5EZul4XTmi4MoOaIRbXI3jbmD/wZpPWPvd6weFJiYkUIUfK2sli5JCtlfSsKNf072n57JOfo
	huWZZ8HdFqcPmRI1lOqxRHQzphX8I7R8+dIJv768hFqAQVCjiySGpVdHgHEmHWTW98qtmjxAm5Rxq
	MmKOPHWdcZfcaWb+XvKFCeE+IL0Nkih3u4LbpePWu3nHGN8Mk76tLFqF2KisGyRb+G9y1P/HXIWmc
	IZu26iclrwDwz1MUwNpxw7qkoVSOHP8d0z+DIDc0uMEE4/CuNXHM9rCaRGBIeQx+XbhAabruRxfgo
	ZksxgQ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syqwL-0000000CUMH-33h5;
	Thu, 10 Oct 2024 11:02:41 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syqu3-0000000CU0H-0EfL;
	Thu, 10 Oct 2024 11:00:20 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9951fba3b4so124656366b.1;
        Thu, 10 Oct 2024 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728558017; x=1729162817; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wm6MZYXLSHo1dcmzMTR+ZzKs3r2Jrq8C9K6nZwy4g50=;
        b=HUYsWLnTpDv4H/SW9wKNb9cGp2B6/OJ5gCtzH6Byt6MMz0u7RCMLwLcmf+9rzgtBbW
         IXbGkqf5A67b6j6oBhg9s838vBi2FyiSa86Hn4gzhN5xr5loVR06zXywWCwVID8OwyDt
         VG7QMcCd51VES7mH7omv+YLd5okeHb5iLcAxocyx59FHS6vJtVqLAptayF5bGqK1LyeX
         Fggijlakf4JErDKlPeo05tt6c2ulrPD2ND7RkqCnRQWSJQpcN6IFRwQI7C1BPLq3jvcC
         Eqf6oMAwTeTrYE97LAafL9oUJ7DTwWw+64I126XC65xMCvKyNCE6aX1sP0qfgVvgm92Y
         3G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728558017; x=1729162817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wm6MZYXLSHo1dcmzMTR+ZzKs3r2Jrq8C9K6nZwy4g50=;
        b=mgZIQ6qfasGq4RV/bXvXW8EeMMAlBffDE64RXpVbqI8wNXHK2qC6Iih/IbABhLkYRY
         H1ioExG8mwhnwJ69KDoubnt8L3sUvT7xfUDVB2LzpAWcFTp1rLmr50k5XzANroYNvvfY
         dDyFvYTZApmR1Gvh2sgFps+goc9odwqCRHcwYwIstmS0wrJvR0ypS66hjHmtJYVtLvQ6
         SgQIgiLS1+m8Wmc7u7JUrkRs2jEh5zN7S6jnwt8OxHrPMu0hsZTbJkH6it0dmG58cEm+
         Y7pcS2lQ5w9KoUfrW/VuTfw5X0MnSPlFp93pzNaR7WMi6Yw1ZXGrQVHOZbIzwXMf0t5n
         Qnzg==
X-Forwarded-Encrypted: i=1; AJvYcCVhJsG3wkSkmOA1Hbdot5+asjr39UsPQsu33kpFJ5yA5mdKnfQBkvxcMToeYJptKnHPK3H9naZ47rFFOUuzJWE=@lists.infradead.org, AJvYcCXGs9Jf9p9evjZ7hV9tV5Jok+cg7M0c2rkXMwA1QuTyXshvfY9pJQN0JZKGTxXxo7+hC/qh/GbNfr0dzlH7EcPa@lists.infradead.org
X-Gm-Message-State: AOJu0YzcBbJLaWuexqj214EHUvLK+/yBn8QAqA0k1dHGozdzbEfKBhQ0
	p5FUpdu7z0h7op2Qv3ChuG7gP6oi6jcDiwEVmYvD9Ir93J98T9ZJ
X-Google-Smtp-Source: AGHT+IF4Du3Ih2aP9a4aeYx5V5KpMHpUyahtsSe3e+80RgRQFzvJY7pAi69j/1zbBr1MglyJEAAoNQ==
X-Received: by 2002:a17:907:1c1a:b0:a86:a4b1:d2b8 with SMTP id a640c23a62f3a-a998d11892dmr528404366b.4.1728558016851;
        Thu, 10 Oct 2024 04:00:16 -0700 (PDT)
Received: from [192.168.42.132] ([81.95.8.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80bfc5esm73268166b.142.2024.10.10.04.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 04:00:15 -0700 (PDT)
Message-ID: <fccf8cbd-82ec-4d97-a5aa-faf57ac78874@gmail.com>
Date: Thu, 10 Oct 2024 13:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8188: Remove unnecessary variable
 assignments
To: Tang Bin <tangbin@cmss.chinamobile.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241010073547.3720-1-tangbin@cmss.chinamobile.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20241010073547.3720-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_040019_137349_2FF2743D 
X-CRM114-Status: GOOD (  14.11  )
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



On 10/10/24 09:35, Tang Bin wrote:
> In the function mtk_dai_hdmitx_dptx_hw_params, the variable
> 'ret' is redundant, thus remove it.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
> index 2a48f5fd6..69a091dad 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
> @@ -2422,7 +2422,6 @@ static int mtk_dai_hdmitx_dptx_hw_params(struct snd_pcm_substream *substream,
>   	unsigned int channels = params_channels(params);
>   	snd_pcm_format_t format = params_format(params);
>   	int width = snd_pcm_format_physical_width(format);
> -	int ret;
>   
>   	if (!is_valid_etdm_dai(dai->id))
>   		return -EINVAL;
> @@ -2450,9 +2449,7 @@ static int mtk_dai_hdmitx_dptx_hw_params(struct snd_pcm_substream *substream,
>   		etdm_data->data_mode = MTK_DAI_ETDM_DATA_MULTI_PIN;
>   	}
>   
> -	ret = mtk_dai_etdm_configure(afe, rate, channels, width, dai->id);
> -
> -	return ret;
> +	return mtk_dai_etdm_configure(afe, rate, channels, width, dai->id);
>   }
>   
>   static int mtk_dai_hdmitx_dptx_set_sysclk(struct snd_soc_dai *dai,


