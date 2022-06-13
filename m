Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D55DC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 20:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYaoTwB3QYBFDPWErtVt4pbJBYS5bC7qFy66XHC28oc=; b=fRAcXJ9IZUOxBt
	3++eWXG6ElNH0/KlWbtOCGUuuW5CYJEoA5b+csMVom0gd3ErJZ5mDPJHQ38AxnDWNxqNUJeVLFmt0
	MVsfsPAV0ajICjg4LalhmFIxTqbbDTEftG5vGSTNKxRFsD9lPGXSZNjyBjDAB+3UFI+lQBzxUh977
	FA7VSZarIDnL20dG+OE00/bjPF28Ugrc2Yh/tjl1f4ORHqvAS8eA61/lKhA2v0q2Us3YL9NI+0O/b
	B/km8IeCflqXMs+62Vi7dbUxQHU/+oUqdL02HIUP2ROYLLMTZPNJXFUBmjCBcLZYKEvVLp4CaGesq
	tPRpoJSgKulQtPnd4GMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qgL-005eL6-3f; Mon, 13 Jun 2022 20:29:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qXr-005ab8-Tl; Mon, 13 Jun 2022 20:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KNSY/4MRKQGA0e53i6BGkqSv8r1BdiuacVK4fX068bM=; b=D9Zwkz6L1ZS3ZNBp0ThENt14z6
	X3LjNufcYo/Gv90ywbVGZn2PrAYmEZmmuqzdMVq2fVHDcEGEjjn6tRWFgEgjLdCMBbr0S7WAb/Dc/
	S+GYoU8ErQmFfc2zc76yluxAv5p853ep/tOllb5wHh7Ce8lAR2LfqhW8UmiIv6lEigrUNNDezQKjw
	sS+Ml3IDFcrkHWp3cSZ5zuf48URPzVsCnyckp4nK4RSIpapQ58HRcfEZi53+fNOhb2N6xtLerajxA
	CtuMaRVXvWZnNwe55sa1L4S+16GpEI3Q3Mn+WryCDBpAHw/a2UsweeKpAB+NRFk/ev0xQ6ggb0qOl
	ZBIflXgQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qXn-007fGw-IA; Mon, 13 Jun 2022 20:20:16 +0000
Message-ID: <23dd79db-87e3-14b5-e844-d596730bf057@infradead.org>
Date: Mon, 13 Jun 2022 13:20:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 13/15] leds: mt6370: Add Mediatek MT6370 current sink
 type LED Indicator support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com,
 ChiYuan Huang <cy_huang@richtek.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-14-peterwu.pub@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220613111146.25221-14-peterwu.pub@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi--

On 6/13/22 04:11, ChiaEn Wu wrote:
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 6090e647daee..61e6ec416cb0 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -244,6 +244,17 @@ config LEDS_MT6323
>  	  This option enables support for on-chip LED drivers found on
>  	  Mediatek MT6323 PMIC.
>  
> +config LEDS_MT6370_RGB
> +	tristate "LED Support for Mediatek MT6370 PMIC"
> +	depends on LEDS_CLASS
> +	depends on MFD_MT6370
> +	select LINEAR_RANGE
> +	help
> +	  Say Y here to enable support for MT6370_RGB LED device.
> +	  In MT6370, there're four channel current-sink LED driver that support

Please spell out "there are" instead of using an unusual contraction.
Also:
	                                                    drivers that support

> +	  hardware pattern for reg, pwm, breath mode. Isink4 channel

	                            PWM,
What is "reg"?

> +	  can also be used as a CHG_VIN power good indicator.

-- 
~Randy

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
