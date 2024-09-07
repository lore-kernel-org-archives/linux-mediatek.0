Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7045ACD4846
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 05:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T74dM4a9o8MJXWRHczPa96Jl3U3aNHiJ5FfMrEntuXQ=; b=gJyg3+UVEvs6wiGR/jdwdM1iP3
	w9qdZyK13vKSXNvWfTkRGnmWWtEj6lw71wqK+ky1Z5BSfQtRF9V5bHjEbw3/4uu437zfxYDh9l4BQ
	To8pI8VIG8a6+on5zaak4oxP+XfFuM+7DUA92E1yyZMoIq/aramtUjbs2a52RR+eTHuXsyho64BYX
	TwXItXx5xWn0aqg6iepBpeDYRQHm05pVVADOjCiMHhy8Ys8ZuyMBMCvEF3t7hYK7BYxVmrhLgd9HT
	zlGKvKSJu+uxy5ctF5UIk1MHdhx4z1+WiSnRLdySoRImNtuBGDehUIFKFx+BnibrRchP+PeN4Noga
	rVFOcQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smnwA-0000000EOgA-0wGm;
	Sat, 07 Sep 2024 05:24:42 +0000
Received: from smtp-21.smtpout.orange.fr ([80.12.242.21] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smnpk-0000000ENsd-3EIf;
	Sat, 07 Sep 2024 05:18:06 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mnpcsV4ES6mdlmnpcsxKPo; Sat, 07 Sep 2024 07:17:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725686280;
	bh=T74dM4a9o8MJXWRHczPa96Jl3U3aNHiJ5FfMrEntuXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=nZyf2W9BL+Z7qKkq6EfyWzzFYQnVGrbk2aHdRjUhYHOzdrIH8GmCJ2kIJgfXhQBHK
	 /TJKtcTwfNMIH+3U5FbyxHiYkkvC6/w/90Hy0dBWJctnBcyyHoTEhFgoCaFTxjy3lH
	 YjgPJ/OizHpz3UFqodNokuEDNbMZc50/N3j1eGLm8aX44PtCqMrqL57pC/zpN+ALUP
	 krQ3wpZL7ISYTf/wTEGwA22zyl7fzxXrym+nKY8w3qA1Rkk/duaeVN+saGkchjegFE
	 UjFrS52vCXBlI7ltlH1FxlIFBaJz3eULYk3ljwFdE4zpNv76p3IYLTjQLzMsohpIyc
	 K7SdCzPZooYCg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 07 Sep 2024 07:18:00 +0200
X-ME-IP: 90.11.132.44
Message-ID: <1cda7882-56e2-445f-b3cf-0366236250e6@wanadoo.fr>
Date: Sat, 7 Sep 2024 07:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] usb: musb: mediatek: Simplify code with
 dev_err_probe()
To: linruifeng4@huawei.com
References: <20240907034226.120159-1-linruifeng4@huawei.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: angelogioacchino.delregno@collabora.com, b-liu@ti.com,
 gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-usb@vger.kernel.org, matthias.bgg@gmail.com
In-Reply-To: <20240907034226.120159-1-linruifeng4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_221805_240340_2EFDED37 
X-CRM114-Status: GOOD (  16.60  )
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

Le 07/09/2024 à 05:42, Lin Ruifeng a écrit :
> The combination of dev_err() and the returned error code could be
> replaced by dev_err_probe() in driver's probe function. Let's,
> converting to dev_err_probe() to make code more simple.
> 
> Signed-off-by: Lin Ruifeng <linruifeng4-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/usb/musb/mediatek.c | 27 +++++++++++----------------
>   1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
> index 0a35aab3ab81..393b909de238 100644
> --- a/drivers/usb/musb/mediatek.c
> +++ b/drivers/usb/musb/mediatek.c
> @@ -416,10 +416,9 @@ static int mtk_musb_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	ret = of_platform_populate(np, NULL, NULL, dev);
> -	if (ret) {
> -		dev_err(dev, "failed to create child devices at %p\n", np);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				"failed to create child devices at %p\n", np);
>   
>   	ret = mtk_musb_clks_get(glue);
>   	if (ret)
> @@ -448,23 +447,19 @@ static int mtk_musb_probe(struct platform_device *pdev)
>   		glue->role = USB_ROLE_NONE;
>   		break;
>   	default:
> -		dev_err(&pdev->dev, "Error 'dr_mode' property\n");
> -		return -EINVAL;
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				"failed to create child devices at %p\n", np);

This message is wrong.
You made a cut'n'paste of the previous one.

>   	}
>   
>   	glue->phy = devm_of_phy_get_by_index(dev, np, 0);
> -	if (IS_ERR(glue->phy)) {
> -		dev_err(dev, "fail to getting phy %ld\n",
> -			PTR_ERR(glue->phy));
> -		return PTR_ERR(glue->phy);
> -	}
> +	if (IS_ERR(glue->phy))
> +		return dev_err_probe(dev, PTR_ERR(glue->phy),
> +				"fail to getting phy\n");

While a it, change it to "failed to get phy"?

>   
>   	glue->usb_phy = usb_phy_generic_register();
> -	if (IS_ERR(glue->usb_phy)) {
> -		dev_err(dev, "fail to registering usb-phy %ld\n",
> -			PTR_ERR(glue->usb_phy));
> -		return PTR_ERR(glue->usb_phy);
> -	}
> +	if (IS_ERR(glue->usb_phy))
> +		return dev_err_probe(dev, PTR_ERR(glue->usb_phy),
> +				"fail to registering usb-phy\n");

While a it, change it to "failed to register usb-phy"?

CJ

>   
>   	glue->xceiv = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
>   	if (IS_ERR(glue->xceiv)) {


