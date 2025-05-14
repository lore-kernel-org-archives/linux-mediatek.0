Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50F8C3ABCC
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 May 2025 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/uPvQl5SO699WAK2gwjv1DwR8/P78GRzFmmIsaqUe8=; b=u9QgxK4CyyAtwpatlDMuGqRZFR
	kvBcrfpe6qRt4whiJ+v63ykQh89vq+P/dlj0vEglIaziBsPp1v8JvBnYCUnNy3FhqnbITqRPLhWG9
	miGvmIgwjepZw04ixbXV7YxZb1vRiNRGYg6ZtejOeuSBUPrJmL8u6LUNVSZGwwi23yJ9bDY0e6Wxc
	nDqNG6DZmpLnLnPY2uEeQfCBWSWpZvEP3hMycUtivWR8pIhmmZVff50OhkY+o+Fdilu4EcrbJ2IZK
	dC6frU8ELzu9Kdbio/0kONGOQCY70W7daTnmO6UXb1Wi99VEJ85UFM+3+q5WmsFYXkGrd6Yb7JHgY
	3Cc1ODyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDQK-0000000FTHY-3WZ6;
	Wed, 14 May 2025 14:49:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDDT-0000000FQhp-0Fow
	for linux-mediatek@lists.infradead.org;
	Wed, 14 May 2025 14:36:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C41EB40BD2;
	Wed, 14 May 2025 14:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F61C4CEE3;
	Wed, 14 May 2025 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747233374;
	bh=t/uPvQl5SO699WAK2gwjv1DwR8/P78GRzFmmIsaqUe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3X/1foPhOD3r0WP8EG2by5OEvVZPzSSU98aXZEVBHolHg3vFHyolHi5hlbNTTpaF
	 Fn9JNJ54/o9EXEBNnNCnmvwh9pywmXLIq/29nG2diKO4LnJm4Z72uCaRTgfAhuL3Q0
	 AW8nl2GmuVEjP5cdYLGEU8szMrJC6ME3D1yILxckEzaSCREa4D6ThTtMy67wjoDnhT
	 tyM+aTqaD7nIYGSwkRq3PKFug2sIvXLbKA/j1kERCJAfs3Zfx02bJyfAv6U+5hPVT7
	 lZkOiD6gzcG1GgyWef04ti5LQPoClpb+bDtAfV6ghuvE2+m/PpS/UwDpRpIjyn42j+
	 NqQNJ8AVq28PQ==
Date: Wed, 14 May 2025 16:36:09 +0200
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
Message-ID: <aCSqWbT9t1T29HT_@finisterre.sirena.org.uk>
References: <20250425082551.1467042-1-wenst@chromium.org>
 <86b55c96-7ec3-48ed-83b4-f434d7fcb5c2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G4b3JjsI8btsM/C/"
Content-Disposition: inline
In-Reply-To: <86b55c96-7ec3-48ed-83b4-f434d7fcb5c2@collabora.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_073615_122137_CB09FECB 
X-CRM114-Status: GOOD (  15.58  )
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


--G4b3JjsI8btsM/C/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 03:49:48PM +0200, AngeloGioacchino Del Regno wrote:
> Il 25/04/25 10:25, Chen-Yu Tsai ha scritto:

> > This series is meant as an example on how to use macros and range cases
> > to shorten the MediaTek audio frontend drivers. The drivers have large
> > tables describing the registers and register fields for every supported
> > audio DMA interface. (Some are actually skipped!) There's a lot of
> > duplication which can be eliminated using macros. This should serve as
> > a reference for the MT8196 AFE driver that I had commented on.

> Sorry for the very long wait here; the entire series is

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Unfortunately this doesn't apply against current code (I guess due to
development in the intervening time), could you please check and resend?

--G4b3JjsI8btsM/C/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkqlkACgkQJNaLcl1U
h9BagAf+LbiTr/XEhuAQvngZeJHld91IJrIAjQzha/eW6VThB0hPAijghqc0XSvL
bI33d35Hm/Y3ZsiIfOhqqg1nL0C4JRcJtF2AJnWXQCBuTq3ROom0xl4ZZjhZkuJb
jnqxMh4TyM6ogM4TGCwhmTlV/LFYEKfL951hYfY5XtAuj+7io5CHnRPj5eJcBhat
Y0Xj2jiWcWdH1zlJbTk9NYUZHq56sJS1nSXqupRpEkgGNLbX3vkSqjcUlSMOI5Bi
MNsc6fUgHxEIZUippP3c3NSw6g5WJRTnnM+W6XilhWmIaP8wl8fGdQKWyIIpcoaS
Qq/1byLn9CAo9+9VrYHQjTDiwcmE3A==
=zlK1
-----END PGP SIGNATURE-----

--G4b3JjsI8btsM/C/--

