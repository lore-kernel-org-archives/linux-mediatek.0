Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FD2C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 10:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZ/m2nv2wFuD8e/xXaSO7CKmp+3A0bAq1k75FNHJdTU=; b=U7z3OKTUXgkKC3VE1AqC97dJ2h
	7S5UgWYXzAB9HrAKCPmcOie7lzYG3vXau35YpOl5poK1QXoxWmY1UMQo1QjtKgT0y744K8pJZ0+8Q
	DaAwgCL9l4Bp4x6C3wykqCDtIu0ElGO9IsbqkChhYNzpABayIjJ+DscU9qgNH+R7NUZEpom5nKGRp
	r+Bg3QHfUxa908P090NUjrTOV8jr+2T06kRy1+KDuDJaYW048CMdfUaSlVbG37oSaiSHodECCd9e5
	oHKOWt2e9DpBr+ViFuz7wiMqbQmiJlT6Ka//tq2CBtt5+yCYoMOPwxcoo7ntK9vta5kFkl8G5B5zD
	Ar8CYCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wO4-00DT8k-KW; Wed, 21 Dec 2022 10:31:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wIy-00DPcX-0I
	for linux-mediatek@lists.infradead.org; Wed, 21 Dec 2022 10:26:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D8ABECE1774;
	Wed, 21 Dec 2022 10:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62BEC433D2;
	Wed, 21 Dec 2022 10:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671618385;
	bh=vX5YCsGjJRB4RCj7GNynp2IUhgssJobCUhxfzQJjB+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jf6cVpE5cjFigkl95FcmSS2mVuEvejcwjXRb9wNQojkN9ee6otVvbpSz6ioCBfmSX
	 TsYUWENSp0eNODdZs4uuyAo0h0X1kLTyWrOQwKPjZ6Fbj2uJcYDkfm49CEwvRfHyHm
	 QSCVfQ41LuUpP+9jzZJXqeh0bsl2jSg1uwcgxlATB/menVwcz/Zj5IBsaYEOcOAlgJ
	 VgwYjhm569FLwyTZB7EVTuXC21Z0JpTdA7XuDMa7kedW0qYxu3HNK6pLmMxeQbG6BN
	 XZH172uOuklJxORO6GSZ8Pjd2bo6AxCF04/fwNdffuv8lzyfTbuszlrJaGW4VxWVGk
	 Xy/wY4qr9Wt6g==
Date: Wed, 21 Dec 2022 11:26:21 +0100
From: "lorenzo@kernel.org" <lorenzo@kernel.org>
To: Sujuan Chen =?utf-8?B?KOmZiOe0oOWonyk=?= <Sujuan.Chen@mediatek.com>
Cc: Bo Jiao =?utf-8?B?KOeEpuazoik=?= <Bo.Jiao@mediatek.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Shayne Chen =?utf-8?B?KOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
	"nbd@nbd.name" <nbd@nbd.name>,
	Evelyn Tsai =?utf-8?B?KOiUoeePiumIuik=?= <Evelyn.Tsai@mediatek.com>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: mt76: fix potential memory leakage
Message-ID: <Y6LfTUoSZ8W/gJ0Y@lore-desk>
References: <0a218783098a6b1b90ff120c7182acee93dc8feb.1671423784.git.Bo.Jiao@mediatek.com>
 <Y6A1Et1yzcWnWhpy@lore-desk>
 <9d8aa92e3650128c94af91435a222c00ff2acb1c.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SyFKwzvfz74vbiYO"
Content-Disposition: inline
In-Reply-To: <9d8aa92e3650128c94af91435a222c00ff2acb1c.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_022632_540351_C5D35E09 
X-CRM114-Status: GOOD (  19.36  )
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


--SyFKwzvfz74vbiYO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[...]

> Hi Lore,

Hi Sujuan,

>=20
> we love your patch, but we have another patch to avoid memory
> fragmentation by duplicating the rx skb after mt76_dma_dequeue(). it
> requires mt76_get_rxwi() be placed before page_frag_alloc().
>=20
> the below patch(need rebase) will be sent after the current patch is
> accepted.
>=20
> --- a/drivers/net/wireless/mediatek/mt76/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/dma.c
> @@ -386,9 +386,11 @@ mt76_dma_get_buf(struct mt76_dev *dev, struct
> mt76_queue *q, int idx,
>                                  SKB_WITH_OVERHEAD(q->buf_size),
>                                  DMA_FROM_DEVICE);
>=20
> -               buf =3D t->ptr;
> +               buf =3D page_frag_alloc(&q->rx_page, q->buf_size,
> GFP_ATOMIC);
> +               if (!buf)
> +                       return NULL;
> +               memcpy(buf, t->ptr, SKB_WITH_OVERHEAD(q->buf_size));

We this approach we still need to allocate the buffer (in mt76_dma_get_buf()
instead of mt76_dma_rx_fill()) but we need even to copy the full buffer that
can be pretty expensive instead of relying on the DMA, so I would avoid this
approach.

Regards,
Lorenzo

>                 t->dma_addr =3D 0;
> -               t->ptr =3D NULL;
>=20
>                 mt76_put_rxwi(dev, t);
>=20
> @@ -569,6 +571,7 @@ mt76_dma_rx_fill(struct mt76_dev *dev, struct
> mt76_queue *q)
>         while (q->queued < q->ndesc - 1) {
>                 struct mt76_txwi_cache *t =3D NULL;
>                 struct mt76_queue_buf qbuf;
> +               bool skip_alloc =3D false;
>                 void *buf =3D NULL;
>=20
>                 if ((q->flags & MT_QFLAG_WED) &&
> @@ -576,11 +579,19 @@ mt76_dma_rx_fill(struct mt76_dev *dev, struct
> mt76_queue *q)
>                         t =3D mt76_get_rxwi(dev);
>                         if (!t)
>                                 break;
> +
> +                       if (t->ptr) {
> +                               skip_alloc =3D true;
> +                               buf =3D t->ptr;
> +                       }
>                 }
>=20
> -               buf =3D page_frag_alloc(&q->rx_page, q->buf_size,
> GFP_ATOMIC);
> -               if (!buf)
> -                       break;
> +               if (!skip_alloc) {
> +                       buf =3D page_frag_alloc(&q->rx_page, q->buf_size,
> +                                             GFP_ATOMIC);
> +                       if (!buf)
> +                               break;
> +               }
>=20
>                 addr =3D dma_map_single(dev->dma_dev, buf, len,
> DMA_FROM_DEVICE);
>                 if (unlikely(dma_mapping_error(dev->dma_dev, addr))) {
> --
> 2.18.0
>=20
> > > --=20
> > > 2.18.0
> > >=20

--SyFKwzvfz74vbiYO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY6LfTQAKCRA6cBh0uS2t
rBF/AP0ce3mIwZ/Uk5Zj1Y0rWsZg6hECTlHMNDdzISxhS4OuiwD/RSy8M9Sf3rVK
R4S5GCzFMqSqiU0ogdBVoRnk0nsccg0=
=wWbO
-----END PGP SIGNATURE-----

--SyFKwzvfz74vbiYO--

