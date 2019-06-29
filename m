From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH] net: ethernet: mediatek: Fix overlapping capability bits.
Date: Sat, 29 Jun 2019 15:33:57 -0400
Message-ID: <CA+FuTSdr8HCRJTE8pEVxsga3N-xx-fEAxzKAAyPFWH6doVRHbQ@mail.gmail.com>
References: <20190629122419.19026-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190629122419.19026-1-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Cc: sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, David Miller <davem@davemloft.net>, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, frank-w@public-files.de, Network Development <netdev@vger.kernel.org>, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, Jun 29, 2019 at 8:24 AM Ren=C3=A9 van Dorst <opensource@vdorst.com>=
 wrote:
>
> Both MTK_TRGMII_MT7621_CLK and MTK_PATH_BIT are defined as bit 10.
>
> This causes issues on non-MT7621 devices which has the
> MTK_PATH_BIT(MTK_ETH_PATH_GMAC1_RGMII) capability set.
> The wrong TRGMII setup code is executed.
>
> Moving the MTK_PATH_BIT to bit 11 fixes the issue.
>
> Fixes: 8efaa653a8a5 ("net: ethernet: mediatek: Add MT7621 TRGMII mode
> support")
> Signed-off-by: Ren=C3=A9 van Dorst <opensource@vdorst.com>

This targets net? Please mark networking patches [PATCH net] or [PATCH
net-next].

> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.h
> index 876ce6798709..2cb8a915731c 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -626,7 +626,7 @@ enum mtk_eth_path {
>  #define MTK_TRGMII_MT7621_CLK          BIT(10)
>
>  /* Supported path present on SoCs */
> -#define MTK_PATH_BIT(x)         BIT((x) + 10)
>
> +#define MTK_PATH_BIT(x)         BIT((x) + 11)
>

To avoid this happening again, perhaps make the reserved range more explici=
t?

For instance

#define MTK_FIXED_BIT_LAST 10
#define MTK_TRGMII_MT7621_CLK  BIT(MTK_FIXED_BIT_LAST)

#define MTK_PATH_BIT_FIRST  (MTK_FIXED_BIT_LAST + 1)
#define MTK_PATH_BIT_LAST (MTK_FIXED_BIT_LAST + 7)
#define MTK_MUX_BIT_FIRST (MTK_PATH_BIT_LAST + 1)

Though I imagine there are cleaner approaches. Perhaps define all
fields as enum instead of just mtk_eth_mux and mtk_eth_path. Then
there can be no accidental collision.
