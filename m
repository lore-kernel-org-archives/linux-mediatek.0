Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D05C433C1
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 09:46:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9D7619FF
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 09:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD9D7619FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fKcSTxe+10kaookcHSUdg3ZhrK3VkJT+ZD1MVpsycWE=; b=BNRCGgihn/k3aeHtBTFDtEeJO
	vX6pzYJoIvFC068VJFhfuJniNwr1neBME2eV5SbFO/vJ3xTsmHAQL4ElX6UGnJh0/PaZyHx6c6Toa
	eSqX8N4RfpLGVFdEFeQ0CfVZbPHJC/4a3hyutjhRLt1O/0bGY1OMSBdiyamSK7q8A0MH4mrkvwiWC
	Yb2OGgFdPsJ39JQhAqsGim+ZGMgMFGzt78cP1CBBDXfycrBtaCtbU6bDq4YyOpJk71lOyASJ+hr5g
	iT70Zk0msw1c6LvD1v+O4hw4MWN8YvbVQ04zNyVSCu+eg5AaFIdyjidJAShuLQuZky/9EA0GdZ4i3
	ee7brw91A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQ5Wi-004xzy-I4; Sat, 27 Mar 2021 09:46:40 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQ5Wf-004xzP-2u; Sat, 27 Mar 2021 09:46:39 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1lQ5Wa-0005A7-00; Sat, 27 Mar 2021 10:46:32 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 8B16FC1D8B; Sat, 27 Mar 2021 10:46:20 +0100 (CET)
Date: Sat, 27 Mar 2021 10:46:20 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Chuanhong Guo <gch981213@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: ralink: mt7621: add memory detection support
Message-ID: <20210327094620.GA4320@alpha.franken.de>
References: <20210317055902.506773-1-ilya.lipnitskiy@gmail.com>
 <20210325095529.GA5775@alpha.franken.de>
 <CALCv0x2ni97mLEar6M9boWCrXzdsqM3JJNMbe=cDitHj+npanw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCv0x2ni97mLEar6M9boWCrXzdsqM3JJNMbe=cDitHj+npanw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_094637_319716_567FED7A 
X-CRM114-Status: GOOD (  24.44  )
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

On Thu, Mar 25, 2021 at 07:45:23PM -0700, Ilya Lipnitskiy wrote:
> On Thu, Mar 25, 2021 at 3:01 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Tue, Mar 16, 2021 at 10:59:02PM -0700, Ilya Lipnitskiy wrote:
> > > From: Chuanhong Guo <gch981213@gmail.com>
> > >
> > > mt7621 has the following memory map:
> > > 0x0-0x1c000000: lower 448m memory
> > > 0x1c000000-0x2000000: peripheral registers
> > > 0x20000000-0x2400000: higher 64m memory
> > >
> > > detect_memory_region in arch/mips/kernel/setup.c only adds the first
> > > memory region and isn't suitable for 512m memory detection because
> > > it may accidentally read the memory area for peripheral registers.
> > >
> > > This commit adds memory detection capability for mt7621:
> > >   1. Add the highmem area when 512m is detected.
> > >   2. Guard memcmp from accessing peripheral registers:
> > >      This only happens when a user decided to change kernel load address
> > >      to 256m or higher address. Since this is a quite unusual case, we
> > >      just skip 512m testing and return 256m as memory size.
> > >
> > > [...]
> >
> > I get
> >
> > WARNING: modpost: vmlinux.o(.text+0x132c): Section mismatch in reference from the function prom_soc_init() to the function .init.text:mt7621_memory_detect()
> > The function prom_soc_init() references
> > the function __init mt7621_memory_detect().
> > This is often because prom_soc_init lacks a __init
> > annotation or the annotation of mt7621_memory_detect is wrong.
> >
> > Can you please fix this ?
> Thanks, I will fix it. Having trouble reproducing the error, but I
> clearly see the issue. Are you building on a MIPS target or
> cross-compiling (I'm cross-compiling and no errors).

I'm cross compiling, I can provide you the .config, if you want.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
