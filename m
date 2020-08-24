Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA774C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 11:46:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A986206BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 11:46:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mYWhZ77n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="iuMev4pI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A986206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JweiDqakYx7BYdfyE3d7UxAdKFymXNpn9/8/EMtADWg=; b=mYWhZ77n6/auXWx4xU7pnsU7c
	cKpOAPZnluKr8/pu1UE3/qeucQFLZ3sEl2bmoZhBgUnCOMdWdZr41x6JSdt9D8E6Ij4cnkpKIZNRA
	m1x+m2neOwVbiVv03Qhpap2ofWtxy+avD/qzVwQxhGhz+qLQG5IKq3/q58shaHOt+q4EwTovb1sx0
	3UkmVrm/Zl0B6DFuEwevzUbPAf7DkbMk+QGmdmTo17616tIKbcz1K9A9DxyIC2jyfdJVVMxt1ci6j
	k9lZgOGjpBaTJQd7yd+S6R3FPStcKeMINk3oxgVZlQJ+VlonDUN8Yy/hGs9AeIQCwxEpp0Ci+AAU2
	Tfzxxirjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAAw1-0002zq-Vx; Mon, 24 Aug 2020 11:46:46 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAAvw-0002xP-SH
 for linux-mediatek@lists.infradead.org; Mon, 24 Aug 2020 11:46:42 +0000
Received: by mail-oi1-x242.google.com with SMTP id b9so4522176oiy.3
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2020 04:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HSpd9ndfyXeRtsopkN5H4Z9El4e9MphbysoofBmUjKk=;
 b=iuMev4pI1UXTK36SU5vo9Kb9A9hOWP30Dj81Zo7qdgxbcyzH0j8fQwJHFTueOj095U
 5slvsAiAYB4ZSz7mRzUwSk2bkGa0/TJnvlcnEPFiEug1QedBDSwH6I5zjK3kSswknmUx
 Lzol4pMRkdLbVAB94FPqz4XQkcp8nuM2aRbklxyqY7e/ebJt0i1fNKFTvYbotc4DVv+b
 FSS6rdqU4gpSNqKcv464DOsapk+LPNAJUGEC6e5l72ZEKjM0PscLBYKA6KntyFjA96ud
 rjUhcbtVF+UYWBO11lyINnbB1kgj9RQdFFUSLkEH7UzhcbNRix3StySlX86yNNgHEeTe
 F4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HSpd9ndfyXeRtsopkN5H4Z9El4e9MphbysoofBmUjKk=;
 b=CAo3hX4ZeSxuhRroauC6a/pntlTUzmTF52cH9oXIzW0UuanbpgzE7bl/ep7oE6GIjd
 m29tJlIyv+RmWBiOI/f24yACgjuUwkNw6Qrgho2eko4LZUInhoJTawwgYpwZxhnbrJ5g
 GupsBEf5B+W8ew+aV0fXQJmfJqp5/Q/o+vcOlRwkO4N0hv7JBA0IaowUevKP+e+5d98L
 SGHW6zf1PKFkkGttz3qHzAhJCIQ+K97KlqBfwi+z7WMloFZbB06de//Qa8XhXYJvv+Wx
 8Mbo3ETPxnlGgKNkbRIwesGieB8fiRo+9tYLmLUjjOc4zQPzTchEEPva4OSP3wLJQlpL
 qDzg==
X-Gm-Message-State: AOAM533akCcWVJ9WP/mn1Sv3g1Mh4Sf9OX8me/QF/b7ecS/7ml1y5bq2
 KRkU5QhbVDiyr7HZvGmFhSR6kFKKz60nNg7vQnVZdA==
X-Google-Smtp-Source: ABdhPJy6Rvbpz4OVF7+E6Ibj6h44yQcnycBjoZStHMF7KBGlki8rKNee1gTheosMNsZuvJoobdu2aNNGxai7LvPhZeA=
X-Received: by 2002:aca:cd12:: with SMTP id d18mr156277oig.70.1598269596930;
 Mon, 24 Aug 2020 04:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200824081433.25198-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200824081433.25198-1-walter-zh.wu@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Mon, 24 Aug 2020 13:46:25 +0200
Message-ID: <CANpmjNOSKQi+wYbCVYqL-LriqCD37GtOfrArB0hyKysaPYyzGQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] kasan: update documentation for generic kasan
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_074641_045034_79B0D19D 
X-CRM114-Status: GOOD (  17.46  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 at 10:14, Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> Generic KASAN support to record the last two timer and workqueue
> stacks and print them in KASAN report. So that need to update
> documentation.
>
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/dev-tools/kasan.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index fede42e6536b..5a4c5da8bda8 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -193,8 +193,8 @@ function calls GCC directly inserts the code to check the shadow memory.
>  This option significantly enlarges kernel but it gives x1.1-x2 performance
>  boost over outline instrumented kernel.
>
> -Generic KASAN prints up to 2 call_rcu() call stacks in reports, the last one
> -and the second to last.
> +Generic KASAN prints up to 2 call_rcu() call stacks, timer queueing stacks,
> +or workqueue queueing stacks in reports, the last one and the second to last.

We could make this more readable by writing something like this:

"Generic KASAN also reports the last 2 call stacks to creation of work
that potentially has access to an object. Call stacks for the
following are shown: call_rcu(), timer and workqueue queuing."

Thanks,
-- Marco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
