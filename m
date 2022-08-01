Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E08DC00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5UhvGzRrQcBGCWtOdqFEgZwHRGSXUKRpcxRX6CD/7s=; b=vBpVAZ8DPgdTwx4Mev52uirmLG
	sTV8YESDm0Zks98iR16oDhy/mgsPPp+NfkWq8BEtMX3QcH/LQCc9xEdZkG6uFz+jmN1OYxnh42tbz
	qc/4Hrm241uVgDrfnTyv6SW4wAQ0YFufzHYgBOodK5VAANlxtyKPO7cboM1qDyrfou8Dwc6zj7jQh
	BrsxpbqpdH/jLe33oYJXbL5WMgg5VgMvQ015NdXqt2EGBDrv/CixrUTg0KrsnastM+lu7T/fkxheG
	mpCKWD/aBn6iRtKlEal66p2YUb0G4lVab/LOiYLazrVIIb6KipMulZNuHvrak4t9q0sj/p3FBLTvO
	fE+KVy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIW41-006vUZ-Pb; Mon, 01 Aug 2022 14:06:33 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIW3y-006vQe-PR
	for linux-mediatek@lists.infradead.org; Mon, 01 Aug 2022 14:06:32 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3238de26fb1so91570967b3.8
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Aug 2022 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G5UhvGzRrQcBGCWtOdqFEgZwHRGSXUKRpcxRX6CD/7s=;
        b=rAPWjvDI2x1MNj7Bu1CCOyfybJSBeCkfp/LO5TNPavNuMm1PCpq9vZac1affXCfVvt
         HfQUD8IDa7FYkHaDZMmcJgTJksD4uPs0blDFqQ4TqvxFRHM8ukS10lHLa+Zyoq/SswML
         dFVjUkxMDEro74y/G2bBenIgy9dTvbXgFbkcc5PnIJ+4PHL3ocZEDki/xulKClATsVTa
         8hSok7ks8K8ULZoPe5omstJhi8J3ZuM96/LSTUO/Sv9qL1U6a5psDTTSJObennoaI22A
         l4ANlFj4EZS+9RCDlPFPQfV+2r3BvdiPIQi/w8S3AYyLyMpIaQxPp6Uea92VnIcplfZ1
         WoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G5UhvGzRrQcBGCWtOdqFEgZwHRGSXUKRpcxRX6CD/7s=;
        b=ZBxnjgAyVdvBHpgCVeQ7KUNXZH/W5Ry4K98r9cy6rBR6QpX6ZOXhT1SBDFqkE1Ytd/
         HL478YMWz+h4kJXVAj9oGLG/y/tcPojV/XSTOy1EwBMMXRKGNCi89QbPQLe0oPgDS8j0
         jGUc0hoP59kfx18xVQwrpTRAFaNQEyNy4M91TXsByeQ/n/DIz1KjnGpG2Y7GXRbpINMG
         MFiSKSa0sZmTrRuZPD35W/7FuZzOZqo7bYlFKu/5Yky4oR1Kxztci/vx+Mdt0OQY1iGr
         0d6OI2mJ6fnhUh5pSqxtcMD5eC7I4WgB4NGC2kSdum3uh45LiBp9tyeJxHhKqchjtBj1
         Zh3w==
X-Gm-Message-State: ACgBeo3JwLNZWlyGi4UEC8EL2XQtASijKYA3dqp+u8f87LsYUx1xhYl4
	pZczTxf330vTmDzadSi6ICK4pW5GdODgFr5MbeWRdg==
X-Google-Smtp-Source: AA6agR6vW/VAc4Dmh2BSzM1CMV3dpkiThH+Yy3VeiFrVu6/wrlBxfsp4wfADdlQot0YVXYIc8OqwDm89KXSYApQ8LVE=
X-Received: by 2002:a0d:f045:0:b0:324:55ec:6595 with SMTP id
 z66-20020a0df045000000b0032455ec6595mr11570098ywe.255.1659362787035; Mon, 01
 Aug 2022 07:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220628113714.7792-1-yee.lee@mediatek.com> <20220628113714.7792-2-yee.lee@mediatek.com>
 <CAMuHMdX=MTsmo5ZVa8ya3xmr4Mx7f0PB3gvFF42pdaTYB6-u5A@mail.gmail.com>
 <20220715163305.e70c8542d5e7d96c5fd87185@linux-foundation.org>
 <CAMuHMdWSsibmL=LauLm+OTn0SByLA4tGsbhbMsnvSRdb381RTQ@mail.gmail.com>
 <CANpmjNPhhPUZFSZaLbwyJfACWMOqFchvm-Sx+iwGSM3sxkky8Q@mail.gmail.com>
 <20220719161356.df8d7f6fc5414cc9cc7f8302@linux-foundation.org> <dc7800c0-43f3-6453-ef5f-1ceb659062de@intel.com>
In-Reply-To: <dc7800c0-43f3-6453-ef5f-1ceb659062de@intel.com>
From: Marco Elver <elver@google.com>
Date: Mon, 1 Aug 2022 16:05:50 +0200
Message-ID: <CANpmjNNpvbBR6z0T7m1gCp1XoVOHN7CpHoauMKLvtFd5NYJK2Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm: kfence: apply kmemleak_ignore_phys on early
 allocated pool
To: Dave Hansen <dave.hansen@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	yee.lee@mediatek.com, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, "open list:KFENCE" <kasan-dev@googlegroups.com>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_070630_850387_B87C88F7 
X-CRM114-Status: GOOD (  24.53  )
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

[+x86 maintainers ...]

On Wed, 20 Jul 2022 at 01:22, Dave Hansen <dave.hansen@intel.com> wrote:
> On 7/19/22 16:13, Andrew Morton wrote:
> > On Mon, 18 Jul 2022 16:26:25 +0200 Marco Elver <elver@google.com> wrote:
> >
> >> On Sat, 16 Jul 2022 at 20:43, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> [...]
> >>>> - This patch has been accused of crashing the kernel:
> >>>>
> >>>>         https://lkml.kernel.org/r/YsFeUHkrFTQ7T51Q@xsang-OptiPlex-9020
> >>>>
> >>>>   Do we think that report is bogus?
> >>> I think all of this is highly architecture-specific...
> >> The report can be reproduced on i386 with CONFIG_X86_PAE=y. But e.g.
> >> mm/memblock.c:memblock_free() is also guilty of using __pa() on
> >> previously memblock_alloc()'d addresses. Looking at the phys addr
> >> before memblock_alloc() does virt_to_phys(), the result of __pa()
> >> looks correct even on PAE, at least for the purpose of passing it on
> >> to kmemleak(). So I don't know what that BUG_ON(slow_virt_to_phys() !=
> >> phys_addr) is supposed to tell us here.
> >>
> > It's only been nine years, so I'm sure Dave can remember why he added
> > it ;)
> >
> >               BUG_ON(slow_virt_to_phys((void *)x) != phys_addr);
> >
> > in arch/x86/mm/physaddr.c:__phys_addr().
>
> I think I intended it to double check that the linear map is *actually*
> a linear map for 'x'.  Sure, we can use the "x - PAGE_OFFSET" shortcut,
> but did it turn out to be actually accurate for the address it was handed?
>
> I'd be curious what the page tables actually say for the address that's
> causing problems.

test robot just reminded us again:
https://lore.kernel.org/all/YufXncrWhJZH0ifB@xsang-OptiPlex-9020/T/#u

Few things I noticed:

* mm/memblock.c's memblock_free() also uses __pa() to convert back to
physical address. Presumably that's also wrong. What should be used
instead?

* kmemleak happily converts phys_addr_t to unsigned long everywhere,
but with i386 PAE, this will narrow a 64-bit address to a 32-bit
address. Is that correct? Does kmemleak need a "depends on 64BIT ||
!PHYS_ADDR_T_64BIT"?

