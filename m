Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDEDC3DA66
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82EiVokoFkZEtIiI59AteKw86n2l6pXvpfN5NFkS0dU=; b=Le7NJyIO9Gei8pYgqUxmmkW34Y
	4PkvJyIQy1h05B4mYUm2wbeElKr5lPMecaHi+gK/6j+rks4VBdrNNtEIuoMLWUeH7CTkyKi+nG7n/
	cZmjyOUFVzIxoCiw9YJx1lZbbiPGmnrAqlxjoQmFhASIB4RQ4yxoPs6XZSlo4Y/j/oyls5ASr9Ijp
	gYUr86nU3VEt5wl6bsAwFReSpnsml3u3S1mr5KQPFbE/n8eJJ1+l1tCvqkXX+3bRPJgj+qxDwKQre
	vqKfG8qgOVegB9pfA3N/ywICa0cHgGtZCbE7m2VHv/jr5wiY5O1qfB+4H147+hFs9F89DK2xVhFRz
	4jaZZndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZWNT-005RD2-1S;
	Fri, 25 Aug 2023 12:57:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZWNP-005RC5-22;
	Fri, 25 Aug 2023 12:57:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1932F63052;
	Fri, 25 Aug 2023 12:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FB3C433C8;
	Fri, 25 Aug 2023 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692968242;
	bh=oK+UJY0bkF8Ywx3I5L1JxmoE98xeSKEIW/uQI5EQvXw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VAb/zMY57q/KcVtBg1bQpEutdDpiY5joNNw1Q8ZIMbSi4L1LoYPFifzUfyQpIsKE/
	 x8ms+6osxL3VbzupfAc8w1/SLSEUc+wdlcs4XOvoviRo59A/V2tx0YOKaJKfkhIyV1
	 vfS5XsP+X3iFp/3sQfXq2HcGcdbaDHw/8ZFkYEzwQ3hVSV0mTMhlh62nOZT3cYAlex
	 Es4URJ40lO7+mTLGthpB/jZwFIiqw5xLMRn3LNVmLDN3zHSasw0XhGD+NWSw2vnHsD
	 r4QJc/ts1mnLDsVMSVmFjrU7B3iW/EcfZwo6D7Q8sgKGiMvZ/1odkYjRTOfzmPRERV
	 EyBGbfaHNI/TA==
Date: Fri, 25 Aug 2023 13:57:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <lars@metafoo.de>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <Michael.Hennerich@analog.com>, <heiko@sntech.de>,
 <yangyingliang@huawei.com>, <robh@kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH -next 4/4] iio: frequency: adf4350: Use
 devm_clk_get_enabled() helper function
Message-ID: <20230825135740.50c9643a@jic23-huawei>
In-Reply-To: <20230825105746.2999548-5-ruanjinjie@huawei.com>
References: <20230825105746.2999548-1-ruanjinjie@huawei.com>
	<20230825105746.2999548-5-ruanjinjie@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_055723_766062_BE55FCC4 
X-CRM114-Status: GOOD (  20.09  )
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

On Fri, 25 Aug 2023 18:57:46 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

I'm fairly sure st->reg is never used except for disable. As such you can finish
the job here by moving to equivalent devm_regulator enabled call and devm_iio_device_register()
That should avoid any potential ordering issues which are a bit un obvious with just
this patch

Jonathan

> ---
>  drivers/iio/frequency/adf4350.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iio/frequency/adf4350.c b/drivers/iio/frequency/adf4350.c
> index 85e289700c3c..22330d1768ff 100644
> --- a/drivers/iio/frequency/adf4350.c
> +++ b/drivers/iio/frequency/adf4350.c
> @@ -491,20 +491,14 @@ static int adf4350_probe(struct spi_device *spi)
>  	}
>  
>  	if (!pdata->clkin) {
> -		clk = devm_clk_get(&spi->dev, "clkin");
> +		clk = devm_clk_get_enabled(&spi->dev, "clkin");
>  		if (IS_ERR(clk))
> -			return -EPROBE_DEFER;
> -
> -		ret = clk_prepare_enable(clk);
> -		if (ret < 0)
> -			return ret;
> +			return PTR_ERR(clk);
>  	}
>  
>  	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
> -	if (indio_dev == NULL) {
> -		ret =  -ENOMEM;
> -		goto error_disable_clk;
> -	}
> +	if (indio_dev == NULL)
> +		return -ENOMEM;
>  
>  	st = iio_priv(indio_dev);
>  
> @@ -512,7 +506,7 @@ static int adf4350_probe(struct spi_device *spi)
>  	if (!IS_ERR(st->reg)) {
>  		ret = regulator_enable(st->reg);
>  		if (ret)
> -			goto error_disable_clk;
> +			return ret;
>  	}
>  
>  	spi_set_drvdata(spi, indio_dev);
> @@ -564,8 +558,6 @@ static int adf4350_probe(struct spi_device *spi)
>  error_disable_reg:
>  	if (!IS_ERR(st->reg))
>  		regulator_disable(st->reg);
> -error_disable_clk:
> -	clk_disable_unprepare(clk);
>  
>  	return ret;
>  }
> @@ -581,8 +573,6 @@ static void adf4350_remove(struct spi_device *spi)
>  
>  	iio_device_unregister(indio_dev);
>  
> -	clk_disable_unprepare(st->clk);
> -
>  	if (!IS_ERR(reg))
>  		regulator_disable(reg);
>  }


