Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B89C4828F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 20:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtBio0v+ckZMVzHGE2f3mvS0x3BswvLsGLfBWxz1JVI=; b=gc42kGAecKy/yeUtiiyl5P9wwF
	TXpzB/pbVTr5SHvrZ2Mm6lTlL/yHn4DvpLKGri2+fZzcqPA2IE2A6Lh8Z8y6VyLn03jh4rUVbHeHW
	YLVFWrTHtTwCr+fpvM3z3Z3kp1NzsTn8V0ZZCyk2GOR8+xTA0PPat1yvUuj68mhMfgBrCd/z3BKBU
	SjsR3QTEMcAcccrmOF2KIH1eFBM8xwTZg26upcr5IkIX1Vx92FSngG7OI3jTvQLAStLALBzDOdAry
	9uc+Ghzfinzz2UZgRChQsGiXFyJ1qBqC0jESL57R6N0SphxzoAuo1uQYJyKh+mzycDWPNIPnTJLIK
	kLL4gBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW0SB-0000000DPxd-2wGV;
	Fri, 02 Feb 2024 20:48:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVyS8-0000000Cvcs-0LBt;
	Fri, 02 Feb 2024 18:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qtBio0v+ckZMVzHGE2f3mvS0x3BswvLsGLfBWxz1JVI=; b=SNt8N0QRHTVp9FskAZzhtLOrAh
	AEiPGmKmYC7RG5MuRIyGL4/V//gOmIgTq66gKgBvRKoT71kYrwj6SlPtKFWlSarkrZv3Z6o8JKRaS
	4CfRC8qsqazrR/9U/bBJBazVtf4xRPPRglIUX0cpH+WYhv6OKuzMAq7MGbp1HewmynE2IvU3j76FR
	SIFhXrhrpxrC5EOFV6Wh5ryM8zVk2fUy/A65iTdC7jdkqPf3NZuLeYCOJ596BmkN8aEKrNgNbTQS1
	84HeGwANfOxemKiujPBbR1dgIa1fc9134u6w/Ybz0Ae2Z+F1KrGzoBXztpIk9eYhrGeLfa1RlQNxT
	v/Li59/w==;
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVyS3-0000000A9by-08tB;
	Fri, 02 Feb 2024 18:39:50 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rVyRe-0002Ew-3A;
	Fri, 02 Feb 2024 18:39:23 +0000
Date: Fri, 2 Feb 2024 18:39:18 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 4/7] net: dsa: mt7530: move XTAL check to
 mt7530_setup()
Message-ID: <Zb021ozEQSbU-gPd@makrotopia.org>
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
 <20240202-for-netnext-mt7530-improvements-2-v3-4-63d5adae99ca@arinc9.com>
 <ZbzWpmZrukknMsYf@shell.armlinux.org.uk>
 <5b744f7f-2f63-4219-a0e9-8f08267b1fdd@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b744f7f-2f63-4219-a0e9-8f08267b1fdd@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_183947_168767_09DF2EB9 
X-CRM114-Status: GOOD (  24.42  )
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

On Fri, Feb 02, 2024 at 09:16:02PM +0300, Arınç ÜNAL wrote:
> On 2.02.2024 14:48, Russell King (Oracle) wrote:
> > On Fri, Feb 02, 2024 at 12:19:10PM +0300, Arınç ÜNAL via B4 Relay wrote:
> > > From: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > 
> > > The crystal frequency concerns the switch core. The frequency should be
> > > checked when the switch is being set up so the driver can reject the
> > > unsupported hardware earlier and without requiring port 6 to be used.
> > > 
> > > Move it to mt7530_setup(). Drop the unnecessary function printing.
> > > 
> > > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > > Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> > 
> > I would prefer this to be earlier in the series, before patch 2 which
> > moves mt7530_setup_port6() to be called from mac_config(). mac_config()
> > is supposed to be configuration error-free - in other words, all state
> > should have been checked before hand.
> 
> I agree but mt7530_mac_config() is not a void function yet. The
> mac_port_config member of the mt753x_info structure points to this
> function. My next patch series gets rid of all useless error returns on the
> phylink path and change mac_port_config to void. So I don't think working
> on this patch series further will worth the effort. I'd rather have this
> version applied as is.

I agree regarding not changing the patch itself, but I also agree
with Russell regarding the patch ordering. I know it's a 10-minute
git headache to rebase the patches on top of each other in a different
order, but you can easily compare the end result being identical to
what you had before and hence don't need to retest.

