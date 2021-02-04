Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6828AC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 18:41:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 159C064DE1
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 18:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 159C064DE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LCA4tp1RIgkf3Sh53W5IPmCq/vq9Ux3ThPS9jvlogVQ=; b=NjNt9nnM4xDADsuQg7JVnhw1P
	YMGKlUdjXCCdV86+l+RmfhRCbAza9iAAuaoUs7moDCyJNVkC6WQYQKa1qaSlL+GlmDHf4hi70GZix
	2d/Gtr+aQvPbYOGJCt/OR+yJr02MPWtsyWfe9WEu/qdyddsxzT4MVFEONQfl2h3MjkLRswT5Uv5SB
	7Ws4NQGgpQ8hsVfmvy9HDiXPV7IvV3uHUF4OYoW+Jho42XwaS0OEeyo21eJpyrOtBaIWiPB1OMG0E
	YEi54567sSCFMa6w5Of4fDZOhsTgRN2ZdHESiD7Wl+BJ1mlvdxDdsMxehPb4DVTAYl7SuVD79H2oP
	UHVaz+KsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7jZf-0003ju-KZ; Thu, 04 Feb 2021 18:41:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7jZc-0003ih-53; Thu, 04 Feb 2021 18:41:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id u15so2247947plf.1;
 Thu, 04 Feb 2021 10:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xPJcixL5B72ONNeQTUrd/Ds+3cwL/OzxhJxazJOwdWU=;
 b=hZEBnFadWKNcM22cVRU/a7ekIXxiGnvJaR2OBmXSBWA6MhsJnQ2IP0Ye4V2wat6Zrl
 9XH7dXAdM9sS3FDL9bMNpEvQS1wZMWANxL4DrjDucQXa4SUlny92X0EuRxN1PAjCxlJC
 m2Rdnf0rreJ+30C4IzBRjr9B+mS3tkPN+k1uZbx/dni+WSpZMxs84jLLonRWdR1XL4iv
 Ol2ek6+pTFzt6KDgTWX+NVfz71eWtviLUCDaPXTDq6+0htUPSE9svu9bOcCSNrFn7Ufb
 YmAsPAVPCxvO32sPjMwPhd6eq4IPf/91C/Uugg+0biZoHhKZNN6+wyPWEY1UtAdmpX65
 uTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xPJcixL5B72ONNeQTUrd/Ds+3cwL/OzxhJxazJOwdWU=;
 b=HL8c3R+nRKEqcCjjgCIobeAuaNdYq81rSxlHKASFKgKOTknFing6DJJRVPaapAthzh
 DwV4gDmoIBJE70N8cKN1az9bejMqFS40k6FKgMtxmpuWooxQDaBM2BB74L6+7TtSpnIb
 7kHzwjDo6IvaXYpE6hfWdKTZbYyuf/bmL1yz4EutyF3Qzsz8WDn6qCbfUW/V5zVtkUFX
 W2lEYNY+2CLjMx1JaCOiWrc/Rz49o2CxLFcXwdvqMIOye2DxEnKkJ3+U0/6iWhvP0ar4
 bdGLfDFAfgXOrhPV6gES8mquybqac9ZASOMDV1CcXt+h4YkiTsMh7FRjwGer2Yw9OKcY
 Vy0Q==
X-Gm-Message-State: AOAM533A8LyRXpYxp6aAXWKX+zWxcorpWSb1M9+X2gqu4vy0tAdY3XZh
 VeAVEwBPENWcbFaMKsxdYP0EH12pLjlYx0RjZUg=
X-Google-Smtp-Source: ABdhPJzy/LIgldY2il/NtwAfXOaYXEinArlc3vM117wT2mWj8AdIkX1bTtfJpk8Qa6r89tNQKFjtw0VzqsMn2rxOEpY=
X-Received: by 2002:a17:90a:7787:: with SMTP id v7mr298480pjk.81.1612464105539; 
 Thu, 04 Feb 2021 10:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20210204124914.GC20468@willie-the-truck>
 <20210204155346.88028-1-lecopzer@gmail.com>
 <20210204175659.GC21303@willie-the-truck>
In-Reply-To: <20210204175659.GC21303@willie-the-truck>
From: Lecopzer Chen <lecopzer@gmail.com>
Date: Fri, 5 Feb 2021 02:41:34 +0800
Message-ID: <CANr2M19xc+9UE3dZB5UA8HvgTGAcoSLOPAkeepExcUrKkNHt+g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: kasan: support CONFIG_KASAN_VMALLOC
To: Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_134148_247258_2ADECE84 
X-CRM114-Status: GOOD (  21.59  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Jian-Lin Chen <lecopzer.chen@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 tyhicks@linux.microsoft.com, Alexander Potapenko <glider@google.com>,
 vincenzo.frascino@arm.com, ardb@kernel.org, yj.chiang@mediatek.com,
 kasan-dev@googlegroups.com, Dmitry Vyukov <dvyukov@google.com>,
 aryabinin@virtuozzo.com, linux@roeck-us.net,
 Andrey Konovalov <andreyknvl@google.com>, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, dan.j.williams@intel.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, gustavoars@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, robin.murphy@arm.com,
 rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> On Thu, Feb 04, 2021 at 11:53:46PM +0800, Lecopzer Chen wrote:
> > > On Sat, Jan 09, 2021 at 06:32:48PM +0800, Lecopzer Chen wrote:
> > > > Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > > > ("kasan: support backing vmalloc space with real shadow memory")
> > > >
> > > > Acroding to how x86 ported it [1], they early allocated p4d and pgd,
> > > > but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
> > > > by not to populate the vmalloc area except for kimg address.
> > >
> > > The one thing I've failed to grok from your series is how you deal with
> > > vmalloc allocations where the shadow overlaps with the shadow which has
> > > already been allocated for the kernel image. Please can you explain?
> >
> >
> > The most key point is we don't map anything in the vmalloc shadow address.
> > So we don't care where the kernel image locate inside vmalloc area.
> >
> >   kasan_map_populate(kimg_shadow_start, kimg_shadow_end,...)
> >
> > Kernel image was populated with real mapping in its shadow address.
> > I `bypass' the whole shadow of vmalloc area, the only place you can find
> > about vmalloc_shadow is
> >       kasan_populate_early_shadow((void *)vmalloc_shadow_end,
> >                       (void *)KASAN_SHADOW_END);
> >
> >       -----------  vmalloc_shadow_start
> >  |           |
> >  |           |
> >  |           | <= non-mapping
> >  |           |
> >  |           |
> >  |-----------|
> >  |///////////|<- kimage shadow with page table mapping.
> >  |-----------|
> >  |           |
> >  |           | <= non-mapping
> >  |           |
> >  ------------- vmalloc_shadow_end
> >  |00000000000|
> >  |00000000000| <= Zero shadow
> >  |00000000000|
> >  ------------- KASAN_SHADOW_END
> >
> > vmalloc shadow will be mapped 'ondemend', see kasan_populate_vmalloc()
> > in mm/vmalloc.c in detail.
> > So the shadow of vmalloc will be allocated later if anyone use its va.
>
> Indeed, but the question I'm asking is what happens when an on-demand shadow
> allocation from vmalloc overlaps with the shadow that we allocated early for
> the kernel image?
>
> Sounds like I have to go and read the code...
oh, sorry I misunderstood your question.

FWIW,
I think this won't happend because this mean vmalloc() provides va
which already allocated by kimg, as I know, vmalloc_init() will insert
early allocated vma into its vmalloc rb tree

, and this early allocated vma will include  kernel image.

After quick review of mm init code,
this early allocated for vma is at map_kernel() in arch/arm64/mm/mmu.c



BRs
Lecopzer

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
