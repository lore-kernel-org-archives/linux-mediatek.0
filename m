Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6888C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 15:05:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACDBA60F46
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 15:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACDBA60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpUovIxflbhP92IavX7iSPQET8FRqFvrVUhaXTtTODA=; b=4bh9pH5D6uIugE
	bNpIwAJ4Js6TlxBIIsGfa2Z3h32ie7+X2whZlyroUXzvkeD0Hy6f2evTI13ZlXB/MbsYMUYe1GlgR
	D20yOceQcJxHwFvWbqaQQ56JSDCnwBMO7d96E+FOYuKCGKpxJvMFET4BV75eoJagGy2DccM7KreeQ
	OFB0tLSzBi+kvInqaOlsCU5qZ5l5DwLyPCZ5msp3axDueWLcauD6I1QWBN+kFxCBvY2L64uLBn0DM
	Oql0WObyk5Y7NIJck9FOA7n7yxCGNrtYYhPuAVkb4LyfhtDtfspUuwF7b4cEIn2TG6ZAFCG73H0sj
	eRrFzng/F3+mO0I6zEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9U4l-0099GL-7M; Fri, 30 Jul 2021 15:05:27 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Tx7-0095IH-J4; Fri, 30 Jul 2021 14:57:35 +0000
Received: by mail-ed1-x52e.google.com with SMTP id n2so13540879eda.10;
 Fri, 30 Jul 2021 07:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/FskvzB/Uu7kITCTpEs9Kzb0h3ZTsKYWrhXodwFjiIk=;
 b=qdwGk32T8LIniVGMFzFAJe6RX68qQNMkrxYLkZOSF0T3vabQA/oH99TgvDLAWpUnVw
 EMBEBrTyyu0bszCCLjMP+rMRob7mlE+AovtCZo27qSMkPTfe3g4yfg3QDpcCqjJ89AuG
 5iZit8yuHeSIYaG0jTc9sVQLYXBZw3Oj72RnERwCr0dEmHLBHAXxmyrR6JdjEoMnNvM2
 oy8pFEKMaJ0In9p6GeDe3RQvqg0ySFCkiFuMb0Me2Voz97GzdR0EOgdUS19VKNUiQBYH
 8vYVD3AOWJfaGfatwjNQbmUH4uofJCPG5u97wjWpuM3UV+70caNlBUULFH5JOjXfwi1q
 iRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/FskvzB/Uu7kITCTpEs9Kzb0h3ZTsKYWrhXodwFjiIk=;
 b=Hwyvcoja1iCZuzoGhkdy6J+o33o0UJ/RXrFxj68YsVofQLCxYEf0bywDlYgaprNuKU
 IZ1hlKlFmGF4zUblXXz3WiG9oBakeKdiHNV3DH3lPjHLWaTJMUHecIwxUMXtsCdxv2Xx
 ZGQJMAx2CbdjTdCwslbUXXGR5IxfnCLFgPUsuejr1IBcgHItk6pm9wpK1EWvu8I1XRAv
 0yiOaP9DY9g8EGcODF8UOmOKjJtFo0cA2dIFJylmi2KluE7gJv6cDnpIsRr+whQ7eJgB
 FbMJ1+mtmXY5xJaxPpHaiWcpzyHcM2cBSCVSgSyBT5Tpor6yos7eTCS/3aezpHlepeNs
 EClQ==
X-Gm-Message-State: AOAM531QshSaLBkcw3exKNuRceRKwKvtYKsHehJEIBtUqe0jJrB/9G6+
 hHpiK2dWyUkelR8VGs1p0hUpeAslCYAICKY+WCA=
X-Google-Smtp-Source: ABdhPJwSaMVLnatukbBUZ5bbG5wTLiLIbZNXBz6UHbZ62TjHZpcXELPVn/H+RxE5RRcBCR7Zb+SxC2GibF9zBMAwoE0=
X-Received: by 2002:a50:eb88:: with SMTP id y8mr3436558edr.70.1627657051382;
 Fri, 30 Jul 2021 07:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210727040021.21371-1-Kuan-Ying.Lee@mediatek.com>
 <20210727040021.21371-2-Kuan-Ying.Lee@mediatek.com>
 <CANpmjNM03Pag9OvBBVnWnSBePRxsT+BvZtBwrh_61Qzmvp+dvA@mail.gmail.com>
 <b6b96caf30e62996fa3b75ae8d146c9cc0dcbbf6.camel@mediatek.com>
 <20210727192217.GV13920@arm.com>
In-Reply-To: <20210727192217.GV13920@arm.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 30 Jul 2021 16:57:20 +0200
Message-ID: <CA+fCnZdprormHJHHuEMC07+OnHdC9MLb9PLpBnE1P9TvrVisfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kasan, mm: reset tag when access metadata
To: Catalin Marinas <catalin.marinas@arm.com>,
 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Marco Elver <elver@google.com>, Nicholas Tang <nicholas.tang@mediatek.com>,
 Andrew Yang <andrew.yang@mediatek.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 kasan-dev <kasan-dev@googlegroups.com>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_075733_700208_BCB79BE9 
X-CRM114-Status: GOOD (  29.20  )
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

On Tue, Jul 27, 2021 at 9:22 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Tue, Jul 27, 2021 at 04:32:02PM +0800, Kuan-Ying Lee wrote:
> > On Tue, 2021-07-27 at 09:10 +0200, Marco Elver wrote:
> > > +Cc Catalin
> > >
> > > On Tue, 27 Jul 2021 at 06:00, Kuan-Ying Lee <
> > > Kuan-Ying.Lee@mediatek.com> wrote:
> > > >
> > > > Hardware tag-based KASAN doesn't use compiler instrumentation, we
> > > > can not use kasan_disable_current() to ignore tag check.
> > > >
> > > > Thus, we need to reset tags when accessing metadata.
> > > >
> > > > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > >
> > > This looks reasonable, but the patch title is not saying this is
> > > kmemleak, nor does the description say what the problem is. What
> > > problem did you encounter? Was it a false positive?
> >
> > kmemleak would scan kernel memory to check memory leak.
> > When it scans on the invalid slab and dereference, the issue
> > will occur like below.
> >
> > So I think we should reset the tag before scanning.
> >
> > # echo scan > /sys/kernel/debug/kmemleak
> > [  151.905804]
> > ==================================================================
> > [  151.907120] BUG: KASAN: out-of-bounds in scan_block+0x58/0x170
> > [  151.908773] Read at addr f7ff0000c0074eb0 by task kmemleak/138
> > [  151.909656] Pointer tag: [f7], memory tag: [fe]
>
> It would be interesting to find out why the tag doesn't match. Kmemleak
> should in principle only scan valid objects that have been allocated and
> the pointer can be safely dereferenced. 0xfe is KASAN_TAG_INVALID, so it
> either goes past the size of the object (into the red zone) or it still
> accesses the object after it was marked as freed but before being
> released from kmemleak.
>
> With slab, looking at __cache_free(), it calls kasan_slab_free() before
> ___cache_free() -> kmemleak_free_recursive(), so the second scenario is
> possible. With slub, however, slab_free_hook() first releases the object
> from kmemleak before poisoning it. Based on the stack dump, you are
> using slub, so it may be that kmemleak goes into the object red zones.
>
> I'd like this clarified before blindly resetting the tag.

AFAIK, kmemleak scans the whole object including the leftover redzone
for kmalloc-allocated objects.

Looking at the report, there are 11 0xf7 granules, which amounts to
176 bytes, and the object is allocated from the kmalloc-256 cache. So
when kmemleak accesses the last 256-176 bytes, it causes faults, as
those are marked with KASAN_KMALLOC_REDZONE == KASAN_TAG_INVALID ==
0xfe.

Generally, resetting tags in kasan_disable/enable_current() section
should be fine to suppress MTE faults, provided those sections had
been added correctly in the first place.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
