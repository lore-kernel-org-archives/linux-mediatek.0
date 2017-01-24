From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] clk: mediatek: Fix MT8135 dependencies
Date: Wed, 25 Jan 2017 00:46:35 +0100
Message-ID: <dda838f6-ba77-b3f9-7567-3cdfb4a6ccd7@gmail.com>
References: <20170124130912.14375a32@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170124130912.14375a32@endymion>
Sender: linux-clk-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: linux-mediatek@lists.infradead.org



On 01/24/2017 01:09 PM, Jean Delvare wrote:
> The MT8135 is a 32-bit SoC, so only propose it on ARM architecture,
> not ARM64.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Fixes: 234d511d8c15 ("clk: mediatek: Add hardware dependency")
> Cc: Andreas Färber <afaerber@suse.de>
> Cc: James Liao <jamesjj.liao@mediatek.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/clk/mediatek/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> --- linux-4.10-rc4.orig/drivers/clk/mediatek/Kconfig	2017-01-24 12:55:50.192100713 +0100
> +++ linux-4.10-rc4/drivers/clk/mediatek/Kconfig	2017-01-24 12:59:08.703066604 +0100
> @@ -52,9 +52,9 @@ config COMMON_CLK_MT2701_BDPSYS
>
>  config COMMON_CLK_MT8135
>  	bool "Clock driver for Mediatek MT8135"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
>  	select COMMON_CLK_MEDIATEK
> -	default ARCH_MEDIATEK
> +	default ARCH_MEDIATEK && ARM
>  	---help---
>  	  This driver supports Mediatek MT8135 clocks.
>
>
