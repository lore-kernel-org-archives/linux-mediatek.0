From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH RFC net-next 1/5] net: dsa: mt7530: Convert to PHYLINK API
Date: Tue, 25 Jun 2019 21:02:46 +0200
Message-ID: <20190625190246.GA27733@lunn.ch>
References: <20190624145251.4849-1-opensource@vdorst.com>
 <20190624145251.4849-2-opensource@vdorst.com>
 <20190624153950.hdsuhrvfd77heyor@shell.armlinux.org.uk>
 <20190625113158.Horde.pCaJOVUsgyhYLd5Diz5EZKI@www.vdorst.com>
 <20190625121030.m5w7wi3rpezhfgyo@shell.armlinux.org.uk>
 <1ad9f9a5-8f39-40bd-94bb-6b700f30c4ba@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1ad9f9a5-8f39-40bd-94bb-6b700f30c4ba@pobox.com>
Sender: netdev-owner@vger.kernel.org
To: Daniel Santos <daniel.santos@pobox.com>
Cc: Russell King - ARM Linux admin <linux@armlinux.org.uk>, =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>, sean.wang@mediatek.com, f.fainelli@gmail.com, davem@davemloft.net, matthias.bgg@gmail.com, vivien.didelot@gmail.com, frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

> But will there still be a mechanism to ignore link partner's advertising
> and force these parameters?

>From man 1 ethtool:

       -a --show-pause
              Queries the specified Ethernet device for pause parameter information.

       -A --pause
              Changes the pause parameters of the specified Ethernet device.

           autoneg on|off
                  Specifies whether pause autonegotiation should be enabled.

           rx on|off
                  Specifies whether RX pause should be enabled.

           tx on|off
                  Specifies whether TX pause should be enabled.

You need to check the driver to see if it actually implements this
ethtool call, but that is how it should be configured.

	Andrew
