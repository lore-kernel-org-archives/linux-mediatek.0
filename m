Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F3BC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 12:00:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3470206DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 11:59:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BlxXPAYf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="J6UjhI/2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3470206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzTR/mkDSEdSRQLI/CfdIJkHXtJKukFvKWjctGPfuxU=; b=BlxXPAYfZF62Iq
	YEgVp15JKUOi7BDZh1jMs/Fs4EJxllYnbP8wuGdsyWSe51WPwNs5NiuGvWT1H06JsvDJwf7oEoQ0H
	me6pZk2ASFcI/9h++yqu3AlG2Wj99qZvzW+2HZFCU2BHqCWgnkR4AZTWWrUzuFihTzd9Bb4IYD+6l
	0nOrElXvkX5732t+0b4lOXiT3VCtkcvh1vZgthB/T1shN1Znf46ojb6oWS6TVGZvG0iy15mNzv5+C
	jl+52qxeMCkcPUpW4XFkQ6GX2k8V/yC60hy2SLMCi9aOZ/1KASM5STE1m/cAHVgY0i5/kPhcT+xto
	jB5fpohnotmad62ctXCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWIiO-0000Gm-H0; Wed, 06 May 2020 11:59:52 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWIiK-0000Cf-3c
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 11:59:50 +0000
Received: by mail-qk1-x742.google.com with SMTP id t3so1559751qkg.1
 for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2020 04:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=neznKY+6L7BaBR2xiVWj7fZLdLOn94ic/5ND5jWNOV8=;
 b=J6UjhI/28MkQDKrElawqDLFvNjIPGwSYYsG8Aoemsd9fEx3GNLlG47RA2u6ou0J/rs
 NHsiEqGaY88mpPCphTpyRTOzbmlwi8wLCKudpWSI0/AAstuUUu3YE4IhPOBGNBqctn9I
 GnID4U67Zv5eeB90GzeNa9VStxLc8sFHnvysC8IzkgFU+xlLhzL9NI/DPX2XbogB/USg
 qp6YX4ck1pMX1s3ABP7qYSqTd2yu3CFWCx7bc3PS+pZmUjjwRYkl73EBXOfRkQVxRHZi
 +l3u2SE06e8nTuTIIO+QZxnliJbYGKhINWImIS2yfl0SIiTPWWk/6t2ilHJot7Um9a3h
 Grtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=neznKY+6L7BaBR2xiVWj7fZLdLOn94ic/5ND5jWNOV8=;
 b=R2cSQHFovyMx0kSoQmeG+IkO30YKOy2+W8iDDJIlC03JoRkQtR4ou4TCrEmkRyk0jS
 3CcXyCn/9JnD64jG+H4HArHkKGm1mKjkwXRh6nGD9qH2AadMwcSjfFJ1FXeCpjcKR7xU
 atCjg8tv0wDSp9K2eXSGiPdengyWPiix6lngkv/cBfJ+sY8ryS0ZJ6j4BYHuZ18BZ3Lc
 mbCcX/uaT4owmWLM5SRNMnNljbGdTtVSiCTnWEeRHj36SzNFsdxwmqbItXU1JkFA4Drk
 K7tDvD54eG5NC+0m4XP+bl+H5OgRDgkzXzP9HG0fhDo2rubkGKKJ/tFlK56vPDxu7dxS
 YJJg==
X-Gm-Message-State: AGi0Pua8MF3DajsV0FeYg3otuzic5OKoVK82SjzXaZsBjocQ8nS5s68O
 WUaubtQGhzy6k6ny/sBisN5J5SvNHvcsjhSApnw5yg==
X-Google-Smtp-Source: APiQypLCyhwy4xeYR/ap4IO8+wbSeKhUU5bj5JplBLuYph80r5E3xUUstFJ5CWj+N+pPS5KniIAkDkCp8xq4rdDPk7A=
X-Received: by 2002:a37:4b0c:: with SMTP id y12mr8038443qka.43.1588766386312; 
 Wed, 06 May 2020 04:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200506052155.14515-1-walter-zh.wu@mediatek.com>
 <CACT4Y+ajKJpwNXd1V17bOT_ZShXm8h2eepxx_g4hAqk78SxCDA@mail.gmail.com>
 <1588766193.23664.28.camel@mtksdccf07>
In-Reply-To: <1588766193.23664.28.camel@mtksdccf07>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 6 May 2020 13:59:34 +0200
Message-ID: <CACT4Y+bOxe+Y8BuzC=0k6rmkDiJ7PBnVcsY=jzZe1trVj476fg@mail.gmail.com>
Subject: Re: [PATCH 2/3] kasan: record and print the free track
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_045948_173554_E1AC263E 
X-CRM114-Status: GOOD (  25.19  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 6, 2020 at 1:56 PM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> On Wed, 2020-05-06 at 11:50 +0200, Dmitry Vyukov wrote:
> > On Wed, May 6, 2020 at 7:22 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > >
> > > We add new KASAN_RCU_STACK_RECORD configuration option. It will move
> > > free track from slub meta-data (struct kasan_alloc_meta) into freed object.
> > > Because we hope this options doesn't enlarge slub meta-data size.
> > >
> > > This option doesn't enlarge struct kasan_alloc_meta size.
> > > - add two call_rcu() call stack into kasan_alloc_meta, size is 8 bytes.
> > > - remove free track from kasan_alloc_meta, size is 8 bytes.
> > >
> > > This option is only suitable for generic KASAN, because we move free track
> > > into the freed object, so free track is valid information only when it
> > > exists in quarantine. If the object is in-use state, then the KASAN report
> > > doesn't print call_rcu() free track information.
> > >
> > > [1]https://bugzilla.kernel.org/show_bug.cgi?id=198437
> > >
> > > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > > Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> > > Cc: Dmitry Vyukov <dvyukov@google.com>
> > > Cc: Alexander Potapenko <glider@google.com>
> > > ---
> > >  mm/kasan/common.c | 10 +++++++++-
> > >  mm/kasan/report.c | 24 +++++++++++++++++++++---
> > >  2 files changed, 30 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > > index 32d422bdf127..13ec03e225a7 100644
> > > --- a/mm/kasan/common.c
> > > +++ b/mm/kasan/common.c
> > > @@ -321,8 +321,15 @@ void kasan_record_callrcu(void *addr)
> > >                 /* record last call_rcu() call stack */
> > >                 alloc_info->rcu_free_stack[1] = save_stack(GFP_NOWAIT);
> > >  }
> > > -#endif
> > >
> > > +static void kasan_set_free_info(struct kmem_cache *cache,
> > > +               void *object, u8 tag)
> > > +{
> > > +       /* store free track into freed object */
> > > +       set_track((struct kasan_track *)(object + BYTES_PER_WORD), GFP_NOWAIT);
> > > +}
> > > +
> > > +#else
> > >  static void kasan_set_free_info(struct kmem_cache *cache,
> > >                 void *object, u8 tag)
> > >  {
> > > @@ -339,6 +346,7 @@ static void kasan_set_free_info(struct kmem_cache *cache,
> > >
> > >         set_track(&alloc_meta->free_track[idx], GFP_NOWAIT);
> > >  }
> > > +#endif
> > >
> > >  void kasan_poison_slab(struct page *page)
> > >  {
> > > diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> > > index 7aaccc70b65b..f2b0c6b9dffa 100644
> > > --- a/mm/kasan/report.c
> > > +++ b/mm/kasan/report.c
> > > @@ -175,8 +175,23 @@ static void kasan_print_rcu_free_stack(struct kasan_alloc_meta *alloc_info)
> > >         print_track(&free_track, "Last call_rcu() call stack", true);
> > >         pr_err("\n");
> > >  }
> > > -#endif
> > >
> > > +static struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
> > > +               void *object, u8 tag, const void *addr)
> > > +{
> > > +       u8 *shadow_addr = (u8 *)kasan_mem_to_shadow(addr);
> > > +
> > > +       /*
> > > +        * Only the freed object can get free track,
> > > +        * because free track information is stored to freed object.
> > > +        */
> > > +       if (*shadow_addr == KASAN_KMALLOC_FREE)
> > > +               return (struct kasan_track *)(object + BYTES_PER_WORD);
> >
> > Humm... the other patch defines BYTES_PER_WORD as 4... I would assume
> > seeing 8 (or sizeof(long)) here. Why 4?
> It should be a pointer size, maybe sizeof(long) makes more sense.
>
> > Have you tested all 4 modes (RCU/no-RCU x SLAB/SLUB)? As far as I
> > remember one of the allocators stored something in the object.
> Good question, I only tested in RCU x SLUB, would you tell mew how do
> no-RCU? I will test them in v2 pathset.

I meant with CONFIG_KASAN_RCU_STACK_RECORD=y and with
CONFIG_KASAN_RCU_STACK_RECORD not set.
But if we drop CONFIG_KASAN_RCU_STACK_RECORD config, then it halves
the number of configurations to test ;)


> >
> > Also, does this work with objects with ctors and slabs destroyed by
> > rcu? kasan_track may smash other things in these cases.
> > Have you looked at the KASAN implementation when free_track was
> > removed? That may have useful details :)
> Set free_track before put into quarantine, free_track should not have to
> be removed, it only have to overwirte itself.
>
> >
> >
> > > +       else
> > > +               return NULL;
> > > +}
> > > +
> > > +#else
> > >  static struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
> > >                 void *object, u8 tag, const void *addr)
> > >  {
> > > @@ -196,6 +211,7 @@ static struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
> > >
> > >         return &alloc_meta->free_track[i];
> > >  }
> > > +#endif
> > >
> > >  static void describe_object(struct kmem_cache *cache, void *object,
> > >                                 const void *addr, u8 tag)
> > > @@ -208,8 +224,10 @@ static void describe_object(struct kmem_cache *cache, void *object,
> > >                 print_track(&alloc_info->alloc_track, "Allocated", false);
> > >                 pr_err("\n");
> > >                 free_track = kasan_get_free_track(cache, object, tag, addr);
> > > -               print_track(free_track, "Freed", false);
> > > -               pr_err("\n");
> > > +               if (free_track) {
> > > +                       print_track(free_track, "Freed", false);
> > > +                       pr_err("\n");
> > > +               }
> > >  #ifdef CONFIG_KASAN_RCU_STACK_RECORD
> > >                 kasan_print_rcu_free_stack(alloc_info);
> > >  #endif
> > > --
> > > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
