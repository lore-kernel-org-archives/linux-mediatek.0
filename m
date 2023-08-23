Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C915FEE49A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhfwjT4tlvrzpnKCjflm2Sl+ahwu3aFmaWxJvLIkO98=; b=zfNfXx+55Ji58psjjJMcHr3a21
	TZ4R5GQ1CkvNSH5qpGkRNeoNpVfl0K8vUE+7/DPCvmQcE3GKh+gnXHAJq7srKY1L5Q1AiPC7nUigP
	l2c+OFbhdhWotn8o74r1NPNHjO8NvHsoSicr04ra8mnP+D2RRK2saYqEgUd+RDcOf1ULZjyS0tTPm
	6EGSaUKfVoS4TPVTef9otckqca5uttyIKjHZOD6i9HEn9rUQMTDgrmJYWYefuNmcGAN82CzJYvTm1
	cePlXY5Ir1IFGNiBALi2osdi8SYefICZn+37C6Jc8KKvplWH9zT5Trx6jAZteXjyG1c8l4YYyG/hs
	fJFU2UCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoie-000pZf-1W;
	Wed, 23 Aug 2023 14:20:24 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoiZ-000pYk-1C;
	Wed, 23 Aug 2023 14:20:22 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so8900721e87.3;
        Wed, 23 Aug 2023 07:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692800417; x=1693405217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vhfwjT4tlvrzpnKCjflm2Sl+ahwu3aFmaWxJvLIkO98=;
        b=VWsAu4zctYB4Hj/BaIyGIeHN/WvcmeJ/TP2QJwdpFBduBe0n2TqhZyfZtLBY5a19IU
         JJbacgfTX7UUbBIvmR5AM/98hrPGlJh5mNQjrhPJzkNuDJqRuLHpSXJpmGfSNMtSqoXQ
         tWNAHKYmpkPTfZuBWQsIMmFPP4gpVQm1jWNtcL/NCJ+KdhkAEV+3NHCXnyKFuQi4Jb9b
         G9PQEMPPEZeG9A/gduv2m7TC8UG4POhqqRy1ecmOu6wcIEUVChopMYhCWugbOa/IzEKL
         rHQs3bfRDGRKIHmpIdxO3aJ20/h0c2cNzM/nTl8hd/hBAfXmxyh5lYQcnAvvfcL8Hlle
         ZSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692800417; x=1693405217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhfwjT4tlvrzpnKCjflm2Sl+ahwu3aFmaWxJvLIkO98=;
        b=AmRkgeGiUpyLUa9L/VjRZRUVL/IiVCaWzAvppAM3nSux8684/Vt7UHaRBrD8ukI8cO
         pIDAGK1NSiJ2TOMTnP4Hn1JUjdAzh8j598otit5wjY7x4IqkO1yDIfxlZrTCS6+uXILX
         twHAVrfhTjkYd5zSv2nc7vIRuQwoo9Sk3Jq4fKiEYvq3T4Pi4yjmYkf/UzbGxCo/nUgw
         YV3xTehdEtuXEXADISddt2qeXluBtydDpvHMlaCDOOohIbk79eAdJRYu68K6dCMLTChG
         DqhpgYKXi8oqAu8NT+xji96hOKRVxkI3jt2gzhKn5IWGKeIBKlmt54Xt/gDrnfxmwhGx
         hCGw==
X-Gm-Message-State: AOJu0YyGakxXls1M5EXP3yWZ1O5FPnb6r8KznC9bvUehqOJ8qNIVDdLP
	fpP51XUtyvK67Ocg7q6jgqQ=
X-Google-Smtp-Source: AGHT+IEGS4rOzzVhq/5nNxTOyLpTJO6FicNda11SZK9keATWBdGhEq2mwTZDRVciIV7jhQm6tMni+w==
X-Received: by 2002:a05:6512:312b:b0:4fd:c884:51fc with SMTP id p11-20020a056512312b00b004fdc88451fcmr8129845lfd.58.1692800416942;
        Wed, 23 Aug 2023 07:20:16 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id w15-20020ac254af000000b004f85d80ca64sm1551281lfk.221.2023.08.23.07.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:20:16 -0700 (PDT)
Date: Wed, 23 Aug 2023 17:20:12 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: andrew@aj.id.au, angelogioacchino.delregno@collabora.com, 
	avifishman70@gmail.com, bcm-kernel-feedback-list@broadcom.com, benjaminfair@google.com, 
	broonie@kernel.org, chin-ting_kuo@aspeedtech.com, clg@kaod.org, 
	conor.dooley@microchip.com, daire.mcnamara@microchip.com, florian.fainelli@broadcom.com, 
	heiko@sntech.de, jbrunet@baylibre.com, joel@jms.id.au, khilman@baylibre.com, 
	linus.walleij@linaro.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	martin.blumenstingl@googlemail.com, matthias.bgg@gmail.com, neil.armstrong@linaro.org, 
	olteanv@gmail.com, openbmc@lists.ozlabs.org, rjui@broadcom.com, 
	sbranden@broadcom.com, tali.perry1@gmail.com, tmaimon77@gmail.com, venture@google.com, 
	yuenn@google.com
Subject: Re: [PATCH -next v2 12/25] spi: dw-mmio: Use helper function
 devm_clk_get_*()
Message-ID: <pflv2canelmm3ea7zpqgxrzj3s7cl56crpdbupkgqlabfnasjj@dkfyiubao2gj>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230823133938.1359106-1-lizetao1@huawei.com>
 <20230823133938.1359106-13-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823133938.1359106-13-lizetao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_072019_417625_9D2B7B85 
X-CRM114-Status: GOOD (  21.60  )
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

On Wed, Aug 23, 2023 at 09:39:25PM +0800, Li Zetao wrote:
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
> ---
> v1 -> v2: Return directly instead of calling reset_control_deassert()
> before the reset control handler has been requested. And use the
> "out_reset" label instead of "out" before calling pm_runtime_enable().

LGTM. Thanks!
Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
>  drivers/spi/spi-dw-mmio.c | 31 +++++++++----------------------
>  1 file changed, 9 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> index 805264c9c65c..46801189a651 100644
> --- a/drivers/spi/spi-dw-mmio.c
> +++ b/drivers/spi/spi-dw-mmio.c
> @@ -340,29 +340,20 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
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
> -	if (IS_ERR(dwsmmio->pclk)) {
> -		ret = PTR_ERR(dwsmmio->pclk);
> -		goto out_clk;
> -	}
> -	ret = clk_prepare_enable(dwsmmio->pclk);
> -	if (ret)
> -		goto out_clk;
> +	dwsmmio->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> +	if (IS_ERR(dwsmmio->pclk))
> +		return PTR_ERR(dwsmmio->pclk);
>  
>  	/* find an optional reset controller */
>  	dwsmmio->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, "spi");
> -	if (IS_ERR(dwsmmio->rstc)) {
> -		ret = PTR_ERR(dwsmmio->rstc);
> -		goto out_clk;
> -	}
> +	if (IS_ERR(dwsmmio->rstc))
> +		return PTR_ERR(dwsmmio->rstc);
> +
>  	reset_control_deassert(dwsmmio->rstc);
>  
>  	dws->bus_num = pdev->id;
> @@ -383,7 +374,7 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
>  	if (init_func) {
>  		ret = init_func(pdev, dwsmmio);
>  		if (ret)
> -			goto out;
> +			goto out_reset;
>  	}
>  
>  	pm_runtime_enable(&pdev->dev);
> @@ -397,9 +388,7 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
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
> @@ -411,8 +400,6 @@ static void dw_spi_mmio_remove(struct platform_device *pdev)
>  
>  	dw_spi_remove_host(&dwsmmio->dws);
>  	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(dwsmmio->pclk);
> -	clk_disable_unprepare(dwsmmio->clk);
>  	reset_control_assert(dwsmmio->rstc);
>  }
>  
> -- 
> 2.34.1
> 

