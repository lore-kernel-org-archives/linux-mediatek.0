Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C244CC0015E
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jul 2023 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rke1+qbDXJNXdK9AhDQFEXG9NPLM1sSYSBqtySh8H4s=; b=X4T5J/cO35ZLABJhXoxKbgioeM
	dH0tAK0NXbQ0R2BtktP/duwLZrbd0RVhSsb+pyBfW5ESIk6xPefYlJ4dvh8B1TpTAx6h9lkbEPTEb
	17zqYley371Cz9CtwjmCscjogblJplMzTBVduZtt74d5/xHKTnn/aSdmd8jaW+PgtJ9UBgIX0t46O
	y3b+T3flx29oq+OYyvNenKVOG4u0QdN2uv4tXbZ5pEZNm5xAboCJzKD/Z0AgBsvB2XsnZLTFt0hlw
	HXxmM3TvPnJG73dXfeWaj2mYLQdE1DjmTn3IeEHyLuoFY6McEpHjBP+Bu0/uomflOXWBkdUA0wksK
	7OHKpiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIyV-003MAI-0Y;
	Mon, 17 Jul 2023 07:48:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIyQ-003M9H-1U;
	Mon, 17 Jul 2023 07:48:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7760E60F99;
	Mon, 17 Jul 2023 07:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D184C433C9;
	Mon, 17 Jul 2023 07:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689580128;
	bh=m+bGBZrS1lDGOHNa7b+hG+gRi77nkTrb6lLGgxVmoYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cc71VvLupE2MVR5St9xy0kvM9+8+V8AqYxNp7WXqP7VEykPEE9WBRCdQRwK+H5lzk
	 A8JIKg87oWLk3jM3o3u3+Hjy/cVoZIQ14yqXg0LCQgMkK25VCZMT5wlGGpgxmP69mT
	 8YStn41+v1A1sn/uCJqIXtJ5MCwOFPq+58Qif9US7C7O9okAn0HiAqcFL0e6JVmmkw
	 C/QxZ5SwA93y+vBvj8QnNXCMHJv7aVpTNzGynBanFSdJjao1pqRrytwBnEzqAJfQzt
	 hQeo5JWAvwdGAVzxOQzwTQgpQpDF4Ory/aHLbu7ZsL7GArKX/zI1XhtkGs0gK/sy8u
	 reo5WJbeXlU5w==
Date: Mon, 17 Jul 2023 09:48:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, sboyd@kernel.org, mturquette@baylibre.com, 
	matthias.bgg@gmail.com, msp@baylibre.com, yangyingliang@huawei.com, 
	u.kleine-koenig@pengutronix.de, miles.chen@mediatek.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 2/2] clk: mediatek: mt8195-topckgen: Refactor parents for
 top_dp/edp muxes
Message-ID: <jv6daj2w3pwjtde3m3m26yg4wyxbbio4zqra5yqc4gb32ri5ub@noinbbkjovwm>
References: <20230713072138.84117-1-angelogioacchino.delregno@collabora.com>
 <20230713072138.84117-3-angelogioacchino.delregno@collabora.com>
 <9a0817c2-4101-5c21-977d-77ac0d83a067@baylibre.com>
 <CAGXv+5E7YYdkG7GtxG90KzdAG8Kke+74Amtbw4mmyVNZgDZHRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pnm62w2pu2hihd2p"
Content-Disposition: inline
In-Reply-To: <CAGXv+5E7YYdkG7GtxG90KzdAG8Kke+74Amtbw4mmyVNZgDZHRA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_004850_604351_8D4EFD7C 
X-CRM114-Status: GOOD (  40.81  )
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


--pnm62w2pu2hihd2p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 14, 2023 at 12:19:00PM +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 13, 2023 at 9:22=E2=80=AFPM Alexandre Mergnat <amergnat@bayli=
bre.com> wrote:
> > On 13/07/2023 09:21, AngeloGioacchino Del Regno wrote:
> > > The top_dp and top_edp muxes can be both parented to either TVDPLL1
> > > or TVDPLL2, two identically specced PLLs for the specific purpose of
> > > giving out pixel clock: this becomes a problem when the MediaTek
> > > DisplayPort Interface (DPI) driver tries to set the pixel clock rate.
> > >
> > > In the usecase of two simultaneous outputs (using two controllers),
> > > it was seen that one of the displays would sometimes display garbled
> > > output (if any at all) and this was because:
> > >   - top_edp was set to TVDPLL1, outputting X GHz
> > >   - top_dp was set to TVDPLL2, outputting Y GHz
> > >     - mtk_dpi calls clk_set_rate(top_edp, Z GHz)
> > >       - top_dp is switched to TVDPLL1
> > >       - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
> > >       - eDP display is garbled
> > >
> > > To solve this issue, remove all TVDPLL1 parents from `top_dp` and
> > > all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
> > > clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
> > > able to use the right bit index for the new parents list.
> > >
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> > > ---
> > >   drivers/clk/mediatek/clk-mt8195-topckgen.c | 22 ++++++++++++++-----=
---
> > >   1 file changed, 14 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk=
/mediatek/clk-mt8195-topckgen.c
> > > index 81daa24cadde..abb3721f6e1b 100644
> > > --- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
> > > +++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
> > > @@ -417,15 +417,21 @@ static const char * const pwrmcu_parents[] =3D {
> > >
> > >   static const char * const dp_parents[] =3D {
> > >       "clk26m",
> > > -     "tvdpll1_d2",
> > >       "tvdpll2_d2",
> > > -     "tvdpll1_d4",
> > >       "tvdpll2_d4",
> > > -     "tvdpll1_d8",
> > >       "tvdpll2_d8",
> > > -     "tvdpll1_d16",
> > >       "tvdpll2_d16"
> > >   };
> > > +static const u8 dp_parents_idx[] =3D { 0, 2, 4, 6, 8 };
> > > +
> > > +static const char * const edp_parents[] =3D {
> > > +     "clk26m",
> > > +     "tvdpll1_d2",
> > > +     "tvdpll1_d4",
> > > +     "tvdpll1_d8",
> > > +     "tvdpll1_d16"
> > > +};
> > > +static const u8 edp_parents_idx[] =3D { 0, 1, 3, 5, 7 };
> >
> > AFAII your solution is to force a specific TVDPLLX for each display, and
> > it isn't dynamic.
> >
> > Do you think it's possible to do that using the DTS ? I'm asking
> > because, IMHO, this kind of setup is more friendly/readable/flexible in
> > the DTS than hardcoded into the driver.
>=20
> (CC-ing Maxime, who has some experience in the matter.)

It's not clear to me what the context is, but I'll try my best :)

> assigned-parents doesn't prevent your system from reparenting the clocks
> back to a conflicting configuration.

Yep, it's very much a one-off thing. There's no guarantee at the moment,
and semantics-wise we could change the whole thing at probe time and it
would be fine.

> AFAIK the recommended way to deal with this is to use
> clk_set_rate_exclusive() and co. in whatever consumer driver that
> needs exclusive control on the clock rate.

I guess it works, but it looks to me like the issue here is that the
provider should disable it entirely? My expectation for
clk_set_rate_exclusive() is that one user needs to lock the clock rate
to operate properly.

If the provider expectation is that the rate or parent should never
changed, then that needs to be dealt with at the provider level, ie
through the clk_ops.

> However I'm not sure if that works for parents. It should, given the
> original use case was for the sunxi platforms, which like the MediaTek
> platform here has 2 PLLs for video related consumers, but I couldn't
> find code verifying it.

If you want to prevent clocks from ever being reparented, you can use
the new clk_hw_determine_rate_no_reparent() determine_rate
implementation.

Maxime

--pnm62w2pu2hihd2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLTyVAAKCRDj7w1vZxhR
xXw4AP0Ty/OWNJLgn+fLyMmNGKPM9qnI7RTYAK+pr90b8DkpXAEAktwYMnIZi2Tb
QCzSP3n9UARQeQqEP4FOhX7MS7S1TA0=
=WUaC
-----END PGP SIGNATURE-----

--pnm62w2pu2hihd2p--

