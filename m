Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A155CE79D1
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 13:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKKE8RPYAnWlMmqVMLxDoN9viEYmRbfdJ1ZPSe1owbM=; b=eYmEmGV/LGYqwmxO+A/2o8hTsp
	GB6IwhkSlKYSZ2LKqAfd4j8N+NmfNMflsXpz5t9ui2FkOyHC+Cb+ZTaFxF/C+R1ieYTAsUSkk+5D1
	p4dgaPhW/HEQxuQOjqjgolkElJG+mVPbBFjSLuVyxaJSCm/yU4irZIOTPahPCIdDYRyOJFHSVGhm9
	/qQxWhrU7J6gE7oLeOR+auhT5OAyVLUVZJdwlYOY6ajlsS3PD0NBYUbmUUs2WubST6cHzhdZEVhXR
	2z5OfalCqKS2mFZf29bcVh1V3ctY3tFipQRfZ/nJTQFLZ0VcwQ/FkQwj1jS3tW0aCcff6BbIGeDPd
	FjsYzpyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixGI-003BKL-2h;
	Wed, 20 Sep 2023 13:29:02 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixGG-003BIr-0B
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Sep 2023 13:29:01 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9adc75f6f09so760723566b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Sep 2023 06:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695216535; x=1695821335; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WKKE8RPYAnWlMmqVMLxDoN9viEYmRbfdJ1ZPSe1owbM=;
        b=zPhpUPe7/ICLCXMtHMbg2D459FjvHT55wprmSRth7qN/cw85gkp/d0Qr3li7shAeCV
         nLzKjGWkKFTZgTZKyIHdaIwYpm3Thi5e/HubNb3V6chmDkyJL2hQUY0UGYy86NZMWLR3
         0T4Yd6jcUBFLEK1dgyLjAwJNN6cwqjlVnDc/JdQSoHMKEb45zi3cawB2WKDi03pNqYRi
         rc/sGLckXfDO7KCVXAaB+ix87bBbo1K0JuokSZx9eWui/J8OhRpe5wrgwtQ7nYg3T4mu
         hjxPbOZnC5vOPLjkfw/Eqedk1YUKwmiQEy5AggUA4JEzjf5gPIJgKorWjW9O4Y4/dBHV
         ki/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695216535; x=1695821335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKKE8RPYAnWlMmqVMLxDoN9viEYmRbfdJ1ZPSe1owbM=;
        b=j54IWqKjVmR15GMS2XyHKLXbBv9obV3BpZeISXl0Onq6aRhSQfEzrpNpQ8jPz86znB
         MpNXYAF3aSYeCw8Wf+kzFUWbN6fXInhD/bMDjRQ9QpPdqsHunSP/SMdWZfHKKZtzpM/O
         JsitDcnQgX5KjMgN+4CMOehoBJm0/oQvALjE2R14gZb0raZND3gTJrywMJAyHuT7foTn
         E+bbmaPFcdFdLWSUfmUPtsAtU40QtLNTPQs/1QJFh8umYrXeRJvD0t1C5eYtOkkWtj0D
         p2r+x/vw98GyfRfYzFW3cbeiMOCaouw9roDMGIYnUnhM/s9ZPZ8avWybyBEvz7Hxxk08
         tz/Q==
X-Gm-Message-State: AOJu0YzvAaYxMiYvg4CWzCqmpB+Zi2xQ2vQXdmcw/qfcNK4STLqj2/DY
	XX1ChU6EwKm5PwB7zKdawibjiA==
X-Google-Smtp-Source: AGHT+IEMb0ZK8g7jPPFXjiWmXny/RUobbu8OKSNXezHxqkqePH36qIeLezlT4sN2iWm9Y9gneehnUw==
X-Received: by 2002:a17:906:23e9:b0:9aa:209f:20c3 with SMTP id j9-20020a17090623e900b009aa209f20c3mr2062185ejg.68.1695216535584;
        Wed, 20 Sep 2023 06:28:55 -0700 (PDT)
Received: from p14s (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906560a00b0099d0c0bb92bsm9237058ejq.80.2023.09.20.06.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 06:28:55 -0700 (PDT)
Date: Wed, 20 Sep 2023 07:28:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wenst@chromium.org, laura.nao@collabora.com,
	tinghan.shen@mediatek.com
Cc: andersson@kernel.org, matthias.bgg@gmail.com, tinghan.shen@mediatek.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org,
	kernel@collabora.com
Subject: Re: [PATCH] remoteproc: mediatek: Refactor single core check and fix
 retrocompatibility
Message-ID: <ZQrzlcVpvYUY11G5@p14s>
References: <20230919092336.51007-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919092336.51007-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_062900_091677_EC854ED1 
X-CRM114-Status: GOOD (  21.91  )
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

I find this patch to be the most appropriate to fix this problem.  Laura,
Chen-Yu and Tinghan, please test the patch and reply public with your Testeb-by
tags.

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

