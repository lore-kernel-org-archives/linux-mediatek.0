Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49784C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 08:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mppPqNqU/6mjELjwGonuTST8WU/l2dX23jNHhIIdLY=; b=hBEM6Tei57eHoj
	Jkin7rAixh9+5A9xCXUtVLCMxCb4bT5ZPqpYrC5+VirSqrWymqtSQwMOkIToT7jz5YTQlsP2dArpD
	e7l9DjaBsjH3foLEg/ZGsmwK8Cf+VzCDxHd2O7gyOBPwfEDEnEzB8agB6lWXkGC76fribL5Aokxbt
	2ByLVgq3/YPOmb5kt51QK4yMUZmlHziXwAJHtUlUxDpGRqwNCEQGGAsZ43dSnkki/BaL79CjgXF5M
	NyRxczsl2nSCdxf1SdRyGyB8wbRjGhXc9DL/PUL3XVrHt/cjwAp5xwY7OH6ZYSRCGAUW0NIjEqJNv
	ZJhO0H7rBdfPlk+yocQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nryQC-00BOhd-QK; Fri, 20 May 2022 08:55:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nryQ0-00BOe1-QJ; Fri, 20 May 2022 08:55:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id EA6C61F4611B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653036931;
 bh=zCn3iIu/yF99M4r5VZnKqFotpd4kLSeKs6lzkczWj/Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EmZE/H2SOT3hF5dfCGtNXLdJ03BPpi/KFB/ObJtby2dwOnYkthFv+NKgGoHJMjSc2
 XKGf/KLtirJmwCAqBFqcqnyqXtMubX2bsAm+sWIP3myaF/HXpOvUKOL5F5mBxVLD94
 moJ5cLpCcWDh3PS2YdK02uS7f9wpin26u1qJZLTVo2M4ON/32ghfe0s0jexr+9/gd+
 AH2U/Q8tQDf2mbroID2cp1oqvU8MUADgdTc10whv3Tbg8iFnJqwdqZWDQf408hups3
 h7bqYCfzTg1khlL1C5VEHk5sG5uuKOJBYCPS4JxyUxmMebbCCrHElFnBj8wM6VxLXd
 vNgSLS0pzF+ig==
Message-ID: <d54ea1d3-903f-0b2a-3db4-99f1adfadce0@collabora.com>
Date: Fri, 20 May 2022 10:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/4] dt-bindings: reset: Add MT6735 reset bindings
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Rob Herring <robh@kernel.org>
References: <20220519142211.458336-1-y.oudjana@protonmail.com>
 <20220519142211.458336-3-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220519142211.458336-3-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_015533_036175_4D0123A4 
X-CRM114-Status: GOOD (  17.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 19/05/22 16:22, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add reset definitions for Mediatek MT6735 resets provided by
> infracfg and pericfg.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>   MAINTAINERS                                   |  2 ++
>   .../reset/mediatek,mt6735-infracfg.h          | 31 +++++++++++++++++++
>   .../reset/mediatek,mt6735-pericfg.h           | 31 +++++++++++++++++++
>   3 files changed, 64 insertions(+)
>   create mode 100644 include/dt-bindings/reset/mediatek,mt6735-infracfg.h
>   create mode 100644 include/dt-bindings/reset/mediatek,mt6735-pericfg.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a59069263cfb..1c0af554a7b6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12503,6 +12503,8 @@ F:	include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
>   F:	include/dt-bindings/clock/mediatek,mt6735-infracfg.h
>   F:	include/dt-bindings/clock/mediatek,mt6735-pericfg.h
>   F:	include/dt-bindings/clock/mediatek,mt6735-topckgen.h
> +F:	include/dt-bindings/reset/mediatek,mt6735-infracfg.h
> +F:	include/dt-bindings/reset/mediatek,mt6735-pericfg.h
>   
>   MEDIATEK MT76 WIRELESS LAN DRIVER
>   M:	Felix Fietkau <nbd@nbd.name>

..snip..

> diff --git a/include/dt-bindings/reset/mediatek,mt6735-pericfg.h b/include/dt-bindings/reset/mediatek,mt6735-pericfg.h
> new file mode 100644
> index 000000000000..6cdfaa7ddadf
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt6735-pericfg.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_RST_MT6735_PERICFG_H
> +#define _DT_BINDINGS_RST_MT6735_PERICFG_H
> +
> +#define UART0_SW_RST			0
> +#define UART1_SW_RST			1
> +#define UART2_SW_RST			2
> +#define UART3_SW_RST			3
> +#define UART4_SW_RST			4

where's number 5?

> +#define BTIF_SW_RST			6
> +#define DISP_PWM_SW_RST			7
> +#define PWM_SW_RST			8

...and where's 9?

> +#define AUXADC_SW_RST			10
> +#define DMA_SW_RST			11
> +#define IRDA_SW_RST			12
> +#define IRTX_SW_RST			13

and 14, 15?

> +#define THERM_SW_RST			16
> +#define MSDC2_SW_RST			17
> +#define MSDC3_SW_RST			17

MSDC 2 and 3 are both 17?! :-)

> +#define MSDC0_SW_RST			19
> +#define MSDC1_SW_RST			20

21?

> +#define I2C0_SW_RST			22
> +#define I2C1_SW_RST			23
> +#define I2C2_SW_RST			24
> +#define I2C3_SW_RST			25
> +#define USB_SW_RST			28
> +

and 29-32?

> +#define SPI0_SW_RST			33
> +
> +#endif

I have a hunch that you've misunderstood the changes in the resets...

What Rex-BC has done in his reset cleanup is exactly to stop directly
mapping these to the actual bits that we're using... so the definitions
in there will simply be sequential, and the actual mapping is done in
your clk-mt6735-pericfg.c driver.

Is it clear? Does it make sense now? :-)

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
