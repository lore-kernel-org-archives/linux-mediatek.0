Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D04C52D73
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbD18wpdDV3KchTLv7sj/3wb4UnZsJ7riubip8+IJwk=; b=YQgaKCEM9ExCvRj7gNILKuw8uX
	+OlbUZs8POaptEJ4YB3uPAQp8ri1iA1mb0YQjsdMiN7+IcWAuXXo7M89TuwkfG/MdOpC4OA4yEyxs
	G8MKeLlWJazYGdFujCMBiycEHDC/gCUkRUd5tlPQG0Xvs2Kg3WhSGHcYVJKi/3uLpsL4Ij45+A3U2
	W7fauCey7bF+nMfZ9GONUsc17EwYVLALYlHsqRBTzATBJKGeHglhjQwpyZaHnQ+obR0qTi2AWpLpt
	nWIWTWvKgs/m21bF3MVb0dlUSxEiEO0YUl0m7RiTl2oeFTNjuvVyrNhPAqL++joBfsTLoyHJX1iR0
	NfZWqXNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbkPp-00000005of4-3I6f;
	Wed, 07 Aug 2024 17:25:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbkOn-00000005oU3-1dY9;
	Wed, 07 Aug 2024 17:24:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1DA49CE0D85;
	Wed,  7 Aug 2024 17:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88FDAC32781;
	Wed,  7 Aug 2024 17:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723051470;
	bh=hbD18wpdDV3KchTLv7sj/3wb4UnZsJ7riubip8+IJwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nw4pgZTefnO7avtCPMVQstyX97iC462m7FD5w1dXh1fkQ/9mPKlLNNubZx+ZfUJQm
	 qOo5lAf28VGGdcDSymjMKCjtZ6neqLnoUc7K5WqomruIBbvguNyDJFerncqQMljwoJ
	 WjFthV3FTjv7bpxyp6maMFk2m05chP1pj7KfdLA4bcjzbdSyDbpS/oB4KuGuzhwLaI
	 I7AdlivDTr9CYDb3T3kyak8ECjTX17QqCJLAsFsqJ3485alabUTCAuDPnUCMUrMnZA
	 atW0HBtQnXcf6YP5McBSV13XHPqQeYv5og5UXvj4mjujnGK/6HbUBOnsw40FEeE/2J
	 yixW1fYez22+g==
Date: Wed, 7 Aug 2024 18:24:25 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] dt-bindings: Convert and move Mediatek clock syscons
Message-ID: <20240807-affair-dad-33a8762606c6@spud>
References: <20240807-dt-mediatek-clk-v1-0-e8d568abfd48@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="REeeJpUvoCaayRRY"
Content-Disposition: inline
In-Reply-To: <20240807-dt-mediatek-clk-v1-0-e8d568abfd48@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_102433_625714_5E706051 
X-CRM114-Status: GOOD (  10.58  )
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


--REeeJpUvoCaayRRY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2024 at 10:58:52AM -0600, Rob Herring (Arm) wrote:
> This series converts all the Mediatek syscon bindings which are clock=20
> controllers to DT schema format moving them to 'clock' directory. The=20
> existing schemas in arm/mediatek/ which are clock and reset controllers=
=20
> are also moved to 'clock' directory.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--REeeJpUvoCaayRRY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrOtyQAKCRB4tDGHoIJi
0gT7AP9dwMq7I7wZCotZ1n+Gjx12a1KtqSo4cnqfp4j75rBYDQEA/xBDTFpSj9qX
KmtHZQWDrYgsoR4KuFTOZ+ZG29l9awc=
=Jukv
-----END PGP SIGNATURE-----

--REeeJpUvoCaayRRY--

