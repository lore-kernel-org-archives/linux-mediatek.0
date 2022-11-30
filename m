Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161AAC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhSFBxEWAdwUeN2k0lrDRPSZ1FF+VOfj1b7dA06FCR8=; b=EfrYg/yrGHXz/mPLLyt2CGMWYO
	8HWSPyKxBpBNgFcXckktj2qGlA4pSRYZ29Mon8iUfXSNm3we3TyDDEMJY6Hy0qN78l8tlKFE6VMxT
	9ABgH83QmKwE+5okntUEt+am54fzvB8iECUoSzO0OaYedE8Mh1svDQYMIqVacZodROINPvsc09rHo
	poZdZN/SqpXVlZKCOG3ePE1+kXBj2M8tJrlMKx9HFWUSdxFeWASx93ltjYC+frRm4/YnbqM7j2jFu
	fAf3H9bnmeNj+2mLwTlOY58dxO3vIFY7mJnAg9wtNccgJgGSxfAq1YBKNe8VMnQz52ISb7nHXDPk7
	2BRJcNcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Qas-000q7z-FO; Wed, 30 Nov 2022 17:09:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0QaW-000put-1U
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 17:09:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24F3F61D01;
	Wed, 30 Nov 2022 17:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08056C433D7;
	Wed, 30 Nov 2022 17:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828173;
	bh=egobHfAE82ERuhdrxaZwV1hKFHc2d2ZHkUMGyEs1SHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhMphUQUpRIjtXcmvOl5pDwhSRhlkxjIRqFcCVq1eyQ599mqwohh2HAfeR9OMJ6Dp
	 QXmWZcCZBm/Fy2PjE4iX3Mp0Lz4eTAcFi0u8J9Zfv+jFSiheb8238fvku+5JAmoFjo
	 lVEkqP7vZ+ztftxEV8lxq16qgSCRVriZlB/p0B68xlfcI8/fXlamgcM7Q7nQUy51Oy
	 m+sIsPC0YFKwzYFlofn3qnDnyFe/a0HviIJqrwACEwMPbKaFRIoTTum3PQ66LF6sfd
	 sqhnCcynPhzMCwUdNKOW7Gq+sCvyCQ1HNq6KMBKo54R8+haFMBKoOmz/OjvFKFRyL9
	 OQ90QJSDDoIHA==
Date: Wed, 30 Nov 2022 18:09:29 +0100
From: "lorenzo@kernel.org" <lorenzo@kernel.org>
To: Deren Wu =?utf-8?B?KOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>
Cc: Evelyn Tsai =?utf-8?B?KOiUoeePiumIuik=?= <Evelyn.Tsai@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Leon Yen =?utf-8?B?KOmhj+iJr+WEkik=?= <Leon.Yen@mediatek.com>,
	Shayne Chen =?utf-8?B?KOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
	"nbd@nbd.name" <nbd@nbd.name>,
	Stella Chang =?utf-8?B?KOW8teabieS9qSk=?= <Stella.Chang@mediatek.com>,
	Sean Wang <Sean.Wang@mediatek.com>,
	KM Lin =?utf-8?B?KOael+aYhuawkSk=?= <km.lin@mediatek.com>,
	Soul Huang =?utf-8?B?KOm7g+iHs+aYtik=?= <Soul.Huang@mediatek.com>,
	YN Chen =?utf-8?B?KOmZs+W9peWvpyk=?= <YN.Chen@mediatek.com>,
	Posh Sun =?utf-8?B?KOWtq+eRnuW7tyk=?= <posh.sun@mediatek.com>,
	Eric-SY Chang =?utf-8?B?KOW8teabuOa6kCk=?= <Eric-SY.Chang@mediatek.com>,
	CH Yeh =?utf-8?B?KOiRieW/l+ixqik=?= <ch.yeh@mediatek.com>,
	Robin Chiu =?utf-8?B?KOmCseWci+a/sSk=?= <robin.chiu@mediatek.com>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: mt76: mt7921s: fix slab-out-of-bounds access in
 sdio host
Message-ID: <Y4eOSUzLAW8x802i@lore-desk>
References: <631e6a06fb640ec4f81c92b57d31eb0f7b23c351.1669814212.git.deren.wu@mediatek.com>
 <Y4dsznJ+GBalfzvx@lore-desk>
 <5b41c02ace6538122ebd656db5bec748fcd6e14e.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IsI5c3S3RXYk6V18"
Content-Disposition: inline
In-Reply-To: <5b41c02ace6538122ebd656db5bec748fcd6e14e.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_090936_240509_7C68B861 
X-CRM114-Status: GOOD (  27.93  )
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


--IsI5c3S3RXYk6V18
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lore,
>=20
> On Wed, 2022-11-30 at 15:46 +0100, Lorenzo Bianconi wrote:
> > > SDIO may need addtional 512 bytes to align bus operation. If the
> > > tailroom
> > > of this skb is not big enough, we would access invalid memory
> > > region.
> > > For low level operation, take xmit_buf instead of skb to keep valid
> > > memory
> > > access in SDIO.
> > > Note: xmit_buf is big enough for single skb size
> > >=20
> > > Fixes: 764dee47e2c1 ("mt76: sdio: move common code in mt76_sdio
> > > module")
> > > Tested-by: YN Chen <YN.Chen@mediatek.com>
> > > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > > ---
> > >  drivers/net/wireless/mediatek/mt76/sdio_txrx.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> > > b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> > > index bfc4de50a4d2..ebea5c4e8da5 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> > > @@ -254,7 +254,8 @@ static int mt76s_tx_run_queue(struct mt76_dev
> > > *dev, struct mt76_queue *q)
> > > =20
> > >  		if (!test_bit(MT76_STATE_MCU_RUNNING, &dev->phy.state))=20
> > > {
> > >  			__skb_put_zero(e->skb, 4);
> > > -			err =3D __mt76s_xmit_queue(dev, e->skb->data,
> > > +			memcpy(sdio->xmit_buf, e->skb->data, e->skb-
> > > >len);
> >=20
> > (even if it is not critical for performance) iirc the skb from the
> > mcu is
> > always linear, I guess we can use __skb_grow() instead. What do you
> > think?
> >=20
> > Regards,
> > Lorenzo
> >=20
>=20
> _skb_grow() looks good for me. It's a balance solution for this case.
> If you have no concern about the patch below, I will post v2 after UT.
> :)
>=20
>         if (!test_bit(MT76_STATE_MCU_RUNNING, &dev->phy.state)) {
>                 __skb_put_zero(e->skb, 4);
> +               err =3D __skb_grow(e->skb, roundup(e->skb->len,
> +                                                sdio->func-
> >cur_blksize));

can we merge __skb_put_zero() and __skb_grow()? Does sdio chip require the 4
last bytes to be 0?

Regards,
Lorenzo

> +               if (err)
> +                       return err;
>                 err =3D __mt76s_xmit_queue(dev, e->skb->data,
>                                                  e->skb->len);
>=20
>=20
> Regards,
> Deren
>=20
> > > +			err =3D __mt76s_xmit_queue(dev, sdio->xmit_buf,
> > >  						 e->skb->len);
> > >  			if (err)
> > >  				return err;
> > > --=20
> > > 2.18.0
> > >=20

--IsI5c3S3RXYk6V18
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY4eOSQAKCRA6cBh0uS2t
rIE7AQDEqCVfDhShTRqXBb5ZtxyFKVj/QHV60c8Gz7LUNX07SAEA15WjsxxuSzBQ
utdndpZ+ufqI77vcexMCLwUaQ03cbQY=
=4eey
-----END PGP SIGNATURE-----

--IsI5c3S3RXYk6V18--

