Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B80BC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrOUd/OEMMuCZ68QL2mn+ahMTv4H/6y5eI1b2qbSrko=; b=3K9YuLC/Z4NtbFDlvHPxD7Erd4
	HM5bw4xTkCa8SpJMZwj4CZZ5y43gUa28xGGzXycJq4MguxRSP/ohHx9I/a5ZoFz/5vEH3977RBzjW
	9CfqjJ1rYASPlHzP9yidX1fbTCA5DiqtdTl1UmSDWAeA4ewYH1B/YZp1Qo5Q1A+DKkfZ7dVrrLhBu
	X6SyH1MsseMVIlPqrP2wokoOGsylj7ACxvAHcMsQMmE/qVLzYqXv+vlbyVgyp8TrvSsbHfTUBqfI5
	yxljvKGQGCO4ZvickAc1BtEUfn3mKh/81xyrP2+AY0hTHM4gvl0FwmVBZdobtruOkroi+oD+hrnWI
	bW0/vuFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXZo-000T7E-MP; Tue, 07 Mar 2023 13:42:00 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXKI-000N7T-2C; Tue, 07 Mar 2023 13:25:59 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pZXJn-0000FJ-03;
	Tue, 07 Mar 2023 14:25:27 +0100
Date: Tue, 7 Mar 2023 13:25:23 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next 4/4] net: mtk_eth_soc: note interface modes
 not set in supported_interfaces
Message-ID: <ZAc7Q4VMzLjzQbRC@makrotopia.org>
References: <Y/ivHGroIVTe4YP/@shell.armlinux.org.uk>
 <E1pVXJK-00CTAl-V7@rmk-PC.armlinux.org.uk>
 <ZAcnjXxLfeE9UIsO@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAcnjXxLfeE9UIsO@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_052558_130202_7D6D7208 
X-CRM114-Status: GOOD (  23.50  )
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

On Tue, Mar 07, 2023 at 12:01:17PM +0000, Russell King (Oracle) wrote:
> To any of those with Mediatek hardware... Any opinions on what we should
> do concerning these modes?
> 
> If I don't get a reply, then I'll delete these. There's no point having
> this code if it's been unreachable for a while and no one's complained.

A quick grep through the device trees of the more than 650 ramips and
mediatek boards we support in OpenWrt has revealed that *none* of them
uses either reduced-MII or reverse-MII PHY modes. I could imaging that
some more specialized ramips boards may use the RMII 100M PHY mode to
connect with exotic PHYs for industrial or automotive applications
(think: for 100BASE-T1 PHY connected via RMII). I have never seen or
touched such boards, but there are hints that they do exist.

For reverse-MII there are cases in which the Ralink SoC (Rt305x, for
example) is used in iNIC mode, ie. connected as a PHY to another SoC,
and running only a minimal firmware rather than running Linux. Due to
the lack of external DRAM for the Ralink SoC on this kind of boards,
the Ralink SoC there will anyway never be able to boot Linux.
I've seen this e.g. in multimedia devices like early WiFi-connected
not-yet-so-smart TVs.

Tl;dr: I'd drop them. If anyone really needs them, it would be easy to
add them again and then also add them to the phylink capability mask.

> 
> Thanks.
> 
> On Fri, Feb 24, 2023 at 12:36:26PM +0000, Russell King (Oracle) wrote:
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > index f78810717f66..280490942fa4 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > @@ -530,9 +530,11 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
> >  		case PHY_INTERFACE_MODE_GMII:
> >  			ge_mode = 1;
> >  			break;
> > +		/* FIXME: RMII is not set in the phylink capabilities */
> >  		case PHY_INTERFACE_MODE_REVMII:
> >  			ge_mode = 2;
> >  			break;
> > +		/* FIXME: RMII is not set in the phylink capabilities */
> >  		case PHY_INTERFACE_MODE_RMII:
> >  			if (mac->id)
> >  				goto err_phy;
> > -- 
> > 2.30.2
> > 
> > 
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

