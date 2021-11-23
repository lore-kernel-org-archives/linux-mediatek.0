Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78B2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 19:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ze6IutguwlohRtNbu9+ppMddWpWt/2wlUYjrHmy2x1U=; b=2QMtqH1fIgOgEF
	wPrfiNERj5T+YBTbHPFpGqIty9BUAvkTn6InB08FaJ2ZOhwrMC1NuxmouPkDDwOmhz+sxBUX5zY1A
	85PaNFakaD7iB19h+nXCJewoFrSbTXCuSgJwaWBsfvnOMhHJKqbPlFBY96UFXgfT4harKo+07ivpP
	VDTE8dS14w+ftlibWw1FeJlF36i79Sd04OHwJ+S533uah824q/GQTxBPtzee21cog0Qc/yd1qhoNp
	kObk2IlbNIa5GNbO7KhnAYmJCt2SqtMEeTksEt/FuV1hcOTq6hZ0omtYyBvfqVruc82YFbN0WLObo
	cUNlf0wbzZAF6/75iGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpbUx-003J9E-Ru; Tue, 23 Nov 2021 19:30:35 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpbUj-003J5z-PP; Tue, 23 Nov 2021 19:30:23 +0000
Received: by mail-ed1-x531.google.com with SMTP id y12so96666534eda.12;
 Tue, 23 Nov 2021 11:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hqd4dcRCG//URmJS7kNBRJSe3g861c87Ppm6Xh6ZhdU=;
 b=MQe3KvFxbtftqHB4bTGwDKGPmdLEWUIC81WsE+32uMqHuNcyEChjojnFrMCmRlcm0J
 8FFcdpibiCV1CSVUTuccPwu7q9EI1oDbnA8/q66Q3Jh2GCEHAcB25ErQ4UTMGUVhs+L/
 IT6fZcUVJjtq4AW3bcFG/QEMuTwdMuUf46GHh5Ccewi0dbsbZkZ+kIVHKA4e6WM9Vb8S
 yRk8Z/P3MjBTgU5rvi/o2ctzkolS3cj6ZnytXrph4MbKDiBlx/pNuJyNAoWNHApk3Wt2
 LJEX7c3U+pwUH8ACKqUnt7Hjusm8xUfAo/Oxy0vNhDYIdOqd+V4Qssrop+nxfRh9otnS
 i6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hqd4dcRCG//URmJS7kNBRJSe3g861c87Ppm6Xh6ZhdU=;
 b=yDUo0su4oTTuKfGnGOoVZK5WkUeqCqatbJXA/V4WifeF4R/BcXK/RztnwGkhIIeCw4
 RN/KPZnnT1XXpT+STF9ut4hvAaVCNapUpo+K1mMtIh8JARI8cAQZsHCEAAcaVYrORZqE
 AwFPBfJQM5qpDxDdLEYLfwOXYNWVn/u9SSSdqPxgr86Sf3SpEd7wMpGGg9HJkZYUpwnu
 HLRQGMBSiDf6Vu6IYDxWo9g7aJJJWaLzuFhCn5ajSmNPC7BfEodmZnTyolooXmiaQ31i
 n6FJo0FhzFAtjBdhtwtq4Z0BZK6aBGIrgQ3tIyx5KWJHGbVqcBO9NC4kfTFOHR0Ctctr
 s00g==
X-Gm-Message-State: AOAM530uBD4g4tVgTLMECX6mBvwZhHlDUzPqJqcdsTQABceAqKpwQhOZ
 TBjzJa/zxKonze8XLT+QbeY=
X-Google-Smtp-Source: ABdhPJyeBX7C35H+vad5xry1HQP5yueUnlNXETzdy3KzVPuCmU0Ddc86U/OLTxdsLgg328XWfnOzlg==
X-Received: by 2002:a17:906:dc91:: with SMTP id
 cs17mr11147526ejc.461.1637695819985; 
 Tue, 23 Nov 2021 11:30:19 -0800 (PST)
Received: from skbuf ([188.25.163.189])
 by smtp.gmail.com with ESMTPSA id r25sm6282389edt.21.2021.11.23.11.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 11:30:19 -0800 (PST)
Date: Tue, 23 Nov 2021 21:30:17 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Sean Anderson <sean.anderson@seco.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC net-next 8/8] net: phylink: allow PCS to be removed
Message-ID: <20211123193017.rtvxyvb3oheqoxlz@skbuf>
References: <YZy59OTNCpKoPZT/@shell.armlinux.org.uk>
 <E1mpSba-00BXp6-9e@rmk-PC.armlinux.org.uk>
 <20211123120825.jvuh7444wdxzugbo@skbuf>
 <YZ0R6T33DNTW80SU@shell.armlinux.org.uk>
 <90262b1c-fee2-f906-69df-1171ff241077@seco.com>
 <20211123181515.qqo7e4xbuu2ntwgt@skbuf>
 <472ce8f0-a592-ce5b-0005-7d765b2d0e93@seco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <472ce8f0-a592-ce5b-0005-7d765b2d0e93@seco.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_113021_864578_887DFBF6 
X-CRM114-Status: GOOD (  60.56  )
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

On Tue, Nov 23, 2021 at 02:04:03PM -0500, Sean Anderson wrote:
> On 11/23/21 1:15 PM, Vladimir Oltean wrote:
> > On Tue, Nov 23, 2021 at 12:30:33PM -0500, Sean Anderson wrote:
> > > On 11/23/21 11:08 AM, Russell King (Oracle) wrote:
> > > > On Tue, Nov 23, 2021 at 02:08:25PM +0200, Vladimir Oltean wrote:
> > > > > On Tue, Nov 23, 2021 at 10:00:50AM +0000, Russell King (Oracle) wrote:
> > > > > > Allow phylink_set_pcs() to be called with a NULL pcs argument to remove
> > > > > > the PCS from phylink. This is only supported on non-legacy drivers
> > > > > > where doing so will have no effect on the mac_config() calling
> > > > > > behaviour.
> > > > > >
> > > > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > > > ---
> > > > > >  drivers/net/phy/phylink.c | 20 +++++++++++++++-----
> > > > > >  1 file changed, 15 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > > > > > index a935655c39c0..9f0f0e0aad55 100644
> > > > > > --- a/drivers/net/phy/phylink.c
> > > > > > +++ b/drivers/net/phy/phylink.c
> > > > > > @@ -1196,15 +1196,25 @@ EXPORT_SYMBOL_GPL(phylink_create);
> > > > > >   * in mac_prepare() or mac_config() methods if it is desired to dynamically
> > > > > >   * change the PCS.
> > > > > >   *
> > > > > > - * Please note that there are behavioural changes with the mac_config()
> > > > > > - * callback if a PCS is present (denoting a newer setup) so removing a PCS
> > > > > > - * is not supported, and if a PCS is going to be used, it must be registered
> > > > > > - * by calling phylink_set_pcs() at the latest in the first mac_config() call.
> > > > > > + * Please note that for legacy phylink users, there are behavioural changes
> > > > > > + * with the mac_config() callback if a PCS is present (denoting a newer setup)
> > > > > > + * so removing a PCS is not supported. If a PCS is going to be used, it must
> > > > > > + * be registered by calling phylink_set_pcs() at the latest in the first
> > > > > > + * mac_config() call.
> > > > > > + *
> > > > > > + * For modern drivers, this may be called with a NULL pcs argument to
> > > > > > + * disconnect the PCS from phylink.
> > > > > >   */
> > > > > >  void phylink_set_pcs(struct phylink *pl, struct phylink_pcs *pcs)
> > > > > >  {
> > > > > > +	if (pl->config->legacy_pre_march2020 && pl->pcs && !pcs) {
> > > > > > +		phylink_warn(pl,
> > > > > > +			     "Removing PCS is not supported in a legacy driver");
> > > > > > +		return;
> > > > > > +	}
> > > > > > +
> > > > > >  	pl->pcs = pcs;
> > > > > > -	pl->pcs_ops = pcs->ops;
> > > > > > +	pl->pcs_ops = pcs ? pcs->ops : NULL;
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(phylink_set_pcs);
> > > > > >
> > > > > > --
> > > > > > 2.30.2
> > > > > >
> > > > >
> > > > > I've read the discussion at
> > > > > https://lore.kernel.org/netdev/cfcb368f-a785-9ea5-c446-1906eacd8c03@seco.com/
> > > > > and I still am not sure that I understand what is the use case behind
> > > > > removing a PCS?
> > > >
> > > > Passing that to Sean to answer in detail...
> > > 
> > > My original feedback was regarding selecting the correct PCS to use. In
> > > response to the question "What PCS do you want to use for this phy
> > > interface mode?" a valid response is "I don't need a PCS," even if for a
> > > different mode a valid response might be "Please use X PCS."
> > 
> > Yes, but that is not a reason why you'd want to _remove_ one. Just don't
> > call phylink_set_pcs() in the first place, there you go, no PCS.
> 
> Yeah.
> 
> > > Because this function is used in validate(), it is necessary to
> > > evaluate "what-if" scenarios, even if a scenario requiring a PCS and
> > > one requiring no PCS would never actually be configured.
> > 
> > Yes, but on the same port on the same board? The MAC-side PCS is an
> > integral part of serial Ethernet links, be it modeled as a discrete part
> > by hardware manufacturers or not. We are effectively talking about a
> > situation where a serial link would become parallel, or the other way
> > around. Have you seen such a thing?
> 
> I have not. It's certainly possible to create (since the serial link
> often uses different physical pins from the parallel link). I think
> we can cross that bridge if/when we ever come to it.

So what do you mean, something like a MAC which can be routed dynamically
via pinctrl either to RGMII or to a SERDES lane? I would expect that
would require rather intricate interaction with the net device driver.
Can that be done today from user space, even in principle?

> > > Typically the PCS is physically attached to the next layer in the link,
> > > even if the hardware could be configured not to use the PCS. So it does
> > > not usually make sense to configure a link to use modes both requiring a
> > > PCS and requiring no PCS. However, it is possible that such a system
> > > could exist. Most systems should use `phy-mode` to restrict the phy
> > > interfaces modes to whatever makes sense for the board. I think Marek's
> > > series (and specifically [1]) is an good step in this regard.
> > > 
> > > --Sean
> > > 
> > > [1] https://lore.kernel.org/netdev/20211123164027.15618-5-kabel@kernel.org/
> > 
> > Marek's patches are for reconfiguring the SERDES protocol on the same
> > lanes. But the lanes are still physically there, and you'd need a PCS to
> > talk to them no matter what you do, they won't magically turn into RGMII.
> > If you need to switch the MAC PCS you're configuring with another MAC
> > PCS (within the same hardware block more or less) due to the fact that
> > the SERDES protocol is changing, that doesn't count as removing the PCS,
> > does it? Or what are you thinking of when you say PCS? Phylink doesn't
> > support any other kind of PCS than a MAC-side PCS.
> 
> I mean that with that patch applied, phylink will no longer try and
> validate modes which aren't supported on a particular board (see
> phylink_validate_any). Although, it looks like set_pcs never was called
> in the validate path in the first place (looks like I misremembered).

Sorry if you feel like I am asking too many questions. I just want to
understand what I'm being asked to review here :)

So going back to the initial question. What use case do these patches
help to make some progress with?

As far as I understand, being able to call phylink_set_pcs(NULL) is
basically the end goal of it. Sorry if I'm misinterpreting, Russell says
in the cover letter that "we now need to allow the PCS to be optional
for modern drivers". I really don't know how to interpret what
"optional" means. Just judging from that phrase, I don't interpret
"optional" as "having the ability to remove it dynamically", but rather
"the same driver can either interact with phylink using a pcs [on some
ports] or without a pcs [on other ports]".  But that deeply confuses me
because that's already supported, and many drivers make use of that
ability already, this is why the pl->pcs_ops checks are there.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
