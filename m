Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C53CA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 13:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74/lXDjAicbAQVpv6HCI5jeqajIVNGavg/gPM8Y5/Jo=; b=sYfWSlXBkod/d7c/w/cXQWWRhG
	EHX1AplJFEOdFy+0zIdcdQUaDY3vDRxsinbGbxnzhjDhr+AIdnL/wSk/qrucj2bsKr+6Cf2W754r2
	Lcu5Bdzdbt5mBIjiSRyfkZe6zQzBe2iBkqMEfiE8Rq4qiDseMYBdc0+cgYtO9aBDcMtPATQpVxcBQ
	brUkZeG50uUbicC3ytp67pn+lJ94UjiMJILrdWctfyhsJKaH0qp3XqC9cRHXO8GiqCDnvmfpUhWbX
	qI8+Ob6XhyjMvZLeW3Klek+f9WgmN6Guoxdx1Zc3XFSw6Lja3WJjCKvGKNGZ5385zQF572uWQuuN0
	/csddyQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg3GO-003PFc-2v;
	Tue, 12 Sep 2023 13:17:08 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg3GL-003PDh-13
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 13:17:07 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-273d10d3df3so3589263a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 06:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1694524622; x=1695129422; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74/lXDjAicbAQVpv6HCI5jeqajIVNGavg/gPM8Y5/Jo=;
        b=XqIXJ1chqoAfZvOaIJmA5+iwATL8bhkC/Ls7KR9W+c8Z3po58O1/6vldbZOw4cHuXf
         JhrsY/XgrnWbnGb1SIBpgTFU66IQ8iVe5mvAYALcgS5ef9Ee+w1U6mcHS/4eOaJkpErW
         D0l1rc1Y+629ePc8tbkllKYSHzFS3p5KRCZQx/qaLWrLni7YDZVHlV9oS5wJz1T74n8q
         QTW4GyE+8pfEPvWUW7kIX1h6AOeAqHEmLsMd9JR8qmIxd9htPkI1wXpQE9fHZewxZt9P
         ne23Pi7n57OF+pAIdK1V/KZd9RQTghjABehcd+3vXJi/yS1udtEINxswDu6x5pc/JsT8
         Casw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694524622; x=1695129422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74/lXDjAicbAQVpv6HCI5jeqajIVNGavg/gPM8Y5/Jo=;
        b=sObVEcpW/Htfo9/HAhcWvYr+B8ylNYDxjtmtopdcdvp4x9QO88j98Kj3AN8tTbcZLY
         nGAQaVIf9vviDDmaQDQ8LTeSJ+4LO9LacqD+dZ3Lzi2SGOr9Ew715Ln00KO41WnjoFWt
         M72muMeCQEnIIZyQCTjROLnEu4vYEF3NpJbJP3wfG40/hAzQlVO74hqDsGGpEp90PcpA
         OhvLLGvGZgGJkmswObqXRyDtE+vIHxmCQiQhx4vZ0j3u31eSzrCzNzcMsld/DYO+avjq
         QSyRn4Pf8iUA69tbU0OWxLe9gNlY9AO+RmP1HpCQwDqubM9K4HtP4tp7ncuyW+WCnpc6
         4rEQ==
X-Gm-Message-State: AOJu0YzCEbtWIpRxDIU9jYwwhmTazYm3QyHxVxpOjEqstkd9+OWPucUJ
	HHZnLnTc4i3B3Ey1cUYi6nltzeSm8gDwzGKjaVss2Q==
X-Google-Smtp-Source: AGHT+IERwDFvK750zia0Sae/chWY8QEXD4kOdOHvlRSTQo34xsLlidVO5fUIkgz4yvPkVtnGdXKIiS6fw+3sN/KQfUM=
X-Received: by 2002:a17:90a:aa85:b0:268:1e95:4e25 with SMTP id
 l5-20020a17090aaa8500b002681e954e25mr10043598pjq.17.1694524622460; Tue, 12
 Sep 2023 06:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <4rpsqk4tgrdcxtxtfoum6o4oyglwkirmkh3jj4y5tays2ivb5p@uwqdf3snshkv>
 <25df6189-7b0a-b13d-e93d-c2a388fd45e3@collabora.com> <zmq7pz7rtz6h765azg5kl2qgjd264yafctx4q474t5tqai57og@cajbcub4yuwr>
 <5fdf9d29-3f8d-0ee0-027f-57ff3a5cecb8@collabora.com> <CAKMK7uGg6n322UugJwErqF_Dvsbqceqae6SVWV3ZWEOR7x36rQ@mail.gmail.com>
 <9a2b1ad8-4359-4f12-b4f9-c1de477bc440@collabora.com> <mnjcsiqjqdnvbbkaaz5r4n42e56qsax667r7radzyagnmmfkip@dfi64z5deqzj>
 <b7d96985-8489-efe2-db67-1f3108e26822@mailbox.org> <5ejq3hjpoy3gxft2jbmoa5m656usetuxcs7g3ezyyiitj67rav@r5jhdz27foat>
 <550454b8-2e2c-c947-92c5-37f0367661c2@mailbox.org> <os2wvkangif2nwewfbzkuyjm7njp4g3sqj5td3ogbhhjwsrbbd@3jpf6g5hd3z4>
In-Reply-To: <os2wvkangif2nwewfbzkuyjm7njp4g3sqj5td3ogbhhjwsrbbd@3jpf6g5hd3z4>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 12 Sep 2023 14:16:41 +0100
Message-ID: <CAPj87rP1sw49Z0HdPhUa-=kDp166RqiuhC9rL+Ef9hpwPD5+JA@mail.gmail.com>
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
To: Maxime Ripard <mripard@kernel.org>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
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
X-CRM114-CacheID: sfid-20230912_061705_559281_34CBF36C 
X-CRM114-Status: GOOD (  37.44  )
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

Hi Maxime,
Hopefully less mangled formatting this time: turns out Thunderbird +
plain text is utterly unreadable, so that's one less MUA that is
actually usable to send email to kernel lists without getting shouted
at.

On Mon, 11 Sept 2023 at 15:46, Maxime Ripard <mripard@kernel.org> wrote:
> On Mon, Sep 11, 2023 at 03:30:55PM +0200, Michel D=C3=A4nzer wrote:
> > > There's in 6.6-rc1 around 240 reported flaky tests. None of them have
> > > any context. That new series hads a few dozens too, without any conte=
xt
> > > either. And there's no mention about that being a plan, or a patch
> > > adding a new policy for all tests going forward.
> >
> > That does sound bad, would need to be raised in review.
> >
> > > Any concern I raised were met with a giant "it worked on Mesa" handwa=
ve
> >
> > Lessons learned from years of experience with big real-world CI
> > systems like this are hardly "handwaving".
>
> Your (and others) experience certainly isn't. It is valuable, welcome,
> and very much appreciated.
>
> However, my questions and concerns being ignored time and time again
> about things like what is the process is going to be like, what is going
> to be tested, who is going to be maintaining that test list, how that
> interacts with stable, how we can possibly audit the flaky tests list,
> etc. have felt like they were being handwaived away.

Sorry it ended up coming across like that. It wasn't the intent.

> I'm not saying that because I disagree, I still do on some, but that's
> fine to some extent. However, most of these issues are not so much an
> infrastructure issue, but a community issue. And I don't even expect a
> perfect solution right now, unlike what you seem to think. But I do
> expect some kind of plan instead of just ignoring that problem.
>
> Like, I had to ask the MT8173 question 3 times in order to get an
> answer, and I'm still not sure what is going to be done to address that
> particular issue.
>
> So, I'm sorry, but I certainly feel like it here.

I don't quite see the same picture from your side though. For example,
my reading of what you've said is that flaky tests are utterly
unacceptable, as are partial runs, and we shouldn't pretend otherwise.
With your concrete example (which is really helpful, so thanks), what
happens to the MT8173 hdmi-inject test? Do we skip all MT8173 testing
until it's perfect, or does MT8173 testing always fail because that
test does?

Both have their downsides. Not doing any testing has the obvious
downside, and means that the driver can get worse until it gets
perfect. Always marking the test as failed means that the test results
are useless: if failure is expected, then red is good. I mean, say
you're contributing a patch to fix some documentation or add a helper
to common code which only v3d uses. The test results come back, and
your branch is failing tests on MT8173, specifically the
hdmi-inject@4k test. What then? Either as a senior contributor you
'know' that's the case, or as a casual contributor you get told 'oh
yeah, don't worry about the test results, they always fail'. Both lead
to the same outcome, which is that no-one pays any attention to the
results, and they get worse.

What we do agree on is that yes, those tests should absolutely be
fixed, and not just swept under the rug. Part of this is having
maintainers actually meaningfully own their test results. For example,
I'm looking at the expectation lists for the Intel gen in my laptop,
and I'm seeing a lot of breakage in blending tests, as well as
dual-display fails which include the resolution of my external
display. I'd expect the Intel driver maintainers to look at them, get
them fixed, and gradually prune those xfails/flakes down towards zero.

If the maintainers don't own it though, then it's not going to get
fixed. And we are exactly where we are today: broken plane blending
and 1440p on KBL, broken EDID injection on MT8173, and broken atomic
commits on stoney. Without stronger action from the maintainers (e.g.
throwing i915 out of the tree until it has 100% pass 100% of the
time), adding testing isn't making the situation better or worse in
and of itself. What it _is_ doing though, is giving really clear
documentation of the status of each driver, and backing that up by
verifying it.

Only maintainers can actually fix the drivers (or the tests tbf). But
doing the testing does let us be really clear to everyone what the
actual state is, and that way people can make informed decisions too.
And the only way we're going to drive the test rate down is by the
subsystem maintainers enforcing it.

Does that make sense on where I'm (and I think a lot of others are) coming =
from?

To answer the other question about 'where are the logs?': some of them
have the failure data in them, others don't. They all should going
forward at least though.

Cheers,
Daniel

