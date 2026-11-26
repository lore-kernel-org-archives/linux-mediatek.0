Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A2A606A326
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 01:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MJJ+B+hE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RY0qDRz9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i+t3krcnrSYsZa5AgyFFMlylA+OGXI+XKMafwE7Z/Lg=; b=MJJ+B+hEUD9X8G
	mqBch7PaGnosvf/LIBc8F4Vk3UuDmoCLivukpj3kklxqV3mrCFo5CGRib3jvDenk6K+M83vH2GMNk
	mqom0BiNSZZ434JMA8BVi4TfUe0/uxfcecYB0a2fs4gc/XihpWsl3lllIqMQWT6TYv9gdizMlFrec
	M9E/a3KJ/pCIrBbUlwb+Ipv7XORzQjh/YjFEaMZC9ZUNDndiGVWrn7E+sfTbT2JgypD5OwkliGexs
	8WD7NpOxtsC6Q8hr/QGC1OhJ64DJ/aI7YoFH1fz7OkG4odKudY51/ujVjzLDM5paf3U7ZxhtQeAgG
	f65R7t7ooPZ95mk+OXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOOe-0000000BoCm-2pdy;
	Thu, 26 Nov 2026 01:35:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOOd-0000000BoCK-2pY6;
	Thu, 26 Nov 2026 01:35:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C775F611B8;
	Thu, 26 Nov 2026 01:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A371F000C0;
	Thu, 26 Nov 2026 01:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656934;
	bh=i+t3krcnrSYsZa5AgyFFMlylA+OGXI+XKMafwE7Z/Lg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RY0qDRz92XwftN8jwUG1FGkMah/MuCM+qbBLbTir/QPXAqUMB2N91eHWfuKF0P5SP
	 GNZ5ltx/1uBdC8ZxWMMwp4svktXC8HnTW7/dDOjTSLnaCrqOTOJ+GRdokzoM96IdSN
	 JdnWomiPk1lu/TOTnEF5Ual1TvAMBppMghCXIvcb6tLDlPwMbvttn4Dc9HalkyXyqW
	 730+MDAJ40W/aWceh5T6SVaRbtH8YpX8AeRct+yM0pspWsvmwRITHDuBFVtUVevUzZ
	 8lYb0KKjMWcYlAHInTyXuo+iNe7vWYH45USpzWQv7xNRHFefS73atnRReqKZsL8Zsx
	 1gFxwXdX4yUig==
Date: Thu, 26 Nov 2026 01:35:27 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
Cc: iasnezhkov@gmail.com, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] iio: adc: mt6359: divide scale by ADC resolution
Message-ID: <20261126013527.15aa8cd6@jic23-hlaptop>
In-Reply-To: <20261126005326.71926-2-iasnezhkov@gmail.com>
References: <20261126005326.71926-1-iasnezhkov@gmail.com>
	<20261126005326.71926-2-iasnezhkov@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026 00:53:27 +0000
Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org> wrote:

> From: Ilia Snezhkov <iasnezhkov@gmail.com>
> 
> mt6359_auxadc_read_raw() returns raw ADC counts for IIO_CHAN_INFO_RAW
> (12-bit or 15-bit depending on the channel), and returns only
> (r_ratio.numerator * vref_mV) / r_ratio.denominator for
> IIO_CHAN_INFO_SCALE without dividing by the ADC full-scale range
> (1 << chan->scan_type.realbits).
> 
> As a result, iio_read_channel_processed() and userspace consumers
> multiplying raw * scale obtain millivolt values that are 4096x (12-bit)
> or 32768x (15-bit) too large.
> 
> Include the 1 << chan->scan_type.realbits divisor in
> IIO_CHAN_INFO_SCALE: shift r_ratio.denominator left by realbits for
> IIO_VAL_FRACTIONAL when denominator > 1 (r_ratio.denominator is u8 and
> realbits is at most 15, so the result fits comfortably in int), and
> return IIO_VAL_FRACTIONAL_LOG2 with realbits otherwise so channels with
> denominator == 1 use an exact shift and unpopulated descriptors (such
> as MT6357 VDCXO where denominator == 0) cannot trigger division by zero.
> 
> Found and drafted with an AI coding assistant.

This details now belongs below the ---
The idea is we won't care much about that going forwards, so let us not
put it in the commit log.

> 
> Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---
>  drivers/iio/adc/mt6359-auxadc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
> index 88b0e26..54c9048 100644
> --- a/drivers/iio/adc/mt6359-auxadc.c
> +++ b/drivers/iio/adc/mt6359-auxadc.c
> @@ -772,11 +772,12 @@ static int mt6359_auxadc_read_raw(struct iio_dev *indio_dev,
>  		*val = desc->r_ratio.numerator * cinfo->vref_mV;
>  
>  		if (desc->r_ratio.denominator > 1) {
> -			*val2 = desc->r_ratio.denominator;
> +			*val2 = (int)desc->r_ratio.denominator << chan->scan_type.realbits;
>  			return IIO_VAL_FRACTIONAL;
>  		}
>  
> -		return IIO_VAL_INT;
> +		*val2 = chan->scan_type.realbits;
> +		return IIO_VAL_FRACTIONAL_LOG2;
>  	}
>  
>  	scoped_guard(mutex, &adc_dev->lock) {


