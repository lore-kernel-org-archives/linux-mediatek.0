From: Sean Wang <sean.wang@kernel.org>
Subject: Re: Re: [PATCH] net: ethernet: mediatek: fix warning in phy_start_aneg
Date: Tue, 8 Jan 2019 11:29:14 -0800
Message-ID: <CAGp9LzrUK=QWJsDwiTVG7vD7v8=jFp6bAm9ZiOh3c2dQk029uA@mail.gmail.com>
References: <20190108160526.18928-1-frank-w@public-files.de>
 <7acce775-4ab7-c867-c801-25ee004f6b38@gmail.com> <trinity-4ceb1d55-424f-46b8-b8e7-989770b249a2-1546974413848@3c-app-gmx-bs35>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <trinity-4ceb1d55-424f-46b8-b8e7-989770b249a2-1546974413848@3c-app-gmx-bs35>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Felix Fietkau <nbd@openwrt.org>, John Crispin <john@phrozen.org>, Nelson Chang <nelson.chang@mediatek.com>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, Jan 8, 2019 at 11:07 AM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
>
> > In mtk_phy_connect() I would say this complete block can be removed.
> > All this is handled internally by phylib.
> >
> >       dev->phydev->autoneg = AUTONEG_ENABLE;
> >       dev->phydev->speed = 0;
> >       dev->phydev->duplex = 0;
> >
> >       phy_set_max_speed(dev->phydev, SPEED_1000);
> >       phy_support_asym_pause(dev->phydev);
> >       linkmode_copy(dev->phydev->advertising, dev->phydev->supported);
> >       linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
> >                        dev->phydev->advertising);
> >       phy_start_aneg(dev->phydev);
> >
> > Could you please test this?
>
> seems to work well, no warning in dmesg
>
> traffic 940Mbit sending, 900 receive
>

The change to phy initialized valve determined by phylib looks good to
me and simplify the mac driver a lot. You could have it in v2.

> > And a further proposal:
> > Instead of the open-coded dev_info() in mtk_phy_connect_node()
> > you could use phy_attached_info().
>
> have not tried this yet...because it's only an info-message and needs different parameters...have to look how i can convert it

I think it can be done in a separate patch

>
> > Calling phy_start() in the ndo_open callback is fine, you can leave
> > it there.
>
> have it re-added
>
> pushed to my repo: https://github.com/frank-w/BPI-R2-4.14/commits/5.0-rc
>
> regards Frank
