From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re: [PATCH] net: ethernet: mediatek: fix warning in phy_start_aneg
Date: Tue, 8 Jan 2019 20:06:53 +0100
Message-ID: <trinity-4ceb1d55-424f-46b8-b8e7-989770b249a2-1546974413848@3c-app-gmx-bs35>
References: <20190108160526.18928-1-frank-w@public-files.de>
 <7acce775-4ab7-c867-c801-25ee004f6b38@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7acce775-4ab7-c867-c801-25ee004f6b38@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Felix Fietkau <nbd@openwrt.org>, Nelson Chang <nelson.chang@mediatek.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


> In mtk_phy_connect() I would say this complete block can be removed.
> All this is handled internally by phylib.
> 
> 	dev->phydev->autoneg = AUTONEG_ENABLE;
> 	dev->phydev->speed = 0;
> 	dev->phydev->duplex = 0;
> 
> 	phy_set_max_speed(dev->phydev, SPEED_1000);
> 	phy_support_asym_pause(dev->phydev);
> 	linkmode_copy(dev->phydev->advertising, dev->phydev->supported);
> 	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
> 			 dev->phydev->advertising);
> 	phy_start_aneg(dev->phydev);
> 
> Could you please test this?

seems to work well, no warning in dmesg

traffic 940Mbit sending, 900 receive

> And a further proposal:
> Instead of the open-coded dev_info() in mtk_phy_connect_node()
> you could use phy_attached_info().

have not tried this yet...because it's only an info-message and needs different parameters...have to look how i can convert it 

> Calling phy_start() in the ndo_open callback is fine, you can leave
> it there.

have it re-added

pushed to my repo: https://github.com/frank-w/BPI-R2-4.14/commits/5.0-rc

regards Frank
