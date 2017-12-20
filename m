From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] ARM: mediatek: use more generic prompts for SoCs with
 ARMv7
Date: Wed, 20 Dec 2017 15:48:30 +0100
Message-ID: <2b8d9d8a-5356-429e-586b-d0ff8890c098@gmail.com>
References: <e118518cb3ab8bf0ae45669b003153dc1a49ba2f.1513589301.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e118518cb3ab8bf0ae45669b003153dc1a49ba2f.1513589301.git.sean.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 12/18/2017 10:39 AM, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Supported MediaTek SoCs with ARMv7 are not limited within MT65xx or MT81xx
> and thus use more generic words to prompt users as the other vendors
> usually use.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  arch/arm/mach-mediatek/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
> index 70e49d5..91cc461 100644
> --- a/arch/arm/mach-mediatek/Kconfig
> +++ b/arch/arm/mach-mediatek/Kconfig
> @@ -1,5 +1,5 @@
>  menuconfig ARCH_MEDIATEK
> -	bool "Mediatek MT65xx & MT81xx SoC"
> +	bool "MediaTek SoC Support"
>  	depends on ARCH_MULTI_V7
>  	select ARM_GIC
>  	select PINCTRL
> 

Applied to v4.15-next/soc

Thanks!
