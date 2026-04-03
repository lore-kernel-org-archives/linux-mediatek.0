Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2DAE85367
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2026 13:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2Xlm/PN5fGPQUkHz4pa/ilL9G35CycqwLHfLuWA/Rw=; b=SdJZWZm/rOQ06waCSihZQCedxu
	ADzwZRfkLZiS+ohRPxWuL/enNA0Go+/fB7d4K3cUVo1zgWK8wgvaIbCKY/h3+LdnUpFo5NUGL1E6k
	oF5Fx7MKRIQfpbk9hIvvMzAcKnzSnFLWFMGIGAov9s7gfKrYUl9cTW6B9K1t6Ofa4+1E/CJ7m1PU4
	D3BfwOhnpDoYRrbC1Lg3aV0DD7esDB7zZeLGkj722vU9DOuY5SeSZbkNDUULLPiLzvseMpTxP7CMp
	dPc4fjFlctDi/G1rggodKVrgu+lWe+6tvJt0CkTyWJKHdBSOmTl2dNB2V3MEm99h1oN5m1/BlLzoy
	+vxxpQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8eln-0000000254u-2cIM;
	Fri, 03 Apr 2026 13:41:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8elm-0000000254d-1kD3;
	Fri, 03 Apr 2026 13:41:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94AC460008;
	Fri,  3 Apr 2026 13:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBF5C4CEF7;
	Fri,  3 Apr 2026 13:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775223665;
	bh=6g9R2GmeiAMhntpDVU6Z92dvhCYleNtqjiM/Wc8jXvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDKEbgHtwO03Htxu7Te0gFEyIE7S3X0OzU+6jR8id9x1tcxbx7oQlB7szyGVgVM++
	 8hv0gQoSXTfIpRCFzOwPlc5SqASExfYZLMBSKdzJWUr57pFARA/xO9fe/VqHrmB3J9
	 z3XBsFBk2Frzm56C5TsAqp6dqTZidHelQPtveZmEhjrEFcq+7m2BE6qqTDoEUwB529
	 ykcvOq++MF4mKlu5NkwAKszZ+FoWBVBROGg/Zmq29nsfpq6K3Xkbfv5TuVc0te1XZF
	 sC9VXKsEtrNhcXCN5Q3fBya2guGh3EfHEUlJcDqmYgQHXac8dvrQZ7IUWsorWXlWJC
	 Twa4nECx+zudg==
Date: Fri, 3 Apr 2026 15:41:03 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Xuegang Lu <xuegang.lu@airoha.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Add dma_rmb() and READ_ONCE() in
 airoha_qdma_rx_process()
Message-ID: <ac_Dbzfgr728lpmD@lore-desk>
References: <20260402-airoha_qdma_rx_process-fix-reordering-v1-1-53278474f062@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CcLH+/Yb/7WuJ8OG"
Content-Disposition: inline
In-Reply-To: <20260402-airoha_qdma_rx_process-fix-reordering-v1-1-53278474f062@kernel.org>
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


--CcLH+/Yb/7WuJ8OG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add missing dma_rmb() in airoha_qdma_rx_process routine to make sure the
> DMA read operations are completed when the NIC reports the processing on
> the current descriptor is done. Moreover, add missing READ_ONCE() in
> airoha_qdma_rx_process() for DMA descriptor control fields in order to
> avoid any compiler reordering.
>=20
> Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581=
 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Please drop this version, I will post v2 to add a missing READ_ONCE() for
airoha_qdma_get_gdm_port().

Regards,
Lorenzo

>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 95ba99b89428e4cafb91ff7813e43ffeb38e6d9b..29dea8b35f64bfdcf88bc09fd=
711e0d8b4f7b6fa 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -612,15 +612,17 @@ static int airoha_qdma_rx_process(struct airoha_que=
ue *q, int budget)
>  	while (done < budget) {
>  		struct airoha_queue_entry *e =3D &q->entry[q->tail];
>  		struct airoha_qdma_desc *desc =3D &q->desc[q->tail];
> -		u32 hash, reason, msg1 =3D le32_to_cpu(desc->msg1);
> -		struct page *page =3D virt_to_head_page(e->buf);
> -		u32 desc_ctrl =3D le32_to_cpu(desc->ctrl);
> +		u32 hash, reason, msg1, desc_ctrl;
>  		struct airoha_gdm_port *port;
>  		int data_len, len, p;
> +		struct page *page;
> =20
> +		desc_ctrl =3D le32_to_cpu(READ_ONCE(desc->ctrl));
>  		if (!(desc_ctrl & QDMA_DESC_DONE_MASK))
>  			break;
> =20
> +		dma_rmb();
> +
>  		q->tail =3D (q->tail + 1) % q->ndesc;
>  		q->queued--;
> =20
> @@ -637,6 +639,7 @@ static int airoha_qdma_rx_process(struct airoha_queue=
 *q, int budget)
>  		if (p < 0 || !eth->ports[p])
>  			goto free_frag;
> =20
> +		page =3D virt_to_head_page(e->buf);
>  		port =3D eth->ports[p];
>  		if (!q->skb) { /* first buffer */
>  			q->skb =3D napi_build_skb(e->buf, q->buf_size);
> @@ -670,8 +673,8 @@ static int airoha_qdma_rx_process(struct airoha_queue=
 *q, int budget)
>  			 * DMA descriptor. Report DSA tag to the DSA stack
>  			 * via skb dst info.
>  			 */
> -			u32 sptag =3D FIELD_GET(QDMA_ETH_RXMSG_SPTAG,
> -					      le32_to_cpu(desc->msg0));
> +			u32 msg0 =3D le32_to_cpu(READ_ONCE(desc->msg0));
> +			u32 sptag =3D FIELD_GET(QDMA_ETH_RXMSG_SPTAG, msg0);
> =20
>  			if (sptag < ARRAY_SIZE(port->dsa_meta) &&
>  			    port->dsa_meta[sptag])
> @@ -679,6 +682,7 @@ static int airoha_qdma_rx_process(struct airoha_queue=
 *q, int budget)
>  						  &port->dsa_meta[sptag]->dst);
>  		}
> =20
> +		msg1 =3D le32_to_cpu(READ_ONCE(desc->msg1));
>  		hash =3D FIELD_GET(AIROHA_RXD4_FOE_ENTRY, msg1);
>  		if (hash !=3D AIROHA_RXD4_FOE_ENTRY)
>  			skb_set_hash(q->skb, jhash_1word(hash, 0),
>=20
> ---
> base-commit: ec7067e661193403a7a00980bda8612db5954142
> change-id: 20260402-airoha_qdma_rx_process-fix-reordering-722308255b65
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--CcLH+/Yb/7WuJ8OG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCac/DbgAKCRA6cBh0uS2t
rBFGAQDsASA4qELdeIETxjOVDrs0SEJPliW3Cdlk2di93gqB1gD+J5i5KV2KXaow
NB6Aity+4OCEK19fVTDOFqX39VIASgA=
=NVjB
-----END PGP SIGNATURE-----

--CcLH+/Yb/7WuJ8OG--

