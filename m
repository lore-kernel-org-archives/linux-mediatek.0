Return-Path: <SRS0=RqDu=3X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC0DC33CAC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Feb 2020 10:30:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5551B20721
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Feb 2020 10:30:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N/fk7KmJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="UKGNNJxP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5551B20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2tQGgTFHV4Av0rfrvLkmSTkPC0Ws5wKA038ld3IJHI=; b=N/fk7KmJ37SIkl
	jNX4aCt/AtUaks4K8oE2JWzPiuldsnzpTphsgIHTX6S5PvsovIBG+vYttoswofDWuvdNPWIDJE51d
	8b3cdgDZxybVA1FsxTLvIF8jxXon16aeVOY5tZnlXDboWIpnatDuieEMSHHR32DGAIIvfdUqM7pxe
	bLjng9JFGacYHKy1jKCYjBex4C4dPaiFH1kEHeDYrgUuG1tE8L7HONk8RivN/89CBBJNhKTcBK+Tr
	3h9Lp24semXtCJRe8JkiVTJeJu0vrfB4AVQ4OqSoMVLU09+V2eQAJtwqJWe8w8MWkARJXlB0B9/xM
	IsUtjlGy+3wadYXAOhdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyZ0B-0005qD-EQ; Mon, 03 Feb 2020 10:30:47 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyZ08-0005mz-PK
 for linux-mediatek@lists.infradead.org; Mon, 03 Feb 2020 10:30:46 +0000
Received: by mail-wm1-x344.google.com with SMTP id t23so15217851wmi.1
 for <linux-mediatek@lists.infradead.org>; Mon, 03 Feb 2020 02:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dD9fba3D0HqXgOSqJlLFz2muhY16h6Gr+BwVuHnFIv4=;
 b=UKGNNJxPihSVdDnyfCzDlB+1MVddilSdG2GMCVkiCGZL6D4AXhN/Byg8SWyWW/bnPv
 ZhR3DWnYrfYRCjJom/Sh/JFBZ7Iwl4epixB/18DbnkFz7yPe8kl55ww3eOTntukb3ppn
 DJMyUvrIU12QGoinWcbsJ/q0VJC88l8j9qeBE7MvLq2Yj6xHtWBYBAQYNNlPMKQf8Nd5
 EqLLTWtOUfsnFNR7Kr+L3uZvlKVeimHI/QULdJTHLV8iEpdDqj4VDcz3s7vCA2nKdmiV
 f+EQ9zpHVS6KalEcfPgv8DBDc6jw7fnqqMZlQjLHwj9n0GfXXn0NPvHjPnaM1pSMxGxT
 XLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dD9fba3D0HqXgOSqJlLFz2muhY16h6Gr+BwVuHnFIv4=;
 b=MzDFk0eJxBsY82661ceKREs3NGWflMmGa3frggpBa/26799NZmrZrjVlRfmOT851wH
 8kIVIElJ+gOho2zblbNWWZBE9VqI6aMa1ipZvLU5dZBiU8SW99PyI3V5yetHKE1RSfIG
 e7rBII16kw2OWJCGKLyxbWxwCghKcxI6UrbXgWY7gqymDVVkRObDeFJqofXLly9E8lqN
 zwz4eu2wHDPvmPfG5ZGMwGSN7A6qqxHUzxZnyn89lPIMEIQ69Aoysw/QEOAEneQOIUWU
 RUeC70E4s/PYCA9HnHS8Zm5bQ2H9vOR5CbEcTRhj+cGenSMwp1MwAz4b24Umj38C3U41
 OHqg==
X-Gm-Message-State: APjAAAWdWjx9s41/IjvIH1/InObIlKrg6e9MxzU7wCO6MIrXNFZ2nkFY
 5GOrv6GvyFwi3Sed8Cyj9Yfs5Fuh6sFespfgwN36Jw==
X-Google-Smtp-Source: APXvYqxNx7Z0KIvo/FhK4eHPDW3mZ84bqAFnEzCbf8Hd0g8df+eNawGKBotlJvsxIVfVYaHjsPN4BUWk/DfxFPRlw6I=
X-Received: by 2002:a1c:7907:: with SMTP id l7mr27326507wme.37.1580725840251; 
 Mon, 03 Feb 2020 02:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20200130064430.17198-1-walter-zh.wu@mediatek.com>
 <CAG_fn=X_jSUJXD932z9oN5hBa--n3Qct4zrjzGaPtb2MwJye7A@mail.gmail.com>
 <1580436306.11126.16.camel@mtksdccf07>
 <CAG_fn=X2V0nL=+s38bDbS3UXf2_i61tSevd8vzkV-ZKY=7MHvw@mail.gmail.com>
 <1580695544.17006.7.camel@mtksdccf07>
In-Reply-To: <1580695544.17006.7.camel@mtksdccf07>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 3 Feb 2020 11:30:28 +0100
Message-ID: <CAG_fn=UHhZB-2JBdSBAbuNjBZwVwrzhqQvR1nHb+XOqUEvLMsw@mail.gmail.com>
Subject: Re: [PATCH v3] lib/stackdepot: Fix global out-of-bounds in stackdepot
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_023044_859032_28FFC2B8 
X-CRM114-Status: GOOD (  23.36  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Josh Poimboeuf <jpoimboe@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 3, 2020 at 3:05 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> On Fri, 2020-01-31 at 19:11 +0100, Alexander Potapenko wrote:
> > On Fri, Jan 31, 2020 at 3:05 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > >
> > > On Thu, 2020-01-30 at 13:03 +0100, Alexander Potapenko wrote:
> > > > On Thu, Jan 30, 2020 at 7:44 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > > >
> > > > Hi Walter,
> > > >
> > > > > If the depot_index = STACK_ALLOC_MAX_SLABS - 2 and next_slab_inited = 0,
> > > > > then it will cause array out-of-bounds access, so that we should modify
> > > > > the detection to avoid this array out-of-bounds bug.
> > > > >
> > > > > Assume depot_index = STACK_ALLOC_MAX_SLABS - 3
> > > > > Consider following call flow sequence:
> > > > >
> > > > > stack_depot_save()
> > > > >    depot_alloc_stack()
> > > > >       if (unlikely(depot_index + 1 >= STACK_ALLOC_MAX_SLABS)) //pass
> > > > >       depot_index++  //depot_index = STACK_ALLOC_MAX_SLABS - 2
> > > > >       if (depot_index + 1 < STACK_ALLOC_MAX_SLABS) //enter
> > > > >          smp_store_release(&next_slab_inited, 0); //next_slab_inited = 0
> > > > >       init_stack_slab()
> > > > >          if (stack_slabs[depot_index] == NULL) //enter and exit
> > > > >
> > > > > stack_depot_save()
> > > > >    depot_alloc_stack()
> > > > >       if (unlikely(depot_index + 1 >= STACK_ALLOC_MAX_SLABS)) //pass
> > > > >       depot_index++  //depot_index = STACK_ALLOC_MAX_SLABS - 1
> > > > >       init_stack_slab(&prealloc)
> > > > >          stack_slabs[depot_index + 1]  //here get global out-of-bounds
> > > > >
> > > > > Cc: Dmitry Vyukov <dvyukov@google.com>
> > > > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > > Cc: Alexander Potapenko <glider@google.com>
> > > > > Cc: Josh Poimboeuf <jpoimboe@redhat.com>
> > > > > Cc: Kate Stewart <kstewart@linuxfoundation.org>
> > > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > Cc: Kate Stewart <kstewart@linuxfoundation.org>
> > > > > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > > > > ---
> > > > > changes in v2:
> > > > > modify call flow sequence and preconditon
> > > > >
> > > > > changes in v3:
> > > > > add some reviewers
> > > > > ---
> > > > >  lib/stackdepot.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> > > > > index ed717dd08ff3..7e8a15e41600 100644
> > > > > --- a/lib/stackdepot.c
> > > > > +++ b/lib/stackdepot.c
> > > > > @@ -106,7 +106,7 @@ static struct stack_record *depot_alloc_stack(unsigned long *entries, int size,
> > > > >         required_size = ALIGN(required_size, 1 << STACK_ALLOC_ALIGN);
> > > > >
> > > > >         if (unlikely(depot_offset + required_size > STACK_ALLOC_SIZE)) {
> > > > > -               if (unlikely(depot_index + 1 >= STACK_ALLOC_MAX_SLABS)) {
> > > > > +               if (unlikely(depot_index + 2 >= STACK_ALLOC_MAX_SLABS)) {
> >
> > This again means stack_slabs[STACK_ALLOC_MAX_SLABS - 2] gets
> > initialized, but stack_slabs[STACK_ALLOC_MAX_SLABS - 1] doesn't,
> > because we'll be bailing out from init_stack_slab() from now on.
> > Does this patch actually fix the problem (do you have a reliable reproducer?)
> We get it by reviewing code, because Kasan doesn't scan it and we catch
> another bug internally, we found it unintentionally.
>
> > This addition of 2 is also counterintuitive, I don't think further
> > readers will understand the logic behind it.
> >
> Yes
>
> > What if we just check that depot_index + 1 is a valid index before accessing it?
> >
> It should fix the problem, do you want to send this patch?

I've sent the patch. Thanks for the report!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
