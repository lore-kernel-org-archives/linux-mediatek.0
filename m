Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ADBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcvorbeO7IeezbFs7GQqmszANLwT9CFP0PPWa4yQhSY=; b=Co3tHC4EkQ4pOCqwNf7Eg7BfMa
	+X66ITGUaJZqsDhSAUdbB8mRMa8G841rlc+gcfYbzHytfK0chjD2DRqesT9hwnT0kQFM4avY/g0sd
	vfYL6eE0LYVxTOVHm5jLt5UvDyoo5OU/PPf1wPvmUGz3xim6fZeYZsrTjrmEmKzS4jRYbUyHc/wBQ
	0aAMJhoN7ACzItjuNfQfJF/ZiX4KbV/T/8DvVq4AOBOQ4aK1qBMUyMR0NNCOeQlEYza9zstptDidJ
	m4B5RWYgNPKuO8boC5bVsEY5FFPYBcFCUvq8r//B/6L0H05MusZi0OlrO6Q+lIqWUJWVD/coZePTx
	ErrngQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiCcj-0041Fy-Ea; Tue, 11 Oct 2022 10:36:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiCcX-0041Dv-V9; Tue, 11 Oct 2022 10:36:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 02BDFB8124F;
	Tue, 11 Oct 2022 10:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D46C433C1;
	Tue, 11 Oct 2022 10:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665484577;
	bh=AcvorbeO7IeezbFs7GQqmszANLwT9CFP0PPWa4yQhSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XScz9NDzzIDweBEQWQD6uEatQsLYoKNf0V2UUAz2Ok8Vh+bpNmD5bHaErD5CDQJ0z
	 +A8MwfoSbbgfkfVagPurQwVWzBaBDkBr1Po5IklakKfXI7qc2a3O4dRXyfWvke+eZz
	 vu+HXDH+Mltm90I8gKbr6jDua8NFm3FQxU5FKz9mgA1+CC3Jy/591280vpYuUb3aee
	 l3DAZh3esPC9S+P+5u+hZOnHi1Jf8mGdnImnKZFGH+1K/VCZDwsum4QOIOKICYbp+a
	 ChGvxntxgOXD0nEEABwPgkmunMwXZx70XwQYwJDjfvsxqnveR6VRg5XFUfcWRGfbzq
	 EK8gnpHkbj2zw==
Date: Tue, 11 Oct 2022 11:36:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: krzysztof.kozlowski@linaro.org, chen.zhong@mediatek.com,
	devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
	fparent@baylibre.com, krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org, lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com, robh+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: regulator: Add binding schema for
 mt6357 regulators
Message-ID: <Y0VHGh/GavvuZY2A@sirena.org.uk>
References: <cdb4e9f7-c7b3-3a1f-bf61-e42bdb021570@linaro.org>
 <972ba839-2fd3-2b45-3477-0c7e3d32f149@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qy+sdSDVmD8xz5a1"
Content-Disposition: inline
In-Reply-To: <972ba839-2fd3-2b45-3477-0c7e3d32f149@baylibre.com>
X-Cookie: I had pancake makeup for brunch!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_033622_189254_A9DD71C5 
X-CRM114-Status: GOOD (  12.60  )
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


--Qy+sdSDVmD8xz5a1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 11, 2022 at 11:30:58AM +0200, Alexandre Mergnat wrote:

> > Why enforcing particular name of the regulator?

> The regulator names are forced to match with the datasheet names.

> I think it's a good practice to increase visibility between HW & SW.

> Also, that keep consistency with other Mediatek PMIC schema.

No, this is bad practice which completely misses the point of what the
names are for and the other Mediatek drivers are broken.

--Qy+sdSDVmD8xz5a1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNFRxkACgkQJNaLcl1U
h9DNVAf+IAfeWJtE4IzcYAbU8KiaUeVALAXjWr2ios39H9Rp6rmG3HbUm0Hn4YQ7
z6mOZsA/dxM0GBcC+0E4GaJBb9nPdNcsm5he5cnG53JCzLZEli8b5hd+d4vrhtai
PSNcNlwd5gr4bBnISeOXqsmHy1VvwkGpJuo84sA4Rre//0tocfPmJX8i+tINms4k
MfSgehyBSxsGwFFwxo8sxFrR/mP1zsTe+XQKZ/pPaQHI/2/OfxSuUzn8qtCI3g1X
ySN2o41nmq+Jg7CWmAXQnQuTa5b3CBGW0bCRb6x728A/+VSHaNKp4fU4VcfalpeW
LDQ7MYIWTvgZK3ffGffopei5AOipng==
=QZoS
-----END PGP SIGNATURE-----

--Qy+sdSDVmD8xz5a1--

