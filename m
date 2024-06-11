Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CECC25B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 13:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W164saS/QevSx0SUPUjTgpmiTTJGBuxLG5IS5R3Y+SA=; b=F/T34ZY8oL7IBi0jN+3cX2QU1h
	zWliovw6j3P9Qn41z8VbiAmovlEpcaCgH62FMAHJsj7oCBvGgpRZaIbz2GfAftgL+Fz2+eGZCJi8O
	5fMydcQife5jCLX/U26a0eNfNhPeW73hWB2+bBNgQksbORCB+WrzZ/60VmHir7MLtQFkl8ey0kb49
	3f4pXJjA6VzM8fUNLthvQhq5qvDVgFAda8gHWkY9vnYzCuO+uzrV7aZ72GwAUfKpZvCctmwv1juQ/
	RY2McELwO4sfvLziV0a/kycTrOPM5reRgE8QfCqnQ90gC7AbvNmh6/UFjLmLNIgeBDWb/DAXSOvhH
	qrNe0OPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH1PD-00000008x4N-1jZv;
	Tue, 11 Jun 2024 13:19:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH1PA-00000008x33-12QU;
	Tue, 11 Jun 2024 13:19:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3533360C71;
	Tue, 11 Jun 2024 13:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D914C2BD10;
	Tue, 11 Jun 2024 13:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718111954;
	bh=J8yhVuHGe30lXX6K160M1LciDauZy7HN1wD2X9gUkcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iF2ogBzdTXnby9LDZhbj6ywrmVv5y4/40fTX7bT04jojCnB5hwI7vy1ibGcJ8/r88
	 XYFw9P19hjgZoO+QtbYGCraSsJ4jQz8NSmVFD/UtW7QW3rV2RqX3mpo++bIky+LrpX
	 jM3Ot4XwUy41z1nP+5IWc3fQBT7vvV1as9FrnOujEXlHY2H1e9c24le/Og2N7/pZMZ
	 PXSIFplW3DEFzQsPk4R2zwpsm1+X/HlmNr94C9FRqMnjVTqn9U1LnE0faOxcOxTLeY
	 a71HjU9vUmwHQXTj9+/oQjdmNzNod8sbirixKktKFZfUFJIIGXh2sqKN9GxzYWDNAP
	 9fDFRuXW1K0sg==
Date: Tue, 11 Jun 2024 14:19:11 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rui Zhou <zhourui@huaqin.corp-partner.google.com>, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com,
	trevor.wu@mediatek.com, allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com, maso.huang@mediatek.com,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1] ASoC: support machine driver with TAS2781
Message-ID: <ZmhOz7BB8eJ38QVE@finisterre.sirena.org.uk>
References: <20240611022227.2508354-1-zhourui@huaqin.corp-partner.google.com>
 <Zmgsfafmfedd9_MV@finisterre.sirena.org.uk>
 <d7d32ef3-8b2e-476c-a15e-7f829ea0d60a@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L8C5DHVHxE1pZFLB"
Content-Disposition: inline
In-Reply-To: <d7d32ef3-8b2e-476c-a15e-7f829ea0d60a@collabora.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_061916_438096_F3F4FFC6 
X-CRM114-Status: GOOD (  23.55  )
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


--L8C5DHVHxE1pZFLB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2024 at 02:38:09PM +0200, AngeloGioacchino Del Regno wrote:
> Il 11/06/24 12:52, Mark Brown ha scritto:
> > On Tue, Jun 11, 2024 at 10:22:27AM +0800, Rui Zhou wrote:
> > > Support amp TAS2781 for mt8188 platform

> > > +++ b/sound/soc/mediatek/Kconfig
> > > @@ -233,6 +233,7 @@ config SND_SOC_MT8188_MT6359
> > >   	select SND_SOC_HDMI_CODEC
> > >   	select SND_SOC_DMIC
> > >   	select SND_SOC_MAX98390
> > > +	select SND_SOC_TAS2781_I2C
> > >   	select SND_SOC_NAU8315
> > >   	select SND_SOC_NAU8825

> > Ideally this would be sorted to avoid spurious merge conficts.  Also do
> > we really have dependencies here or should these just be being enabled
> > by users - these drivers are all pretty generic now?

> The only dependency is on the MT6359 PMIC's audio related IPs and nothing else.

> I'd even remove the other select statements for the other codecs, honestly,
> as there's no reason why MT8188 wouldn't support a codec or the other, and
> there is no reason why that SoC needs exactly those codecs, apart from some
> board (Chromebooks) having one, or the other.

Right, that's what I meant - the drivers are now so generic that they
probably shouldn't be selecting everything they could possibly work
with.

> Instead of adding a select statement on MT8188_MT6359, adding the TAS2781_I2C
> driver as a module in defconfig is a better idea..... at least, IMO.

Yes.

> >  Not that this
> > change in itself makes a huge difference to the existing state.

> I agree it doesn't make any huge difference, but I also don't see why users
> can't simply enable (y/m) that in the kernel configuration :-)

I think this is a result of the drivers originally being very specific
to a particular setup and gradually getting made more generic, if the
driver can only be used on a specific machine then the selects make
sense but that's no longer the case for these drivers I think.

--L8C5DHVHxE1pZFLB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZoTs4ACgkQJNaLcl1U
h9C5qQf9G5KuVznYWJOIxmrBhe90rR14xzXQ8iuN/dpwJrplNgIKiv/scP1621jG
KMls3d3XffNozTDEjmE38BVH8H8kpa0pS2A88fKLp9Gv+4lvXMQXrw/XO/oKxkIZ
b5sX+1YNLdebMbKyDzw16JmUenEkZHgSNpxc68bfmxFptlhtqo+0V3ZPkpGlsTCr
i8uIMveI3ySIyxh+nRJHll9qfgqA5YvoHEadaflAnaRhQ6eI9beW9VtbBX3+P02n
IYysSSakV433928mgTzoGvXGTgyJkc9ZV/uF7E5RRntPdqzU+/dEVlvt2wipweI2
LyNOUbLuMhdQXn/GFYSUfFaJBROFdw==
=JJl5
-----END PGP SIGNATURE-----

--L8C5DHVHxE1pZFLB--

