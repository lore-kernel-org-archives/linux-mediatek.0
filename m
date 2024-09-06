Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F355E6FE41
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 18:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfKGjEXx5hSeUXB8vrUl2jj650dPsUbikh6TxwpLm8k=; b=YmXlAKDxp2NnJCcFxMgIFowczc
	GJIuVGYtw1+Dx/SCkE8Xwz6AVslNGPymCOzV/VMDe7SEKH3Hlob8lJvgZhsFlsI6glj4kq7gphtrQ
	tE+div+baHIFIkZ/Z+oU9itj/mxXL85NhsDYcwKSc/YB90fwquHOvW5LZXD8uQ09BH90eG07ACuZz
	N8XugdSjxg5sA9pYbwo+lP/0VEsvndRRSGI9PPAZtgUCh0EmWVy3RHmDNd+9ufNOlYSOGYfsyyaLb
	iDk3FfcLAvClQjEsbjmoJTqbF4kPzFkBvsjS7aNZRjIt8DRXoFXhojiDslxhSdrSIt+HobgZQ0f21
	vRi4Y/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smdoH-0000000DIfP-2foU;
	Fri, 06 Sep 2024 18:35:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smdnH-0000000DIWQ-0v8f;
	Fri, 06 Sep 2024 18:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 805FCA45210;
	Fri,  6 Sep 2024 18:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FA9C4CEC4;
	Fri,  6 Sep 2024 18:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725647689;
	bh=DfKGjEXx5hSeUXB8vrUl2jj650dPsUbikh6TxwpLm8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4Oqns1ZT+8BaXLlOHhPFVIqEyFqit8FSM7w0q2NuoPjesvljHet03opQbah0Fwxd
	 li+VWGIxfeiBscR7cdhr1Sy4mt+y+hYdDRA+rN4uLd1xeodMLwkuDVrEuYECMXCZTK
	 CZ+7Os7xhiAZZQ+VWkLUzv4LxRv0iM9Lo8i6uGsU+ps91zOS1cpLAb+HwrfoYCDFdL
	 2CEVjrZo14qSo8Xfi4+KQC2byM9ofWla+hmuHH03vmYga0Sq+49XxD3/Yjkn0OT6Yv
	 KC5BgEJOCmV7E3+xU78KHnbNuQhBVtcMmwemLDcDNlVDaXuqiZYD34GbP0fxuK7F81
	 LKrJw9XYcGO0g==
Date: Fri, 6 Sep 2024 19:34:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: (subset) [PATCH v7 00/16] Add audio support for the MediaTek
 Genio 350-evk board
Message-ID: <ZttLRhOn9uIuk0Kl@finisterre.sirena.org.uk>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <172544860860.19172.7052813450885034844.b4-ty@kernel.org>
 <20240906180348.GA1239602@thelio-3990X>
 <ZttJdexQFOq2Q9iQ@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ROeGXY+oUkHH2KgO"
Content-Disposition: inline
In-Reply-To: <ZttJdexQFOq2Q9iQ@finisterre.sirena.org.uk>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_113451_341411_1E959E4D 
X-CRM114-Status: GOOD (  11.87  )
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


--ROeGXY+oUkHH2KgO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 06, 2024 at 07:27:04PM +0100, Mark Brown wrote:

> These commits passed an x86 allmodconfig with GCC 12 at each step (I did
> catch one warning there with another patch in the series that didn't get
> applied) and 0day didn't say anything at any point.

Oh, actually right as I was writing that message 0day decided to report
that (and some other things that look rather preexisting), though only
with clang 20.

--ROeGXY+oUkHH2KgO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbbS0UACgkQJNaLcl1U
h9A4PAf9EXvt7UgwANg6DLruDFhtYHs50i0gB5suWbYdBIV1oNQ+ZsrdL38D1SfO
s4IvxwibYw+GjhYu6rWRC1S3yF1kpB5/Y6bnyZC3y7T9anqLD0wC56ZraWJB4vON
Uqm04cTI/g/MNzFxJn0l9dU+5r3y9hX890cCtRBZYVagmM/u9eG8IULqbCOHhPVG
kHrJv7MTxpQ1emjKM/ZKCbZ6Z056BkaBgAk3mht5pjv9D3VvvlRIhgZ/0tVrwTdd
/OaQPpR8z/dLk0LJ2sgPCx2/0MjGrmEveCCTH7/uvJEJ/DQV2bAqgL693OJ0uUc1
hrVwYOMO6wBL9SUj5BU/2dFxPFLmxg==
=5wcC
-----END PGP SIGNATURE-----

--ROeGXY+oUkHH2KgO--

