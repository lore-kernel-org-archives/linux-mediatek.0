Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2576C4708D
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 15:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xESMQ9GhiTPL5t/wbCxbMUGOGHQ61B4clZ40pfoAgwQ=; b=uPxi4B6vbRmk3zYiaw0Aa3Z27O
	EO+X6X24z/WUZFerWhmI42S/R+o9/Pt162j0/O40H1B0Xg/gMIAIzekkhSp4v8haftk2DZr3Ndxz8
	vwo0LWm5aLMGn8uzloMhuFfmmIXt0rF27c1qREY7nw8iTd9ijlVOHGuDs8pAwJs1OX1j9+4bGJAuw
	o/0jmUR1w/wntUpBNq80rDqovSyzbOXyh78U6hgMQkQw5tqIQuubkfbb8YKK+KnmD3tJ4gXeel49O
	io4QLCOczKSJoDdiAYaYkkD9LFWa49Px4YykH34fybv1NwcdCuzliOuJRwcZyCZGgjGHPkhOuCCWD
	j9auULKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5YE-00A3Gt-2t; Wed, 04 Jan 2023 15:19:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD4rF-009jfF-FO; Wed, 04 Jan 2023 14:35:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9311C61766;
	Wed,  4 Jan 2023 14:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EA2C433D2;
	Wed,  4 Jan 2023 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672842908;
	bh=xESMQ9GhiTPL5t/wbCxbMUGOGHQ61B4clZ40pfoAgwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AcpZl91uJbz/8Ncdf4E5AD/9Qz9BpX2xrHSIBNU4amxvju0v4+uFTiGxNiQPTINKI
	 9CnouSr3FiMo//vC2oekT6FjZsHbCe8/tZKBA3Vc8YmdY/DcBy/jaeNHJctpnYyrwB
	 oL6nSDOhdArqh59omZGhChTP122ZuFRKUVmeVM1QZwz76IAodCmpQ4kK6T2DGkII6+
	 c9R0SunbIPWUOXVP964dPp6Z+Q5v5puNTAbWHyHc3hBh4Ek0IE7CP9yz81/784E1me
	 kUB0oUqvzXeJPtX8E8gtAbDu8lw0kzyWIWABvSzoC4GwNM/aw6vuq8PKHG5CCHHTA5
	 3K1pxfHuIQN1w==
Date: Wed, 4 Jan 2023 14:35:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: mediatek: Enable irq before the spi registration
Message-ID: <Y7WOlkuLaLt1DdY+@sirena.org.uk>
References: <20221225-mtk-spi-fixes-v1-0-bb6c14c232f8@chromium.org>
 <167214860344.446872.17166503994226712534.b4-ty@kernel.org>
 <5db65fd1-575f-df19-0de3-b3e32e4bf1d1@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rYR1PrBg/o4bENGj"
Content-Disposition: inline
In-Reply-To: <5db65fd1-575f-df19-0de3-b3e32e4bf1d1@leemhuis.info>
X-Cookie: Stay away from hurricanes for a while.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_063509_619953_226E15E3 
X-CRM114-Status: GOOD (  15.59  )
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


--rYR1PrBg/o4bENGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 04, 2023 at 03:08:51PM +0100, Thorsten Leemhuis wrote:
> On 27.12.22 14:43, Mark Brown wrote:

> > the next merge window (or sooner if it is a bug fix), however if
> > problems are discovered then the patch may be dropped or reverted.

> Quick question: why did you queue this for the next merge window? This
> change *afaics* is fixing a reported regression (a kernel oops)
> introduced this cycle:
> https://lore.kernel.org/lkml/Y6dL2ZWgd1BD6kew@makrotopia.org/

> Or have I missed or confused something?

You've missed something, it's queued for 6.2.

--rYR1PrBg/o4bENGj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO1jpUACgkQJNaLcl1U
h9BVCAf+PnTmIJYMJ2GGcFDU67z4Mx4B/0ZOVIcbndNnQq1ZdtePeZ3c3ClWbt31
NEF8G7bieK2Y+cKbFiwQ6siK503B2aTDblSsFO44YlS6BWNSknYlzWjfuMtq7alw
hGub9wuwTQ8yABK1gf99t5ajJ4/l8CVcSwlVMVEdI9rqUZc3/xiv/691VMnsX3oI
xnzDHTxPcpRnZZjSUkaEejBgPRE6zGFdbQyxQMp11CTPNW95gHGl75exUMuJgfyF
MMr2QfQNEAr46OaK/zhbOsGEyQrCSZzwuH0f2dq2CbeAvIxfSf66H3fU1pfnZHzd
REZwHMaFfx5G5yeJm6yAu/62c600oQ==
=pEW3
-----END PGP SIGNATURE-----

--rYR1PrBg/o4bENGj--

