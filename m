Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E091DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 08:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Kp5ZK1g8uj8bIL6ZegP+mwe/JJCNxCunC9BsESdgyE=; b=G78+q9sFwsjFRF
	dCqCtscPvUA3muMwVVgIE+k1bwG/prNE/c+uImOquWbarQSgxGUlBTTqMrzdC7UzJR4dJLcZXeuyE
	fUx5HB5pLSfLDIU+RNlv+s3i6Jt8BGmvyDmi8Uom+xsba2Jv17hIJy2s9Uy2ArJ599cQ0OUPGZFZ1
	0SqaAQ3xLoJhkCSGCKYNFBwf0uJTnP3mP0edEQcK+LcEgaIIeObZq2Cu+rRIPcy2Co8Lb2elMw5pm
	Pg0PTIlc1pHZ03jnM21IkEQbDv8FnzDHW0lW+SY6FfD1J611DyxE9ivlg+8fkNZcJJ8bYOSAOeGLs
	2U9tpkvEI72R+CpZPb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKbio-009K7a-6w; Thu, 17 Feb 2022 08:01:02 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKbgl-009IjF-II; Thu, 17 Feb 2022 07:58:57 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1nKbgi-0000vy-00; Thu, 17 Feb 2022 08:58:52 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 0B097C250A; Thu, 17 Feb 2022 08:58:30 +0100 (CET)
Date: Thu, 17 Feb 2022 08:58:29 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mips@vger.kernel.org, Rui Salvaterra <rsalvaterra@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: ralink: mt7621: do memory detection on KSEG1
Message-ID: <20220217075829.GA5185@alpha.franken.de>
References: <20220211001345.3429572-1-gch981213@gmail.com>
 <20220216195423.GA17551@alpha.franken.de>
 <CAJsYDVJw2DJX97cRwoAofzq_jL0GhyaC5j7UuT6OzC=Lp8WkSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJsYDVJw2DJX97cRwoAofzq_jL0GhyaC5j7UuT6OzC=Lp8WkSQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_235855_935292_3C294127 
X-CRM114-Status: GOOD (  25.37  )
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

On Thu, Feb 17, 2022 at 12:06:09PM +0800, Chuanhong Guo wrote:
> Hi!
> 
> On Thu, Feb 17, 2022 at 3:57 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Fri, Feb 11, 2022 at 08:13:44AM +0800, Chuanhong Guo wrote:
> > > It's reported that current memory detection code occasionally detects
> > > larger memory under some bootloaders.
> > > Current memory detection code tests whether address space wraps around
> > > on KSEG0, which is unreliable because it's cached.
> > >
> > > Rewrite memory size detection to perform the same test on KSEG1 instead.
> > > While at it, this patch also does the following two things:
> > > 1. use a fixed pattern instead of a random function pointer as the magic
> > >    value.
> > > 2. add an additional memory write and a second comparison as part of the
> > >    test to prevent possible smaller memory detection result due to
> > >    leftover values in memory.
> > >
> > > Fixes: 139c949f7f0a MIPS: ("ralink: mt7621: add memory detection support")
> > > Reported-by: Rui Salvaterra <rsalvaterra@gmail.com>
> > > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > > ---
> > >  arch/mips/ralink/mt7621.c | 36 +++++++++++++++++++++++-------------
> > >  1 file changed, 23 insertions(+), 13 deletions(-)
> >
> > applied to mips-fixes.
> 
> Oops.
> 
> As I mentioned in a previous mail, this patch has two cosmetic problems:
> 1. misplaced bracket in commit message "Fixes" tag
> 2. incorrect second test pattern: I meant to flip all the bits in the
> first pattern,
>    but I used "!" instead of "~". Any value will work just fine but it
> looks weird
>    to construct a zero using !MT7621_MEM_TEST_PATTERN.
> 
> Should I send a second patch to fix this patch or send a v2 of the
> original patch?

a second patch please.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
