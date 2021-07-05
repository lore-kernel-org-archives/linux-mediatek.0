Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBA2C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 11:23:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6E3F6135F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 11:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6E3F6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWK5VTjnxOXy1IAU2qO1r1ZYbW+P38Uyt3gIioFxqFM=; b=U7R4ARu03SX07a
	SIMkq+ZZweNuS1hsky+FkFV9U1S56b/tplvTBCODYGLTIsgF6RXRJjEk7Iut34+aM4MFnnXZFxKe2
	1DQLXtkX50hGd5m9AJon3TcCtp62r8CBaybayRljSpX/047pJHPMtYlXyKwEZlIU2uWelsOGCn3kB
	9DfvAixWWz8wjS0AZfjv9DtjHkVUXRN1o0I6psuNRNtXkBtH+lJoN64wxFQa86PZmiIP+/0an/4O1
	a28ZNziVdPGnINVnBHv3b1Vn9RAd6ou93sBXT3iffzKBQc+urPmYsZ3byr0gt64D8hmfKYvexZqmb
	d8ItS2UEUpI9bXPGs1IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0MhV-008kHB-58; Mon, 05 Jul 2021 11:23:45 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0MhF-008kEF-7P; Mon, 05 Jul 2021 11:23:30 +0000
Received: by mail-ed1-x533.google.com with SMTP id m1so23257676edq.8;
 Mon, 05 Jul 2021 04:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mdfkoj1lAbFutKa5lBXnsN9adsQUOWmNA/ZLqwOPGpk=;
 b=mWQhQjCBOWSXySjEfeb+vg4svQ/XwhAXPPEo50VHAEZRasrSO+6ohY4TfpRzrtkqlH
 r+7J2MKKBUvUrzkp89xszDBMBhn12q8RcynhlOASlSD84qAWtBY6a9kpkXAfwLn7BfYr
 KhOPY4RbDkPocGy4p8F8GREaZcXanMXSZJRyTdRjf8wfAvcEnnXx45RPYn4YYeL6eZe4
 p5kw5DTy8ehyG9HLBvM5rWQJXkXsZ+2ghsYU95lf2XOcIodK4a9HVXWOUY2rv5vvv4vS
 9D40H0/Qx+omS2SLjW0jfE9HKBJgS40somM3aAmiRd0rh1u+MU1eA7awdQpFxNeACyBv
 yMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mdfkoj1lAbFutKa5lBXnsN9adsQUOWmNA/ZLqwOPGpk=;
 b=IRXiKcGAraH637z66wETZoWlZgheSwv+P++Z4PYi805DVG+k3tovsO8dnV8j63lmWy
 yGzGNMbWSjXaw78onqBOhQnYjVOc7pb4FpvX7LA3Nmh86qGDVJbej/TAs5LlCjgY5L3/
 KZ/1pWgIDcZ+aSAIP8DhR/AnIQvWsXvskgR/0QAkGgW1xqQHHpd9+KEOwq0d8KOcsW6m
 JrvS/NDW8FdOAPJe4Pp4gycT9AEAc2I7gP8eQIOqWy6VwAoVpgMpizzYFJlE1B/6N5+l
 3QkF40tmtO7FZlgaUyYCUJw1STAT2d4WCtTZJsYv7XIEg038CW/PlB74sqvzKvaT/0mX
 i92g==
X-Gm-Message-State: AOAM533zfBfccTEJuMxtEzgspExGlAifCCwh1bSy37YM9G1FGdYKcvIN
 3XY7GOHHA4EvrhR5sZiagv4JXVK4pob6lysdgQU=
X-Google-Smtp-Source: ABdhPJwGH0p/imAnekqZjXgvncy4w5jEtjNHUlH1jV4COzYm+dvF06JV51V2eJSLAgxDFSYriStliogFD/cCFmOocbI=
X-Received: by 2002:a05:6402:5c9:: with SMTP id
 n9mr3126699edx.30.1625484207801; 
 Mon, 05 Jul 2021 04:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210705103229.8505-1-yee.lee@mediatek.com>
 <20210705103229.8505-3-yee.lee@mediatek.com>
 <CA+fCnZdhrjo4RMBcj94MO7Huf_BVzaF5S_E97xS1vXGHoQdu5A@mail.gmail.com>
 <CANpmjNNXbszUL4M+-swi7k28h=zuY-KTfw+6W90hk2mgxr8hRQ@mail.gmail.com>
In-Reply-To: <CANpmjNNXbszUL4M+-swi7k28h=zuY-KTfw+6W90hk2mgxr8hRQ@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 5 Jul 2021 13:23:17 +0200
Message-ID: <CA+fCnZfKAZuy9oyDpTgNUTcNz5gnfHpJK5WN-yBNDV5VF8cq0g@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] kasan: Add memzero int for unaligned size at DEBUG
To: Marco Elver <elver@google.com>
Cc: yee.lee@mediatek.com, LKML <linux-kernel@vger.kernel.org>, 
 nicholas.tang@mediatek.com, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>, 
 chinwen.chang@mediatek.com, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "open list:KASAN" <kasan-dev@googlegroups.com>, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_042329_347882_A9B6CD51 
X-CRM114-Status: GOOD (  16.72  )
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

On Mon, Jul 5, 2021 at 1:18 PM Marco Elver <elver@google.com> wrote:
>
> On Mon, 5 Jul 2021 at 13:12, Andrey Konovalov <andreyknvl@gmail.com> wrote:
> [...]
> > > +       /*
> > > +        * Explicitly initialize the memory with the precise object size to
> > > +        * avoid overwriting the SLAB redzone. This disables initialization in
> > > +        * the arch code and may thus lead to performance penalty. The penalty
> > > +        * is accepted since SLAB redzones aren't enabled in production builds.
> > > +        */
> > > +       if (__slub_debug_enabled() &&
> >
> > What happened to slub_debug_enabled_unlikely()? Was it renamed? Why? I
> > didn't receive patch #1 of v6 (nor of v5).
>
> Somebody had the same idea with the helper:
> https://lkml.kernel.org/r/YOKsC75kJfCZwySD@elver.google.com
> and Matthew didn't like the _unlikely() prefix.
>
> Which meant we should just move the existing helper introduced in the
> merge window.
>
> Patch 1/2: https://lkml.kernel.org/r/20210705103229.8505-2-yee.lee@mediatek.com

Got it. Thank you, Marco!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
