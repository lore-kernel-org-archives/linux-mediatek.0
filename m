Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE5CC47089
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 17:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7DJBD9damnXune0Kig2UnZuVv4B+QVYF3QsLQNl4lw=; b=jsB0JmdL5Bt3aHyGeQLX3qWP9t
	74zh56OICJbIMYJGOgiUAIaDLqF9pM5/IWc1G9sEoztfjTDMBvoWqlUG2ThGnhtM4XuaN45ZGRNIJ
	XsBaMzBrQObNQAV7TWBrXvW3daZ5YZZhZlQfLgNPGxHx5dABKTkh6fU4KDq3i+avXMhK1bphYjpbw
	fqpiReMO1tUjxHdjPLsWO+X6VGMvv9jNAd+/xCOrZRB4jyyJWRDToMa86TzHYfC5DvRwbHlhLdUbP
	6+94cLwVlTwmUAWJtlexnWJ+Jz1jl1xVzm3X6RT724EzLSy73nG7z0LF1xnaPHiRbY0pZdmSRfdEm
	LPaSNmbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Eum-007ALr-Vz; Mon, 05 Dec 2022 17:06:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Euj-007AIi-JU
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 17:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670259955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b7DJBD9damnXune0Kig2UnZuVv4B+QVYF3QsLQNl4lw=;
	b=RZ48FqIu17ewFOCqnZJZ2A9GSWuPIa/DmWMKmxnqdv0QMApwcDG5k3QO8Y6r1EuCawgwBQ
	WwL2vf7459RWquGV2zpxEHvfe4ZxAjptEbhgwhuFP+XDaEQMppBV0w6M6p44Jo9Mj5i+RY
	NORAWzutUGDF63DbXbFAyRoI7IGcHDw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-220-GtZp_HU0NzufLhJjFAwOSA-1; Mon, 05 Dec 2022 12:05:53 -0500
X-MC-Unique: GtZp_HU0NzufLhJjFAwOSA-1
Received: by mail-wr1-f70.google.com with SMTP id w11-20020adfbacb000000b002418a90da01so2514395wrg.16
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Dec 2022 09:05:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7DJBD9damnXune0Kig2UnZuVv4B+QVYF3QsLQNl4lw=;
        b=NgEy+MGEDg1HqvhhCzkTyqf9vnW0QamNPAfBlw5fmuem7bNGAnDGQPk/H6p/JHoJBh
         fjx6PlUr8YIQzsjUt2Sv8IeqCmUSSHKLcCygxJUIOmEMZ88icC7Sc47zJAR6uDajRdsX
         /356PtEExrXYvKpd3qj2C7IUlzu2FQR27LatP4kelG1OEn2nE7FhpfNrjnVJNva5BX90
         X0XTTmy4YlLfDD37kTkTlAM07JipAOlRYVLFM4bHqlinIapPxgbeizKBD1MbkiS2dMQv
         Mfe7cXvEcNIW9MIUNGD8i90YANF3FZr+SDnyTq0z/i7Wf2J5DXx3wBjsDWwFPH34BUY5
         7Cew==
X-Gm-Message-State: ANoB5pkzJQsN1YkG6j/m79BtEHzUHh2AKgHlLeIda0wC7yGBD/Q5xtaz
	1/vbB8xtdCFJsYRH9j9R/3SVgBUNwd6957whZhE0VcVfrqdmb+OKcgr4NQpKaZmZQQ/3ykqFkn8
	jMhPaqfbZ9999600p0fSsHZpLAxeso3I4
X-Received: by 2002:adf:f5c3:0:b0:242:3427:bb51 with SMTP id k3-20020adff5c3000000b002423427bb51mr12712957wrp.635.1670259952261;
        Mon, 05 Dec 2022 09:05:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6gLa1e/CtnmUdAsov448g+X+01PUiazUSLlfkKZnHFzLMa2kEDqD+6fmSR4sa3jKiCKSwh/w==
X-Received: by 2002:adf:f5c3:0:b0:242:3427:bb51 with SMTP id k3-20020adff5c3000000b002423427bb51mr12712943wrp.635.1670259951991;
        Mon, 05 Dec 2022 09:05:51 -0800 (PST)
Received: from localhost (net-188-216-77-84.cust.vodafonedsl.it. [188.216.77.84])
        by smtp.gmail.com with ESMTPSA id g16-20020a7bc4d0000000b003d1b4d957aasm6318137wmk.36.2022.12.05.09.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 09:05:51 -0800 (PST)
Date: Mon, 5 Dec 2022 18:05:49 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
	nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, sujuan.chen@mediatek.com
Subject: Re: [PATCH v2 net-next] net: ethernet: mtk_wed: fix possible
 deadlock if mtk_wed_wo_init fails
Message-ID: <Y44k7X5YYbuSntd2@lore-desk>
References: <5a29aae6c4a26e807844210d4ddac7950ca5f63d.1670238731.git.lorenzo@kernel.org>
 <Y44jO1ZT9RgqYtxF@unreal>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tHgY236u4P316zYr"
Content-Disposition: inline
In-Reply-To: <Y44jO1ZT9RgqYtxF@unreal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_090557_757141_E83AF8E8 
X-CRM114-Status: GOOD (  25.47  )
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


--tHgY236u4P316zYr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, Dec 05, 2022 at 12:14:41PM +0100, Lorenzo Bianconi wrote:
> > Introduce __mtk_wed_detach() in order to avoid a possible deadlock in
> > mtk_wed_attach routine if mtk_wed_wo_init fails.
> > Check wo pointer is properly allocated before running mtk_wed_wo_reset()
> > and mtk_wed_wo_deinit() in __mtk_wed_detach routine.
> > Honor mtk_wed_mcu_send_msg return value in mtk_wed_wo_reset().
> >=20
> > Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo supp=
ort")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> > Changes since v1:
> > - move wo pointer checks in __mtk_wed_detach()
> > ---
> >  drivers/net/ethernet/mediatek/mtk_wed.c     | 30 ++++++++++++++-------
> >  drivers/net/ethernet/mediatek/mtk_wed_mcu.c |  3 +++
> >  2 files changed, 23 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethe=
rnet/mediatek/mtk_wed.c
> > index d041615b2bac..2ce9fbb1c66d 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> > @@ -174,9 +174,10 @@ mtk_wed_wo_reset(struct mtk_wed_device *dev)
> >  	mtk_wdma_tx_reset(dev);
> >  	mtk_wed_reset(dev, MTK_WED_RESET_WED);
> > =20
> > -	mtk_wed_mcu_send_msg(wo, MTK_WED_MODULE_ID_WO,
> > -			     MTK_WED_WO_CMD_CHANGE_STATE, &state,
> > -			     sizeof(state), false);
> > +	if (mtk_wed_mcu_send_msg(wo, MTK_WED_MODULE_ID_WO,
> > +				 MTK_WED_WO_CMD_CHANGE_STATE, &state,
> > +				 sizeof(state), false))
> > +		return;
> > =20
> >  	if (readx_poll_timeout(mtk_wed_wo_read_status, dev, val,
> >  			       val =3D=3D MTK_WED_WOIF_DISABLE_DONE,
> > @@ -576,12 +577,10 @@ mtk_wed_deinit(struct mtk_wed_device *dev)
> >  }
> > =20
> >  static void
> > -mtk_wed_detach(struct mtk_wed_device *dev)
> > +__mtk_wed_detach(struct mtk_wed_device *dev)
> >  {
> >  	struct mtk_wed_hw *hw =3D dev->hw;
> > =20
> > -	mutex_lock(&hw_lock);
> > -
> >  	mtk_wed_deinit(dev);
> > =20
> >  	mtk_wdma_rx_reset(dev);
> > @@ -590,9 +589,11 @@ mtk_wed_detach(struct mtk_wed_device *dev)
> >  	mtk_wed_free_tx_rings(dev);
> > =20
> >  	if (mtk_wed_get_rx_capa(dev)) {
> > -		mtk_wed_wo_reset(dev);
> > +		if (hw->wed_wo)
> > +			mtk_wed_wo_reset(dev);
> >  		mtk_wed_free_rx_rings(dev);
> > -		mtk_wed_wo_deinit(hw);
> > +		if (hw->wed_wo)
> > +			mtk_wed_wo_deinit(hw);
> >  	}
> > =20
> >  	if (dev->wlan.bus_type =3D=3D MTK_WED_BUS_PCIE) {
> > @@ -612,6 +613,13 @@ mtk_wed_detach(struct mtk_wed_device *dev)
> >  	module_put(THIS_MODULE);
> > =20
> >  	hw->wed_dev =3D NULL;
> > +}
> > +
> > +static void
> > +mtk_wed_detach(struct mtk_wed_device *dev)
> > +{
> > +	mutex_lock(&hw_lock);
> > +	__mtk_wed_detach(dev);
> >  	mutex_unlock(&hw_lock);
> >  }
> > =20
> > @@ -1490,8 +1498,10 @@ mtk_wed_attach(struct mtk_wed_device *dev)
> >  		ret =3D mtk_wed_wo_init(hw);
> >  	}
> >  out:
> > -	if (ret)
> > -		mtk_wed_detach(dev);
> > +	if (ret) {
> > +		dev_err(dev->hw->dev, "failed to attach wed device\n");
> > +		__mtk_wed_detach(dev);
> > +	}
> >  unlock:
> >  	mutex_unlock(&hw_lock);
> > =20
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/=
ethernet/mediatek/mtk_wed_mcu.c
> > index f9539e6233c9..3dd02889d972 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> > @@ -207,6 +207,9 @@ int mtk_wed_mcu_msg_update(struct mtk_wed_device *d=
ev, int id, void *data,
> >  	if (dev->hw->version =3D=3D 1)
> >  		return 0;
> > =20
> > +	if (!wo)
> > +		return -ENODEV;
> > +
>=20
> Can you please help me to understand how and when this mtk_wed_mcu_msg_up=
date()
> function is called?
>=20
> I see this line .msg_update =3D mtk_wed_mcu_msg_update, and
> relevant mtk_wed_device_update_msg() define, but nothing calls to this
> define.

mtk_wed_device_update_msg() is currently run by mt7915 driver in
mt7915_mcu_wed_enable_rx_stats() and in mt76_connac_mcu_sta_wed_update().
At the moment we always run mtk_wed_mcu_msg_update with non-NULL wo pointer,
but I would prefer to add this safety check.

Regards,
Lorenzo

>=20
>=20
>=20
> >  	return mtk_wed_mcu_send_msg(wo, MTK_WED_MODULE_ID_WO, id, data, len,
> >  				    true);
> >  }
> > --=20
> > 2.38.1
> >=20
>=20

--tHgY236u4P316zYr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY44k7QAKCRA6cBh0uS2t
rNOxAQC8q/k7mo1XbnKQjrPmumhdva9w1PIRQTguMeFrdfq49gEAz4D/Ss1vGRP3
ASHrz5HBFxuwDrzOuG8Y6oFRoOAHvQo=
=PUML
-----END PGP SIGNATURE-----

--tHgY236u4P316zYr--


