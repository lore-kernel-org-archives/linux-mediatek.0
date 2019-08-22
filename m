From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v2 2/3] net: ethernet: mediatek: Re-add support
 SGMII
Date: Thu, 22 Aug 2019 22:11:56 +0100
Message-ID: <20190822211156.GV13294@shell.armlinux.org.uk>
References: <20190821144336.9259-1-opensource@vdorst.com>
 <20190821144336.9259-3-opensource@vdorst.com>
 <20190822144433.GT13294@shell.armlinux.org.uk>
 <20190822195033.Horde.hEW8FBGNfFrugQOCv0gaDfx@www.vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190822195033.Horde.hEW8FBGNfFrugQOCv0gaDfx@www.vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: Nelson Chang <nelson.chang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stefan Roese <sr@denx.de>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Rene,

On Thu, Aug 22, 2019 at 07:50:33PM +0000, René van Dorst wrote:
> Quoting Russell King - ARM Linux admin <linux@armlinux.org.uk>:
> > Isn't this set for Cisco SGMII as well as for 802.3 1000BASE-X and
> > the up-clocked 2500BASE-X modes?
> > 
> > If so, is there a reason why 10Mbps and 100Mbps speeds aren't
> > supported on Cisco SGMII links?
> 
> I can only tell a bit about the mt7622 SOC, datasheet tells me that:
> 
> The SGMII is the interface between 10/100/1000/2500 Mbps PHY and Ethernet MAC,
> the spec is raised by Cisco in 1999, which is aims for pin reduction compare
> with the GMII. It uses 2 differential data pair for TX and RX with clock
> embedded bit stream to convey frame data and port ability information.
> The core leverages the 1000Base-X PCS and Auto-Negotiation from IEEE 802.3
> specification (clause 36/37). This IP can support up to 3.125G baud for
> 2.5Gbps
> (proprietary 2500Base-X) data rate of MAC by overclocking.
> 
> Also features tells me: Support 10/100/1000/2500 Mbps in full duplex mode and
> 10/100 Mbps in half duplex mode.

Yep, that is what I'd expect.  Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
