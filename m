Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A1FCD11BF
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Mar 2024 11:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pm71XqUg2Me/5kzVzyvAIWcLcizOGK383LNxU+r5/U=; b=24XQfgR+boUC/su0a+pj96quBd
	auYMen18Yc6q8jlbe7FKjAKd/dWXNd1L0vWeUNXVZVvIdjfN41x6vxfpBVUmKNuDORlGtYRU19WMD
	POzT4E15CbXLITM0r0uue9x3mM8fJa4i8/uynlEzccd/0pe6RE+eqjAagpEiW3J8nD1RRQgAB4HKL
	Gmf3NkswKQPrM6GKc54rYrNteHa4VW609fPXC3PigSYtt/nVGA6V3tnrVetHocAk3IvSt1unnyyQu
	sn9+7v2VVeA9JZueb6t9XJufNfFourprelKLVua1kvBLpu9lGFAisvTtCOsxZV9a8zLHmRf6cBx5E
	JHk8MQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roMEb-0000000CT66-0AuL;
	Sun, 24 Mar 2024 11:41:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roMEW-0000000CSrV-1oXb;
	Sun, 24 Mar 2024 11:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/pm71XqUg2Me/5kzVzyvAIWcLcizOGK383LNxU+r5/U=; b=wpDcD+vYSME5DYWATYlNDH/YEg
	/jTLStgE7PwCf0v4Whv7leAPkpSEkEs08V3YRE91IZ0qWmO7QOBStdHNfbEwxncMIqr4agFzSG94Z
	eC1i59HSLICUSu/PbGSGEnjt0s2ar/Upqey60Jd3DoTiAiIrbMNSBtEVRHEOAkXFEsGBvGZaVemYs
	9tb8rb+A2OBfdHY8c7uVIzCcQMLQorS6o26D9Dp67R48HrLs0Nf6ntIpYMENrpaELL/DW+qAcfWSr
	gyTYpakQ9VyLcSGyEoFS0wjOJ6Ja5eaXk9tf8zXSaPGi32wYs/rLH6VnAfGd+L75WSPgjlG7Fh7Lk
	dR4fLziA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59938)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1roMC7-0002Ei-1W;
	Sun, 24 Mar 2024 11:39:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1roMC0-0006UM-Tn; Sun, 24 Mar 2024 11:39:13 +0000
Date: Sun, 24 Mar 2024 11:39:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
Message-ID: <ZgAQ4Ihsn6RCk7xx@shell.armlinux.org.uk>
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v>
 <ZfnYkuzuvwLepIfC@makrotopia.org>
 <00ec9779-19ce-4005-83f0-f4abf37350fc@arinc9.com>
 <6cb585f6-6da8-45a2-a28b-2fb556f95672@lunn.ch>
 <Zfn1DxkEa3u-f7l2@makrotopia.org>
 <38798882-c033-4949-9446-4c6f15c25ebe@gmail.com>
 <0fbe7ba2-6529-4118-b050-8ea76d28b712@arinc9.com>
 <11b2a4d1-66d8-4bcf-b1a8-20a635b99cc4@gmail.com>
 <5a4c0436-cd78-419f-af14-9c4e0c0435e3@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a4c0436-cd78-419f-af14-9c4e0c0435e3@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_044148_603547_EFE1C488 
X-CRM114-Status: GOOD (  24.85  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Mar 24, 2024 at 12:47:08PM +0300, Arınç ÜNAL wrote:
> On 21/03/2024 18:31, Florian Fainelli wrote:
> > On 3/21/24 09:09, Arınç ÜNAL wrote:
> > > I have started testing MT7531 with EEE enabled and immediately experienced
> > > frames that wouldn't egress the switch or improperly received on the link
> > > partner.
> > > 
> > > SoC MAC       <-EEE off-> MT7531 P6 MAC (acting as PHY)
> > > MT7531 P0 MAC <-EEE on -> MT7531 P0 PHY
> > > MT7531 P0 PHY <-EEE on -> Computer connected with twisted pair
> > 
> > OK, so this is intended to describe that the SoC's Ethernet MAC link to the integrated switch did not use EEE only the user-facing ports. That makes sense because it's all digital logic and you are not going to be seeing much power saving from having EEE enabled between the SoC's Ethernet MAC and CPU port of the switch, that said, however, I wonder if this has an impact on any form of flow control within the switch that is reacting to LPI and you need EEE to be enabled end-to-end?
> 
> I've tested pinging between my computers with EEE enabled interfaces. The
> behaviour is identical.
> 
> > 
> > > 
> > > I've tested pinging from the SoC's CPU. Packet capturing on the twisted
> > > pair computer showed very few frames were being received.
> > > 
> > > # ping 192.168.2.2
> > > PING 192.168.2.2 (192.168.2.2): 56 data bytes
> > > 64 bytes from 192.168.2.2: seq=36 ttl=64 time=0.486 ms
> > > ^C
> > > --- 192.168.2.2 ping statistics ---
> > > 64 packets transmitted, 1 packets received, 98% packet loss
> > > round-trip min/avg/max = 0.486/0.486/0.486 ms
> > > 
> > > It seems there's less loss when frames are passed more frequently.
> > 
> > That would point to an issue getting in and out of LPI, do you see these packet losses even with different LPI timeouts?
> 
> The NICs on my computers don't seem to allow changing the tx-lpi and
> tx-timer options.
> 
> Computer 1 (Intel I219-V, driver: e1000e):
> 
> $ sudo ethtool --set-eee eno1 tx-timer 15
> netlink error: Invalid argument
> 
> $ sudo ethtool --show-eee eno1
> EEE settings for eno1:
> 	EEE status: enabled - active
> 	Tx LPI: 17 (us)
> 	Supported EEE link modes:  100baseT/Full
> 	                           1000baseT/Full
> 	Advertised EEE link modes:  100baseT/Full
> 	                            1000baseT/Full
> 	Link partner advertised EEE link modes:  100baseT/Full
> 	                                         1000baseT/Full
> 
> Computer 2 (Realtek RTL8111H, driver: r8169):
> 
> $ sudo ethtool --set-eee eno1 tx-lpi on
> 
> $ sudo ethtool --show-eee eno1
> EEE settings for eno1:
> 	EEE status: enabled - active
> 	Tx LPI: disabled
> 	Supported EEE link modes:  100baseT/Full
> 	                           1000baseT/Full
> 	Advertised EEE link modes:  100baseT/Full
> 	                            1000baseT/Full
> 	Link partner advertised EEE link modes:  100baseT/Full
> 	                                         1000baseT/Full
> 
> I've tested with switch ports interfaces' tx-timer from 0 to 40, same
> tx-timer for both interfaces. Loss is still there.

EEE implementations tend to be a mess in the way drivers implement the
API, so one can't at the moment rely on what ethtool says about the
status. Sadly, this is what happens when driver authors are left to
their own ends. :(

> I suppose the MT7531 switch PHYs need calibration for EEE that is currently
> missing from the mediatek-ge driver.

EEE is quite simple from the software point of view. There is software
negotiation of the modules that EEE supports, and then there is are
one or more timers that affect the behaviour of EEE. The LPI timer is
"how long the link needs to be idle for before _this_ end signals that
it _can_ enter low power state". The link only enters low power state
when *both* ends of the link signal that they can enter low power
state.

What calibration would be necessary?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

