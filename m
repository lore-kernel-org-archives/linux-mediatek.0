Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57041C67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5o7+hDSIuCWKDG8jzwsz/CU+9322M+SgxIxtVMZNuNI=; b=NNrDKV5Fn/v9+nbChcpWXCJEuZ
	jqPNxyEgslC2a7e8vF77oz7fVHNu2z6fBP4ZI/gIOZ8/Tzq+bAw2u3g36QN2cRQITHmtqe5OXxw5p
	tbNq2VH6Bc89W1NWrw9YeUjMHUCQ29tvhLPvFCjXksT5sBdUqti1DxaDHHKalNw58WgwE9OX8o52p
	2fr4XQZEVRJS8Gh8ZuciE4gFTijoFKd4GTpqrNjcepVuvZrgApx5KvJRBdPz7rsBpL20cuoZrX25J
	ygqQyWw+XdppA3A3kuXCpQIvk9QG/KwAW9olJFy7uH//nIF0G7ZJtU76QTO16KsPYO7jxj8CMHtJn
	egUdQwvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtqdN-0000000Fz8B-3L83;
	Mon, 08 Apr 2024 15:10:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtqdJ-0000000Fz6u-3uTD;
	Mon, 08 Apr 2024 15:10:07 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-41691fbb392so2797395e9.1;
        Mon, 08 Apr 2024 08:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712588999; x=1713193799; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5o7+hDSIuCWKDG8jzwsz/CU+9322M+SgxIxtVMZNuNI=;
        b=RiF2FpTP2Wrazhg5JmpoC2hesK8W1f5zbRfd79hT3Qe0ud4Divfz5x61Bu5p+vvuMo
         NokXTmmSL0tNbzNibZGHoUKY4zXc8Se3OnXyt8ZKnWEvpg+SvkeAd5uLQjyEtELXgzeq
         HxOb6OThq256ncTbUya4oQie9XFIyyIa0hcpV1dQWw+syqB1U8qSJZJ9s7s2MS+wmHhz
         Tb7j4Is4QCYcPJer/T6ulm2fady01wn5Rnh/rvxedk8JsnTQrTLYsrUOwLgGb7xQm4W/
         B1Hi3e3rRBZaZGGTumsMhBqFanjlUYIbBKaRzMUCO8nIM/n3NIf0JdBWsNk3XvliqSkd
         ewcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712588999; x=1713193799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5o7+hDSIuCWKDG8jzwsz/CU+9322M+SgxIxtVMZNuNI=;
        b=WMmyvOyJTcr20lCPr5CoXN0HCokjZcYlsPwgRffU2aHCvx246i7yHlcb3nGs908o5W
         4Xfh/97g6/mvXk+4xNNkgsmyFPgSKRdygvwKAfykNzH+jvLZlCszMGQMLTJxwumeLHiJ
         SQPC+jpXyhZumpc8RSCCUccrrsL6bYb/4iz8DER2T/qVqEKCHU6w1EBuRJHMaET/nUFR
         1Z8F8nH4xqsu5LbOYS/I0zp54P4ClINvcG/KyJCDihb/w5RjtzOUuNu9XNSuxvm4inOD
         Q2APxHqP9yn6hR8LWFoQp72VP5hVmC4B+SXtcykiQ33Jsy5LOgfi97XQjJKKfspfjs8t
         WrIA==
X-Forwarded-Encrypted: i=1; AJvYcCUk+acTOvrj8DNgwoFiuU0LL9bBVBDXcPoxQ59fwnu7qL7vzFeBdF3oTeAlkMIrrQpzBbOrx+Qsg5cm2QsbchxhGhgbLxBZQVJ2siuDOJB+xThEKXs0h0VBnKSOY+E5CF3ZNkPAHEL8UcjL42uNftCWx7UFCH9e4g8=
X-Gm-Message-State: AOJu0YxvCHOu3ELH9LJp6fUyPkA16vxauk2SkTQNlDGnGjWyB7aMne63
	lCzFMKuAQKumZrGEKQy5xW47UcYC+dEmQtZkm1JFxyJodlNfDSjamj1kNol/vDzGvfsLMSNcWDp
	YNsnpGFpbjzD4ky9A0r22yizV4uA=
X-Google-Smtp-Source: AGHT+IGfD5tw9rqnE5LU+TW60kXROajtXB4BtqIhZq3i2yRRlQkfuwvGF/5wsc9QyaA0puOL1oGI7yTw06d1aVVHif4=
X-Received: by 2002:a05:6000:1048:b0:343:9d6d:59a4 with SMTP id
 c8-20020a056000104800b003439d6d59a4mr6383480wrx.28.1712588999269; Mon, 08 Apr
 2024 08:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240407130850.19625-1-linyunsheng@huawei.com>
 <CAKgT0Uex+e_g9nyqk6DiB03U4zs_A1z2LoztHnpYbJ9LPm=NFA@mail.gmail.com> <05c21500-033b-dfee-6aa7-1ee967616213@huawei.com>
In-Reply-To: <05c21500-033b-dfee-6aa7-1ee967616213@huawei.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 8 Apr 2024 08:09:22 -0700
Message-ID: <CAKgT0UdjBXguCudxM9-tzKx2qWYg18xp5cG2xaeY893rVbw5qQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 00/12] First try to replace page_frag with page_frag_cache
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_081006_006748_57DE9812 
X-CRM114-Status: GOOD (  58.89  )
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

On Mon, Apr 8, 2024 at 6:38=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
> On 2024/4/8 1:02, Alexander Duyck wrote:
> > On Sun, Apr 7, 2024 at 6:10=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei=
.com> wrote:
> >>
> >> After [1], Only there are two implementations for page frag:
> >>
> >> 1. mm/page_alloc.c: net stack seems to be using it in the
> >>    rx part with 'struct page_frag_cache' and the main API
> >>    being page_frag_alloc_align().
> >> 2. net/core/sock.c: net stack seems to be using it in the
> >>    tx part with 'struct page_frag' and the main API being
> >>    skb_page_frag_refill().
> >>
> >> This patchset tries to unfiy the page frag implementation
> >> by replacing page_frag with page_frag_cache for sk_page_frag()
> >> first. net_high_order_alloc_disable_key for the implementation
> >> in net/core/sock.c doesn't seems matter that much now have
> >> have pcp support for high-order pages in commit 44042b449872
> >> ("mm/page_alloc: allow high-order pages to be stored on the
> >> per-cpu lists").
> >>
> >> As the related change is mostly related to networking, so
> >> targeting the net-next. And will try to replace the rest
> >> of page_frag in the follow patchset.
> >>
> >> After this patchset, we are not only able to unify the page
> >> frag implementation a little, but seems able to have about
> >> 0.5+% performance boost testing by using the vhost_net_test
> >> introduced in [1] and page_frag_test.ko introduced in this
> >> patch.
> >
> > One question that jumps out at me for this is "why?". No offense but
> > this is a pretty massive set of changes with over 1400 additions and
> > 500+ deletions and I can't help but ask why, and this cover page
> > doesn't give me any good reason to think about accepting this set.
>
> There are 375 + 256 additions for testing module and the documentation
> update in the last two patches, and there is 198 additions and 176
> deletions for moving the page fragment allocator from page_alloc into
> its own file in patch 1.
> Without above number, there are above 600+ additions and 300+ deletions,
> deos that seems reasonable considering 140+ additions are needed to for
> the new API, 300+ additions and deletions for updating the users to use
> the new API as there are many users using the old API?

Maybe it would make more sense to break this into 2 sets. The first
one adding your testing, and the second one consolidating the API.
With that we would have a clearly defined test infrastructure in place
for the second set which is making significant changes to the API. In
addition it would provide the opportunity for others to point out any
other test that they might want pulled in since this is likely to have
impact outside of just the tests you have proposed.

> > What is meant to be the benefit to the community for adding this? All
> > I am seeing is a ton of extra code to have to review as this
> > unification is adding an additional 1000+ lines without a good
> > explanation as to why they are needed.
>
> Some benefits I see for now:
> 1. Improve the maintainability of page frag's implementation:
>    (1) future bugfix and performance can be done in one place.
>        For example, we may able to save some space for the
>        'page_frag_cache' API user, and avoid 'get_page()' for
>        the old 'page_frag' API user.

The problem as I see it is it is consolidating all the consumers down
to the least common denominator in terms of performance. You have
already demonstrated that with patch 2 which enforces that all drivers
have to work from the bottom up instead of being able to work top down
in the page.

This eventually leads you down the path where every time somebody has
a use case for it that may not be optimal for others it is going to be
a fight to see if the new use case can degrade the performance of the
other use cases.

>    (2) Provide a proper API so that caller does not need to access
>        internal data field. Exposing the internal data field may
>        enable the caller to do some unexpcted implementation of
>        its own like below, after this patchset the API user is not
>        supposed to do access the data field of 'page_frag_cache'
>        directly[Currently it is still acessable from API caller if
>        the caller is not following the rule, I am not sure how to
>        limit the access without any performance impact yet].
> https://elixir.bootlin.com/linux/v6.9-rc3/source/drivers/net/ethernet/che=
lsio/inline_crypto/chtls/chtls_io.c#L1141

This just makes the issue I point out in 1 even worse. The problem is
this code has to be used at the very lowest of levels and is as
tightly optimized as it is since it is called at least once per packet
in the case of networking. Networking that is still getting faster
mind you and demanding even fewer cycles per packet to try and keep
up. I just see this change as taking us in the wrong direction.

> 2. page_frag API may provide a central point for netwroking to allocate
>    memory instead of calling page allocator directly in the future, so
>    that we can decouple 'struct page' from networking.

I hope not. The fact is the page allocator serves a very specific
purpose, and the page frag API was meant to serve a different one and
not be a replacement for it. One thing that has really irked me is the
fact that I have seen it abused as much as it has been where people
seem to think it is just a page allocator when it was really meant to
just provide a way to shard order 0 pages into sizes that are half a
page or less in size. I really meant for it to be a quick-n-dirty slab
allocator for sizes 2K or less where ideally we are working with
powers of 2.

It concerns me that you are talking about taking this down a path that
will likely lead to further misuse of the code as a backdoor way to
allocate order 0 pages using this instead of just using the page
allocator.

> >
> > Also I wouldn't bother mentioning the 0.5+% performance gain as a
> > "bonus". Changes of that amount usually mean it is within the margin
> > of error. At best it likely means you haven't introduced a noticeable
> > regression.
>
> For micro-benchmark ko added in this patchset, performance gain seems qui=
t
> stable from testing in system without any other load.

Again, that doesn't mean anything. It could just be that the code
shifted somewhere due to all the code moved so a loop got more aligned
than it was before. To give you an idea I have seen performance gains
in the past from turning off Rx checksum for some workloads and that
was simply due to the fact that the CPUs were staying awake longer
instead of going into deep sleep states as such we could handle more
packets per second even though we were using more cycles. Without
significantly more context it is hard to say that the gain is anything
real at all and a 0.5% gain is well within that margin of error.

