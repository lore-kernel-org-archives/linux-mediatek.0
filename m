Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25671C3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N29LyaaQQQ49iGyrUShmgCdAG5mooMQdbT0YkAs6M2k=; b=SRlvNis5lH4G91xwAIMdgFQDt1
	CWG0ZmufHj24rKgIFMUloyE6OpTUk6SOHJBt7kJHHKtClmnInWegkGMnUG476LF2+huuIeSLg/dzw
	A2G9Oao0eTr2K3t+5kQz8uElZS4ePYVbojOOhdPu6bpwF3EeaLsX3CsqX/r4D5JvSVKzf8Kt6aBDp
	10nb6sLWp9cUFXybwiw4sToWkfuazIpeVxITeBekUR2+HQIDaBWU9VdZnOq25WST9iLz2Z8h+JzIo
	DTvBLCbacI9rmWKGsU1U4l78r6Q3Y39BMXNg996bztgj3I4rMyi/do0pIqq1UYmXgWVH/FIU4DGMk
	YaLqsR7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVurn-00000009vj8-2nNt;
	Mon, 22 Jul 2024 15:22:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVurJ-00000009vWF-0U0M;
	Mon, 22 Jul 2024 15:21:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-427b9dcbb09so33089425e9.3;
        Mon, 22 Jul 2024 08:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721661711; x=1722266511; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N29LyaaQQQ49iGyrUShmgCdAG5mooMQdbT0YkAs6M2k=;
        b=CDrKhSi1bzcVQZ/bZ8BwSLxaSediiREVyS8qd+njB7u7bhEdrdHIjb9lVpisnybS6q
         aX2Bw6HxCry4dzWNJsX4S0YikfW5sgInborYli30iXDbYv6Pr8syP9GHWQ6ixocUrlAG
         3VVNzTC8GqWIwmY8qQNJ8USiRvxPLNeuYWeuKSV58jU5tLJM4QAUmQHbGuz8hvDaYmIQ
         vX0hsal86KvgjVtZKaSHYD9qcs5yen8MPEM+OxpZ+F+5e/atEbK4BEmejzMed2ukrWmF
         CM8okDz9TAabyZuiRMTmC3eeA566BLeYH56nh+OmN/Uci1XNrXjCXBRP/CJK0Ve9kCpF
         bH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721661711; x=1722266511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N29LyaaQQQ49iGyrUShmgCdAG5mooMQdbT0YkAs6M2k=;
        b=cGTDGLqUyoOgRU2XAfMWgZtqaHh6pYG2bKxee8dyimuyFFwh3dUd1U7XFBRAKPVBKs
         fOTQ3bjnsxj8tw0FQxLz4ow39dGyPMN7B4A9Hu8AkRLu/ZLl4shSGWdnUfqftS4dRCX1
         LV+sJsVIPVlWHeaEvniY7pckrzYnG/4iMnksPtYwRfdqQrP+t+yRjIqLHZfh1pM5hAZ+
         L+U3ZbUuKrCBR0yHOh7GyMIbp4LE1JYEX2hVozMkYcNeDwjkUlXaCWddU1MH9NsZWXSI
         ohwEexev0WoqDOWyvM4Qs3M0N9poAJpI098i+7mHYQXHTwFEibPLizIQYLibOd6tfHYs
         w6iA==
X-Forwarded-Encrypted: i=1; AJvYcCWhVE94xzztn18DAaj5Cf2A9HFjm+xMwhdeSSLFsFHP/i3StU0TVYJCocsRZizP52uU/7WsaSXIuXI4NnhrB6n9+PKA92BZHnfRRgZ+Wz4/RUGw6lTI5pIaH793xEjt8gqEsCjvYLBpaHL9MDketGfQzgY5XXwQkVw=
X-Gm-Message-State: AOJu0YzgIjc0us4aXMpcIXKDy83s0Uxi0Ywvi0jaZTd6ox1gIa0A2D8d
	8P2uTMnHHaLO1XW8+6JzoMEfdy/0w0KonQwPI+CUY7fex0H5250gZYHJdmUdStbT22VwRPQZFbH
	7zxnXMvHXRfO6m69JMUF5uAKjkq4=
X-Google-Smtp-Source: AGHT+IEz0LWym/I2F/H6DDah+69CAvBRKYq/jME2gt+KZ5jhSdIg1hrDcfrW6U37Wl92SDJaPpLlKLeTAeOoZ0S0P7s=
X-Received: by 2002:a05:6000:b45:b0:368:12ef:92d0 with SMTP id
 ffacd0b85a97d-369bae703damr4117992f8f.51.1721661710503; Mon, 22 Jul 2024
 08:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240719093338.55117-1-linyunsheng@huawei.com>
 <CAKgT0UcGvrS7=r0OCGZipzBv8RuwYtRwb2QDXqiF4qW5CNws4g@mail.gmail.com> <b2001dba-a2d2-4b49-bc9f-59e175e7bba1@huawei.com>
In-Reply-To: <b2001dba-a2d2-4b49-bc9f-59e175e7bba1@huawei.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 22 Jul 2024 08:21:13 -0700
Message-ID: <CAKgT0UdhO+DJKzwyzqvo7npQcgE3ZXSognnv0RhKyF9AjMUc1g@mail.gmail.com>
Subject: Re: [RFC v11 00/14] Replace page_frag with page_frag_cache for sk_page_frag()
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_082153_190942_FE829F2B 
X-CRM114-Status: GOOD (  91.46  )
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

On Mon, Jul 22, 2024 at 5:41=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
>
> On 2024/7/22 7:49, Alexander Duyck wrote:
> > On Fri, Jul 19, 2024 at 2:36=E2=80=AFAM Yunsheng Lin <linyunsheng@huawe=
i.com> wrote:
> >>
> >> After [1], there are still two implementations for page frag:
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
> >> in net/core/sock.c doesn't seems matter that much now as pcp
> >> is also supported for high-order pages:
> >> commit 44042b449872 ("mm/page_alloc: allow high-order pages to
> >> be stored on the per-cpu lists")
> >>
> >> As the related change is mostly related to networking, so
> >> targeting the net-next. And will try to replace the rest
> >> of page_frag in the follow patchset.
> >
> > So in reality I would say something like the first 4 patches are
> > probably more applicable to mm than they are to the net-next tree.
> > Especially given that we are having to deal with the mm_task_types.h
> > in order to sort out the include order issues.
> >
> > Given that I think it might make more sense to look at breaking this
> > into 2 or more patch sets with the first being more mm focused since
> > the test module and pulling the code out of page_alloc.c, gfp.h, and
> > mm_types.h would be pretty impactful on mm more than it is on the
> > networking stack. After those changes then I would agree that we are
> > mostly just impacting the network stack.
>
> I am sure there are plenty of good precedents about how to handling a
> patchset that affecting multi subsystems.
> Let's be more specific about what are the options here:
> 1. Keeping all changing as one patchset targetting the net-next tree
>    as this version does.
> 2. Breaking all changing into two patchsets, the one affecting current AP=
Is
>    targetting the mm tree and the one supporting new APIs targetting
>    net-next tree.
> 3. Breaking all changing into two patchset as option 2 does, but both pat=
chsets
>    targetting net-next tree to aovid waiting for the changing in mm tree
>    to merged back to net-next tree for adding supporting of new APIs.
>
> I am not sure your perference is option 2 or option 3 here, or there are =
others
> options here, it would be better to be more specific about your option he=
re. As
> option 2 doesn't seems to make much sense if all the existing users/calle=
rs of
> page_frag seems to be belonged to networking for testing reasons, and the=
 original
> code seemed to go through net-next tree too:
> https://github.com/torvalds/linux/commit/b63ae8ca096dfdbfeef6a209c30a93a9=
66518853

I am suggesting option 2. The main issue is that this patch set has
had a number of issues that fall into the realm of mm more than
netdev. The issue is that I only have a limited amount of time for
review and I feel like having this be reviewed as a submission for mm
would bring in more people familiar with that side of things to review
it.

As it stands, trying to submit this through netdev is eating up a
significant amount of my time as there aren't many people on the
netdev side of things that can review the mm bits. If you insist on
this needing to go through net-next my inclination would be to just
reject the set as it is bound to introduce a number of issues due to
the sheer size of the refactor and the fact that it is providing
little if any benefit.

> And the main reason I chose option 1 over option 2 is: it is hard to tell=
 how
> much changing needed to support the new usecase, so it is better to keep =
them
> in one patchset to have a bigger picture here. Yes, it may make the patch=
set
> harder to review, but that is the tradeoff we need to make here. As my
> understanding, option 1 seem to be the common practice to handle the chan=
ging
> affecting multi subsystems. Especially you had similar doubt about the ch=
anging
> affecting current APIs as below, it seems hard to explain it without a ne=
w case:
>
> https://lore.kernel.org/all/68d1c7d3dfcd780fa3bed0bb71e41d7fb0a8c15d.came=
l@gmail.com/

The issue as I see it is that you aren't getting any engagement from
the folks on the mm side. In fact from what I can tell it looks like
you didn't even CC this patch set to them. The patches I called out
below are very memory subsystem centric. I would say this patchset has
no way forward if the patches I called out below aren't reviewed by
folks from the memory subsystem maintainers.

> >
>
> ...
>
> >
> > So specifically I would like to see patches 1 (refactored as
> > selftest), 2, 3, 5, 7, 8, 13 (current APIs), and 14 done as more of an
> > mm focused set since many of the issues you seem to have are problems
> > building due to mm build issues, dependencies, and the like. That is
> > the foundation for this patch set and it seems like we keep seeing
> > issues there so that needs to be solid before we can do the new API
> > work. If focused on mm you might get more eyes on it as not many
> > networking folks are that familiar with the memory management side of
> > things.
>
> I am not sure if breaking it into more patchset is the common practice
> to 'get more eyes' here.
> Anyways, it is fair enough ask if there is more concrete reasoning
> behind the asking and it is common practice to do that, and I would
> love to break it to more patchsets to perhaps make the discussion
> easier.

The issue here is that this patchset is 2/3 memory subsystem, and you
didn't seem to include anyone from the memory subsystem side of things
on the Cc list.

> >
> > As for the other patches, specifically 10, 11, 12, and 13 (prepare,
> > probe, commit API), they could then be spun up as a netdev centered
> > set. I took a brief look at them but they need some serious refactor
> > as I think they are providing page as a return value in several cases
> > where they don't need to.
>
> The above is one of the reason I am not willing to do the spliting.
> It is hard for someone to tell if the refactoring affecting current APIs
> will be enough for the new usecase without supporting the new usecase,
> isn't it possible that some refactoring may be proved to be unnecessary
> or wrong?
>
> It would be better to be more specific about what do you mean by
> 'they are providing page as a return value in several cases where they
> don't need to' as above.

This patchset isn't moving forward in its current state. Part of the
issue is that it is kind of an unwieldy mess and has been difficult to
review due to things like refactoring code you had already refactored.
Ideally each change should be self contained and you shouldn't have to
change things more than once. That is why I have suggested splitting
things the way I did. It would give you a logical set where you do the
initial refactor to enable your changes, and then you make those
changes. It is not uncommon to see this done within the kernel
community. For example if I recall correctly the folio changes when in
as a few patch sets in order to take care of the necessary enabling
and then enable their use in the various subsystems.

> >
> > In my opinion with a small bit of refactoring patch 4 can just be
> > dropped. I don't think the renaming is necessary and it just adds
> > noise to the commit logs for the impacted drivers. It will require
> > tweaks to the other patches but I think it will be better that way in
> > the long run.
>
> It would be better to be more specific about above too so that we don't
> have to have more refactoring patchsets for the current APIs.

I provided the review feedback in the patch. Specifically, don't
rename existing APIs. It would be better to just come up with an
alternative scheme such as a double underscore that would represent
the page based version while the regular version stays the same.

> >
> > Looking at patch 6 I am left scratching my head and wondering if you
> > have another build issue of some sort that you haven't mentioned. I
> > really don't think it belongs in this patch set and should probably be
> > a fix on its own if you have some reason to justify it. Otherwise you
> > might also just look at refactoring it to take
> > "__builtin_constant_p(size)" into account by copying/pasting the first
> > bits from the generic version into the function since I am assuming
> > there is a performance benefit to doing it in assembler. It should be
> > a net win if you just add the accounting for constants.
>
> I am not sure if the commit log in patch 6 needs some rephasing to
> answer your question above:
> "As the get_order() implemented by xtensa supporting 'nsau'
> instruction seems be the same as the generic implementation
> in include/asm-generic/getorder.h when size is not a constant
> value as the generic implementation calling the fls*() is also
> utilizing the 'nsau' instruction for xtensa.
>
> So remove the get_order() implemented by xtensa, as using the
> generic implementation may enable the compiler to do the
> computing when size is a constant value instead of runtime
> computing and enable the using of get_order() in BUILD_BUG_ON()
> macro in next patch."
>
> See the below in the next patch, as the PAGE_FRAG_CACHE_MAX_ORDER
> is using the get_order():
> BUILD_BUG_ON(PAGE_FRAG_CACHE_MAX_ORDER > PAGE_FRAG_CACHE_ORDER_MASK);

Are you saying that the compiler translates the get_order call into
the nsau instruction? I'm still not entirely convinced and would
really like to see a review by the maintainer for that architecture to
be comfortable with it.

Otherwise as I said before my thought would be to simply copy over the
bits for __builtin_constant_p from the generic version of get_order so
that we don't run the risk of somehow messing up the non-constant
case.

> >
> > Patch 9 could probably be a standalone patch or included in the more
> > mm centered set. However it would need to be redone to fix the
> > underlying issue rather than working around it by changing the
> > function called rather than fixing the function. No point in improving
> > it for one case when you can cover multiple cases with a single
> > change.
>
> Sure, it is just that there is only 24h a day for me to do things
> more generically. So perhaps I should remove patch 9 for now so
> that we can improve thing more generically.

I'm not sure what that is supposed to mean. The change I am suggesting
is no bigger than what you have already done. It would just mean
fixing the issue at the source instead of working around the issue.
Taking that approach would yield a much better return than just doing
the workaround.

I could make the same argument about reviewing this patch set. I feel
like a I only have so much time in the day. I have already caught a
few places where you were circumventing issues instead of addressing
them such as using macros to cover up #include ordering issues
resulting in static inline functions blowing up. It feels like
labeling this as a networking patch set is an attempt to circumvent
working with the mm tree by going in and touching as much networking
code as you can to claim this is a networking patch when only 3
patches(5, 10 and 12) really need to touch anything in networking.

I am asking you to consider my suggestions for your own benefit as
otherwise I am pretty much the only reviewer for these patches and the
fact is I am not a regular contributor within the mm subsystem myself.
I would really like to have input from the mm subsystem maintainer on
things like your first patch which is adding a new test module to the
mm tree currently. I am assuming that they wouldn't want us to place
the test module in there, but I could be wrong. That is why I am
suggesting breaking this up and submitting the mm bits as more mm
focused so that we can get that additional input.

