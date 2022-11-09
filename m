Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B61C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 19:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ip/AnK0Rtg2qvGWV6UUeSnQwXbFGAjeugxOFKnCk5Z0=; b=QhFZub3MXAyl2EdpEjHPALYnV/
	6gCzcjI3qrIGBw+4QWYMd6dSK4K1M0QQxpi0qESL3wLKQD5es4emqBjGjrF0zyo+k/ns++ggS/O9/
	sBHW4vDM2na9PmOzvy14fUNllWL0SaxHLIBFjX8OHxRLA44LitaOCvoICPVPyAOtuIkGQ9+X+VzZ/
	iFeN9YKlO4E2ECIF+MdmwrT6T7c9QFvz+5LYHrWwjMbmOEPi/7gNUG6BpHTfGaaniEqnFeCiEq8Xu
	wP5tDNSQXjLLjZDNem/CCkP9VBWlKG9uD8ca4DYwiXEVBsENwDvcEtU9qlSknxZkKrUL737Wmahsd
	ZJ8RzXVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqhA-00GaZw-Aq; Wed, 09 Nov 2022 19:25:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqh7-00GaYn-NK
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 19:25:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 80FC0B81FA5;
	Wed,  9 Nov 2022 19:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDDFC433C1;
	Wed,  9 Nov 2022 19:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668021902;
	bh=ip/AnK0Rtg2qvGWV6UUeSnQwXbFGAjeugxOFKnCk5Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=keKC3WFCNxQkqhrTT6a1knlNZfqPkPiX0nyW/5LmXK5yO0utwreZZFqFCf5BQLbGM
	 Cm+5wCe1yLhLJn8/pPNZT8qYmx5dI7SY9/9gMi/8pVsSVdRBscnsDKpesUYGjtCxn5
	 DqkIxyAok8DkQB08WzTbQidFyMbkCGG72gJ/mG5uasmb5nJHrF44sW4+aQW+BllPGJ
	 US4AWToMUX0tno0GSMecMnogIAb0Jbp4VeF2K2B2rdgzD/oMSHqMFF83/c8rj7PCEK
	 2l49ihD4yOE8C6/FsHPZph6y1WHXdtwyxsEe+hhsh32YRi+apN6h9uw6PQ0o/W3a8z
	 KJoD5yMLFNfQQ==
Date: Wed, 9 Nov 2022 20:24:58 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, netdev@vger.kernel.org,
	nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com, ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com, devicetree@vger.kernel.org,
	robh+dt@kernel.org, daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com, kvalo@kernel.org
Subject: Re: [PATCH v4 net-next 0/8] introduce WED RX support to MT7986 SoC
Message-ID: <Y2v+igz0TJ8LSsFj@localhost.localdomain>
References: <cover.1667687249.git.lorenzo@kernel.org>
 <Y2vBTBUw47sshA+E@localhost.localdomain>
 <20221109110538.431355ba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LVhjj4TesPNRZPNK"
Content-Disposition: inline
In-Reply-To: <20221109110538.431355ba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_112505_924994_F22072F2 
X-CRM114-Status: GOOD (  15.80  )
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


--LVhjj4TesPNRZPNK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, 9 Nov 2022 16:03:40 +0100 Lorenzo Bianconi wrote:
> > I noticed today the series state is 'Awaiting Upstream'. I am wondering=
 if
> > this series is expected to go through a different tree, e.g. wireless o=
ne
> > (adding Kalle in cc). In this particular case the series changes only
> > the mtk ethernet driver and mt76 is built since we modify a common incl=
ude (but
> > there are no changes in mt76). My personal opinion is this series is su=
ited to
> > go through net-next tree but I would be fine even if it goes through Ka=
lle's
> > one. Any opinions?
>=20
> Works either way, we'll see what Kalle says.
> Let me bring it back to Under review in the meantime.

ack, thanks :)

>=20
> While I have you - no acks for the bindings yet? On previous versions?

not yet, I addressed Krzysztof's comments on v3 in v4 so I am waiting for a=
 new
review.

Regards,
Lorenzo

--LVhjj4TesPNRZPNK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY2v+hwAKCRA6cBh0uS2t
rIvsAP91ANH6T6Qn8/Kf4qbyrckYMH3nX8oIPJnxcbls+W09gAD/Sa3wgr0z46+j
pz/Fnk3FyMWn2ZAk025IeMxiRk4huwI=
=aKpZ
-----END PGP SIGNATURE-----

--LVhjj4TesPNRZPNK--

