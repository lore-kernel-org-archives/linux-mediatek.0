Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C0BD15D90
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 13:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w56DdadFceIjDHIWwbVwgBYMgsLJgl6sXn/Wuy234ys=; b=U4OT+esleiQK6hPbrMZVmAU8hN
	zbUimDZ6a9Nyo+8SY7ljFanjIf0EfexEWcOWKvxsK/1KIsVxtbqGmMbbGcZo+xfqrSyHkVH/d82G3
	xV+aU8s0moY3wWaNFdoMGI0TC1GotC+cjZVmt71+Z8tgxae9JQgrPE8jVKe5hf9+h5BHEqrkJPhTb
	w3VQ23jKk4EvhHRoSBzUc0uBNuyVQ1RBGrQYiDk8sKZhRj8h6q9F/BSPLP0Asjqe6AinODtnRRDlw
	b1PR376SopX5dxpIhJAjK46zia7WEuiRyeYlssEzH77jtIIFce0RjzDL1edx1ZDdTGJEX3tp2XkNc
	rH7EaS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sc9-00000007Rhk-33R6;
	Mon, 21 Oct 2024 13:38:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sP0-00000007PRR-16Ub;
	Mon, 21 Oct 2024 13:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729517092;
	bh=VJuB4DMHCy6WlFZtZWNO05SWfzMJJ8b33/6wrP8q+IM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dKeZt5lykzmb5tAi9VZbseREljA9HBr+rvtK2NtjvPdfn7FT2sVcNnun77DWflLSz
	 FJ3FdNoo3p0uM0p3PQkLnAh8BuFwRvmKRfGvCkHvkWnVtUXU8CuWHenwVVcfySRupy
	 6kx0Q0O5Slss4Xd85xereqkX8YzGYNygWdWNJEuJfxchZ359sNpr8sPNeO7ZiM2/0p
	 gL/vqvBT8GfDinrbMnOZFrPCcs+46U7mZkNkA+sy+A9elLgvmW4k8SHcx1TfvPwhOe
	 ACfDgF9NyLn/ulw7jwwcdj0VvjoryjHZAXgPSsuVPbvYRnHyocutGZLZP83D77edpH
	 k3sQrFn1W7hPw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B8C3517E3618;
	Mon, 21 Oct 2024 15:24:51 +0200 (CEST)
Message-ID: <4cf5a3d0-97a2-4a43-a91a-0a35aa2bc7e4@collabora.com>
Date: Mon, 21 Oct 2024 15:24:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] regulator: Add driver for MediaTek MT6328 PMIC
 regulators
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 jason-ch chen <Jason-ch.Chen@mediatek.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
 <20241018081050.23592-6-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018081050.23592-6-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_062454_515562_CDC8F210 
X-CRM114-Status: GOOD (  20.48  )
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

Il 18/10/24 10:10, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a driver for the regulators on the MT6328 PMIC.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   drivers/regulator/Kconfig                  |   9 +
>   drivers/regulator/Makefile                 |   1 +
>   drivers/regulator/mt6328-regulator.c       | 479 +++++++++++++++++++++
>   include/linux/regulator/mt6328-regulator.h |  49 +++
>   4 files changed, 538 insertions(+)
>   create mode 100644 drivers/regulator/mt6328-regulator.c
>   create mode 100644 include/linux/regulator/mt6328-regulator.h
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 249933d6388dd..e9b9faff67f3a 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -862,6 +862,15 @@ config REGULATOR_MT6323
>   	  This driver supports the control of different power rails of device
>   	  through regulator interface.
>   
> +config REGULATOR_MT6328
> +	tristate "MediaTek MT6328 PMIC"
> +	depends on MFD_MT6397
> +	help
> +	  Say y here to select this option to enable the power regulator of
> +	  MediaTek MT6328 PMIC.
> +	  This driver supports the control of different power rails of device
> +	  through regulator interface.
> +
>   config REGULATOR_MT6331
>   	tristate "MediaTek MT6331 PMIC"
>   	depends on MFD_MT6397
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 9b69546fb3f65..c1a5a44413198 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -103,6 +103,7 @@ obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
>   obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
>   obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
>   obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
> +obj-$(CONFIG_REGULATOR_MT6328)	+= mt6328-regulator.o
>   obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
>   obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
>   obj-$(CONFIG_REGULATOR_MT6357)	+= mt6357-regulator.o
> diff --git a/drivers/regulator/mt6328-regulator.c b/drivers/regulator/mt6328-regulator.c
> new file mode 100644
> index 0000000000000..e15a64404f494
> --- /dev/null
> +++ b/drivers/regulator/mt6328-regulator.c
> @@ -0,0 +1,479 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MediaTek MT6328 regulator driver
> + * Based on MT6323 driver.
> + *
> + * Copyright (c) 2016 MediaTek Inc.
> + * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
> + */
> +

..snip..

> +/* The array is indexed by id(MT6328_ID_XXX) */
> +static struct mt6328_regulator_info mt6328_regulators[] = {
> +	MT6328_BUCK("buck_vpa", VPA, 500000, 3650000, 50000,
> +		buck_volt_range1, MT6328_VPA_CON9, MT6328_VPA_CON11, 0x3f,
> +		MT6328_VPA_CON12, MT6328_VPA_CON7),

Can you please fix the indentation?

Also, all of those entries do fit in two lines, I checked a couple of those
and always ended up with less than 90 columns anyway.

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

