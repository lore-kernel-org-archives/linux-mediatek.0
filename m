Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3E7EE49A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNjqlZSCnM+mXT6XhXZc25PujLvyxaAxxA/29D6t0s4=; b=Zsi6PrsXhiRnn9hQkNSjiuKzdr
	4zW2lubQC9xVaZzkGGMKRrq0xlmutAXBIhpFRLywx9CXf2rZk0vER4cY7QclkAAmERWx1X8B8FntM
	e0NRVt3EEnXOTRirB2V5EvgAxu9D1j2tXd7F6p5w+Ry/VBgGBdwDK19sriQQNd6nhO38vy98YxkXw
	zxDw+b5v7uyM+2RW7CaWbQ8lnMoHPJkJML0zHf0+uDfo3C0Mvf17BAcU7OrOSMpnSVM5ngt+0TX2l
	/xrn5uXz3o3eqoAPmUF+B97b/HpZeeOhxh/+yvIUkkIpjnBEyp8s8mSreh+tojZ/QF8zNPeOZXHTZ
	rXsijuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRkm-00G4bn-2o;
	Tue, 22 Aug 2023 13:49:04 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRki-00G4aI-0S;
	Tue, 22 Aug 2023 13:49:01 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b962535808so72542561fa.0;
        Tue, 22 Aug 2023 06:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692712137; x=1693316937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VNjqlZSCnM+mXT6XhXZc25PujLvyxaAxxA/29D6t0s4=;
        b=r3O0lTrs/KF6oORMGhJW5zWh1M/62kCIBSY5Z6aAefdvq5klJwZfIsn1qaOMh+1Vj/
         GZQ0PGKIc2afwD1FYgzJitUuUEEtc1TYQAbEqMwWsV7ky+RwewBra9WlPN8+1ZGts7tG
         I5OHkCWg3b9yKseq2IMq3s0J+U6ZWHZq9NZlfYyvO9pwesPQV1SI1GK5WSVfhcGVyUmB
         R7pVhbxwCCSjahJmpLKdc5nkniYYw/QYLodxF6GscBzgvmk1racMwEDvLZuHeFphpT28
         VNknmCBjlYwcVryQX2bR05VtM3LiDKeYhz6nt51g3MTZ9kKexziuiO5fO+8VVmmwp00h
         sJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692712137; x=1693316937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNjqlZSCnM+mXT6XhXZc25PujLvyxaAxxA/29D6t0s4=;
        b=HkKjvWbs7gqwB0AKdVeTmlzs9Ok3QfwvwT8sFx06f9KZD/CvjDG2err2oBbH3r/id4
         JUWMIo6gIoIrBers6hws8CxUmFhE60BYhCeCIajCwG7bgJzTusWT8EwEsUoiVwYeKHc1
         bIVLGZrY1cRJpGqSFDTZ52XZeb7ScCU/XA9IFVx68Yis1oORXBWEiBlrwBcVm/TxQmW1
         /FC8p20fDYyzTbK+MYju8B6UybFltAasuuBGhg9l/OUeGXYNZP6Kzq9apLBhI3vTQFrq
         tfKelMO0CrOUVGwc8CUI2ZZVaH+CWPN+YkH+rltZJAkKOa/aEROsiC0J07+uTgK4/Rrg
         2DUQ==
X-Gm-Message-State: AOJu0YxWvlREa0DBy4bybwaZ+LY4+RtenF0nBVwYqf5EW7u5N11I193P
	2vc2+2XY0Yo5rg0osxhmsek=
X-Google-Smtp-Source: AGHT+IFihF3LNptCC53uVWoB/jzGuMUDG0z8kyH5P7DgnkKOe5f0uDFLvmrkswwLW8XSS39t+jRvkg==
X-Received: by 2002:a2e:8091:0:b0:2b9:55c9:c228 with SMTP id i17-20020a2e8091000000b002b955c9c228mr6800491ljg.27.1692712136740;
        Tue, 22 Aug 2023 06:48:56 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id z16-20020a2e8410000000b002b9cd2d0d39sm2740953ljg.28.2023.08.22.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 06:48:56 -0700 (PDT)
Date: Tue, 22 Aug 2023 16:48:53 +0300
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
Subject: Re: [PATCH -next 11/25] spi: dw-bt1: Use helper function
 devm_clk_get_enabled()
Message-ID: <i2bjbilyzg22xas2zpuumnsb4rolv2tkb4vhx2kyryizf2775b@764f3gk56ttn>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230822131237.1022815-12-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822131237.1022815-12-lizetao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_064900_180417_5485737E 
X-CRM114-Status: GOOD (  18.59  )
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

On Tue, Aug 22, 2023 at 09:12:23PM +0800, Li Zetao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

LGTM. Thanks!
Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  drivers/spi/spi-dw-bt1.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/spi/spi-dw-bt1.c b/drivers/spi/spi-dw-bt1.c
> index 5e1c01822967..5391bcac305c 100644
> --- a/drivers/spi/spi-dw-bt1.c
> +++ b/drivers/spi/spi-dw-bt1.c
> @@ -269,43 +269,32 @@ static int dw_spi_bt1_probe(struct platform_device *pdev)
>  
>  	dws->paddr = mem->start;
>  
> -	dwsbt1->clk = devm_clk_get(&pdev->dev, NULL);
> +	dwsbt1->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(dwsbt1->clk))
>  		return PTR_ERR(dwsbt1->clk);
>  
> -	ret = clk_prepare_enable(dwsbt1->clk);
> -	if (ret)
> -		return ret;
> -
>  	dws->bus_num = pdev->id;
>  	dws->reg_io_width = 4;
>  	dws->max_freq = clk_get_rate(dwsbt1->clk);
> -	if (!dws->max_freq) {
> -		ret = -EINVAL;
> -		goto err_disable_clk;
> -	}
> +	if (!dws->max_freq)
> +		return -EINVAL;
>  
>  	init_func = device_get_match_data(&pdev->dev);
>  	ret = init_func(pdev, dwsbt1);
>  	if (ret)
> -		goto err_disable_clk;
> +		return ret;
>  
>  	pm_runtime_enable(&pdev->dev);
>  
>  	ret = dw_spi_add_host(&pdev->dev, dws);
>  	if (ret) {
>  		pm_runtime_disable(&pdev->dev);
> -		goto err_disable_clk;
> +		return ret;
>  	}
>  
>  	platform_set_drvdata(pdev, dwsbt1);
>  
>  	return 0;
> -
> -err_disable_clk:
> -	clk_disable_unprepare(dwsbt1->clk);
> -
> -	return ret;
>  }
>  
>  static void dw_spi_bt1_remove(struct platform_device *pdev)
> @@ -315,8 +304,6 @@ static void dw_spi_bt1_remove(struct platform_device *pdev)
>  	dw_spi_remove_host(&dwsbt1->dws);
>  
>  	pm_runtime_disable(&pdev->dev);
> -
> -	clk_disable_unprepare(dwsbt1->clk);
>  }
>  
>  static const struct of_device_id dw_spi_bt1_of_match[] = {
> -- 
> 2.34.1
> 

