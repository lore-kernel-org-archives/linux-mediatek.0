Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63312C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 09:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8p9Pl0O2R01mU2KOrm84bPkb6551A1Mqp3/IzEPcUxk=; b=PmEbL/hrIEa4QjcE6wb0aez8LO
	rPRnRuhr83z60m5cLH7Z9xGwZCwIbYNXeeAI2O3Wq4b8JPPOm+x4iaMY8VMTeVRJ2pSCMBt3BYxLs
	x+Lvw2xEn0vKqGPdIUH/1OWvy7gQWgRDPUwU8EPGec5Hl238IBAJ9uoOl9FqqVSlMSVSVRZbldEyS
	0xfq/V2bxg+mD1Jn0K3xH9PejSXgNRnRo1BnP4QckznvxFp/wT0kTnFN+aFupwezu//REehcOXPzT
	y1/jWYuh4CsTf/FQGcxG50YSYG0XY3l+pVohJB5eNH67ddlR50WknxI7E6Mo6iEWvDRbjeMKNd2Z7
	rgU1+XHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7w6j-005CFL-Nv; Thu, 13 Jan 2022 09:09:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7w6h-005CEe-9f
 for linux-mediatek@lists.infradead.org; Thu, 13 Jan 2022 09:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642064958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WupAcAtyYt5bLHVALxE3B62CAqrglYOOYtdLLYl44J4=;
 b=PHWXtR/6Qpea4shtSocroLhy5qwCW3dMrDMe9KtzWaf83kitV5fMaVR/uHDSNiqsgKjorV
 xcY2nUp3GOkl50TonB8f/Dk5e2ohTzl2wYioUlglAvtK14kWrUipY1rQwbreQ2CCjAJHyX
 y2sxJY991m6SBIcLhAEyuNLtp3QrOk8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-_B13EE0IMgCBcB7h_BE7BQ-1; Thu, 13 Jan 2022 04:09:04 -0500
X-MC-Unique: _B13EE0IMgCBcB7h_BE7BQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v14-20020adfa1ce000000b001a49d6587ceso951187wrv.21
 for <linux-mediatek@lists.infradead.org>; Thu, 13 Jan 2022 01:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5i+ykEDe6nWgdV5O3/8aCcNAbW20DKh9SpDiC8ZGos8=;
 b=Pga5jXKrd8q+V/XZEzgQBbzEmdr9jmfgpN6raJh1BNPID22C2VVkBNlRznY5ZKF+BN
 4/6JVmhHLr/zY2d6Bo+QvMrs+MECDbZB8F433Y2QtQ88atdM4Qpg1Focfm3uldZeJpjM
 WXiwaD52JSqDHpNXB+TiQy3J6xH2cyTLblaqW6qdlTAuzIA0zzxUU7SB/C3VxIbun2H7
 naN80I9vO++C1jwtUdhQAXPIkKrEkY8LO5n3E7jGrQ8LAeQE9eubgRg6H4D9HrZiMhcQ
 DKaIvLDEdErBlMB+4JpknI6+3b6HzVGEjE+ScAoZ5MXOgCH54Wxy6/KXz1kDrJrQizgY
 r7HA==
X-Gm-Message-State: AOAM530fxrCPJWPJdHxyiiAdW+bbnCmP13N9m3tSGKKmpFTXL0ARKgNn
 k2dVCqAZH4Eo2zYnVvhSjJJlXnAz5UeQXy0LUvPh/6BZCPY50VCOMdVTmqJEgSvlsOBhSvahipF
 z8nFziifc/9xMKG0I0FIpDTJ+DAZ1Uu+p
X-Received: by 2002:a1c:a987:: with SMTP id s129mr9818540wme.161.1642064943431; 
 Thu, 13 Jan 2022 01:09:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqVilqZ5CCJ1w5sQvZLvNFtzkj3cmxk9TlmmPD+fvbSM7UH4TReOF2vZy47/tH0z0pgzXbBA==
X-Received: by 2002:a1c:a987:: with SMTP id s129mr9818518wme.161.1642064943151; 
 Thu, 13 Jan 2022 01:09:03 -0800 (PST)
Received: from localhost (net-93-146-37-237.cust.vodafonedsl.it.
 [93.146.37.237])
 by smtp.gmail.com with ESMTPSA id m12sm2443526wrp.49.2022.01.13.01.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 01:09:02 -0800 (PST)
Date: Thu, 13 Jan 2022 10:09:00 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Mark-YW.Chen@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, jenhao.yang@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, jemele@google.com, abhishekpandit@google.com,
 shawnku@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] mt76: sdio: remove those unnecessary buffers in
 sdio.xmit_buf
Message-ID: <Yd/sLP8spK7S5M9U@lore-desk>
References: <651a010d8ff888909b5b8363fa4b243aadc62d45.1642061035.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <651a010d8ff888909b5b8363fa4b243aadc62d45.1642061035.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_010919_457031_C3142F35 
X-CRM114-Status: GOOD (  17.37  )
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
Content-Type: multipart/mixed; boundary="===============3486877069871904542=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3486877069871904542==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IaqNoFyvwuQdIVzk"
Content-Disposition: inline

--IaqNoFyvwuQdIVzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> We don't have to create a separate sdio.xmit_buf buffer for each queue.
> Instead, we just need to create one, reuse it across all queues to reduce
> memory consumption further.
>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h        |  2 +-
>  drivers/net/wireless/mediatek/mt76/mt7615/sdio.c | 15 ++++++---------
>  drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 15 ++++++---------
>  drivers/net/wireless/mediatek/mt76/sdio_txrx.c   | 15 ++++++---------
>  4 files changed, 19 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 14f60fcb6a34..4029a2217397 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -507,7 +507,7 @@ struct mt76_sdio {
> =20
>  =09struct work_struct stat_work;
> =20
> -=09u8 *xmit_buf[IEEE80211_NUM_ACS + 2];
> +=09u8 *xmit_buf;
> =20
>  =09struct sdio_func *func;
>  =09void *intr_data;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7615/sdio.c
> index 71162befdae8..554160b0ea9a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
> @@ -101,7 +101,7 @@ static int mt7663s_probe(struct sdio_func *func,
>  =09struct ieee80211_ops *ops;
>  =09struct mt7615_dev *dev;
>  =09struct mt76_dev *mdev;
> -=09int i, ret;
> +=09int ret;
> =20
>  =09ops =3D devm_kmemdup(&func->dev, &mt7615_ops, sizeof(mt7615_ops),
>  =09=09=09   GFP_KERNEL);
> @@ -140,14 +140,11 @@ static int mt7663s_probe(struct sdio_func *func,
>  =09=09goto error;
>  =09}
> =20
> -=09for (i =3D 0; i < ARRAY_SIZE(mdev->sdio.xmit_buf); i++) {
> -=09=09mdev->sdio.xmit_buf[i] =3D devm_kmalloc(mdev->dev,
> -=09=09=09=09=09=09      MT76S_XMIT_BUF_SZ,
> -=09=09=09=09=09=09      GFP_KERNEL);
> -=09=09if (!mdev->sdio.xmit_buf[i]) {
> -=09=09=09ret =3D -ENOMEM;
> -=09=09=09goto error;
> -=09=09}
> +=09mdev->sdio.xmit_buf =3D devm_kmalloc(mdev->dev, MT76S_XMIT_BUF_SZ,
> +=09=09=09=09=09   GFP_KERNEL);
> +=09if (!mdev->sdio.xmit_buf) {
> +=09=09ret =3D -ENOMEM;
> +=09=09goto error;
>  =09}

I guess we can move buffer allocation in mt76s_init() and remove duplicated
code in mt7663/mt7921.

Reagards,
Lorenzo

> =20
>  =09ret =3D mt76s_alloc_rx_queue(mdev, MT_RXQ_MAIN);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/sdio.c
> index 743b63f66efa..c58c14e28430 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> @@ -121,7 +121,7 @@ static int mt7921s_probe(struct sdio_func *func,
> =20
>  =09struct mt7921_dev *dev;
>  =09struct mt76_dev *mdev;
> -=09int ret, i;
> +=09int ret;
> =20
>  =09mdev =3D mt76_alloc_device(&func->dev, sizeof(*dev), &mt7921_ops,
>  =09=09=09=09 &drv_ops);
> @@ -154,14 +154,11 @@ static int mt7921s_probe(struct sdio_func *func,
>  =09=09goto error;
>  =09}
> =20
> -=09for (i =3D 0; i < ARRAY_SIZE(mdev->sdio.xmit_buf); i++) {
> -=09=09mdev->sdio.xmit_buf[i] =3D devm_kmalloc(mdev->dev,
> -=09=09=09=09=09=09      MT76S_XMIT_BUF_SZ,
> -=09=09=09=09=09=09      GFP_KERNEL);
> -=09=09if (!mdev->sdio.xmit_buf[i]) {
> -=09=09=09ret =3D -ENOMEM;
> -=09=09=09goto error;
> -=09=09}
> +=09mdev->sdio.xmit_buf =3D devm_kmalloc(mdev->dev, MT76S_XMIT_BUF_SZ,
> +=09=09=09=09=09   GFP_KERNEL);
> +=09if (!mdev->sdio.xmit_buf) {
> +=09=09ret =3D -ENOMEM;
> +=09=09goto error;
>  =09}
> =20
>  =09ret =3D mt76s_alloc_rx_queue(mdev, MT_RXQ_MAIN);
> diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net=
/wireless/mediatek/mt76/sdio_txrx.c
> index 488ad7734d85..a04cd2444247 100644
> --- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> +++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> @@ -229,12 +229,11 @@ static int __mt76s_xmit_queue(struct mt76_dev *dev,=
 u8 *data, int len)
> =20
>  static int mt76s_tx_run_queue(struct mt76_dev *dev, struct mt76_queue *q=
)
>  {
> -=09int qid, err, nframes =3D 0, len =3D 0, pse_sz =3D 0, ple_sz =3D 0;
> +=09int err, nframes =3D 0, len =3D 0, pse_sz =3D 0, ple_sz =3D 0;
>  =09bool mcu =3D q =3D=3D dev->q_mcu[MT_MCUQ_WM];
>  =09struct mt76_sdio *sdio =3D &dev->sdio;
>  =09u8 pad;
> =20
> -=09qid =3D mcu ? ARRAY_SIZE(sdio->xmit_buf) - 1 : q->qid;
>  =09while (q->first !=3D q->head) {
>  =09=09struct mt76_queue_entry *e =3D &q->entry[q->first];
>  =09=09struct sk_buff *iter;
> @@ -262,20 +261,18 @@ static int mt76s_tx_run_queue(struct mt76_dev *dev,=
 struct mt76_queue *q)
>  =09=09=09=09=09&ple_sz))
>  =09=09=09break;
> =20
> -=09=09memcpy(sdio->xmit_buf[qid] + len, e->skb->data,
> -=09=09       skb_headlen(e->skb));
> +=09=09memcpy(sdio->xmit_buf + len, e->skb->data, skb_headlen(e->skb));
>  =09=09len +=3D skb_headlen(e->skb);
>  =09=09nframes++;
> =20
>  =09=09skb_walk_frags(e->skb, iter) {
> -=09=09=09memcpy(sdio->xmit_buf[qid] + len, iter->data,
> -=09=09=09       iter->len);
> +=09=09=09memcpy(sdio->xmit_buf + len, iter->data, iter->len);
>  =09=09=09len +=3D iter->len;
>  =09=09=09nframes++;
>  =09=09}
> =20
>  =09=09if (unlikely(pad)) {
> -=09=09=09memset(sdio->xmit_buf[qid] + len, 0, pad);
> +=09=09=09memset(sdio->xmit_buf + len, 0, pad);
>  =09=09=09len +=3D pad;
>  =09=09}
>  next:
> @@ -284,8 +281,8 @@ static int mt76s_tx_run_queue(struct mt76_dev *dev, s=
truct mt76_queue *q)
>  =09}
> =20
>  =09if (nframes) {
> -=09=09memset(sdio->xmit_buf[qid] + len, 0, 4);
> -=09=09err =3D __mt76s_xmit_queue(dev, sdio->xmit_buf[qid], len + 4);
> +=09=09memset(sdio->xmit_buf + len, 0, 4);
> +=09=09err =3D __mt76s_xmit_queue(dev, sdio->xmit_buf, len + 4);
>  =09=09if (err)
>  =09=09=09return err;
>  =09}
> --=20
> 2.25.1
>=20

--IaqNoFyvwuQdIVzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYd/sLAAKCRA6cBh0uS2t
rIt9AQC2z+vzZfUGRj9rx+Ye6hLuKiZ/ETuJQmP9wrR0E9PSTwD/RNUl08g0o4qr
gRb0LE+/XZoZt5cwqGlVnLf7Ln14+QM=
=Za6C
-----END PGP SIGNATURE-----

--IaqNoFyvwuQdIVzk--



--===============3486877069871904542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3486877069871904542==--


