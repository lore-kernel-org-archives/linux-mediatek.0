Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40F2C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 13:46:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C13AA206B5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 13:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ia3hRaMv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="L4Ekwisf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C13AA206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vjPonlLkaDnpUzgO8VyiOMQv8kLJmwGm8vtkg3k0+28=; b=Ia3hRaMvDwLhZ5e64Rpx3yVbK
	9mzVv9M5FYtwS9p+PUgFnZtEVA0xMZZyQ36Yh3rJdQezEyJbrygq9A9uLui24XrL6kUFOrtLhBCfu
	Wx/wRmCjKB0EJ3ZrnpJtSujU8VExtcwTQCKJz+qpQ/4Pi5+71BhL88s30AvEybAe27ispGbshJzM8
	gtZ1abbwfWZtaMy2odiqPkQ30y8BlJHbhba8hoGqrvvLu0FQWkUr6yOhbcYp+LZOwW7eKPODdO3x2
	It3rTxaBhqwAxVhw30eVI1B/CtVkXj0V0YyZGqdwSQjBZU7QNvnIVf8KWBtmuIrqvOyI8DHUziesm
	hlVkN9kjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kACni-0005EN-4t; Mon, 24 Aug 2020 13:46:18 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kACnd-0005C7-Et
 for linux-mediatek@lists.infradead.org; Mon, 24 Aug 2020 13:46:14 +0000
Received: by mail-pl1-x641.google.com with SMTP id r4so4256206pls.2
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2020 06:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kCkJ5WyjWp/vo15sfOy04O9dC6dPdDe+nxNNjru5ZGQ=;
 b=L4Ekwisfob8lARUVm4IHX3FSJQrLhsxH1pNhXY+IU4Jl5JmiwnHFq4kC+ZkoUgOmTF
 oRxm0wToaEKJKO4tLNn6/l/IbT/fPOEy8H5nh0aJGhI8AJPtc3yAZkw3Pklb8nDKpVTZ
 sb+l2wno0t2WM3QWkGJPS2hXaU5ciwx7kBOSduO8r9OP/phqdKZ70GrZuTjvtp43wuvd
 zi2orafnwRsVj9eU9Gzv2Z9QJenI/AXGEIZGjWwxssOBvL6wdxgf1Wd5MugS4Gu4Dq+u
 gNOJJ+kFq8iLGHNcGlIQvv6gEbWiOXgCP/msm39irv9GzYAwCC22QJe/X5ND0WU7nSvx
 +kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kCkJ5WyjWp/vo15sfOy04O9dC6dPdDe+nxNNjru5ZGQ=;
 b=heFS7VjCIbDh8+41WjKSdyGDwc3l1vmnx0sXO3rpqlNYdWiVPuykvXyGlTK/zPDmgn
 Kck4Wy35Utes2Ln6Y3oALsBY6w0Qe+6dIvkDHF8QWN5I57WZvomfMzq54lr+xYiU9UnE
 uaKKfVhmvKAsHfj6h+6uOeZMrgAAUoEtL3In1Npaafw3aZXqABrW7zR37/R35LT0uhXy
 5H6W7tQmZwVKVrncLswXRR26kimivG4J5oSyfVMtYvwkn16EqIieqW8jkM4rGB0AKT9c
 dGKRY9svs+dbPCDtb0TvQF//py0e2WtIAkcTFCHaW1lihFERwn7+mXZkHwSizvhKK1wF
 tgMQ==
X-Gm-Message-State: AOAM533A5LdOoJBHYHwvo991JU9Wy9getVzWaXbch3VIW8pI/2gfkJYZ
 6NBCJ2uWK2PxrNimwvrpPEsACWTuTa01X/cnUGeuVQ==
X-Google-Smtp-Source: ABdhPJx+5AvTxkSnNbppFehjvnHPzRzC3+yOqtfyATDKvQu5nlD7W4qLlvriyKbSeuNAKL00SFlARsrh8YiIyNzkaco=
X-Received: by 2002:a17:902:6944:: with SMTP id
 k4mr3098268plt.147.1598276768239; 
 Mon, 24 Aug 2020 06:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200824081353.25148-1-walter-zh.wu@mediatek.com>
 <CANpmjNNf5pr=0hKVo92M9fEnCy7sYbv==6Bv_sVSmn=rZi7JEA@mail.gmail.com>
In-Reply-To: <CANpmjNNf5pr=0hKVo92M9fEnCy7sYbv==6Bv_sVSmn=rZi7JEA@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 24 Aug 2020 15:45:56 +0200
Message-ID: <CAAeHK+w3n3f4iA_WmAKAr+mKRxu+0Trfs7mGD=i2SWodfF448A@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] kasan: add tests for workqueue stack recording
To: Marco Elver <elver@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_094613_561357_6A8DFEA1 
X-CRM114-Status: GOOD (  17.64  )
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
 wsd_upstream <wsd_upstream@mediatek.com>, linux-mediatek@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 1:49 PM Marco Elver <elver@google.com> wrote:
>
> On Mon, 24 Aug 2020 at 10:14, Walter Wu <walter-zh.wu@mediatek.com> wrote:
> >
> > Adds a test to verify workqueue stack recording and print it in
> > KASAN report.
> >
> > The KASAN report was as follows(cleaned up slightly):
> >
> >  BUG: KASAN: use-after-free in kasan_workqueue_uaf
> >
> >  Freed by task 54:
> >   kasan_save_stack+0x24/0x50
> >   kasan_set_track+0x24/0x38
> >   kasan_set_free_info+0x20/0x40
> >   __kasan_slab_free+0x10c/0x170
> >   kasan_slab_free+0x10/0x18
> >   kfree+0x98/0x270
> >   kasan_workqueue_work+0xc/0x18
> >
> >  Last potentially related work creation:
> >   kasan_save_stack+0x24/0x50
> >   kasan_record_wq_stack+0xa8/0xb8
> >   insert_work+0x48/0x288
> >   __queue_work+0x3e8/0xc40
> >   queue_work_on+0xf4/0x118
> >   kasan_workqueue_uaf+0xfc/0x190
> >
> > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> > Cc: Dmitry Vyukov <dvyukov@google.com>
> > Cc: Alexander Potapenko <glider@google.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: Andrey Konovalov <andreyknvl@google.com>
> > ---
> >  lib/test_kasan.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
>
> These will majorly conflict with the KASAN-test KUnit rework, which I
> don't know what the status is. AFAIK, these are not yet in -mm tree.

I've asked Andrew to take those in 5.9, but that didn't happen.
Perhaps we should ping him again after Plumbers.

> I think the KASAN-test KUnit rework has priority, as rebasing that
> work on top of this patch is going to be difficult. So maybe these
> test additions can be declared optional if there are conflicts coming,
> and if that'll be the case you'll have to rebase and resend the test.

Yeah, either waiting for KASAN+Kunit or separating the tests sounds
like plausible approaches.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
