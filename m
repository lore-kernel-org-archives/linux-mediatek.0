From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCHv4 1/3] net: ethernet: mediatek: support MT7621 SoC
 ethernet hardware
Date: Tue, 29 Jan 2019 19:40:39 -0800
Message-ID: <48bb34ce-9bb0-2dc1-0e17-55e000a23114@gmail.com>
References: <20190130012406.28271-1-gerg@kernel.org>
 <20190130012406.28271-2-gerg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190130012406.28271-2-gerg@kernel.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: gerg@kernel.org, sean.wang@mediatek.com, linux-mediatek@lists.infradead.org, bjorn@mork.no, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org
Cc: rene@vdorst.com, john@phrozen.org, neil@brown.name
List-Id: linux-mediatek@lists.infradead.org



On 1/29/19 5:24 PM, gerg@kernel.org wrote:
> From: Bjørn Mork <bjorn@mork.no>
> 
> The Mediatek MT7621 SoC contains the same ethernet hardware module as
> used on a number of other MediaTek SoC parts. There are some minor
> differences to deal with but we can use the same driver to support
> them all.
> 
> This patch is based on work by Bjørn Mork <bjorn@mork.no>, and his
> original patch is at:
> 
> https://github.com/bmork/LEDE/commit/3293bc63f5461ca1eb0bbc4ed90145335e7e3404
> 
> There is an additional compatible devicetree type added, and the primary
> change to the code required is to support a single interrupt (for both
> RX and TX interrupts).
> 
> Signed-off-by: Bjørn Mork <bjorn@mork.no>
> [gerg@kernel.org: rebase to mainline and irq handler fix]
> Signed-off-by: Greg Ungerer <gerg@kernel.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

> ---
>  drivers/net/ethernet/mediatek/Kconfig       |  2 +-
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 48 ++++++++++++++++++---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++
>  3 files changed, 46 insertions(+), 8 deletions(-)
> 
> v2: first in series for this change
> v3: rebase onto 5.0-rc3
> v4: rebase onto 5.0-rc4
> 
> diff --git a/drivers/net/ethernet/mediatek/Kconfig b/drivers/net/ethernet/mediatek/Kconfig
> index f9149d2a4694..43656f961891 100644
> --- a/drivers/net/ethernet/mediatek/Kconfig
> +++ b/drivers/net/ethernet/mediatek/Kconfig
> @@ -1,6 +1,6 @@
>  config NET_VENDOR_MEDIATEK
>  	bool "MediaTek ethernet driver"
> -	depends on ARCH_MEDIATEK
> +	depends on ARCH_MEDIATEK || SOC_MT7621

Would be nice to add COMPILE_TEST there as well at some point so someone
can easily build test changes to the driver.

-- 
Florian
