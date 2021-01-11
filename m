Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775D1C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 17:40:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B3AC20738
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 17:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B3AC20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zmcAyWQU2mm4YVQTvuBciNXBpLaZxJKcpBVga/iCHFA=; b=A7pgzvhUygunttIyhxXeqLRqQ
	XmSYEkzWarm16HNPvZhJEoBQC10dvvYJhA4NAQGcvOH4ZLRNYbQoKmJ7OVs2ruUbTvV/PIq20xjAj
	jfnNP2izN75XzQqEFO1fW3FscoENxfWJie2ewVgn3JZM0lNa0II6RKDqZFbbflXSATTpj/QgAB2HI
	Ez0lGZ7zsy6rUNYzIXga00MyDQLh47RB/CiJpKvHK54U3gDNb1IaR2Hs/aJOW3pnwxY/ODK8OoSjP
	qfaicpTtq21++JOw/sJWu9+ibEZjyP/1uvgRInMkPuBiWrlvYYhJawLX94PG2aYSgq0jz9xI26YTs
	oowQaS+PQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz1B3-0003Kz-W8; Mon, 11 Jan 2021 17:40:27 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz1B0-0003I1-Vv
 for linux-mediatek@lists.infradead.org; Mon, 11 Jan 2021 17:40:24 +0000
Received: by mail-pl1-x630.google.com with SMTP id r4so196157pls.11
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Jan 2021 09:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qjQEnNzMbx9jfPqlYY0N0jYj1R3Q/O+LmSxzsF9dUuI=;
 b=vMdJQPxBpe62gqG1pM4PczjRnOrPEyBn6OX27rJgh3RoP9Bb8niJeXWnlLtYASKzs1
 3tec2zfE91shpqvsoUtUzkG/s3YvNOUBIs6QRIpbj5A2uTZilfmqSgEHCupMdmtcskw3
 z/0Ho9FHyV3j6J1WTeTJ6ki8j0WWTYpMEMl0kNXESAM7BHsOSEN5BvaVIJrRezTX9O++
 54WMwrTMCRPa2hxQD6G+aGtFz3ktlz5+uiSLFgT2YlOhNAAkdL03lR/0nNzjGTsVyTJY
 FPQNiuvc4oFV+C92Xx1rH933KYdXsTRE6t9fEHQ3WjlZaghphrDKguNdYDsJa+44c0Ob
 da3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qjQEnNzMbx9jfPqlYY0N0jYj1R3Q/O+LmSxzsF9dUuI=;
 b=O5Yju6fM9zEdii3rz85zNQQJt3zCOkuu8VuB3jokLLGBIChM0Tc8Lga7nhwhxUb3FR
 4TnlBNfLi6H3oCOJKzYUFPjOONi/L4VFjNIk9YDRUZGUlFXY53qBL+uMbT+OFaKCu7J4
 1oxeZntflchLM/Ho4OkXcqWV6UKfnipa7wOv0xT9HfcExZ5vTy3S3fG3LA5wBMkyRDCU
 EUQAXmSpoeSd/sT24RXaYoJehhJDPHLBl4LBLEOc9Em6ZSala9A61BLmtS2GUUsnf0YR
 TTtQpZoIMTZkkXKRXCIRgipODr85VUQGrS3nNQEerC20Rp8U/m9SAhgpXBhXnw3ciJkR
 RK8A==
X-Gm-Message-State: AOAM530B1Z5haoHkyyL4QhExOxr7b/X3d4+TbmjuXoGn8hfMG6KTSmA5
 AoEVeuo6RUvVHUVi3t+eFe0eHV69mkmGleHEtXu1qw==
X-Google-Smtp-Source: ABdhPJz90wo+LNABRutfNJ9IAurAbJzzUQp2ytJ+Y6N0wWoqRh/YQRSb/ZBZwZsHxcnBTnLqMoLIoyxfsgW7wTllDmY=
X-Received: by 2002:a17:90a:f683:: with SMTP id
 cl3mr383204pjb.136.1610386818720; 
 Mon, 11 Jan 2021 09:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20210108040940.1138-1-walter-zh.wu@mediatek.com>
 <CAAeHK+wW3bTCvk=6v_vDQFYLC6=3kunmprXA-P=tWyXCTMZjhQ@mail.gmail.com>
 <CAK8P3a3FakV-Y9xkoy_fpYKBNkMvcO7DPOQC8R7ku7yPcgDw3g@mail.gmail.com>
In-Reply-To: <CAK8P3a3FakV-Y9xkoy_fpYKBNkMvcO7DPOQC8R7ku7yPcgDw3g@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 11 Jan 2021 18:40:07 +0100
Message-ID: <CAAeHK+zB0=eBgrWTxcUK8GkxmUAn-W44NWDFE4zEB79CxVpwXg@mail.gmail.com>
Subject: Re: [PATCH v3] kasan: remove redundant config option
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_124023_098841_93636306 
X-CRM114-Status: GOOD (  18.05  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 8, 2021 at 9:31 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Fri, Jan 8, 2021 at 7:56 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > On Fri, Jan 8, 2021 at 5:09 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> > > @@ -2,6 +2,12 @@
> > >  CFLAGS_KASAN_NOSANITIZE := -fno-builtin
> > >  KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
> > >
> > > +ifdef CONFIG_KASAN_STACK
> > > +       stack_enable := 1
> > > +else
> > > +       stack_enable := 0
> > > +endif
> > > +
> >
> > AFAIR, Arnd wanted to avoid having KASAN_STACK to be enabled by
> > default when compiling with Clang, since Clang instrumentation leads
> > to very large kernel stacks, which, in turn, lead to compile-time
> > warnings. What I don't remember is why there are two configs.
> >
> > Arnd, is that correct? What was the reason behind having two configs?
>
> I think I just considered it cleaner than defining the extra variable in the
> Makefile at the time, as this was the only place that referenced
> CONFIG_KASAN_STACK.
>
> The '#if CONFIG_KASAN_STACK' (rather than #ifdef) that got added
> later do make my version more confusing though, so I agree that
> Walter's second patch improves it.
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Got it, thanks!

> On a related note: do you have any hope that clang will ever fix
> https://bugs.llvm.org/show_bug.cgi?id=38809 and KASAN_STACK
> can be enabled by default on clang without risking stack
> overflows?

Not sure :(

I've filed this on KASAN bugzilla to not forget:
https://bugzilla.kernel.org/show_bug.cgi?id=211139

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
