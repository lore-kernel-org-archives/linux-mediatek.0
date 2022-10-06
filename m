Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2EFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 09:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ap4R/t0w06ODCOFtiem+zIbK8MT+SLBmkfPjzhR6eAs=; b=hrsjnRUwfvsgR3SqLIQGrZaWWz
	2zkrkoWmTOE/gUV3LoajB3l8HchzEcaSMqqDWavTZjShEjT8388mUPGFym+tQnaQ1jGcvkjzP34pP
	N6Ho1+l8TafTgA3FBy/UxeKQ/Fi2TaI5fILFomm1a0db88oz2N8nlm/PzUGLb97ykW6n/9EtrakYd
	1TMXUUeiarLry/BmxU/z2AkFW/Vw7ghej0xYhlstj3MD+yKJanr4BQjiE011xfJMcg9fRG2yo9u9f
	DLbu343QhhXM79iLbw8LD42rpANrq0vT5S3imEhHLTIzj8XF9FSZWxowEUrHEWWHEQiKcSdTRdZx1
	QROj+OWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMz9-0011NL-7n; Thu, 06 Oct 2022 09:16:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMyx-0011IP-Qq; Thu, 06 Oct 2022 09:15:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D1C966022F9;
	Thu,  6 Oct 2022 10:15:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665047754;
	bh=5fVE/DrwU8k543ezqYxJj3KgWv2kkl6AOAI2rFqsjAo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e/dPgR5hRXC9cYBOE61HPI5ZXHPIAHPs7oR/MtClhA0VGY3NUyN7WXK/Ou8KDMr/i
	 ivaG5zxpTVw/4vCb9fSH2xgwHpyz/0i23X7DfDllM3K1KVp4q31BbiKH64bbpbab7J
	 8NKs3HQdr/7LXOE+M1WLU4vlMsPF7PAjrDZ6Qp7EmVOIQqRvDIo15U7DuAEhJZ9jOM
	 wADppJdVCRM2OHAskkBaUkJ3SKKNWTPOm215Ui0eymRq1BoQfWnYrxGxCOdYpWoXFi
	 1cNLKSQxG28DxqKsAczJ9+jdp9JRzUEXle7qe6zCpsX8ALzMqWAuKMg4USaUKQdKc/
	 rWaugsiUK28cg==
Message-ID: <3430472e-0da3-4e92-7e40-b5b9731db98e@collabora.com>
Date: Thu, 6 Oct 2022 11:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 10/10] pinctrl: mediatek: Add MT6735 pinctrl driver
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
 <20221005174343.24240-11-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221005174343.24240-11-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_021556_059286_77335285 
X-CRM114-Status: GOOD (  17.03  )
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

Il 05/10/22 19:43, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   MAINTAINERS                                   |    8 +
>   drivers/pinctrl/mediatek/Kconfig              |    6 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  584 +++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
>   5 files changed, 4592 insertions(+)
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
> 

..snip..

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6735.c b/drivers/pinctrl/mediatek/pinctrl-mt6735.c
> new file mode 100644
> index 000000000000..dd9dad9cb142
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6735.c
> @@ -0,0 +1,584 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "pinctrl-mtk-mt6735.h"
> +#include "pinctrl-paris.h"
> +

..snip..

> +
> +/* Pin group registers */
> +#define GPIO_IES	0x000
> +#define GPIO_SMT	0x010
> +#define GPIO_TDSEL0	0x020
> +#define	GPIO_TDSEL1	0x024

This is the only reason why I can't give you a Reviewed-by, and I'm sad about that.
Please fix that tabulation after #define.

> +#define GPIO_RDSEL0	0x028
> +#define GPIO_RDSEL1	0x02c
> +#define GPIO_PULLEN0	0x030
> +#define GPIO_PULLEN1	0x040
> +#define GPIO_PULLSEL0	0x050
> +#define GPIO_PULLSEL1	0x060
> +#define	GPIO_DRV0	0x070
> +#define	GPIO_DRV1	0x074

...and same here.

> +#define GPIO_PUPD0	0x080
> +#define GPIO_PUPD1	0x090
> +

Thanks,
Angelo

