Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C9DC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ox5aOTl2u3/O1HZ+ZjOWh89n2x4TqGAsSONUIygHFgI=; b=RcoRO/gHGdSEw0mwRjWqLTPfUJ
	8xBkF0CtfZJO1zsWz5l36oN0e6adxFdlhDyA4LidEkDP3pw+N3RJVxjxJm3LzCp/FQwAdJ8Fg+riD
	pPmeNm5aevVbaCQIp5tMTIY/+Dz/FIHRDGkHasM5aoR8sajae/PT4auevOMveI7JVypFP+S2U4ULa
	2/NOYwhvCVp09UEU/dKNcnjttkeVb7TID6dcQPvxY2dgEAGYkDZRnY3b3J+9LqV/QWGJtHWt4XYN6
	rR/q8VluJphcKpc+EH8EbrtY2BQ0vQbIQ3RCXvVZ7ZPFO/2bGlmRQa19ZZngQdZjWvbskv4GR2Pu8
	IG4Gi0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Qnk-00000002sD9-0ym7;
	Mon, 29 Apr 2024 13:12:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Qne-00000002sAV-1FWH;
	Mon, 29 Apr 2024 13:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ox5aOTl2u3/O1HZ+ZjOWh89n2x4TqGAsSONUIygHFgI=; b=I0IvXxBCdTEiV8oJVfpfFuUtvt
	BExqcDkxn6HFrDIcmv5MVWJCgHmFydJw/wApnTjQU4ivtR6zuMuhbVHvgZIjhGQYoZUEobCybpZOR
	C8A07Z86xgAnGpUfyf2T/+/4rJWjGe7TstwmFZ8WgicG+kd+djDweRq1MV2AnJWfSFn2ODYc3uQ7L
	fwWFvVUY8MX+3C5038L54rPnenLAg92iwBdN/IjL+NYigOE2qmIqBRsNfBNsoaPpzx+VPX2HbK69N
	yIzu1aRRvWoaGRpIwuY6fdBm6KqzerhU5zevmY78awFLkLR9oUVyHi8qOIPWkdhdKCEx8A5imh8VY
	MDz52Dmg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60030)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s1QnV-0003Cq-2G;
	Mon, 29 Apr 2024 14:11:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s1QnV-0000sD-57; Mon, 29 Apr 2024 14:11:57 +0100
Date: Mon, 29 Apr 2024 14:11:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Boy Wu =?utf-8?B?KOWQs+WLg+iqvCk=?= <Boy.Wu@mediatek.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"andreyknvl@gmail.com" <andreyknvl@gmail.com>,
	"dvyukov@google.com" <dvyukov@google.com>,
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
	Iverlin Wang =?utf-8?B?KOeOi+iLs+mclik=?= <Iverlin.Wang@mediatek.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	Light Chen =?utf-8?B?KOmZs+aYseWFiSk=?= <Light.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"glider@google.com" <glider@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] arm: kasan: clear stale stack poison
Message-ID: <Zi+cnTPS1rgHtneN@shell.armlinux.org.uk>
References: <20240410073044.23294-1-boy.wu@mediatek.com>
 <CACRpkdZ5iK+LnQ0GJjZpxROCDT9GKVbe9m8hDSSh2eMXp3do0Q@mail.gmail.com>
 <Zi5hDV6e0oMTyFfr@shell.armlinux.org.uk>
 <292f9fe4bab26028aa80f63bf160e0f2b874a17c.camel@mediatek.com>
 <Zi+Vu29rmNZ0MIFG@shell.armlinux.org.uk>
 <f90f5352-30ed-419f-803b-7885b4298868@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f90f5352-30ed-419f-803b-7885b4298868@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_061209_019783_735BF2B0 
X-CRM114-Status: GOOD (  26.95  )
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

On Mon, Apr 29, 2024 at 02:57:35PM +0200, Andrey Ryabinin wrote:
> On 4/29/24 14:42, Russell King (Oracle) wrote:
> > On Mon, Apr 29, 2024 at 07:51:49AM +0000, Boy Wu (吳勃誼) wrote:
> >> On Sun, 2024-04-28 at 15:45 +0100, Russell King (Oracle) wrote:
> >>>  On Fri, Apr 12, 2024 at 10:37:06AM +0200, Linus Walleij wrote:
> >>>> On Wed, Apr 10, 2024 at 9:31 AM boy.wu <boy.wu@mediatek.com> wrote:
> >>>>
> >>>>> From: Boy Wu <boy.wu@mediatek.com>
> >>>>>
> >>>>> We found below OOB crash:
> >>>>
> >>>> Thanks for digging in!
> >>>>
> >>>> Pleas put this patch into Russell's patch tracker so he can apply
> >>> it:
> >>>> https://www.armlinux.org.uk/developer/patches/
> >>>
> >>> Is this a bug fix? If so, having a Fixes: tag would be nice...
> >>>
> >>
> >> This is a patch for cpuidle flow when KASAN enable, that is in ARM64
> >> but not in ARM, so add to ARM.
> >>
> >> The reference commits did not mention fix any commits.
> >> [1] commit 0d97e6d8024c ("arm64: kasan: clear stale stack poison")
> >> [2] commit d56a9ef84bd0 ("kasan, arm64: unpoison stack only with
> >> CONFIG_KASAN_STACK")
> > 
> > These are not suitable for use as a Fixes: tag because these commits
> > refer to code in another part of the tree that has nothing to do with
> > the BUG() dump that is contained within your commit message.
> > 
> > I ask again... Is this a bug fix?
> > 
> > Is it a regression?
> > 
> > Is it something that used to work that no longer works?
> > 
> > When did it break?
> > 
> > Has it always been broken?
> > 
> > Has it been broken since KASAN was introduced on 32-bit ARM?
> > 
> 
> Yes, this is a bug fix and it has been broken since KASAN was introduced on 32-bit ARM.
> So, I think this should be
> 	Fixes: 5615f69bc209 ("ARM: 9016/2: Initialize the mapping of KASan shadow memory")

Brilliant, thanks! Now merged.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

