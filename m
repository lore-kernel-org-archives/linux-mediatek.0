Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E012EEAA7B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 22:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfCaqaITK0RSQOG7eYDqUV/b4Pi0ZshhxosqhXZPLqM=; b=45lg5IUzzuPjFDjvATgl1G966S
	UtZx2VxERGQvsiv0et6oJwQmoSZq3ilFo7XDJhicwOMWM7spUTO7dTuDXuolZfiYbYt2MubZhVKhU
	H/B2htRLEDGIISpqct9IwXsVjPiz1CET78JrhLpWPvoKXPk9YbPLrcR1YueLjcPojJqyeNbYpaacN
	muAy4+QNpFdpGtJS1aJxJ184NVXT8M64+8SxxMwCZQ59zH4EwotUXWnx+b9bepEAwPxIiytJsKWky
	vzjtw70ZO+jHeCJexFv8+jQp7+ToMmG+/VWlgU9ULzQejrbGnI74IqR/f6oCKc2mGDBRJrsreHJaP
	1XISNnUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qguzd-009Nl1-1f;
	Thu, 14 Sep 2023 22:39:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qguzZ-009Njl-2l;
	Thu, 14 Sep 2023 22:39:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401b0d97850so15503265e9.2;
        Thu, 14 Sep 2023 15:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694731159; x=1695335959; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfCaqaITK0RSQOG7eYDqUV/b4Pi0ZshhxosqhXZPLqM=;
        b=St1PZbAUGqKJTwtkNJDvZGg3SwxnaTNFYbSyPFTlQ6yu4qvWqUmJXNKWH1PoTrx78C
         KZimXI7RIc7bCPic3qFoNC+4n4LzFsEfFzQMqXnSKOfHwSqaAL24t/bacdkXrmujZKxV
         hwcPfCertZs9XjA3ptPPd35ULBATFCG3xjxM8SR6s6KNyC9fleRMkfmf7exvJ6WT8BWq
         WTFm5gX7jL3KuxXqrfGwR/WwctG9t0GAduhoNwHcYO0WquloGh5CrPYZQJTea3Y/xF+O
         09FCDYabhZhWI4pZk1/1hIswX+b3BN1Wg9aCMeQ/bLbjbvKtGLoThFl/os6hTkDpOX8H
         0asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694731159; x=1695335959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfCaqaITK0RSQOG7eYDqUV/b4Pi0ZshhxosqhXZPLqM=;
        b=qWgbTLeGNV6qf7XpwAUjhV/x1lVHDzQX6Ma9dtP7RNAd5p+VjSLqx9OF0Yjiwzx57j
         wbGPoZfiTUGQRtuOAXg+l4B+nZ/NSZQWJsOeK3rjshBk1UeHTUO8yopNSUPysY/kmq2e
         OfApVCWrD4jwiEeJliRg/367QkOOyb+CD/R9vydEuYck44QeKKCXY6hNoGjDiELtzsQp
         a2WbWY371nuOQ3DyHW+W3/OdKsc0k5I1AIHgjI5qWNtkiAV1WoUY99ShsNrV1BHULzJK
         PGK3Z1V8/wkC3KeVqsdArOaJBmcggihxnwKzMfL1e+sReDX3rKAeBgJRYaN5GfnrRPzs
         bN/Q==
X-Gm-Message-State: AOJu0YxE9pSa0ql5V+No3d5vPjxq0EeBTffihWA8xZCcX7ZZKfRwAqBb
	GJdIrZWz1ZuGVWO4H7FtI12krZ+XM+kwUVYrrc0=
X-Google-Smtp-Source: AGHT+IFTLlcLWURbifh/QMMYSndCYefq6IrICmpk/luU9vS9OXCt+pRbpwbx0c2BsgGChsialb0t1Ev7ThoCWDv1fVc=
X-Received: by 2002:a5d:4941:0:b0:31a:d650:4b72 with SMTP id
 r1-20020a5d4941000000b0031ad6504b72mr6134906wrs.7.1694731158502; Thu, 14 Sep
 2023 15:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <zmq7pz7rtz6h765azg5kl2qgjd264yafctx4q474t5tqai57og@cajbcub4yuwr>
 <5fdf9d29-3f8d-0ee0-027f-57ff3a5cecb8@collabora.com> <CAKMK7uGg6n322UugJwErqF_Dvsbqceqae6SVWV3ZWEOR7x36rQ@mail.gmail.com>
 <9a2b1ad8-4359-4f12-b4f9-c1de477bc440@collabora.com> <mnjcsiqjqdnvbbkaaz5r4n42e56qsax667r7radzyagnmmfkip@dfi64z5deqzj>
 <b7d96985-8489-efe2-db67-1f3108e26822@mailbox.org> <5ejq3hjpoy3gxft2jbmoa5m656usetuxcs7g3ezyyiitj67rav@r5jhdz27foat>
 <550454b8-2e2c-c947-92c5-37f0367661c2@mailbox.org> <os2wvkangif2nwewfbzkuyjm7njp4g3sqj5td3ogbhhjwsrbbd@3jpf6g5hd3z4>
 <CAPj87rP1sw49Z0HdPhUa-=kDp166RqiuhC9rL+Ef9hpwPD5+JA@mail.gmail.com> <krhnfc4os5nqwi3iixgxwads3jbcgtdcvn7ygxpvd62uaejvsk@mx6tmser7jti>
In-Reply-To: <krhnfc4os5nqwi3iixgxwads3jbcgtdcvn7ygxpvd62uaejvsk@mx6tmser7jti>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 14 Sep 2023 15:39:06 -0700
Message-ID: <CAF6AEGtn6eC++nscpv0T5UXKaKJktMk5zcs+ck1gd9_=i-8jhw@mail.gmail.com>
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>, =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
	emma@anholt.net, linux-doc@vger.kernel.org, vignesh.raman@collabora.com, 
	dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io, jbrunet@baylibre.com, 
	robdclark@google.com, corbet@lwn.net, khilman@baylibre.com, 
	sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com, 
	linux-rockchip@lists.infradead.org, Daniel Stone <daniels@collabora.com>, 
	martin.blumenstingl@googlemail.com, robclark@freedesktop.org, 
	Helen Koike <helen.koike@collabora.com>, anholt@google.com, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com, 
	linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, 
	neil.armstrong@linaro.org, guilherme.gallo@collabora.com, 
	linux-kernel@vger.kernel.org, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_153921_899919_B5ABA031 
X-CRM114-Status: GOOD (  79.00  )
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

On Thu, Sep 14, 2023 at 2:54=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Tue, Sep 12, 2023 at 02:16:41PM +0100, Daniel Stone wrote:
> > Hopefully less mangled formatting this time: turns out Thunderbird +
> > plain text is utterly unreadable, so that's one less MUA that is
> > actually usable to send email to kernel lists without getting shouted
> > at.
>
> Sorry if it felt that way, it definitely wasn't my intention to shout at
> you. Email is indeed kind of a pain to deal with, and I wanted to keep
> the discussion going.
>
> > On Mon, 11 Sept 2023 at 15:46, Maxime Ripard <mripard@kernel.org> wrote=
:
> > > On Mon, Sep 11, 2023 at 03:30:55PM +0200, Michel D=C3=A4nzer wrote:
> > > > > There's in 6.6-rc1 around 240 reported flaky tests. None of them =
have
> > > > > any context. That new series hads a few dozens too, without any c=
ontext
> > > > > either. And there's no mention about that being a plan, or a patc=
h
> > > > > adding a new policy for all tests going forward.
> > > >
> > > > That does sound bad, would need to be raised in review.
> > > >
> > > > > Any concern I raised were met with a giant "it worked on Mesa" ha=
ndwave
> > > >
> > > > Lessons learned from years of experience with big real-world CI
> > > > systems like this are hardly "handwaving".
> > >
> > > Your (and others) experience certainly isn't. It is valuable, welcome=
,
> > > and very much appreciated.
> > >
> > > However, my questions and concerns being ignored time and time again
> > > about things like what is the process is going to be like, what is go=
ing
> > > to be tested, who is going to be maintaining that test list, how that
> > > interacts with stable, how we can possibly audit the flaky tests list=
,
> > > etc. have felt like they were being handwaived away.
> >
> > Sorry it ended up coming across like that. It wasn't the intent.
> >
> > > I'm not saying that because I disagree, I still do on some, but that'=
s
> > > fine to some extent. However, most of these issues are not so much an
> > > infrastructure issue, but a community issue. And I don't even expect =
a
> > > perfect solution right now, unlike what you seem to think. But I do
> > > expect some kind of plan instead of just ignoring that problem.
> > >
> > > Like, I had to ask the MT8173 question 3 times in order to get an
> > > answer, and I'm still not sure what is going to be done to address th=
at
> > > particular issue.
> > >
> > > So, I'm sorry, but I certainly feel like it here.
> >
> > I don't quite see the same picture from your side though. For example,
> > my reading of what you've said is that flaky tests are utterly
> > unacceptable, as are partial runs, and we shouldn't pretend otherwise.
> > With your concrete example (which is really helpful, so thanks), what
> > happens to the MT8173 hdmi-inject test? Do we skip all MT8173 testing
> > until it's perfect, or does MT8173 testing always fail because that
> > test does?
>
> It's not clear to me why that test is even running in the first place?
> There's been some confusion on my side here about what we're going to
> test with this. You've mentioned Mesa and GPUs before, but that's a KMS
> test so there must be more to it.
>
> Either way, it's a relevant test so I guess why not. It turns out that
> the test is indeed flaky, I guess we could add it to the flaky tests
> list.
>
> BUT
>
> I want to have every opportunity to fix whatever that failure is.
>
> So:
>
>   - Is the test broken? If so, we should report it to IGT dev and remove
>     it from the test suite.
>   - If not, is that test failure have been reported to the driver author?
>   - If no answer/fix, we can add it to the flaky tests list, but do we
>     have some way to reproduce the test failure?
>
> The last part is especially critical. Looking at the list itself, I have
> no idea what board, kernel version, configuration, or what the failure
> rate was. Assuming I spend some time looking at the infra to find the
> board and configuration, how many times do I have to run the tests to
> expect to reproduce the failure (and thus consider it fixed if it
> doesn't occur anymore).

Are you looking for a link to the pipeline, where you can get job
output from the various stages (which should also include igt output)?

Perhaps someone can point you to a pipeline with mtk (I don't have
that in the drm/msm tree yet)

>
> Like, with that board and test, if my first 100 runs of the test work
> fine, is it reasonable for me to consider it fixed, or is it only
> supposed to happen once every 1000 runs?
>
> So, ideally, having some (mandatory) metadata in the test lists with a
> link to the bug report, the board (DT name?) it happened with, the
> version and configuration it was first seen with, and an approximation
> of the failure rate for every flaky test list.
>
> I understand that it's probably difficult to get that after the fact on
> the tests that were already merged, but I'd really like to get that
> enforced for every new test going forward.
>
> That should hopefully get us in a much better position to fix some of
> those tests issues. And failing that, I can't see how that's
> sustainable.
>
> And Mesa does show what I'm talking about:
>
> $ find -name *-flakes.txt | xargs git diff --stat  e58a10af640ba58b6001f5=
c5ad750b782547da76
>  src/amd/ci/deqp-radv-stoney-aco-flakes.txt                        |  18 =
+++++
>  src/broadcom/ci/deqp-v3d-rpi4-flakes.txt                          |   2 =
+
>  src/broadcom/ci/deqp-v3dv-rpi4-flakes.txt                         |  15 =
++++
>  src/broadcom/ci/deqp-vc4-rpi3-flakes.txt                          |  30 =
++++++++
>  src/broadcom/ci/piglit-v3d-rpi4-flakes.txt                        |  14 =
++++
>  src/broadcom/ci/piglit-vc4-rpi3-flakes.txt                        |   5 =
++
>  src/freedreno/ci/deqp-freedreno-a307-flakes.txt                   |   6 =
++
>  src/freedreno/ci/deqp-freedreno-a530-flakes.txt                   |  31 =
+++++++++
>  src/freedreno/ci/deqp-freedreno-a630-bypass-flakes.txt            |  11 =
+++
>  src/freedreno/ci/deqp-freedreno-a630-flakes.txt                   | 109 =
++++++++++++++++++++++++++++++
>  src/gallium/drivers/freedreno/ci/piglit-freedreno-a530-flakes.txt |  21 =
++++++
>  src/gallium/drivers/freedreno/ci/piglit-freedreno-a630-flakes.txt |  31 =
+++++++++
>  src/gallium/drivers/llvmpipe/ci/deqp-llvmpipe-flakes.txt          |   4 =
++
>  src/gallium/drivers/panfrost/ci/deqp-panfrost-g52-flakes.txt      |   6 =
++
>  src/gallium/drivers/panfrost/ci/deqp-panfrost-t720-flakes.txt     |   4 =
++
>  src/gallium/drivers/panfrost/ci/deqp-panfrost-t760-flakes.txt     |   1 =
+
>  src/gallium/drivers/panfrost/ci/deqp-panfrost-t860-flakes.txt     |   1 =
+
>  src/gallium/drivers/radeonsi/ci/piglit-radeonsi-stoney-flakes.txt |   1 =
+
>  src/gallium/drivers/softpipe/ci/deqp-softpipe-flakes.txt          |   2 =
+
>  src/gallium/drivers/virgl/ci/deqp-virgl-gl-flakes.txt             |   3 =
+
>  src/gallium/drivers/zink/ci/deqp-zink-lvp-flakes.txt              |   0
>  src/gallium/drivers/zink/ci/piglit-zink-lvp-flakes.txt            |   0
>  src/gallium/frontends/lavapipe/ci/deqp-lvp-flakes.txt             |   1 =
+
>  23 files changed, 316 insertions(+)
>
> In the history of Mesa, there's never been a single test removed from a
> flaky test list.

That is very definitely not true, see for ex
a297624182218b24d5accb975101448b0bf97077

This command is just showing you the diffstat from the start of time,
which ofc is going to be all + and no -

BR,
-R

>
> > Both have their downsides. Not doing any testing has the obvious
> > downside, and means that the driver can get worse until it gets
> > perfect. Always marking the test as failed means that the test results
> > are useless: if failure is expected, then red is good. I mean, say
> > you're contributing a patch to fix some documentation or add a helper
> > to common code which only v3d uses. The test results come back, and
> > your branch is failing tests on MT8173, specifically the
> > hdmi-inject@4k test. What then? Either as a senior contributor you
> > 'know' that's the case, or as a casual contributor you get told 'oh
> > yeah, don't worry about the test results, they always fail'. Both lead
> > to the same outcome, which is that no-one pays any attention to the
> > results, and they get worse.
>
> I believe the above would achieve a better result for us kernel folks,
> while still providing enough flexibility for you.
>
> > What we do agree on is that yes, those tests should absolutely be
> > fixed, and not just swept under the rug. Part of this is having
> > maintainers actually meaningfully own their test results. For example,
> > I'm looking at the expectation lists for the Intel gen in my laptop,
> > and I'm seeing a lot of breakage in blending tests, as well as
> > dual-display fails which include the resolution of my external
> > display.
>
> I just bought a 7900XT and I'm pretty much in the same situation, so I
> definitely feel what you're saying :)
>
> However...
>
> > I'd expect the Intel driver maintainers to look at them, get them
> > fixed, and gradually prune those xfails/flakes down towards zero.
> >
> > If the maintainers don't own it though, then it's not going to get
> > fixed. And we are exactly where we are today: broken plane blending
> > and 1440p on KBL, broken EDID injection on MT8173, and broken atomic
> > commits on stoney. Without stronger action from the maintainers (e.g.
> > throwing i915 out of the tree until it has 100% pass 100% of the
> > time), adding testing isn't making the situation better or worse in
> > and of itself. What it _is_ doing though, is giving really clear
> > documentation of the status of each driver, and backing that up by
> > verifying it.
>
> ... I haven't reported any of the failures yet so I don't really expect
> them to be fixed by themselves. That's on me.
>
> > Only maintainers can actually fix the drivers (or the tests tbf). But
> > doing the testing does let us be really clear to everyone what the
> > actual state is, and that way people can make informed decisions too.
> > And the only way we're going to drive the test rate down is by the
> > subsystem maintainers enforcing it.
>
> Just FYI, I'm not on the other side of the fence there, I'd really like
> to have some kind of validation. I talked about it at XDC some years
> ago, and discussed it several people at length over the years. So I'm
> definitely not in the CI-is-bad camp.
>
> > Does that make sense on where I'm (and I think a lot of others are)
> > coming from?
>
> That makes sense from your perspective, but it's not clear to me how you
> can expect maintainers to own the tests if they were never involved in
> the process.
>
> They are not in Cc of the flaky tests patches, they are not reported
> that the bug is failing, how can they own that process if we never
> reached out and involved them?
>
> We're all overworked, you can't expect them to just look at the flaky
> test list every now and then and figure it out.
>
> Maxime

