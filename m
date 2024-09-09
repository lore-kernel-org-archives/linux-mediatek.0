Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4914ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFicSaqQ6o1dPU2dGyJmmfBGCV2JI71YgMB0tplFuwY=; b=RtOyFZ4YNeyAZJrS/Aw2OuMEul
	yRgkbnlKylZ3REKNOVXFkDlEAEwLMgygeACoCXLJ17gKKoUcFBq/LR7XFSlMysJFTgzMz0k9lcOfh
	kEyRXyKnv0L3I1JPFKsSPanAJB5UNGzn0rmG1CKcjAK+JZsCJXuE5OU6kNU2kZAr1EqQimTV9adfZ
	/yBUEeu9LavndOLu+CrYxkC5gnjTErhBgeTFt0u5GZHgBXGNTYGJ9FKbtWNFHNFV5TNvf3NIDcYW/
	nGRrS0yICXQHdHRbkcZiQzjDMrcJmhhEJRyfMt0XJ9nhG6nDpol5u1Sqbx/tKmxA/DSPgx580gGFh
	Z9d2P2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sne0N-00000001yKd-2VKB;
	Mon, 09 Sep 2024 13:00:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndsg-00000001wS3-2vBO
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 12:52:36 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-428e1915e18so37007535e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 05:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725886353; x=1726491153; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFicSaqQ6o1dPU2dGyJmmfBGCV2JI71YgMB0tplFuwY=;
        b=pv37MyqFybslu37JIiWTNjwcEXs2KN9sWw4VJ7XURsipsUR/oN8LdJt9EClZLTX2pO
         TQ1XQeDjq7DnDCSlU1V9nsGjA1s/QzhHNTqn56Vik/MeHPCgfRKFNhMaKtVLwHQjtTc1
         5IhdpNZkhioQpfxpEfLhjLAZTd3PhZqjdq00oUDhkUzR5D1cuccahu15roHkZ0CJDIVj
         vm14aOknULhsLHlT2d2wYuy5fAAK+18sv+vUFfhqxg3XpkAsG1a03ZzGE/ph+Ay7j4zU
         NId/c9cXLoa8HbU21hL14FfzpPgQbA1T3NIwGMTUJkflXbUO0CAOd1tUv8xJpLGA52c4
         NAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886353; x=1726491153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFicSaqQ6o1dPU2dGyJmmfBGCV2JI71YgMB0tplFuwY=;
        b=vXfnOMuHRt8gbh1p3edYqIgyGgpPZ1CmcWetNBJUWc7LHBYu9SMdkNw2qZjhU1xaLp
         CnKtuSdiHescpR0iLl9plZSZGdQNaMdk18ueeaCYaYgI+VnszsvXzcORubGmE3QucUmr
         D85junS+5zHA63jebw5E0gqf5OA40A5Q18ZjTetDnEbxg8BBF4j6UfTpQaYbLemZCc5C
         h+J5L8AkOTrpS6qBnBzRn79aDb8aFFZSvQKdRtKKoIFf1f6xU4wscUpghbUBu+KbDfK3
         wB5X2+uuJfH4+WkbOR7YDctZJUAUNx3RSiGO8nUNkno/UKP2V3rIU5tUoS5p16mdo6uK
         SMBw==
X-Forwarded-Encrypted: i=1; AJvYcCX2pRHqKP0J1KcUAEuAPpjtylqOmeLVWrRk3ppYeCgy6nGzzhPXcmKFuf3pgTzdkvslk0M0QFdyEwoBtjS3iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTvgsZSUaM9qcm6/m16QFWfe8yNaU2p2uF7dHGF0b3QKZwlr/N
	H5xhBTR2TcVB/oZ0+oW2C1wMmQSDpK34OiMkZo3GZOasCbhJc/pkF/FZn2OBvlk=
X-Google-Smtp-Source: AGHT+IFTcy0mxR3YY6Sm3HpQ9Kysw5PbxY5CGwt/HKjrLl33HsGAZy2gqrlfBru7RTJbn6lfqIoOwQ==
X-Received: by 2002:a05:600c:1c06:b0:42c:ba0d:c766 with SMTP id 5b1f17b1804b1-42cba0dca47mr11409125e9.6.1725886353012;
        Mon, 09 Sep 2024 05:52:33 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb742d0a1sm37550115e9.2.2024.09.09.05.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:52:32 -0700 (PDT)
Message-ID: <95cab48e-989f-42b4-8f31-0fdffbaface4@baylibre.com>
Date: Mon, 9 Sep 2024 14:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] ASoC: mt8365: Make non-exported functions static
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-4-7ad0bac20161@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-4-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_055234_793437_07B916DD 
X-CRM114-Status: GOOD (  14.47  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 07/09/2024 02:53, Mark Brown wrote:
> The compilers warn if functions without a prototype are not static so add
> appropriate static declarations.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/mediatek/mt8365/mt8365-afe-clk.c |  4 ++--
>   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 12 ++++++------
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
> index 300d1f0ae660..8a0af2ea8546 100644
> --- a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
> +++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
> @@ -295,7 +295,7 @@ int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe)
>   	return 0;
>   }
>   
> -int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
> +static int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
>   {
>   	if (apll1)
>   		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
> @@ -307,7 +307,7 @@ int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
>   	return 0;
>   }
>   
> -int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
> +static int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
>   {
>   	if (apll1)
>   		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
> diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
> index df6dd8c5bbe5..54d2112d2e92 100644
> --- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
> @@ -170,7 +170,7 @@ bool mt8365_afe_channel_supported(unsigned int channel, unsigned int id)
>   	return false;
>   }
>   
> -bool mt8365_afe_clk_group_44k(int sample_rate)
> +static bool mt8365_afe_clk_group_44k(int sample_rate)
>   {
>   	if (sample_rate == 11025 ||
>   	    sample_rate == 22050 ||
> @@ -182,7 +182,7 @@ bool mt8365_afe_clk_group_44k(int sample_rate)
>   		return false;
>   }
>   
> -bool mt8365_afe_clk_group_48k(int sample_rate)
> +static bool mt8365_afe_clk_group_48k(int sample_rate)
>   {
>   	return (!mt8365_afe_clk_group_44k(sample_rate));
>   }
> @@ -496,8 +496,8 @@ static int mt8365_afe_configure_cm(struct mtk_base_afe *afe,
>   	return 0;
>   }
>   
> -int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
> -			  struct snd_soc_dai *dai)
> +static int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
> +				 struct snd_soc_dai *dai)
>   {
>   	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>   	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> @@ -714,8 +714,8 @@ static int mt8365_afe_fe_prepare(struct snd_pcm_substream *substream,
>   	return 0;
>   }
>   
> -int mt8365_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
> -			  struct snd_soc_dai *dai)
> +static int mt8365_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
> +				 struct snd_soc_dai *dai)
>   {
>   	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>   	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> 

-- 
Regards,
Alexandre

