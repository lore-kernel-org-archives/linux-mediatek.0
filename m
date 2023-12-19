Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3F9C46CA2
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Dec 2023 16:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMMTJJLnbJZI7eeaAsFFenoqHPm3dmFrvvkbbNL6DWg=; b=K8WWozmQzPffnif4XZws+rp7+M
	iB6WzgxALzkShspRFtsoMnJIH2CXc2avVIuJ87kDGzcQs87jOOmWsA6I7Cgxms0lQkz9EZb3dtdJf
	JCpy+/Y4nqw7bLrL7RhMXVND73htcuvSbNYA6/tK6FpYXyaNDBTQ0WqyC6Jd9D/8AE4TepFO4YkvW
	r6xnfN02JriCwFVU9z3MDkRKzIMJSqfC8zZusWMH6qiLGgZ/aPiQN3ximBqC0rwRQQtJF0iG774yR
	D3p2Y+OPu6RQzbHAky+zAyCBaQBKiExBEhnWO+ncmWR4S4I2cR/crU2JDRqM02t+xpMt3mRBBYFof
	YTtZVlPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFdMg-00Emd9-0V;
	Tue, 19 Dec 2023 16:54:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFdMc-00Embg-1f;
	Tue, 19 Dec 2023 16:54:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A2045CE1287;
	Tue, 19 Dec 2023 16:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30B4C433C8;
	Tue, 19 Dec 2023 16:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703004875;
	bh=hMMTJJLnbJZI7eeaAsFFenoqHPm3dmFrvvkbbNL6DWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l4xd/pGNfaBEvLKT+79F5NQd9tEbwzcz0ewGVgKRdSHdwGZ5O1PQSaej6Si+HFsqU
	 KKRvkWmKXWFs6ANpQ5FMt3sS4xIsYOgV6hU1Pg0QPIlz7X/bPvNwANTRLKIaOMG3Mz
	 yg4w6V+WUgtHV6w+2Cns1GaBroyBlZQPv23qJzZfXW/8VSUDs8GQCgtNYC3ddfOhkj
	 rlSOW8wKefUA1dLy/TVCd/XpelGq8fbRUT83KO2aWmj2rhZ9z6qdfIYSApaajecN2Y
	 vt2n5KpcQ/b6r1Et4TODcsSNtPQMxgtLRRXNzKOorq6MxZh8jBiqEVMVrcVE62px3d
	 5qaLCw6gOSt7g==
Date: Tue, 19 Dec 2023 16:54:29 +0000
From: Conor Dooley <conor@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
Subject: Re: [PATCH 0/3] Add mediatek,gce-events definition to
 mediatek,gce-mailbox bindings
Message-ID: <20231219-joyous-tarmac-aaf601623859@spud>
References: <20231218083604.7327-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i+MCw2cELYYzOA1i"
Content-Disposition: inline
In-Reply-To: <20231218083604.7327-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_085438_729029_3552C216 
X-CRM114-Status: GOOD (  16.04  )
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


--i+MCw2cELYYzOA1i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 04:36:01PM +0800, Jason-JH.Lin wrote:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
>=20
> Since mediatek,gce-events property is a HW event signal from GCE,
> it should be defined in mediatek,gce-mailbox.yaml.
>=20
> Change the description of mediatek,gce-events property existed in
> other bindings to reference mediatek,gce-mailbox.yaml.

I don't understand this series. I would understand it if the property
should be related to the mailbox provider and it is moved there from the
mailbox consumer, but this series does not do that. Instead the series
now documents this property for both consumers and providers.

Secondly it removes the typedef from the consumers, which makes no sense
if this is a valid property there.

Is your intention to document a property that should be common across
all consumers in a single place? If that is your goal, then something
like spi-peripheral-props.yaml is what you need here.

Confused,
Conor.

--i+MCw2cELYYzOA1i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYHKxQAKCRB4tDGHoIJi
0oiDAQCnS/e4ChdhTrIMgLXWQjCO4EzlP4LIjirHyIs1A+qTtAD/b4JZtsykUGPz
pLSkPCj6WxQKyOcdkpUxoanC2mDwUAE=
=MQP9
-----END PGP SIGNATURE-----

--i+MCw2cELYYzOA1i--

