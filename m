Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C68CF6495
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Sep 2024 16:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApOndFN4noUM4oxCmzOg+nch7Djzxqp5QjpGAkOzKsM=; b=sbNbtMx/qPtIGnhjJAQjnqLpCy
	IN+FUG9dArI9M+04aGEyBfvYqIW7iOI3JKSH4HI9zIdtRJMfJOeK1UsFlzXIkRfyjrQKIPd2IF2v9
	ZMt4tvz+iVEAsAlKFXV597vhurtq+BFAkQFxckg7nT6u+ChW1/O/FQAs69nSAWWKqpWX7RTp+gw0a
	MEQs0Chdxy79LgECF6rBJhoE3BfLBVniouKtYQtyEafgpn0zNj/UPlkAquTDYQMEDkT8OTXRAEOfe
	WXDiiZSxpiai5SUaZJIPEFyGwg6uoTU0GLKySH7OskddV3FRke8a5C8v6xI91xLUl5f6Gk6EQxUea
	MD4u2qsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sux7b-0000000F38n-3FT1;
	Sun, 29 Sep 2024 16:50:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sux6P-0000000F33f-00Ft;
	Sun, 29 Sep 2024 16:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 177535C4208;
	Sun, 29 Sep 2024 16:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29C9C4CEC5;
	Sun, 29 Sep 2024 16:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727628534;
	bh=vxIOftNGf+6LFdoEM3akH8I2x6IeDSOWCFcqei83no8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jJ139Y0Yzu67wlybm7X/TZi3kfFERmxj8Nfh43zpw94sY1ckRghyDCsHCnd38zCVl
	 N7inZTAjQRy1qwZV+pRLfNXzcnIdxyOVLpAbWeFo8eNkFjOUU2OJEY70IpKyDx+uGS
	 HZmw59SaYPnRoIaq0sbVTFOu2T62TC+RietWetuViDlSIe1JLYDes6pR5VB1oCHEVd
	 NyOKQ0WQrEGNEvT7MDkOUmvhvSSWsG1RAzUsr0JRjitebh5cp9LcIwGfN9y/TWJ8x8
	 LhncbnH+rQoUo4WL7iWsqxAzaEXWYdvB4YMpZJJGB+smHw4kBFCRcuVDKrq1yYeGeZ
	 mXgYSdxVG0cPw==
Date: Sun, 29 Sep 2024 17:48:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Abhash Jha <abhashkumarjha123@gmail.com>
Cc: linux-iio@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, lars@metafoo.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Gene Chen <gene_chen@richtek.com>
Subject: Re: [PATCH] iio: adc: mt6360-adc: Converted to use
 get_unaligned_be16()
Message-ID: <20240929174845.5bac3f62@jic23-huawei>
In-Reply-To: <20240928161108.163647-1-abhashkumarjha123@gmail.com>
References: <20240928161108.163647-1-abhashkumarjha123@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_094857_116589_C8D3EB1E 
X-CRM114-Status: GOOD (  14.38  )
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

On Sat, 28 Sep 2024 21:41:08 +0530
Abhash Jha <abhashkumarjha123@gmail.com> wrote:

> Changed the manual shifting and adding of bytes to use
> get_unaligned_be16() api instead.
> 
> Signed-off-by: Abhash Jha <abhashkumarjha123@gmail.com>
Looks simple so I've applied it, but plenty of time for
additional reviews to come in.

Jonathan

> ---
>  drivers/iio/adc/mt6360-adc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
> index 3710473e5..91befe2cd 100644
> --- a/drivers/iio/adc/mt6360-adc.c
> +++ b/drivers/iio/adc/mt6360-adc.c
> @@ -124,7 +124,7 @@ static int mt6360_adc_read_channel(struct mt6360_adc_data *mad, int channel, int
>  		usleep_range(ADC_LOOP_TIME_US / 2, ADC_LOOP_TIME_US);
>  	}
>  
> -	*val = rpt[1] << 8 | rpt[2];
> +	*val = get_unaligned_be16(&rpt[1]);
>  	ret = IIO_VAL_INT;
>  
>  out_adc_conv:


