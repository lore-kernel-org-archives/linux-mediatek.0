Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79362C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 19:12:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B49F22B30
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 19:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B49F22B30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SjThdEr9uYvcsQeVyvH3qgrBWiPkGnBg5RPTUck15l8=; b=sUKR3pIf9aUWktiKKwm7mKcgm
	iakPT4Kg00Uir76rzhdy6WQyoAj/07vR2qMMGCMvU3a/A/x1CL2A8GX+xAtr234eI+F07Mbb5nJd3
	fwwWZJN8klNZEB7jx1LDNS1sK9qLtKekxUJt2z4ar9t5yACUSDLydpijk6A4VfPCzwNDbUrCd2lK4
	Vei12EUu5wRrF6qzRCtE50ES4AbSNPEn5Tn3y9pWEqfl/Pl2x58BERrJOe6ktEX5TKvuK8SQSkn1K
	KPSq8EPJFNZuP85WNM1SEXOp5UkZkGo9lxQq52svOPAPxJJTrCRhdJiTsnNI9+uRenPGOrHiUVLeY
	mKDe86eAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz2bn-0004it-BU; Mon, 11 Jan 2021 19:12:07 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz2be-0004g9-Sl; Mon, 11 Jan 2021 19:12:00 +0000
Received: by mail-il1-x12a.google.com with SMTP id x15so259616ilq.1;
 Mon, 11 Jan 2021 11:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=810FEXKXHgKArsdDAMgoY00MSSyM0BmX9OCgjLnP4Og=;
 b=UJTB+Bj11DFpIdm8er17rTscKDWE51w0Xw2dRRyGlLp/iO1XvzF3ESU45wDzK7AgLL
 KDzHNNcr0gD+4aSNEwy7d3hA0u2nWCIQA2DYbaGf+UeAYwShkiZ+6XXgEPg5aWBKG4Wu
 sNfwkvLkTFcF4Mjt9QBGXOd/6dSm3eTcjMYKx+Ixf2ZU2fmyqSEmGTiNtZC6wti70BYv
 VkZfW1ubZkvtjiu8as4xrHA+6DVXD1jDP7IHftAqlADXYweBvB9auFpDwzrWnVdfkAe5
 g73Tzg5BbqKTLA6PxoFatGMVIdra+iw66fP1QXBemXrcBZIh7Uq5zHA7VsrIG0HID5Y0
 QwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=810FEXKXHgKArsdDAMgoY00MSSyM0BmX9OCgjLnP4Og=;
 b=Zh9ldJn3IumhMX3OdocSCfBrg7yo4pzq4MuIiI0hC1klF5s6eT0ELdcG/l8qOS9Elb
 9EtgvRI5oTRgqVDMhjf9RuyTKSaVywTTmg1wZXoQpzBBnclMv6ZQ3VKR5aTlehwsKc6T
 l9YozANsrHZNukiXVwe+fRfsIyC1/+SIhqKVPU7nHMLHxuY/RPAvLd/2z9JSawpFtbT1
 Oyvk1Y5epe40p13v3ql6WuI0+JPOrkNeJAplf1PQWsDXl7xFp0ednZCiNe7MklATgvLL
 BIj0flQLyFL+BxKy3f8AZLptP26bOWLm2AYAUvaffsMrqrqGSYik1XhC+fFGTjyL68W8
 qZGQ==
X-Gm-Message-State: AOAM5336ByE6hSYlDgdc8YRdzZmj06F4l/2OISeZflpmzs8JJIbQ3JdC
 X2w4j5nsbT9fplHh19wi5kI=
X-Google-Smtp-Source: ABdhPJyhbehmXWz3weu+cQnoRjDTjfr+Jz7S4Ow/uhQ6OpqWgtRhziYeTCnADFiQaWp9ee8lKcg0aw==
X-Received: by 2002:a92:d2ce:: with SMTP id w14mr628841ilg.182.1610392316821; 
 Mon, 11 Jan 2021 11:11:56 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id 143sm316464ila.4.2021.01.11.11.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:11:55 -0800 (PST)
Date: Mon, 11 Jan 2021 12:11:54 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v3] kasan: remove redundant config option
Message-ID: <20210111191154.GA2941328@ubuntu-m3-large-x86>
References: <20210108040940.1138-1-walter-zh.wu@mediatek.com>
 <CAAeHK+weY_DMNbYGz0ZEWXp7yho3_L3qfzY94QbH9pxPgqczoQ@mail.gmail.com>
 <20210111185902.GA2112090@ubuntu-m3-large-x86>
 <CAAeHK+y8B9x2av0C3kj_nFEjgHmkxu1Y=5Y3U4-HzxWgTMh1uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+y8B9x2av0C3kj_nFEjgHmkxu1Y=5Y3U4-HzxWgTMh1uQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_141158_996690_5E2BC3D4 
X-CRM114-Status: GOOD (  20.12  )
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
 wsd_upstream <wsd_upstream@mediatek.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 08:03:29PM +0100, Andrey Konovalov wrote:
> On Mon, Jan 11, 2021 at 7:59 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > > > -config KASAN_STACK_ENABLE
> > > > +config KASAN_STACK
> > > >         bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
> > >
> > > Does this syntax mean that KASAN_STACK is only present for
> > > CC_IS_CLANG? Or that it can only be disabled for CC_IS_CLANG?
> >
> > It means that the option can only be disabled for clang.
> 
> OK, got it.
> 
> > > Anyway, I think it's better to 1. allow to control KASAN_STACK
> > > regardless of the compiler (as it was possible before), and 2. avoid
> >
> > It has never been possible to control KASAN_STACK for GCC because of the
> > bool ... if ... syntax. This patch does not change that logic. Making it
> > possible to control KASAN_STACK with GCC seems fine but that is going to
> > be a new change that would probably be suited for a new patch on top of
> > this one.
> 
> The if syntax was never applied to KASAN_STACK, only to
> KASAN_STACK_ENABLE, so it should have been possible (although I've
> never specifically tried it).

CONFIG_KASAN_STACK was not a user selectable symbol so it was always 1
for GCC.

Cheers,
Nathan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
