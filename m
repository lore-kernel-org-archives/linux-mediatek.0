Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD33C48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/coZVWzQlvY3NMZeenRUeOtdhcanI7zbWH7vE2q3YA=; b=Pm5WzSFVswNTS3KDxfPfNeiwyG
	7gMSnIs1HVbAVoCZOg1KsNnfmDK2H6EN/PCfFAsYdaEHQiZFiJ7PrDJbuXLf2Tp5m6qB1FU+TwC9O
	zN6Nqgj9iA36KXlPcxSOuh1RJp87f5i9NrqCkxPIP5y4YVeVe8LKBgs2FRfzD1DUKAIjeNVbPbllk
	RCm7t45aEKzvNIvUEO5tAQgfFtMeHo6jx5PFV+b3dYjaPU3ZYfqR2NbsD7mR+kHKgCY8wd7MSOsDs
	DeB9sIJy08fOIQDDJ0BwPefOe/5v5qDtuHI+og85Q1jm5/qRy4yoyEs+C/yhZAv2KVHQcsw0Kwqk6
	BvDTNk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rau1y-00000001dLz-2LAi;
	Fri, 16 Feb 2024 08:57:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rau1v-00000001dKC-34F0
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Feb 2024 08:57:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rau1c-0007VS-M6; Fri, 16 Feb 2024 09:56:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rau1b-0012eE-I9; Fri, 16 Feb 2024 09:56:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rau1b-005roU-1V;
	Fri, 16 Feb 2024 09:56:51 +0100
Date: Fri, 16 Feb 2024 09:56:51 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Conor Dooley <conor@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible
 for MT7988
Message-ID: <crisnlcmsylgjbyikwj4it5oee46lrcneegt35rkh7f7irpjt4@au5h4owkl4s3>
References: <20240213164633.25447-1-zajec5@gmail.com>
 <20240213-resource-evaluator-0754cfd5882d@spud>
 <d4391868-ddcd-4f66-b539-28d245fa83df@gmail.com>
 <e957b044-fe84-4b72-bdf1-cbc40c722019@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x6fer6asqpvyqikq"
Content-Disposition: inline
In-Reply-To: <e957b044-fe84-4b72-bdf1-cbc40c722019@collabora.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_005711_781715_A31A8D5A 
X-CRM114-Status: GOOD (  24.39  )
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


--x6fer6asqpvyqikq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Feb 14, 2024 at 10:27:54AM +0100, AngeloGioacchino Del Regno wrote:
> Il 14/02/24 07:34, Rafa=C5=82 Mi=C5=82ecki ha scritto:
> > On 13.02.2024 19:18, Conor Dooley wrote:
> > > On Tue, Feb 13, 2024 at 05:46:32PM +0100, Rafa=C5=82 Mi=C5=82ecki wro=
te:
> > > > From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> > > >=20
> > > > MT7988 has on-SoC controller that can control up to 8 PWMs.
> > >=20
> > > I see a binding and a dts patch, but no driver patch, how come?
> >=20
> > I believe that to avoid cross-trees patchsets (which are sometimes
> > tricky for maintainers) there are two ways of submiting such changes:
> > 1. dt-binding + driver; then (separately) DTS
> > 2. dt-binding + DTS; then (separately) driver
> >=20
> > I chose later in this case as my personal priority right now is to deal
> > with all MediaTek DTS files.
> >=20
> > Is that wrong or unacceptable?
> >=20
>=20
> It's not wrong but it's partially unacceptable, at least on my side.
>=20
> In my opinion (and I believe many do agree with me), sending the binding =
along
> with the driver is the right choice, and if you also want to include the =
dts
> that is also appreciated: series can go through multiple maintainers appl=
ying
> subsets - it's ok to do.

Just to put in my 2 =C2=A2:
My preference is to not avoid cross-trees patchsets and put all three
patches in a single series. This combines the advantages of 1. and 2.
Given this happens often enough this is something that the maintainers
are used to handle just fine, so the cross-tree issue isn't problematic
most of the time. The conflicts that sometimes arise with cross-tree
patches aren't bad enough to out-weight having binding, driver and dts
changes all together.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--x6fer6asqpvyqikq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXPI1IACgkQj4D7WH0S
/k50eggAl5AH/OVaXRqlBR+khwnAAggxgfwh/au8rZ5x8SWflhcLnzmbI5goBNP+
QiVN6/885+APLBzrvTgeiEQAjlKGsc1Av9hy5x2gQy4U9rhPVikE3B8fE9pugDEr
ZIhljDbUobwdsu08aGbAr2sggD9tI8eJDcssD9sOF6Gwn73LjYJ7AxYuph9MWHqJ
Ztdiy+AjILaWSAq4jeCCmL6MFgXIGDq6Unb6w6lDFhAcjG6FKh09+gyjFkihNdsg
Ib93vHAw+rnrzUfcHhmFNaIIiw5d5mediZDrLKqWXp5U10ipOhfocOoyFK3AqKVS
9PS6i5I/jMerH5hRMqLY0+/3ZEjhlA==
=TKTq
-----END PGP SIGNATURE-----

--x6fer6asqpvyqikq--

