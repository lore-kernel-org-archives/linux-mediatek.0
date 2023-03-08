Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D854C6FD20
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 14:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRpfWAyAr9NJ0cUH+oJUvt5Zq2cO3qLqUNmAFfG9Mp4=; b=bt6wKdl7notSAMVmW30fk6JuS1
	LbdPJfC4GMq0U6KxRznblRImlZLp5AAltNglvaAIXDAHAH2S+rqY0j3JQayse/w6skBZOVzW39WIc
	II0lTDQMSC9P0/j9TWp1BHtIhEAzaTOJOAgOhtp9xfhGVE1s5wss5pI3gxxkL+WfnkFyYtfP9dLmC
	IBpc/8D0eH7gexJ5mBPFPJADDwU9Z0vn1q1irzmu2G9j1WjFHtwyDxL3Ostg2FbblXeeT6NSQs9A5
	L2bXsjqlh8Lptd/QZ7baox4CGs38VJO177rzzctCWyVXFdIL5B4njL6mb5brsL4Ds0+j1yL98Km1r
	kgWRgn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZuWw-005OXh-QZ; Wed, 08 Mar 2023 14:12:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZuWt-005OVc-1e; Wed, 08 Mar 2023 14:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tRpfWAyAr9NJ0cUH+oJUvt5Zq2cO3qLqUNmAFfG9Mp4=; b=RJ47iD6rJBGBLbFJHKdbU2G1AQ
	rI2unKHGX2cX9JmMhhybBVN7yYSp3+bVvPmrVHddReFLFP2657dahor6uGkgwCM98/ATjbO0XWWji
	rbbfqHv3f0YlF11z7W0oD9sl/MzvnRJlEfBGq90/eEddeZAnaJma2Vzb5KT71sRzPFqoR0BAw5pL0
	3Im1UvMxsEYD8mbcGN4E3I1T99gmyzwxzlkVIDJ1vbW28mwnw4MPPZQIGAwvySCWcrQB2tBkKf7NQ
	t65/rKf+1j90ZC8slM7DRA3MzTSToOyEVqtY8ALLSCz4I0nZG8kXzzxCe23sE7/ISiWglEWbE13yS
	J1K9XwZQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57160)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pZuWj-0002iT-7X; Wed, 08 Mar 2023 14:12:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pZuWb-0002eN-0y; Wed, 08 Mar 2023 14:12:13 +0000
Date: Wed, 8 Mar 2023 14:12:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v12 08/18] net: ethernet: mtk_eth_soc: fix
 1000Base-X and 2500Base-X modes
Message-ID: <ZAiXvNT8EzHTmFPh@shell.armlinux.org.uk>
References: <cover.1678201958.git.daniel@makrotopia.org>
 <fd5c7ea79a7f84caac7d0b64b39fe5c4043edfa8.1678201958.git.daniel@makrotopia.org>
 <ZAhzDDjZ8+gxyo3V@shell.armlinux.org.uk>
 <ZAh7hA4JuJm1b2M6@makrotopia.org>
 <ZAiCh8wkdTBT+6Id@shell.armlinux.org.uk>
 <ZAiFOTRQI36nGo+w@makrotopia.org>
 <ZAiJqvzcUob2Aafq@shell.armlinux.org.uk>
 <20230308134642.cdxqw4lxtlgfsl4g@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308134642.cdxqw4lxtlgfsl4g@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_061231_107357_32B80CDD 
X-CRM114-Status: GOOD (  29.17  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Jianhui Zhao <zhaojh329@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 08, 2023 at 03:46:42PM +0200, Vladimir Oltean wrote:
> On Wed, Mar 08, 2023 at 01:12:10PM +0000, Russell King (Oracle) wrote:
> > So, what I would want to do is to move the decision about whether
> > the PCS should enable in-band into the phylink core code instead
> > of these random decisions being made in each PCS.
> > 
> > At that point, we can then make the decision about whether the
> > ethtool autoneg bit should affect whether the PCS uses inband
> > depending on whether the PCS is effectively the media facing
> > entity, or whether there is a PHY attached - and if there is a PHY
> > attached, ask the PHY whether it will be using in-band or not.
> > 
> > This also would give a way to ensure that all PCS adopt the same
> > behaviour.
> > 
> > Does that sound a reasonable approach?
> > 
> > Strangely, I already have some patches along those lines in my
> > net-queue branch. See:
> > 
> > net: phylink: add helpers for decoding mode
> > net: use phylink_mode_*() helpers
> > net: phylink: split PCS in-band from inband mode
> > 
> > It's nowhere near finished though, it was just an idea back in
> > 2021 when the problem of getting rid of differing PCS behaviours
> > was on my mind.
> 
> Having looked at those patches
> (http://git.armlinux.org.uk/cgit/linux-arm.git/commit/?h=net-queue&id=a632167d226cf95d92cd887b2f1678e1539833b1)
> and seen the way in which they are incomplete, could you sketch here how
> do you see an actual pcs_validate() implementation making use of the new
> "mode" argument?
> 
> I'd expect there to be some logic which changes the "mode", if the PCS
> validation with the existing one fails... or?

You may notice that I explicitly didn't include the patches adding the
mode argument to the validation path, precisely because that's an
unanswered question.

I haven't done much work in this area because I gave up with trying to
convert mv88e6xxx to phylink_pcs because it just became impossible
due to the history of the driver - and that destroyed my motivation
for further work, because that would mean I'd just accumulate more
and more patches. You may have noticed that I'm hardly doing any
development work on phylink over the last few months, instead
concentrating on problem non-DSA network drivers.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

