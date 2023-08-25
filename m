Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CAEC3DA66
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcpE5/uAphm7V2jAsvNKPpT3VFEigZdDV1BAVW70JIM=; b=oFwyi9dLmzpCv8ccWPsqLpI+U6
	sIGYqMeVoDBLswXcT9TBrDtO/cI7Tv3Bmqc+CD1iffILuEtEIqstDc9QXJN0kY3c9WfKd6Zz47ssQ
	pYjx2mvezJqZS74i6HNrgeeUzBXllLpG3xDWi8XTIMfZEGcKPuiJsf+8jHZQWU6YrgdGknHWNIHps
	OZvH53ugX+WiMMCJxLVAshXhB/5yGduHLvO8+9LrrI8/2JTiMWepNiogJDbzFdnOwkVtlVpKgfJG9
	UVViq7re+kG67zZ0azLx8ToY+WzxucE6epALWLdOswBdyRtJ6V/jeHaityU2q6rFs3AunHdKQUAwr
	aWKOjPFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZWGL-005Q4s-1n;
	Fri, 25 Aug 2023 12:50:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZWGH-005Q49-13;
	Fri, 25 Aug 2023 12:50:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A6C566C14;
	Fri, 25 Aug 2023 12:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4550C433C7;
	Fri, 25 Aug 2023 12:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692967799;
	bh=1haDrisz44iUrE3NxI7V4IWD23n0aYus9i3F3Q97qc0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XPwLfyCDaVrEKBOCVP6MzmrnQNu27Y7tKiQU6D4dBNU9L54U4D8neb9RyN2RAefrX
	 3I8klXtRtYlG+cl5Zr7WeErV1PYNVDPmkNNsSd5o61Fj7bMZnqQN6ohdz2Eottu+8M
	 PluhjB2Ge+YioGpSjVy/xRGCAWa0xBtuLUTKyeReN1wAYOtpjb9wN+0+bLFslI4YIk
	 umr92og3ymlPoUKZwxS0ePN6gYqSiH0R9fHLyoM4+byvD5PeiU2rmYBF+Sq8neuVJa
	 9yAv5/ow9AP0o4Fs8BakztEffmEJrl0Rblwk/gjs21v5mdkc0XHszV0zNJ72P7TwTY
	 zKtcV5EirDx/g==
Date: Fri, 25 Aug 2023 13:50:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <lars@metafoo.de>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <Michael.Hennerich@analog.com>, <heiko@sntech.de>,
 <yangyingliang@huawei.com>, <robh@kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH -next 1/4] iio: adc: at91_adc: Use
 devm_clk_get_enabled() helper function
Message-ID: <20230825135015.481d0aff@jic23-huawei>
In-Reply-To: <20230825105746.2999548-2-ruanjinjie@huawei.com>
References: <20230825105746.2999548-1-ruanjinjie@huawei.com>
	<20230825105746.2999548-2-ruanjinjie@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_055001_456338_065AACE3 
X-CRM114-Status: GOOD (  22.57  )
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

On Fri, 25 Aug 2023 18:57:43 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

This looks good, but should ideally be proceeded by a separate patch moving to
devm_request_irq() as then the exit paths will become much simpler and you
can also move to return dev_err_probe() save a few pointless lines of code
and give the benefit of debug info for deferred return codes.




> ---
>  drivers/iio/adc/at91_adc.c | 38 ++++++++++----------------------------
>  1 file changed, 10 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
> index de6650f9c4b1..318e33ce22fb 100644
> --- a/drivers/iio/adc/at91_adc.c
> +++ b/drivers/iio/adc/at91_adc.c
> @@ -1087,32 +1087,20 @@ static int at91_adc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	st->clk = devm_clk_get(&pdev->dev, "adc_clk");
> +	st->clk = devm_clk_get_enabled(&pdev->dev, "adc_clk");
>  	if (IS_ERR(st->clk)) {
> -		dev_err(&pdev->dev, "Failed to get the clock.\n");
> -		ret = PTR_ERR(st->clk);
> -		goto error_free_irq;
> -	}
> -
> -	ret = clk_prepare_enable(st->clk);
> -	if (ret) {
>  		dev_err(&pdev->dev,
>  			"Could not prepare or enable the clock.\n");
> +		ret = PTR_ERR(st->clk);
>  		goto error_free_irq;
>  	}
>  
> -	st->adc_clk = devm_clk_get(&pdev->dev, "adc_op_clk");
> +	st->adc_clk = devm_clk_get_enabled(&pdev->dev, "adc_op_clk");
>  	if (IS_ERR(st->adc_clk)) {
> -		dev_err(&pdev->dev, "Failed to get the ADC clock.\n");
> -		ret = PTR_ERR(st->adc_clk);
> -		goto error_disable_clk;
> -	}
> -
> -	ret = clk_prepare_enable(st->adc_clk);
> -	if (ret) {
>  		dev_err(&pdev->dev,
>  			"Could not prepare or enable the ADC clock.\n");
> -		goto error_disable_clk;
> +		ret = PTR_ERR(st->adc_clk);
> +		goto error_free_irq;
>  	}
>  
>  	/*
> @@ -1132,7 +1120,7 @@ static int at91_adc_probe(struct platform_device *pdev)
>  	if (!st->startup_time) {
>  		dev_err(&pdev->dev, "No startup time available.\n");
>  		ret = -EINVAL;
> -		goto error_disable_adc_clk;
> +		goto error_free_irq;
>  	}
>  	ticks = (*st->caps->calc_startup_ticks)(st->startup_time, adc_clk_khz);
>  
> @@ -1160,7 +1148,7 @@ static int at91_adc_probe(struct platform_device *pdev)
>  	ret = at91_adc_channel_init(idev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Couldn't initialize the channels.\n");
> -		goto error_disable_adc_clk;
> +		goto error_free_irq;
>  	}
>  
>  	init_waitqueue_head(&st->wq_data_avail);
> @@ -1175,19 +1163,19 @@ static int at91_adc_probe(struct platform_device *pdev)
>  		ret = at91_adc_buffer_init(idev);
>  		if (ret < 0) {
>  			dev_err(&pdev->dev, "Couldn't initialize the buffer.\n");
> -			goto error_disable_adc_clk;
> +			goto error_free_irq;
>  		}
>  
>  		ret = at91_adc_trigger_init(idev);
>  		if (ret < 0) {
>  			dev_err(&pdev->dev, "Couldn't setup the triggers.\n");
>  			at91_adc_buffer_remove(idev);
> -			goto error_disable_adc_clk;
> +			goto error_free_irq;
>  		}
>  	} else {
>  		ret = at91_ts_register(idev, pdev);
>  		if (ret)
> -			goto error_disable_adc_clk;
> +			goto error_free_irq;
>  
>  		at91_ts_hw_init(idev, adc_clk_khz);
>  	}
> @@ -1207,10 +1195,6 @@ static int at91_adc_probe(struct platform_device *pdev)
>  	} else {
>  		at91_ts_unregister(st);
>  	}
> -error_disable_adc_clk:
> -	clk_disable_unprepare(st->adc_clk);
> -error_disable_clk:
> -	clk_disable_unprepare(st->clk);
>  error_free_irq:
>  	free_irq(st->irq, idev);
>  	return ret;
> @@ -1228,8 +1212,6 @@ static int at91_adc_remove(struct platform_device *pdev)
>  	} else {
>  		at91_ts_unregister(st);
>  	}
> -	clk_disable_unprepare(st->adc_clk);
> -	clk_disable_unprepare(st->clk);
>  	free_irq(st->irq, idev);
>  
>  	return 0;


