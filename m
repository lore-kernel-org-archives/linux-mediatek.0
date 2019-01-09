From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2] net: ethernet: mediatek: fix warning in phy_start_aneg
Date: Wed, 9 Jan 2019 19:31:23 +0100
Message-ID: <2d3d2d19-b149-76e7-8013-ffb124b62f2b@gmail.com>
References: <20190109072028.30513-1-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190109072028.30513-1-frank-w@public-files.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>, Felix Fietkau <nbd@openwrt.org>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@kernel.org>, Nelson Chang <nelson.chang@mediatek.com>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 09.01.2019 08:20, Frank Wunderlich wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
> 
> linux 5.0-rc1 shows following warning on bpi-r2/mt7623 bootup:
> 
> [ 5.170597] WARNING: CPU: 3 PID: 1 at drivers/net/phy/phy.c:548 phy_start_aneg+0x110/0x144
> [ 5.178826] called from state READY
> ....
> [ 5.264111] [<c0629fd4>] (phy_start_aneg) from [<c0e3e720>] (mtk_init+0x414/0x47c)
> [ 5.271630] r7:df5f5eec r6:c0f08c48 r5:00000000 r4:dea67800
> [ 5.277256] [<c0e3e30c>] (mtk_init) from [<c07dabbc>] (register_netdevice+0x98/0x51c)
> [ 5.285035] r8:00000000 r7:00000000 r6:c0f97080 r5:c0f08c48 r4:dea67800
> [ 5.291693] [<c07dab24>] (register_netdevice) from [<c07db06c>] (register_netdev+0x2c/0x44)
> [ 5.299989] r8:00000000 r7:dea2e608 r6:deacea00 r5:dea2e604 r4:dea67800
> [ 5.306646] [<c07db040>] (register_netdev) from [<c06326d8>] (mtk_probe+0x668/0x7ac)
> [ 5.314336] r5:dea2e604 r4:dea2e040
> [ 5.317890] [<c0632070>] (mtk_probe) from [<c05a78fc>] (platform_drv_probe+0x58/0xa8)
> [ 5.325670] r10:c0f86bac r9:00000000 r8:c0fbe578 r7:00000000 r6:c0f86bac r5:00000000
> [ 5.333445] r4:deacea10
> [ 5.335963] [<c05a78a4>] (platform_drv_probe) from [<c05a5248>] (really_probe+0x2d8/0x424)
> 
> maybe other boards using this generic driver are affected
> 
> v2:
> optimization:
> 
> - phy_set_max_speed() is only needed if you want to reduce the
>   max speed, typically if the PHY supports 1Gbps but the MAC
>   supports 100Mbps only.
> 
> - The pause parameters are autonegotiated. Except you have a specific
>   need you normally don't need to manually fiddle with this.
> 
> - phy_start_aneg() is called implicitly by the phylib state machine,
>   you shouldn't call it manually except you have a good excuse.
> 
> - netif_carrier_on/netif_carrier_off in mtk_phy_link_adjust() isn't
>   needed. It's done by phy_link_change() in phylib.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>
