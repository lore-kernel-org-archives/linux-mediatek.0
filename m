Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772ABC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 12:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=359x1PKhAyHtMkK/vfg2dPAMOncA3H2TWjtf6Bw1En4=; b=QV2DahfN0g6bb+wcn/I6sDp6Q3
	bgSqN7WgIZd6atCD4TJ3X3BwsrQLDmHO5x5lCIiQAQiXuH4fa0wSLuJjZ9eHgXYaDuGIJC8H+jfrP
	w+FnqOwVKd1Bw5XbXnuOuEACfCy3zbyQXOCw0rdLYmkpO9O3Ov9igca+1ruJ5PR6oeq+qW3dUlGkD
	m/ZJxXEesBEW/B3RiToHg5I4w4elSH/Le9tptmxxDhylShOZHqlLtibaVLfTIC1vDL4zUAmQQyvE1
	wZo5ai8Vhe1TX/r5xkExYt4oP6mcEO6nPoDLIuYVRTuv9MuciZFsHqtd6Mv9wWhCie4MVKpf6DKnS
	7SG1RcZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1QLK-00000002lX2-33tE;
	Mon, 29 Apr 2024 12:42:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1QLH-00000002lWY-1yD4;
	Mon, 29 Apr 2024 12:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=359x1PKhAyHtMkK/vfg2dPAMOncA3H2TWjtf6Bw1En4=; b=vYbycYWT4MBRluDs5xVIosCe64
	PoAiVqtvB/HQB7xzaPjqvvXwoJk7GZsxbrkQg4SeLfaY9e6Q/9QwK674915+AG/aqy5rAIy/fZdGI
	sr23cYjAxdQ2jSvbWcuxLmxJK4TFe2UqbsnOdSYc1lyJFum1Poq8h+zValqB+Op9LtF7B/0JNAj6f
	1367WEZ0biSe8kNKt/WHyA7wStFD2iZ/J3Wcuas4Qr6FefpCj6t6qMZ4Stcf/KqTgZmFi8R++jHBL
	6Ixq+5mv1xgFNPHDV239kY/XTgDiXBc0ymvAH4MoaBnXHuG7pLs8UiNqa8IAMiRyvBhUCalMSlGrk
	4UkxbCXw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38466)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s1QL7-0003AY-2P;
	Mon, 29 Apr 2024 13:42:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s1QL6-0000rC-48; Mon, 29 Apr 2024 13:42:36 +0100
Date: Mon, 29 Apr 2024 13:42:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Boy Wu =?utf-8?B?KOWQs+WLg+iqvCk=?= <Boy.Wu@mediatek.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"andreyknvl@gmail.com" <andreyknvl@gmail.com>,
	"dvyukov@google.com" <dvyukov@google.com>,
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
	Iverlin Wang =?utf-8?B?KOeOi+iLs+mclik=?= <Iverlin.Wang@mediatek.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	Light Chen =?utf-8?B?KOmZs+aYseWFiSk=?= <Light.Chen@mediatek.com>,
	"ryabinin.a.a@gmail.com" <ryabinin.a.a@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"glider@google.com" <glider@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] arm: kasan: clear stale stack poison
Message-ID: <Zi+Vu29rmNZ0MIFG@shell.armlinux.org.uk>
References: <20240410073044.23294-1-boy.wu@mediatek.com>
 <CACRpkdZ5iK+LnQ0GJjZpxROCDT9GKVbe9m8hDSSh2eMXp3do0Q@mail.gmail.com>
 <Zi5hDV6e0oMTyFfr@shell.armlinux.org.uk>
 <292f9fe4bab26028aa80f63bf160e0f2b874a17c.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <292f9fe4bab26028aa80f63bf160e0f2b874a17c.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_054247_538316_62C19C84 
X-CRM114-Status: GOOD (  22.48  )
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

On Mon, Apr 29, 2024 at 07:51:49AM +0000, Boy Wu (吳勃誼) wrote:
> On Sun, 2024-04-28 at 15:45 +0100, Russell King (Oracle) wrote:
> >  On Fri, Apr 12, 2024 at 10:37:06AM +0200, Linus Walleij wrote:
> > > On Wed, Apr 10, 2024 at 9:31 AM boy.wu <boy.wu@mediatek.com> wrote:
> > > 
> > > > From: Boy Wu <boy.wu@mediatek.com>
> > > >
> > > > We found below OOB crash:
> > > 
> > > Thanks for digging in!
> > > 
> > > Pleas put this patch into Russell's patch tracker so he can apply
> > it:
> > > https://www.armlinux.org.uk/developer/patches/
> > 
> > Is this a bug fix? If so, having a Fixes: tag would be nice...
> > 
> 
> This is a patch for cpuidle flow when KASAN enable, that is in ARM64
> but not in ARM, so add to ARM.
> 
> The reference commits did not mention fix any commits.
> [1] commit 0d97e6d8024c ("arm64: kasan: clear stale stack poison")
> [2] commit d56a9ef84bd0 ("kasan, arm64: unpoison stack only with
> CONFIG_KASAN_STACK")

These are not suitable for use as a Fixes: tag because these commits
refer to code in another part of the tree that has nothing to do with
the BUG() dump that is contained within your commit message.

I ask again... Is this a bug fix?

Is it a regression?

Is it something that used to work that no longer works?

When did it break?

Has it always been broken?

Has it been broken since KASAN was introduced on 32-bit ARM?

I'm not applying this commit until I get *proper* answers to these
questions so that I can work out whether this needs to go in -rc
or whether it waits until the next merge window... and whether it
needs a Fixes: tag or not.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

