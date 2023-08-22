Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8481EEE4996
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTGaJ7rfll5+TIoKtD8rQ17fpoQZKTBj+qXginUUSCc=; b=O49WUvV9HT3Dii5szqRBpThyB4
	eD1ABhLtoSzecObA2CeHK6lB491GGujELG2Qug8/E8lFGmkOVXM2Gib2EarYz52y99l7yfHAIdtsZ
	lvtwCZFIxCP+JtQT1+6/Ye86c3XovDIvP5qjooZ8zu5kqgfNwyiagQLKxQh9qt0f48MDmEw0svZzT
	7e8wseFvNY+kppeUMV+bYntwRT52k5b09pxs8yrGu6Pi9PyoKq7L77W3yL3KglS+kkNy/L65OK33N
	yWvPLHKPjrtaD5gUoI4Ha3qkYqDZaHdbBe8v9nL2B9zTFvH2z+IC+t39CTmFLcdKvMaIOHbdQ5tij
	jG6hqWHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRiN-00G4C9-1Z;
	Tue, 22 Aug 2023 13:46:35 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRiI-00G4AO-1v;
	Tue, 22 Aug 2023 13:46:32 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5007616b756so4140703e87.3;
        Tue, 22 Aug 2023 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692711986; x=1693316786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MTGaJ7rfll5+TIoKtD8rQ17fpoQZKTBj+qXginUUSCc=;
        b=XZskPA9EraSErL3a6U3IDF3H2KOml/Nf3Q2jHk6HiWtI7gzyVa6JaQEQVBloRXdKJn
         BiG64jlHMWWgjO5hNPJlqTP0TzRDti00DmymO7S4098ZreW2DATJCrKzHC0chLRBEfoU
         EtYeAr/bkpT+PlhKzYFCM/ESb7aHC8yknuqialAurtctVPctAi0yNOfpfeOWrJPjgdqw
         p/3jQuN1FSFM6/a33fpCs0dwfs6lEE9n4OJWChFJ9X2R4NGGBfX+N5mVQXeeRbYnfaiM
         yAjO5NPNnx74hAhqpR5TLZfdbonNcJqgB5o6H6OFZ9EJV8/q2J9LQ96T90m+HAjTEG0g
         8fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692711986; x=1693316786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTGaJ7rfll5+TIoKtD8rQ17fpoQZKTBj+qXginUUSCc=;
        b=ikdBZV6VhMtwVItvOfjKjmybmyKJQK0hggxVlahFqLCOb2i5SdOQS9Gupv5lfZdL0L
         J/hW2YDyBkvd7BpLsZkbx2agB4adYbW8oX/AMpJcC53p1bA+aDCtfWYVGO3oGqLb1V5w
         zrt5fZUPN/RV5caKjPYsKDZXrLJ1/xZ1E1R3ZgtnwP1R3kktGQH2OMPM20s/2OT0cSXt
         ZKfSf24ZFeMt5O/MNWU8NMe2+71wXdcB7ntuEbNegYqVl+sAx2ZgpjRGIm+3Bdsg/ciH
         fAiauQPe/KTQGmzEFtzKPE+joC8XnRtUxL8w/vKJ21GkJdQpPznV1PBAhogHuZYOptuT
         Ex7Q==
X-Gm-Message-State: AOJu0YyZ2ivZnVMo1nrQwYk9KlhE7SP+TNwyAqoaeUNBpQqG/reByB9W
	q+tSwpzVq4rUCKeKr7oqqW4=
X-Google-Smtp-Source: AGHT+IGZh43r6SDx8uUzyiBo7MHeEoyEfWUuOYkCXmiQnhEjEt46jydpFe6tldtmYn3HhlQHDRvF1w==
X-Received: by 2002:a19:651d:0:b0:4ff:8fdd:4be4 with SMTP id z29-20020a19651d000000b004ff8fdd4be4mr7038959lfb.29.1692711985687;
        Tue, 22 Aug 2023 06:46:25 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id o10-20020ac2434a000000b004fe1c9ce61bsm349066lfl.116.2023.08.22.06.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 06:46:25 -0700 (PDT)
Date: Tue, 22 Aug 2023 16:46:21 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: broonie@kernel.org, chin-ting_kuo@aspeedtech.com, clg@kaod.org, 
	joel@jms.id.au, andrew@aj.id.au, florian.fainelli@broadcom.com, 
	rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	olteanv@gmail.com, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, conor.dooley@microchip.com, 
	daire.mcnamara@microchip.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, linus.walleij@linaro.org, 
	heiko@sntech.de, linux-spi@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH -next 12/25] spi: dw-mmio: Use helper function
 devm_clk_get_*()
Message-ID: <6x3xkim6wn3wfxuopis7w3sp2yz2ufjdvg6xqofloveesa3wtr@rbc2sazrr2gx>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230822131237.1022815-13-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822131237.1022815-13-lizetao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_064630_633593_6C939D17 
X-CRM114-Status: GOOD (  26.98  )
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

Hi Li

On Tue, Aug 22, 2023 at 09:12:24PM +0800, Li Zetao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly. Also,
> devm_clk_get_optional() and clk_prepare_enable() can now be replaced by
> devm_clk_get_optional_enabled(). Moreover, the lable "out_clk" no longer
> makes sense, rename it to "out_reset".
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Several nitpicks below please since you are touching the code anyway.

> ---
>  drivers/spi/spi-dw-mmio.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> index 805264c9c65c..6d9f64ecbfd6 100644
> --- a/drivers/spi/spi-dw-mmio.c
> +++ b/drivers/spi/spi-dw-mmio.c
> @@ -340,28 +340,22 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
>  	if (dws->irq < 0)
>  		return dws->irq; /* -ENXIO */
>  
> -	dwsmmio->clk = devm_clk_get(&pdev->dev, NULL);
> +	dwsmmio->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(dwsmmio->clk))
>  		return PTR_ERR(dwsmmio->clk);
> -	ret = clk_prepare_enable(dwsmmio->clk);
> -	if (ret)
> -		return ret;
>  
>  	/* Optional clock needed to access the registers */
> -	dwsmmio->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
> +	dwsmmio->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");

>  	if (IS_ERR(dwsmmio->pclk)) {
>  		ret = PTR_ERR(dwsmmio->pclk);
> -		goto out_clk;
> +		goto out_reset;
>  	}

Just return from here please. There is no point in calling
reset_control_deassert() on error because the reset control handler
hasn't been requested yet. So the argument will be NULL and considered
as optional reset-control.

> -	ret = clk_prepare_enable(dwsmmio->pclk);
> -	if (ret)
> -		goto out_clk;
>  
>  	/* find an optional reset controller */
>  	dwsmmio->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, "spi");

>  	if (IS_ERR(dwsmmio->rstc)) {
>  		ret = PTR_ERR(dwsmmio->rstc);
> -		goto out_clk;
> +		goto out_reset;
>  	}

ditto


Please use the "out_reset" label in the next part of the code:
	init_func = device_get_match_data(&pdev->dev);
	if (init_func) {
		ret = init_func(pdev, dwsmmio);
		if (ret)
-			goto out;
+			goto out_reset;
	}

I know this changes the cleanup-on-error path logic. But since you are
touching exactly that code anyway it would be good to have it properly
fixed.

>  	reset_control_deassert(dwsmmio->rstc);
>  
> @@ -397,9 +391,7 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
>  
>  out:
>  	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(dwsmmio->pclk);
> -out_clk:
> -	clk_disable_unprepare(dwsmmio->clk);
> +out_reset:
>  	reset_control_assert(dwsmmio->rstc);
>  
>  	return ret;
> @@ -411,8 +403,6 @@ static void dw_spi_mmio_remove(struct platform_device *pdev)
>  

>  	dw_spi_remove_host(&dwsmmio->dws);
>  	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(dwsmmio->pclk);
> -	clk_disable_unprepare(dwsmmio->clk);
>  	reset_control_assert(dwsmmio->rstc);

The order here isn't correct too. But I guess we can live with it.
It isn't that important.

-Serge(y)

>  }
>  
> -- 
> 2.34.1
> 

