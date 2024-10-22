Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986C9D1CDC5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KONFLXTrD6j7Omu1I5HEUbk+LeF5PJEV2dU7nRZuoek=; b=3ekGVXounMI4fEzhEgeovHorl6
	I32UU1XIbrITwhljhvESi9Usi1EpH6GnNBuj2c7R5I8cTdQU4e8nC2iH6zICvc2gemO6w8TkeNNMI
	F329AD5bP6g5/E39K5te17ULIHXJnXJgWafG/Zt3EzzAmJF8cD0m9mO1zYDpmu7YJYXbS7nNzjIXC
	PuKurDp91tjTzH4iGbRys8eMOMoE7YIyAtqqcvlkX1a0Uxhe88hjGISfu7DPiG2czI56Ojiy81wTm
	aD/PjzGcunH9wN8MMj0OrjL+T+KZ/veyDXUwqBZJvbamk9NKPU4xgE2/o4H6TB2EvJAvAtEfO5otI
	3ZR70NXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B0W-0000000AJ9y-3oCc;
	Tue, 22 Oct 2024 09:16:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ap5-0000000AHPk-2Yfb;
	Tue, 22 Oct 2024 09:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729587902;
	bh=RpHFkVfZw0AbIR3xtzIa38SQHNStexiY4qowugrrTZg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ihfKcFvAPzJ1jjddRGqWXAVCFvDyRfurcwcEXlbwFn9KeEPqedlIWFkHa8EAeaioY
	 z5g2rVf2iXJE3ewnoD2QU72shFBMmANKa/KHZhdMQzNnhZeE7KRzWKpcgVuy4QqK8r
	 31c/w2PPM8fGdaetfB8cPs5zXYDhAKfLnZVHshMxMOXlmTr/xi+N12nkHDxiO2x5Y0
	 anTOhQEYQpA58ZvKZov+vDpsFDU5XOqXmWh8n2fTyHOUbRwA9L/SQUT0cKzuKD9Wka
	 QYy1hRalt7HgpWuyhOiNWtsJYUhOBV4DkkY9WtpGuC5L9bWr7XS9wB620ncP2/IGLN
	 Qgskb2Cub8Juw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9769A17E12AC;
	Tue, 22 Oct 2024 11:05:01 +0200 (CEST)
Message-ID: <cb070d12-7e6d-4b0b-9dad-af4b9d6c51bc@collabora.com>
Date: Tue, 22 Oct 2024 11:05:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: mediatek: Add drivers for MT6735 syscon clock
 and reset controllers
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>,
 Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20241021121618.151079-1-y.oudjana@protonmail.com>
 <20241021121618.151079-3-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241021121618.151079-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_020503_855191_DE32A865 
X-CRM114-Status: GOOD (  23.18  )
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

Il 21/10/24 14:16, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add drivers for IMGSYS, MFGCFG, VDECSYS and VENCSYS clocks and resets
> on MT6735.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   MAINTAINERS                               |  4 ++
>   drivers/clk/mediatek/Kconfig              | 32 +++++++++
>   drivers/clk/mediatek/Makefile             |  4 ++
>   drivers/clk/mediatek/clk-mt6735-imgsys.c  | 57 ++++++++++++++++
>   drivers/clk/mediatek/clk-mt6735-mfgcfg.c  | 61 +++++++++++++++++
>   drivers/clk/mediatek/clk-mt6735-vdecsys.c | 81 +++++++++++++++++++++++
>   drivers/clk/mediatek/clk-mt6735-vencsys.c | 53 +++++++++++++++
>   7 files changed, 292 insertions(+)
>   create mode 100644 drivers/clk/mediatek/clk-mt6735-imgsys.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6735-mfgcfg.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6735-vdecsys.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6735-vencsys.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 25484783f6a0b..939f9d29fc9bf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14533,9 +14533,13 @@ L:	linux-clk@vger.kernel.org
>   L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
>   F:	drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> +F:	drivers/clk/mediatek/clk-mt6735-imgsys.c
>   F:	drivers/clk/mediatek/clk-mt6735-infracfg.c
> +F:	drivers/clk/mediatek/clk-mt6735-mfgcfg.c
>   F:	drivers/clk/mediatek/clk-mt6735-pericfg.c
>   F:	drivers/clk/mediatek/clk-mt6735-topckgen.c
> +F:	drivers/clk/mediatek/clk-mt6735-vdecsys.c
> +F:	drivers/clk/mediatek/clk-mt6735-vencsys.c
>   F:	include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
>   F:	include/dt-bindings/clock/mediatek,mt6735-imgsys.h
>   F:	include/dt-bindings/clock/mediatek,mt6735-infracfg.h
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 7a33f9e92d963..4dd6d2d6263fd 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -133,6 +133,38 @@ config COMMON_CLK_MT6735
>   	  by apmixedsys, topckgen, infracfg and pericfg on the
>   	  MediaTek MT6735 SoC.
>   
> +config COMMON_CLK_MT6735_IMGSYS
> +	tristate "Clock driver for MediaTek MT6735 imgsys"
> +	depends on (ARCH_MEDIATEK && COMMON_CLK_MT6735) || COMPILE_TEST

If this depends on COMMON_CLK_MT6735, it automatically also depends on
ARCH_MEDIATEK, because the former cannot be selected without satisfying
the dependency on the latter.

Also, with those being really dependant on COMMON_CLK_MT6735, it does
not make any sense to COMPILE_TEST those alone anyway...

> +	select COMMON_CLK_MEDIATEK

The same goes for this select statement: it's already done when selecting
COMMON_CLK_MT6735.

Finally:

config COMMON_CLK_MT6735_IMGSYS
      tristate "Clock driver for MediaTek MT6735 imgsys"
      depends on COMMON_CLK_MT6735
      help
        blah blah blah

is just fine - and shorter too :-)

> +	help
> +	  This enables a driver for clocks provided by imgsys
> +	  on the MediaTek MT6735 SoC.
> +
> +config COMMON_CLK_MT6735_MFGCFG
> +	tristate "Clock driver for MediaTek MT6735 mfgcfg"
> +	depends on (ARCH_MEDIATEK && COMMON_CLK_MT6735) || COMPILE_TEST
> +	select COMMON_CLK_MEDIATEK
> +	help
> +	  This enables a driver for clocks and resets provided
> +	  by mfgcfg on the MediaTek MT6735 SoC.
> +
> +config COMMON_CLK_MT6735_VDECSYS
> +	tristate "Clock driver for MediaTek MT6735 vdecsys"
> +	depends on (ARCH_MEDIATEK && COMMON_CLK_MT6735) || COMPILE_TEST
> +	select COMMON_CLK_MEDIATEK
> +	help
> +	  This enables a driver for clocks and resets provided
> +	  by vdecsys on the MediaTek MT6735 SoC.
> +
> +config COMMON_CLK_MT6735_VENCSYS
> +	tristate "Clock driver for MediaTek MT6735 vencsys"
> +	depends on (ARCH_MEDIATEK && COMMON_CLK_MT6735) || COMPILE_TEST
> +	select COMMON_CLK_MEDIATEK
> +	help
> +	  This enables a driver for clocks provided by vencsys
> +	  on the MediaTek MT6735 SoC.
> +
>   config COMMON_CLK_MT6765
>          bool "Clock driver for MediaTek MT6765"
>          depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST

..snip..

> diff --git a/drivers/clk/mediatek/clk-mt6735-vdecsys.c b/drivers/clk/mediatek/clk-mt6735-vdecsys.c
> new file mode 100644
> index 0000000000000..f59b481aaa6da
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt6735-vdecsys.c
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-gate.h"
> +#include "clk-mtk.h"
> +
> +#include <dt-bindings/clock/mediatek,mt6735-vdecsys.h>
> +#include <dt-bindings/reset/mediatek,mt6735-vdecsys.h>
> +

..snip..

> +static u16 vdecsys_rst_bank_ofs[] = { VDEC_RESETB_CON, SMI_LARB1_RESETB_CON };
> +
> +static u16 vdecsys_rst_idx_map[] = {
> +	[MT6735_VDEC_RST0_VDEC]		= 0 * RST_NR_PER_BANK + 0,
> +

Please remove this extra blank line, it's not needed.

> +	[MT6735_VDEC_RST1_SMI_LARB1]	= 1 * RST_NR_PER_BANK + 0,
> +};
> +
> +static const struct mtk_clk_rst_desc vdecsys_resets = {
> +	.version = MTK_RST_SIMPLE,
> +	.rst_bank_ofs = vdecsys_rst_bank_ofs,
> +	.rst_bank_nr = ARRAY_SIZE(vdecsys_rst_bank_ofs),
> +	.rst_idx_map = vdecsys_rst_idx_map,
> +	.rst_idx_map_nr = ARRAY_SIZE(vdecsys_rst_idx_map)
> +};
> +
> +static const struct mtk_clk_desc vdecsys_clks = {
> +	.clks = vdecsys_gates,
> +	.num_clks = ARRAY_SIZE(vdecsys_gates),
> +

same here.

> +	.rst_desc = &vdecsys_resets
> +};
> +
The rest looks good, and I'm confident that you're getting my R-b on v2.

Cheers,
Angelo

