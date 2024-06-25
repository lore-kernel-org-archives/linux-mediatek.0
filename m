Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF74EC2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 12:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js9xSsaE4aQFJ26h7F2U2unbKdBKcKiFLwmz5BIAxfE=; b=YnrFhBWTmrTGpqavq0AbN28FS3
	g78bUvoerctkHRtViifTkJpbByZRyQJjRcg9UyvORR+XFw84TK595R2JatV64M1bQU78Ha7+CWwsm
	LpelCyUwfQg3ssQB3hvtOy+m8iliazyGURM7E7RLRx0ldx9CGL2QWCjrQQnMl2eZPlWQVHUaeTC0G
	TMVJnV+YBY2VoH1NGCkx3TMSgYYGN65DIx+I8Asl1M2BwB+3cVay0NLscjjtz2O4iEBCSEhJLfOTg
	twq8rL7pYsbn5skHgvwAPK96wL6Fif0eE6AXSkuTTatxoJB7HePqnhFGmFB5aenrR53Tno4eYAoeN
	TM4lVxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM5d3-00000002qnR-3cfF;
	Tue, 25 Jun 2024 12:50:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM5cx-00000002qmQ-0MAd;
	Tue, 25 Jun 2024 12:50:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D7430CE0174;
	Tue, 25 Jun 2024 12:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EB7C32786;
	Tue, 25 Jun 2024 12:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719319824;
	bh=s/7FiJi0GYLkjQ80S4lqlm3cUD3LaT7XZxvXN7svSLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QcXmLz0F9HMBbpD9AlMywFuHfaXoGktzYxKA5zWvJfhikRVK4r5RSpODDuwq8Jqqd
	 s0ZYKfQ/d5Zwz5QPhc+wSZ8NVnoe5f2dFSJcLx+wiqTGZ3N8hkqOwkQIUqqV9NaE41
	 z53ioDhHQrjZTxcpBoYmlNeR7b+lMGdngquXFLn0zbFenVtlot61kstgtroVyfQWHW
	 b9s/NBtENC7InhSWB1lroKiu6mdgvQ8bryusPh0Rxuex8nc0mPRf7Yp3AvdEE3MpC2
	 rAki5Y/LiVngw9G/PXuQn4Ut6tQXZhKzo1Nb8UWXq9c/jfF77xhKb1IWO1sR4o8eKa
	 pFQTO7Pg8ggfA==
Date: Tue, 25 Jun 2024 13:50:17 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, lgirdwood@gmail.com, keescook@chromium.org,
	gustavoars@kernel.org, henryc.chen@mediatek.com,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	wenst@chromium.org, amergnat@baylibre.com, djakov@kernel.org
Subject: Re: [PATCH v6 0/7] MediaTek DVFSRC Bus Bandwidth and Regulator knobs
Message-ID: <2e8a9cf2-2bc0-45d8-b6c1-e3a9441d5641@sirena.org.uk>
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
 <f7b4cd98-1acf-4f6b-a7e0-57419abadba1@collabora.com>
 <57cf8f9f-4320-4c55-a9f8-a4c1facabfe8@sirena.org.uk>
 <39ed7b8c-b19a-40de-9b30-a731ac83ad20@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ck+ggcwV/Ot1gS3W"
Content-Disposition: inline
In-Reply-To: <39ed7b8c-b19a-40de-9b30-a731ac83ad20@collabora.com>
X-Cookie: Results vary by individual.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_055027_338892_94A13E53 
X-CRM114-Status: GOOD (  15.84  )
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


--Ck+ggcwV/Ot1gS3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 25, 2024 at 01:58:57PM +0200, AngeloGioacchino Del Regno wrote:
> Il 25/06/24 12:25, Mark Brown ha scritto:
> > On Tue, Jun 25, 2024 at 10:32:30AM +0200, AngeloGioacchino Del Regno wrote:

> > > The main issue here is that the main soc/mediatek dvfsrc binding
> > > dt-bindings: soc: mediatek: Add DVFSRC bindings for MT8183 and MT8195
> > > does use the others, so I can't pick this one without the others being present
> > > or the validation obviously fails.

> > I can't tell what you want from me here.

> I'm asking you to pick the regulator patches :-)

>    dt-bindings: regulator: Add bindings for MediaTek DVFSRC Regulators
>    regulator: Remove mtk-dvfsrc-regulator.c
>    regulator: Add refactored mtk-dvfsrc-regulator driver

Is there no interdependency with the rest of the series?  There was in
some earlier version at least I think.  If I reviewed the patches it's
because I wasn't expecting to apply them.

--Ck+ggcwV/Ot1gS3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ6vQgACgkQJNaLcl1U
h9AbYgf/URHedtcxPh/nFTezG0aVe4h2eu4bJNpWaI0S7OfNW4LJT4EhtiuCuSPh
BdAb2NA7AisSvcgOgZrIjD3COYnanTj/6j3pDfiV/YC3lCJoz+mv1TptT2kQxujQ
nPJbzRAtsIl24RsI8sSC2B1MWsddf44E6RAfcYnlV8YDWQua9BxfLyCdEuG+gjmb
+y5YK9glKhbAzHsaUjMkzn+BjHE147scOlb7u00uD61WrN94O2Q83guy2+sybO0y
Km6bYffp60vo0ebFLyJCTIfYEqeUAEvWw4v13TAZU7uBlHgr231EptnRd2gXLMLg
+WFplgSdJIzqSEsoZostEfIqw0bfgA==
=t/8Q
-----END PGP SIGNATURE-----

--Ck+ggcwV/Ot1gS3W--

