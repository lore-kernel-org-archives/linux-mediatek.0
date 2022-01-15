Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED097C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jan 2022 00:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJO0OTecHHeT5p6+zO/gSfMTPqbzUb6gVGD4/D+1Ui8=; b=2ruerNuEa/eb4AtXqqP06d+P9M
	V6TCq53K/uFjSiknx4orM2WZ7mDqncB87IRhSAcBHwpmYe1q5GN+56z+O6ECoCE3qost0Ujgfk+8F
	NQPPl+nVkJ1DMH/vgEvngUUfPETC4cNsDP1h/CBLHul98kv8YvgWrwJ2t20ld1mCVMQUMQZYZRTeV
	Z1kvJOwGwig54wwyKCYdL/AjLv98kprdllzZheZewE4InPJcalv+zolbZUSVad5LUopaC4qUDlg4p
	if4sucjuUM5ozJxkRsrOtSGx3xJZIXHVIZtxevkz6p3BklO/nYuPruHeojCHAipLc+9LTGJS0Iyx5
	BJ5qAAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Wpg-00AUj9-3V; Sat, 15 Jan 2022 00:22:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Wpc-00AUif-F8
 for linux-mediatek@lists.infradead.org; Sat, 15 Jan 2022 00:22:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642206125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=prvuPqnXb06AJkSJeDoF8nmOrm3VDJPixO1wFNBYfWU=;
 b=N76P49w54f1Ow1YKNBytaPYX/P0i218J+80YKXjxie8dfglRnkOqEFp217fECbBTKcFOYA
 L5pao/czNusEycLivMIuS88hxoRTYj5EdxBnagi2elnNod3qVtNLTJ01tHsxpBxSj9owpX
 Hwz1h/1q/lwA5W7UTW38SNGf9wcoO98=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-PZGNxDHIM3-y15HuiE7G1Q-1; Fri, 14 Jan 2022 19:22:01 -0500
X-MC-Unique: PZGNxDHIM3-y15HuiE7G1Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 t1-20020a056402524100b003f8500f6e35so9555977edd.8
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Jan 2022 16:22:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PQ+jsLhgslb86SxGOTsTLC1mkqty0MFdlpHfF3PjiQs=;
 b=LJoJ32h6Rw99mssc4y1oZBJbUCpSm951nLnZ7edOfcZMKi4d0HkDYJRA+sLv1lcdqe
 Mi/wOUYJr8cAtuJc4PsN6NVoz7W0VFjVdpTeQ4xySFkzcJ4tDxIny2MvhoNFAMExbm02
 RzY7MxxD2+X3HJoBilRvp8hiCSOIokxBhpzkRrt00Pxbc9LUMYqQZEpC9C80UGdb+11c
 JmcMtQ6nfiLkM1GivkKV+lTxBJN9F4RVXwM+XQZ4t871gRNobkQrKb+bktRSCh3zZ2Jy
 qAcAWos49wRiu9U9TdbMvgT97Rs1pbVNMml8GcuWcB1x7ydsjbFO3DfIMoVXhmcNuaVZ
 FheQ==
X-Gm-Message-State: AOAM532DJ0++nR/EXbX/IB5aN4ZvricaNNwmGXUfPFqLIIWc8WmtXTkp
 IX2HUCv0I5gkqrOXvM9nW3ea5y2q7DDIZEOWnAQSMHAX0W4FvihdGKw9jWWYGVNbwj3DEC+sfCA
 0wAqe7qLu5KdhBRVtyt0DM4X+S2q7aJYf
X-Received: by 2002:a50:fd12:: with SMTP id i18mr9672145eds.88.1642206120395; 
 Fri, 14 Jan 2022 16:22:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9PIKnZr9zn3NJ3qYK883GYZh9phOeMwKN3HPn5P4Y6dMWSEHUij1yAmPNfqqICEadg3yEuQ==
X-Received: by 2002:a50:fd12:: with SMTP id i18mr9672122eds.88.1642206120167; 
 Fri, 14 Jan 2022 16:22:00 -0800 (PST)
Received: from localhost (net-93-146-37-237.cust.vodafonedsl.it.
 [93.146.37.237])
 by smtp.gmail.com with ESMTPSA id g16sm2798064edz.33.2022.01.14.16.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 16:21:59 -0800 (PST)
Date: Sat, 15 Jan 2022 01:21:57 +0100
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
Subject: Re: [PATCH v2 1/2] mt76: sdio: honor the largest Tx buffer the
 hardware can support
Message-ID: <YeITpQtMvBPgWWhH@lore-desk>
References: <c09673a115c39f7af692efb984a5dc0c75238a64.1642204233.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c09673a115c39f7af692efb984a5dc0c75238a64.1642204233.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_162208_641775_CE176FA4 
X-CRM114-Status: GOOD (  28.01  )
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
Content-Type: multipart/mixed; boundary="===============8576065857666324006=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============8576065857666324006==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FyDFronZURlDsQtN"
Content-Disposition: inline

--FyDFronZURlDsQtN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> We don't have to create a separate sdio.xmit_buf buffer for each queue.
> Instead, we just need to create one, reuse it across all queues to reduce
> memory consumption further.
>=20
> And then we should take it into account the actual the host and the devic=
e
> MMC capability to determine what the appropriate xmit_buf_size can be.
>=20
> Both MT7921S and MT7663 can support up to Tx FIFO size of 0x3fe00 which
> means the device can receive 511 blocks of block size 512 in a row from
> the host. So if the driver aggregates the frames as many as possible the
> the device can support, we can merge multiple MMC requests into a single
> one to get rid of the overhead of the handling and synchronizing in those
> unnecessary MMC requests and reduce the SDIO lock contention with the
> Bluetooth concurrent traffic and finally to have the higher bus
> utilization with less idle cycle.
>=20
> With the patch, it is helpful for WiFi to have steady throughput
> performance especially while running Bluetooth concurrently.
>=20
> Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> ---
> v1 -> v2:
> 1. move buffer allocation in mt76s_init() and remove duplicated
>    code in mt7663/mt7921.
> 2. move mt76s_get_xmit_buf_sz into mt76s_init()
> 3. merge 2/3 and 3/3 in v1
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h       |  5 +++--
>  .../net/wireless/mediatek/mt76/mt7615/sdio.c    | 12 +-----------
>  .../net/wireless/mediatek/mt76/mt7921/sdio.c    | 12 +-----------
>  drivers/net/wireless/mediatek/mt76/sdio.c       | 14 +++++++++++++-
>  drivers/net/wireless/mediatek/mt76/sdio_txrx.c  | 17 +++++++----------
>  5 files changed, 25 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 14f60fcb6a34..43abf0679876 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -497,7 +497,7 @@ struct mt76_usb {
>  =09} mcu;
>  };
> =20
> -#define MT76S_XMIT_BUF_SZ=09(16 * PAGE_SIZE)
> +#define MT76S_XMIT_BUF_SZ=090x3fe00
>  #define MT76S_NUM_TX_ENTRIES=09256
>  #define MT76S_NUM_RX_ENTRIES=09512
>  struct mt76_sdio {
> @@ -507,7 +507,8 @@ struct mt76_sdio {
> =20
>  =09struct work_struct stat_work;
> =20
> -=09u8 *xmit_buf[IEEE80211_NUM_ACS + 2];
> +=09u8 *xmit_buf;
> +=09u32 xmit_buf_sz;
> =20
>  =09struct sdio_func *func;
>  =09void *intr_data;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7615/sdio.c
> index 71162befdae8..49ab3a1f3b9b 100644
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
> @@ -140,16 +140,6 @@ static int mt7663s_probe(struct sdio_func *func,
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
> -=09}
> -
>  =09ret =3D mt76s_alloc_rx_queue(mdev, MT_RXQ_MAIN);
>  =09if (ret)
>  =09=09goto error;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/sdio.c
> index 743b63f66efa..a6ae29c97e0e 100644
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
> @@ -154,16 +154,6 @@ static int mt7921s_probe(struct sdio_func *func,
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
> -=09}
> -
>  =09ret =3D mt76s_alloc_rx_queue(mdev, MT_RXQ_MAIN);
>  =09if (ret)
>  =09=09goto error;
> diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wire=
less/mediatek/mt76/sdio.c
> index 54f72d215948..def7f325f5c5 100644
> --- a/drivers/net/wireless/mediatek/mt76/sdio.c
> +++ b/drivers/net/wireless/mediatek/mt76/sdio.c
> @@ -12,6 +12,8 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mmc/sdio_func.h>
> +#include <linux/mmc/card.h>
> +#include <linux/mmc/host.h>
>  #include <linux/sched.h>
>  #include <linux/kthread.h>
> =20
> @@ -627,6 +629,7 @@ int mt76s_init(struct mt76_dev *dev, struct sdio_func=
 *func,
>  =09       const struct mt76_bus_ops *bus_ops)
>  {
>  =09struct mt76_sdio *sdio =3D &dev->sdio;
> +=09u32 host_max_cap;
>  =09int err;
> =20
>  =09err =3D mt76_worker_setup(dev->hw, &sdio->status_worker,
> @@ -648,7 +651,16 @@ int mt76s_init(struct mt76_dev *dev, struct sdio_fun=
c *func,
>  =09dev->bus =3D bus_ops;
>  =09dev->sdio.func =3D func;
> =20
> -=09return 0;
> +=09host_max_cap =3D min_t(u32, func->card->host->max_req_size,
> +=09=09=09     func->cur_blksize *
> +=09=09=09     func->card->host->max_blk_count);
> +=09dev->sdio.xmit_buf_sz =3D min_t(u32, host_max_cap, MT76S_XMIT_BUF_SZ)=
;
> +=09dev->sdio.xmit_buf =3D devm_kmalloc(dev->dev, dev->sdio.xmit_buf_sz,
> +=09=09=09=09=09  GFP_KERNEL);
> +=09if (!dev->sdio.xmit_buf)
> +=09=09err =3D -ENOMEM;
> +
> +=09return err;
>  }
>  EXPORT_SYMBOL_GPL(mt76s_init);
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net=
/wireless/mediatek/mt76/sdio_txrx.c
> index 488ad7734d85..9fcf507e09bd 100644
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
> @@ -255,27 +254,25 @@ static int mt76s_tx_run_queue(struct mt76_dev *dev,=
 struct mt76_queue *q)
>  =09=09}
> =20
>  =09=09pad =3D roundup(e->skb->len, 4) - e->skb->len;
> -=09=09if (len + e->skb->len + pad + 4 > MT76S_XMIT_BUF_SZ)
> +=09=09if (len + e->skb->len + pad + 4 > dev->sdio.xmit_buf_sz)
>  =09=09=09break;
> =20
>  =09=09if (mt76s_tx_pick_quota(sdio, mcu, e->buf_sz, &pse_sz,
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

--FyDFronZURlDsQtN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYeITpQAKCRA6cBh0uS2t
rDV4AP9VS+PnLKAiCkX/BFp3fsIh6h3NA3/GL6iNAm0a5VVtsAD/VfDqTDX+8O23
9ythKDVgX0vC2ZjQGGCaCEVZeims0g4=
=GIwz
-----END PGP SIGNATURE-----

--FyDFronZURlDsQtN--



--===============8576065857666324006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8576065857666324006==--


