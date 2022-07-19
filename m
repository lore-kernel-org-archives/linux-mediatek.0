Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE63C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 23:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAsVG6vHuHUdQms58NLVb9AElblSH0zMsR0cP5n0bt4=; b=1ZpUNG5r/JmczQ58xxGySaudua
	cd2JwSLQEBOaZvmTRtGJgbACnorSGhfwuk7XBlj7OwyPleMpB+P15iNjXHU/u3FA5pdoXZJy2qD2m
	vIobhL7GzuUy0wosbygUGifJKsITKhCwlYqzr0CeorTuHr+1RHy4dtixgZh4Rho8TW3sMQjadPVMt
	+FLX7K/tmTIYdg6/AYcdQta/eSrxzjJItkkcvS9trfpEgCy2qvAi4xJ8Rdlx60ICOeCHKUyK6wKpW
	wLawT2pLfp6S1BGXQXMbR8Qz6/Dg/5GeBNTjdpJYB2hTayUVg+TAvxhe4uXLIMwko9X8e5h2aIc0W
	2M4kPKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDwPq-00EKHv-Jq; Tue, 19 Jul 2022 23:14:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDwPf-00EK8t-5p; Tue, 19 Jul 2022 23:14:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF39C60E08;
	Tue, 19 Jul 2022 23:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B1FC341C6;
	Tue, 19 Jul 2022 23:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1658272437;
	bh=L5uy3KHKIgaKuNoQ+k1PIKdYCBx322IETWpRn30VZL8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vS3AUKtyvUDiPNJUpNWXZbpJc3ggvVA8/DDdq9XUpTgTaxTdfTUBYHI/0xA3Yg3py
	 Emrhi7WHgQoD9OaUgIet25oA0aytcS1SHctEHD34nvX4Y63rBLFOfljturqf1HNx+8
	 BI9olIM2Q6hqRLmbHPfI7Ww+rPDEOx98r7mgb+fk=
Date: Tue, 19 Jul 2022 16:13:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Marco Elver <elver@google.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, yee.lee@mediatek.com, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Alexander Potapenko <glider@google.com>, Dmitry
 Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:KFENCE" <kasan-dev@googlegroups.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Dave Hansen
 <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2 1/1] mm: kfence: apply kmemleak_ignore_phys on early
 allocated pool
Message-Id: <20220719161356.df8d7f6fc5414cc9cc7f8302@linux-foundation.org>
In-Reply-To: <CANpmjNPhhPUZFSZaLbwyJfACWMOqFchvm-Sx+iwGSM3sxkky8Q@mail.gmail.com>
References: <20220628113714.7792-1-yee.lee@mediatek.com>
	<20220628113714.7792-2-yee.lee@mediatek.com>
	<CAMuHMdX=MTsmo5ZVa8ya3xmr4Mx7f0PB3gvFF42pdaTYB6-u5A@mail.gmail.com>
	<20220715163305.e70c8542d5e7d96c5fd87185@linux-foundation.org>
	<CAMuHMdWSsibmL=LauLm+OTn0SByLA4tGsbhbMsnvSRdb381RTQ@mail.gmail.com>
	<CANpmjNPhhPUZFSZaLbwyJfACWMOqFchvm-Sx+iwGSM3sxkky8Q@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_161359_319070_75F27DB1 
X-CRM114-Status: GOOD (  19.35  )
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

On Mon, 18 Jul 2022 16:26:25 +0200 Marco Elver <elver@google.com> wrote:

> On Sat, 16 Jul 2022 at 20:43, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> [...]
> > > - This patch has been accused of crashing the kernel:
> > >
> > >         https://lkml.kernel.org/r/YsFeUHkrFTQ7T51Q@xsang-OptiPlex-9020
> > >
> > >   Do we think that report is bogus?
> >
> > I think all of this is highly architecture-specific...
> 
> The report can be reproduced on i386 with CONFIG_X86_PAE=y. But e.g.
> mm/memblock.c:memblock_free() is also guilty of using __pa() on
> previously memblock_alloc()'d addresses. Looking at the phys addr
> before memblock_alloc() does virt_to_phys(), the result of __pa()
> looks correct even on PAE, at least for the purpose of passing it on
> to kmemleak(). So I don't know what that BUG_ON(slow_virt_to_phys() !=
> phys_addr) is supposed to tell us here.
> 

It's only been nine years, so I'm sure Dave can remember why he added
it ;)

		BUG_ON(slow_virt_to_phys((void *)x) != phys_addr);

in arch/x86/mm/physaddr.c:__phys_addr().


This kfence patch does seem to be desirable, but we can't proceed if
it's resulting in kernel crashes.


