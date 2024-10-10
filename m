Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2385CF11E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rO56yOIVmUHKtbxELPhAbe1a+uIAvwjrpcwSDXF5EKI=; b=lBMIkF4jnH1Dk7
	sXNHsKhdx2m9DP0Ut+5O8t2lWP4DF0V3tD3+qHz2mYGqScy35lLCB625D3DnnWGcE80A4yWIHPi4o
	yTtXO7T06POmdgUw5Jv4Tnuq65W1PAxsuugBti+yjRKtXlqnS04oAr/8DDvQAXz16VPjTtTxsLAir
	GjW5UFpsKM+bbVkkGE4TZiz+ZAT9nO5DUpseeOmbv4RjAOmVeBL7LjvHZ9v3ivvcotp9qBUG46Ecj
	pe66WkDP6Cr6Ec87/a7YR5WoSBNObKDR5c2xGo4wM3k3v9ijcCLlgPIUfjY4XpWuJITWpkpp/TnNe
	4k5N3TY38ZULQMIUWmfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sysWP-0000000ClVZ-3nao;
	Thu, 10 Oct 2024 12:44:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sysH4-0000000ChwF-0INX;
	Thu, 10 Oct 2024 12:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728563288;
	bh=+PiTsV/00ndEXFaBPUl+xKclCJxHDanNzdM3zXKrEqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WDw06HNqskMqkhw7m36FbWwqhk5QspGxbqIN/U6aNkXmMBz2eIuM//wtKtHuWuyrC
	 btWnFnySxse9iAyNfbHIPz5ORaQBf0EeGW+Iefq/pZUY7Nf8HquuUsyn3dXyLb3RJ6
	 HfTemw1vaGO4KX950kY8Dcu2L9bXHBLnUbmo4H/6UnhiheDovJnRXQQcN+J/d8wXrB
	 aC9ThAvjjBPPnUnijZeANxO4fqbM3I5on+vDyXPV/iCpyT+59KGxLeoT36Y7mfr+gW
	 cWeV6D9GOrSUIhpUP39kNRark8P2oa0CmvFk3+FfKidTJjCA0w5fpne3FO0J97UbCS
	 fdmGPj8IW9D9w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C339C17E35D9;
	Thu, 10 Oct 2024 14:28:07 +0200 (CEST)
Message-ID: <d1a9f533-3a9e-47c2-9476-c54653b56e68@collabora.com>
Date: Thu, 10 Oct 2024 14:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] pinctrl: mediatek: add MT7988 pinctrl driver
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
References: <20241009165222.5670-1-linux@fw-web.de>
 <20241009165222.5670-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009165222.5670-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_052810_282630_57439AD2 
X-CRM114-Status: GOOD (  20.79  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 09/10/24 18:52, Frank Wunderlich ha scritto:
> From: Daniel Golle <daniel@makrotopia.org>
> 
> Add pinctrl driver for the MediaTek MT7988 SoC.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> [correctly initialise for the function_desc structure]
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   drivers/pinctrl/mediatek/Kconfig          |    7 +
>   drivers/pinctrl/mediatek/Makefile         |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt7988.c | 1526 +++++++++++++++++++++
>   3 files changed, 1534 insertions(+)
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7988.c
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 7af287252834..952110c783d4 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -187,6 +187,13 @@ config PINCTRL_MT7986
>   	default ARM64 && ARCH_MEDIATEK
>   	select PINCTRL_MTK_MOORE
>   
> +config PINCTRL_MT7988
> +	bool "Mediatek MT7988 pin control"
> +	depends on OF
> +	depends on ARM64 || COMPILE_TEST
> +	default ARM64 && ARCH_MEDIATEK
> +	select PINCTRL_MTK_MOORE
> +
>   config PINCTRL_MT8167
>   	bool "MediaTek MT8167 pin control"
>   	depends on OF
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> index 680f7e8526e0..2b47ce030b54 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_PINCTRL_MT7623)		+= pinctrl-mt7623.o
>   obj-$(CONFIG_PINCTRL_MT7629)		+= pinctrl-mt7629.o
>   obj-$(CONFIG_PINCTRL_MT7981)		+= pinctrl-mt7981.o
>   obj-$(CONFIG_PINCTRL_MT7986)		+= pinctrl-mt7986.o
> +obj-$(CONFIG_PINCTRL_MT7988)		+= pinctrl-mt7988.o
>   obj-$(CONFIG_PINCTRL_MT8167)		+= pinctrl-mt8167.o
>   obj-$(CONFIG_PINCTRL_MT8173)		+= pinctrl-mt8173.o
>   obj-$(CONFIG_PINCTRL_MT8183)		+= pinctrl-mt8183.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
> new file mode 100644
> index 000000000000..5479f4fa47a7
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
> @@ -0,0 +1,1526 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * The MT7988 driver based on Linux generic pinctrl binding.
> + *
> + * Copyright (C) 2020 MediaTek Inc.
> + * Author: Sam Shih <sam.shih@mediatek.com>
> + */
> +
> +#include "pinctrl-moore.h"
> +
> +enum MT7988_PINCTRL_REG_PAGE {

Lowercase name for the enumeration, please.

> +	GPIO_BASE,
> +	IOCFG_TR_BASE,
> +	IOCFG_BR_BASE,
> +	IOCFG_RB_BASE,
> +	IOCFG_LB_BASE,
> +	IOCFG_TL_BASE,
> +};
> +

..snip..

> +static const struct mtk_eint_hw mt7988_eint_hw = {
> +	.port_mask = 7,
> +	.ports = 7,
> +	.ap_num = ARRAY_SIZE(mt7988_pins),
> +	.db_cnt = 16,

Are you sure that the EINT controller in this SoC doesn't have the
DBNC_SET and DBNC_CLR registers?

Another way of asking the same thing: are you sure that this SoC does
not support interrupt debounce?

> +};
> +
> +static const char * const mt7988_pinctrl_register_base_names[] = {
> +	"gpio",	 "iocfg_tr", "iocfg_br",
> +	"iocfg_rb", "iocfg_lb", "iocfg_tl",
> +};
> +
> +static struct mtk_pin_soc mt7988_data = {
> +	.reg_cal = mt7988_reg_cals,
> +	.pins = mt7988_pins,
> +	.npins = ARRAY_SIZE(mt7988_pins),
> +	.grps = mt7988_groups,
> +	.ngrps = ARRAY_SIZE(mt7988_groups),
> +	.funcs = mt7988_functions,
> +	.nfuncs = ARRAY_SIZE(mt7988_functions),
> +	.eint_hw = &mt7988_eint_hw,
> +	.gpio_m = 0,
> +	.ies_present = false,
> +	.base_names = mt7988_pinctrl_register_base_names,
> +	.nbase_names = ARRAY_SIZE(mt7988_pinctrl_register_base_names),
> +	.bias_disable_set = mtk_pinconf_bias_disable_set,
> +	.bias_disable_get = mtk_pinconf_bias_disable_get,
> +	.bias_set = mtk_pinconf_bias_set,
> +	.bias_get = mtk_pinconf_bias_get,
> +	.pull_type = mt7988_pull_type,
> +	.bias_set_combo = mtk_pinconf_bias_set_combo,
> +	.bias_get_combo = mtk_pinconf_bias_get_combo,
> +	.drive_set = mtk_pinconf_drive_set_rev1,
> +	.drive_get = mtk_pinconf_drive_get_rev1,
> +	.adv_pull_get = mtk_pinconf_adv_pull_get,
> +	.adv_pull_set = mtk_pinconf_adv_pull_set,
> +};
> +
> +static const struct of_device_id mt7988_pinctrl_of_match[] = {

Please compress that to a single line.

{ .compatible = "mediatek,mt7988-pinctrl" },


Cheers,
Angelo



