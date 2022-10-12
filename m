Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671D7C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 06:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIiJvNW9H0kZKHNV27mWxIVX92jlmQwVIvQ4BR+HJoM=; b=bRI7TH31eo48qdGHUWPu1KoYf5
	Rc0bqfX5RNvLNMCMNaEOCsthhoshKyT44eFxKR+TVnrnhAAMe/zxnINqDMlfb/wqJt3fNADwav4L2
	yfZzMGuVPg0Ixwvp4xQdauKFgXT8pd81oJjSN5xlENNRDLpWsQT82ICEGa4J18zD36xAHf2ZhbudY
	ebYnEZodm8/FeDWHcWnM1ZvelJkNyySFIF2/04onmhcVRWiRjrtlrcYnxDHEdO+MXNqXcuH5pmJMM
	W1clJW3bN6HxItjXSb5f1kXsac9eRHWzSjtCvHS43ZxhCxum1QiB+g5Aov+5RnKjcC6kPcNktfjVk
	pA8X3FbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiV1I-0070Sd-Bv; Wed, 12 Oct 2022 06:15:08 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiV16-0070PB-Qu; Wed, 12 Oct 2022 06:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665555296; x=1697091296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dIiJvNW9H0kZKHNV27mWxIVX92jlmQwVIvQ4BR+HJoM=;
  b=W53Pj/eMwdzP0j0THs5EzHFF9VxT5eKo4RZPUPzfc1GRvmcIIl0fUiIO
   fefMMF1tGuZTcghmWShSXeZSFnJTqpdhxNcj90MSGETN30L2Z3+2KwoH8
   N+NICwUTeEluAbg1iWZhkmiGmQKd5wtgC6S1zQM+sRtCrspSpJ9TPDToT
   3+G5oO8D9VQfxyLaGPgwlUR6j0ad0KZr1wI9ftjNfg99wE+fP2d6/qGqK
   ZXb5VgzVxM1tr8oo3JsRZYwur0txK0McG3uum0Kplt7GjV3OSOY/02eub
   vCwKMC+JKtPoZMmMtchtYpNFNojMv7L67PWIvR4tjrCwzj+SM0ebRrm3S
   g==;
X-IronPort-AV: E=Sophos;i="5.95,178,1661810400"; 
   d="scan'208";a="26694906"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 12 Oct 2022 08:14:49 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 12 Oct 2022 08:14:49 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 12 Oct 2022 08:14:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665555289; x=1697091289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dIiJvNW9H0kZKHNV27mWxIVX92jlmQwVIvQ4BR+HJoM=;
  b=RNqiXoFQo7zQbSSFG/qdDhO/QBi6zVbnFUWodQwQJ0idHfjCiRqzwaIN
   y7L+yS8I+OjwEVaT9iOf3dBxAD9fcGb9kHiGW/mkpddmJmy2rxspKj39g
   akHoRGohNqh12eD1kkWWjUGAFR/BSzgwa0SaDuDFf4utLOl5w4FT7A+x+
   x+1t0Ajc3mXRxOxtH9jzhz9H1Ek1jfoKwAvi0TNkeYE8wFdVaDTHNDGJ3
   px8v9CjM3o7Vy0af/DvyX1i3H7v6B9LJbQdNtdMK3hrDe469aRfPDdu4g
   lgXnW65xwfUFp15CntwQUT1VFMUyQXVMCjDDDxebL13wIYvhGGv3U3ZlK
   A==;
X-IronPort-AV: E=Sophos;i="5.95,178,1661810400"; 
   d="scan'208";a="26694905"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Oct 2022 08:14:49 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 65155280056;
	Wed, 12 Oct 2022 08:14:49 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org, Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 7/7] gpiolib: of: add quirk for phy reset polarity for Freescale Ethernet
Date: Wed, 12 Oct 2022 08:14:46 +0200
Message-ID: <12081856.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221011-gpiolib-quirks-v1-7-e01d9d3e7b29@gmail.com>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com> <20221011-gpiolib-quirks-v1-7-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_231457_290564_168B1273 
X-CRM114-Status: GOOD (  20.78  )
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

Am Mittwoch, 12. Oktober 2022, 00:19:35 CEST schrieb Dmitry Torokhov:
> Bindings for Freescale Fast Ethernet Controller use a separate
> property "phy-reset-active-high" to specify polarity of its phy
> gpio line. To allow converting the driver to gpiod API we need
> to add this quirk to gpiolib.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/gpio/gpiolib-of.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 3200d705fbe3..c3d3fe4d927c 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -231,6 +231,33 @@ static void of_gpio_flags_quirks(const struct
> device_node *np, !strcmp(propname, "snps,reset-gpio") &&
>  	    of_property_read_bool(np, "snps,reset-active-low"))
>  		*flags |= OF_GPIO_ACTIVE_LOW;
> +
> +	/*
> +	 * Freescale Fast Ethernet Controller uses a separate property to
> +	 * describe polarity of the phy reset line.
> +	 */
> +	if (IS_ENABLED(CONFIG_FEC)) {
> +		static const char * const fec_devices[] = {
> +			"fsl,imx25-fec",
> +			"fsl,imx27-fec",
> +			"fsl,imx28-fec",
> +			"fsl,imx6q-fec",
> +			"fsl,mvf600-fec",
> +			"fsl,imx6sx-fec",
> +			"fsl,imx6ul-fec",

> +			"fsl,imx6mq-fec",
> +			"fsl,imx6qm-fec",

These two should be 'fsl,imx8mq-fec' & 'fsl,imx8qm-fec' (imx8 instead of 
imx6).

Best regards,
Alexander

> +			"fsl,s32v234-fec",
> +			NULL
> +		};
> +
> +		if (!strcmp(propname, "phy-reset-gpios") &&
> +		    of_device_compatible_match(np, fec_devices)) {
> +			bool active_high = of_property_read_bool(np,
> +						"phy-reset-
active-high");
> +			of_gpio_quirk_polarity(np, active_high, 
flags);
> +		}
> +	}
>  }
> 
>  /**





