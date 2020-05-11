Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78E4C47255
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 10:01:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DEA120720
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 10:01:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xpsm/7ir";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Fc1FlTQb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DEA120720
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwVXpM7RFhLYxm7dZAeZFfo3vQIRTsRKGGk8PjpyOrM=; b=Xpsm/7iryrhiaQ
	yhce/lTU4JmQeao0EmuzJCEcWC9aJnv7HsnIWsMLJ28i12Ag+/x/CdNxDU3F0Q/9ZaeLa6arIemAR
	EnP2tKM+zkg5yKY9/g1/SV3jvrqxZz6PrQSAfBFwIdM64AaOsG9p5C4EwQVG9iP1MQ25wL6fYnCAS
	0UKI0/qHAZLk0mJVOF8AbXFQIecIYrjjUtVUCUCwdLEuZA3uLi8/nLMfRJiSOl3dYk3BrEPnaWSAx
	kLJ2l6J00A9m0e7lZIopE4lCxPHkDxj7rpRohBD95HQ9XkJfzVy8AcjypWmK/LJmz3tNga6lm/VVv
	8pZ0NG+9AomkJW9H/yaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY5Fc-0008EC-RC; Mon, 11 May 2020 10:01:32 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY5Fa-0008DO-EL
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 10:01:32 +0000
Received: by mail-qv1-xf41.google.com with SMTP id z5so2295354qvw.4
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 03:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dEBQw3076mBvIY7CBwoK5uqpgbduOcTYtDKSbai7h/o=;
 b=Fc1FlTQbTssxu2TxqBIzl+6Xlu+t3hasOFsdn49nv21GLo9Z8aBGG/ltllQ5Mqv3vs
 /cS1DoIzzoA0etpn9Wb1dNWhoo4a7PnSU9gFA/dVQZkuny77X/CNk7hdQFyQxT8H3DVE
 EoV6Ku67L0CdgauG4BIN5MwiXPgC4FyhVfqLLtuUmawjRwNgqWpzTu0V3aeonSzSRMtL
 8R9P8SURGv9c8w0VL0TDSiPfiUAE1V/xB68UPSMA7ViHFp2ND2ft3yukF1C5a44SZ8PL
 nkAwzrc+hrrENogaw8HqC+e+2No138vdOykTEcUxjE1xBWU0GiZOAnz+kfac1whzdwd7
 J8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dEBQw3076mBvIY7CBwoK5uqpgbduOcTYtDKSbai7h/o=;
 b=uSE3UEswV7hKi8xevCbY/JL2isH2aaYuxOlYuBNc2pme176GOr+WxC44h92yTq0SVK
 uY4u9fdjSoGaXGipgMASksrTFkmlwaAHTsX+oGkW5rck6zbpqt3XGzdDQBz3mOV/1Sfk
 BuMDl56ayXINlLEm5+Gs95MjeIi6fxb/GRa3CO3NGyw7DWpQPZRVKSkfR+Qh1/Vg+aTi
 huVWBWFmc1RYuOssPzL8zf6cyjXfwgefJkucEdi3MGlUIB+pK1nH/Ou/0EFBxuz/Dt8n
 MZ4R0yfunJ3kwQcrdC0Nc//raCaY3xc6Nhr35VhJCqP225kBdlgItsN33SSkmwiNModt
 pjOA==
X-Gm-Message-State: AGi0PuZ3qTWDVKaI5xGU1THFBfqQ4UvRhzt1/4R2DpMvE5kCEx2fj0H4
 l3Chjj33z2UN4D44LeMkmGX3icO7pDb5jXwNYJywjQ==
X-Google-Smtp-Source: APiQypK3J4Uss9hZs4ShXGbm1QYq+YrrdMGKWDeQyyrRLVZFWF+P7Ohh0VDwlQa19CWjtVyUyFUBSpLqPPKQVLzi6XA=
X-Received: by 2002:ad4:5a48:: with SMTP id ej8mr15299087qvb.122.1589191286510; 
 Mon, 11 May 2020 03:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200511022359.15063-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200511022359.15063-1-walter-zh.wu@mediatek.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 11 May 2020 12:01:14 +0200
Message-ID: <CACT4Y+aC4i8cAVFu2-s82RczWCjYMpPVJLwS0OBLELR9qF8SYg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] kasan: memorize and print call_rcu stack
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_030130_506077_B2EDB982 
X-CRM114-Status: GOOD (  19.60  )
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
 "Paul E . McKenney" <paulmck@kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 11, 2020 at 4:24 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> This patchset improves KASAN reports by making them to have
> call_rcu() call stack information. It is useful for programmers
> to solve use-after-free or double-free memory issue.

Hi Walter,

I am looking at this now.

I've upload the change to gerrit [1]
https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2458

I am not capable enough to meaningfully review such changes in this format...

[1] https://linux.googlesource.com/Documentation


> The KASAN report was as follows(cleaned up slightly):
>
> BUG: KASAN: use-after-free in kasan_rcu_reclaim+0x58/0x60
>
> Freed by task 0:
>  save_stack+0x24/0x50
>  __kasan_slab_free+0x110/0x178
>  kasan_slab_free+0x10/0x18
>  kfree+0x98/0x270
>  kasan_rcu_reclaim+0x1c/0x60
>  rcu_core+0x8b4/0x10f8
>  rcu_core_si+0xc/0x18
>  efi_header_end+0x238/0xa6c
>
> First call_rcu() call stack:
>  save_stack+0x24/0x50
>  kasan_record_callrcu+0xc8/0xd8
>  call_rcu+0x190/0x580
>  kasan_rcu_uaf+0x1d8/0x278
>
> Last call_rcu() call stack:
> (stack is not available)
>
> Generic KASAN will record first and last call_rcu() call stack
> and print two call_rcu() call stack in KASAN report.
>
> This feature doesn't increase the cost of memory consumption. It is
> only suitable for generic KASAN.
>
> [1]https://bugzilla.kernel.org/show_bug.cgi?id=198437
> [2]https://groups.google.com/forum/#!searchin/kasan-dev/better$20stack$20traces$20for$20rcu%7Csort:date/kasan-dev/KQsjT_88hDE/7rNUZprRBgAJ
>
> Changes since v2:
> - remove new config option, default enable it in generic KASAN
> - test this feature in SLAB/SLUB, it is pass.
> - modify macro to be more clearly
> - modify documentation
>
> Walter Wu (3):
> rcu/kasan: record and print call_rcu() call stack
> kasan: record and print the free track
> kasan: update documentation for generic kasan
>
> Documentation/dev-tools/kasan.rst |  6 ++++++
> include/linux/kasan.h             |  2 ++
> kernel/rcu/tree.c                 |  4 ++++
> lib/Kconfig.kasan                 |  2 ++
> mm/kasan/common.c                 | 26 ++++----------------------
> mm/kasan/generic.c                | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
> mm/kasan/kasan.h                  | 23 +++++++++++++++++++++++
> mm/kasan/report.c                 | 47 +++++++++++++++++++++--------------------------
> mm/kasan/tags.c                   | 37 +++++++++++++++++++++++++++++++++++++
> 9 files changed, 149 insertions(+), 48 deletions(-)
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200511022359.15063-1-walter-zh.wu%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
