Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDCFC3DA78
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 21:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7g8tgfMvRpAaDtTVFt/qAubZuOqJNWo6+ViY1DTbIM=; b=aLezy3Qpmexh8CQszUuPSje+5U
	RwI8MJqlf4Wo3e0xhOy38RuMYUIi82CG1hqg+p6vKcwZi0sf/YoXdje3OURlulacQdQdFgdAs4YJd
	OOa+Uz5PvO1iZmgbV28GRXRX4mofD59H1Fokk8UrhNHrndpp3aAcDxWSs5VHbK1OG3HoAphRGamb/
	cxtS/XLyuI9JB1+zmg2ZLGxyScsey2Yn1pdYoL4oIjcbkwW/MNRaUaY1eNe/jabooDco5g6zdCzMJ
	Ix3EbyzCUGH97u3XEQmqg1j/AH0Qw6I/C75f7cuCo/qTqFwVTXWQ0BsN817tBjH7gOyGcwNc8J0n/
	zFn+iSYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHth7-00FzdA-2G; Tue, 17 Jan 2023 21:40:37 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHtgw-00FzZn-IH
	for linux-mediatek@lists.infradead.org; Tue, 17 Jan 2023 21:40:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pHtg0-0003Ts-5Q; Tue, 17 Jan 2023 22:39:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pHtfv-006lgx-TT; Tue, 17 Jan 2023 22:39:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pHtfv-00DhU5-7L; Tue, 17 Jan 2023 22:39:23 +0100
Date: Tue, 17 Jan 2023 22:39:19 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com, john@phrozen.org,
	sean.wang@mediatek.com, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt7622: Add missing
 pwm-cells to pwm node
Message-ID: <20230117213919.56cl74ffxzdpdcgp@pengutronix.de>
References: <20221128112028.58021-1-angelogioacchino.delregno@collabora.com>
 <20221128112028.58021-2-angelogioacchino.delregno@collabora.com>
 <20221202180932.5k3vymrwds5ssivq@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="reopnm6bu5cdz26m"
Content-Disposition: inline
In-Reply-To: <20221202180932.5k3vymrwds5ssivq@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_134026_622720_A523024D 
X-CRM114-Status: GOOD (  22.18  )
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


--reopnm6bu5cdz26m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Dec 02, 2022 at 07:09:32PM +0100, Uwe Kleine-K=F6nig wrote:
> On Mon, Nov 28, 2022 at 12:20:27PM +0100, AngeloGioacchino Del Regno wrot=
e:
> > Specify #pwm-cells on pwm@11006000 to make it actually usable.
> >=20
> > Fixes: ae457b7679c4 ("arm64: dts: mt7622: add SoC and peripheral relate=
d device nodes")
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot=
/dts/mediatek/mt7622.dtsi
> > index 146e18b5b1f4..f321c6d0fd7c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> > @@ -435,6 +435,7 @@ uart3: serial@11005000 {
> >  	pwm: pwm@11006000 {
> >  		compatible =3D "mediatek,mt7622-pwm";
> >  		reg =3D <0 0x11006000 0 0x1000>;
> > +		#pwm-cells =3D <2>;
>=20
> 3 should be possible, too. The driver does only support one
> polarity, so it's not really needed, but would be nice for consistency?
>=20
> Thierry, what's your take here?
>=20
> Other than that: Who would pick this up, I assume it to go via an ARM
> tree together with the 2nd patch in this series?

The questions here are still open and both patches unapplied. :-\

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--reopnm6bu5cdz26m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPHFYQACgkQwfwUeK3K
7Akv5gf/SJFYiqZQ3e3k7+kMNq/B+6Dm6vLLOrHhY7dXMcF3Xl9CD/eMuHJ3f23K
J99iGKEB0DLxV5P33FS7xbJKdCUc9LuZSdVJyn0O38dbk3r0JkWRuVyU03KbQ1F5
bklzciXjRNjn0GjeZVVNKt77U27aQvYCH6sTf3pwm3Daswr2sZLczSApMP/Hxmo4
4JUU7HoWFUyFekbH1Sdc/b2eFi8gTgSMsfQ2tCjmwsIDYuvEKJag7VKn91D3SZhL
/YZD5rSW+enlPaLQPqgl3LblyW7eyaaCnjwdY8VTNKzKqEHdxfDywhkD0uNMNzR5
L/3BJO7uE2sGE+y9hMx8I6jtMiCRzw==
=m6Kf
-----END PGP SIGNATURE-----

--reopnm6bu5cdz26m--

