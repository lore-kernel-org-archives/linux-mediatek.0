Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD59BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 16:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXfri8X1mt3upijr76zuF+lCVl9hCtg0JN1LpmBoK5c=; b=BqZ6ab5PZUdrT3
	3DoEogNgOHCzravtpENgtb4AKK+L57LXxTsvDAFtmiQgN+E+WJZUofucSa/wUbtjjN3EL6SOhoSGo
	QAVLEtXXf6BM2oQ5xNFzM0XWtaOVcZ4M222x2UFb6OQmFzWL0UhLMdWeSyBqDJfBsl502BiTw5IbZ
	ScOxAqIVfkrQCWDpG6Rrp9bPwcsCrTXsMy36q6CuX9hp4AObW8khct4JFftfsAxeqBqwZ3CjuyY+f
	4R3CQzUF1Wf0RYhaHrE/0yKum784svfSv9v3yCBravxEpSf1CjNKx9jDMHpx1aEhBVWn45OrHJb+W
	RiyBXVkJEDwx+eT1FXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpYLY-002oTl-AH; Tue, 23 Nov 2021 16:08:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpYLL-002oRC-Ec; Tue, 23 Nov 2021 16:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=twcwpuMueGYyjGyqVQIkI89HletvDrqkckGMX3j3kIw=; b=iSfGjINe0V3k78UXkOxUHZBKn/
 I5KMYPNvZ+XSkR3plj9wNhEcrxOnuSy3ocukDF2A/+62bpUHmvgohUf7McVxWz6jdrYve+wLs396G
 F7lXYnKuNmWEJqmwfWRixLG4tDhkc++Xtosa3RkVRD0ZTltazFNEPttsCI+b/PxIdEvCOTgRdHEzQ
 skYandIT9Ewys+gFfFOHNXB08ecmQSKF+h1ZTVVbjyrQwUsvf5N3Aa5cY0tA0S+mkOL4yrWySQ7J1
 QNzUVWukITuBCNXANwHo0uskRWBMAjNQ7eK8nUNTFckfzep/U0G2QQelpJEXrUJtYvpVmvFqevzr8
 oeH2UhlA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55820)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mpYL7-000867-S2; Tue, 23 Nov 2021 16:08:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mpYL3-0000LS-8c; Tue, 23 Nov 2021 16:08:09 +0000
Date: Tue, 23 Nov 2021 16:08:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>, Sean Anderson <sean.anderson@seco.com>
Cc: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
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
Message-ID: <YZ0R6T33DNTW80SU@shell.armlinux.org.uk>
References: <YZy59OTNCpKoPZT/@shell.armlinux.org.uk>
 <E1mpSba-00BXp6-9e@rmk-PC.armlinux.org.uk>
 <20211123120825.jvuh7444wdxzugbo@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211123120825.jvuh7444wdxzugbo@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_080827_667087_FD845016 
X-CRM114-Status: GOOD (  29.68  )
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

On Tue, Nov 23, 2021 at 02:08:25PM +0200, Vladimir Oltean wrote:
> On Tue, Nov 23, 2021 at 10:00:50AM +0000, Russell King (Oracle) wrote:
> > Allow phylink_set_pcs() to be called with a NULL pcs argument to remove
> > the PCS from phylink. This is only supported on non-legacy drivers
> > where doing so will have no effect on the mac_config() calling
> > behaviour.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/phy/phylink.c | 20 +++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index a935655c39c0..9f0f0e0aad55 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -1196,15 +1196,25 @@ EXPORT_SYMBOL_GPL(phylink_create);
> >   * in mac_prepare() or mac_config() methods if it is desired to dynamically
> >   * change the PCS.
> >   *
> > - * Please note that there are behavioural changes with the mac_config()
> > - * callback if a PCS is present (denoting a newer setup) so removing a PCS
> > - * is not supported, and if a PCS is going to be used, it must be registered
> > - * by calling phylink_set_pcs() at the latest in the first mac_config() call.
> > + * Please note that for legacy phylink users, there are behavioural changes
> > + * with the mac_config() callback if a PCS is present (denoting a newer setup)
> > + * so removing a PCS is not supported. If a PCS is going to be used, it must
> > + * be registered by calling phylink_set_pcs() at the latest in the first
> > + * mac_config() call.
> > + *
> > + * For modern drivers, this may be called with a NULL pcs argument to
> > + * disconnect the PCS from phylink.
> >   */
> >  void phylink_set_pcs(struct phylink *pl, struct phylink_pcs *pcs)
> >  {
> > +	if (pl->config->legacy_pre_march2020 && pl->pcs && !pcs) {
> > +		phylink_warn(pl,
> > +			     "Removing PCS is not supported in a legacy driver");
> > +		return;
> > +	}
> > +
> >  	pl->pcs = pcs;
> > -	pl->pcs_ops = pcs->ops;
> > +	pl->pcs_ops = pcs ? pcs->ops : NULL;
> >  }
> >  EXPORT_SYMBOL_GPL(phylink_set_pcs);
> >  
> > -- 
> > 2.30.2
> > 
> 
> I've read the discussion at
> https://lore.kernel.org/netdev/cfcb368f-a785-9ea5-c446-1906eacd8c03@seco.com/
> and I still am not sure that I understand what is the use case behind
> removing a PCS?

Passing that to Sean to answer in detail...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
