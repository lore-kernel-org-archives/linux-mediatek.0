Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9DCC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Dec 2023 17:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV12AWwIoi+kXLnhKnmNSQ3kcvauJF2gzyvxXmPuFGg=; b=QDbYxGnyquzgIMJgMrwYm16NDB
	UZ5UdDuyVlBQZFqX3l/YiQWVqYdoLo3cDoQXnnOLgm3x4J6CeOIZYz2sRp3h7IjmegDWHsE1abqAQ
	kAXAgYi5xRkXVE/TBF+G8yvphvUnNYbiriqcOKqULamv2qMUG+nBczo2rxgckxadCK5YYZ1d9rIbp
	gVjoDoC4OlEOLYqtlbH9gFqbs4TudSlxqbMIqdLArnmkjBjgvI1ClP2HdAuCj+J92d5MKHo+lNIEB
	Y3I/6vDmaRbRKZYP07BU8Zjsv+dYr71QlXANKzx2R3dB8R4t3vAfMNiiNPQ/N2PfDbEUEJhum8Y30
	0LFkDZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZE2-0082Jv-10;
	Tue, 05 Dec 2023 17:28:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZDz-0082JL-17
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Dec 2023 17:28:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D34EE617C3;
	Tue,  5 Dec 2023 17:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDB3C433C8;
	Tue,  5 Dec 2023 17:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701797326;
	bh=VjMuyjx48RMDpAEidQsQ9e57dddsq66HW9llT158txg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p04zXYeNYvuIHmsqAHhwMDGM+Tn/MyUQnRnu8e2GtEEc/YL6VMpVqazbalAwZWyrv
	 92UD//Qo1Fld8TrKGkACwg68GYlJKxZyxgrSS28/DC6oK6BQ5M1vaLgJSUodSnFMIq
	 5m+YcY2/5NHhcKlEOaUyRzSDphOitSFLRZdwCMdc/0Tzjx/oUrEkOExEw5Mi4VKEfD
	 Iw/Ku5KvGOw5+JK/a5WPw/nbaeYtSy63uaL/eTs9ucTE2w9uIDqTfZYKbHqMFqPonU
	 ndcWONL3epyrr4j8Yo0p/A7SbZyRI6k2p9iLVYHWu2PKu/bGhcKxHk0mwaGoomMysq
	 tMLvagUYB5NEA==
Date: Tue, 5 Dec 2023 17:28:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com, perex@perex.cz,
	allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
Message-ID: <91546240-a2d1-4d65-b976-626cb1ef67e0@sirena.org.uk>
References: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
 <20231116093512.4180240-4-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wqFgQ+hFNzlp8dii"
Content-Disposition: inline
In-Reply-To: <20231116093512.4180240-4-zhourui@huaqin.corp-partner.google.com>
X-Cookie: I've Been Moved!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_092847_437963_5B3E3FD3 
X-CRM114-Status: GOOD (  10.03  )
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


--wqFgQ+hFNzlp8dii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 05:35:11PM +0800, Rui Zhou wrote:
> To use ES8326 as the codec, add a new sound card
> named mt8186_es8326.
>=20
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
> ---
>  sound/soc/mediatek/Kconfig                |  1 +
>  sound/soc/mediatek/mt8188/mt8188-mt6359.c | 49 ++++++++++++++++++++++-
>  2 files changed, 49 insertions(+), 1 deletion(-)

AngeloGioacchino, does this look OK to you?

--wqFgQ+hFNzlp8dii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVvXcgACgkQJNaLcl1U
h9AG/Qf9Eigu2fTuVLZjSCY//wCqSIv9O+6Y6pGIYz8FacNMWdn5a+HspXIQiqnc
r+3i9lF2dfD5emd6a2rq5xFdCmmbPmyKB8bFgvfgIdlr2Ri3YJkRy9MH7UwEhHO7
L0MjNGGozqbYPHQd4cBZ9TwLAJVzebrCjvUfERc5vfnGV27mpcKa0hLWEqNLnptY
xVcyjQaVYtcvkU8F52tUYHJNVkeeBa5YERfOR45XqJhy8uCKmb11Tfe9PveZZ+1+
f1P2KbQ7UbDPi++1mCoE+aNIsLlWKGyvrHeWLUjfJnx0Peic6NlOU39Hw/r0J99c
RqgPtlsE0/jhT4cUqj67hW4MNqd32A==
=IQvM
-----END PGP SIGNATURE-----

--wqFgQ+hFNzlp8dii--

