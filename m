Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7B6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 13:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wj0NkPcbCotORQarBdiAbSyb16QUQjz/pSt7plsm12k=; b=TWtvSzgp5XbVELaNXUlC1Pb7k8
	+7HI0xwlI0M1GA/guHaf+3OQHFCi2ksnOU2o3aIlMvda+SL7tr9XGV62nZpvLh/yBdkZqW7jglFYH
	DGkX5uKxfH+QDmmYff9AzGrtWudOT1ZvDq1z2uqSILBkUcLkmoH1AxKiMjPyCxtQeEF/MvRP1lfes
	u8oRv2kKcN1dC+AtCIBxRnIY+J9IDOBtpnAOHJiHR5ZnJbu759z3oZpIJNb9uluR03HHzAMY2ZAAk
	4i8akYE0IWa1rymo2ud/PSLZfyp/oJGC5HuV69Jq+B9lhodmCuVqgHrTwSPjsyCr7Vj+53Qhj3G7f
	HNLaLgHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95Sr-00ASAd-2P; Wed, 06 Jul 2022 13:53:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95Sg-00AS5R-Fi; Wed, 06 Jul 2022 13:53:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 67D1561E1E;
	Wed,  6 Jul 2022 13:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72A3C3411C;
	Wed,  6 Jul 2022 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657115580;
	bh=wj0NkPcbCotORQarBdiAbSyb16QUQjz/pSt7plsm12k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujscI4t2rRUPtr7y8Anf64wPRLszGIv84LzoyP3wQScr6oE3TRorySkt6CJnlfDI3
	 nT/3GFuLRp8lokOcckMG/k8COVF2RSVgGeoBef6JqK0hgH0QJuQBLfrhuVa9/2H6mF
	 G7Q++OAelNQynATL61wo7/tTBzbwHpBengktpcmkjudFThcBtk6cNiGK5i/sy2zHeP
	 1BOxXsot8XtLyrlnhiDbxab9dx5irQvE9qoi5eJlalmSyzXI/W3HxYwoh5exGdSbT2
	 0HCo4KBHjvJtFwuLA2DEbhsMuRPzKvUzc4okW+wCEzVBUgM55wTNNWaweq+wOOwJw/
	 3UDlhNevAkc6w==
Date: Wed, 6 Jul 2022 14:52:55 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, lee.jones@linaro.org
Subject: Re: [PATCH v3 RESEND 0/4] MediaTek Helio X10 MT6795 - MT6331/6332
 Regulators
Message-ID: <YsWTt3YSHI9LLpnw@sirena.org.uk>
References: <20220706100912.200698-1-angelogioacchino.delregno@collabora.com>
 <YsV9IerWCoa/xtwM@sirena.org.uk>
 <57367b11-f2d4-476b-b92d-16c1726316c0@collabora.com>
 <YsWG0jfqAf4EqojE@sirena.org.uk>
 <82736173-b3b8-1e1a-3e2e-25d9ca3287eb@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+0DViRXHLgzETHHF"
Content-Disposition: inline
In-Reply-To: <82736173-b3b8-1e1a-3e2e-25d9ca3287eb@collabora.com>
X-Cookie: Only God can make random selections.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_065302_629705_B8CDE21F 
X-CRM114-Status: GOOD (  21.46  )
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


--+0DViRXHLgzETHHF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2022 at 03:38:34PM +0200, AngeloGioacchino Del Regno wrote:
> Il 06/07/22 14:57, Mark Brown ha scritto:
> > On Wed, Jul 06, 2022 at 02:49:56PM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > Il 06/07/22 14:16, Mark Brown ha scritto:
> >=20
> > > > This previously got 0day failures due to missing dependencies which
> > > > need would need a merge with IIRC MFD, I see no reference in the co=
ver
> > > > letter to dependencies?
> >=20
> > > The only blocker for this series was the MFD patch, which got picked =
and
> > > it's present in next-20220706 (as you suggested me to resend when thi=
ngs
> > > were picked... I decided to wait until they actually landed on -next.=
=2E.)
> >=20
> > Right, I also said I'd need a pull request - if I apply the patches
> > without having the MFD bits they depend on in my tree then it will fail
> > to build.
>=20
> I remember writing that to Lee... how do we proceed in this case?
> Should we add him to the Cc's of this patch to notify him or..?

Lee, Angelo has sent me this series for Helio X10 which needs some MFD
bits (not 100% sure which, I guess Angelo can fill that in) - is there a
tagged branch available to pull in?

--+0DViRXHLgzETHHF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLFk7YACgkQJNaLcl1U
h9BVVgf/bVTIQ3LJY8DflcGkJacwVGb56elDn1Amq9pkxXbkJtQnWXq1DMcGQSKF
LnkN4wFuVKAOvPId86+vggsnTiqYoXFIUge+e4O9q+dyMS4cTGSaeNgzJFz6Kp8e
njWWIV9OfQsiIXJV+P+CBUrbKePomFwOgSiiOr1j240ou7TBYJc6uGOfMOC1A6Kw
zJxkp6clmMWF1gGu/YaK0I4L+p4L3LoJCyXT491GxjpwIs2zzSa8jMMVCzfi81Ny
V8n7BZCF4sVXQ/D6I9LL8iPUiR6JMtZppenkPYmqPSVbJihcmEC28sXODzvvpSMm
tTfrpr8NVhtxJ2kdZT0OEcyqEoGI2Q==
=2065
-----END PGP SIGNATURE-----

--+0DViRXHLgzETHHF--

