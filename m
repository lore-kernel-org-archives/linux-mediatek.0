Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B475C3A5A7
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 23:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5WCXO7KvCDAoh6UWurs+Lm5+kuicyHZGBvti2oBz7Y=; b=kZyaa+emRU52aZ8xF6Qy+t98lF
	0gzM+fmpAreF3/4MNZAmM3RDzqk7QtFXvxcuUEMQm+IJcy93Q4tTyHQEh3BNdMPEETpBqc6afG4t5
	QlUax8gldGXPe9YVzovRVwu05+joMAJCLRQxGzJtZgdLYU/njUo3jz2VYMC/hJ87Ws+1ysEOG3GIs
	m7NLYrEq+gm/oP24QSWmMfc/gMqeyOrrS8zsGVV3hTpc2gUL7M2t8oyIeEVVkkGHHUn+GMmsB48nW
	jz+bRSgJk6IeTXj0UvCTGhxsv66W+ch/P7LSnCINSd6wSwsYQkUEfTuM90SyBAKUspAswjrI9JcvW
	QpK0g3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2hjq-005joJ-CR; Tue, 06 Dec 2022 23:52:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2hjn-005jhG-Fm
	for linux-mediatek@lists.infradead.org; Tue, 06 Dec 2022 23:52:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1B0EDB81BA4;
	Tue,  6 Dec 2022 23:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C76C4347C;
	Tue,  6 Dec 2022 23:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670370751;
	bh=+7iMz5Ov6HdWwupKL/7aGdoMC453p3MLaqq2MFbXMj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b7WXZg9pzzpUsN/MDiCdexUPTZPokYl+CfyEW3iZBEzC/FkwfEPzxwgdJsV637+U9
	 oAxLkDwGZCLmEJXXXHxRTpr4niYmzT9cTaMieHg++m7tPS3IaXW++zaoldg9aDG1Pq
	 HNdZtKLiraobVdgzT5cGj1qc6Z211lx863Yy/TKwk3kE/uJNO7jugVcRUPe0qv6IkI
	 klWyEE/E+sg/bfeW/qNKus3x1H0qG873pwacTvNBfqYUcQIQbZqzxRux3226BRfydI
	 sOQfT2V99Ip4LEs0qH6RGr7Vn2TWXn0KzcI4YILUetnXPbiAUOeMjx+N1qLbSFSemq
	 A7AGRhw6/tdvA==
Date: Wed, 7 Dec 2022 00:52:28 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org, nbd@nbd.name,
	john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: fix possible deadlock
 if mtk_wed_wo_init fails
Message-ID: <Y4/VvGi2d0/0RrRW@lore-desk>
References: <a87f05e60ea1a94b571c9c87b69cc5b0e94943f2.1669999089.git.lorenzo@kernel.org>
 <Y4ybbkn+nXkGsqWe@unreal>
 <Y4y4If8XXu+wErIj@lore-desk>
 <Y42d2us5Pv1UqhEj@unreal>
 <Y420B4/IpwFHJAck@lore-desk>
 <20221205174441.30741550@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J2sYSVOsyacBCi4m"
Content-Disposition: inline
In-Reply-To: <20221205174441.30741550@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_155235_719926_D8279C9E 
X-CRM114-Status: GOOD (  17.67  )
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


--J2sYSVOsyacBCi4m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > > IMHO, it is a culprit, proper error unwind means that you won't call =
to
> > > uninit functions for something that is not initialized yet. It is bet=
ter
> > > to fix it instead of adding "if (!wo) ..." checks. =20
> >=20
> > So, iiuc, you would prefer to do something like:
> >=20
> > __mtk_wed_detach()
> > {
> > 	...
> > 	if (mtk_wed_get_rx_capa(dev) && wo) {
> > 		mtk_wed_wo_reset(dev);
> > 		mtk_wed_free_rx_rings(dev);
> > 		mtk_wed_wo_deinit(hw);
> > 	}
> > 	...
> > =09
> > Right? I am fine both ways :)
>=20
> FWIW, that does seem slightly better to me as well.
> Also - aren't you really fixing multiple issues here=20
> (even if on the same error path)? The locking,=20
> the null-checking and the change in mtk_wed_wo_reset()?

wo NULL pointer issue was not hit before for the deadlock one (so I fixed t=
hem
in the same patch).
Do you prefer to split them in two patches? (wo null pointer fix first).

I have posted v2 addressing Leon's comments but I need to post a v3 to add
missing WARN_ON.

Regards,
Lorenzo

--J2sYSVOsyacBCi4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY4/VvAAKCRA6cBh0uS2t
rB8qAQDGVtf8g6SfAZiVQyyevkk8CtXG67JxqFxrzOOVD09TgwD/aoq4Xf1f56Au
miGn63kIKOn4R4YaEKTgk/ZT0dMGtgA=
=g4Hl
-----END PGP SIGNATURE-----

--J2sYSVOsyacBCi4m--

