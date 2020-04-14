Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59EDC2BB85
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 19:47:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B53120767
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 19:47:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qdocK2Od";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NI2CbHQm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B53120767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wylxy90sWNajbShWcksKac9ZputKQ1pSEF0rt8wX7xI=; b=qdocK2Odw4DhVQ
	Jbm+aQPRhWXSplVY1apoEznRlRQZgGZmvwhsol4ocUHjFenOExNYhXob7TJN0sMZi738zMZ00O2iM
	bkki338fCj2Pr75NYPAj1urb+67ELCmBHi6qCOPpIC+IcuwmDBWufsrLFsKQ8tYE9yg2xw7xF8RWr
	+1yZLj41YglXCon9S3WHDprWKj40MXc9HMsxx/fOURzR+6IbWnW7mVPVmlbP9IOXu72PUDoHJ4KMl
	lQbvLdifK+BgmKqsap+swgmzppXAOdE6W4gOH9oSztyIXimHgOeGVrpdv+bxAZkFWokVDdG3TqcMF
	H1p+CtPfHgovo/tA+zJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jORWr-0003YK-E9; Tue, 14 Apr 2020 19:47:29 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jORWo-0003Tw-Hr
 for linux-mediatek@lists.infradead.org; Tue, 14 Apr 2020 19:47:28 +0000
Received: by mail-lj1-x243.google.com with SMTP id j3so700172ljg.8
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Apr 2020 12:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JJK+Q+UKkDQaruBYiWcWjNudKJdkietMzkyNFKfwUfY=;
 b=NI2CbHQmy0JJhl4ytQt1TbKJDLFhbGdB6cugYS+62mNdDgladQHA0hgMSpm0uXhk9o
 OenLF/9qzYoyXCkuv5tboOvQ6DYSBgPak6ZedVQ8kUkb2+i3/FPQaVyVDxSnO7vm1ajm
 O8Ee2EwUzbtxLpnuvL5B21vXVbTPdRKawqDL3gkIiIr+Jrz202HaTyAyl3ggcMnK6bgF
 aHJmI2L8Q4H3BoMBCL08Cbenfkc2Ktqw+9w5IwhZlfXIkOWQjb/acdtVBaaBe5mpT7GX
 kwMHIbu70LH9UdN5hfijW4qXB2bKDyy7J84+hu3Wd69S/RaX2rI2sxEYDfE0xTjOAuIN
 MV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JJK+Q+UKkDQaruBYiWcWjNudKJdkietMzkyNFKfwUfY=;
 b=GRKhZt7Xx3HY8BplMyh+rkhMKHFaB/bJb4aKRgXt682WOpVhvGltoUbAv/W8j4ChOE
 GSEqFJerTLlL9Q0VVStLoupp1Mb3n2QJ0/KOx6aXr3g+kXjF92X96ozF2B4WQmyDzN8S
 AG4JyEVE11HRGcxfP0+RF3vDJYTm3IJ148zB9xpwK1rGb+koG01Iwh/iZ/ybrBFcCgek
 s/7R9lNSQgtZMo8Y7FErXqc2/W+GhZ7doSqcOLavsK+317U7csoqEX0W1k866QLl/siO
 aDFuQLn4z3PKVpVG0X9mF2ECW3ZTHba5zATZNxnDmeE2WYIqJvtGs85AJibiXduUiL+A
 epdQ==
X-Gm-Message-State: AGi0PuZSIi+Om6CXAG/IUlrlR3tK8krUkv08CXOD1B37HMCLWF6/OJnN
 KkL0UUYYxgM7jRzYxca2FuEgA61vk72bO+/ouMEdxoqc
X-Google-Smtp-Source: APiQypLGUYk3suy/eSUDKH5ICT7nYCw/nP+Vjdcx+EdWiVN7l3yhVL9RbojbaGVteYNrgDbwy7b43T8oKlKY7EU+/X4=
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr1012285ljc.217.1586893643490; 
 Tue, 14 Apr 2020 12:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200407095107.1988-1-miles.chen@mediatek.com>
 <20200407181908.GB94792@iweiny-DESK2.sc.intel.com>
In-Reply-To: <20200407181908.GB94792@iweiny-DESK2.sc.intel.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Wed, 15 Apr 2020 01:25:07 +0530
Message-ID: <CAFqt6zYztssQEgMJtafr_ZdMYvBwAU-BZ4Z4tOWQPJ6eFnHq2Q@mail.gmail.com>
Subject: Re: [PATCH] mm/gup: fix null pointer dereference detected by coverity
To: Ira Weiny <ira.weiny@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_124726_606040_D0A50C4D 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 7, 2020 at 11:49 PM Ira Weiny <ira.weiny@intel.com> wrote:
>
> On Tue, Apr 07, 2020 at 05:51:07PM +0800, Miles Chen wrote:
> > In fixup_user_fault(), it is possible that unlocked is NULL,
> > so we should test unlocked before using it.
> >
> > For example, in arch/arc/kernel/process.c, NULL is passed
> > to fixup_user_fault().
> >
> > SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
> > {
> > ...
> >       ret = fixup_user_fault(current, current->mm, (unsigned long) uaddr,
> >                              FAULT_FLAG_WRITE, NULL);
> > ...
> > }
> >
> > Fixes: 4a9e1cda2748 ("mm: bring in additional flag for fixup_user_fault to signal unlock")
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

Acked-by: Souptick Joarder <jrdr.linux@gmail.com>

>
> > ---
> >  mm/gup.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/gup.c b/mm/gup.c
> > index da3e03185144..a68d11dc232d 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -1230,7 +1230,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
> >       if (ret & VM_FAULT_RETRY) {
> >               down_read(&mm->mmap_sem);
> >               if (!(fault_flags & FAULT_FLAG_TRIED)) {
> > -                     *unlocked = true;
> > +                     if (unlocked)
> > +                             *unlocked = true;
> >                       fault_flags |= FAULT_FLAG_TRIED;
> >                       goto retry;
> >               }
> > --
> > 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
