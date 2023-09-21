Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A02E71060
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 12:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7aGXpKSZd0nkaqg7goI4xd52TS77NJzRSHYqFQggM8=; b=q+mw4yeAa5S4sq2CkNBy+WmVLq
	CMpbe71d/Fw0N4B4T/wBBAw6cNxD8g2LCTw5kUu6FyHHBVk0q1GgWSpbqiMSeuzfwJY/OTvY0lmOo
	RKdB+ZgvK5G1iU2kD4GDlu22viEf74Lc4G6ZTVQAxlw1vlo/rNL9b3vbOdIIi8QNb1wMj3r40XOiM
	mnOopiE/UriS1W5B2Z2eBJYMxLvx0A8OOMRt0Yow9Oz/gayjwp1o0+zaHR4JDJaI04msKM4gh1Yqz
	E1CvYUnHOXahjzm+NGkqJec7amPYy5onNXzw07CL+Te6n8FZsFaMNphqX5ecBuKBdEol2Farlu/SW
	VmJgORxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJ9e-0063mb-0N;
	Thu, 21 Sep 2023 12:51:38 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJ9b-0063kT-0S
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 12:51:36 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-991c786369cso119286866b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Sep 2023 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695300691; x=1695905491; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b7aGXpKSZd0nkaqg7goI4xd52TS77NJzRSHYqFQggM8=;
        b=IPu55qaGm2F4go2qOb0+ZM/p9FhLUScrTXEptdZQXcZEX9u0xM9G+LRGeTj7OKL/v2
         Dm2Wn+M5SYmoEAIySiB5Z52gk9W6MUGS+kp2fCLtgjvAMbXburCmn3p5TFL5sJ7wqy7u
         aRpsUCNCBlcDzxmWbMWihROV8tXNmQUS/zCsMJtoA0dZfYi9o8df8MIt16gzzWVQ7zjp
         K88uGUE94sUAAM76zaVWjH5Bw7hvji86lkMeuythQ0zkYQlg8b2YNB77hTmH+2ddZLAd
         mDQtaET2PK31JCV3nTHJccsuDxMXU+mLecbDV3DwULn33QohzRYaShiN1izRzyRP1i6p
         yLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695300691; x=1695905491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7aGXpKSZd0nkaqg7goI4xd52TS77NJzRSHYqFQggM8=;
        b=bu/6KsQDNbFmzfrwapAYbO/Ql7Vs6JGOXOaXvNg6sl+h8aNIEICV7zcxcY3m7tx+15
         Rvv0hN83FZ0a3VoIl1nppN+PX4XdejOWDO7Ab6p3d7WdHR3iRweacViZyDXckz0dYZfJ
         fXE9okKCZD2hiqJgz3sNs/MDGn3pUfrEKOiQQt8v8iKb31x1I+uVitatR28v+7rSpwWP
         CTpP43oEx30VowcTSeRZWnmOgkePYHf7NwLma6GUmfUfNGI6x0vvPE/Lb02zQ9XHFNY4
         AnOI8WHpHG+jCixBcwYbqrloKoccQX9kjAf8po1ZG2qIFztVKxrVeTINek5UFTMtGmPZ
         BtRw==
X-Gm-Message-State: AOJu0YxvZQcVgFDxzq53XDdAljHu7hsXu2LssdDjuILn9hOBFVGUY2s3
	BI/HYrQN68ZBGPJbwYo1ou4PTQ==
X-Google-Smtp-Source: AGHT+IEUZqEOYV4M6SlzSpxNp5dBDgvjEldvmzJ6hEHHcdY4tYiha+4k/ZKwAc0oUEQlmz9ki3DsiQ==
X-Received: by 2002:a17:906:29a:b0:9ae:522e:8f71 with SMTP id 26-20020a170906029a00b009ae522e8f71mr3578502ejf.7.1695300691322;
        Thu, 21 Sep 2023 05:51:31 -0700 (PDT)
Received: from p14s (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id lz1-20020a170906fb0100b0099b5a71b0bfsm1002039ejb.94.2023.09.21.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 05:51:30 -0700 (PDT)
Date: Thu, 21 Sep 2023 06:51:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: andersson@kernel.org, matthias.bgg@gmail.com, tinghan.shen@mediatek.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org,
	kernel@collabora.com
Subject: Re: [PATCH] remoteproc: mediatek: Refactor single core check and fix
 retrocompatibility
Message-ID: <ZQw8UdZ9vhsrggky@p14s>
References: <20230919092336.51007-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919092336.51007-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_055135_187601_786FD8FD 
X-CRM114-Status: GOOD (  19.99  )
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

On Tue, Sep 19, 2023 at 11:23:36AM +0200, AngeloGioacchino Del Regno wrote:
> In older devicetrees we had the ChromeOS EC in a node called "cros-ec"
> instead of the newer "cros-ec-rpmsg", but this driver is now checking
> only for the latter, breaking compatibility with those.
> 
> Besides, we can check if the SCP is single or dual core by simply
> walking through the children of the main SCP node and checking if
> if there's more than one "mediatek,scp-core" compatible node.
> 
> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>

Applied.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index ea227b566c54..a35409eda0cf 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1144,29 +1144,25 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  	return ret;
>  }
>  
> -static int scp_is_single_core(struct platform_device *pdev)
> +static bool scp_is_single_core(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev_of_node(dev);
>  	struct device_node *child;
> +	int num_cores = 0;
>  
> -	child = of_get_next_available_child(np, NULL);
> -	if (!child)
> -		return dev_err_probe(dev, -ENODEV, "No child node\n");
> +	for_each_child_of_node(np, child)
> +		if (of_device_is_compatible(child, "mediatek,scp-core"))
> +			num_cores++;
>  
> -	of_node_put(child);
> -	return of_node_name_eq(child, "cros-ec-rpmsg");
> +	return num_cores < 2;
>  }
>  
>  static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_cluster *scp_cluster)
>  {
>  	int ret;
>  
> -	ret = scp_is_single_core(pdev);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (ret)
> +	if (scp_is_single_core(pdev))
>  		ret = scp_add_single_core(pdev, scp_cluster);
>  	else
>  		ret = scp_add_multi_core(pdev, scp_cluster);
> -- 
> 2.42.0
> 

