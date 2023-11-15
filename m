Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D486C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 20:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bbzb1vTCJhBLDKVrgOv4pZV0dgnqbfTs4W3PaSvXEEk=; b=jgSkTjdJd3Y6kOXZ8SSXPwwiIn
	iRtbcmaJ9G9q27kL6JKvMf7b60gEGEWWBwndYKdidQe+PYCSjcZohe4VNEAqw/osw9LCTKpFd5NgV
	dtAptemUwYjdYfeF7n59IYqX6XeY3BPLLTNOdmCgBYPqy8t+r2vrPY7osDP9DzUjAQ5QA/GQLZZIe
	FqdNCwJdTo942ShY9SG60iiWuUfILIEsIq0SATpso+DwLGnQO8IfP9nriYC+czMRxd++IyPWW/PCA
	nTHk7NQzNzh9JAkC/i3PhagrWqOv2mqauQGHBoJybcqhZbw5BrLV1bFV5gx4LEaMB9CbBk+mTe+cZ
	7WcpHHfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3MIX-001edc-0Y;
	Wed, 15 Nov 2023 20:15:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3MIT-001ed4-1X;
	Wed, 15 Nov 2023 20:15:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 12615B810E2;
	Wed, 15 Nov 2023 20:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D298DC433C8;
	Wed, 15 Nov 2023 20:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700079329;
	bh=Bbzb1vTCJhBLDKVrgOv4pZV0dgnqbfTs4W3PaSvXEEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlHYt8IA/CyoMsKQz709eLjfBDgNDjLBYqa4M2nCYi2pBRr23ymewLyf+92LOvY/P
	 glhNCLfzB2rI/TCOapp3rqz4t6LHQ8YDpRGZeYYLNNNJ6oQJS1Qik33+dyyjpiEyFo
	 84Uv+5BI2NCJHkz0IK5T0w2v5cncxXZ8ouNPO0gYO5Ktcp7VmR1tHka4dlOlMIgOv5
	 vDFNDTJPmIg3CbqngmzfGFjkFHwZ+Jre9z0LrkE1u0SmngwEwc9vWHCteCfG1DT/Ma
	 +Hh8POFY+Lv826SV28cGV3iBvTSfpmkV/tC6KzO8D9YdRqCHvmYlkhbX3DkvRvNTsO
	 BC9m+9jP4/rMw==
Date: Wed, 15 Nov 2023 20:15:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Bret Joseph <bretjoseph@gmail.com>
Cc: wenst@chromium.org, angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
	zhiyong.tao@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/3] regulator: mt6358: Add output voltage fine tuning
 to variable LDOs
Message-ID: <638afac6-0d2f-4bb1-8101-b58fdc03e303@sirena.org.uk>
References: <CAKpemQKo2gigO44amj=eFUXgUnUeSmiOoTbS8GdXMx3O07N1vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hjQL6OBH+N1k/edv"
Content-Disposition: inline
In-Reply-To: <CAKpemQKo2gigO44amj=eFUXgUnUeSmiOoTbS8GdXMx3O07N1vg@mail.gmail.com>
X-Cookie: For internal use only.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_121537_670423_173E8A33 
X-CRM114-Status: UNSURE (   9.94  )
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


--hjQL6OBH+N1k/edv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 15, 2023 at 06:52:12PM +0200, Bret Joseph wrote:
> *In mt6358-regulator.c*

I only have patch 3/3 from this series, what's going on with
dependencies and so on?

--hjQL6OBH+N1k/edv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVVJtsACgkQJNaLcl1U
h9BjjAf/Yl71ZXLLJjNgAs7f5DuGYY1nXuxU+QJ/PpLeeuQD7kNmuzPXZBufNtyz
82dlF9dB/ifJmr3WIFlYfX1aHFoWv4rSytB8mo9U1bWJv40njuko1i5LRQe+8QtF
h/H2Mi9xtE7fPdqKX21oRF7hOnCfwNBoNgQ2yrdtBs5TNMaGEbpZXxcIEj5dB3X7
npz0iglU8L8y6M+B2kPm5ieYASraIFrynjKQeedaVCZi3Rj5nH4V5AdSIXiw85P/
6yFDGKma1N45NJ6zThrodEvsUSrfvOyBPPozdLkqhB1SSHEFKzVHZgXweJdi2YQL
0CfOFVCvjuNRM1zyVu6lhBji9jfjUg==
=XWLB
-----END PGP SIGNATURE-----

--hjQL6OBH+N1k/edv--

