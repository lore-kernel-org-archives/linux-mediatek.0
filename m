Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED54C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRWldEfKotFz0RFdvk3K7yQLwFVfCSqWSdZVW6pQ84g=; b=g7IvuVidw63OSsGEH81hLOg6ua
	+ugQ1GNTwXkl6haq8DZFGWRdvKV1b4GIM8ndu8hxN9ahEJeQcJikWyOfapGEjGrREfbl6Q49zgQzZ
	xwDKDL3xYlukP9J/Ccv2NBBjX7YIrnrsAikWduIeYayXoMF0Is+pmpwZpE1tECjXtLJ0yiNlAv/05
	ZOq+HBlMAwzdTDGZqzesCwEoZODBWMzEPTMOXYVLWf8+1OWT1Fh7tM9xxNv25U3EyvLGJ5YbKQRy6
	9LJ/PQtVaDAtUR/XSlEBPN1fTTE0Rt2chlhTFIJA6GMcjs54WCDIeK7XcBdHRW9uQw0V/rCQbJ+Tq
	ZGnE7+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRqP-0000000H9aD-19HZ;
	Wed, 08 Jul 2026 12:57:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRqO-0000000H9Zf-2e9n;
	Wed, 08 Jul 2026 12:57:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 179A960054;
	Wed,  8 Jul 2026 12:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F481F000E9;
	Wed,  8 Jul 2026 12:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783515459;
	bh=qRWldEfKotFz0RFdvk3K7yQLwFVfCSqWSdZVW6pQ84g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TgoZy0kS3bz79fZjR9pb0xVWBZcQ38mOq5nUZTlP1W5U7hHHvwuUMWxW/RteOsLR6
	 vheU6GNS9szCoKdTolmTKXZy4MZr3JRDAt4bbyWMdIPFdR7Iq1/ubyLY6z6mymZ8cb
	 4sZelPFPMfAwghJQ1QNXlLKwPgKs3Q+Z8HFdXo1CkTrrtbCp5ieCmiPIieyQNTk9AQ
	 FCD2REueExEfHu0hgQ4uXjNRnKdYKJ6E8uY0pdxPkCRP+8K1M4DEVEIwGupeJEKf2y
	 OqzaHPxKmpCOi+hje6tEswt6x9HOHJCG+KJBPN1EzmotWRjqA4f6yasvNAUZxNFoSa
	 nJzuJJGTVhj9g==
Date: Wed, 8 Jul 2026 14:57:37 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: airoha: Fix DMA direction for NPU mailbox buffer
Message-ID: <ak5JQZwD2D4ogWw3@lore-desk>
References: <178351055214.98729.11403147818632027428@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fqtiECgthKw6C3p6"
Content-Disposition: inline
In-Reply-To: <178351055214.98729.11403147818632027428@gmail.com>
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


--fqtiECgthKw6C3p6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> airoha_npu_send_msg() always maps the mailbox buffer with DMA_TO_DEVICE,
> but some callers expect the NPU to write response data back into the
> same buffer:
>=20
> - airoha_npu_wlan_msg_get() (NPU_OP_GET): NPU writes response into
>   the buffer, then the caller reads it via memcpy()
> - airoha_npu_ppe_stats_setup() (NPU_OP_SET): NPU writes back
>   npu_stats_addr field in the response
>=20
> On non-cache-coherent architectures like EN7581 (Cortex-A53 without
> hardware cache coherency for NPU DMA), DMA_TO_DEVICE unmap is a no-op
> =E2=80=94 it does not invalidate the CPU cache. If the NPU-written cache =
line
> is still present in the CPU cache when the caller reads the buffer,
> the CPU observes stale data instead of the NPU response.
>=20
> This is a timing-sensitive bug: small mailbox buffers (~24 bytes)
> typically fit in a single cache line and may survive in the cache
> until the caller reads them, producing silent data corruption rather
> than a crash. The bug is more likely to trigger when the caller reads
> the response immediately after dma_unmap_single() without intervening
> cache-evicting operations.
>=20
> Fix by using DMA_BIDIRECTIONAL for both map and unmap, which ensures
> dma_unmap_single() invalidates the CPU cache on non-coherent systems.
> The mailbox buffers are small so there is no performance concern.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Fixes: c52918744ee1e49cea86622a2633b9782446428f ("net: airoha: npu: Move =
memory allocation in airoha_npu_send_msg() caller")
> Signed-off-by: Wayen Yan <win847@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_npu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index 870d61fdd9c6..b679bed952de 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -168,7 +168,7 @@ static int airoha_npu_send_msg(struct airoha_npu *npu=
, int func_id,
>  	dma_addr_t dma_addr;
>  	int ret;
> =20
> -	dma_addr =3D dma_map_single(npu->dev, p, size, DMA_TO_DEVICE);
> +	dma_addr =3D dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
>  	ret =3D dma_mapping_error(npu->dev, dma_addr);
>  	if (ret)
>  		return ret;
> @@ -191,7 +191,7 @@ static int airoha_npu_send_msg(struct airoha_npu *npu=
, int func_id,
> =20
>  	spin_unlock_bh(&npu->cores[core].lock);
> =20
> -	dma_unmap_single(npu->dev, dma_addr, size, DMA_TO_DEVICE);
> +	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
> =20
>  	return ret;
>  }
> --=20
> 2.51.0
>=20
>=20

--fqtiECgthKw6C3p6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCak5JQQAKCRA6cBh0uS2t
rEkuAQDBR2AU7po/548CG9jgOQ4FrFUOWREXpwLycau0KwabmgEAoT0GbuBjIF0v
B0mV4hsyWdRr1ux3Q6bkcxszl+YIfwg=
=TO0g
-----END PGP SIGNATURE-----

--fqtiECgthKw6C3p6--

