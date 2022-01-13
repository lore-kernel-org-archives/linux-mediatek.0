Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfsTXs4lSYMiR63DwxOCMSisGl5JCm8plVw+7L03p48=; b=gKymOunI8wEkg77hZbMeME/75v
	StODAXecClsku60bs5ao4JU7YXWI1XzPS3LnhLzkvhWx7jdD7IUbup5Xf3eiC3qJgpWUa0SRcz3Ph
	Zw9Kr1Zhzgr4GMPbzsOnPe0qgONg4yu45VAs8fdtE9cMx6dI3m/8FcpIUS+s0HcBWhPLEUqZ2jwFz
	PFvUCel+wRIvynRSqKJuRTQF/sRXfbLBv8/YD2zRxg7z5ljoPCVWDWjNM1sLY4aZB1zP4VcwGYr2L
	CCM12B/i0vgcYaR+E1eiJER+qJ2xC76hBxcQ+y9bscrR9qqKLPu/jQ2Q31Q26EhOZX/JJxP++acMA
	aRVp7uIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7w7R-005CUH-DE; Thu, 13 Jan 2022 09:10:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7w7N-005CRn-Uc
 for linux-mediatek@lists.infradead.org; Thu, 13 Jan 2022 09:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642065000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ifF6TFRJ8SiVKzPlOt5mSKOoCICb6TyPDOD/xNWd0b8=;
 b=eRS43qbiCl6vrRffONchRLHdB4jWWAJnLXqh8CinQ+njEYzkgHzDiOGdAmsE2XZkwf7TID
 eHyowDrOWhUHrMHyf8a3aikrJRGLu/i2hxxtc9zQb2I8/4xI4svXuLx4I7GaCTN/+uSAq8
 eCrIGXPRAY5Q36FWtudJpC91fb3ljYQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-_jHQGHOFOvaCR87EOm17DQ-1; Thu, 13 Jan 2022 04:09:57 -0500
X-MC-Unique: _jHQGHOFOvaCR87EOm17DQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 e23-20020adf9bd7000000b001a935915d09so962904wrc.17
 for <linux-mediatek@lists.infradead.org>; Thu, 13 Jan 2022 01:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=73rtxd1HviwmdX+Fg+f0EBqL1KRigMkO6n8S/v0EwiU=;
 b=IOUg5kxlBHxTajC4AziKaFZMtgbAjhd66UVRIPG63GCgP0bAOw+YUwKpFcpy9yqWaW
 bMx2MQQUw6vdjWz6JcDC2bG870FbfQ/QqvWo8eQ3itABqQVDQWiV599EoVtmd9PKoRgo
 rIl+a0cltf16I0hVljY5Eu1oxUj2/TNRJkfKYrzgsUybkL4VQ4i3sSPP7Qk5oGCmxaHO
 6slZK86GgObsOARXXwd1Z2TRjXq1xnN3Nx4fRUJRKwLLeafK/hhcCo2n3uAHy8Z/SH6z
 6Ej61YgWuN2V7DbBsL1D/3YO/YiFoW1VGvIfVOZpRx3yexklhBmcsNwxjoe9z76e0WBP
 tYbg==
X-Gm-Message-State: AOAM532ej7+u6eRjhNNPueEEBjZHAKKJAaY6xhsKWeyirLNAADHvRvsS
 GMBY1S0Vo9LzhF3OSbnvQEuCVq0m5zs/h/YTY5QUR+0l2jCGq7gHK6b79uNS3TmU/V4gO8mxfqM
 lr7LFp2pWW2+IT5ZgoGwP7Jnm5Nzz1goY
X-Received: by 2002:a5d:6c6c:: with SMTP id r12mr3135919wrz.676.1642064996033; 
 Thu, 13 Jan 2022 01:09:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfNaoPSl66+Pt3uyK81OJXwGYkX4R/yqwvz/BiyCuY8YiQKGGT585uAYWHwdyAByy1fNaekA==
X-Received: by 2002:a5d:6c6c:: with SMTP id r12mr3135895wrz.676.1642064995796; 
 Thu, 13 Jan 2022 01:09:55 -0800 (PST)
Received: from localhost (net-93-146-37-237.cust.vodafonedsl.it.
 [93.146.37.237])
 by smtp.gmail.com with ESMTPSA id o10sm2228831wmq.31.2022.01.13.01.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 01:09:55 -0800 (PST)
Date: Thu, 13 Jan 2022 10:09:53 +0100
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
Subject: Re: [PATCH 2/3] mt76: sdio: honor the largest Tx buffer the hardware
 can support
Message-ID: <Yd/sYYP1XJ3J8RuR@lore-desk>
References: <651a010d8ff888909b5b8363fa4b243aadc62d45.1642061035.git.objelf@gmail.com>
 <557712deb9fc0e78d9a8dd7c68177fe2ae2a38ec.1642061035.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <557712deb9fc0e78d9a8dd7c68177fe2ae2a38ec.1642061035.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_011002_122831_92F400DF 
X-CRM114-Status: GOOD (  25.39  )
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
Content-Type: multipart/mixed; boundary="===============7509743226770880152=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============7509743226770880152==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YpJVo9IvTr9JUqYp"
Content-Disposition: inline

--YpJVo9IvTr9JUqYp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Deren Wu <deren.wu@mediatek.com>
>=20
> We should take it into account the actual the host and the device MMC
> capability to determine what the appropriate xmit_buf_size can be.
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
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h        |  4 +++-
>  drivers/net/wireless/mediatek/mt76/mt7615/sdio.c |  3 ++-
>  drivers/net/wireless/mediatek/mt76/mt7921/sdio.c |  3 ++-
>  drivers/net/wireless/mediatek/mt76/sdio.c        | 13 +++++++++++++
>  drivers/net/wireless/mediatek/mt76/sdio_txrx.c   |  2 +-
>  5 files changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 4029a2217397..8703ecd6396f 100644
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
> @@ -508,6 +508,7 @@ struct mt76_sdio {
>  =09struct work_struct stat_work;
> =20
>  =09u8 *xmit_buf;
> +=09u32 xmit_buf_sz;
> =20
>  =09struct sdio_func *func;
>  =09void *intr_data;
> @@ -1280,6 +1281,7 @@ void mt76u_queues_deinit(struct mt76_dev *dev);
> =20
>  int mt76s_init(struct mt76_dev *dev, struct sdio_func *func,
>  =09       const struct mt76_bus_ops *bus_ops);
> +u32 mt76s_get_xmit_buf_sz(struct mt76_dev *dev, u32 dev_xmit_sz);
>  int mt76s_alloc_rx_queue(struct mt76_dev *dev, enum mt76_rxq_id qid);
>  int mt76s_alloc_tx(struct mt76_dev *dev);
>  void mt76s_deinit(struct mt76_dev *dev);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7615/sdio.c
> index 554160b0ea9a..ed778b635391 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
> @@ -140,7 +140,8 @@ static int mt7663s_probe(struct sdio_func *func,
>  =09=09goto error;
>  =09}
> =20
> -=09mdev->sdio.xmit_buf =3D devm_kmalloc(mdev->dev, MT76S_XMIT_BUF_SZ,
> +=09mdev->sdio.xmit_buf_sz =3D mt76s_get_xmit_buf_sz(mdev, MT76S_XMIT_BUF=
_SZ);
> +=09mdev->sdio.xmit_buf =3D devm_kmalloc(mdev->dev, mdev->sdio.xmit_buf_s=
z,
>  =09=09=09=09=09   GFP_KERNEL);
>  =09if (!mdev->sdio.xmit_buf) {
>  =09=09ret =3D -ENOMEM;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/sdio.c
> index c58c14e28430..6e5d9e9459ad 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> @@ -154,7 +154,8 @@ static int mt7921s_probe(struct sdio_func *func,
>  =09=09goto error;
>  =09}
> =20
> -=09mdev->sdio.xmit_buf =3D devm_kmalloc(mdev->dev, MT76S_XMIT_BUF_SZ,
> +=09mdev->sdio.xmit_buf_sz =3D mt76s_get_xmit_buf_sz(mdev, MT76S_XMIT_BUF=
_SZ);
> +=09mdev->sdio.xmit_buf =3D devm_kmalloc(mdev->dev, mdev->sdio.xmit_buf_s=
z,
>  =09=09=09=09=09   GFP_KERNEL);
>  =09if (!mdev->sdio.xmit_buf) {
>  =09=09ret =3D -ENOMEM;
> diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wire=
less/mediatek/mt76/sdio.c
> index 54f72d215948..bd0027152026 100644
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
> @@ -299,6 +301,17 @@ int mt76s_hw_init(struct mt76_dev *dev, struct sdio_=
func *func, int hw_ver)
>  }
>  EXPORT_SYMBOL_GPL(mt76s_hw_init);
> =20
> +u32 mt76s_get_xmit_buf_sz(struct mt76_dev *dev, u32 dev_max_len)
> +{
> +=09struct sdio_func *func =3D dev->sdio.func;
> +=09u32 host_max_len =3D min_t(u32, func->card->host->max_req_size,
> +=09=09=09=09 func->cur_blksize *
> +=09=09=09=09 func->card->host->max_blk_count);
> +
> +=09return min_t(u32, host_max_len, dev_max_len);
> +}
> +EXPORT_SYMBOL_GPL(mt76s_get_xmit_buf_sz);

I think we can squash this patch with the previous one and move the code ab=
ove
in mt76s_init(). Agree?

Regards,
Lorenzo

> +
>  int mt76s_alloc_rx_queue(struct mt76_dev *dev, enum mt76_rxq_id qid)
>  {
>  =09struct mt76_queue *q =3D &dev->q_rx[qid];
> diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net=
/wireless/mediatek/mt76/sdio_txrx.c
> index a04cd2444247..9fcf507e09bd 100644
> --- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> +++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> @@ -254,7 +254,7 @@ static int mt76s_tx_run_queue(struct mt76_dev *dev, s=
truct mt76_queue *q)
>  =09=09}
> =20
>  =09=09pad =3D roundup(e->skb->len, 4) - e->skb->len;
> -=09=09if (len + e->skb->len + pad + 4 > MT76S_XMIT_BUF_SZ)
> +=09=09if (len + e->skb->len + pad + 4 > dev->sdio.xmit_buf_sz)
>  =09=09=09break;
> =20
>  =09=09if (mt76s_tx_pick_quota(sdio, mcu, e->buf_sz, &pse_sz,
> --=20
> 2.25.1
>=20

--YpJVo9IvTr9JUqYp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYd/sYQAKCRA6cBh0uS2t
rCjdAQCN1hwThldnbEpvYcvGhZENmpChApdMbqk2X1Nws6z5OAEA69kJvX6xla99
70vZd26qnaF6J/thjUIkOy878qR0vQI=
=/9DO
-----END PGP SIGNATURE-----

--YpJVo9IvTr9JUqYp--



--===============7509743226770880152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7509743226770880152==--


