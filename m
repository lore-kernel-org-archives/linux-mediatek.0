Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D94C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 09:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyIftf407z4LWsaIfkPKNbvdPE2ExWC6apXTJIL5404=; b=0xpPpaVC88VclutsXHUF+/5x7a
	1xLYK0iviVKyAzqEKNVEkKvpoy4s0q9qh65CgLW7dXo8+5D2viRKD9GyNz2APF+jJc2pEY+YZQqtu
	IlqlIPOm6/A2xk1P7HzOBRdd43LdIipXQxVegoiz3DdSJFdeT7N+1ZLBqlfOFQaVhmKfj4YiJJAkh
	GreFFQ6Tx8SNcRIRBfGwEmgZuW/ZTBi7Vsv7qrgBUH18hW7f9BGMjXnp4fQI2/m/hWlh8BEIEHulQ
	blWVdBb4jTkwTL6M9BSssdCgRe/lovqNFkpcXZkUWLlV1vJO38ijYSZ2XIePnTVuk+dcyAudr/K4Y
	jn8R4Jag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Cs3-00BY6f-UG; Mon, 19 Dec 2022 09:55:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Crw-00BY0o-G1
	for linux-mediatek@lists.infradead.org; Mon, 19 Dec 2022 09:55:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 17F6A60DF3;
	Mon, 19 Dec 2022 09:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1960C433D2;
	Mon, 19 Dec 2022 09:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671443734;
	bh=FVHUfLGk+FwVencu3d0d7zbOlfjP8sAC3w4aJrESkqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAE/HLqWA47hFGR/Zlli4C+3R6DLNKkZV62sbQLuveqxzMYRhVWlUjKJBGgrlQImM
	 iv9Lb0oEjuMFlNUzhoHQAqglNNFi84IXTM/l8q35DAXAfLJ222zLgrnN8k6Dc4eMqW
	 mif+JnyV3RQUYwxPV3f1wttYR2Ha8RoDKUPZQEXG9IT3en6vC7ydUHEm8ubDkeHFoG
	 OEymUecbkyHxiEsDJsI5DEpOnu+YacCuL6jhvgB8pLIlYKSe5Q6Eqb8985qgQQ/m+z
	 32mIPr+3Zn1+dSbKr7i3ZnOGjW9mQ6PcRds/pvV4Uz3AfAzP4HSIklTjSj1q1lCg2g
	 YJAIXHNYaQ1Gg==
Date: Mon, 19 Dec 2022 10:55:30 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: mt76: fix potential memory leakage
Message-ID: <Y6A1Et1yzcWnWhpy@lore-desk>
References: <0a218783098a6b1b90ff120c7182acee93dc8feb.1671423784.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GYX6T5wvBRqxBDpz"
Content-Disposition: inline
In-Reply-To: <0a218783098a6b1b90ff120c7182acee93dc8feb.1671423784.git.Bo.Jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_015536_653607_28DBB63F 
X-CRM114-Status: GOOD (  20.02  )
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


--GYX6T5wvBRqxBDpz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Bo Jiao <Bo.Jiao@mediatek.com>
>=20
> fix potential memory leakage, recycle rxwi when mt76_dma_add_buf() call f=
ail.
>=20
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> ---
> v2:
> - recycle rxwi when page_frag_alloc() and dma_map_single() fail.
> ---
>  drivers/net/wireless/mediatek/mt76/dma.c | 27 ++++++++++++++----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wirel=
ess/mediatek/mt76/dma.c
> index fc24b35..76ad47d 100644
> --- a/drivers/net/wireless/mediatek/mt76/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/dma.c
> @@ -580,24 +580,29 @@ mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_=
queue *q)
> =20
>  		buf =3D page_frag_alloc(&q->rx_page, q->buf_size, GFP_ATOMIC);
>  		if (!buf)
> -			break;
> +			goto out;
> =20
>  		addr =3D dma_map_single(dev->dma_dev, buf, len, DMA_FROM_DEVICE);
> -		if (unlikely(dma_mapping_error(dev->dma_dev, addr))) {
> -			skb_free_frag(buf);
> -			break;
> -		}
> +		if (unlikely(dma_mapping_error(dev->dma_dev, addr)))
> +			goto free;
> =20
>  		qbuf.addr =3D addr + offset;
>  		qbuf.len =3D len - offset;
>  		qbuf.skip_unmap =3D false;
> -		if (mt76_dma_add_buf(dev, q, &qbuf, 1, 0, buf, t) < 0) {
> -			dma_unmap_single(dev->dma_dev, addr, len,
> -					 DMA_FROM_DEVICE);
> -			skb_free_frag(buf);
> -			break;
> -		}
> +		if (mt76_dma_add_buf(dev, q, &qbuf, 1, 0, buf, t) < 0)
> +			goto umap;
> +
>  		frames++;
> +		continue;
> +
> +umap:
> +		dma_unmap_single(dev->dma_dev, addr, len,
> +				 DMA_FROM_DEVICE);
> +free:
> +		skb_free_frag(buf);
> +out:
> +		mt76_put_rxwi(dev, t);
> +		break;
>  	}
> =20
>  	if (frames)

Hi Bo,

I guess in the way below, the code is more readable, what do you think?

Regards,
Lorenzo

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireles=
s/mediatek/mt76/dma.c
index fad5fe19fe18..001538f698f1 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -571,13 +571,6 @@ mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_que=
ue *q)
 		struct mt76_queue_buf qbuf;
 		void *buf =3D NULL;
=20
-		if ((q->flags & MT_QFLAG_WED) &&
-		    FIELD_GET(MT_QFLAG_WED_TYPE, q->flags) =3D=3D MT76_WED_Q_RX) {
-			t =3D mt76_get_rxwi(dev);
-			if (!t)
-				break;
-		}
-
 		buf =3D page_frag_alloc(&q->rx_page, q->buf_size, GFP_ATOMIC);
 		if (!buf)
 			break;
@@ -588,16 +581,27 @@ mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_qu=
eue *q)
 			break;
 		}
=20
+		if ((q->flags & MT_QFLAG_WED) &&
+		    FIELD_GET(MT_QFLAG_WED_TYPE, q->flags) =3D=3D MT76_WED_Q_RX) {
+			t =3D mt76_get_rxwi(dev);
+			if (!t)
+				goto unmap;
+		}
+
 		qbuf.addr =3D addr + offset;
 		qbuf.len =3D len - offset;
 		qbuf.skip_unmap =3D false;
-		if (mt76_dma_add_buf(dev, q, &qbuf, 1, 0, buf, t) < 0) {
-			dma_unmap_single(dev->dma_dev, addr, len,
-					 DMA_FROM_DEVICE);
-			skb_free_frag(buf);
-			break;
+
+		if (!mt76_dma_add_buf(dev, q, &qbuf, 1, 0, buf, t)) {
+			frames++;
+			continue;
 		}
-		frames++;
+
+unmap:
+		dma_unmap_single(dev->dma_dev, addr, len, DMA_FROM_DEVICE);
+		skb_free_frag(buf);
+		mt76_put_rxwi(dev, t);
+		break;
 	}
=20
 	if (frames)

> --=20
> 2.18.0
>=20

--GYX6T5wvBRqxBDpz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY6A1EgAKCRA6cBh0uS2t
rBwPAQD44i+a+7jteXHTxdG433JNJtOhfHYBcIa/JOOLWl61SQD+J+RUiW2LG8BU
LnZeQn1Ykxqe0g+zW03IxQfjXMv7qw0=
=27vm
-----END PGP SIGNATURE-----

--GYX6T5wvBRqxBDpz--

