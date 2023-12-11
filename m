Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9D8C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQQVWI3B2v38JC+cRavbriqseWFlb7dhS5tBJ9udQC0=; b=tXj2Myt6LyKAGQXWnPfs1m9Lmb
	VymUFW1RSHBW9Upt9DFcLIfKOxh9ELPUPfLm+HwTZ2qYRbNFenxntUc03qs+xg54R9fwmKebFWv3W
	kJ114THmKl+WyYZfkaaDGqYUWL/3weMqn1Z+tLhoYv+oMurZv1lh23i8/ywrehkSVBILvY7fAihm6
	GSP/cVQm1OOrt/50wqoEIfwyyTEg5IsDZgMbDJBWaXc66FfQP2NOQKPO2TigaLlxD3MqTMjanAsaa
	4tFYzSUiZH7HPEpnrTM0MBLgshlUtueS71xJOUPZCBzyX3BQDWDN3FbOXBHJx5WgLxAfMrmKketWg
	b1Dsy9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCd2O-004X0h-2s;
	Mon, 11 Dec 2023 09:57:21 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCd28-004Wxc-39;
	Mon, 11 Dec 2023 09:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702288623;
	bh=6CjA6ctA+aoJ56ri2JQzkYVkT8sdbfqFhgd6RJqEU/E=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=3oYITDvQJx1zk9TEUDxJKSR7CtnfJS8tOHjRIqY+CVN5nPLVi3axYYancoJclYNg6
	 af1PASxwqNDLIXKoe8aaTmNcSgjxGm2gsT88etR5bn9HeRhezw7hNBYYN7kkiY7Xxe
	 KK5VCCNJCtLV/9P0LOxNP6wnWD1yEAhsgJQfE+L1H5F2JvlgdmEcmXIAQv1EtfYUgB
	 N50An+R4NgSH/EocAuTVa3Rm/ooQRqZnHOIkeM3w8d09bxkbgnjeaDzaA2JhiLT0XF
	 zWsKtS8jmd3caZJ96JPdAE29+X5yA6hjayookgBLZjU6vEi+nGOlFxWupvdExVzb9h
	 e4mwvDLSh3L/A==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5C303378140F;
	Mon, 11 Dec 2023 09:57:01 +0000 (UTC)
Message-ID: <060c8068-0f9b-40b4-89ed-3b968e4b0071@collabora.com>
Date: Mon, 11 Dec 2023 10:57:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] clk: mediatek: add drivers for MT7988 SoC
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Jianhui Zhao <zhaojh329@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, "Garmin.Chang"
 <Garmin.Chang@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <097e82b0d66570763d64be1715517d8b032fcf95.1702158423.git.daniel@makrotopia.org>
 <879b5bbcb165aa3f059a41218142b27e5f64597f.1702158423.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <879b5bbcb165aa3f059a41218142b27e5f64597f.1702158423.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_015705_183163_E1587126 
X-CRM114-Status: GOOD (  26.11  )
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

Il 09/12/23 22:56, Daniel Golle ha scritto:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> Add APMIXED, ETH, INFRACFG and TOPCKGEN clock drivers which are
> typical MediaTek designs.
> 
> Also add driver for XFIPLL clock generating the 156.25MHz clock for
> the XFI SerDes. It needs an undocumented software workaround and has
> an unknown internal design.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v4:
>   * make use of existing GATE_MTK_FLAGS macro
>   * reformat to max. 100 columns
>   * cosmetics
> 
> v3: use git --from ...
> v2: no changes
> 
> 
>   drivers/clk/mediatek/Kconfig               |   9 +
>   drivers/clk/mediatek/Makefile              |   5 +
>   drivers/clk/mediatek/clk-mt7988-apmixed.c  | 102 +++++++
>   drivers/clk/mediatek/clk-mt7988-eth.c      | 133 +++++++++
>   drivers/clk/mediatek/clk-mt7988-infracfg.c | 274 +++++++++++++++++
>   drivers/clk/mediatek/clk-mt7988-topckgen.c | 325 +++++++++++++++++++++
>   drivers/clk/mediatek/clk-mt7988-xfipll.c   |  78 +++++
>   7 files changed, 926 insertions(+)
>   create mode 100644 drivers/clk/mediatek/clk-mt7988-apmixed.c
>   create mode 100644 drivers/clk/mediatek/clk-mt7988-eth.c
>   create mode 100644 drivers/clk/mediatek/clk-mt7988-infracfg.c
>   create mode 100644 drivers/clk/mediatek/clk-mt7988-topckgen.c
>   create mode 100644 drivers/clk/mediatek/clk-mt7988-xfipll.c
> 
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 48b42d11111cd..70a005e7e1b18 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -423,6 +423,15 @@ config COMMON_CLK_MT7986_ETHSYS
>   	  This driver adds support for clocks for Ethernet and SGMII
>   	  required on MediaTek MT7986 SoC.
>   
> +config COMMON_CLK_MT7988
> +	tristate "Clock driver for MediaTek MT7988"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	select COMMON_CLK_MEDIATEK
> +	default ARCH_MEDIATEK
> +	help
> +	  This driver supports MediaTek MT7988 basic clocks and clocks
> +	  required for various periperals found on this SoC.
> +
>   config COMMON_CLK_MT8135
>   	tristate "Clock driver for MediaTek MT8135"
>   	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index dbeaa5b41177d..eeccfa039896f 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -62,6 +62,11 @@ obj-$(CONFIG_COMMON_CLK_MT7986) += clk-mt7986-apmixed.o
>   obj-$(CONFIG_COMMON_CLK_MT7986) += clk-mt7986-topckgen.o
>   obj-$(CONFIG_COMMON_CLK_MT7986) += clk-mt7986-infracfg.o
>   obj-$(CONFIG_COMMON_CLK_MT7986_ETHSYS) += clk-mt7986-eth.o
> +obj-$(CONFIG_COMMON_CLK_MT7988) += clk-mt7988-apmixed.o
> +obj-$(CONFIG_COMMON_CLK_MT7988) += clk-mt7988-topckgen.o
> +obj-$(CONFIG_COMMON_CLK_MT7988) += clk-mt7988-infracfg.o
> +obj-$(CONFIG_COMMON_CLK_MT7988) += clk-mt7988-eth.o
> +obj-$(CONFIG_COMMON_CLK_MT7988) += clk-mt7988-xfipll.o
>   obj-$(CONFIG_COMMON_CLK_MT8135) += clk-mt8135-apmixedsys.o clk-mt8135.o
>   obj-$(CONFIG_COMMON_CLK_MT8167) += clk-mt8167-apmixedsys.o clk-mt8167.o
>   obj-$(CONFIG_COMMON_CLK_MT8167_AUDSYS) += clk-mt8167-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
> new file mode 100644
> index 0000000000000..02eb6354b01a8
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + * Author: Sam Shih <sam.shih@mediatek.com>
> + * Author: Xiufeng Li <Xiufeng.Li@mediatek.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include "clk-mtk.h"
> +#include "clk-gate.h"
> +#include "clk-mux.h"
> +#include "clk-pll.h"
> +#include <dt-bindings/clock/mediatek,mt7988-clk.h>
> +
> +#define MT7988_PLL_FMAX (2500UL * MHZ)
> +#define MT7988_PCW_CHG_SHIFT 2
> +
> +#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _rst_bar_mask, _pcwbits, _pd_reg,      \
> +	    _pd_shift, _tuner_reg, _tuner_en_reg, _tuner_en_bit, _pcw_reg, _pcw_shift,           \
> +	    _pcw_chg_reg)                                                                        \
> +	{                                                                                        \
> +		.id = _id, .name = _name, .reg = _reg, .pwr_reg = _pwr_reg, .en_mask = _en_mask, \
> +		.flags = _flags, .rst_bar_mask = BIT(_rst_bar_mask), .fmax = MT7988_PLL_FMAX,    \
> +		.pcwbits = _pcwbits, .pd_reg = _pd_reg, .pd_shift = _pd_shift,                   \
> +		.tuner_reg = _tuner_reg, .tuner_en_reg = _tuner_en_reg,                          \
> +		.tuner_en_bit = _tuner_en_bit, .pcw_reg = _pcw_reg, .pcw_shift = _pcw_shift,     \
> +		.pcw_chg_reg = _pcw_chg_reg, .pcw_chg_shift = MT7988_PCW_CHG_SHIFT,              \
> +		.parent_name = "clkxtal",                                                        \
> +	}

I think that there was a bit of misunderstanding here: I said 100cols, and that's
fine, but I wanted you to do that with everything but the macros, following what
was done in all the other MediaTek clock drivers.

Can you please change the macros again?

Also, there's some discrepancy in the usage of tabulations vs spaces, please fix.

#define PLL(....)*TAB*\

....

	{										\
		.id = _id,							\
		.name = _name,							\
		.reg = _reg,							\
		.pwr_reg = _pwr_reg,						\
		.en_mask = _en_mask,						\
		...etc etc etc...						\
}

Thanks,
Angelo

