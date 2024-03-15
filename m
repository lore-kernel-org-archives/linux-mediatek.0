Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C354C54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 14:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KgzvuLdd3AxeujNNFtwWLhmYlvMjhxtwsKL5EtDbO0=; b=MQHM4p6W1r1nHHu7RRtNZwiuQp
	m86pg0hbDeZ338xPVB87t6LpLmKR6AZkf1mvAtJPh2IowwiyymKMbimEHstAYzQjfITLIUY6LkKMp
	dVZp5XSu6Rpmtwdh0E27D6U8sUbY+nKozNRYsTg67jWKhX+VftpEjSFNzbT3X6i5SxqB4DSERes7h
	B1CsYoXwD4stHiJwrTNmHjVE29LjDqMBJq3S2Gmk2NvbyF0KD2bDOzSUDHAonCeR71brVLDyB+gBk
	pMNatXDZIiRIabmQqavC1+eVV0z5F0/F9qx0BoCG9sp13yk3Rwlfwsi8DCvy+pR67Trc0gNHvMFXi
	xmr3sMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl8or-00000000XWQ-2Qgd;
	Fri, 15 Mar 2024 14:46:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl8on-00000000XTi-2BKl;
	Fri, 15 Mar 2024 14:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 83D72CE20AD;
	Fri, 15 Mar 2024 14:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B01FC433C7;
	Fri, 15 Mar 2024 14:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710513947;
	bh=9KgzvuLdd3AxeujNNFtwWLhmYlvMjhxtwsKL5EtDbO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwAbuAOUF24KUYuVFfjHyByrH/MI0YWhdhtAls7EY2ent8cTFd6mmtDijkswIfRMO
	 Qukm4OE7NRQboayw/LC/wFRb0Yg2di9zf3pKXUufI8Z/H3DuOpZd3Kb4739V9nmbHt
	 dOV6Tt4UhS0U3JpipjBiBkVh2W1xkxr5Aorhh3pM75Zkz1VKGx+ZqVzQB42x+VXE8Q
	 LWkpjGGXsEsDT32fgg4DMJK6GU9oTdKjemKjmvR0q5dEc89PM886E1Sryujp+CTZIL
	 gRtxsDt3v+Qab1UlprormELzh3MCCbSXoF4bwiwaMndK+zqU5ZV/chZGztkLo3PKEk
	 8ccjds/8P48ng==
Date: Fri, 15 Mar 2024 14:45:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] spi: mt7621: allow GPIO chip select lines
Message-ID: <d562be73-ad76-4450-8bff-38ed5d144714@sirena.org.uk>
References: <20240315015708.13948-1-justin.swartz@risingedge.co.za>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OyRZntc5+wE1SuZv"
Content-Disposition: inline
In-Reply-To: <20240315015708.13948-1-justin.swartz@risingedge.co.za>
X-Cookie: A well-known friend is a treasure.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_074557_761053_42787FED 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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


--OyRZntc5+wE1SuZv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 15, 2024 at 03:57:07AM +0200, Justin Swartz wrote:

> Add the mt7621_spi_set_cs_gpio() function to control the
> logical state of a GPIO chip select line, agnostic of the
> electrical line state and activation polarity.

The core should handle GPIO chip selects for you?

--OyRZntc5+wE1SuZv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0XxYACgkQJNaLcl1U
h9C4hgf+P0Z2s4lUknxJY2qju158/5Yhp5TQKmCuE5LrsDTuzpONlYkMibA2coZq
F1UsonXCPisW6sJGBr2WIDEu4gcNvm3CJTnr04+xft7wYfS3jR0Yf0W1L4dKCQX2
O6dP3AQ9cBv4+mgtiCJqGlb81gxBynV2VtDNMiLG3gaXfUh11GnagVfRhGUrk1oS
eP9kFc0S9oecHnWmBk4Eov+HoKkv5mNouc/fJBAS4rqZCZPN5tYWC4BY8s8BzJ9U
Qi/8fxX4QjWXbp1ohhcuMT6w6eSd42ELyRTkPiJeZy3Kqnjgvpb1JtU4HMbhkbZr
P64TRRrsqBE5MgWO9N2uWEjHQEwO7Q==
=/LPx
-----END PGP SIGNATURE-----

--OyRZntc5+wE1SuZv--

