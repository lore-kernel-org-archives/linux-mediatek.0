Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3F2CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 10:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjERTvaa9EEzQe9yII8+YO9vBb1Fh29QvOVPGQCTg7o=; b=0jgD6mW7HZmG196Q3s9X5LlQP+
	xMedwpMCjgmCaWm9c/J2oeXauFLh6bu4qEP/9xf9/BK+tGdJetAqYglftIQcXPm2X8wS/CBy19b0v
	Zr2C2Dv5q+d+XfvMivlW2MHWp7kadtHjoekPKb4jX1zfywV3hk+Mt7MYcU8Adrrlg47M2WwGit+LR
	9gvD2Ta1l/q3OCBoWmYT+5L9mp0UrCaQlg9IVAOWD+Le33aLlsUaz5ihUGSHFUKBUb//gTS7lVChd
	1T6+DD7m+FuJwquXiZNtD/awKVFr/KNgJKCp+z3T1yyrm96g4FupFjaxSIbICeCe5BhDipPwmsd8d
	SbcLZMjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGbCz-0000000DVz0-0zvG;
	Wed, 05 Nov 2025 10:57:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGbCw-0000000DVye-3JBn
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 10:57:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C0D241863;
	Wed,  5 Nov 2025 10:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E36AC4CEF8;
	Wed,  5 Nov 2025 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762340261;
	bh=3I8GbCHt5nTmU/JAMrsYsToDtzFmmsTntkvfOBdvXZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VP7QuCamQd/tRJxLVttNOyNtOVZ8NvC2zDj9rhj1GkzET5vT4/hWC1/BbDLPr8WmU
	 Qrt92K5Jarf2QwW23HEPNQFJ9jlxKsCguyumeqZF48q2wRpgIILuRYbyRhvi7hrMBZ
	 jTbfTHg1/IuY2fwdgjJrRR1Csw11ZexAMypLrDZLhQappW9gwYEv1mWNk3X5aVXkmo
	 2scjSbAqCe55130pTdTLdIn0pAjq27gfBJ5PZ+6BmgF+RMFCdqWuKHmCPWs3s8a7iL
	 RP+hDzW/DdhznqWIvRfNwrZJNJ3zW4UXzzIdi7+AhZReq10uo4tpYPDKHGnUAQZ8G9
	 PPsTh9zV4J5gA==
Date: Wed, 5 Nov 2025 11:57:39 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Rex Lu <rex.lu@mediatek.com>
Subject: Re: [PATCH mt76 12/12] wifi: mt76: mt7996: fix EMI rings for RRO
Message-ID: <aQstowRMsLD-6A-z@lore-desk>
References: <20251105093100.541408-1-shayne.chen@mediatek.com>
 <20251105093100.541408-12-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DwZumMumnql1tOgs"
Content-Disposition: inline
In-Reply-To: <20251105093100.541408-12-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_025742_885500_C07934FF 
X-CRM114-Status: GOOD (  19.38  )
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


--DwZumMumnql1tOgs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 05, Shayne Chen wrote:
> The RRO EMI rings only need to be allocated when WED is not active.
> This patch fixes command timeout issue for the setting of WED off and
> RRO on.
>=20
> Fixes: 3a29164425e9 ("wifi: mt76: mt7996: Add SW path for HW-RRO v3.1")
> Co-developed-by: Rex Lu <rex.lu@mediatek.com>
> Signed-off-by: Rex Lu <rex.lu@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  .../net/wireless/mediatek/mt76/mt7996/dma.c   | 15 +++++++++------
>  .../net/wireless/mediatek/mt76/mt7996/init.c  | 19 ++++++++++++++++---
>  2 files changed, 25 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/dma.c
> index 7ac4defca29d..274b273df1ee 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
> @@ -515,12 +515,15 @@ int mt7996_dma_rro_init(struct mt7996_dev *dev)
>  		if (ret)
>  			return ret;
> =20
> -		/* We need to set cpu idx pointer before resetting the EMI
> -		 * queues.
> -		 */
> -		mdev->q_rx[MT_RXQ_RRO_RXDMAD_C].emi_cpu_idx =3D
> -			&dev->wed_rro.emi_rings_cpu.ptr->ring[0].idx;
> -		mt76_queue_reset(dev, &mdev->q_rx[MT_RXQ_RRO_RXDMAD_C], true);
> +		if (!mtk_wed_device_active(&mdev->mmio.wed)) {
> +			/* We need to set cpu idx pointer before resetting the
> +			 * EMI queues.
> +			 */
> +			mdev->q_rx[MT_RXQ_RRO_RXDMAD_C].emi_cpu_idx =3D
> +				&dev->wed_rro.emi_rings_cpu.ptr->ring[0].idx;
> +			mt76_queue_reset(dev, &mdev->q_rx[MT_RXQ_RRO_RXDMAD_C],
> +					 true);
> +		}
>  		goto start_hw_rro;
>  	}
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/init.c
> index bd7b720c64c5..00a8286bd136 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
> @@ -960,9 +960,10 @@ static int mt7996_wed_rro_init(struct mt7996_dev *de=
v)
>  		       MT7996_RRO_MSDU_PG_SIZE_PER_CR);
>  	}
> =20
> -	if (dev->mt76.hwrro_mode =3D=3D MT76_HWRRO_V3_1) {
> +	if (!mtk_wed_device_active(&dev->mt76.mmio.wed) &&
> +	    dev->mt76.hwrro_mode =3D=3D MT76_HWRRO_V3_1) {
>  		ptr =3D dmam_alloc_coherent(dev->mt76.dma_dev,
> -					  sizeof(dev->wed_rro.emi_rings_cpu.ptr),
> +					  sizeof(*dev->wed_rro.emi_rings_cpu.ptr),
>  					  &dev->wed_rro.emi_rings_cpu.phy_addr,
>  					  GFP_KERNEL);
>  		if (!ptr)
> @@ -971,7 +972,7 @@ static int mt7996_wed_rro_init(struct mt7996_dev *dev)
>  		dev->wed_rro.emi_rings_cpu.ptr =3D ptr;
> =20
>  		ptr =3D dmam_alloc_coherent(dev->mt76.dma_dev,
> -					  sizeof(dev->wed_rro.emi_rings_dma.ptr),
> +					  sizeof(*dev->wed_rro.emi_rings_dma.ptr),
>  					  &dev->wed_rro.emi_rings_dma.phy_addr,
>  					  GFP_KERNEL);
>  		if (!ptr)
> @@ -1037,6 +1038,18 @@ static void mt7996_wed_rro_free(struct mt7996_dev =
*dev)
>  				   dev->wed_rro.msdu_pg[i].phy_addr);
>  	}
> =20
> +	if (dev->wed_rro.emi_rings_cpu.ptr)
> +		dmam_free_coherent(dev->mt76.dma_dev,
> +				   sizeof(*dev->wed_rro.emi_rings_cpu.ptr),
> +				   dev->wed_rro.emi_rings_cpu.ptr,
> +				   dev->wed_rro.emi_rings_cpu.phy_addr);
> +
> +	if (dev->wed_rro.emi_rings_dma.ptr)
> +		dmam_free_coherent(dev->mt76.dma_dev,
> +				   sizeof(*dev->wed_rro.emi_rings_dma.ptr),
> +				   dev->wed_rro.emi_rings_dma.ptr,
> +				   dev->wed_rro.emi_rings_dma.phy_addr);
> +
>  	if (!dev->wed_rro.session.ptr)
>  		return;
> =20
> --=20
> 2.51.0
>=20

--DwZumMumnql1tOgs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaQstowAKCRA6cBh0uS2t
rMQnAP9Wh3rDrj6yxrdedGGUlehqj9A1BUSgXjH6lWCmX23F2AEAixqZfaNIXbCa
UCSL3uJgQAO5MzaJyaFCn/tVm92hJgY=
=2gfS
-----END PGP SIGNATURE-----

--DwZumMumnql1tOgs--

