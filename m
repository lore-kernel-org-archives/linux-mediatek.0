Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6C1C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iREKtWN/FRyhTvfIY1nRyQHq4+FT6qr2YnQIfvxYGzY=; b=JYT5dAmvOlBdVa9PlfBqcYIlS4
	1O7WYjAHiCdaJc3hkeqznakOiXudv+O0e33+vFhdwP4w+6T8SYhVukKjJTc9jmyHU6W9toY2NDD5G
	q3oUNKBQ+lqajZu5gTxuW9dHt7JZHz/37IQ3EqW4M+5gsJL5z0+tl/ddRJ53Zcmyb4xUVAyAbPf9M
	SO2VlViscp/NpaL7zPdhgRaFHbYXseXvI9Lgs0lePGvCwgrsbPWkrn73qGcPou8LVMssVgJn9ACiJ
	NTGULALVVhEmQkMyPR3T6mOORS4AnIx321CGM4cyLO+62MqQSyTMXSMly6X/h2jO8i1Mk/m6vc3Hs
	/SJVr8qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0L0-005YJU-0k;
	Wed, 19 Jul 2023 06:07:02 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Ky-005YHx-18;
	Wed, 19 Jul 2023 06:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iREKtWN/FRyhTvfIY1nRyQHq4+FT6qr2YnQIfvxYGzY=; b=kTUqcTnjLQ17zELDxhemVQwm4G
	BlpIydh1Shsqopr817B+/EVNzt05HTvnFoXCfhRyTRcvFFBBvwo0NnGENC6Yuwq5InGeY1A3NNUL2
	IcwLVMYCQYgZ5isfI7ubB+Vde1t690qHYpo75P6ikYa2ox2waZFG9ubcuJCOUTW/H+/eNcdlgyfxv
	j5A0NwCQ7LbPj56AiYPPkwqQfRZtvUvyvO1tbYH5pjb+GzeUGWEQHK94FF5WB6lqnxPUHLUpWM6U1
	q6ZzFJC40srMbabXn4V+FHeO7mZGpAsrvkyx8P7rIabFsds2SLvF8g8YsL/1I8h5/TBRkBFBJwWgM
	JAoLiu2Q==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLgdH-00BLPX-2i;
	Tue, 18 Jul 2023 09:06:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8EBF0614C7;
	Tue, 18 Jul 2023 09:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA2BC433C8;
	Tue, 18 Jul 2023 09:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689671022;
	bh=iREKtWN/FRyhTvfIY1nRyQHq4+FT6qr2YnQIfvxYGzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MN+Eh6lEZv3uMv67b2/iRGRCGQnvO3nfiQSWlIOfbXSvm6H7ghUVPCq3q4b/8HHOS
	 0TmCSQSbPR19uPdVpQexpSf0ZSQHWsC3wpwJz7CDi+OlUBP/YMJVDT+ZxxNZu+0u7F
	 xyR6XBlL3aIefseI6ilceCOzq2ztNXZNuIsrSj0T5qCTIj6kicF6gRyXtak4GpT5WQ
	 NkK7aDQyYa5B8lr+N0QNWBDMNAjKX8Pa7XsP5Ygrt6WlWiDnuAf5lFMGwipK0oks8j
	 faE8DDNGp1zuvsKHh+cQX4NVvyMAq0c6PCt6+gzGd9I4U7h507hsEfBjNvd/akLb+6
	 QEoyFutBzhPOA==
Date: Tue, 18 Jul 2023 11:03:39 +0200
From: Maxime Ripard <mripard@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, 
	Alexandre Mergnat <amergnat@baylibre.com>, sboyd@kernel.org, mturquette@baylibre.com, 
	matthias.bgg@gmail.com, msp@baylibre.com, yangyingliang@huawei.com, 
	u.kleine-koenig@pengutronix.de, miles.chen@mediatek.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 2/2] clk: mediatek: mt8195-topckgen: Refactor parents for
 top_dp/edp muxes
Message-ID: <hd2ydj33vp3dsri4czx6frxxvir6vxnovc27n6rrgs4qqbtrjz@whhyt2iinq5k>
References: <20230713072138.84117-1-angelogioacchino.delregno@collabora.com>
 <20230713072138.84117-3-angelogioacchino.delregno@collabora.com>
 <9a0817c2-4101-5c21-977d-77ac0d83a067@baylibre.com>
 <CAGXv+5E7YYdkG7GtxG90KzdAG8Kke+74Amtbw4mmyVNZgDZHRA@mail.gmail.com>
 <jv6daj2w3pwjtde3m3m26yg4wyxbbio4zqra5yqc4gb32ri5ub@noinbbkjovwm>
 <25724ee3-858a-01eb-352b-3edbfad31c8e@collabora.com>
 <jxgy2pvns4ri2aj5nmdhb4zbluseuzdejbplh2avwz63df2cfx@grrrdm6ujzi4>
 <24d17b07-1e8d-05f6-46b7-9da1ff1bed7a@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tkgkm5f75v43u7ai"
Content-Disposition: inline
In-Reply-To: <24d17b07-1e8d-05f6-46b7-9da1ff1bed7a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_100636_250130_90561C15 
X-CRM114-Status: GOOD (  41.94  )
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


--tkgkm5f75v43u7ai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 04:30:48PM +0200, AngeloGioacchino Del Regno wrote:
> > > > > AFAIK the recommended way to deal with this is to use
> > > > > clk_set_rate_exclusive() and co. in whatever consumer driver that
> > > > > needs exclusive control on the clock rate.
> > > >=20
> > > > I guess it works, but it looks to me like the issue here is that the
> > > > provider should disable it entirely? My expectation for
> > > > clk_set_rate_exclusive() is that one user needs to lock the clock r=
ate
> > > > to operate properly.
> > > >=20
> > > > If the provider expectation is that the rate or parent should never
> > > > changed, then that needs to be dealt with at the provider level, ie
> > > > through the clk_ops.
> > > >=20
> > > > > However I'm not sure if that works for parents. It should, given =
the
> > > > > original use case was for the sunxi platforms, which like the Med=
iaTek
> > > > > platform here has 2 PLLs for video related consumers, but I could=
n't
> > > > > find code verifying it.
> > > >=20
> > > > If you want to prevent clocks from ever being reparented, you can u=
se
> > > > the new clk_hw_determine_rate_no_reparent() determine_rate
> > > > implementation.
> > > >=20
> > >=20
> > > We want the clocks to be reparented, as we need them to switch parent=
s as
> > > explained before... that's more or less how the tree looks:
> > >=20
> > > TVDPLL(x) -> PLL Divider (fixed) -> MUX -> Gate -> Controller
> > >=20
> > > Besides, I think that forcing *one* parent to the dp/edp mux would pr=
oduce a
> > > loss of the flexibility that the clock framework provides.
> > >=20
> > > I again want to emphasize on the fact that TVDPLL1 and TVDPLL2 are *i=
dentical*
> > > in specs, and on that there will never be a MT8195 SoC that has only =
one of
> > > the two PLLs, for obvious reasons...
> > >=20
> > > P.S.: If you need more context, I'll be glad to answer to any other q=
uestion!
> >=20
> > Then I have no idea what the question is :)
> >=20
> > What are you trying to achieve / fix, and how can I help you ? :)
>
> Chen-Yu, Alexandre had/have questions about if there was any other soluti=
on instead
> of using the solution of *this* commit, so, if there's any other better s=
olution
> than the one that I've sent as this commit.
>=20
> I'm the one saying that this commit is the best solution :-P

I went back to the original patch, and my understanding is that, when
running two output in parallel, the modeset of one can affect the second
one, and that's bad, right?

If so, then you usually have multiple ways to fix this:

 - This patch
 - Using clk_set_rate_exclusive like Chen-Yu suggested
 - Using a notifier to react to a rate change and adjust

I'm not aware of any "official" guidelines at the clock framework level
regarding which to pick and all are fine.

My opinion though would be to use clk_set_rate_exclusive(), for multiple
reasons.

The first one is that it models correctly what you consumer expects:
that the rate is left untouched. This can happen in virtually any
situation where you have one clock in the same subtree changing rate,
while the patch above will only fix that particular interference.

The second one is that, especially with DP, you only have a handful of
rates you'll need to reach. 148MHz, 297MHz, 594MHz, and possibly a bunch
of others for eDP panels. It's thus likely to have both controllers
having the same frequency requirement, and thus it makes it possible to
run from only one PLL and shut the other down.

This patch will introduce orphan clocks issues that are always a bit
bothersome. A notifier would be troublesome to use and will probably
introduce glitches plus some weird interaction with scrambling if you
ever support it.

So, yeah, using clk_set_rate_exclusive() seems like the best option to me :)

Maxime

--tkgkm5f75v43u7ai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLZVawAKCRDj7w1vZxhR
xXe2APsHH4CM60HIBZOpTkLdn0OFP63ah5e365xRn+SOxzSqFQEA3f7mN2WJ8Phu
2S2ZjuQ2DHgx/txS945DQOZlGRNrWA0=
=4oSs
-----END PGP SIGNATURE-----

--tkgkm5f75v43u7ai--

