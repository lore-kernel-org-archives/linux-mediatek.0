From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH net-next v2 2/3] net: ethernet: mediatek: get hw lro
 capability by the chip id instead of by the dtsi
Date: Wed, 5 Oct 2016 15:18:24 +0300
Message-ID: <6fdb5e81-0e95-0242-02bc-c2a8e15a9bf7@cogentembedded.com>
References: <1475669532-23894-1-git-send-email-nelson.chang@mediatek.com>
 <1475669532-23894-3-git-send-email-nelson.chang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1475669532-23894-3-git-send-email-nelson.chang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: Nelson Chang <nelson.chang@mediatek.com>, john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, nelsonch.tw@gmail.com
List-Id: linux-mediatek@lists.infradead.org

Hello.

On 10/05/2016 03:12 PM, Nelson Chang wrote:

> Because hw lro started to be supported from MT7623, the proper way to check if
> the feature is capable is to judge by the chip id instead of by the dtsi.
>
> Signed-off-by: Nelson Chang <nelson.chang@mediatek.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 ++++++++++--
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  1 +
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 0c67ab1..07f3ffa 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2348,6 +2348,14 @@ static int mtk_get_chip_id(struct mtk_eth *eth, u32 *chip_id)
>  	return 0;
>  }
>
> +static bool mtk_is_hwlro_supported(struct mtk_eth *eth)
> +{
> +	if (eth->chip_id == MT7623_ETH)
> +		return true;
> +	else
> +		return false;

	return eth->chip_id == MT7623_ETH;

[...]
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index a5b422b..58738fd 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -345,6 +345,7 @@
>  /* ethernet subsystem chip id register */
>  #define ETHSYS_CHIPID0_3	0x0
>  #define ETHSYS_CHIPID4_7	0x4
> +#define MT7623_ETH		(7623)

    () not needed at all.

MBR, Sergei
