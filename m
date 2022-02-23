Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356EEC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 13:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zppmlUlFDeCwzyF++A5A/93VbCgRbtOPKnUX+3J7zwY=; b=2E6FHrEjLdORpd
	T2ITA3EadYiBjzlyNAZBeqbb6zo8540EoG8PBkIlOzzKifzmpnfu7apGyxDTT/WDslNhtmo76iNB6
	k5czvyHmHJ2WBHZotin1pGlLu0ZUj4yN8F1ILzYgMLAgHBf6/GnkrzxAq8Bhu7XrtLYPKpfbCbdd8
	YbGLRVuwjDbyGzdcQwksRBnS44aFq/cglJPEe/6MseFNjA35ugjFYZdNJ6m3xEHX4YDnZDtbIQW1Y
	wiOfd+8WGTKVuBRYY9gPQv2oq+Y+sTwyNK/GidMGzSTEVH0OlqLTPuLFFHSgvvBmEcIGJOW0u5/Gz
	YDyFzLw87nNq4wyY7oMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrbb-00ESzk-DY; Wed, 23 Feb 2022 13:22:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrZw-00ES1A-V2; Wed, 23 Feb 2022 13:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kHgVPnW80HT6GJ3r7bIQfijEQBLwYC+ZynGkRUpVWG0=; b=XvGWo0/RhSCCeCKCo/v/hUza8W
 vjqFaajZz2lCJMGyIIZIYEeGIkzt1gLLhdp9vBAeVXr9GnD1L4b2Y4K8IlksEtc5eCuU6A/scP4Kw
 A311+9fpVEFBaj7RR4rS2Ckjl/TvuyX0CzYo+OblNjXA6+MvIQAZOxr9eEeiGt+x7tjATCUv9Zz7T
 6QUr7PCqRHTfhpOMuelthhEkJ/A+cYDZG+iZNBBOllxSJ7VL2q1f3g7SUfRhkof46YSTf5ct4ZEBL
 zVGAvQ5ZGS3auP5PQ5uguM0/lEyduuDYwtJPELGDcFDz7CsLZ87eZ1VOjZbjMspWbDc+LlPfgOfAI
 fMVddE5Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57444)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nMrZo-0002sy-4f; Wed, 23 Feb 2022 13:21:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nMrZl-00011o-On; Wed, 23 Feb 2022 13:21:01 +0000
Date: Wed, 23 Feb 2022 13:21:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next v2 01/10] net: dsa: mt7530: fix incorrect
 test in mt753x_phylink_validate()
Message-ID: <YhY0vabd4nyOmmeN@shell.armlinux.org.uk>
References: <YhYbpNsFROcSe4z+@shell.armlinux.org.uk>
 <E1nMpuT-00AJoW-Dq@rmk-PC.armlinux.org.uk>
 <20220223131200.673xmc6euwkyphzy@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220223131200.673xmc6euwkyphzy@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_052113_056226_C5199760 
X-CRM114-Status: GOOD (  20.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 23, 2022 at 03:12:00PM +0200, Vladimir Oltean wrote:
> Hello,
> 
> On Wed, Feb 23, 2022 at 11:34:17AM +0000, Russell King (Oracle) wrote:
> > Discussing one of the tests in mt753x_phylink_validate() with Landen
> > Chao confirms that the "||" should be "&&". Fix this.
> > 
> > Fixes: c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/dsa/mt7530.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > index f74f25f479ed..69abca77ea1a 100644
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -2936,7 +2936,7 @@ mt753x_phylink_validate(struct dsa_switch *ds, int port,
> >  
> >  	phylink_set_port_modes(mask);
> >  
> > -	if (state->interface != PHY_INTERFACE_MODE_TRGMII ||
> > +	if (state->interface != PHY_INTERFACE_MODE_TRGMII &&
> >  	    !phy_interface_mode_is_8023z(state->interface)) {
> >  		phylink_set(mask, 10baseT_Half);
> >  		phylink_set(mask, 10baseT_Full);
> > -- 
> > 2.30.2
> > 
> 
> Since the "net" pull request for this week is scheduled to happen rather
> soon, I think you should split this and send it to "net", so that you
> won't have to wait when you resend as non-RFC.

I don't believe this is an urgent issue. The issue has existed since
MT7531 support was added in September 2020, and no one has raised it
as a problem until I identified the clearly incorrect expression.

What if fixing this unmasks a problem elsewhere?

Therefore, I see no reason to rush getting this fix into the -rc
kernel, especially without a review and preferably testing by the
driver authors.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
