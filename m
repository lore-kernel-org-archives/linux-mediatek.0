Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EECC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 11:50:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0A4E2067C
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 11:50:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yrhTMve9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="oLyJ6GRK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0A4E2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CYCt1yHT6syARL8H5KfvYs6TYPkc+UC3H3i2oZA9tfE=; b=yrhTMve9Wvc/QFIgdu1jKDbre
	bwa88nAVN6RYxnpD9bD1hHVMf7qiPM2FYt9Q2uPmxX2V+scRrvoYYqBJAAlJGOqEjjy/efnLpk3QG
	Yw3Hpw+mOA/CEjWBxLnoV2875lcqZmO0oUsz7piPH0e7gPQjSgK19IESShj1UAxfL3HGhVIVQ5uz/
	nDi6ZDars37UC05Jr03y+g7YUbugr9x3AK7lS+cS3wYxb0cbfmPyX9J3EJAzuI/FJiKHMGX2/zLoJ
	xZSFFoBX+KD98nl8XwzimN2yebLZebYGOA4owPne57KTmTBHVg7zOJP4981gb4vYtenEBbbeydiM3
	c3IMoNlrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAAza-0003kE-IZ; Mon, 24 Aug 2020 11:50:26 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAAzW-0003hw-Cf
 for linux-mediatek@lists.infradead.org; Mon, 24 Aug 2020 11:50:24 +0000
Received: by mail-ot1-x341.google.com with SMTP id k2so433317ots.4
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2020 04:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yJXg3YmJV9VmBBuMxTtghIxF3sII7GvdsrK6BwX4Nus=;
 b=oLyJ6GRKHTm1t7mgGpDwN4erpee2C2K8InRMviIFM7ItOZjfGHwrLx5AqYVOyiaj2H
 Sut0+dlkdVXZjAi7t6gZDvKzPxSlKEVjXEXukWfDse9h4cuaBBoHnh8nLCJnowemg/gp
 OBPAHWMwTO2x0X0nGFhP1VkCLuv2QlfwmAOgXeKwSFhOB1mhlIHVv9tX3val2OmziOqL
 KPTYLiXiQBhJxzN5Qip06U+Xx/adZQ8VHy13CgZ7WTjW3CJfkqFD3cc/vMOMqxFDP2d/
 ci8FSMbFgXLLI+sGzo1XDEnZB+xvTYLArHLLB9OJ+Ku8Yj8EkrGjlqkkGP0s7pdstJok
 DJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yJXg3YmJV9VmBBuMxTtghIxF3sII7GvdsrK6BwX4Nus=;
 b=LvsSBr7SQt/ynWrHtLOhuyi98Ybzlrn8tcNJ9E96uaXg/mmQfTR69oHup5M1phYglX
 1jJPgmI7a8I5XJ1NRTjH51cWPP5OGvboQ8BXx4mTZRXH+3Bze6gzwT8qQxFqg3Oi2b7l
 oH0x0dUHxDxGjH5CBy59SVbpLxHPJqUG5un6mkvJNaWOHarWSyPJfxgwoyrsBM+mwKL8
 Jn2A8fOfbklYIQ9w+TyZHvwcPK8bjyeo1GczKIPpjemM3u42CFgFA3ZVf/nPXetzcKhb
 sVh1sKFOaEXdNcUae+suAarAKhhLn6ZfBl4wNBdcTKWrxdBdU6FdCeGME9wIDWnPkCfU
 iKGQ==
X-Gm-Message-State: AOAM533gakqHqH1OTTWvZ5vRDlhBeOuaJ7A9AGbm2La/BYCgNdOd9R+J
 ic+6ZDA6GkvjjJc4dnzKRh8fr7EyN6lyq+MhD3zfuw==
X-Google-Smtp-Source: ABdhPJxY6ICnrMzo1mNkyVVmig6kmZLJrD1Ga0fs2iobFX/jQG+jCprR22w/YZrmq6KdxX46yuF7HEXTXgAX+iTF6Ik=
X-Received: by 2002:a9d:739a:: with SMTP id j26mr3480830otk.17.1598269819856; 
 Mon, 24 Aug 2020 04:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200824080706.24704-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200824080706.24704-1-walter-zh.wu@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Mon, 24 Aug 2020 13:50:08 +0200
Message-ID: <CANpmjNNYhYwyzT3pBzJdb=XCGyLj7X+Fhqui-6JAZJWGys25Rg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] kasan: add workqueue and timer stack for generic
 KASAN
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_075023_026538_A223FAEE 
X-CRM114-Status: GOOD (  14.37  )
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

On Mon, 24 Aug 2020 at 10:07, Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> Syzbot reports many UAF issues for workqueue or timer, see [1] and [2].
> In some of these access/allocation happened in process_one_work(),
> we see the free stack is useless in KASAN report, it doesn't help
> programmers to solve UAF on workqueue. The same may stand for times.
>
> This patchset improves KASAN reports by making them to have workqueue
> queueing stack and timer queueing stack information. It is useful for
> programmers to solve use-after-free or double-free memory issue.
>
> Generic KASAN will record the last two workqueue and timer stacks,
> print them in KASAN report. It is only suitable for generic KASAN.
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
>
> ---
>
> Changes since v1:
> - Thanks for Marco and Thomas suggestion.
> - Remove unnecessary code and fix commit log
> - reuse kasan_record_aux_stack() and aux_stack
>   to record timer and workqueue stack.
> - change the aux stack title for common name.

Much cleaner.

In general,

Acked-by: Marco Elver <elver@google.com>

but I left some more comments. I'm a bit worried about the tests,
because of KASAN-test KUnit rework, but probably not much we can do
until these are added to -mm tree.

Thanks,
-- Marco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
