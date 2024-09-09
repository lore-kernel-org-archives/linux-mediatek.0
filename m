Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10704ECE57B
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1s6ErxBpBnN4TDCj/24ykKeIJzZtbIIx8kz5Yh/iY7Y=; b=10NlrXeBVV2PdPh391VuTYEgBF
	hjHmScfmLC7Pc1dOXNaS/xivyOQwWQzscBpalFtKvJP0Z6sqQH9o5LeHq2uca11NCm+VP5X6EuPYA
	TvL4Kx4n6JPngmb3H/GOF1WhH6yBTlm85Rg4mMklktDBOHW1K0Cc0zyItaszGjdLg/9Xyy44gjq2F
	mboKP7Xf1eJtm4AsUNKlaw2UwDOt/OSiV/K5SHl7Ua2ltfiOhJc5vqAn+O0FLDA58DIqmvC2RoR6c
	zRRC97OdFPcpTiq78wUgaM0Q2RMtmTStfz7W1oigdQApHqCYe9/v7DZI9Yk1vLluS2XuCNlk06guJ
	yDt7qDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaiN-00000001JkF-1hXl;
	Mon, 09 Sep 2024 09:29:43 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaiH-00000001JcX-3O8e
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 09:29:41 +0000
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 86A9D3F5AB
	for <linux-mediatek@lists.infradead.org>; Mon,  9 Sep 2024 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1725874172;
	bh=1s6ErxBpBnN4TDCj/24ykKeIJzZtbIIx8kz5Yh/iY7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=e9/wegB+0/e64FXmg6K+JwOGQHoA0k0jqeKMe1KSS+SRq9YbTiRVIzjuaiCE0hnhi
	 I0SYg6nmOqQNB81Gl+j1PAyTAL3Upy95cFwD8W/kywPyxgCNMvCGTAPegzmFGMAtJa
	 t4GeEDCjYAvltNDsBSnbtFLhnQvGLz/ERfnb43l4RkuzVXcIJdCJ+Pmt5mrxV8Qv+u
	 ASb1RP8gNP+Otihi91RzdFRf/tLKrOnQNoWWnTYPdXAShK8cs793cqpQjcg9oJW9kY
	 Q4YhIEcyn+LZnBlgOCtGyZLv1XvR2PjISvjBCscqX85LNhETTb1PC6x97hCJrokaA/
	 UwcutdPQg2HnQ==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-206b912491eso55588625ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 02:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725874171; x=1726478971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1s6ErxBpBnN4TDCj/24ykKeIJzZtbIIx8kz5Yh/iY7Y=;
        b=bKZ2okaj06sWlToJz16rmdg86GyZPYDq3eXZwm0eICsGul/NN8NuzQISxhfgtZ2yPi
         RS40GWA4QcgWDbL/dSUlDfpXCHbg2x9HbIaghOrl9ojS8pV2SzJziSKE8rpk/DwPmAXN
         B4iNUveWvTP6TQxU/m+W1xICAVutLG77YWMZHHtKeNIqerA5p9fHmtUtiMNZOyWNex3w
         5ViqLUlDl+cbSHEShfwpCO3pn6xS8dl6Pt9eDluBjSskVFBorjrpY+IiYyIg8Q4Eeut9
         R2Yyfb52tYoRfe4MnuVw828RywxpS08S4yvfkJG0Cw9rZXkJkmTnfnxIWj9HpzBV4LRe
         NyAA==
X-Forwarded-Encrypted: i=1; AJvYcCVsk/anYukgMvE7qXQXtNFGMRP9NUa3nkAwkQGM3uoDgYFgiZbyHlG4RC8UUPOVYjOhWtBtRtlwZnvM6K5tXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwL3eRk6bWaumaVIiUasRtp28gh2tt5RrIYNr4ZKv3KttfLUJ5Y
	QrwfmQ66wetJChhCOi8ymmk81G/W+RiLvIV2rfXe5aWLpsYFisTsTvsS8w7DnUkW+l5KbBk2RP4
	uNE1mubdyk/+ifUYOgRPCO5SouWkSIBoVlNmikhfHzED6XpXlyEnXCXwuXXbdUlhjuPka5EXtNP
	yDj+tFAuSirw==
X-Received: by 2002:a17:902:ce91:b0:206:b5b8:25dd with SMTP id d9443c01a7336-206eeb7a78bmr170498245ad.23.1725874171064;
        Mon, 09 Sep 2024 02:29:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOj9jqwDDJjKtB8eNNDnBjTUzIZm4sDUYK04l69QZOWzQRdEeA2WvR6/1IBLED1Y1FZtDrUw==
X-Received: by 2002:a17:902:ce91:b0:206:b5b8:25dd with SMTP id d9443c01a7336-206eeb7a78bmr170497875ad.23.1725874170361;
        Mon, 09 Sep 2024 02:29:30 -0700 (PDT)
Received: from [127.0.0.1] ([103.172.41.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e3757csm30355605ad.112.2024.09.09.02.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 02:29:29 -0700 (PDT)
Message-ID: <9fddd930-21ae-4e7d-86ee-c586af3b50e0@canonical.com>
Date: Mon, 9 Sep 2024 17:29:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v2] usb: musb: mediatek: Simplify code with
 dev_err_probe()
To: Lin Ruifeng <linruifeng4@huawei.com>, b-liu@ti.com,
 gregkh@linuxfoundation.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240907081351.19879-1-linruifeng4@huawei.com>
Content-Language: en-US
From: Guoqing Jiang <guoqing.jiang@canonical.com>
In-Reply-To: <20240907081351.19879-1-linruifeng4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_022938_291143_A099AAB0 
X-CRM114-Status: GOOD (  19.72  )
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



On 9/7/24 16:13, Lin Ruifeng wrote:
> The combination of dev_err() and the returned error code could be
> replaced by dev_err_probe() in driver's probe function. Let's,
> converting to dev_err_probe() to make code more simple.
>
> Signed-off-by: Lin Ruifeng <linruifeng4@huawei.com>
> ---
> v2:
> - The wrong message is modified.
>   drivers/usb/musb/mediatek.c | 27 +++++++++++----------------
>   1 file changed, 11 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
> index 0a35aab3ab81..63c86c046b98 100644
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
> +				"Error 'dr_mode' property\n");
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
>   
>   	glue->xceiv = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
>   	if (IS_ERR(glue->xceiv)) {

Sorry, this is probably out of topic. I had seen one relevant kmemleak 
report (probably false
positive) which is related to dev_err_probe.

[<ffff800083692200>] kmemleak_alloc+0xe0/0x120
[<ffff800080a1d7f4>] __kmalloc_node_track_caller+0x354/0x4d0
[<ffff800081443520>] kvasprintf+0xd0/0x1a0
[<ffff8000814438bc>] kasprintf+0xac/0x120
[<ffff8000820b5578>] device_set_deferred_probe_reason+0x68/0x148
[<ffff8000820a1844>] dev_err_probe+0x164/0x1b0
[<ffff800081ba00a8>] __clk_bulk_get+0x108/0x238
[<ffff800081ba0248>] clk_bulk_get_optional+0x20/0x50
[<ffff800081b9f294>] devm_clk_bulk_get_optional+0x6c/0x160
[<ffff800081791efc>] mtk_tphy_probe+0x38c/0x7a8
[<ffff8000820bbe98>] platform_probe+0xd0/0x240
[<ffff8000820b35c8>] really_probe+0x368/0xa10
[<ffff8000820b3de0>] __driver_probe_device+0x170/0x420
[<ffff8000820b40f8>] driver_probe_device+0x68/0x1f0
[<ffff8000820b47fc>] __driver_attach+0x234/0x558
[<ffff8000820ae1b8>] bus_for_each_dev+0x108/0x1c8

Not sure if this patch could trigger the same report.

Thanks,
Guoqing

