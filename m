Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF317C4708E
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8tZrvK0J0P/JKRm6LB0DBzv4jgBVUZuv4G7hsPps7g=; b=2Dlzeakko7WyezWwLHQRie03Gi
	n8GskGiBb0jlMfOXdHoFINCdoJqKfZ3ewoGX8pwa6QXbemDmAkAAmd0xpvbagdM9ad7ILjde8g/tc
	gNLySyI2Gm/VhDb8ySREeErZkQzL6GdCjtfBI8yD6HxzCw51dv0IMGqMUsrMKizOHGL8bNc39e6Vy
	XnI3aQ77axPf4zhcn+13ju3PdvXq6T/ODb1knZfAWEK07Wa70pDBRLSHe/yC/+RL6BBlh7kFxlj1g
	DsITpeTkzyg3tb+d8MV4eRFFwFUdVt+LakQ4kwuSdIZ3AP2rIMy7S5h3/0FWrxbgshir2KM1NIfKt
	I21JHHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qGN-00Fexu-8b; Wed, 07 Dec 2022 08:58:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qGL-00Fesk-ES
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 08:58:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F0018B81B51;
	Wed,  7 Dec 2022 08:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41997C433D6;
	Wed,  7 Dec 2022 08:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670403518;
	bh=o8tZrvK0J0P/JKRm6LB0DBzv4jgBVUZuv4G7hsPps7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmPO8b0GFlx+Ukr+O1qynnKPOTDaDOamPLCe+itUZUIASltdSR7cLWZ/iP1qz1zpx
	 NRFPlfgcdT30diYfrlwQcbQLoIoI8sWr2wvNg+8yoiTkM7qvUNLJXaOs2fgkQ9+/5b
	 igzRpDj9elRu3iFH1n5Fxdn9tykincIpoI00KPe/YIonjGqMeeYtTF/YoX9mlQmCJO
	 wftEXcafmPCTe6oQT5klkj4KTPvLn1r6NJrhp+R7n+Ug90008zQG2wvEiBSSyKTd1I
	 DLIBZCAlBzq2hYs5CBaXq70iISErfkF2sYmf5NA1Q7eWNog6mZNDJRMRGV7hl6cU29
	 0sZnsC7WxSn2A==
Date: Wed, 7 Dec 2022 09:58:34 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org, nbd@nbd.name,
	john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: fix possible deadlock
 if mtk_wed_wo_init fails
Message-ID: <Y5BVunJ8Ti8xJ2IC@lore-desk>
References: <a87f05e60ea1a94b571c9c87b69cc5b0e94943f2.1669999089.git.lorenzo@kernel.org>
 <Y4ybbkn+nXkGsqWe@unreal>
 <Y4y4If8XXu+wErIj@lore-desk>
 <Y42d2us5Pv1UqhEj@unreal>
 <Y420B4/IpwFHJAck@lore-desk>
 <20221205174441.30741550@kernel.org>
 <Y4/VvGi2d0/0RrRW@lore-desk>
 <20221206172426.7e7cf3bf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xGqROEpnmGaA3qcp"
Content-Disposition: inline
In-Reply-To: <20221206172426.7e7cf3bf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_005845_677035_EA67F706 
X-CRM114-Status: GOOD (  17.39  )
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


--xGqROEpnmGaA3qcp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, 7 Dec 2022 00:52:28 +0100 Lorenzo Bianconi wrote:
> > > FWIW, that does seem slightly better to me as well.
> > > Also - aren't you really fixing multiple issues here=20
> > > (even if on the same error path)? The locking,=20
> > > the null-checking and the change in mtk_wed_wo_reset()? =20
> >=20
> > wo NULL pointer issue was not hit before for the deadlock one (so I fix=
ed them
> > in the same patch).
> > Do you prefer to split them in two patches? (wo null pointer fix first).
>=20
> Yes, I think they are different issues even if once "covers" the other.
> I think it'd make the review / judgment easier.

ok, I will post v3 splitting them.

Regards,
Lorenzo

>=20
> > I have posted v2 addressing Leon's comments but I need to post a v3 to =
add
> > missing WARN_ON.
>=20

--xGqROEpnmGaA3qcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY5BVugAKCRA6cBh0uS2t
rLa0AQDr9p6ivLFrnHACTcfdjevTsoR9cGUxKSDcoH6EbgAjPQD7BRctA4SvOLuz
iZze5NPep21OFwCC4dfwBpT8egj+9wI=
=J7uz
-----END PGP SIGNATURE-----

--xGqROEpnmGaA3qcp--

