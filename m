Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E0EE7D24C
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 08:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsZCnHsDg/PSpS8ECalwOE6Ou4yPp9BLhohJjYFzlX8=; b=Xu3xru3npfECBNj7V6gu9hj2jG
	u3xTN8SwcsF/6H2E6JTOtITQMQ8qDKUedrfhMUVJnyPDO37YH+PXXID9PG3/K6fEgbPNNIO37ovbi
	Lckt8y9afMERJMvRmrq+fanw44kF8b0g18KVx/Mbh3X86iZMSb4ASDPmvKlHmF/KLz8bzxXfAUID7
	A7C06k10abq1T/VA7mFOMbIZpM/y9E596QbvRjRmJWcWUEg4QObbd0t3WbIHhNDxeifPZmiZoOTHv
	4NaG0mQ+F9dZMO7WGCaBwkiRTEZbrZ4aEnheb6b75KQACseJo23EvoNe35vkbjw18VWKmQCjIdBTK
	wQtBQMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql34K-00FqGB-0Y;
	Tue, 26 Sep 2023 08:05:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql34H-00FqEb-1c;
	Tue, 26 Sep 2023 08:05:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5CB08CE12BF;
	Tue, 26 Sep 2023 08:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DD8C433C8;
	Tue, 26 Sep 2023 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695715511;
	bh=rsZCnHsDg/PSpS8ECalwOE6Ou4yPp9BLhohJjYFzlX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXymruQtjxxIfXF7x2pLNjT+Cw/C2uEmv5orKU35FTj+vbbEC01C4qgIqpiCFMaok
	 XIgE1W1f3z+zgmBAfhPFRQowvDFFXWRleyOtXdP0wWwyWW1yWlt5TAatkH2ThtmyTn
	 qHmUH6SYZKwk8TCnhgTQrIIe49+QTYpNbpoLQJUAMRkwYwfBcxMFKYJFF41KRxeOUW
	 3QRUjFNfVRacwEsEZy2IyISRFNsCQkkrbKkRFS67o5p5dg9cleivUbnzfLBLNPpV+c
	 v4m9XB4Lsd3VvDUcRXg8ZgnH+6nOi2UeytogolSVbCUnpAMD6LU05cHPPccPKwGgl2
	 7+0H15BVTPURw==
Date: Tue, 26 Sep 2023 10:05:09 +0200
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND v3 0/3] regulator: mt6358: Remove bogus regulators
 and improvements
Message-ID: <ZRKQtcXB88qN4fET@finisterre.sirena.org.uk>
References: <20230926043450.2353320-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t4jJH+6O6abw2Jmm"
Content-Disposition: inline
In-Reply-To: <20230926043450.2353320-1-wenst@chromium.org>
X-Cookie: Save energy:  Drive a smaller shell.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_010517_761362_BCA9BB9F 
X-CRM114-Status: GOOD (  11.70  )
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


--t4jJH+6O6abw2Jmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 12:34:45PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> This seems to have fallen through the cracks, so I'm resending with tags
> collected and patches rebased onto next-20230925. The diffs remain the
> same.

AFAICT this is still in CI.

--t4jJH+6O6abw2Jmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUSkK8ACgkQJNaLcl1U
h9AvCwf+MXnwhG2vsZ8drBJHxcx3EXvkQQZMpfD4wlotjD4+QnKW1G84AnsJcWZT
GAOsxYzvyS4iPV9umnqB4bLTXz1YMmtgTFjb5vTcUiJBSElJs3487HUGMemlIceC
aAUa89XY47crMgR44d7MtVUlj7Hb9uHXXI6eZalrkYnkyj2KQt0J/dmI3HU4pZkY
ajZUFrWXnqw7dX7wWsXAXE+TIXkikpOWWu52w7842Y0KTzpzqHK2gvB+biUpxkLm
e6+EPGCLIa9G/yKtUfRX1IUCX5Fu3aIqNeR+simLYSnpsc14VYQg2UYy7APIjdYZ
1dAmQtTSnAICa/V82P/YejQvP1QjmQ==
=48cD
-----END PGP SIGNATURE-----

--t4jJH+6O6abw2Jmm--

