Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E774AC197BF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCYZEqDU29mV/oNhQzvKUezViExGkTYP3v0Ttd1er+E=; b=Pe2uj6mDLLFwrAbRFoiB1riX/5
	f7QvgejObsQYTLMp7fvkeOzM6z2MaEG78C8jvwKUwR7xGmbb0gawu6R80uLFveWmKJB+PQq0uYL0b
	Va53PrsHcf52uC7YoGrA/+GQSmPZ/Y7IRtNVYPtkYrK+hDWSl3SDYDrbZHRBaFb0/gjs19G33Vwzl
	JbeKl0lLrn+jMHxCNpY8hZNC9G2DiKxJU+SZBkLlVCeL2HkEdFy5kSYuQWb1ocEercKpyFiFawzhh
	UE8MiJrz5S/uF2aly8C+n1soRkALGtUu1Of1fjZ0kyDe6o815zK7k6j2a1FkHQoONKgrq6o1fAR8o
	wATgbcKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjC-00000008XjA-3bOn;
	Thu, 27 Feb 2025 19:39:26 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngSr-000000081Hc-0CIa;
	Thu, 27 Feb 2025 16:10:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C1EC61548;
	Thu, 27 Feb 2025 16:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727BDC4CEE7;
	Thu, 27 Feb 2025 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740672619;
	bh=YCYZEqDU29mV/oNhQzvKUezViExGkTYP3v0Ttd1er+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9jgtNv2TfNW57fbo62ipO3IfdMDTIdaY+Q2mzg4eQ8YdQsp0h/yXw3FkSA8Myfmi
	 V6d7RW0ZzMYMlsAwg6z3dlyUaiIdZCwtyw3yLiD/au7CHcZTSMl9HP1Ager722NGzk
	 B3jIc9TGXbZ3SgNkr1tU0bobTT1MwYTyQk+/ABjjOdbdnE4DzqNZOSQpaWJfNlPfii
	 UheFk+CcWHIroX7zRZOT7vM/PoPJEJ8N0Gyw4ddK6rK2/xzLQ/IOwd+AyuppJeNWKG
	 2h0UF/GQJLHjn1KsDMfHs96xZT2QERoEWPJ2TfanTIbmAa7dig1BdnJHPPKvmZfUd5
	 NeNRRvg4anqOw==
Date: Thu, 27 Feb 2025 16:10:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: mediatek: mt8188: Fix uninitialized variable
 msk
Message-ID: <7e26d6f8-a920-4933-9f27-52f08a975acf@sirena.org.uk>
References: <20250226161847.567160-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pWySIzzNsqHTGnmF"
Content-Disposition: inline
In-Reply-To: <20250226161847.567160-1-colin.i.king@gmail.com>
X-Cookie: Swim at your own risk.
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


--pWySIzzNsqHTGnmF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 26, 2025 at 04:18:47PM +0000, Colin Ian King wrote:
> The variable msk not initialized and is being bit-wise or'd with values
> in a for-loop, leading to an undefined result. Fix this by initializing
> msk to zero before the for-loop.

Arnd sent a version of this that picked up reviews from the Mediatek
people so I applied that one, should be fixed in tomorrow's -next.

--pWySIzzNsqHTGnmF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfAjmUACgkQJNaLcl1U
h9Cs1Af+MSLOz0trHITEydA1HvWLS0Wo5bVckllFyYx804ML5J1ygfDeFai7jkCg
xvv6G4/0iIDehHzjt6Dgx9QchR7zs1jYHqYB18VHczyC1FmDxAZqsJP8BiLdiZAc
LmJqP7Ja/AKV38HZ7PRzNumF6+wleFdUFGSFUjTVPeQhY3gBBA6m+/yzt9OsBmnq
vFaxQQO7gi0K1o/FGNtYrFVvd9M/daCguvavPfHWUFA4CRTc/sMKCEfmxPwTcqQl
4Qy2pG9lptEg0Z2NWfDyk7eS9lXPZgMae4Ce9OXhQFR8UnLprTGz9xXoQjvGQ7qm
UhKi612TSq9alxvM1gAim+feYjpyTg==
=YEY3
-----END PGP SIGNATURE-----

--pWySIzzNsqHTGnmF--

