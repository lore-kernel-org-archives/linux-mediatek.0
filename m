From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH] net: ethernet: mediatek: Fix overlapping capability
 bits.
Date: Mon, 01 Jul 2019 12:44:47 +0000
Message-ID: <20190701124447.Horde.RNUh-fSQf6XMauvPaGIYpKj@www.vdorst.com>
References: <20190629122419.19026-1-opensource@vdorst.com>
 <CA+FuTSdr8HCRJTE8pEVxsga3N-xx-fEAxzKAAyPFWH6doVRHbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CA+FuTSdr8HCRJTE8pEVxsga3N-xx-fEAxzKAAyPFWH6doVRHbQ@mail.gmail.com>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, David Miller <davem@davemloft.net>, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, frank-w@public-files.de, Network Development <netdev@vger.kernel.org>, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Quoting Willem de Bruijn <willemdebruijn.kernel@gmail.com>:

> On Sat, Jun 29, 2019 at 8:24 AM René van Dorst <opensource@vdorst.com> wrote:
>>
>> Both MTK_TRGMII_MT7621_CLK and MTK_PATH_BIT are defined as bit 10.
>>
>> This causes issues on non-MT7621 devices which has the
>> MTK_PATH_BIT(MTK_ETH_PATH_GMAC1_RGMII) capability set.
>> The wrong TRGMII setup code is executed.
>>
>> Moving the MTK_PATH_BIT to bit 11 fixes the issue.
>>
>> Fixes: 8efaa653a8a5 ("net: ethernet: mediatek: Add MT7621 TRGMII mode
>> support")
>> Signed-off-by: René van Dorst <opensource@vdorst.com>
>
> This targets net? Please mark networking patches [PATCH net] or [PATCH
> net-next].

Hi Willem,

Thanks for you input.

This patch was for net-next.

>
>> ---
>>  drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h  
>> b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
>> index 876ce6798709..2cb8a915731c 100644
>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
>> @@ -626,7 +626,7 @@ enum mtk_eth_path {
>>  #define MTK_TRGMII_MT7621_CLK          BIT(10)
>>
>>  /* Supported path present on SoCs */
>> -#define MTK_PATH_BIT(x)         BIT((x) + 10)
>>
>> +#define MTK_PATH_BIT(x)         BIT((x) + 11)
>>
>
> To avoid this happening again, perhaps make the reserved range more explicit?
>
> For instance
>
> #define MTK_FIXED_BIT_LAST 10
> #define MTK_TRGMII_MT7621_CLK  BIT(MTK_FIXED_BIT_LAST)
>
> #define MTK_PATH_BIT_FIRST  (MTK_FIXED_BIT_LAST + 1)
> #define MTK_PATH_BIT_LAST (MTK_FIXED_BIT_LAST + 7)
> #define MTK_MUX_BIT_FIRST (MTK_PATH_BIT_LAST + 1)
>
> Though I imagine there are cleaner approaches. Perhaps define all
> fields as enum instead of just mtk_eth_mux and mtk_eth_path. Then
> there can be no accidental collision.

You mean in a similar way as done in the ethtool.h [0]?

Use a enum to define the unique bits.

enum mtk_bits {
	MTK_RGMII_BIT = 0,
	MTK_SGMII_BIT,
	MTK_TRGMII_BIT,
	AND SO ON ....
};

Also move the mtk_eth_mux and mtk_eth_path in to this enum.

Then use defines to convert bits to values.

#define MTK_RGMII  BIT(MTK_RGMII_BIT)
#define MTK_TRGMII BIT(MTK_TRGMII_BIT)

Replace the MTK_PATH_BIT and MTK_PATH_BIT macro with BIT()

Is this what you had in mind?

Greats,

René

[0]:  
https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/ethtool.h#L1402
