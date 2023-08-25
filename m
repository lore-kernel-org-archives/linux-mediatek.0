Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D117C3DA66
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWtFJhT9Q9I5eq5BcqlxeXGxyQRxkExZr6MCCnIus2o=; b=KAGNbot77DHGBtf/eX9tlAFUP0
	JtTWluZwVgWHdeBIE25HGdlR21UTsxWwmQgxTDmdiGasG0YGbfGLvyEThABqAVitIE0dDU4WATsDA
	77f2Qtrh/ahfxeTEN18S1rpAzD4W2jPUMWhzANBs0HikL2nBFQ54QrAUrLy75OXXRtkvh9aADjj1H
	+sv1B6LNiDwUBdp68ShdjpzWH00ubAt0kLLEP4dzaxM9cLibh1lIAzl5aqm+e/wiHTcQyn0G9CN2L
	+1hc1OKruGWkJtCGKO9vjXvpNlnLcxfKr9FfanXrB6JwA4N+a9KVVgYeHlePY4i9XVNZC3At/kfmk
	w3mi74Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZWKz-005QU1-37;
	Fri, 25 Aug 2023 12:54:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZWKx-005QT8-00;
	Fri, 25 Aug 2023 12:54:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D0B36118C;
	Fri, 25 Aug 2023 12:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8680DC433C8;
	Fri, 25 Aug 2023 12:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692968089;
	bh=FWQPg110TvgRc6tCfjwnV3BeJ2g4RKBITPitm6v1+Vs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R/eKp0y/LlrvgJ7LLiNKjoL0vcRSwv/gytA5fqtgx1gDs523gUrtepyQw90Am8tR5
	 c8ICNbA4HsODW5ldVMDUIt3Gm26P51dBk6fbDwcKymHWHIkRBHHvdsGQka9ulMv+Ra
	 NRBAUsXlyXurHz5cnM/DkFHh1zCJtAGp0RrbOWb0Bycb4OlddnlU3uzMhrqvKepI/k
	 qddY1uENgMVdD0ey0T5qkGynB3uYUArbazG3DOiZ3c3gOh7IShBREPp2D1rjkr+nxi
	 t87TtaHV6pQ/5uGIxeo0ZqH9sI68Ps9PEdx6cwJqRvStvf3vu1ckwsvqP4yEupJakU
	 zA6yNkY7LyHsw==
Date: Fri, 25 Aug 2023 13:55:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <lars@metafoo.de>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <Michael.Hennerich@analog.com>, <heiko@sntech.de>,
 <yangyingliang@huawei.com>, <robh@kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH -next 3/4] iio: adc: spear_adc: Use
 devm_clk_get_enabled() helper function
Message-ID: <20230825135504.17b4464e@jic23-huawei>
In-Reply-To: <20230825105746.2999548-4-ruanjinjie@huawei.com>
References: <20230825105746.2999548-1-ruanjinjie@huawei.com>
	<20230825105746.2999548-4-ruanjinjie@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_055451_127504_B364EFA5 
X-CRM114-Status: GOOD (  21.31  )
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

On Fri, 25 Aug 2023 18:57:45 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Also switch to devm_iio_device_register() and drop the remove function.

Jonathan

> ---
>  drivers/iio/adc/spear_adc.c | 30 +++++++-----------------------
>  1 file changed, 7 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/iio/adc/spear_adc.c b/drivers/iio/adc/spear_adc.c
> index ad54ef798109..cd7708aa95af 100644
> --- a/drivers/iio/adc/spear_adc.c
> +++ b/drivers/iio/adc/spear_adc.c
> @@ -297,36 +297,27 @@ static int spear_adc_probe(struct platform_device *pdev)
>  	st->adc_base_spear3xx =
>  		(struct adc_regs_spear3xx __iomem *)st->adc_base_spear6xx;
>  
> -	st->clk = devm_clk_get(dev, NULL);
> +	st->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(st->clk)) {
> -		dev_err(dev, "failed getting clock\n");
> -		return PTR_ERR(st->clk);
> -	}
> -
> -	ret = clk_prepare_enable(st->clk);
> -	if (ret) {
>  		dev_err(dev, "failed enabling clock\n");
> -		return ret;
> +		return PTR_ERR(st->clk);
>  	}
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		ret = irq;
> -		goto errout2;
> -	}
> +	if (irq < 0)
> +		return irq;
>  
>  	ret = devm_request_irq(dev, irq, spear_adc_isr, 0, SPEAR_ADC_MOD_NAME,
>  			       st);
>  	if (ret < 0) {
>  		dev_err(dev, "failed requesting interrupt\n");
> -		goto errout2;
> +		return ret;
>  	}
>  
>  	if (of_property_read_u32(np, "sampling-frequency",
>  				 &st->sampling_freq)) {
>  		dev_err(dev, "sampling-frequency missing in DT\n");
> -		ret = -EINVAL;
> -		goto errout2;
> +		return -EINVAL;
>  	}
>  
>  	/*
> @@ -355,24 +346,17 @@ static int spear_adc_probe(struct platform_device *pdev)
>  
>  	ret = iio_device_register(indio_dev);
>  	if (ret)
> -		goto errout2;
> +		return ret;
>  
>  	dev_info(dev, "SPEAR ADC driver loaded, IRQ %d\n", irq);
>  
>  	return 0;
> -
> -errout2:
> -	clk_disable_unprepare(st->clk);
> -	return ret;
>  }
>  
>  static int spear_adc_remove(struct platform_device *pdev)
>  {
>  	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> -	struct spear_adc_state *st = iio_priv(indio_dev);
> -
>  	iio_device_unregister(indio_dev);
> -	clk_disable_unprepare(st->clk);
>  
>  	return 0;
>  }


