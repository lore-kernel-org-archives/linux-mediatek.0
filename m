Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774C5C61D97
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvG89tmJQWrMitFHwv6sKwx7IMQWxvLEWaFv0BsxiVc=; b=u184C0VZAfkaXC8nE1325i1MEY
	niEYl9+JcBRcb4ungF4v8Lg7cMLdjlsbM9xaUvl947A1CXjVIvtJzSpa21cmOhGLwt/8dE8AY68EC
	B+nmMUaOgxC6571Tp8QewRpvl6X3J1hVcg8M4jLs3uZPtDbInaLLQyNCSEA5N2SOCACRbmfTcu2An
	eYxktIRN4ljfc6bBtSF2wEFSFxK/JPrORLioyWAGzngdTcz6rN5O97FDFvH+QOcOsbbe0aVp8BnPf
	i258g4XqE644AYfUkvbYG6xy5ySye4V/HQM4umk8BoPnuUKjTxbyXQBJdV7hgH5w9uSZxHW1tpLaA
	zaEsDwaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DKh-005OK5-0y;
	Thu, 23 Nov 2023 17:17:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DKe-005OJA-05;
	Thu, 23 Nov 2023 17:17:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A3CF62338;
	Thu, 23 Nov 2023 17:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B0FC433CC;
	Thu, 23 Nov 2023 17:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700759859;
	bh=ts+zqQc2FfD6+up8RHX6pODysbXRP+HNaBy6BBRqtZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hBuJmB01jH44PO6tf54BIK+xjnjyj3ttz7jh18Fw5eSzvA+g3tsgaP9iBWoIwKoc2
	 iLBaPkyFpsGYABM9U4JyhfTWNIfzFd+l5Bij1mw/o8fIgpfEdas8TCWDBvsXx6YvER
	 dL6R/W6u6Uc7ezFvnlfXhw8QGw9wsn54YvJMhzJKUIuTd9vlx0zzpV2Hp94mAL5GRL
	 okq/jNr6mV/osPxj1VBv88LY2V8yOXXdzR8PZZ6GyvHgjdEiG/tB6TD7PJVFb/0BoS
	 k4YELSUx9SewzfmMwizuz0fa8zdJzfCeuwwB7V0eL5ETqRQw3BbUETTBM+CptC/ShN
	 Ap1rDH3Z3tjgQ==
Date: Thu, 23 Nov 2023 17:17:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pwm: remove Xinlei's mail
Message-ID: <20231123-swell-outlast-d09bee7f85fe@spud>
References: <20231123134716.2033769-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9vUpuWVFk7p9BYFj"
Content-Disposition: inline
In-Reply-To: <20231123134716.2033769-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_091740_107628_405A4C97 
X-CRM114-Status: UNSURE (   9.51  )
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


--9vUpuWVFk7p9BYFj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 02:47:16PM +0100, Michael Walle wrote:
> Xinlei Lee's mail is bouncing:
>=20
> <xinlei.lee@mediatek.com>: host mailgw02.mediatek.com[216.200.240.185] sa=
id:
>     550 Relaying mail to xinlei.lee@mediatek.com is not allowed (in reply=
 to
>     RCPT TO command)
>=20
> Remove it.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--9vUpuWVFk7p9BYFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV+JLgAKCRB4tDGHoIJi
0t5zAPoCpbE32A6RWoUyYWg7kdcQQ4hIkcinmEa+cuTb40dvFwD/RlVSJ1Dt2mC/
1TVGlA4sr492Jn6Wm/7BbXm4QYIHhAM=
=s9a9
-----END PGP SIGNATURE-----

--9vUpuWVFk7p9BYFj--

