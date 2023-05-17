Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B451C77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 11:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lX4RUnUQMH1G6+4GJDAEQV0ZJ/cXUKJc2gOqtoEp6cg=; b=LD/C5Z5/FOPLvYBx25CenTmWZZ
	lLxnhe6lLJcV1xIHqj0HQu2VZDcwmkIAJtHIeyZUzl49+GxW0q6A4s+mnHGVsggcQdTEKH/7ol2Ax
	fuVw5MZPlzn8gC6WsdCr0QPLWQrUSpaEdcUlB00c2lASqsLMvkG4KLTU+U3NLxRfC/yB2bckYS5E0
	2Fwocr6GAbKCirn5ZEtw+m5WV96ZX3G9Z7nd5VTQSIKFC6+KumP0dDNE4xnaR+ErxrcV1nnu8ly/3
	3FBF5xV5DZyqcN0gAuSLpjeU+S7GYaWKhbAeaiY/7PfUiDEAwjnewxfxkZtKjx4WQdgJI0R+K7d3F
	OxTQTVDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFNb-009c7W-01;
	Wed, 17 May 2023 11:31:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFNY-009c6a-0s;
	Wed, 17 May 2023 11:31:37 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E3754660563D;
	Wed, 17 May 2023 12:31:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684323094;
	bh=L2mTlsU8VTc247vwq0FkEbhJOgBaKoelge6UNY1Jq28=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dhFlWVbrsUUAUCO8oux7TvXYQVVNG8o7CgMnfFb9gVXKBxIuqSvsNyjv5gSAUIl8d
	 wg8O1k+IuiplGKJOsUHlIBMUot1ztw1WVetcQPD9PSAzRZWZTqflbOGbvwPdTeGTyK
	 4520iQ01nOUn9j3LLQnt18vv5nioXx26f2eC1DZDBmATH2/6NZ8My2yRS3QMVwNlCm
	 CBDdNSHIXOxAZBM6Vnx3C+p+7pvrQwhCHZXl1INby6jQntYFO2mrLPfWstzmvsz9mv
	 jk0tYFxkkyzUwqewsjTM6ZiQl10RWVcd63+ssb84QDgT55fHFp+C5m6F4iyljaTLmo
	 S8WNE20MwI0nA==
Message-ID: <154497b3-f5c7-45d6-edd5-729642b80be5@collabora.com>
Date: Wed, 17 May 2023 13:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/5] ASoC: mediatek: mt8188-mt6359: register hdmi/dp jack
 pins
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
 <20230517111534.32630-3-trevor.wu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230517111534.32630-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_043136_485350_D04AA121 
X-CRM114-Status: GOOD (  13.26  )
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

Il 17/05/23 13:15, Trevor Wu ha scritto:
> Some userspace applications need jack control events, so register hdmi
> and dp jack pins to activate jack control events.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 27 +++++++++++++++++++----
>   1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index 833bc362dad2..6c3f36e2fffd 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -151,6 +151,20 @@ struct mt8188_mt6359_priv {
>   	struct snd_soc_jack hdmi_jack;
>   };
>   
> +static struct snd_soc_jack_pin mt8188_hdmi_jack_pins[] = {
> +	{
> +		.pin = "HDMI",

"HDMI Jack" is more consistent with the snd_soc_jack_new_pins() call performed
later.

> +		.mask = SND_JACK_LINEOUT,
> +	},
> +};
> +
> +static struct snd_soc_jack_pin mt8188_dp_jack_pins[] = {
> +	{
> +		.pin = "DP",

Same here: "DP Jack"

> +		.mask = SND_JACK_LINEOUT,
> +	},
> +};
> +

Regards,
Angelo


