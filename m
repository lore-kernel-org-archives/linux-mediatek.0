Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F12C3F6B0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmqUKOO9XNrI/cs1MrOy1b0u4h0VrYYKXIeI6cyXNGY=; b=fUczqP4hN99PTF+pISQiYDVPyI
	BcX+buXQItgghp1b+AZrckLljR2vwKzB/lppihEIexLS0Ky5tJ0TotMsdqVVsfVLyo3M+oeNfIOs9
	AkQQkIedcZqV0n0tnb+UeVzqjI4gagV2st60qdkchizpRP3IgMuV47/vZrVvArAe8g3pEOfOisOzt
	4BrDY7VPZblMKGb5Bq5qrogV6T1IxF/JbzMZ3tHxLdYcI+9411j6prUCzmSh2OL8E2i2TaCALIJyy
	nG9vJhsB+Rra/NPukbJeH8osU/1mT6xJnsN3mJsMIPJGwObbDvy5brOP+Ow+Q6MiZB5EKD/mGd41Z
	nHaZbz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJcKC-006wPx-2t; Thu, 04 Aug 2022 14:59:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJcJy-006wJF-5n; Thu, 04 Aug 2022 14:59:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5EC0560DF4;
	Thu,  4 Aug 2022 14:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3F7C433C1;
	Thu,  4 Aug 2022 14:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659625172;
	bh=MG/OLbjvUhmhCpOzmNodao8upPyMUSDGDlCf4g1Eh8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c0CgKr7ehUtGuS3wp8y8m8OtWbhfEOxk49tcM/MH4FlGcXmpiu6UyWwDl9JQLoS8U
	 HNGhEvCTp4Ux90AuEx9zSWQLTkXTo5P1EZL9RJEUbFELp6pjuIqPjvieYGGJ3EMXi8
	 jGO+iVCvN14kxXkFuuorjPcXDUUzlo0LHgWvcybGLswb4Ie/FstY+nsdybl8IxPPpz
	 tkxl53aibDN5URDHncyDCfT3sVlxslwrQXBOZx99tGeH5lY7fu4KFi7ts5522MIV7X
	 htz2sr7xYv82aOqR8tmW7XQDtQC4EdRb/h1Q6XqW8RcSo8PlevvXVrTQZ9j59UJ+Mk
	 vE5znSwjnW5mw==
Date: Thu, 4 Aug 2022 15:59:26 +0100
From: Mark Brown <broonie@kernel.org>
To: "chunxu.li" <chunxu.li@mediatek.com>
Cc: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
	lgirdwood@gmail.com, angelogioacchino.delregno@collabora.com,
	daniel.baluta@nxp.com, matthias.bgg@gmail.com, yc.hung@mediatek.com,
	tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	project_global_chrome_upstream_group@mediatek.com
Subject: Re: [PATCH 1/2] ASoC: SOF: Introduce optional callback
 of_machine_select
Message-ID: <YuvezrxOnAJTLKt9@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
 <20220804091359.31449-2-chunxu.li@mediatek.com>
 <YuvG4drwG/rYoozp@sirena.org.uk>
 <644d24503899e6ed8b6a7321979e11e46577a610.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h0hDaRGCHYmaxJ2S"
Content-Disposition: inline
In-Reply-To: <644d24503899e6ed8b6a7321979e11e46577a610.camel@mediatek.com>
X-Cookie: Did I say 2?  I lied.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_075934_334435_992772FD 
X-CRM114-Status: GOOD (  12.64  )
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


--h0hDaRGCHYmaxJ2S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 04, 2022 at 10:36:07PM +0800, chunxu.li wrote:

> Thanks for you advice, I'll remove the callback function, and directly
> call sof_of_machine_select() in sof_machine_check() as following.
>=20
> int sof_machine_check(struct snd_sof_dev *sdev)
> {
> 	}
>=20
> =09
> +	of_mach =3D sof_of_machine_select(sdev);
> +	if (of_mach) {
> +		sof_pdata->of_machine =3D of_mach;
> +		return 0;
> +	}

Looks good.

--h0hDaRGCHYmaxJ2S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLr3s0ACgkQJNaLcl1U
h9CNtgf/XRsA3q6DYLqEaEXV4tXIlM8fA/R/M0YDmHq6Ue+jq26vdS+Af5jl77wB
FIpNpuihB4hPSw02XTLtF7vyGr2FovaTLOCQcYI1YFv/HdKvw2e/F7CGKbopburY
DaP2S1j4l5n/cEGFht//jtFMR1wlmgLPcjcSCx62mZpAqvUulCjnjL5EMhyygC2W
n+80WJg3AH1EzsDtYEsvjs7xI7zswHcamarrPa3Wgl/FIiAS99nk1PH17AKIlncB
Gl/wOsK9p5nDKqiKGrLmVuC80G6DOC2NcvMmu+zgElXU6SmUsytHQQWuWxfJ9jpr
PQ16skJvJ9CihoHwi7dYaA8P6h3J5Q==
=uDFa
-----END PGP SIGNATURE-----

--h0hDaRGCHYmaxJ2S--

