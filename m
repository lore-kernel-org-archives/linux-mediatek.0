Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4E9CF11F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 13:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=746vaEw+a+nZ/nL8YtbbZqmgkLQ98kIb/xSecxbx5Dc=; b=mnns4wA149yhh4VS5xfVYM4E5U
	M84hov6q0j9CxBEb/lT2hFxQvR8ahV3+zs28jh7JRcwO0pZqdji5MbtoYmSwC6C0UDy7zBEZvyno0
	tozhDhdvR1D+nCOSIFs1aRhbfHL0F+JxFiV7pJjJaOQdx30HgnxMlAbORg0k/+w1ytFZ9A0rVLhOP
	E1eOqgepkcYlrAtI29WQu3oWp+H4qvlRfWJyG4WWmAkZqGpwyQaz7ZKnqlv9s9rzQhUGPvSQXlO99
	fF+z4tYk6Bo6X1EDpRuSxUoWp7vs5tDyurOvQK9IqIBMQEbcfUOVDIohzu/KNokUOHV/t357a1OPX
	/wO/Jvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syszW-0000000CsEG-1IJ5;
	Thu, 10 Oct 2024 13:14:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syskx-0000000CpHv-1255
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Oct 2024 12:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728565141;
	bh=qG07lweCtBAKOnQXgCoehTDupnHqaq1M91lS9S6Vfcw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GarzqXUR4X2v779CIciPxGeAekZ2tMC0aHXtHJiB36ZNuhI5LQeHdeOf65UryhGEf
	 BcY74oj8Xh7BgliJXDWijcsP6rXCglUKTgBSUbnTIoeklyEttma3alaIymDq8PZAyr
	 p188LUr5l88XbJuVafTcdhNGYVpEEx8Am27DSXy5SKHfMaNmKfuX4GZKYFprV81Yut
	 JL3zjHq+BC+BXQPPF9Tt5smmx7U2wbcjlUYn9PXiz8GE6ChUTpaFEXUS9Axu+Hh3xK
	 Wtm6KlkXzJkjueJclJrQUqLzyAY8eY2dUKLt9u3CIUfeDjGRUxqYgqQKx+hRMUAaOg
	 JTxThjytqr6uA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E634717E35F4;
	Thu, 10 Oct 2024 14:59:00 +0200 (CEST)
Message-ID: <d9bd5573-4860-4a59-b03c-2c353a9b556b@collabora.com>
Date: Thu, 10 Oct 2024 14:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] clk: mediatek: Add drivers for MediaTek MT6735
 main clock and reset drivers
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sam Shih <sam.shih@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20241010124529.78460-1-y.oudjana@protonmail.com>
 <20241010124529.78460-3-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241010124529.78460-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_055903_471617_8601D132 
X-CRM114-Status: GOOD (  16.88  )
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

Il 10/10/24 14:45, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add drivers for MT6735 apmixedsys, topckgen, infracfg and pericfg
> clock and reset controllers. These provide the base clocks and resets
> on the platform, enough to bring up all essential blocks including
> PWRAP, MSDC and peripherals (UART, I2C, SPI).
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   MAINTAINERS                                  |   4 +
>   drivers/clk/mediatek/Kconfig                 |   9 +
>   drivers/clk/mediatek/Makefile                |   1 +
>   drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 138 +++++++
>   drivers/clk/mediatek/clk-mt6735-infracfg.c   | 107 +++++
>   drivers/clk/mediatek/clk-mt6735-pericfg.c    | 124 ++++++
>   drivers/clk/mediatek/clk-mt6735-topckgen.c   | 394 +++++++++++++++++++
>   7 files changed, 777 insertions(+)
>   create mode 100644 drivers/clk/mediatek/clk-mt6735-apmixedsys.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6735-infracfg.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6735-pericfg.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6735-topckgen.c
> 

You're so, so, so, so..... *so close* to get this one upstream.

Read the comments below and *please*, fix it and send a v6 *as soon as you can*,
so that we get a good chance to see this in v6.13 and so that you can move on
with upstreaming the other stuff that you got for this SoC.

..snip...

> diff --git a/drivers/clk/mediatek/clk-mt6735-infracfg.c b/drivers/clk/mediatek/clk-mt6735-infracfg.c
> new file mode 100644
> index 0000000000000..eceb13af3222a
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt6735-infracfg.c
> @@ -0,0 +1,107 @@
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
> +#include <dt-bindings/clock/mediatek,mt6735-infracfg.h>
> +#include <dt-bindings/reset/mediatek,mt6735-infracfg.h>
> +
> +#define INFRA_RST0			0x30
> +#define INFRA_GLOBALCON_PDN0		0x40
> +#define INFRA_PDN1			0x44
> +#define	INFRA_PDN_STA			0x48

#define<tab>INFRA_PDN_STA .... I know this is a typo, but you'll have to fix it.

Please replace the tabulation with a space, so that this is consistent with all
of the other definitions that you have in here.

> +
> +#define RST_NR_PER_BANK			32
> +

..snip..

> diff --git a/drivers/clk/mediatek/clk-mt6735-pericfg.c b/drivers/clk/mediatek/clk-mt6735-pericfg.c
> new file mode 100644
> index 0000000000000..6f298d5538782
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt6735-pericfg.c
> @@ -0,0 +1,124 @@
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
> +#include <dt-bindings/clock/mediatek,mt6735-pericfg.h>
> +#include <dt-bindings/reset/mediatek,mt6735-pericfg.h>
> +
> +#define PERI_GLOBALCON_RST0		0x00
> +#define PERI_GLOBALCON_RST1		0x04
> +#define PERI_GLOBALCON_PDN0_SET		0x08
> +#define PERI_GLOBALCON_PDN0_CLR		0x10
> +#define	PERI_GLOBALCON_PDN0_STA		0x18

same here

> +
> +#define RST_NR_PER_BANK			32
After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

