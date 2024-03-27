Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872E9C54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKuUY8oYVWK3ibGLu4p+RahdQ08L6ev0YrXnh1poFUA=; b=eYkLe/J5QD7lCpjkhwLZklzuIh
	X4/6v1+Emv+FaTdOxOyGyN4r0Dr65EDaKy/m8i2EA4fvaMrjJ2Sta7QWYHsNdgSzalhUUxdTwnJOP
	zY7kMO1XKXIseT+xdMk9LPOOCQF6RHf1vOxCDXVgdpMhOdMxOCHMxy222OdD0x7IcjoxVW91FL24Y
	eCpt2sQur1UwvfcdpPNACR3Q6vkIBDoqiAXVgGn0AEgEJt0TwEl6IZF0RzX8PsOG+PS6Pg2QtneUx
	DrVZQ4ZALVlLRRbO7pa/nDChMQ2sR/ynKvsL+jjIegrCj2bUEkkMbomDnIbWo+2QMgg71ASJEga+6
	936JeZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVfh-00000009wtY-3vFm;
	Wed, 27 Mar 2024 15:58:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVfc-00000009wpd-1m3Q;
	Wed, 27 Mar 2024 15:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HKuUY8oYVWK3ibGLu4p+RahdQ08L6ev0YrXnh1poFUA=; b=IIWlnOIabH1NmHfb9fNpV1Ddgl
	o18yM5tKlrmhkDUkvWpPIQkBFS9NA9LWXK9y+jGiVUVifXFBnWSObSx5Y7AZVJn9u70BXGBCKWN2a
	8wmpaL9GM6TsAUa7e5NQ2SAqei9sSIo95jgiU/izJt6Bl/qT6/MBuXgHWa1cBeR5k/rsjpBSZ1do/
	p+HiC3qK9yBuROvdIoc1vCjMe2pDzw4je2dtz1gE0+8CcwVwULtcPGC1MUd5DixWVXnTpARiJVkdg
	ophN+HaUMCjTKr3MD6SihOz0VZTGpA4NLzC6RJ9FR1cEpboAbXQZhO/8yV0TIlSfLJcpgg6cBIqRm
	j/h3b91g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44886)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rpVfL-0007E7-1F;
	Wed, 27 Mar 2024 15:58:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rpVfJ-000109-94; Wed, 27 Mar 2024 15:58:13 +0000
Date: Wed, 27 Mar 2024 15:58:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: arinc.unal@arinc9.com
Cc: Paolo Abeni <pabeni@redhat.com>, Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
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
Subject: Re: [PATCH net v2 2/2] net: dsa: mt7530: fix disabling EEE on
 failure on MT7531 and MT7988
Message-ID: <ZgRCFZBFvNSZ1a2U@shell.armlinux.org.uk>
References: <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-0-9af9d5041bfe@arinc9.com>
 <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-2-9af9d5041bfe@arinc9.com>
 <799572b672ea8b4756236b14068aef7c8fa726a6.camel@redhat.com>
 <d65f4c45-e616-4157-a769-c285cbad575c@arinc9.com>
 <530da7c1-c058-44ef-84fd-86ff58f1501b@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <530da7c1-c058-44ef-84fd-86ff58f1501b@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_085832_523781_E4D6E1BA 
X-CRM114-Status: GOOD (  26.37  )
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

On Wed, Mar 27, 2024 at 11:46:19AM +0300, arinc.unal@arinc9.com wrote:
> On 26.03.2024 12:19, Arınç ÜNAL wrote:
> > On 26.03.2024 12:02, Paolo Abeni wrote:
> > > If I read the past discussion correctly, this is a potential issue
> > > found by code inspection and never producing problem in practice, am I
> > > correct?
> > > 
> > > If so I think it will deserve a 3rd party tested-by tag or similar to
> > > go in.
> > > 
> > > If nobody could provide such feedback in a little time, I suggest to
> > > drop this patch and apply only 1/2.
> > 
> > Whether a problem would happen in practice depends on when
> > phy_init_eee()
> > fails, meaning it returns a negative non-zero code. I requested Russell
> > to
> > review this patch to shed light on when phy_init_eee() would return a
> > negative non-zero code so we have an idea whether this patch actually
> > fixes
> > a problem.
> 
> I don't suppose Russell is going to review the patch at this point. I will
> submit this to net-next then. If someone actually reports a problem in
> practice, I can always submit it to the stable trees.

So the fact that I only saw your request this morning to look at
phy_init_eee(), and to review this patch... because... I work for
Oracle, and I've been looking at backporting Arm64 KVM patches to
our kernel, been testing and debugging that effort... and the
act that less than 24 hours had passed since you made the original
request... yea, sorry, it's clearly my fault for not jumping on this
the moment you sent the email.

I get _so_ much email that incorrectly has me in the To: header. I
also get _so_ much email that fails to list me in the To: header
when the author wants me to respond. I don't have time to read every
email as it comes in. I certainly don't have time to read every
email in any case. I do the best I can, which varies considerably
with my workload.

I already find that being single, fitting everything in during the
day (paid work, chores, feeding oneself) is quite a mammoth task.
There is no one else to do the laundry. There is no one else to get
the shopping. There is no one else to do the washing up. There is no
one else to take the rubbish out. All this I do myself, and serially
because there is only one of me, and it all takes time away from
sitting here reading every damn email as it comes in.

And then when I end up doing something that _you_ very well could do
(reading the phy_init_eee() code to find out when it might return a
negative number) and then you send an email like this... yea... that
really gets my goat.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

