Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F65C47089
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Dec 2022 15:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvImuTT+3EFQBlmNlguj5Rh8dpAJkKm/7btk/QLI0Ws=; b=xqArWZ8TpLRWQ3H0/zzXhcvdrj
	DOlzpmmDbzQjXROzZP6eMjwaFwf1qUmRF9StuTmfajmmS0NsbCaivUu89FOodtC9CHhnM2ZclXwfG
	LuU8iua+BtWqVUMrKLReTUmhQAJS92KlFzXIPZpYn4Ogx49Qo80keGfFaCKUmIIJk/gggkN9xAFuw
	S2fhVBGme3qZRxJ8N7L7XoWOj2MWd8O+0odaG5rV5WIMptljbBVmXlL/cc/BDC/YBYMdBbJENhJks
	FLqaM9lKaycJ1m96KgZ7PnJ/HM2KtOc0MSt5josqH1PrrWtlB0A3deHWOYA1PfVJ5gMvm7S2Caces
	zb2b9BQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1qdE-0091So-3w; Sun, 04 Dec 2022 15:10:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1qcW-0090uv-VX
	for linux-mediatek@lists.infradead.org; Sun, 04 Dec 2022 15:09:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 05A6960EA1;
	Sun,  4 Dec 2022 15:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AD5C433D6;
	Sun,  4 Dec 2022 15:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670166565;
	bh=zaEl7zRMfpVqBV1L2UinSVoJVJecClXoYddjyKIbegE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IOx51a8KKFI5+y5K+sxnPq2EVwTtO0FHR4UFy6tuZLMVQZPpTaFhuLVN892d9NzAE
	 NS6WcZ63Lzu9i3iP5539ZH3SoUArMCv2GwmeFSznEpzG4uATh56qoRpvM1rHbYkhvx
	 DRH0L3z9y60ea3nB9Q4xMVNmkWqzDQAvIdFifnawt9Sr5Uql+pQFWM1Qy/Bm3PoNZc
	 3Me5YOvpSbRs8Rme3ZaJ9BehFMS/UwYwDGG+s8BrNQ7DSSBUwEYIg2jfeBUYhfJw/T
	 idfamotzw/ZiRSzM5/Rz6SyoDIamXPw609HOqZpaG2UHCnLk8qghDMCWFEziFM73es
	 qrR3pHRdVawGQ==
Date: Sun, 4 Dec 2022 16:09:21 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: fix possible deadlock
 if mtk_wed_wo_init fails
Message-ID: <Y4y4If8XXu+wErIj@lore-desk>
References: <a87f05e60ea1a94b571c9c87b69cc5b0e94943f2.1669999089.git.lorenzo@kernel.org>
 <Y4ybbkn+nXkGsqWe@unreal>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FiFvvHc0xRrwB4HC"
Content-Disposition: inline
In-Reply-To: <Y4ybbkn+nXkGsqWe@unreal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_070933_249252_41D9247A 
X-CRM114-Status: GOOD (  20.90  )
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


--FiFvvHc0xRrwB4HC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Dec 02, 2022 at 06:36:33PM +0100, Lorenzo Bianconi wrote:
> > Introduce __mtk_wed_detach() in order to avoid a possible deadlock in
> > mtk_wed_attach routine if mtk_wed_wo_init fails.
> >=20
> > Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo supp=
ort")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/mediatek/mtk_wed.c     | 24 ++++++++++++++-------
> >  drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 10 ++++++---
> >  drivers/net/ethernet/mediatek/mtk_wed_wo.c  |  3 +++
> >  3 files changed, 26 insertions(+), 11 deletions(-)
>=20
> <...>
>=20
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/=
ethernet/mediatek/mtk_wed_mcu.c
> > index f9539e6233c9..b084009a32f9 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> > @@ -176,6 +176,9 @@ int mtk_wed_mcu_send_msg(struct mtk_wed_wo *wo, int=
 id, int cmd,
> >  	u16 seq;
> >  	int ret;
> > =20
> > +	if (!wo)
> > +		return -ENODEV;
>=20
> <...>
>=20
> >  static void
> >  mtk_wed_wo_hw_deinit(struct mtk_wed_wo *wo)
> >  {
> > +	if (!wo)
> > +		return;
>=20
> How are these changes related to the written in deadlock?
> How is it possible to get internal mtk functions without valid wo?

Hi Leon,

if mtk_wed_rro_alloc() fails in mtk_wed_attach(), we will end up running
__mtk_wed_detach() when wo struct is not allocated yet (wo is allocated in
mtk_wed_wo_init()).
Moreover __mtk_wed_detach() can run mtk_wed_wo_reset() and mtk_wed_wo_deini=
t()
so we will need to check if wo pointer is properly set. We will face the sa=
me
issue if wo allocation fails in mtk_wed_wo_init routine.
If we remove the deadlock we need to take into account even these condition=
s.

Regards,
Lorenzo

>=20
> Thanks
>=20
> > +
> >  	/* disable interrupts */
> >  	mtk_wed_wo_set_isr(wo, 0);
> > =20
> > --=20
> > 2.38.1
> >=20

--FiFvvHc0xRrwB4HC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY4y4IQAKCRA6cBh0uS2t
rNC1AP4uCyNvASYhxfjb8IiHvuONICL7rKSlK47wKTB1xSuQxAD9GoVT9OnQo2yG
SFi0uEVU+b8+P96tNAvn5NUk2BqIBwU=
=o4UA
-----END PGP SIGNATURE-----

--FiFvvHc0xRrwB4HC--

