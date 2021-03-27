Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E91C433C1
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 16:36:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83DCE61945
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 16:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83DCE61945
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tk6i3D22U9IO8Ada4giDO+4wfUXYR/zSvx1SZOMt/to=; b=kFI6hJ0+EG22UQ+N5XfrImNUB
	Sn0GTxTs0+3BrWAiyhe+TwwKlwI37VmXwMSunnpZmBlDksg/IvR944pMvwdrNz3aMve7M+xbnUvph
	c5ePBGv8kd5M13IpaoNhRSt5kdgqErqoykUPjO76tDA1kA0E/3ZO81qmk5xm4bbU3QzIFh3wJ4TWN
	XJTM4tjOkbGUpkmUwmgOTnqMMJ7i8klU3KRTXhu0wF/fDdy9AYxdg/brJypFtaishKV7QjtF3aYyB
	3i/zRRlqNq0W25Wkj3LR7bY/gFQqEhO/mzyLUpEiBbUAuAtGwQS3qEI8+YGLc0xtIi+s4X7iArE3H
	M9NiepGEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQBuy-005GwN-4j; Sat, 27 Mar 2021 16:36:08 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQBum-005Gv9-00; Sat, 27 Mar 2021 16:35:57 +0000
Received: by mail-io1-xd31.google.com with SMTP id k25so8552006iob.6;
 Sat, 27 Mar 2021 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BBpKHPTfLzeVC8Vlokz6RnjApS7jM+5JGdUbmQj/Yqs=;
 b=TBVwnQvO+sXGZss5Ndc4fHHY0yZbzLdYOXsyniyWXixCmJScopTZpT04x6TdixzVdy
 b37Gi288u4M/dn2PXi/bBBhab8tnDrfH6jt8Ign9qBdYZT00ZXIvwoivs8Fp2HAxcHSG
 cBdLgZeTAGFTrXBdrD0CCHOprl/z0551Bp69KTQ5JUFD/WxDGTsToAP13BDMf51/BgJf
 Fsfv4817sAYE9HsOiHr4+s517qGu8YNzx7OVp0PkFRU++LGgw+KmaPHDzGskgOBdYpWe
 gUT8ZRQyc/TvXywEYQDHX4GBiIU1Mph6j+QZmWmlUEypa6vgtezfrkNOkEp5yLBMsYzY
 bfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BBpKHPTfLzeVC8Vlokz6RnjApS7jM+5JGdUbmQj/Yqs=;
 b=UW9BVtpk+bihbRCsu8FDjQPUWKpWnmAIyBuMeMUUlrwb3J/uUpYcj2zHefNPA80JKP
 OuWTfldFD0GxWXrOzlHyE5fQpv+2ENHJnhoMRhwbLy2+eFYsVDya/gXPFop7L08FuKoG
 0XGqiWYR0vxagvecVvQYD9iIbApEb3+TfxWXLiPQpD9gTXzeBJRNEPdqYt5m0XOQROrG
 YzG/98f1AVpI/Mpty1YQL1VIeAsF8GA/o8Whf/PYaaJfqNJGCCM8jVnjOSudjWuxtjOe
 UTDTFB6gywAitRnjYRK/Pd266r73NuyNBWAhS7vO+LfoxS0RjCk/s1iCW/sBV1QHGLnC
 76+Q==
X-Gm-Message-State: AOAM532fWfh5ITo0XUV7p3pz2GI7lGn9fCvWlf6TNzVTgQ6S2K5UIZmx
 ai7g+yNdVPq0tl81CMkuCLHFehAN4DbL8jubna8=
X-Google-Smtp-Source: ABdhPJywwV+4zcT3KxAEMj2QBhddeKToPnOV79azTvHsFa15QK7QbVIbGOh6EAEcSM1/EW0rO8RzSMvcCm166Hm+TnQ=
X-Received: by 2002:a05:6638:11c8:: with SMTP id
 g8mr17295564jas.38.1616862954754; 
 Sat, 27 Mar 2021 09:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210317055902.506773-1-ilya.lipnitskiy@gmail.com>
 <20210325095529.GA5775@alpha.franken.de>
 <CALCv0x2ni97mLEar6M9boWCrXzdsqM3JJNMbe=cDitHj+npanw@mail.gmail.com>
 <20210327094620.GA4320@alpha.franken.de>
In-Reply-To: <20210327094620.GA4320@alpha.franken.de>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Sat, 27 Mar 2021 09:35:43 -0700
Message-ID: <CALCv0x23kmm5=PN_aS3L4fpEf8F9g7ay5ouX9AnCvf0uu6HM-g@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: mt7621: add memory detection support
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Chuanhong Guo <gch981213@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_163556_131823_037C5C94 
X-CRM114-Status: GOOD (  25.84  )
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

On Sat, Mar 27, 2021 at 2:46 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Mar 25, 2021 at 07:45:23PM -0700, Ilya Lipnitskiy wrote:
> > On Thu, Mar 25, 2021 at 3:01 AM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Tue, Mar 16, 2021 at 10:59:02PM -0700, Ilya Lipnitskiy wrote:
> > > > From: Chuanhong Guo <gch981213@gmail.com>
> > > >
> > > > mt7621 has the following memory map:
> > > > 0x0-0x1c000000: lower 448m memory
> > > > 0x1c000000-0x2000000: peripheral registers
> > > > 0x20000000-0x2400000: higher 64m memory
> > > >
> > > > detect_memory_region in arch/mips/kernel/setup.c only adds the first
> > > > memory region and isn't suitable for 512m memory detection because
> > > > it may accidentally read the memory area for peripheral registers.
> > > >
> > > > This commit adds memory detection capability for mt7621:
> > > >   1. Add the highmem area when 512m is detected.
> > > >   2. Guard memcmp from accessing peripheral registers:
> > > >      This only happens when a user decided to change kernel load address
> > > >      to 256m or higher address. Since this is a quite unusual case, we
> > > >      just skip 512m testing and return 256m as memory size.
> > > >
> > > > [...]
> > >
> > > I get
> > >
> > > WARNING: modpost: vmlinux.o(.text+0x132c): Section mismatch in reference from the function prom_soc_init() to the function .init.text:mt7621_memory_detect()
> > > The function prom_soc_init() references
> > > the function __init mt7621_memory_detect().
> > > This is often because prom_soc_init lacks a __init
> > > annotation or the annotation of mt7621_memory_detect is wrong.
> > >
> > > Can you please fix this ?
> > Thanks, I will fix it. Having trouble reproducing the error, but I
> > clearly see the issue. Are you building on a MIPS target or
> > cross-compiling (I'm cross-compiling and no errors).
>
> I'm cross compiling, I can provide you the .config, if you want.
Yeah, that would help. I spent quite a bit of time trying to reproduce
- tried different options with GCC 8 and GCC 10 to no avail. Maybe you
are using clang?

Ilya

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
