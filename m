Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4D8C64E7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 14:51:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1F29206B7
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 14:51:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oi2dvtbk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Od7Oq8i5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1F29206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mxnS7LvmXPQOuGJmj+XAvxrfsRJoPfVpo8ENfWxC78c=; b=oi2dvtbk4KfDExEwi8UJ/F0P0
	Nbp9wTtQIRrpqWUbGAM6L8h/xNkseaQzdqx7Gt84If3RxEKRqrvtA8RMkHjm3a/8Hqbgd0ylRHKf3
	ktsFP624mIdwjIGuq1miS61bEMB7BMf54CdhzPZ2kS9MRaSqBHAGeUiCvqJwsKWzXe80Qa3xkt/16
	Z3P6qfrNoEH3YjsTozt3nYWpt+ViEAIpytsBKA2RuE8T+97lIk7PhYMhhuPDYCk5vsn3go6nJzGK2
	4+hWtpJ6VLxTxJqIeDjSpqznwHYOiXG7wFhKd5nvEQgsSB7ooziODW36CM3BI/WNtgO1A3wb/H8mS
	QWXDb8Y5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk70A-0005Eq-Ea; Tue, 01 Dec 2020 14:51:34 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk704-0005DL-HJ
 for linux-mediatek@lists.infradead.org; Tue, 01 Dec 2020 14:51:29 +0000
Received: by mail-qk1-x744.google.com with SMTP id q5so1435777qkc.12
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Dec 2020 06:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=55sCzQdwTnWWY4frFoH/T/BSKgGKnPew/6aq6eljiTo=;
 b=Od7Oq8i5EKOt7lyAPLohe/T+qZWO41dmeqZhqZpqtDgfvunVjdg9tf32XLjJenj8L+
 JGidx639XPF8hqU42hKavQY/o0ww8LWaxLXeStBRoE5igoG8X9kxoORory35BiCYr0E9
 HzsGUGiqSTL1ts87Bl3ZH1DxxvuqoMl1tWsJ7EuEzbUtwafzKk0fS+JCI3C9x5JMkgFl
 LcOoRC5QQT2Vi2QFULdi/0FU32TizK504jXS8wi2Dtd7rZI3SGHSEPXMul3KJgenD9SV
 q8gQnWlGGaRf4lazzxswYs7WeQYK50tXi0qt5aobSwa6iH5VsOgJtcHrVMLessAf+PNy
 wf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=55sCzQdwTnWWY4frFoH/T/BSKgGKnPew/6aq6eljiTo=;
 b=LH36Cu3q+xvrJgPWBIc7ZEAq97yS/nbPx/ZVGC9rDF7k8+CRKB2ZsG81RvNUbghmrt
 orebyoD46JdwrVIHGqufsl8Sd4aaz1WfItfzyU/BmWCttIsys3O1apJREJuqbo7BCtjC
 PKA2I4BcZ8jXAaQIuGM9mJS35m1l6xxKXWVBnnPjAaS876H2aPZxqHYA1YslmFLCCrCh
 ZDjsZVm1PSnM2eBj9QhsCOYqZp8Aa0Yr4lv17RqkRarWgMGyOt70LL/XGj3EyZLdIwL7
 oXPvZ1bHIjDqeRQRXBG/pBu1dlq34dzH7oNcVV3o2IEJ5/m90vNEOZkmRTye8crggGRd
 HXyQ==
X-Gm-Message-State: AOAM530+/2mkD0X9g+LX0LHEh5avK6RPyxo3LTRq3IGA5zqwf6ttgK58
 BH8He1sqx3XpdheBudBq6+/sUIcQNXSmo2iYIPuWfw==
X-Google-Smtp-Source: ABdhPJzpKx5kjzDF60IrrSHfJjD1sCFpkAQsI2Hw2vF4+LKJGRJnyv7Y0PWJYKsCVbdIIj/02E5TWg3mKpDOj/VXPo4=
X-Received: by 2002:a37:7b44:: with SMTP id w65mr3270634qkc.350.1606834285972; 
 Tue, 01 Dec 2020 06:51:25 -0800 (PST)
MIME-Version: 1.0
References: <20200924040152.30851-1-walter-zh.wu@mediatek.com>
 <87h7rfi8pn.fsf@nanos.tec.linutronix.de>
 <CACT4Y+a=GmYVZwwjyXwO=_AeGy4QB9X=5x7cL76erwjPvRW6Zw@mail.gmail.com>
 <871rg9hawf.fsf@nanos.tec.linutronix.de>
In-Reply-To: <871rg9hawf.fsf@nanos.tec.linutronix.de>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 1 Dec 2020 15:51:14 +0100
Message-ID: <CACT4Y+bWm_bPdbes60u=3d_u34yxBBC7rGQz1yAt1FQXXqP4-A@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] kasan: add workqueue and timer stack for generic
 KASAN
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_095128_658684_D6E9416F 
X-CRM114-Status: GOOD (  19.86  )
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
 wsd_upstream <wsd_upstream@mediatek.com>, Linux-MM <linux-mm@kvack.org>,
 Stephen Boyd <sboyd@kernel.org>, Alexander Potapenko <glider@google.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Marco Elver <elver@google.com>,
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 John Stultz <john.stultz@linaro.org>, Andrey Konovalov <andreyknvl@google.com>,
 Tejun Heo <tj@kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 1, 2020 at 3:13 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >> > Syzbot reports many UAF issues for workqueue or timer, see [1] and [2].
> >> > In some of these access/allocation happened in process_one_work(),
> >> > we see the free stack is useless in KASAN report, it doesn't help
> >> > programmers to solve UAF on workqueue. The same may stand for times.
> >> >
> >> > This patchset improves KASAN reports by making them to have workqueue
> >> > queueing stack and timer stack information. It is useful for programmers
> >> > to solve use-after-free or double-free memory issue.
> >> >
> >> > Generic KASAN also records the last two workqueue and timer stacks and
> >> > prints them in KASAN report. It is only suitable for generic KASAN.
> >
> > Walter, did you mail v5?
> > Checking statuses of KASAN issues and this seems to be not in linux-next.
> >
> >> > [1]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22+process_one_work
> >> > [2]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22%20expire_timers
> >>
> >> How are these links useful for people who do not have a gurgle account?
> >
> > This is a public mailing list archive, so effectively the same way as
> > lore links ;)
>
> Just that it asked me to log in last time. That's why I wrote the
> above. Today it does not, odd.

Some random permissions settings changes were observed before, so I
can believe that.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
