Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15347C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 08:26:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB3BD2067C
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 08:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PfPaxTFY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="mE7Ydj/t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB3BD2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+9XMjiWu5ObetewhG5AMDI/XoGxKAKAKcxD1YZ4j4MY=; b=PfPaxTFYw0/QiS7nf7jkXN/gG
	0c79o0ZxqQ0XnyPRzDEa2LrX6hlMrop39zh6Du8mOFqfdoSGFqPpYf1cN0MfGewWEfraS8vGTELPq
	lGp2Yc/suXzFrZSVs4QzRdRhSWVG0Z4CudGrDa/FNvYR0Tn6ZZx+t0QctIF5AszKMoQGjmQo8brKy
	ZtfVzSd7KofXn52jvfTRycnQLqkQRnV69C6BOhe+hPFqspllQQUIbGHi4UNrg+/FZvd0qTGAi6aDZ
	r14waQsbPi8BWqZC5yHNNk61FJPiZ1+xcIHLOWMs17dfcHKaZxt4+9WC3cH9PZISpzNgWZoOlavA7
	ujSBJiEmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAUI4-0005Op-QE; Tue, 25 Aug 2020 08:26:48 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAUHz-0005Mr-Nf
 for linux-mediatek@lists.infradead.org; Tue, 25 Aug 2020 08:26:44 +0000
Received: by mail-oi1-x244.google.com with SMTP id z22so10895919oid.1
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Aug 2020 01:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FC5Hg6COXCLaWmmWNTz40PS96oTnHUqlyjZL5YEDjmI=;
 b=mE7Ydj/tIvyII6lomwmN1NR0MhMKAfEoekSi7y1J/k3ZNS2dnD6AhDjL5WPSSwIQhm
 2Q0JrJSi23rD3J5faSQlxhqF+ng5SP2GoY1jmrM9ck4FQNHYVtYw5Xf9DtY3k+SyszJ0
 uuXE7w7FrYLEXnDuOEPQx1wFVWbq40auNwZI2K+5sQsOdeUllOFcORseNaiXyghzY8Fz
 zTncDRbkjQoLPYoEXGJhL8nVkDUwA2XLDskzTyh7KR1ULBHzjN+sdbf3m8I9nksHQLrj
 PL+6W5Xb9f2gylfIg2mMFkN2yhST1Xw0vv/Cenk0s0RPc9aixJEPovw86FBtXCDVSMDv
 o98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FC5Hg6COXCLaWmmWNTz40PS96oTnHUqlyjZL5YEDjmI=;
 b=cyLUqMHF7AeSwl0SZxJD+lE/8ZkhhLegLDKHnyp4lWdsezFGylCaxLA45dMM+wqqb1
 AZC5QXBFNVUWUvAKEIPp50wzsfije7AXNTeBRt8W5JD2GQS9BF6w39NULYOEq4K6nFi6
 eEseQeK/plGhSIH8VHaL2UdQQ6FS2ylH6DRTFbjVqsWhPgP4Ja6uIT7xUsuQWeUS+7H6
 63GLW0Os+7OV6fOU5gUJK69eJD1UNJNZV3Y6RMZOanzPX3bxmy/1i91ScycMWZ7fLSYy
 ilDe1s2ce+cMtuPHBHGFL4WFTXHToN5MgXF8gp82a41lhVvM2i8xEv4ztlcsXGpKRt2K
 F6Jg==
X-Gm-Message-State: AOAM533aPhz9JGZglHjiCMruDNPz4Jf2/ksNR+PCWdl/3LTuW2UnIRBI
 8mhT5G/7eYXDxuPZ5behvT2Pa+Q3bdVqoO0R3NJGTA==
X-Google-Smtp-Source: ABdhPJxD71P1F4ZzbI6iFZEZrr1MZD1sm9wMnlc4GSnJlk+0Zk7Erabn/fwXngbccV76Y6VS7e44EThTikvb+R3DQfs=
X-Received: by 2002:aca:aa8c:: with SMTP id t134mr407296oie.121.1598344001584; 
 Tue, 25 Aug 2020 01:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200825015654.27781-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200825015654.27781-1-walter-zh.wu@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Tue, 25 Aug 2020 10:26:30 +0200
Message-ID: <CANpmjNOvj+=v7VDVDXpsUNZ9o0+KoJVJs0MjLhwr0XpYcYQZ5g@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] kasan: add workqueue and timer stack for generic
 KASAN
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_042643_911449_A8379B2C 
X-CRM114-Status: GOOD (  19.90  )
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
Cc: John Stultz <john.stultz@linaro.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Stephen Boyd <sboyd@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Tejun Heo <tj@kernel.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 25 Aug 2020 at 03:57, Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> Syzbot reports many UAF issues for workqueue or timer, see [1] and [2].
> In some of these access/allocation happened in process_one_work(),
> we see the free stack is useless in KASAN report, it doesn't help
> programmers to solve UAF on workqueue. The same may stand for times.
>
> This patchset improves KASAN reports by making them to have workqueue
> queueing stack and timer stack information. It is useful for programmers
> to solve use-after-free or double-free memory issue.
>
> Generic KASAN also records the last two workqueue and timer stacks and
> prints them in KASAN report. It is only suitable for generic KASAN.
>
> [1]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22+process_one_work
> [2]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22%20expire_timers
> [3]https://bugzilla.kernel.org/show_bug.cgi?id=198437
>
> Walter Wu (6):
> timer: kasan: record timer stack
> workqueue: kasan: record workqueue stack
> kasan: print timer and workqueue stack
> lib/test_kasan.c: add timer test case
> lib/test_kasan.c: add workqueue test case
> kasan: update documentation for generic kasan

Acked-by: Marco Elver <elver@google.com>



> ---
>
> Changes since v2:
> - modify kasan document to be more readable.
>   Thanks for Marco suggestion.
>
> Changes since v1:
> - Thanks for Marco and Thomas suggestion.
> - Remove unnecessary code and fix commit log
> - reuse kasan_record_aux_stack() and aux_stack
>   to record timer and workqueue stack.
> - change the aux stack title for common name.
>
> ---
>
> Documentation/dev-tools/kasan.rst |  4 ++--
> kernel/time/timer.c               |  3 +++
> kernel/workqueue.c                |  3 +++
> lib/test_kasan.c                  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> mm/kasan/report.c                 |  4 ++--
> 5 files changed, 64 insertions(+), 4 deletions(-)
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200825015654.27781-1-walter-zh.wu%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
