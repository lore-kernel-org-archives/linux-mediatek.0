From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH] net: ethernet: mediatek: Allow non TRGMII mode with
 MT7621 DDR2 devices
Date: Mon, 01 Jul 2019 12:57:52 +0000
Message-ID: <20190701125752.Horde.M4sGI0OXZNgSa9VpOKj-m3s@www.vdorst.com>
References: <20190629122451.19578-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190629122451.19578-1-opensource@vdorst.com>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com
Cc: frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Quoting René van Dorst <opensource@vdorst.com>:

I see that I also forgot to tag this patch for net-next.

Greats,

René

> No reason to error out on a MT7621 device with DDR2 memory when non
> TRGMII mode is selected.
> Only MT7621 DDR2 clock setup is not supported for TRGMII mode.
> But non TRGMII mode doesn't need any special clock setup.
>
> Signed-off-by: René van Dorst <opensource@vdorst.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c  
> b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 066712f2e985..b20b3a5a1ebb 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -139,9 +139,12 @@ static int mt7621_gmac0_rgmii_adjust(struct  
> mtk_eth *eth,
>  {
>  	u32 val;
>
> -	/* Check DDR memory type. Currently DDR2 is not supported. */
> +	/* Check DDR memory type.
> +	 * Currently TRGMII mode with DDR2 memory is not supported.
> +	 */
>  	regmap_read(eth->ethsys, ETHSYS_SYSCFG, &val);
> -	if (val & SYSCFG_DRAM_TYPE_DDR2) {
> +	if (interface == PHY_INTERFACE_MODE_TRGMII &&
> +	    val & SYSCFG_DRAM_TYPE_DDR2) {
>  		dev_err(eth->dev,
>  			"TRGMII mode with DDR2 memory is not supported!\n");
>  		return -EOPNOTSUPP;
> --
> 2.20.1
