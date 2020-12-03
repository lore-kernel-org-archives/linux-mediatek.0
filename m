Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2D0C64E7B
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 07:01:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 428CE2086A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 07:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 428CE2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lUYnrFzrwNYxNo3Na6hoMLYsVXSB5kb+Ke5N1JJslZc=; b=faYf3gSRsonlDthAXn9milOOe
	SW57Tu+KLiz9CDgZSftEunG37Hwn9TwUkEXAkOarZcNpHjd6iBMMN0tUL8hbH0YIo4P/oNAl+PLEG
	zSpaRPzz/B6/CbEfv+xBDVdRr+ML38S6ixgbYVX+MNsWHHSPYBBjU8+e6BzaI41xU+FOO4nxQT9OP
	UQPCvVbXvYdZE5E8YY2ZAIfrVzUX+wEYTK+7y7zs5uX0bDHmeggW94kL0nJdnrX9VDdG0Tl2xzyTW
	vVqAV5iXf0WUccpEBn9S8w+T2gGaYzCmmrbbBJTIF4THJORcN8WwPSS7QWGhJGbq27xmruTFHnsYr
	STdnIzBnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkicl-0002AP-CJ; Thu, 03 Dec 2020 07:01:55 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkicg-00028q-SE
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 07:01:52 +0000
Received: by mail-qv1-xf41.google.com with SMTP id g19so498768qvy.2
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Dec 2020 23:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pWQ9GYyKSHe1JGWbs3Y1m+BNCxpwEs1X4TY/MrUFeCQ=;
 b=AEJpqtMIVwb3X42BIB1/HJea4LLwUtS4HnA8BXFrGROZJqrBKSVEr1cu5IISBqSkrl
 P98xhyU/PWqUV10Y5FY1mzeyyJdt6dobJE2ldbkGkLNV+QXqPM0jBM9w92+NcNT515uJ
 teDyKYcrYvdP3I/iODLw/3Uu+lQrvOmKH0tMfac7aGhcyZzlWzPfWWhayrRW+XZMxdUO
 06kjm5KwxhHT3smLiB7izlolZjYqnhnGxX1tX0KOrnggY5TOSAj/fb6aXkuBkNS1fLok
 UETNSmvzdRygD1N+AwMvCPLwrz1/VvP/8YHeOCdUaeErlYgDkDl1IJxN3Arh6yPWj6F2
 XRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pWQ9GYyKSHe1JGWbs3Y1m+BNCxpwEs1X4TY/MrUFeCQ=;
 b=AO9vygU3jKliIHtAMuYlPmbaxbOwEWJlhbXAB8yw6HlrSUPeLFKwegSO5jybKlJK4o
 YcL7X89QhJjlHmRVSYQp9SIQ0rmDKQumgpf4QlFLoEQbiy0q6aGOpjA5pgnxnMbCR4iU
 Gnh5QxvR9YdAT/x9VRwdUyB553KoPiW7HxVOuu4lDAl1B5l8mvRzYVK3dBI9PhsQTq4Z
 LR3WhfoX2MzDzzsupsUFzAYkMAsRkM2249Opm1OAU8Os/5jFDerBOkgHgv8hFdohWV1x
 JGIBt9L4h3GBD3yrBMqR7EfeUgiXqBQJ1JpNbN2fEBWsAhGoRxd7Jhgg3cE7BkQY8kM3
 /zQg==
X-Gm-Message-State: AOAM530oE3aSeZUY8pAxg4lUEOTsy/RtttcE92P9jL0EOQ8cgpEB7A+G
 AGgUUo6GQbvZ5KpYdDAkEWMWJ8Hf+EIvPb0QYAfNow==
X-Google-Smtp-Source: ABdhPJz2rjhZqdGJa/6Mjj6mEetaVwe2kA0PLG5+48mAyehB6IZhfKIsje0X6UAhmPuKT58JOTMrZ+YDq5tQhz8LcqI=
X-Received: by 2002:ad4:5bad:: with SMTP id 13mr1695026qvq.23.1606978906682;
 Wed, 02 Dec 2020 23:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20201203022148.29754-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20201203022148.29754-1-walter-zh.wu@mediatek.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 3 Dec 2020 08:01:35 +0100
Message-ID: <CACT4Y+aQ19fUhDZMeLQeVzdECQhje6CpnH4SVmMQtS_cTPq0zg@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] kasan: add workqueue stack for generic KASAN
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_020150_949849_B329B38A 
X-CRM114-Status: GOOD (  18.88  )
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
Cc: Marco Elver <elver@google.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 Linux-MM <linux-mm@kvack.org>, Andrey Konovalov <andreyknvl@google.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>, Tejun Heo <tj@kernel.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 3, 2020 at 3:21 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> Syzbot reports many UAF issues for workqueue, see [1].
> In some of these access/allocation happened in process_one_work(),
> we see the free stack is useless in KASAN report, it doesn't help
> programmers to solve UAF for workqueue issue.
>
> This patchset improves KASAN reports by making them to have workqueue
> queueing stack. It is useful for programmers to solve use-after-free
> or double-free memory issue.
>
> Generic KASAN also records the last two workqueue stacks and prints
> them in KASAN report. It is only suitable for generic KASAN.
>
> [1]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22+process_one_work
> [2]https://bugzilla.kernel.org/show_bug.cgi?id=198437
>
> Walter Wu (4):
> workqueue: kasan: record workqueue stack
> kasan: print workqueue stack
> lib/test_kasan.c: add workqueue test case
> kasan: update documentation for generic kasan
>
> ---
> Changes since v4:
> - Not found timer use case, so that remove timer patch
> - remove a mention of call_rcu() from the kasan_record_aux_stack()
>   Thanks for Dmitry and Alexander suggestion.
>
> Changes since v3:
> - testcases have merge conflict, so that need to
>   be rebased onto the KASAN-KUNIT.
>
> Changes since v2:
> - modify kasan document to be readable,
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
> Documentation/dev-tools/kasan.rst |  5 +++--
> kernel/workqueue.c                |  3 +++
> lib/test_kasan_module.c           | 29 +++++++++++++++++++++++++++++
> mm/kasan/generic.c                |  4 +---
> mm/kasan/report.c                 |  4 ++--
> 5 files changed, 38 insertions(+), 7 deletions(-)


Hi Walter,

Thanks for the update.
The series still looks good to me. I see patches already have my
Reviewed-by, so I will not resend them.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
