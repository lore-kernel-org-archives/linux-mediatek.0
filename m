Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F16C3A59D
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 19:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQjToe71/3neoNKh3ZLmv1NTQ2Vf1kBOZgS83ngTOyA=; b=HudL9PKOJUQUBxmrntq3ZNhbMP
	wpvNFUQkS+D0+XmRjrNMyIj9BdQZ6BGHzdCAsL47Kxpcq+uiQcXrnFiowo6G9fF69mfaZq1ZXFjSn
	PfYvPMJO1u2TnBlusF999u5T1M4Hs6szh7LF6Jwd8HZN/bd4h0tW82yUr4K7O3lPDx5pX95UxaklU
	LltTNBhEx74zY6cpEDQ4+Cu0jvS/lvZUiagS90S8IaTL+0F6x5nbLtffi/C3P0F3rJ/GB6SQdxXjQ
	0NjIfqnCzOeu3UDBmMwLHKgRLyWDAtYaYyuD2wvmC8yS+ZDNrsSDkXmf4STWVyBjR6ZJlYMHR40D/
	azEbnp6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omK19-00DcBM-PZ; Sat, 22 Oct 2022 19:18:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omK16-00Dc9Z-8H; Sat, 22 Oct 2022 19:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nQjToe71/3neoNKh3ZLmv1NTQ2Vf1kBOZgS83ngTOyA=; b=lk8NJ5WkrPCv8v3ZlQWqMkxI7n
	mYoAqqNPOFX522TS2vZQIjfRGuX8OGJ9dM1S98/kQQs7fo09VLCHz++222zIqnCFkKmTMveuSEvXC
	HVE91sBFfGTP8IrdqwdTL9Kqmc7gUcXyYKug3hzL6kwxw7Jpbsbm+M/4ev6Rxn9YSg9aOoIih2ssw
	tNT/AD+Qfpk+yRiYYZPFVfaJcjKRowNy++EDc1kl+YBi/GtfvrPhZJx56Koz95rRHl59AIJ/tp93m
	DDf23xVaWeYyOVrRjikxyyqXJEmi8OkIjPdf86jMz2so1GkziZmduxWN4RBk+0WupFXHArezPSrlL
	9tNmTz+g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34894)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1omK0t-0001Wy-NS; Sat, 22 Oct 2022 20:18:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1omK0p-0005LM-AI; Sat, 22 Oct 2022 20:18:27 +0100
Date: Sat, 22 Oct 2022 20:18:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
	Alexander Couzens <lynxis@fe80.eu>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: Re: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Message-ID: <Y1RCA+l2OHkrFfhB@shell.armlinux.org.uk>
References: <Y1JhEWU5Ac6kd2ne@shell.armlinux.org.uk>
 <trinity-e60759de-3f0f-4b1e-bc0f-b33c4f8ac201-1666374467573@3c-app-gmx-bap55>
 <Y1LlnMdm8pGVXC6d@shell.armlinux.org.uk>
 <trinity-b567c57e-b87f-4fe8-acf7-5c9020f85aed-1666381956560@3c-app-gmx-bap55>
 <Y1MO6cyuVtFxTGuP@shell.armlinux.org.uk>
 <9BC397B2-3E0B-4687-99E5-B15472A1762B@fw-web.de>
 <Y1Ozp2ASm2Y+if3Q@shell.armlinux.org.uk>
 <trinity-4470b00b-771b-466e-9f3a-a3df72758208-1666435920485@3c-app-gmx-bs49>
 <Y1Qi55IwJZulL1X/@shell.armlinux.org.uk>
 <trinity-164dc5a6-98ce-464c-a43d-b00b91ca69e5-1666461195968@3c-app-gmx-bs49>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-164dc5a6-98ce-464c-a43d-b00b91ca69e5-1666461195968@3c-app-gmx-bs49>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_121844_322191_7A11C294 
X-CRM114-Status: GOOD (  36.45  )
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

Hi,

On Sat, Oct 22, 2022 at 07:53:16PM +0200, Frank Wunderlich wrote:
> > Gesendet: Samstag, 22. Oktober 2022 um 19:05 Uhr
> > Von: "Russell King (Oracle)" <linux@armlinux.org.uk>
> > On Sat, Oct 22, 2022 at 12:52:00PM +0200, Frank Wunderlich wrote:
> > > > Gesendet: Samstag, 22. Oktober 2022 um 11:11 Uhr
> > > > Von: "Russell King (Oracle)" <linux@armlinux.org.uk>
> 
> > > this patch breaks connectivity at least on the sfp-port (eth1).
> 
> > > pcs_get_state
> > > [   65.522936] offset:0 0x2c1140
> > > [   65.522950] offset:4 0x4d544950
> > > [   65.525914] offset:8 0x40e041a0
> > > [  177.346183] offset:0 0x2c1140
> > > [  177.346202] offset:4 0x4d544950
> > > [  177.349168] offset:8 0x40e041a0
> > > [  177.352477] offset:0 0x2c1140
> > > [  177.356952] offset:4 0x4d544950
> >
> > Hi,
> >
> > Thanks. Well, the results suggest that the register at offset 8 is
> > indeed the advertisement and link-partner advertisement register. So
> > we have a bit of progress and a little more understanding of this
> > hardware.
> >
> > Do you know if your link partner also thinks the link is up?
> 
> yes link is up on my switch, cannot enable autoneg for fibre-port, so port is fixed to 1000M/full flowcontrol enabled.
> 
> > What I notice is:
> >
> > mtk_soc_eth 15100000.ethernet eth1: Link is Up - 1Gbps/Unknown - flow control off
> >
> > The duplex is "unknown" which means you're not filling in the
> > state->duplex field in your pcs_get_state() function. Given the
> > link parter adverisement is 0x00e0, this means the link partner
> > supports PAUSE, 1000base-X/Half and 1000base-X/Full. The resolution
> > is therefore full duplex, so can we hack that in to your
> > pcs_get_state() so we're getting that right for this testing please?
> 
> 0xe0 is bits 5-7 are set (in lower byte from upper word)..which one is for duplex?
> 
> so i should set state->duplex/pause based on this value (maybe compare with own caps)?
> 
> found a documentation where 5=full,6=half, and bits 7+8 are for pause (symetric/asymetric)
> 
> regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1+8, &val);
> partner_advertising = (val & 0x00ff0000) >> 16;

Not quite :) When we have the link partner's advertisement and the BMSR,
we have a helper function in phylink to do all the gritty work:

	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &bm);
	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1 + 8, &adv);

	phylink_mii_c22_pcs_decode_state(state, bm >> 16, adv >> 16);

will do all the work for you without having to care about whether
you're operating at 2500base-X, 1000base-X or SGMII mode.

> > Now, I'm wondering what SGMII_IF_MODE_BIT0 and SGMII_IF_MODE_BIT5 do
> > in the SGMSYS_SGMII_MODE register. Does one of these bits set the
> > format for the 16-bit control word that's used to convey the
> > advertisements. I think the next step would be to play around with
> > these and see what effect setting or clearing these bits has -
> > please can you give that a go?
> 
> these is not clear to me...should i blindly set these and how to
> verify what they do?

Yes please - I don't think anyone knows what they do.

> is network broken because of wrong duplex/pause setting? do not
> fully understand your Patch.

I suspect not having the duplex correct _could_ break stuff, but I
also wonder whether the PCS is trying to decode the advertisements
itself and coming out with the wrong settings.

If it's interpreting a link partner advertisement of 0x00e0 using
SGMII rules, then it will be looking at bits 11 and 10 for the
speed, both of which are zero, which means 10Mbps - and 1000base-X
doesn't operate at 10Mbps!

So my hunch is that one of those two IF_MODE_BIT{0,5} _might_ change
the way the PCS interprets the control word, but as we don't have
any documentation to go on, only experimentation will answer this
question.

If these registers are MMIO, you could ensure that you have /dev/mem
access enabled, and use devmem2 to poke at this register which would
probably be quicker than doing a build-boot-test cycle with the
kernel - this is how I do a lot of this kind of discovery when
documentation is lacking.

> But the timer-change can also break sgmii...

SGMII mode should be writing the same value to the link timer, but
looking at it now, I see I ended up with one too many zeros on the
16000000! It should be 1.6ms in nanoseconds, so 1600000. Please
correct for future testing.

Many thanks for your patience.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

