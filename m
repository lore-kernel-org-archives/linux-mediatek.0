Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FD5C83F10
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Aug 2023 17:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8l6VgLx7LrTWqrQgJTFMffeBnSXinPioAldLhYaZ+8k=; b=yu8rLQgS1UKGTJaGA2dj5yu0Ur
	kGA5PA7Be+eefew7bKXljXvHDC1778sPfHKPcovflv//gdFl1tI5rfFZjD6Z5ZX83x4mkXvIJR6Sq
	/oGHNXfhz5JTfxiwRhrnK1/1pNxDzGzb0s5v/uQZ088xQHDab+t0fqy5GU54BNBCRooHVnG9dmAMM
	YlBREI1BxFE2lreEDnNp5FUn7UjU9NxC7bUWRf6PXYaxGXtw68rfwIZx326/fbZ3UrhF/ibRP/WH+
	/ggHe+L4Vn1c5XvQfbNc4g3EFd5OHfa7nQLLYHfVsMSq4VYaVSZuR5jtQTe09oVA2FrOniZMkqVqk
	dR0KUOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaJBo-008HMD-1a;
	Sun, 27 Aug 2023 17:04:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaJBc-008HJi-1S;
	Sun, 27 Aug 2023 17:04:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 09D3A617BB;
	Sun, 27 Aug 2023 17:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB693C433C7;
	Sun, 27 Aug 2023 17:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693155866;
	bh=6aXqca9aJ4SOiNqS7e42m4SxQgXNNrsBHkAKSCoOM3A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Gg6dc0aUjRGm0hGENBVNQ3XQJu2qTADqjEtmtHpoUJoO7PrmGwZhWVE5QaIV+Sjfu
	 p0xnJuNJazau+JpRj5poHJVBN492ObPkmQ/D6foLyTEWRfkG1cds0V4pqHfzzuuOXu
	 5X0GHUaptSVvdhiZsCs1tSakw8ri8dzLr9LeJANWpJsLkxT9I4EYE7ccv6a45q9fgZ
	 9LL3Mrrpx8+jlQnxA200lVqE5BE1Uqw/SAGUIgkeX5XsvAhAj1PKV44PZhgokoYWu+
	 ik+XGUf+507I1wCltENm+ekTRC1jgwDB4Tn4tVajkOtIfK2uQCgnQxNzrk7nUf/1/b
	 1cxe9cKOH6dgA==
Date: Sun, 27 Aug 2023 18:04:46 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <lars@metafoo.de>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH -next 2/2] iio: adc: mt6577_auxadc: Simplify with device
 managed function
Message-ID: <20230827180446.7b6720eb@jic23-huawei>
In-Reply-To: <20230826035402.3512033-3-ruanjinjie@huawei.com>
References: <20230826035402.3512033-1-ruanjinjie@huawei.com>
	<20230826035402.3512033-3-ruanjinjie@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_100428_595664_DA2BD8B1 
X-CRM114-Status: GOOD (  30.99  )
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

On Sat, 26 Aug 2023 11:54:02 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> Add a device managed hook, via devm_add_action_or_reset() and
> mt6577_power_off(), to power off on device detach.
> 
> Replace iio_device_register() by devm_iio_device_register() and remove
> the mt6577_auxadc_remove() function used to unregister the device and
> power off the device.
> 
> Remove platform_set_drvdata() from the probe function, since
> platform_get_drvdata() is not used anymore.
> 
> Remove mt6577_auxadc_mod_reg() call from the probe function error path.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> ---
>  drivers/iio/adc/mt6577_auxadc.c | 40 +++++++++++++--------------------
>  1 file changed, 15 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> index 935cf560e238..c8f7bfa59146 100644
> --- a/drivers/iio/adc/mt6577_auxadc.c
> +++ b/drivers/iio/adc/mt6577_auxadc.c
> @@ -246,6 +246,14 @@ static int mt6577_auxadc_suspend(struct device *dev)
>  	return 0;
>  }
>  
> +static void mt6577_power_off(void *data)
> +{
> +	struct mt6577_auxadc_device *adc_dev = data;
> +
> +	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
> +			      0, MT6577_AUXADC_PDN_EN);
> +}
> +
>  static int mt6577_auxadc_probe(struct platform_device *pdev)
>  {
>  	struct mt6577_auxadc_device *adc_dev;
> @@ -286,31 +294,14 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
>  			      MT6577_AUXADC_PDN_EN, 0);
>  	mdelay(MT6577_AUXADC_POWER_READY_MS);
>  
> -	platform_set_drvdata(pdev, indio_dev);
> -
> -	ret = iio_device_register(indio_dev);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to register iio device\n");
> -		goto err_power_off;
> -	}
> -
> -	return 0;
> +	ret = devm_add_action_or_reset(&pdev->dev, mt6577_power_off, adc_dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to add action to managed power off: %d\n", ret);
The return code is already printed when dev_err_probe() formats the line, so I've
dropped that last bit whilst applying.

The way these two patches were separated is a little odd as you ignore
a few dev_err() cases in patch 1 because they don't make sense until patch 2.
I think this would have made more sense with the two patches reversed.

Still that's a very small thing (and I might be wrong as I didn't try it ;)
Applied to the togreg branch of iio.git and pushed out as testing for 0-day
etc to play with this.  I'll be rebasing on rc1 and it won't hit linux-next
until after that.

Thanks,

Jonathan

>  
> -err_power_off:
> -	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
> -			      0, MT6577_AUXADC_PDN_EN);
> -	return ret;
> -}
> -
> -static int mt6577_auxadc_remove(struct platform_device *pdev)
> -{
> -	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> -	struct mt6577_auxadc_device *adc_dev = iio_priv(indio_dev);
> -
> -	iio_device_unregister(indio_dev);
> -
> -	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
> -			      0, MT6577_AUXADC_PDN_EN);
> +	ret = devm_iio_device_register(&pdev->dev, indio_dev);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "failed to register iio device\n");
>  
>  	return 0;
>  }
> @@ -337,7 +328,6 @@ static struct platform_driver mt6577_auxadc_driver = {
>  		.pm = pm_sleep_ptr(&mt6577_auxadc_pm_ops),
>  	},
>  	.probe	= mt6577_auxadc_probe,
> -	.remove	= mt6577_auxadc_remove,
>  };
>  module_platform_driver(mt6577_auxadc_driver);
>  


