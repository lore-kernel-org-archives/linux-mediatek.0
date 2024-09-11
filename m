Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8968FEE499A
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Pk6bKkNRX9OMsZZfM8wXgJHg+NHv9wycYZT2Btv69c=; b=CxApxHCnh7dSlqHFSdIAOO91RO
	dloOoFpq4uStcxWo78mbatB0NE/1QgIHuRHfqBkQv4Er+d745XixYnZl7fbaqbhrDTx2FWJO4B/TT
	wbyt1dpqeZA71AyuyUTfHHInr3nlISo4K+buViDHHbPR5HO3NBgAThkrA7zPrj6Wpq87TZqeDtNYJ
	MNB7NLQpkrVY397RnOrDIhK+Cmrg/OSFKXRyV88p/Rz0UJ3gaNOODAXxCHg5a522q46qZ5L+rLK01
	V/wCCkSElm56+V4rolwF863Fi+Jz8kJJ3hlifafWonmdM2SlLs5qQg3EAor3vC+5C1OH6D7HQHF3F
	H8zYsqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLjR-00000009LBP-0M2A;
	Wed, 11 Sep 2024 11:41:57 +0000
Received: from a7-28.smtp-out.eu-west-1.amazonses.com ([54.240.7.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLjO-00000009L94-2H3I;
	Wed, 11 Sep 2024 11:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726054911;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Rk5q3BmBtUat5/52EX4J8IbXZHZ0jpHHNiGHCN+/zfY=;
	b=gbocc47iLMfz7pURQWEuqEhhvrQRUpwmfDoYCYnsFDaT/oTyHa3D5U3Od/CLnYFR
	/afVBd0vmN5svggiJjvWVsXKJQbQKGJgPjoFgUpNpsnOH+MosMiUYTi40cMoQJsvC+D
	xPXAL9TlGwy9COUDj6gLTU3ICVwNVLuIl/OTWt0Nm66PypIVpp4Ed2A/Q5nc89gxlu0
	GqmeYJ8K3R5e4x1q71hBEZUI2zngHbOypDC1ba4p5dyLyfIomjs190UoJgnMj4mPzOW
	bB/QTPjWfHUEX3gfG25P/90/yFj9KACyiJJlG150c0vi/bQinWzTOWlRw4NWxXrWlQD
	V+FYRzqidQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726054911;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=Rk5q3BmBtUat5/52EX4J8IbXZHZ0jpHHNiGHCN+/zfY=;
	b=Ug8XaR417Kv4VWAWRhaOaPCKdY/Cblr531aJfmZjGh5UQtpHoBGpcpLjle98WZG1
	7JPT+wutVV6JXv0mLiDsuuZ6sZ/hgw15b7/dW/cK7NQMi+rfIICEFXO/g9Xt7itCPga
	fDr8jb9075hUkOEjUzXOLFcyxrTdwHnEDeVEkzmw=
Message-ID: <01020191e0e3cb9f-833b6cb7-1233-4b4d-9b48-bdf446d0ab70-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 11:41:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoc: mediatek: mt8365: Print the ret value
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, 
	Nicolas Belin <nbelin@baylibre.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240911111917.4091809-1-usama.anjum@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240911111917.4091809-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.28
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_044154_770872_B6627524 
X-CRM114-Status: GOOD (  19.17  )
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

Il 11/09/24 13:19, Muhammad Usama Anjum ha scritto:
> Print the ret value otherwise it is just being set without ever getting
> used. The author may have missed printing it.
> 
> Fixes: 1bf6dbd75f76 ("ASoc: mediatek: mt8365: Add a specific soundcard for EVK")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> If it isn't useful, the ret value assignment statement can be removed.

Nah, please just remove the ret assignment... and while you're at it, can you also
change that dev_warn() to dev_info()?

That print is actually expected to be seen on some boards, and it may, or may not,
be something to be warned about; this is because some the states are optional, or
actually the only requirement is to have at least one pin group muxed to audio but
not forcefully a specific one (so you may have i2s0 on a board, i2s1 on the other).

Cheers,
Angelo


> ---
>   sound/soc/mediatek/mt8365/mt8365-mt6357.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
> index fef76118f8010..412f5fdd8fc52 100644
> --- a/sound/soc/mediatek/mt8365/mt8365-mt6357.c
> +++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
> @@ -258,8 +258,8 @@ static int mt8365_mt6357_gpio_probe(struct snd_soc_card *card)
>   							   mt8365_mt6357_pin_str[i]);
>   		if (IS_ERR(priv->pin_states[i])) {
>   			ret = PTR_ERR(priv->pin_states[i]);
> -			dev_warn(card->dev, "No pin state for %s\n",
> -				 mt8365_mt6357_pin_str[i]);
> +			dev_warn(card->dev, "No pin state(%d) for %s\n",
> +				 ret, mt8365_mt6357_pin_str[i]);
>   		} else {
>   			ret = pinctrl_select_state(priv->pinctrl,
>   						   priv->pin_states[i]);



