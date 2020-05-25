Return-Path: <SRS0=WPHR=7H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE3BC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 17:37:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE7BD2078B
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 17:37:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FlnX5dRT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="vrKxB8Ua"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE7BD2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jdh68WZ/QGzT6m9sG0ETwuUjcShI1k2+rchW043Lj8=; b=FlnX5dRT3lGgPd
	7mkKLSrRi4S0zcXm3rKxC9c7MmrPW1PSe7DAMwCUK/PkSpqDOzhmY6+yLSnoHNx/xNPwkil6XBEJX
	SxyOycR/IR3MjzqTr3RUrzGgWoZZpe3RAxiacN+X+RCKRc5Oo86Zvd9rYIW7Be6gR3EZ19JgHoVFe
	/oQpYgriRVAPUzzeAacVvjCYtTIVGw1pkHDErK9+dm0fssKRBq8HQ2fNM12P6z5GTgWXBL65GAMbJ
	1CqFuJCUEVWITLxndyFR+ZIB86qng8xW0U7wxZIABLmfpImXdR+ggISxfJjVSAZRr3Ykj7ZAF0VF5
	WIzI+x9zmpUbYj90M1Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdH28-0008TQ-Rr; Mon, 25 May 2020 17:37:04 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdH1m-00087o-Hr
 for linux-mediatek@lists.infradead.org; Mon, 25 May 2020 17:36:44 +0000
Received: by mail-pl1-x642.google.com with SMTP id t7so7691232plr.0
 for <linux-mediatek@lists.infradead.org>; Mon, 25 May 2020 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IJjU5AD78PQmMgIoxlhUE3XdqOGH2pnJ5GvxPy/ZWeA=;
 b=vrKxB8Ua+XZv4ykKGQgav6FhXKVJzsqZQi6l56ji2rRpxEXy+U0uFSAqqvLXB59YM0
 2msyq81bVTgHfqK1FdOumNDJOpeqzHcN+anyUyzdYd1b44EJu0EE+KyyQGK2cmGJCoIG
 ctxMlfJr9abZC4SFziuymzvUKKJ3ffJQ51PZUNeRBB084rim2V8/Aiq2ro76qwYi4XMO
 eHmtL/MBn5MCH5n6wnNm607QikhtfJzzD/tQLjCxlPOyYb9rfABOUj02gOqim7FQMVPb
 xd9nqr3CPh4Zc2mpGJTmD1gG6o+DuyFWZxpTMcTd86jxAvYgrndO34XI5WQhegqcftN7
 iV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IJjU5AD78PQmMgIoxlhUE3XdqOGH2pnJ5GvxPy/ZWeA=;
 b=sTr7kercnQkwM+YE0nSftuZMzAiXieokXpP3xdBktlv2clUg8LxPmwCYVzYQL59rdo
 mFoNm91kDyeyPYVsIn1dKbt62GR2BZs5vfFa+QybV0IWecBkipxzwQHNefqD29Xpfh6x
 yHnYrYucnjlRk1nBxqLpEU0IebOjT3oUkFBS7mzmEOm/erbpYQmkuYcGNtfEaM5zBpx9
 cc9zG0sqOPhgXADHeXLE5TRbWeLrETyrS3x2tg5JcD5jXui8LchEP6lXBmGgCtdN7e97
 3xAbo4DFOho0JkRedFcmvHvu6VpfPr9OQu59tuQEsLOL1SGhvOE/6aVo4XelDgJITJkW
 lHYA==
X-Gm-Message-State: AOAM5304CndPjfsALWh3QdGmJSttBeTTUzsdcfV3iRV6MMBe1GT0JA4x
 u6ozhAcw6RLYfFMO7x/+QJ7amij22ul+TmicfpAdAg==
X-Google-Smtp-Source: ABdhPJz0kSa4s6ANDBb+YqExevdOdc33aV3eoTivjXP7z1lS4l97h5suRM2uOi232ee0BDQo2/+CwFWu+Jw4ExRID7M=
X-Received: by 2002:a17:90b:1994:: with SMTP id
 mv20mr21281595pjb.41.1590428198538; 
 Mon, 25 May 2020 10:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200522015757.22267-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200522015757.22267-1-walter-zh.wu@mediatek.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 25 May 2020 19:36:27 +0200
Message-ID: <CAAeHK+y9qz5P-WCWEGwUx__XVzPXTddcOXsFDnFvh_1-k4Opxw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] kasan: memorize and print call_rcu stack
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_103642_660581_E172B91E 
X-CRM114-Status: GOOD (  21.70  )
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
 "Paul E . McKenney" <paulmck@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 22, 2020 at 3:58 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> This patchset improves KASAN reports by making them to have
> call_rcu() call stack information. It is useful for programmers
> to solve use-after-free or double-free memory issue.
>
> The KASAN report was as follows(cleaned up slightly):
>
> BUG: KASAN: use-after-free in kasan_rcu_reclaim+0x58/0x60
>
> Freed by task 0:
>  kasan_save_stack+0x24/0x50
>  kasan_set_track+0x24/0x38
>  kasan_set_free_info+0x18/0x20
>  __kasan_slab_free+0x10c/0x170
>  kasan_slab_free+0x10/0x18
>  kfree+0x98/0x270
>  kasan_rcu_reclaim+0x1c/0x60
>
> Last call_rcu():
>  kasan_save_stack+0x24/0x50
>  kasan_record_aux_stack+0xbc/0xd0
>  call_rcu+0x8c/0x580
>  kasan_rcu_uaf+0xf4/0xf8
>
> Generic KASAN will record the last two call_rcu() call stacks and
> print up to 2 call_rcu() call stacks in KASAN report. it is only
> suitable for generic KASAN.
>
> This feature considers the size of struct kasan_alloc_meta and
> kasan_free_meta, we try to optimize the structure layout and size
> , let it get better memory consumption.
>
> [1]https://bugzilla.kernel.org/show_bug.cgi?id=198437
> [2]https://groups.google.com/forum/#!searchin/kasan-dev/better$20stack$20traces$20for$20rcu%7Csort:date/kasan-dev/KQsjT_88hDE/7rNUZprRBgAJ

Reviewed-by: Andrey Konovalov <andreyknvl@google.com>

for the series.

Thanks!

>
> Changes since v2:
> - remove new config option, default enable it in generic KASAN
> - test this feature in SLAB/SLUB, it is pass.
> - modify macro to be more clearly
> - modify documentation
>
> Changes since v3:
> - change recording from first/last to the last two call stacks
> - move free track into kasan free meta
> - init slab_free_meta on object slot creation
> - modify documentation
>
> Changes since v4:
> - change variable name to be more clearly
> - remove the redundant condition
> - remove init free meta-data and increasing object condition
>
> Changes since v5:
> - add a macro KASAN_KMALLOC_FREETRACK in order to check whether
>   print free stack
> - change printing message
> - remove descriptions in Kocong.kasan
>
> Changes since v6:
> - reuse print_stack() in print_track()
>
> Walter Wu (4):
> rcu/kasan: record and print call_rcu() call stack
> kasan: record and print the free track
> kasan: add tests for call_rcu stack recording
> kasan: update documentation for generic kasan
>
> Documentation/dev-tools/kasan.rst |  3 +++
> include/linux/kasan.h             |  2 ++
> kernel/rcu/tree.c                 |  2 ++
> lib/test_kasan.c                  | 30 ++++++++++++++++++++++++++++++
> mm/kasan/common.c                 | 26 ++++----------------------
> mm/kasan/generic.c                | 43 +++++++++++++++++++++++++++++++++++++++++++
> mm/kasan/generic_report.c         |  1 +
> mm/kasan/kasan.h                  | 23 +++++++++++++++++++++--
> mm/kasan/quarantine.c             |  1 +
> mm/kasan/report.c                 | 54 +++++++++++++++++++++++++++---------------------------
> mm/kasan/tags.c                   | 37 +++++++++++++++++++++++++++++++++++++
> 11 files changed, 171 insertions(+), 51 deletions(-)
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200522015757.22267-1-walter-zh.wu%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
