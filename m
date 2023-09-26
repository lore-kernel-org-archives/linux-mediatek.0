Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCE9E7E648
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 15:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8b2IFsXG6BYbvL2ly6sSXnKfNqvQC9inEX2QHsDbe4=; b=JdFyFxDK5pPEYYEehbfrZaIzfF
	5TlsUSoAHlm849poURnW65wvHzV7Q9FDoV/8Tz0AsKAspTnn3WhqrhpMJ/FiHmgPsXy+zzE9ZdkL9
	8l4PYtKrPuP4et4P3QZjKNPQqQTNr0yqKduA7xzNpQx1P2roYoCFgnogsRuVPF4AercKKdpDQvF5A
	QgFd3T9HK+jW3zIYCe0BVFNaaYTkKoTIT4iKhThoSYQfryrgCNLbZyKO9u6uba2HVl7OPfXNL2FbA
	Z3Z62+Cl28LiFWVagm5qvIhsZLoqFRT1ee1XUPgWOG6AKds/h65Mh2AdoxTmOIZjKcETOA3OfMdcc
	9dH6MI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9zp-00Gdwc-0A;
	Tue, 26 Sep 2023 15:29:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9zm-00Gdvq-0a;
	Tue, 26 Sep 2023 15:29:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AA5E611AD;
	Tue, 26 Sep 2023 15:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3546C433C9;
	Tue, 26 Sep 2023 15:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695742145;
	bh=u8b2IFsXG6BYbvL2ly6sSXnKfNqvQC9inEX2QHsDbe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGaM7mnw0ur3AJG9xiZ1MzLaAEStY0dsB5mNBhvWgaFOz7MthbVWOTieAzsU2ydUc
	 k7gzeRnasYmYUZmPTRS8UeHYOD01PDmSU9Ugm9lQzWTmVyi9QTh+hRLqC9ZvTgqPZW
	 8GNQ/SjZc/xM0ika5tsqKCaw4KchVjLKu9xYDqf/HBzYahj4fjTAqNkN37puY5DxSf
	 wUmWUrb4l6A1uuxeeBg3tP+ZzO5a7FLsycQg00P887JLw/rL7jTqlOJQ6zgbbBkrSs
	 5ZZ7ug7siDRpYApC93t74IS0mpojtMD2kYd+LIOn8XXTwBoG4sK1caDWQT1jwmSe6N
	 rWR2UjWKv7sqA==
Date: Tue, 26 Sep 2023 17:29:02 +0200
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 07/12] regulator: mt6358: Add supply names for MT6358
 regulators
Message-ID: <ZRL4vmNXFVWOFsjJ@finisterre.sirena.org.uk>
References: <20230919104357.3971512-1-wenst@chromium.org>
 <20230919104357.3971512-8-wenst@chromium.org>
 <ZRF6mbpswWoxdJsl@finisterre.sirena.org.uk>
 <CAGXv+5EeQupoWc880sCSOuGsdc24y6qPBaaypdV749oHi-XjSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bXPyTeiLA27bUpcX"
Content-Disposition: inline
In-Reply-To: <CAGXv+5EeQupoWc880sCSOuGsdc24y6qPBaaypdV749oHi-XjSA@mail.gmail.com>
X-Cookie: Save energy:  Drive a smaller shell.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_082906_260067_7632E9B6 
X-CRM114-Status: GOOD (  14.34  )
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


--bXPyTeiLA27bUpcX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 11:58:43AM +0800, Chen-Yu Tsai wrote:
> On Mon, Sep 25, 2023 at 8:18=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > This doesn't apply against current code, please check and resend (I was
> > using -rc3).

> Which parts were you planning to merge? I believe we're still blocked on
> the DT bindings. And I need to update the patches to fix a warning report=
ed
> by Rob's bot.

IIRC everything except the first and last patches.

--bXPyTeiLA27bUpcX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUS+L0ACgkQJNaLcl1U
h9BPSwf8CR4po77h7L5GG4DOj2NwAPFMRFpOYD+YH2EWI8ru2oAwCB5MgYZmBtKA
YdDRXNrB3uUshBzfRImfQ+oLUcvGZkXlvnuUXldXi/G0rDCyy3oAISwxhcswlzpP
m2hW6XazDuF8D3WVaYhL7hZpUukcoRv6vH3SKx5jQaZF0j+5rE9w9g0/YaOcRaTr
jj79JrzUASzSRk6TXVTNot+4eIKMQcHLZoIaB/MA2hJi8hICmfA/q0KHNNy9twe2
yLi2gCFpfFypJ6TM0MgRq+59HRTZ/W0+/hVQTIkAyZT5eeMhyw/7WrvhY+/Hbe5F
2UxlA8a9PLNpM0EDB+kItuXHoxj9Ag==
=yTkl
-----END PGP SIGNATURE-----

--bXPyTeiLA27bUpcX--

