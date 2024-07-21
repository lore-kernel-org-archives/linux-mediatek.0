Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA2AC3DA61
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jul 2024 23:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iN3Zu3SMIPZr0TMuZ+8iL5z513aeybE5wDELn+/cQxc=; b=oAK4Kbm43ZU7bJ+NAZlDiXw7zf
	4Xd+zjmCJElt6AyOJmlp+uXle9Z2Ef4koF+xtUyMt6u5RSD1xkjlhNrLSi4fytnFgpTvl+a+KD1or
	X2B1NU5LUsjvhneyq3yxTiYDodAxGiN/ITuA/6oldYM7fx+p9zEr9eg0fKPQdDIedNiH5/9YhMWJc
	F6L7ACrOQ+AfwiolIh3ZvcCcy5PkSEKGuJtXrLVv8uE9jHJEm6G+e9nbo6XTXLV9dGv6GFmMi05ng
	zHnkdPvR5Iq6CZpDAlmuor7Xd0zH2R6GVHZWunNmknaRhLBUbtusFM7qtsoYLkRTjvPXCq7jLOJZs
	6rkh54+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVgJY-00000007pEj-2PkE;
	Sun, 21 Jul 2024 23:50:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVgJB-00000007pAS-35lg;
	Sun, 21 Jul 2024 23:49:43 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3684407b2deso1771512f8f.1;
        Sun, 21 Jul 2024 16:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721605780; x=1722210580; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iN3Zu3SMIPZr0TMuZ+8iL5z513aeybE5wDELn+/cQxc=;
        b=FlFEgSc1wblXOtazBLdf5rJcXSbbIq7C2KpWsIz84Y718nVD8fc27H6o5+/sp6jWoT
         fwz0WHHJ6XQEC5Mt0FZc7kvfemVTXeJ1uQTPfr0bd3wCvV3G1fcrEEHiq2hn1Ds3uAxS
         +Bz34w7E/E+Wss/6VYSPY/OV2yFlRn7Ktd4pvGM6joV2P6HDpiGbroZM6p6cdJqnXgSR
         eXLWoP8UVmDHIlmMfS0zwntIk4aPW6ZE3XEtW65v5qMOGNEA9rwVjBHswFOlL/9K25m1
         uKMygaixQkndGPk5aJfpw2FZhOCdmymAfrmh4CesNSjYR7xZJAYTi0lHzHuKc+Xztzj6
         VJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721605780; x=1722210580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iN3Zu3SMIPZr0TMuZ+8iL5z513aeybE5wDELn+/cQxc=;
        b=wA+vNd9aMyVdOaByxqWnrXiLe99uaBxmcUjfPBVfipOn5/Fc1uHHuOe+dubJsgFfDR
         qwBmfCbB6NtbDOwOMFtR6dnGR/1dVe/0yw5F9/xyo0YulnK6QfoLdRUQRTbbOwgU8M32
         SZl8gUyxx+WMm1SE/2x0IiKsdB//rm7Ya2AfdPH8KxcX/tQyiaqNkKFQd6ogdAiCEkUW
         7xGOZ8SRdepXIyulhnz98C/dX8d8uR/u5Ig0B4UNqNU7wdQfhDxbHx6/rTnUPLANAu4z
         RDP8P+hbcyxMSgifSUSV9BjiLeD0WHHnkw8X+FRpVbrRXrRI4mSnLWqkZQlCl8lt74IS
         YLpg==
X-Forwarded-Encrypted: i=1; AJvYcCUoQUEe7nJiqMCtxMkPCYtCMg2O1lPiIQD0UsqgA57wvPROxO9blkfC9SsN4l45cn7kfYg9v5EU/2EB+B0asJ20EXB7QjM+i3LG8zoHmxAP4NuHl77CbfWt/KdraA40INWfTZc+mVkkNmXwGpLYV/8mDLgnku5bZt8=
X-Gm-Message-State: AOJu0Yy3rbHSkEnKOuD3q58C5fibJ9gRaFft0zIYMtdn8oR22mNvIht9
	EIiA1RGr4WyGIf6VUBJSl/PzDZF/TEyPWKuN/n4IxdBfPvRh7mul0g9jzaqZJZ3NgB6tplq6apQ
	G1NQmj6BFgwhp/5DEryW4hMZR1IM=
X-Google-Smtp-Source: AGHT+IGoQxHzMLeJ30aWg0IIajq2wjsBRD5EJvcNW4eZDPA0jYxW0wHjgjTC9urTmWiZen0TMM3e8QnwmveXLeGbKFs=
X-Received: by 2002:a5d:6d08:0:b0:367:9904:e6b9 with SMTP id
 ffacd0b85a97d-369bb0a0e12mr3686556f8f.44.1721605779555; Sun, 21 Jul 2024
 16:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240719093338.55117-1-linyunsheng@huawei.com>
In-Reply-To: <20240719093338.55117-1-linyunsheng@huawei.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Sun, 21 Jul 2024 16:49:02 -0700
Message-ID: <CAKgT0UcGvrS7=r0OCGZipzBv8RuwYtRwb2QDXqiF4qW5CNws4g@mail.gmail.com>
Subject: Re: [RFC v11 00/14] Replace page_frag with page_frag_cache for sk_page_frag()
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_164941_805985_E6EF6940 
X-CRM114-Status: GOOD (  50.98  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 19, 2024 at 2:36=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
>
> After [1], there are still two implementations for page frag:
>
> 1. mm/page_alloc.c: net stack seems to be using it in the
>    rx part with 'struct page_frag_cache' and the main API
>    being page_frag_alloc_align().
> 2. net/core/sock.c: net stack seems to be using it in the
>    tx part with 'struct page_frag' and the main API being
>    skb_page_frag_refill().
>
> This patchset tries to unfiy the page frag implementation
> by replacing page_frag with page_frag_cache for sk_page_frag()
> first. net_high_order_alloc_disable_key for the implementation
> in net/core/sock.c doesn't seems matter that much now as pcp
> is also supported for high-order pages:
> commit 44042b449872 ("mm/page_alloc: allow high-order pages to
> be stored on the per-cpu lists")
>
> As the related change is mostly related to networking, so
> targeting the net-next. And will try to replace the rest
> of page_frag in the follow patchset.

So in reality I would say something like the first 4 patches are
probably more applicable to mm than they are to the net-next tree.
Especially given that we are having to deal with the mm_task_types.h
in order to sort out the include order issues.

Given that I think it might make more sense to look at breaking this
into 2 or more patch sets with the first being more mm focused since
the test module and pulling the code out of page_alloc.c, gfp.h, and
mm_types.h would be pretty impactful on mm more than it is on the
networking stack. After those changes then I would agree that we are
mostly just impacting the network stack.

> After this patchset:
> 1. Unify the page frag implementation by taking the best out of
>    two the existing implementations: we are able to save some space
>    for the 'page_frag_cache' API user, and avoid 'get_page()' for
>    the old 'page_frag' API user.
> 2. Future bugfix and performance can be done in one place, hence
>    improving maintainability of page_frag's implementation.
>
> Kernel Image changing:
>     Linux Kernel   total |      text      data        bss
>     ------------------------------------------------------
>     after     45250307 |   27274279   17209996     766032
>     before    45254134 |   27278118   17209984     766032
>     delta        -3827 |      -3839        +12         +0

It might be interesting if we can track some of this on a per patch
basis for the signficant patches. For example I would be curious how
much of this is just from patch 9 that replaces alloc_pages_node with
__alloc_pages.

> Performance validation:
> 1. Using micro-benchmark ko added in patch 1 to test aligned and
>    non-aligned API performance impact for the existing users, there
>    is no notiable performance degradation. Instead we seems to some
>    minor performance boot for both aligned and non-aligned API after
>    this patchset as below.
>
> 2. Use the below netcat test case, we also have some minor
>    performance boot for repalcing 'page_frag' with 'page_frag_cache'
>    after this patchset.
>    server: taskset -c 32 nc -l -k 1234 > /dev/null
>    client: perf stat -r 200 -- taskset -c 0 head -c 20G /dev/zero | tasks=
et -c 1 nc 127.0.0.1 1234
>
> In order to avoid performance noise as much as possible, the testing
> is done in system without any other laod and have enough iterations to
> prove the data is stable enogh, complete log for testing is below:

Please go through and run a spell check over your patches. I have seen
multiple spelling errors in a few of the patch descriptions as well.

> taskset -c 32 nc -l -k 1234 > /dev/null
> perf stat -r 200 -- insmod ./page_frag_test.ko test_push_cpu=3D16 test_po=
p_cpu=3D17
> perf stat -r 200 -- insmod ./page_frag_test.ko test_push_cpu=3D16 test_po=
p_cpu=3D17 test_align=3D1
> perf stat -r 200 -- taskset -c 0 head -c 20G /dev/zero | taskset -c 1 nc =
127.0.0.1 1234
>
> *After* this patchset:
>
>  Performance counter stats for 'insmod ./page_frag_test.ko test_push_cpu=
=3D16 test_pop_cpu=3D17' (200 runs):
...
>       23.856064365 seconds time elapsed                                  =
        ( +-  0.08% )
>
>  Performance counter stats for 'insmod ./page_frag_test.ko test_push_cpu=
=3D16 test_pop_cpu=3D17 test_align=3D1' (200 runs):
...
>       23.443927103 seconds time elapsed                                  =
        ( +-  0.05% )
>
>  Performance counter stats for 'taskset -c 0 head -c 20G /dev/zero' (200 =
runs):
...
>       27.370305077 seconds time elapsed                                  =
        ( +-  0.01% )
>
>
> *Before* this patchset:
>
> Performance counter stats for 'insmod ./page_frag_test.ko test_push_cpu=
=3D16 test_pop_cpu=3D17' (200 runs):
...
>       23.918006193 seconds time elapsed                                  =
        ( +-  0.10% )
>
>  Performance counter stats for 'insmod ./page_frag_test.ko test_push_cpu=
=3D16 test_pop_cpu=3D17 test_align=3D1' (200 runs):
...
>       23.876306259 seconds time elapsed                                  =
        ( +-  0.13% )
>
>  Performance counter stats for 'taskset -c 0 head -c 20G /dev/zero' (200 =
runs):
...
>       27.842745343 seconds time elapsed                                  =
        ( +-  0.02% )

I'm not seeing any sort of really significant improvement here. If I
am understanding correctly the change amounts to:
23.9 -> 23.9 (-0.26%)
23.9 -> 23.4 (-1.8%)
27.8 -> 27.4 (-1.6%)

The trade off is that we are adding a bunch more complexity to the
code, and refactoring it for reuse, but somehow in the process this
patch set increases the total code footprint in terms of total lines
of code and will make maintenance that much harder as the code seems
much more tangled up and brittle than it was previously.

I think we need to think about splitting this patch set into at least
2. Basically an mm side of the patch set to move the code and do most
of your refactoring work. The second half of the set being to add the
refactoring of the network side to reuse the existing code. I think it
will make it easier to review and might get you more engagement as I
am pretty sure several of these patches likely wouldn't fly with some
of the maintainers.

So specifically I would like to see patches 1 (refactored as
selftest), 2, 3, 5, 7, 8, 13 (current APIs), and 14 done as more of an
mm focused set since many of the issues you seem to have are problems
building due to mm build issues, dependencies, and the like. That is
the foundation for this patch set and it seems like we keep seeing
issues there so that needs to be solid before we can do the new API
work. If focused on mm you might get more eyes on it as not many
networking folks are that familiar with the memory management side of
things.

As for the other patches, specifically 10, 11, 12, and 13 (prepare,
probe, commit API), they could then be spun up as a netdev centered
set. I took a brief look at them but they need some serious refactor
as I think they are providing page as a return value in several cases
where they don't need to.

In my opinion with a small bit of refactoring patch 4 can just be
dropped. I don't think the renaming is necessary and it just adds
noise to the commit logs for the impacted drivers. It will require
tweaks to the other patches but I think it will be better that way in
the long run.

Looking at patch 6 I am left scratching my head and wondering if you
have another build issue of some sort that you haven't mentioned. I
really don't think it belongs in this patch set and should probably be
a fix on its own if you have some reason to justify it. Otherwise you
might also just look at refactoring it to take
"__builtin_constant_p(size)" into account by copying/pasting the first
bits from the generic version into the function since I am assuming
there is a performance benefit to doing it in assembler. It should be
a net win if you just add the accounting for constants.

Patch 9 could probably be a standalone patch or included in the more
mm centered set. However it would need to be redone to fix the
underlying issue rather than working around it by changing the
function called rather than fixing the function. No point in improving
it for one case when you can cover multiple cases with a single
change.

