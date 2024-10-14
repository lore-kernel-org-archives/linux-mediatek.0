Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F70CFC500
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Vgg17FWXL740XxKldwZKp3nC2/m/8+sm1Pcr5/Gn+A=; b=UjIkt2h+6IJbQWQlE7Iok24Djg
	GfL/vYzJNcumI3b3Atzvx+uv6WhCxRF/ElwafPxUhYHHy2dryQbsGviEYLJhyv09RP0QcNMETXyOL
	ErD5sCQZyIDqc6yLK/e6akZpaqF84+y0M1C1Gio6XDOWb7wjO6GwqUoADwNcTWYh/YvbDIerGzkUQ
	oKTMgEHCkd6o9rMSiwBxiwSaWXHZaa3sh5AZejJRdNZKyNU3bJraFg9ClAWCcoVQrkuTwEhEOjTQ6
	epz+KFFuo+Kseu/wOYYhDTRTeS9VQIT/7cxWUUzGe+YZzEpc803Mo732f++P+QAhKXYsEXr/cJLBI
	D/8nD0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FzJ-00000004BAk-2t3Y;
	Mon, 14 Oct 2024 07:59:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Fv5-000000049nZ-1PFU;
	Mon, 14 Oct 2024 07:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728892508;
	bh=lyY+5pCJTEqtKDO4IDGUo7crF97ivfpsYxSpoaLJzwM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kc4Ur3WnZmYwqXum2e65KYNu28CZXXCtPImc2q+0dLYWxog/203HZjF4rvsSkF9Vu
	 xbrHpEemrM2270Cjo1oFKSjB2FqUAQ7WEFGuvaOWclx1vtTmsI3It7dCvEa/wa6vUG
	 LrFTsj4nsq7KFRQsi6K0SNNUHTSIuacyNKnTSHMruMx+hwTKOz5GPtiqXcinEM3rkz
	 Th1JtjvFNV94E6w2y8aOC/Uzccfii1As/sU0irwc78sH+RgDo+dkNkDFo/yJafTj37
	 caHW5ntPdEwUKwPmD5HyiCvgGPUWWZGFCSLOHxS+rH4byGANz01t8QG91wQx0x/GcR
	 drV8K9f65QLJA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B35A517E10B5;
	Mon, 14 Oct 2024 09:55:07 +0200 (CEST)
Message-ID: <099a5360-a42c-4a60-a6e1-08ec6d6162ec@collabora.com>
Date: Mon, 14 Oct 2024 09:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] pinctrl: mediatek: Add MT6735 pinctrl driver
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-9-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011120520.140318-9-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_005511_602458_93A103D7 
X-CRM114-Status: GOOD (  19.26  )
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

Il 11/10/24 14:03, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   MAINTAINERS                                   |    3 +
>   drivers/pinctrl/mediatek/Kconfig              |    6 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  880 ++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
>   5 files changed, 4883 insertions(+)
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f95ae886f9fd8..28de4a76bc05a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18315,6 +18315,9 @@ PIN CONTROLLER - MEDIATEK MT6735
>   M:	Yassine Oudjana <y.oudjana@protonmail.com>
>   L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
> +F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +F:	drivers/pinctrl/mediatek/pinctrl-mt6735.c
> +F:	drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
>   F:	include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
>   
>   PIN CONTROLLER - MICROCHIP AT91
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 7af287252834a..73052dad0e4a1 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -133,6 +133,12 @@ config PINCTRL_MT2712
>   	default ARM64 && ARCH_MEDIATEK
>   	select PINCTRL_MTK
>   
> +config PINCTRL_MT6735
> +	bool "MediaTek MT6735(M) pin control"

bool "MediaTek MT6735 and MT6735m pin control"

> +	depends on OF

depends on ARM64 || COMPILE_TEST

> +	default ARM64 && ARCH_MEDIATEK
> +	select PINCTRL_MTK_PARIS
> +
>   config PINCTRL_MT6765
>   	tristate "MediaTek MT6765 pin control"
>   	depends on OF
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> index 680f7e8526e00..f8ea0926b06db 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_MT2701)		+= pinctrl-mt2701.o
>   obj-$(CONFIG_PINCTRL_MT2712)		+= pinctrl-mt2712.o
>   obj-$(CONFIG_PINCTRL_MT8135)		+= pinctrl-mt8135.o
>   obj-$(CONFIG_PINCTRL_MT8127)		+= pinctrl-mt8127.o
> +obj-$(CONFIG_PINCTRL_MT6735)		+= pinctrl-mt6735.o
>   obj-$(CONFIG_PINCTRL_MT6765)		+= pinctrl-mt6765.o
>   obj-$(CONFIG_PINCTRL_MT6779)		+= pinctrl-mt6779.o
>   obj-$(CONFIG_PINCTRL_MT6795)		+= pinctrl-mt6795.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6735.c b/drivers/pinctrl/mediatek/pinctrl-mt6735.c
> new file mode 100644
> index 0000000000000..3366860d8b493
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6735.c
> @@ -0,0 +1,880 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
> + */
> +

..snip...


static const unsigned int debounce_time_mt6735[] = {
	1, 1000, 16000, 32000, 64000, 128000, 256000, 0
};

> +
> +static const struct mtk_eint_hw mt6735_eint_hw = {
> +	.port_mask = 7,
> +	.ports     = 6,
> +	.ap_num    = 224,
> +	.db_cnt    = 16,
	.db_time   = debounce_time_mt6735,

> +};

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



