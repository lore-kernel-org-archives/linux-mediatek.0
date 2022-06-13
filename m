Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FC2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 20:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phnC2X/1aZb+kfKkhc1z03Ww/PBIalmSXdEsHyPzwck=; b=fBE8t9KXfKTxzl
	6h3KWyGvt2uJ71WeiIndI2B49P1BU2GQAtd5xYow0CkU5YpMsDMyHxZxehS37mzZxsKWULnuF4Cxf
	WyeDJIQFSfxQugEnhLj1vS9YfNLQhzp7l2SIt9NvnOU0mTNThR5BNCy8P2zFF4XmTxfS3BUDamHBG
	12cLwiIPFVVdfJfQlIVITFslqgnzqwqrGsTTwPbwXUJ3AgEg48jl2VLn0ZJt9iZFHhIJQE3Fh6g4x
	T4LAFN7+wmRO1un2hKseN89REM+z/fwmIPsfyLo4KGEUKFIuu7cgG0K2760LoXOXfp3FtQymnGhKG
	txlMYdDcLdAjfkYAMaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qSO-005XtA-9O; Mon, 13 Jun 2022 20:14:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qSD-005Xqe-6p; Mon, 13 Jun 2022 20:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CF9UJrdeWimgjo6b+3sLXnRZ+YKpG34Hd87mZaFsWOQ=; b=c7khjL9wMhgkexLmyAP5JznkUn
	VxdBdmEKdzpLyXSV9VSwQobUMXr98PHFoytDWiQ3HIhBlu694lInFw+iOU7AnJf/nW+gz5S9kJ11G
	SCoCRG5b1TjhHYBX4qaK92eN62Kt76eunJAA/aEgAf11AkTBq1iM/rhvPErEdPacMTQVFH70dhvb4
	vlrHgpxrZYLBjXB9VHFcUeLsq640SfT4uzfotwf+a9hfdMe0MvLN0qnEEzsqT9SLr/PpswCycaTIA
	r/Ujr7d4yuDkHzfFA9xKaomERUPE1mbxc9qUI9TWS/YLPX3BX+X3TDWnUnQ4BbxeUICwJXWQ9RVC2
	fe3jX5OQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qS4-007f8t-8C; Mon, 13 Jun 2022 20:14:23 +0000
Message-ID: <4aef2e48-9717-1aca-b716-5f9486bf320e@infradead.org>
Date: Mon, 13 Jun 2022 13:14:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 08/15] mfd: mt6370: Add Mediatek MT6370 support
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
 <20220613111146.25221-9-peterwu.pub@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220613111146.25221-9-peterwu.pub@gmail.com>
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



On 6/13/22 04:11, ChiaEn Wu wrote:
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 3b59456f5545..d9a7524a3e0e 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -937,6 +937,19 @@ config MFD_MT6360
>  	  PMIC part includes 2-channel BUCKs and 2-channel LDOs
>  	  LDO part includes 4-channel LDOs
>  
> +config MFD_MT6370
> +	tristate "Mediatek MT6370 SubPMIC"
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	select REGMAP_IRQ
> +	depends on I2C
> +	help
> +	  Say Y here to enable MT6370 SubPMIC functional support.
> +	  It integrate single cell battery charger with adc monitoring, RGB

	     integrates                                 ADC  (?)

> +	  LEDs, dual channel flashlight, WLED backlight driver, display bias
> +	  voltage supply, one general purpose LDO, and cc logic

	                                               CC   (?)
What is CC?

> +	  controller with USBPD commmunication capable.

	                                       capability.

-- 
~Randy

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
