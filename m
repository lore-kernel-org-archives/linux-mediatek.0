Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B30DC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 20:35:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA40E20748
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 20:35:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k0h8rZIm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="IvgeTeN2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA40E20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=le7F6y2/K+rd1kKGorKyqjM98rQwbw5bOWmE0keoAdY=; b=k0h8rZImC1McoBFKNxhsloySC
	G33RmtEtgkKZEVRvkGVXpC9gdvEfWElpUQXm8IMXNziW/n8sl2ZPql0HpNUT65Y9VdjPNUJZbMu3X
	pq6iN17qdLvtHdbmovK4EbqCd375mqTWjnNb4pdqubb00Hsc0AtiRoA/UhZQmsB03l794VcvRg3k+
	zn8F2IylBnbcXm9YACaHhDlf3B+E4OL0G2CEXAfrVo/NNDiwTQg2iO7+eWfKF6/QpfyTZuySZCGpo
	eCvCqeghrpE43kwoichUA0drb/P38uzL6SbCIGX7RI7jieebj4xRUIBG+u9EdMqBA917dInPCsFwY
	mbYN8AZQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtdFs-0006cw-1L; Thu, 09 Jul 2020 20:34:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtdFo-0006Rj-Lv; Thu, 09 Jul 2020 20:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Koqd6kCw0kFF9cQ+B8QeO0El7U/kaG6Z8/n9tod5TOg=; b=IvgeTeN2x0f/Xu41dh0Jtt43E
 ab7TM2+A2KH+t+kIXz6OB22IIg/CDFop78jPS70LfusrdJQfLrVK4K42mg+fqKmbW0T9VqwasG526
 BC/ZzctqVt3zMj2EJCYZLtw6PUoA2ip4gRkjBxil/FBOrz0Rm3UI7HhzuJzGm8sqItDWz8L1/6jIz
 Jgt8Wh5eSbPHuNaLc0Yz1Uov0lIcnS5XcJMEZSVfozmjzoRi9rLN3XRX20ttGRmC/Skh7UMtA3Ndv
 81gTPavt8z8Eokby2ne6SXDkBRjmNPYNAtgRCbmF8Yy7fSdvprCxMKclacB/Zqx2WT7uMZvaOZRm7
 cH2Ipjsyg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37450)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1jtdCj-0000xj-W6; Thu, 09 Jul 2020 21:31:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1jtdCg-0002Xp-Gd; Thu, 09 Jul 2020 21:31:34 +0100
Date: Thu, 9 Jul 2020 21:31:34 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix mtu warning
Message-ID: <20200709203134.GI1551@shell.armlinux.org.uk>
References: <20200709055742.3425-1-frank-w@public-files.de>
 <20200709134115.GK928075@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709134115.GK928075@lunn.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_163449_047272_88E6EAF3 
X-CRM114-Status: GOOD (  23.80  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 09, 2020 at 03:41:15PM +0200, Andrew Lunn wrote:
> On Thu, Jul 09, 2020 at 07:57:42AM +0200, Frank Wunderlich wrote:
> > From: Ren=E9 van Dorst <opensource@vdorst.com>
> > =

> > in recent Kernel-Versions there are warnings about incorrect MTU-Size
> > like these:
> > =

> > mt7530 mdio-bus:00: nonfatal error -95 setting MTU on port x
> > eth0: mtu greater than device maximum
> > mtk_soc_eth 1b100000.ethernet eth0: error -22 setting MTU to include DS=
A overhead
> > =

> > Fixes: bfcb813203e6 ("net: dsa: configure the MTU for switch ports")
> > Fixes: 72579e14a1d3 ("net: dsa: don't fail to probe if we couldn't set =
the MTU")
> > Fixes: 7a4c53bee332 ("net: report invalid mtu value via netlink extack")
> > Signed-off-by: Ren=E9 van Dorst <opensource@vdorst.com>
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > changes in v2:
> >   Fixes: tag show 12-chars of sha1 and moved above other tags
> > ---
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > =

> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/=
ethernet/mediatek/mtk_eth_soc.c
> > index 85735d32ecb0..00e3d70f7d07 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > @@ -2891,6 +2891,10 @@ static int mtk_add_mac(struct mtk_eth *eth, stru=
ct device_node *np)
> >  	eth->netdev[id]->irq =3D eth->irq[0];
> >  	eth->netdev[id]->dev.of_node =3D np;
> > =

> > +	eth->netdev[id]->mtu =3D 1536;
> =

> Hi Frank
> =

> Don't change to MTU from the default. Anybody using this interface for
> non-DSA traffic expects the default MTU. DSA will change it as needed.
> =

> > +	eth->netdev[id]->min_mtu =3D ETH_MIN_MTU;
> =

> No need to set the minimum. ether_setup() will initialize it.
> =

> > +	eth->netdev[id]->max_mtu =3D 1536;
> =

> I assume this is enough to make the DSA warning go away, but it is the
> true max? I have a similar patch for the FEC driver which i should
> post sometime. Reviewing the FEC code and after some testing, i found
> the real max was 2K - 64.

Are there any plans to solve these warnings for Marvell 88e6xxx DSA ports?

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
