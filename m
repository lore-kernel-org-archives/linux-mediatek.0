Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D151FC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 19:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uX18a8b8mPXxN5TnmlJgYzF03jqyQEV0omJHBCIyXE=; b=Ea9tGkvhFeBlr2cFE6ZMKNG2K+
	g5IiUnAGu46RTOH2sJjJc2R17ygvHTBg/e0VryOoMgEVG0Hl4yJCjezbfCFED/ASVS41u9KeQSToV
	ekN05ZMX9S6E+xS/sKy/+Cppo/x9BJmCPn09MJBG3lvUYXUZq7EbFnv0aGc07QyQpxnzcnu1JWlMZ
	IGp3dpKQdPpFvSMjQxHzAPevLwIdCQWsTO5g1HrvOxZtiTQB/N/vBxdIJd5AsvoNrvkOPvMG1g6Q1
	mA//BYGcKgEUBCwJB76ejhvqGzXCzN6LJT6Y2IxXSfgrAxk8TjxHEr17YtTpGdWBC+YYtGEO1qI76
	AgHIthoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqip-00Gayo-OC; Wed, 09 Nov 2022 19:26:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqim-00GayB-R0
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 19:26:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8A774B81FFE;
	Wed,  9 Nov 2022 19:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64CBC433D6;
	Wed,  9 Nov 2022 19:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668022006;
	bh=1uX18a8b8mPXxN5TnmlJgYzF03jqyQEV0omJHBCIyXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OgSLDwZ9WUIAjy8gtH8PDiAZjB2YWerWP2uX+FTQKuzwFcdq1Dts1HsZrLcw+L7Oc
	 X3WmX++VNKxhY8a3BGRd/JY2J57Gj/65zrX4OomoBIhrnSitCsu0c4eMe9SPZCxatX
	 NjW9nLpSu8AO6MiRjW2/T3yhJmQgbA+Qua0yJ3qbIdSfj6xeWzoRxSV1pYTv5Six6m
	 9rknHUiYc4SQm1K9IC1gsTtrgByXrLfUdVHBeR7gQDo/KfFs6L1pcC6ffWJoIcacNL
	 BSHIpMDeneB+3KliAllGpIU/59P0SEprpMGhluttyShFqmBdMpuf4wNKyKE/wL5EWu
	 zyfVCMoyTrCrg==
Date: Wed, 9 Nov 2022 20:26:42 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
	netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	linux-mediatek@lists.infradead.org, Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com, ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com, devicetree@vger.kernel.org,
	robh+dt@kernel.org, daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com, kvalo@kernel.org
Subject: Re: [PATCH v4 net-next 0/8] introduce WED RX support to MT7986 SoC
Message-ID: <Y2v+8nhgWq6IfyFS@localhost.localdomain>
References: <cover.1667687249.git.lorenzo@kernel.org>
 <Y2vBTBUw47sshA+E@localhost.localdomain>
 <20221109110538.431355ba@kernel.org>
 <f1a5c144-1d16-a65e-f629-c9d13946377a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S5LjoUW9NbQdQQuu"
Content-Disposition: inline
In-Reply-To: <f1a5c144-1d16-a65e-f629-c9d13946377a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_112649_056919_CF7721A4 
X-CRM114-Status: GOOD (  18.78  )
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


--S5LjoUW9NbQdQQuu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 09, Matthias Brugger wrote:
>=20
>=20
> On 09/11/2022 20:05, Jakub Kicinski wrote:
> > On Wed, 9 Nov 2022 16:03:40 +0100 Lorenzo Bianconi wrote:
> > > I noticed today the series state is 'Awaiting Upstream'. I am wonderi=
ng if
> > > this series is expected to go through a different tree, e.g. wireless=
 one
> > > (adding Kalle in cc). In this particular case the series changes only
> > > the mtk ethernet driver and mt76 is built since we modify a common in=
clude (but
> > > there are no changes in mt76). My personal opinion is this series is =
suited to
> > > go through net-next tree but I would be fine even if it goes through =
Kalle's
> > > one. Any opinions?
> >=20
> > Works either way, we'll see what Kalle says.
> > Let me bring it back to Under review in the meantime.
> >=20
> > While I have you - no acks for the bindings yet? On previous versions?
>=20
> Please beware that the first patch should go through my tree. Let me know
> when things got merged and I'll take it.

ack thx, will do.

Regards,
Lorenzo

>=20
> Regards,
> Matthias

--S5LjoUW9NbQdQQuu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY2v+7wAKCRA6cBh0uS2t
rCsyAP9272Hnz5+yaK/90Ld+WMW0zZhHhJNYYB7TKa71vtQtIAEAl5CSBEJjAYbc
lTOlqm5D7q5UUL4WATo1dBQocBJ+2QI=
=ONj/
-----END PGP SIGNATURE-----

--S5LjoUW9NbQdQQuu--

