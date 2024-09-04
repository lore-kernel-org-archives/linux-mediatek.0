Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192EECA0ED3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfBEaiQ2P01wfzJwnNqmTpR2jaFed03KXscuQHsmjKI=; b=S30RP5dY1PyRg0zwuNWA9dHgKk
	julf0PHM/KJPhnS7aTLoALvH5hkeFRcP/D45eZlO7nuw/dDXj/sqhMH2J8J5ZXJwSx4R/z2nhI2/H
	FeGP/VzzUI1OjsvnmPGHPkKVQt5/uZfljW7mENMPMgDsc/ja7ANAmv2w70dPeN3k2R1OKJpnm/fBY
	7n0vDKgobJSE5W2HOAHmXjXhqBtVT6Zre2AQ4p3zgbVbaPmrLjQ+Mgl/O/K3AYfKjKmwXgAbjR39x
	M0ykPkGk4r7YrTj01FetjHMSDotlC9LLMibEdeh0+1M4w3UN2RXCnlbGDifg21dTcBhAzNtlaH/KB
	F/KBIqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmCQ-00000003e9M-2EqF;
	Wed, 04 Sep 2024 09:21:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllfM-00000003V9j-3Kue;
	Wed, 04 Sep 2024 08:47:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42bb885f97eso2569815e9.0;
        Wed, 04 Sep 2024 01:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725439623; x=1726044423; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OfBEaiQ2P01wfzJwnNqmTpR2jaFed03KXscuQHsmjKI=;
        b=AZRsu6iq21RPzqJTZILcmSwOWvy2guFCu9DveLQfRRJd1HpvtVyLY28O+PkSJv8inC
         3nFX/HxepqI79LxLK1F1MEwj7QvYy7oZj1S0yMV4olAMnmhnMcLrVbk13HTRp1dvcldJ
         tDUZzcV//x5WT/sDt1BPjWhvyh4685/SrNKPOXGb4Y6M5gYYMrZ2ogylaitfMMBjd1BO
         2N8cu1eBCLvDZKenThgmhPvjm6fOCL3yeGSnDx90lgdbxqWloBV5Mk9Lg51Umyv/l24a
         0z6Y4Z+x84Te7DUSJIxdm4N3zHR94BIRJPyPLopekMbFxvb6xHxDOwWKiDdLRnwFh9LR
         K2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439623; x=1726044423;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfBEaiQ2P01wfzJwnNqmTpR2jaFed03KXscuQHsmjKI=;
        b=qhtNmac1xEtKwtXLeveqjdtjOe5mEY8zwjz+46RvSwPfyMDxEIDaaGmrUpfXcFtzVI
         yYxi4L3LPysuSFeLbVx2Yf84kZMkEB9Ifo0chc0l0psAT5oNL1dU2SNggUaZbP4vfSqe
         A+A5M8f7XHZCCI/8jd9hWynIO3OmInZzMBvpSHrR1qRaXSd22DZTroFxDWxS4Nr1iuwI
         UBmjbP7VueMURduYcg0zKj2v+qs44B6ec7R0PqNyUrfgCdqe8SHSjfm2NK4uZzE9hzUw
         vwGjhjk8amJe/WX4dbM/TxzhCQwsrnageApQQFd3dhMf2llmZZaS2mvLtGIRQ6OH0Z4E
         8MLg==
X-Forwarded-Encrypted: i=1; AJvYcCXTE1EizXz7WqJ9KLPx+KVJwR9ABcmJfeTFq28LrPwKQ6DCiV0ZhGgOw0MskeLcrsgKtwZKeTBblqtZlqI5gdY=@lists.infradead.org, AJvYcCXW2C4I94R12ySDYHVM01alr/sHEAQX65BsDTFNGIW7fbklNOHyeQcQBdm6OWyewAghBRLqvJHtSdk6hCHFmGhR@lists.infradead.org
X-Gm-Message-State: AOJu0YwfFdhNe5NW40FtFrb1uuDrnIK0CC3nKrR+fjvk6P5Oeaz9WEDS
	H2XS/rk+Tq3bRwr4QJE/O2J1hEiR6hLQsBHim0rYhVVpoBJGk/a/
X-Google-Smtp-Source: AGHT+IF96DXAU9iaenHHvtAtDkMi/nppbLrx/lBsQSnrwejDg9FHvaPtr+YEqgC4Li/XqEnPql99xA==
X-Received: by 2002:adf:ed11:0:b0:376:7dc1:6e91 with SMTP id ffacd0b85a97d-37799f5e681mr735975f8f.11.1725439622830;
        Wed, 04 Sep 2024 01:47:02 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c95a88c13sm13822475e9.2.2024.09.04.01.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 01:47:01 -0700 (PDT)
Message-ID: <25f8a244-45c4-44bb-a0c1-37c057dd8d7b@gmail.com>
Date: Wed, 4 Sep 2024 10:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt2701-cs42448: Optimize redundant code
 in mt2701_cs42448_machine_probe
To: Liu Jing <liujing@cmss.chinamobile.com>, lgirdwood@gmail.com
Cc: broonie@kernel.org, perex@perex.cz,
 angelogioacchino.delregno@collabora.com, linus.walleij@linaro.org,
 bartosz.golaszewski@linaro.org, kuninori.morimoto.gx@renesas.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240903093623.7120-1-liujing@cmss.chinamobile.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240903093623.7120-1-liujing@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_014704_873550_01803BEA 
X-CRM114-Status: GOOD (  16.39  )
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



On 03/09/2024 11:36, Liu Jing wrote:
> Utilize the defined parameter 'dev' to make the code cleaner.
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   sound/soc/mediatek/mt2701/mt2701-cs42448.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
> index 1262e8a1bc9a..4974b0536b7b 100644
> --- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
> +++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
> @@ -329,10 +329,10 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
>   	int ret;
>   	int i;
>   	struct device_node *platform_node, *codec_node, *codec_node_bt_mrg;
> +	struct device *dev = &pdev->dev;
>   	struct mt2701_cs42448_private *priv =
> -		devm_kzalloc(&pdev->dev, sizeof(struct mt2701_cs42448_private),
> +		devm_kzalloc(dev, sizeof(struct mt2701_cs42448_private),
>   			     GFP_KERNEL);
> -	struct device *dev = &pdev->dev;
>   	struct snd_soc_dai_link *dai_link;
>   
>   	if (!priv)
> @@ -341,7 +341,7 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
>   	platform_node = of_parse_phandle(pdev->dev.of_node,
>   					 "mediatek,platform", 0);
>   	if (!platform_node) {
> -		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
> +		dev_err(dev, "Property 'platform' missing or invalid\n");
>   		return -EINVAL;
>   	}
>   	for_each_card_prelinks(card, i, dai_link) {
> @@ -355,7 +355,7 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
>   	codec_node = of_parse_phandle(pdev->dev.of_node,
>   				      "mediatek,audio-codec", 0);
>   	if (!codec_node) {
> -		dev_err(&pdev->dev,
> +		dev_err(dev,
>   			"Property 'audio-codec' missing or invalid\n");
>   		return -EINVAL;
>   	}
> @@ -368,7 +368,7 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
>   	codec_node_bt_mrg = of_parse_phandle(pdev->dev.of_node,
>   					     "mediatek,audio-codec-bt-mrg", 0);
>   	if (!codec_node_bt_mrg) {
> -		dev_err(&pdev->dev,
> +		dev_err(dev,
>   			"Property 'audio-codec-bt-mrg' missing or invalid\n");
>   		return -EINVAL;
>   	}
> @@ -377,7 +377,7 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
>   
>   	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
>   	if (ret) {
> -		dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
> +		dev_err(dev, "failed to parse audio-routing: %d\n", ret);
>   		return ret;
>   	}
>   
> @@ -395,10 +395,10 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
>   
>   	snd_soc_card_set_drvdata(card, priv);
>   
> -	ret = devm_snd_soc_register_card(&pdev->dev, card);
> +	ret = devm_snd_soc_register_card(dev, card);
>   
>   	if (ret)
> -		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
> +		dev_err(dev, "%s snd_soc_register_card fail %d\n",
>   			__func__, ret);
>   	return ret;
>   }

