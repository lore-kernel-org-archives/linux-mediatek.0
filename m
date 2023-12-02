Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45501C4167B
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Dec 2023 09:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJLjF77y4SxHEjhOXmOD85mb2tXiT1lNxpnlYkZDglQ=; b=tGdPat7JGnChuPR9OOlEmUVoRR
	jYxJcB/+Ew0gUDLRQ+q44lvs0sPNHmqfoRh+p18AmDOcofHy7/WJNp5wF6tKof0JF0nuHzH0L601U
	u7HlZfb8e03V+vGo+ZmK4/MWV0uX39p1mDg1g8GEvTKBdVwDJaBaASg8/U3ijoKbI7U1iwXy0HggE
	zXJuOmx4qg7Tot/JER2Bki2P0PSc+upg/FPa1Kj6N/+hrSvCef2Y9E07eQEuJgNROSj7woppMklL9
	9x7X1lAhMtyFQ2jSLceTifyt2Ph7FRCFtTx4V097S/jrsQaNXGZPQ73NmjzykqpGuAOoYHawL0P1G
	Mwq15puA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9MKo-00FNMK-2j;
	Sat, 02 Dec 2023 09:30:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9MKk-00FNLX-1g;
	Sat, 02 Dec 2023 09:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cJLjF77y4SxHEjhOXmOD85mb2tXiT1lNxpnlYkZDglQ=; b=PV3qkCYHbGLiIITrG9RmdVBpGt
	dZM+/IuzIBJsIhispOgoPrWvFxw0DTPbZGEm5CtaF0Qs2Ep3N+gsw0lOiKrWZH0CC6cHPENHUcycP
	LYjXjV8dJHRM6XIxLqVrf0aunHcAC/o4Lz7CGJrMtTTRABiQwnN35QNhl6dWTt2nl5OwohIh+/GB7
	5MotVL2W4IVGe+suBjtekgHICGTClzxiF2pQJeLSVBybGgTLt/2enbborcxowEaaKq1NYVLomTMeX
	ftnt37kMGJlxW5Zmn7K7bnzLPdvcZc6QTEbYMoWyKUuts2+L8sNMF0fjJzvi07+2tQ0+ta/EhMcnc
	W5a8JLhQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53892)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r9MKT-0003yv-03;
	Sat, 02 Dec 2023 09:30:29 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r9MKQ-0006xW-U6; Sat, 02 Dec 2023 09:30:26 +0000
Date: Sat, 2 Dec 2023 09:30:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Message-ID: <ZWr5MiiR1OQujoGG@shell.armlinux.org.uk>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-8-arinc.unal@arinc9.com>
 <20231121185358.GA16629@kernel.org>
 <a2826485-70a6-4ba7-89e1-59e68e622901@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2826485-70a6-4ba7-89e1-59e68e622901@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_013046_559495_95DEECA7 
X-CRM114-Status: GOOD (  28.91  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, mithat.guner@xeront.com, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Simon Horman <horms@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Dec 02, 2023 at 11:45:42AM +0300, Arınç ÜNAL wrote:
> Hi Simon.
> 
> On 21.11.2023 21:53, Simon Horman wrote:
> > On Sat, Nov 18, 2023 at 03:31:57PM +0300, Arınç ÜNAL wrote:
> > > There's no need to run all the code on mt7530_setup_port5() if port 5 is
> > > disabled. The only case for calling mt7530_setup_port5() from
> > > mt7530_setup() is when PHY muxing is enabled. That is because port 5 is not
> > > defined as a port on the devicetree, therefore, it cannot be controlled by
> > > phylink.
> > > 
> > > Because of this, run mt7530_setup_port5() if priv->p5_intf_sel is
> > > P5_INTF_SEL_PHY_P0 or P5_INTF_SEL_PHY_P4. Remove the P5_DISABLED case from
> > > mt7530_setup_port5().
> > > 
> > > Stop initialising the interface variable as the remaining cases will always
> > > call mt7530_setup_port5() with it initialised.
> > > 
> > > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> > > ---
> > >   drivers/net/dsa/mt7530.c | 9 +++------
> > >   1 file changed, 3 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > > index fc87ec817672..1aab4c3f28b0 100644
> > > --- a/drivers/net/dsa/mt7530.c
> > > +++ b/drivers/net/dsa/mt7530.c
> > > @@ -942,9 +942,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
> > >   		/* MT7530_P5_MODE_GMAC: P5 -> External phy or 2nd GMAC */
> > >   		val &= ~MHWTRAP_P5_DIS;
> > >   		break;
> > > -	case P5_DISABLED:
> > > -		interface = PHY_INTERFACE_MODE_NA;
> > > -		break;
> > >   	default:
> > >   		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
> > >   			priv->p5_intf_sel);
> > > @@ -2313,8 +2310,6 @@ mt7530_setup(struct dsa_switch *ds)
> > >   		 * Set priv->p5_intf_sel to the appropriate value if PHY muxing
> > >   		 * is detected.
> > >   		 */
> > > -		interface = PHY_INTERFACE_MODE_NA;
> > > -
> > >   		for_each_child_of_node(dn, mac_np) {
> > >   			if (!of_device_is_compatible(mac_np,
> > >   						     "mediatek,eth-mac"))
> > > @@ -2346,7 +2341,9 @@ mt7530_setup(struct dsa_switch *ds)
> > >   			break;
> > >   		}
> > > -		mt7530_setup_port5(ds, interface);
> > > +		if (priv->p5_intf_sel == P5_INTF_SEL_PHY_P0 ||
> > > +		    priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
> > > +			mt7530_setup_port5(ds, interface);
> > 
> > Hi Arınç,
> > 
> > It appears that interface is now uninitialised here.
> > 
> > Flagged by Smatch.
> 
> I'm not sure why it doesn't catch that for mt7530_setup_port5() to run
> here, priv->p5_intf_sel must be either P5_INTF_SEL_PHY_P0 or
> P5_INTF_SEL_PHY_P4. And for that to happen, the interface variable will be
> initialised.

It's probably due to the complexities involved in analysing the values
of variables, especially when they're in structures that are passed in.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

