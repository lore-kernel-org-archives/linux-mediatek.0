Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6DAC54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 15:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Hvf1kcJmMZrkquYolDkUWZ6BPu0lUrFynvcvJG0xU4=; b=Khqw8QxNrNKs0PvOe/mxTtswDC
	X7DCktalM4X9FdqXn+xDwzc445BOhlZVRVr7uPbRTf4HfEwDqRZQNspl/Kf3NBjp9hGUd5RLuhmVm
	r14LgdWOvxXyOZloO9Ps284ekII2P3bU7BqNANBNLR/I/DoTdxfbNxBbY7iQbsCh/TGmDgPyLEN0F
	WpUYgpcn+/kCAU0lsXci4Ytgqiwgpkzm2N8SxpZTELbBq+D8s+FmiO4U7WwMIrqUhjh+IO1ARA9ai
	78vgpB2LUflWNE4i3C8552I/OrY1j45ppEKRbmp3ht8mRt5oH2CvZnxHaVPozMU7hrX72wgcNe03Z
	sfJXACfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVgr-00000009x9O-12V9;
	Wed, 27 Mar 2024 15:59:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVgo-00000009x8F-1JjQ;
	Wed, 27 Mar 2024 15:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9Hvf1kcJmMZrkquYolDkUWZ6BPu0lUrFynvcvJG0xU4=; b=ueCJTHB3QmDBFaPEuyAeiwiH/E
	Q/8fENuaqGIo59TZdVSa80uVHGnoY4pzx49BZD0ZJ/lDi8k+v0s4lAPIlUKsjjPW2RxTi0s+IVQIs
	QTd9qIh4CrTdxEVcLqwXXrRQs5MuvqhSD0FoLQxxuDD5El7u6Ei7h03LPrxS+An1OcRwh744WYsm0
	87egy56dFPwRgzwnV98KXH67J6F3Q4s2qzGbtAwsnYq9jMbztNdN+6wPwYkpi/Rp6CDBIqAnISr69
	hBosEtc27jhOWJNMHBDbHuakbdknuuoj8l/+ucRcOzSqLbAUs9CLWckom+zs9+bPcxt/K3OiorJOl
	LEL47uUQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47908)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rpVgc-0007Ef-1h;
	Wed, 27 Mar 2024 15:59:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rpVgb-00010G-Qi; Wed, 27 Mar 2024 15:59:33 +0000
Date: Wed, 27 Mar 2024 15:59:33 +0000
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
Message-ID: <ZgRCZSBniraUCuT2@shell.armlinux.org.uk>
References: <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-0-9af9d5041bfe@arinc9.com>
 <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-2-9af9d5041bfe@arinc9.com>
 <799572b672ea8b4756236b14068aef7c8fa726a6.camel@redhat.com>
 <d65f4c45-e616-4157-a769-c285cbad575c@arinc9.com>
 <530da7c1-c058-44ef-84fd-86ff58f1501b@arinc9.com>
 <ZgRCFZBFvNSZ1a2U@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgRCFZBFvNSZ1a2U@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_085946_378292_1CE4FA4B 
X-CRM114-Status: GOOD (  34.37  )
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

On Wed, Mar 27, 2024 at 03:58:13PM +0000, Russell King (Oracle) wrote:
> On Wed, Mar 27, 2024 at 11:46:19AM +0300, arinc.unal@arinc9.com wrote:
> > On 26.03.2024 12:19, Arınç ÜNAL wrote:
> > > On 26.03.2024 12:02, Paolo Abeni wrote:
> > > > If I read the past discussion correctly, this is a potential issue
> > > > found by code inspection and never producing problem in practice, am I
> > > > correct?
> > > > 
> > > > If so I think it will deserve a 3rd party tested-by tag or similar to
> > > > go in.
> > > > 
> > > > If nobody could provide such feedback in a little time, I suggest to
> > > > drop this patch and apply only 1/2.
> > > 
> > > Whether a problem would happen in practice depends on when
> > > phy_init_eee()
> > > fails, meaning it returns a negative non-zero code. I requested Russell
> > > to
> > > review this patch to shed light on when phy_init_eee() would return a
> > > negative non-zero code so we have an idea whether this patch actually
> > > fixes
> > > a problem.
> > 
> > I don't suppose Russell is going to review the patch at this point. I will
> > submit this to net-next then. If someone actually reports a problem in
> > practice, I can always submit it to the stable trees.
> 
> So the fact that I only saw your request this morning to look at
> phy_init_eee(), and to review this patch... because... I work for
> Oracle, and I've been looking at backporting Arm64 KVM patches to
> our kernel, been testing and debugging that effort... and the
> act that less than 24 hours had passed since you made the original
> request... yea, sorry, it's clearly my fault for not jumping on this
> the moment you sent the email.
> 
> I get _so_ much email that incorrectly has me in the To: header. I
> also get _so_ much email that fails to list me in the To: header
> when the author wants me to respond. I don't have time to read every
> email as it comes in. I certainly don't have time to read every
> email in any case. I do the best I can, which varies considerably
> with my workload.
> 
> I already find that being single, fitting everything in during the
> day (paid work, chores, feeding oneself) is quite a mammoth task.
> There is no one else to do the laundry. There is no one else to get
> the shopping. There is no one else to do the washing up. There is no
> one else to take the rubbish out. All this I do myself, and serially
> because there is only one of me, and it all takes time away from
> sitting here reading every damn email as it comes in.
> 
> And then when I end up doing something that _you_ very well could do
> (reading the phy_init_eee() code to find out when it might return a
> negative number) and then you send an email like this... yea... that
> really gets my goat.

... and now I have a 1:1 with my manager for the next 30-60 minutes.
Is it okay by you for me to be offline for that period of time while
I have a chat with him?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

