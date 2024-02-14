Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DE4C48BC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 10:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnJOc4z//DOjfKlx8+OsKAL8Ga16tYDqx+CAITnN62Y=; b=ZrGf0viGCUfSExBZNt4AfHvO6k
	/YiYtyghMODprPCX3i2aRIzbeopis8q2E+atkb2lbRgV9CN4Cu55az5xP+kMZMtRoIPxPzDShZpL9
	qXinSioNiX1C3aRWb8VHriIuqntel2LMTwH57dZZKO+6E5iRztK/8/6KDEtUzzzniFQ/WsoUlqtEj
	MzFIH9OhQSGBpsAB4GiwykS4YewKZjKpWIi2BEm+YPwbkR93xjy+dWCOUwst4sVSdlA9CekZqqr52
	+GZ+lwXXWvRlHTak/6RgPswF82kDCrLobOSMdcE4LmmN9isyYZlZT0+2UG9DF82NJI2gkfhUp8dTG
	dwcRdM6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCAH-0000000CTTO-3NCU;
	Wed, 14 Feb 2024 10:06:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCAE-0000000CTSo-3Ure;
	Wed, 14 Feb 2024 10:06:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFAA661870;
	Wed, 14 Feb 2024 10:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67D9C433F1;
	Wed, 14 Feb 2024 10:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707905209;
	bh=xnJOc4z//DOjfKlx8+OsKAL8Ga16tYDqx+CAITnN62Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NEIeFAEabfVaJlHVQUx7gy7CMJqfiDCHXwmKI2Q3EtXXl9CIlPPmPNdGwOMm4GlXw
	 pVqe8n/wjChC71Gw2lWLq6cMk7djaFqNGOikZZORFb4CTlg4tNp7KkrHy4pLrFMqvl
	 do8Sherb+C43R2vc80w14BFe457qgOs7vXRiUrPLeJPQ7spwnj0f4pStnCX245WD2f
	 7s6yiZY3uz5/7EeHiit/dcsoudDQBOfL5yZfib9JkAUA/oVO/LJc65zjEkzoTBKVmI
	 QC4/wvHjEJn0eVGbiz9bhn9UBM48Yjht46O51IoP8o1dcthzymMThf6tyl2FbxWL+/
	 sARjWgrYJXTkw==
Date: Wed, 14 Feb 2024 10:06:44 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible
 for MT7988
Message-ID: <20240214-reversion-arguably-37bbee9caf78@spud>
References: <20240213164633.25447-1-zajec5@gmail.com>
 <20240213-resource-evaluator-0754cfd5882d@spud>
 <d4391868-ddcd-4f66-b539-28d245fa83df@gmail.com>
 <e957b044-fe84-4b72-bdf1-cbc40c722019@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mPF6YbHq+X8lxM7g"
Content-Disposition: inline
In-Reply-To: <e957b044-fe84-4b72-bdf1-cbc40c722019@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_020650_983506_32D59D6F 
X-CRM114-Status: GOOD (  32.81  )
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


--mPF6YbHq+X8lxM7g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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

> I want to put emphasis on sending the binding with the driver, as this al=
lows
> for a better review on everyone's side because we do see the full picture=
 and
> we can give better advices: in this case, I'm not sure whether adding a n=
ew
> compatible for MT7988 in an enum is a good idea, as the compatible string=
 may
> be shared with one of the *eleven* SoCs that are supported in the PWM dri=
ver,
> meaning that (hardware speaking!) the PWM controller in 7988 might be the=
 same
> as the one in mt1234.

Re-ordering to make my reply make more sense...

> In my opinion (and I believe many do agree with me), sending the binding =
along
> with the driver is the right choice, and if you also want to include the =
dts
> that is also appreciated: series can go through multiple maintainers appl=
ying
> subsets - it's ok to do.

Ye, either of those two makes my life a lot easier. I can then at least
go and check the driver patch to see if things match up. In this case, I
would want to check that the driver requires changes to support this
device, given the commit message mentions nothing about the difference
between this device and others. I'd still probably request that the
commit message be improved to explain the lack of a fallback, but at
least I would be clear about what I want and could provide a conditional
Ack.

If you're not sending the bindings patch with the driver, there's an
extra onus on you to explain exactly what makes this device incompatible
with the other devices in the enum, although in an ideal world it'd make
no difference and every bindings patch would contain that information.

> >=20
> > > Also, what makes this incompatibly different with the other devices in
> > > the binding, like the 8183?
> >=20
> > It can control 8 PWMs unlike any other SoC block except for MT2712.
> > It uses different registers than MT2712 thought.

Put this information in your commit message next time :)

Cheers,
Conor.

--mPF6YbHq+X8lxM7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcyQtAAKCRB4tDGHoIJi
0ueXAQDCS+trr+ex9ySxR5bxD0kVm8SrRFLeLixgJlLEsQasHAEAiqnEQG8s/IH4
xMOno6DMMEiw9aCzIyGoQTTN4Ied7wg=
=QoHf
-----END PGP SIGNATURE-----

--mPF6YbHq+X8lxM7g--

