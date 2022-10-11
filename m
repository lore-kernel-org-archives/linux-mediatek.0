Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99583C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zy7eyP7l3yeYse+Pu27ubEIpK6eJwoJJn/ew0pn1xNI=; b=1vI6LEABvo/ajO8kOyNe35/VaM
	YXGba39eW6eaPtoGuwSoqGVwxvDzuKO/fh5MAjdKj+K5nGliZcbXtt5BmxOHj8kuFj9C4BnBjK2vZ
	5aBqGWrU/sHU6/c1x9b8J7t1v9ViIpeFyTHBwbbmSIpQP7ww1dPedFIfEK2yfpcnEpbOwPsDhsgkb
	m3s4YL+bKZonHUF57i2q0ZNNvvjpjSJCMuZ6X3k8ILcyPi5sHwQ3sY9ICwfjb80EGfiHDepDq0FIJ
	UKLMUMMdZYh+fyuqP8NUhuKWZXqXqJCJUZLKs5YaVZDiP+BOVbDsLq0uNmJicOVphhU4CQZ34j9NL
	VcK2eWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiBwk-003tJZ-2O; Tue, 11 Oct 2022 09:53:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiBwY-003tHu-MJ; Tue, 11 Oct 2022 09:53:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C122A6602343;
	Tue, 11 Oct 2022 10:52:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665481976;
	bh=2HHv5N/MSAggEBwsg7Pu4p7erSqosVMsiDYpnlW1NDY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LkLEA8zbHkZDcirGS61AtjoJsjZYT+XDGl+PKSQVmffxeh2apTrT4SWNL44Tg0s7T
	 GPSnyi4Thfe2dwoKh6Fg35xyoqypg0mXcQq5cy59797VzeQmE77PaMsTODys7qZF5p
	 yf2drXYpM2Q3E489fj92oc6l271UmgtkWxZHdW6/M7ReX+s5g8tvrs5/6SGzwNjJBc
	 lKNM5J6jVE+zpkNEUB0D8Ipug8gV6nQ6mW9zaVT3124Rhb6mLExpg9h7Uh+a7S+uVA
	 qiyCK5Izx0w0sPNO8Hd+X6VLABm4UOeWUCZ9oUvJ2296nAm1pqHx9Lv4A8gvDFDXnT
	 Eq36C/yZflL/w==
Message-ID: <68ab0f05-e74a-e091-0109-09b57b90c652@collabora.com>
Date: Tue, 11 Oct 2022 11:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v14 3/3] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, pavel@ucw.cz, matthias.bgg@gmail.com,
 jic23@kernel.org, lars@metafoo.de, andriy.shevchenko@linux.intel.com
Cc: chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, szunichen@gmail.com
References: <cover.1665488982.git.chiaen_wu@richtek.com>
 <657f73ae257925ebc68dc825998384ad79d31e1f.1665488982.git.chiaen_wu@richtek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <657f73ae257925ebc68dc825998384ad79d31e1f.1665488982.git.chiaen_wu@richtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_025258_990092_9BAC9AD7 
X-CRM114-Status: GOOD (  22.76  )
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

Il 11/10/22 06:05, ChiaEn Wu ha scritto:
> From: Alice Chen <alice_chen@richtek.com>
> 
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> Add support for the MT6370 Flash LED driver. Flash LED in MT6370
> has 2 channels and support torch/strobe mode.
> 
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> 
> v14
> - Remove unused 'depend on OF' in Kconfig
> ---
>   drivers/leds/flash/Kconfig             |  14 +
>   drivers/leds/flash/Makefile            |   1 +
>   drivers/leds/flash/leds-mt6370-flash.c | 631 +++++++++++++++++++++++++++++++++
>   3 files changed, 646 insertions(+)
>   create mode 100644 drivers/leds/flash/leds-mt6370-flash.c
> 
> diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
> index d3eb689..0dd955c 100644
> --- a/drivers/leds/flash/Kconfig
> +++ b/drivers/leds/flash/Kconfig
> @@ -61,6 +61,20 @@ config LEDS_MT6360
>   	  Independent current sources supply for each flash LED support torch
>   	  and strobe mode.
>   
> +config LEDS_MT6370_FLASH
> +	tristate "Flash LED Support for MediaTek MT6370 PMIC"
> +	depends on LEDS_CLASS
> +	depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH

This dependency makes no sense, as the options in the Kconfig you're putting
this into gets parsed only `if LEDS_CLASS_FLASH`.
Please remove that.

> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS

Well, if it depends on that being either y, m or n, it means that it does
not depend on that at all. Remove.

After which,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +	depends on MFD_MT6370
> +	help
> +	  Support 2 channels and torch/strobe mode.
> +	  Say Y here to enable support for
> +	  MT6370_FLASH_LED device.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called "leds-mt6370-flash".
> +
>   config LEDS_RT4505
>   	tristate "LED support for RT4505 flashlight controller"
>   	depends on I2C && OF


