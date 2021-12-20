Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E2BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 12:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1dBWZnB5rA3O1jKxpjNFaAZgmastcTGANLYzTjXd4U=; b=myYUwgzg6oeDEiEI9ZoY6Eqydy
	4GHaYyhpthtV4qK7QbijZ2pIC8ZwjHq8EFHn6qS9RDDHjsjGrH/6wABc4DILdsXkiMCgtom2hgwbU
	MxUsOT4qyL2tmwi7kJu7llRldEjOcqixyPtxJhQ0uCp/Lg2vfTSdg3HHawoZ6xCiXH0fD5jSpGa4Y
	CC7DV1zYdOl4rTFQ+AkAXGPwozAezJfnj14dQ60SA1WDpsIMkkig9UIzfIqfCi/OHjKjm3zruETj1
	efY7QwHaK3myvHzZ3wS+JuQvEV5Nd/chsoAVqeHjgstGqPYljmoemMYkoUm4GgwsOeOMAv8pdNwoG
	SkqbFkJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzIEz-002Q0f-Py; Mon, 20 Dec 2021 12:58:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzIEm-002Pv6-8g; Mon, 20 Dec 2021 12:57:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 09A05CE1025;
 Mon, 20 Dec 2021 12:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611DEC36AE8;
 Mon, 20 Dec 2021 12:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640005072;
 bh=pewh3AlWMe5plAWePnKDnUBSLaArfevPs/u+jV6kgLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=at4Wqri4EnCyzlcrOTehdUmeiLD+KwpiApzE8sJfQ1VI9wXwUAklMHO1qzmGrS4Xo
 Mj3E/kUMMDsAgDE+6F2kMqhN+W40DXkgnl3Ov2zPgk6sOKOg8eWDMJg+ObgkmGy0JY
 R03KkJizMeAc/9H1bxYg2DHtT+NU8WAPcfrn2eF6i0xcA5KHX6tRcZC3Y6iUoDN1B8
 ThefWEEPo8Gf5DXC9z9HjNOJkMC+NFWliSR4fg8/v0kPZ2WC61Jgyh9dw1kXBx97fx
 j7JmBis8qv+8raaw7960yXNRq9CT8AQNLNoinc2ygaXZNAuMKj6NBZXWym7JJfh7ww
 2Vcy6uFV1PccQ==
Date: Mon, 20 Dec 2021 12:57:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: robh+dt@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com,
 bgolaszewski@baylibre.com, sean.wang@mediatek.com,
 bayi.cheng@mediatek.com, gch981213@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7 2/4] dt-bindings: spi: spi-mtk-nor: add new clock name
 'axi' for spi nor
Message-ID: <YcB9ygan0g/13Uz5@sirena.org.uk>
References: <20211220121825.6446-1-tinghan.shen@mediatek.com>
 <20211220121825.6446-3-tinghan.shen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20211220121825.6446-3-tinghan.shen@mediatek.com>
X-Cookie: Christ was born in 4 B.C.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_045756_513620_DF42EFFF 
X-CRM114-Status: GOOD (  10.36  )
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
Content-Type: multipart/mixed; boundary="===============7118093114689354222=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7118093114689354222==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TR47X5VnHL9xPYNY"
Content-Disposition: inline


--TR47X5VnHL9xPYNY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 20, 2021 at 08:18:23PM +0800, Tinghan Shen wrote:
> Some mtk spi nor has dedicated dma(s) inside. Add a new clock name, axi,
> for spi nor dma bus clock.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--TR47X5VnHL9xPYNY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHAfckACgkQJNaLcl1U
h9Da1Af+K65qLUvTTB2A+4DEfiym3syrCFx3PTWGF/cCBhyV8nzoEtsYcqGUOTFi
AoS7keXjHItQnMdIhdJKLoIWVBxaYPq6kYzmSRNauSh+nYZmPD+6MDCWW4Kytj6w
tjbpSyxR3kQVv0dcMyVd+s7tajVRhYalDTDR7BUNMhA8hAvlxm9zm0Og/hxY1sUl
hY8M2Tc+DftJEY2B298TfS53ZwaHhI+m8rs7xLBQOg1UpObq1tqWJ/Hkt4nMbMxg
bdB8oVMMHLWHFoNpWoHJymPXXgZ35SqQxLnmBnAhHjwBnzFtwSl0ErFCiQ+2HdoJ
VvRxydsrTOpysC3/AWesYz9Ej3ghUQ==
=hs52
-----END PGP SIGNATURE-----

--TR47X5VnHL9xPYNY--


--===============7118093114689354222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7118093114689354222==--

