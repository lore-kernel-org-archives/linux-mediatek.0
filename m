Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449F9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 19:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CGM3MAz5VIB06lBzNjGngOQOoE0/I7wEi8Zke9gm+w=; b=qPH7RzsyGaTNocUaSMbEOCV9ec
	oWd9549J57UWueN7i255NyBwNr2jrEju9h+daoDomRckCCbj1Oa7PIX3+L1hJf+ZauHu3MwOR/gsO
	/vAacfduvXg+sw7sOYrWO6y5ql2AYuj/noxFjp2QswoPNAh61sc9/BiJV+lv7FClsHZG5K7mGOJYT
	5hQDIVUi2XCLBuEbVr4B4EKVY6HgWrpJfH7EckMwu8G8O4v1ncUTKz8wADeShoAkNIGHpeWASdWAV
	m+ASqdfo8X0te08f3v5Wp6hDcXV65tQBrK8YfXeh9J+i2RlyXDOz+Lpb8YERCwu7PLBtwTfiIzhLx
	eSNGlOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Sc2-00GVwx-VW; Thu, 23 Jun 2022 19:35:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4SYo-00GUKc-Tg; Thu, 23 Jun 2022 19:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9CGM3MAz5VIB06lBzNjGngOQOoE0/I7wEi8Zke9gm+w=; b=eQsA4dsC7zy0gZGxnWzQsATNue
	4RNWA+fhmA3erPfzk5dxeMQCaD5Lf11f9oQOKkk8CzdloSz0KwOEP+HRM4wMgGPP8ofcZCZ2qDmwT
	xfiupW9UG4h8v6ZC3HM8LRHIplQ2b0UahGQFsyNwJUOONvAmQaW+GT7DlYixlYzdJoIae9dvTqpeU
	gy/FAvkyHsCJjzMv7Un5R+xfx0R5N1LCz8GpdTxJ5A4fM7tBl8UkLYkl8Zu3L9BNeakPSWLUWDFoM
	lRie2OS7t8onKtNzBXKfM4zQiHwHss/qcyL+N+8jD2XviMbsj2Yz1eEDOSE48nGWdf9/GLVllbreJ
	XSnwtsig==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4SWU-00Bssw-NX; Thu, 23 Jun 2022 19:30:38 +0000
Message-ID: <bcc5b395-7fd8-f1a0-1b9f-62c9948287af@infradead.org>
Date: Thu, 23 Jun 2022 12:29:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 12/14] leds: mt6370: Add Mediatek MT6370 current sink
 type LED Indicator support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-13-peterwu.pub@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220623115631.22209-13-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 6/23/22 04:56, ChiaEn Wu wrote:
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index a49979f..a8c58c3 100644
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
> +	  In MT6370, there are four channel current-sink LED drivers that
> +	  support hardware pattern for const current, PWM, and breath mode.

Spell out "constant" (if that is what "const" means here). ?

> +	  Isink4 channel can also be used as a CHG_VIN power good indicator.

-- 
~Randy

