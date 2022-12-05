Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A13C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 09:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0HmqT2L+hRrALpz9hs5ICFmu3LiSYWQP93q6zIDpO8=; b=UzmZch9YWg0i4lFrn1s+T/gvyy
	KcPu+puyG4Zfvu1e4dM7dxLZtlMlOQryBW41cn/AMvz+apCOBNS9KUKOUHg/g/6CWanjFRkUZvZ8f
	HhoyPVk3pDSVOgMzGWoRRSuArQtK+umAekm4B26ikE5ZKvbHoU90Nx58KlzK/OJ45+xr7MrTuQMrv
	9U5F+FdJOsRujliWZDujEnY1aiekUPx/bahMZNVErFLw+UkCUFATCQhovKIxtUe7QoUl+b5bsDpRv
	Z9Tcq7NoKObpYDO/lFrK4BduAjzWG5xKr2QFofj7gUznSrMRzJCSl7dQpLvWCaC5ZirMi/bbiqkQY
	mV2NB6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27Ob-00Gmgo-8o; Mon, 05 Dec 2022 09:04:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27OY-00Gmeg-70
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 09:04:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A3C1EB80D9A;
	Mon,  5 Dec 2022 09:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF379C433D7;
	Mon,  5 Dec 2022 09:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670231051;
	bh=bENrYC1DUTi7/2KslKN/oLUt/KX6fo/YMhSWxvmhlaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZL43+Lq34QOg/cUthOBkNfdFvVxoqsstjEkm5gMcUEF03/Nrqx0mHux/j/9fxEMuZ
	 Huzet9AsWE4xdhPoj+UguELC+L6mprvVsSOLB1dIsz0OYAhgmBu2conyuUOWS9oDWG
	 fhNscjeuOmsHaTYTF3ofeN8mGq8r9HQjxfRE2Q3fWjjiwb0pcJXMTfzxFfOe0gBpiQ
	 9cIzoinnhF38qU1kqqk+xjZKPg8KkpBZ6u1C7DIWPlmIt3FliJ3SWYyylXh1gfDqwt
	 0WG+JRXi4kYYyka2D+fMvWPOivJqn+VdV09rJJJFPPk4/IiT1rn+p3onfLCRQcWTNk
	 k+gbEuaJkqc2g==
Date: Mon, 5 Dec 2022 10:04:07 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: fix possible deadlock
 if mtk_wed_wo_init fails
Message-ID: <Y420B4/IpwFHJAck@lore-desk>
References: <a87f05e60ea1a94b571c9c87b69cc5b0e94943f2.1669999089.git.lorenzo@kernel.org>
 <Y4ybbkn+nXkGsqWe@unreal>
 <Y4y4If8XXu+wErIj@lore-desk>
 <Y42d2us5Pv1UqhEj@unreal>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b7kiYn5Wg7Rk9JEy"
Content-Disposition: inline
In-Reply-To: <Y42d2us5Pv1UqhEj@unreal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_010414_609232_753FA668 
X-CRM114-Status: GOOD (  28.28  )
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


--b7kiYn5Wg7Rk9JEy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 05, Leon Romanovsky wrote:
> On Sun, Dec 04, 2022 at 04:09:21PM +0100, Lorenzo Bianconi wrote:
> > > On Fri, Dec 02, 2022 at 06:36:33PM +0100, Lorenzo Bianconi wrote:
> > > > Introduce __mtk_wed_detach() in order to avoid a possible deadlock =
in
> > > > mtk_wed_attach routine if mtk_wed_wo_init fails.
> > > >=20
> > > > Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo =
support")
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > >  drivers/net/ethernet/mediatek/mtk_wed.c     | 24 ++++++++++++++---=
----
> > > >  drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 10 ++++++---
> > > >  drivers/net/ethernet/mediatek/mtk_wed_wo.c  |  3 +++
> > > >  3 files changed, 26 insertions(+), 11 deletions(-)
> > >=20
> > > <...>
> > >=20
> > > > diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/=
net/ethernet/mediatek/mtk_wed_mcu.c
> > > > index f9539e6233c9..b084009a32f9 100644
> > > > --- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> > > > +++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> > > > @@ -176,6 +176,9 @@ int mtk_wed_mcu_send_msg(struct mtk_wed_wo *wo,=
 int id, int cmd,
> > > >  	u16 seq;
> > > >  	int ret;
> > > > =20
> > > > +	if (!wo)
> > > > +		return -ENODEV;
> > >=20
> > > <...>
> > >=20
> > > >  static void
> > > >  mtk_wed_wo_hw_deinit(struct mtk_wed_wo *wo)
> > > >  {
> > > > +	if (!wo)
> > > > +		return;
> > >=20
> > > How are these changes related to the written in deadlock?
> > > How is it possible to get internal mtk functions without valid wo?
> >=20
> > Hi Leon,
> >=20
> > if mtk_wed_rro_alloc() fails in mtk_wed_attach(), we will end up running
> > __mtk_wed_detach() when wo struct is not allocated yet (wo is allocated=
 in
> > mtk_wed_wo_init()).
>=20
> IMHO, it is a culprit, proper error unwind means that you won't call to
> uninit functions for something that is not initialized yet. It is better
> to fix it instead of adding "if (!wo) ..." checks.

So, iiuc, you would prefer to do something like:

__mtk_wed_detach()
{
	...
	if (mtk_wed_get_rx_capa(dev) && wo) {
		mtk_wed_wo_reset(dev);
		mtk_wed_free_rx_rings(dev);
		mtk_wed_wo_deinit(hw);
	}
	...
=09
Right? I am fine both ways :)

>=20
> > Moreover __mtk_wed_detach() can run mtk_wed_wo_reset() and mtk_wed_wo_d=
einit()
>=20
> This is another side of same coin. If you can run them in parallel, you
> need locking protection and ability to cancel work, so nothing is going
> to be executed once cleanup succeeded.

Sorry, I did not get what you mean here with 'in parallel'. __mtk_wed_detac=
h()
always run with hw_lock mutex help in both mtk_wed_attach() or
mtk_wed_detach().

Regards,
Lorenzo

>=20
> These were my 2 cents, totally IMHO.
>=20
> Thanks

--b7kiYn5Wg7Rk9JEy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY420BwAKCRA6cBh0uS2t
rP7CAQCPV9L7X9gyMO52Hg3Vpt1Z75bnZXcBgH59ibA6g58pYAD/XNFOw9soq3Jx
MzkDWh5S2ZvFTFPXP7n4sxpJ+HAbMwE=
=n8lE
-----END PGP SIGNATURE-----

--b7kiYn5Wg7Rk9JEy--

