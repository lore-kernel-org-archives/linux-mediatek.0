Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238B9C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 00:05:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E62A520722
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 00:05:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xFtvSo5b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="wV/O8AXT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E62A520722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y5SvM41pfep2x2xQmBQY0Gkiw9M5xcMtTop8IkIKWvA=; b=xFtvSo5bDOnddFjMC9ikThpFm
	MpVZTfS1onY/G0B/irt1I3lsx+PS7iPNjLx1SZDPJtIJYUcYh2OmUF0hKBSmVhoXtDinR7ASAeH/x
	woZOqm40l4h53Hce7Z9XroY9MjODLhm+YtqtI9wRkzD6o6O8R47xM7K8SucD3/seRZgNuQqcufjOf
	Xja4V07IFfNPX6KXbhpIxUmgkrijEmeja0UE0VMT4P2E6ijlIXxL/9rhO6viSmFWQD6sYoml44fl1
	bHS2704QExUZB0uh/sKXFeN9Dp2Pg5Jl7DO/6NR6F8TtfI5a5B8S9tOYIJ4Pp5CxnfAkGA3bA05oL
	U50vCaNUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqQG1-0004xg-VG; Wed, 01 Jul 2020 00:05:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqQFw-0004we-TV; Wed, 01 Jul 2020 00:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TBNd1SkmeXFu9UrYhNDqssdxJjXXZqfWFt/EARCEABQ=; b=wV/O8AXTSKB+fKSrD8U6Ei27W
 G5ggh3Gq7zKRmgVjes1rdNili9DYylq9He9Z+xN7XPXZPvrQI/PVg2SoYLbKC8MUoywL7XXw4JvLs
 TDRiQ3/QaC1bqnO+M+b0MhxfIueP+4RsALGzGhSfhTYXeTGwuM28V0K/mmC6ptuOA6LcJvTgMrYov
 BLWaWZOYgAbIlaI55tJExdFAyaR/G2B9JRyWOw69HbRXp5pMnXayyQBmcxnDr3Hoph5HqmmyJ4Sk8
 YBxVsiI8UV2np+d7D9x1ZyPGl+t+gJqKfw/cxS80IqiNAvD2SPxsOa3Jze1R33h+ltPl+taKIsSRE
 P+tS4fmdA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33754)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1jqQFi-00015m-5b; Wed, 01 Jul 2020 01:05:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1jqQFe-0000Bs-13; Wed, 01 Jul 2020 01:05:22 +0100
Date: Wed, 1 Jul 2020 01:05:22 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH RFC net-next] net: mtk_eth_soc: use resolved link config
 for PCS PHY
Message-ID: <20200701000521.GH1551@shell.armlinux.org.uk>
References: <E1jqDIk-0004m5-0L@rmk-PC.armlinux.org.uk>
 <20200630104613.GB1551@shell.armlinux.org.uk>
 <20200630221308.Horde.maavwLQud2YnxIT-0uQAH4l@www.vdorst.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630221308.Horde.maavwLQud2YnxIT-0uQAH4l@www.vdorst.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_200541_112567_CD95FAB2 
X-CRM114-Status: GOOD (  39.11  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 30, 2020 at 10:13:08PM +0000, Ren=E9 van Dorst wrote:
> Hi Russel and Sean,
> =

> Quoting Russell King - ARM Linux admin <linux@armlinux.org.uk>:
> =

> > On Tue, Jun 30, 2020 at 11:15:42AM +0100, Russell King wrote:
> > > The SGMII PCS PHY needs to be updated with the link configuration in
> > > the mac_link_up() call rather than in mac_config().  However,
> > > mtk_sgmii_setup_mode_force() programs the SGMII block during
> > > mac_config() when using 802.3z interface modes with the link
> > > configuration.
> > > =

> > > Split that functionality from mtk_sgmii_setup_mode_force(), moving it
> > > to a new mtk_sgmii_link_up() function, and call it from mac_link_up().
> > > =

> > > This does not look correct to me: 802.3z modes operate at a fixed
> > > speed.  The contents of mtk_sgmii_link_up() look more appropriate for
> > > SGMII mode, but the original code definitely did not call
> > > mtk_sgmii_setup_mode_force() for SGMII mode but only 802.3z mode.
> > > =

> > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > > ---
> > > Ren=E9, can you assist with this patch please - I really think there =
are
> > > problems with the existing code.  You call mtk_sgmii_setup_mode_force=
()
> > > in a block which is conditionalised as:
> > > =

> > > 	if (state->interface =3D=3D PHY_INTERFACE_MODE_SGMII ||
> > > 	    phy_interface_mode_is_8023z(state->interface)) {
> > > ...
> > > 		if (state->interface !=3D PHY_INTERFACE_MODE_SGMII)
> > > 			err =3D mtk_sgmii_setup_mode_force(eth->sgmii, sid,
> > > 							 state);
> > > =

> > > Hence, mtk_sgmii_setup_mode_force() is only called for 1000BASE-X and
> > > 2500BASE-X, which do not support anything but their native speeds.
> > > Yet, mtk_sgmii_setup_mode_force() tries to program the SGMII for 10M
> > > and 100M.
> > > =

> > > Note that this patch is more about moving uses of state->{speed,duple=
x}
> > > into mac_link_up(), rather than fixing this problem, but I don't think
> > > the addition in mtk_mac_link_up(), nor mtk_sgmii_link_up() is of any
> > > use.
> > =

> > My Coccinelle script just found this use of state->{speed,duplex} still
> > remaining:
> > =

> >                         if (MTK_HAS_CAPS(mac->hw->soc->caps,
> >                                          MTK_TRGMII_MT7621_CLK)) {
> > ...
> >                         } else {
> >                                 if (state->interface !=3D
> >                                     PHY_INTERFACE_MODE_TRGMII)
> >                                         mtk_gmac0_rgmii_adjust(mac->hw,
> >                                                                state->s=
peed);
> > =

> > which also needs to be eliminated.  Can that also be moved to
> > mtk_mac_link_up()?
> =

> I know, you have pointed that out before. But I don't know how to fix
> mtk_gmac0_rgmii_adjust(). This function changes the PLL of the MAC. But
> without documentation I am not sure what all the bits are used for.

I'd forgotten...

> Begin April I had a conversation with Sean about this. I also explained w=
hat
> the issue was. AFAIK he was going to take care of this issue.
> =

> Sean did you had time to resolve this issue?

Well, I think the code as it stands is quite broken.

If we start a bit earlier in mtk_mac_config(), we have this:

        if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628) &&
            mac->interface !=3D state->interface) {

which prevents us entering this block unless the interface mode has
changed and we are not MT7628.  This block of code includes the two
calls to mtk_gmac0_rgmii_adjust(), which are dependent on
state->speed.

Since mac->interface starts off as PHY_INTERFACE_MODE_NA, the first
time we head into mtk_mac_config(), the interface mode will be
different, and we will enter this block of code, maybe calling down
into mtk_gmac0_rgmii_adjust() if appropriate.

The first call will be via phylink_start(), which will call it with
the initial configuration - the link will be down, and state->speed
will be SPEED_UNKNOWN.  So, the various tests inside
mtk_gmac0_rgmii_adjust() for speed =3D=3D SPEED_1000 will all be false,
meaning it'll program it as if for 10M or 100M speeds.

When the link comes up, yes, mtk_mac_config() will be called again
with the link parameters, but state->interface will now match
mac->interface - so the block of code containing the call to
mtk_gmac0_rgmii_adjust() will not be entered, and so none of that
code gets executed when the link comes up/down.

Now, if I dig out object 8ddbb8dcf032 from the git repository, which
was the state of the file immedately prior to the phylink conversion,
I find:

static void mtk_phy_link_adjust(struct net_device *dev)
{

This is the function that phylib would call when the link comes up
or down.  It tests for MTK_RESETTING, starts preparing a value for
mcr, and then:

        if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_GMAC1_TRGMII) && !mac->id)=
 {
                if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_TRGMII_MT7621_CLK)=
) {
                        if (mt7621_gmac0_rgmii_adjust(mac->hw,
                                                      dev->phydev->interfac=
e))
                                return;
                } else {
                        if (!mac->trgmii)
                                mtk_gmac0_rgmii_adjust(mac->hw,
                                                       dev->phydev->speed);
                }
        }

It then finishes creating a value for mcr, before writing it to the
register, and printing the link status to the kernel log.

Hence, mtk_gmac0_rgmii_adjust() would've been called every time there's
a change of link state, and is expected to be passed the current speed.

There seems to be a difference in behaviour between the pre-phylink and
post-phylink drivers, and I think moving mtk_gmac0_rgmii_adjust() into
mtk_mac_link_up() would be a definite improvement, possibly even a
regression fix.

However, it would be reasonable to assume that there should be reports
that mtk_eth_soc doesn't work if this were the case.  So... odd.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
