Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388F7C3DA66
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jE+w4j5bdqKz334NNeFZaNHs37u3wtaDDXkPrQmU3s=; b=ZoclXKccB9rnkn/ffZSv3FaVXA
	9dX43ASN+KYOzovpUyB7FPhJew5cEsFIlkg93KaIVy77GXCAc9k5Cfg9PQb7zDklKNtpuK02FV8AU
	8fbvmfo64i011gU+UlxNH+oAr06fc1sIuLkGtza37lsF5Mn5vH4yLeOEKzDfN+rS1BATWUceKu7nW
	+2T/cmOliSkW862KC4Jvd/dVWGKIqXF9HnbuaJzaK+t/EOEdQgBoMRfUkPnmL5Wa5BwEXnUntClrv
	BuKiUKS0cZ3cWf1RWw5RprEwk8dhJZvAFVcvQ5krT3QnY7Rbq4JU0yCKC3rgK4qHFaKZBC4/3ZU6s
	yEc/Apmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZWK0-005QMR-0H;
	Fri, 25 Aug 2023 12:53:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZWJw-005QLx-25;
	Fri, 25 Aug 2023 12:53:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C68086448F;
	Fri, 25 Aug 2023 12:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5652C433C9;
	Fri, 25 Aug 2023 12:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692968027;
	bh=/r5CsgRS5UvoczCwjOl/UTZs70OHQ7YG+g3IOurPEAs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DZlI7RhXA6MKcsl6KVJFEXUWkXZLwLvdMtKDCIqg88k3SY9K3LhJSv6m/WjbWZ/zn
	 JXYj8+S8fBFWNNW25qHj9XU3ew7T/BONHe51gSpnzm2JAc4X/pNcQ7dTHtigOTMJ6f
	 4InYKWcbkxIh7W1FI5eBMEbPrQIkXKBUFyiMHsW96JG8P2t6uxhg8SULFbwm1AxziT
	 t5/6NRVaSo+I4iSgHCwWrnAO6Cc7yvfNFQQmQEr3p5HmC9qUVE8JbRN/vRqnX1tOkS
	 xLVjkoH2gZZ2OIbTMelm01rSeZBocambJGx+YbNSHi5lZOZ8Dr4GaEebcOxqRKdxTI
	 FsSHi4iuVO97w==
Date: Fri, 25 Aug 2023 13:54:02 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <lars@metafoo.de>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <Michael.Hennerich@analog.com>, <heiko@sntech.de>,
 <yangyingliang@huawei.com>, <robh@kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH -next 2/4] iio: adc: mt6577_auxadc: Use
 devm_clk_get_enabled() helper function
Message-ID: <20230825135402.5eef68f6@jic23-huawei>
In-Reply-To: <20230825105746.2999548-3-ruanjinjie@huawei.com>
References: <20230825105746.2999548-1-ruanjinjie@huawei.com>
	<20230825105746.2999548-3-ruanjinjie@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_055348_796015_B65BB8E8 
X-CRM114-Status: GOOD (  20.46  )
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

On Fri, 25 Aug 2023 18:57:44 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied.  This is another case that would benefit from use of dev_err_probe()
for all error messages in the probe routine.  Should also be easy to convert
to fully devm managed with one devm_add_action_or_reset() and appropriate
callback.

Jonathan

> ---
>  drivers/iio/adc/mt6577_auxadc.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> index 0e134777bdd2..ea42fd7a8c99 100644
> --- a/drivers/iio/adc/mt6577_auxadc.c
> +++ b/drivers/iio/adc/mt6577_auxadc.c
> @@ -270,23 +270,16 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
>  		return PTR_ERR(adc_dev->reg_base);
>  	}
>  
> -	adc_dev->adc_clk = devm_clk_get(&pdev->dev, "main");
> +	adc_dev->adc_clk = devm_clk_get_enabled(&pdev->dev, "main");
>  	if (IS_ERR(adc_dev->adc_clk)) {
> -		dev_err(&pdev->dev, "failed to get auxadc clock\n");
> -		return PTR_ERR(adc_dev->adc_clk);
> -	}
> -
> -	ret = clk_prepare_enable(adc_dev->adc_clk);
> -	if (ret) {
>  		dev_err(&pdev->dev, "failed to enable auxadc clock\n");
> -		return ret;
> +		return PTR_ERR(adc_dev->adc_clk);
>  	}
>  
>  	adc_clk_rate = clk_get_rate(adc_dev->adc_clk);
>  	if (!adc_clk_rate) {
> -		ret = -EINVAL;
>  		dev_err(&pdev->dev, "null clock rate\n");
> -		goto err_disable_clk;
> +		return -EINVAL;
>  	}
>  
>  	adc_dev->dev_comp = device_get_match_data(&pdev->dev);
> @@ -310,8 +303,6 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
>  err_power_off:
>  	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
>  			      0, MT6577_AUXADC_PDN_EN);
> -err_disable_clk:
> -	clk_disable_unprepare(adc_dev->adc_clk);
>  	return ret;
>  }
>  
> @@ -325,8 +316,6 @@ static int mt6577_auxadc_remove(struct platform_device *pdev)
>  	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
>  			      0, MT6577_AUXADC_PDN_EN);
>  
> -	clk_disable_unprepare(adc_dev->adc_clk);
> -
>  	return 0;
>  }
>  


