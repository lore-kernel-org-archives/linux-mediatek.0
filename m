Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9C9C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 21:39:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3F5261937
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 21:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3F5261937
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DAykB5nTLRhSmO7kDoIvDN0g7l/niKRyPw1+UD1ZgsE=; b=XbF5jL0QAmSA4t/Wthc1Q+JPs
	dmM38oC3Tn0B6aWSZVW7DFx4OPcCVuwvh6Q8VrMkOmOLPURdc1T8l2XVuGIfuBClNe9GBxRcvpz8r
	jHiGV7ct6Quv/Wp4nuJg+bf1YVv6HeipOCFWI0zfYh5y/8uDYH4qttSFBk68rrZDClkPviP1YGF/Q
	U1+PC3RMrO6v3XBx2S7vfBk9SKwpk5ezdyGNWkmFgvfrzYcbYsf+DDGzeNa3qpFu+jTosfyOX3jgV
	XwFIVhlQwXUE7pcu5NTt7Nrs/ccQrhlnvE9fykMMAXWiDj6gZScVVNadsw49mzTII/kaCh+894vho
	2z74t6VVw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQGe2-005YQq-CI; Sat, 27 Mar 2021 21:38:58 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQGdo-005YPZ-Ph; Sat, 27 Mar 2021 21:38:46 +0000
Received: by mail-il1-x135.google.com with SMTP id d2so8036883ilm.10;
 Sat, 27 Mar 2021 14:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c34PErvHXBZ/P1Sz73dY60YNM8fNQhXxU1cb8SCkbWI=;
 b=k6Z06YF7tNgieDwC8SXV99UC/KxmRaREKzzE14qdyKHLmU9ue51YlIDwnah1kDjX3H
 tv9S1nlw/Dr8HbYxngIJndXotVBunOXtposLMSy6x7wa4XnHVbtYKWLPKc/R8F4ZQ5ON
 0eSpJCiquweN57tb+pTrqkFVu+dzk5K9HlEIcSzYrPk5LJAWtsI2V6KtzWh+OBogSCMQ
 /fwUXRsEWk8DHzmocuF08GhfUJIqrk0/9o+wm3tPrAk01MoaNTKnAT7ORIg2jHKZlO8z
 ifP91PVTaiv40rihNuCD2K40uhUkJEo6kK0lwgH9mQE8LJ/+PEFFcrmCo4NmtN/iLGks
 R0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c34PErvHXBZ/P1Sz73dY60YNM8fNQhXxU1cb8SCkbWI=;
 b=tDVWD78xkR2pYSoWEpyEE0bTLzoZZ1Am20fgytg2MgwY2fZ0Co+zF1WZDheLWR8CLs
 xdtq0VHboPNuf8eCnXIXRXwBbjgQVsvmYJnr5MWMnTly4YYYtk8L4D6CTDdCX7QAPdM3
 1fJf3+/jjjgHrtZLnDetAlDgIfeECqI/HDGmEQaU55CkmQAxav17LD0MHSpvAr0efpKL
 duuRNQEkwT+5C/73vieyBSkOz3SNJGcUJ8DaWsXmIm+d+oXXPIAtziECW71J/MIEMfj4
 RVjMgG6N5yeFI3L4nPPr0mOvoylPk//bpJu8nIIKsbYWDG071ZZt/Q3RCmw1ZgI/uUW7
 pEjA==
X-Gm-Message-State: AOAM530ekErdrBv6W425mlJHV+4gHHFmoREDSbFiV2cM3PJNSCOdEA5v
 HHpLzssiEsfopRwOCocMKl2AbXRGSmgNPbl5iHc=
X-Google-Smtp-Source: ABdhPJwicv5S65GU+vk8rY9d7TBJ3P4OlK7ZXR7G/c/ojq+8Qg1k/aKCSFxiZ66Nm9Ap47Z3hIUF25E8A9J/UOsqhX8=
X-Received: by 2002:a92:d68e:: with SMTP id p14mr12779150iln.0.1616881123265; 
 Sat, 27 Mar 2021 14:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210317055902.506773-1-ilya.lipnitskiy@gmail.com>
 <20210325095529.GA5775@alpha.franken.de>
 <CALCv0x2ni97mLEar6M9boWCrXzdsqM3JJNMbe=cDitHj+npanw@mail.gmail.com>
 <20210327094620.GA4320@alpha.franken.de>
 <CALCv0x23kmm5=PN_aS3L4fpEf8F9g7ay5ouX9AnCvf0uu6HM-g@mail.gmail.com>
 <20210327203916.GA4991@alpha.franken.de>
In-Reply-To: <20210327203916.GA4991@alpha.franken.de>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Sat, 27 Mar 2021 14:38:32 -0700
Message-ID: <CALCv0x0xPw_s3vWtoSUQFfWjC=HxGBhA-5=MV0NtPUUxR9B5Xw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: mt7621: add memory detection support
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Chuanhong Guo <gch981213@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_213845_020111_246FC272 
X-CRM114-Status: GOOD (  29.35  )
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

On Sat, Mar 27, 2021 at 2:06 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Sat, Mar 27, 2021 at 09:35:43AM -0700, Ilya Lipnitskiy wrote:
> > On Sat, Mar 27, 2021 at 2:46 AM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Thu, Mar 25, 2021 at 07:45:23PM -0700, Ilya Lipnitskiy wrote:
> > > > On Thu, Mar 25, 2021 at 3:01 AM Thomas Bogendoerfer
> > > > <tsbogend@alpha.franken.de> wrote:
> > > > >
> > > > > On Tue, Mar 16, 2021 at 10:59:02PM -0700, Ilya Lipnitskiy wrote:
> > > > > > From: Chuanhong Guo <gch981213@gmail.com>
> > > > > >
> > > > > > mt7621 has the following memory map:
> > > > > > 0x0-0x1c000000: lower 448m memory
> > > > > > 0x1c000000-0x2000000: peripheral registers
> > > > > > 0x20000000-0x2400000: higher 64m memory
> > > > > >
> > > > > > detect_memory_region in arch/mips/kernel/setup.c only adds the first
> > > > > > memory region and isn't suitable for 512m memory detection because
> > > > > > it may accidentally read the memory area for peripheral registers.
> > > > > >
> > > > > > This commit adds memory detection capability for mt7621:
> > > > > >   1. Add the highmem area when 512m is detected.
> > > > > >   2. Guard memcmp from accessing peripheral registers:
> > > > > >      This only happens when a user decided to change kernel load address
> > > > > >      to 256m or higher address. Since this is a quite unusual case, we
> > > > > >      just skip 512m testing and return 256m as memory size.
> > > > > >
> > > > > > [...]
> > > > >
> > > > > I get
> > > > >
> > > > > WARNING: modpost: vmlinux.o(.text+0x132c): Section mismatch in reference from the function prom_soc_init() to the function .init.text:mt7621_memory_detect()
> > > > > The function prom_soc_init() references
> > > > > the function __init mt7621_memory_detect().
> > > > > This is often because prom_soc_init lacks a __init
> > > > > annotation or the annotation of mt7621_memory_detect is wrong.
> > > > >
> > > > > Can you please fix this ?
> > > > Thanks, I will fix it. Having trouble reproducing the error, but I
> > > > clearly see the issue. Are you building on a MIPS target or
> > > > cross-compiling (I'm cross-compiling and no errors).
> > >
> > > I'm cross compiling, I can provide you the .config, if you want.
> > Yeah, that would help. I spent quite a bit of time trying to reproduce
> > - tried different options with GCC 8 and GCC 10 to no avail. Maybe you
> > are using clang?
>
> no, but an older gcc (gcc version 6.1.1 20160621 (Red Hat Cross 6.1.1-2) (GCC)).
> config is attached.
Thanks, disabling CONFIG_LD_DEAD_CODE_DATA_ELIMINATION reproduced it
even with GCC 10. Fixed in
https://lore.kernel.org/linux-arm-kernel/20210327053840.471155-1-ilya.lipnitskiy@gmail.com/

- Ilya

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
