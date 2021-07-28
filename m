Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7377C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 12:44:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A29DC60F9E
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 12:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A29DC60F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKHsbD8YKGnS/7zhPTuXvwwUld3an40zuerPjdMUscY=; b=aMcbjznvBQWbBK
	kkTp8fVPdnGZmiH1Z9u4LwWhQjKte6wgZf9mRYEu0N6ejoCkbxGoG9uHQQXjcGg2VJjMvLFfXI7Ks
	De56iF3NSP7tV08JsBM7/caS+y8s7pAwKIBIJJVb0SQ8CLPuDT57zg9ZuoaE7omgwoNrA8nRcpqP1
	5fAnjW8saV7cqFTrnPj4elHu7LtcbcElDdHaZHT8O/jWeAAVirJ/e6BpT4ke5GKxDxsKoJAUmEVkr
	KBTxJYASlOt3C58WINRvhs8+QdoRS8oIGBf2groFtWY1OZxYJnQUc1Eh/QpICHIrl7bMukpMOI02+
	QmfUWL9twVDrB3FR7f6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8iuk-000hSx-GE; Wed, 28 Jul 2021 12:43:58 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8iuh-000hRY-Jd
 for linux-mediatek@lists.infradead.org; Wed, 28 Jul 2021 12:43:57 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 a5-20020a05683012c5b029036edcf8f9a6so1932045otq.3
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Jul 2021 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z8JopdaUBmz7iXRtArgg3xHwWvgUd1IpWAikP8/7uLI=;
 b=hHX52BoT5mvsWaw+jIRYoR2Rq+qYRXIzlDDOh91WdbkCp7WfevrqT5bUmx3TR2tZ4W
 rHoAbJBWFF7xLvhYcXT0dVleOhCskofJQ0AUDqKOuBS9/rhnz8BqAZlIt5HMDpihm9pv
 L+yNTo02wEDNNqgW0U9jIeG5hKO8QkH/rMfeH5FI+8dHKmw4Img4jrCuOYK7czpFZcsZ
 FVscVQS+u7o39JdI7SN9bnKhsa5a+if/auPUGjZjznsRvcO8+koJbgNcbXiKDHjWFmqJ
 4GS4DELsbRPCyMZgDLQVI+3u/9S6t8SskGregZGblGaUEB6j5AmYIdw4BUR61/XNbfnA
 KSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z8JopdaUBmz7iXRtArgg3xHwWvgUd1IpWAikP8/7uLI=;
 b=nkyrwz5Ii1hWmp3/mqOLrXy0b8JDh3Rffw8DS1zRDcjgiUuAJqQPXqMj0ieDDLW+vr
 /wev2SnNWTIS91/RPEjCa9IsRAZCKd78yIQ36GKiJbikhv/+crTYviN+0v0oITEUa9vm
 ZtzLExi0ixCe4IBEhVQJspba9RbCnjDhLX4E59JbDxo/fuSiTJqEBf3od48817nYc5cu
 kBd6BY0TVr5cDu17l6y/fzuHNjHr2uh9e4FMXp9U0TuVs54r8p4q9RtMliM8d2/5JtLe
 PxcGsJQN5pFtx1dsScxW+F1XQpRFRLSW5zXOMEghA588ShT4QyRwnyS72+TZmFLyRmqb
 IHgQ==
X-Gm-Message-State: AOAM5317flCVUVwLT4Lsvj5saV9UUUx4peB1gH0r/QpzubCc6Q0H/UmP
 XzA0srvr2N0EyPZry4p1ztOesNxlqYh/V0i3o4WbLQ==
X-Google-Smtp-Source: ABdhPJzhOrOWLA4RPWj30Wiy+9Zw3F5RKbHYFHAqOwKOZWucLtAfuUNLgPxj9dvD4Pk3+Y8aQB9oXucDocLmRymC7ro=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr19173472otl.233.1627476231336; 
 Wed, 28 Jul 2021 05:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210727040021.21371-1-Kuan-Ying.Lee@mediatek.com>
 <20210727040021.21371-2-Kuan-Ying.Lee@mediatek.com>
 <CANpmjNM03Pag9OvBBVnWnSBePRxsT+BvZtBwrh_61Qzmvp+dvA@mail.gmail.com>
 <b6b96caf30e62996fa3b75ae8d146c9cc0dcbbf6.camel@mediatek.com>
 <20210727192217.GV13920@arm.com>
 <29f4844b1af163b0ec463fccbc9b902b3150f5c1.camel@mediatek.com>
In-Reply-To: <29f4844b1af163b0ec463fccbc9b902b3150f5c1.camel@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Wed, 28 Jul 2021 14:43:39 +0200
Message-ID: <CANpmjNNhSauZEp9W48WcrjK3w5-3cV5Rk4oc=Ci+h04+T2jsAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kasan, mm: reset tag when access metadata
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Nicholas Tang <nicholas.tang@mediatek.com>, 
 Andrew Yang <andrew.yang@mediatek.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Chinwen Chang <chinwen.chang@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_054355_688869_AFE8B9ED 
X-CRM114-Status: GOOD (  35.47  )
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

On Wed, 28 Jul 2021 at 13:05, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
>
> On Tue, 2021-07-27 at 20:22 +0100, Catalin Marinas wrote:
> > On Tue, Jul 27, 2021 at 04:32:02PM +0800, Kuan-Ying Lee wrote:
> > > On Tue, 2021-07-27 at 09:10 +0200, Marco Elver wrote:
> > > > +Cc Catalin
> > > >
> > > > On Tue, 27 Jul 2021 at 06:00, Kuan-Ying Lee <
> > > > Kuan-Ying.Lee@mediatek.com> wrote:
> > > > >
> > > > > Hardware tag-based KASAN doesn't use compiler instrumentation,
> > > > > we
> > > > > can not use kasan_disable_current() to ignore tag check.
> > > > >
> > > > > Thus, we need to reset tags when accessing metadata.
> > > > >
> > > > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > > >
> > > > This looks reasonable, but the patch title is not saying this is
> > > > kmemleak, nor does the description say what the problem is. What
> > > > problem did you encounter? Was it a false positive?
> > >
> > > kmemleak would scan kernel memory to check memory leak.
> > > When it scans on the invalid slab and dereference, the issue
> > > will occur like below.
> > >
> > > So I think we should reset the tag before scanning.
> > >
> > > # echo scan > /sys/kernel/debug/kmemleak
> > > [  151.905804]
> > > ==================================================================
> > > [  151.907120] BUG: KASAN: out-of-bounds in scan_block+0x58/0x170
> > > [  151.908773] Read at addr f7ff0000c0074eb0 by task kmemleak/138
> > > [  151.909656] Pointer tag: [f7], memory tag: [fe]
> >
> > It would be interesting to find out why the tag doesn't match.
> > Kmemleak
> > should in principle only scan valid objects that have been allocated
> > and
> > the pointer can be safely dereferenced. 0xfe is KASAN_TAG_INVALID, so
> > it
> > either goes past the size of the object (into the red zone) or it
> > still
> > accesses the object after it was marked as freed but before being
> > released from kmemleak.
> >
> > With slab, looking at __cache_free(), it calls kasan_slab_free()
> > before
> > ___cache_free() -> kmemleak_free_recursive(), so the second scenario
> > is
> > possible. With slub, however, slab_free_hook() first releases the
> > object
> > from kmemleak before poisoning it. Based on the stack dump, you are
> > using slub, so it may be that kmemleak goes into the object red
> > zones.
> >
> > I'd like this clarified before blindly resetting the tag.
>
> This kasan issue only happened on hardware tag-based kasan mode.
> Because kasan_disable_current() works for generic and sw tag-based
> kasan.
>
> HW tag-based kasan depends on slub so slab will not hit this
> issue.
> I think we can just check if HW tag-based kasan is enabled or not
> and decide to reset the tag as below.
>
> if (kasan_has_integrated_init()) // slub case, hw-tag kasan
>         pointer = *(unsigned long *)kasan_reset_tag((void *)ptr);
> else
>         pointer = *ptr; // slab

This is redundant. kasan_reset_tag() is a noop if
!IS_ENABLED(CONFIG_KASAN_HW_TAGS).

> Is this better or any other suggestions?
> Any suggestion is appreciated.

The current version is fine. But I think Catalin's point about why
kmemleak accesses the data in the first place still deserves some
investigation. Could it be a race between free and kmemleak scan?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
