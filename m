Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E15C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 03:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODah31JkYMf83/huPypZvmpeIHDHoEY3ZUsUmYA3fkw=; b=kIciYv2rxrvh9a
	hd2/Xa/chY+8UeLaF0Mkj4X+qq063Jk45ZTilOJTQ16APROPKIismDwfk9EDQPpVSjXoCnS6l48pC
	g26CBOz280mG9kqctwgW2y71DjetR0GBSVi6OI8PoOYarjNzzvWWZ8KgQ0nf2iYxvVpqXsG+JTAXg
	/N88QVPKClEVDhnx4ohLRl33GbY6Bo/TpMxQsUMTGv3h9JtenWCACvP5rpqqjN0U5XMvqHKwwuHQ/
	i2T65/CSEp2TWhhHk53muMQpCtvHz3phkpMSGtJfUUaqth+rdSX467xcVouGINePHqwktuVyZvhmf
	I/zEg+SdMIL8d0ASw0sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJRdz-00D3v8-5u; Mon, 14 Feb 2022 03:03:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJRdm-00D3rV-KO; Mon, 14 Feb 2022 03:03:04 +0000
X-UUID: 176f7b6a437b48cc94ac0246bc1c45d2-20220213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Zn+O1A6GVdTQa4Mbwf5oKVl2r3c+S+4KidstTrcuPTs=; 
 b=I8P8eaAPvhc2t1ftdgvwu2rzvoKzAT99QlR1GjqpkSlfs793sWGegQRKXd4NptesAZNd7jxKdLRH65ftfkpR8XYi1nqq2YtRO+g1TouHS7Wnp5BjP07vnTkF2GitQjQIhGWjgKp+qlCETzWgoDG/Y0Urq7MsLIDD19Qcw3BbXZk=;
X-UUID: 176f7b6a437b48cc94ac0246bc1c45d2-20220213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1986026881; Sun, 13 Feb 2022 20:02:56 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 19:02:54 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Feb 2022 11:02:53 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 11:02:52 +0800
Message-ID: <4f7fe0940c03f6fba7096b4e1c9239167a5906f7.camel@mediatek.com>
Subject: Re: [PATCH v3 2/3] pinctrl: add pinctrl driver on mt8186
From: Guodong Liu <guodong.liu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 14 Feb 2022 11:02:52 +0800
In-Reply-To: <332434dc-2c94-5488-e7d0-7db00139d814@collabora.com>
References: <20220210062122.23974-1-guodong.liu@mediatek.com>
 <20220210062122.23974-3-guodong.liu@mediatek.com>
 <332434dc-2c94-5488-e7d0-7db00139d814@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_190302_702573_29591C19 
X-CRM114-Status: GOOD (  18.90  )
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

-----Original Message-----
From: AngeloGioacchino Del Regno <
angelogioacchino.delregno@collabora.com>
To: Guodong Liu <guodong.liu@mediatek.com>, Linus Walleij <
linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias
Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-gpio@vger.kernel.org, 
devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 2/3] pinctrl: add pinctrl driver on mt8186
Date: Thu, 10 Feb 2022 09:57:03 +0100

Il 10/02/22 07:21, Guodong Liu ha scritto:
> This commit includes pinctrl driver for mt8186.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/Kconfig              |    7 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8186.c     | 1313 ++++++++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h | 2186
> +++++++++++++++++
>   4 files changed, 3507 insertions(+)
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8186.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig
> b/drivers/pinctrl/mediatek/Kconfig
> index 66db4ac5d169..8dca1ef04965 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -147,6 +147,13 @@ config PINCTRL_MT8183
>   	default ARM64 && ARCH_MEDIATEK
>   	select PINCTRL_MTK_PARIS
>   
> +config PINCTRL_MT8186
> +	bool "Mediatek MT8186 pin control"
> +	depends on OF
> +	depends on ARM64 || COMPILE_TEST
> +	default ARM64 && ARCH_MEDIATEK
> +	select PINCTRL_MTK_PARIS
> +
>   config PINCTRL_MT8192
>   	bool "Mediatek MT8192 pin control"
>   	depends on OF
> diff --git a/drivers/pinctrl/mediatek/Makefile
> b/drivers/pinctrl/mediatek/Makefile
> index 90f43bb9d9a7..31c3784c6089 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_PINCTRL_MT7986)	+= pinctrl-
> mt7986.o
>   obj-$(CONFIG_PINCTRL_MT8167)	+= pinctrl-mt8167.o
>   obj-$(CONFIG_PINCTRL_MT8173)	+= pinctrl-mt8173.o
>   obj-$(CONFIG_PINCTRL_MT8183)	+= pinctrl-mt8183.o
> +obj-$(CONFIG_PINCTRL_MT8186)	+= pinctrl-mt8186.o
>   obj-$(CONFIG_PINCTRL_MT8192)	+= pinctrl-mt8192.o
>   obj-$(CONFIG_PINCTRL_MT8195)    += pinctrl-mt8195.o
>   obj-$(CONFIG_PINCTRL_MT8365)	+= pinctrl-mt8365.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8186.c
> b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
> new file mode 100644
> index 000000000000..1e550b15b9d4
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
> @@ -0,0 +1,1313 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + *
> + * Author: Guodong Liu <guodong.liu@mediatek.com>
> + *
> + */
> +
> +#include "pinctrl-mtk-mt8186.h"
> +#include "pinctrl-paris.h"
> +
> +/* MT8186 have multiple bases to program pin configuration listed as
> the below:
> + * iocfg[0]:0x10005000, iocfg[1]:0x10002000, iocfg[2]:0x10002200,
> + * iocfg[3]:0x10002400, iocfg[4]:0x10002600, iocfg[5]:0x10002800,
> + * iocfg[6]:0x10002C00.
> + * _i_based could be used to indicate what base the pin should be
> mapped into.
> + */
> +
> +#define PIN_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit,
> x_bits) \
> +	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit,
> x_bits, \
> +		       32, 0)

Please don't break this line: 84 columns is fine.

Hi Angelo

we will update it for next version.

Thanks
Guodong
> +
> +#define PINS_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs,
> s_bit, x_bits) \
> +	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit,
> x_bits,  \
> +		       32, 1)

Same here.

Hi Angelo

we will update it for next version.

Thanks
Guodong
And with that fixed,
Reviewed-by: AngeloGioacchino Del Regno <
angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
