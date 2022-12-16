Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D818FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KUkaPhFdhrJTbaSX6LPrBedEqwsNtmY+GCPOKSfpWQ=; b=oxYRiVHw+tgSTxm/LmohxMlN2G
	W61s6T10DJ7ycZ+diPu+9w7tS82xaXyyyFKzbSUu8Fs1veHXYeKK/p/vLE8QxyqzphAS+uDXhUMw8
	tfkTqj31mAO7RnOAOG5lT3zzgoIb940L9DYUEUpIgw5AjDOQVD5H0YwvaiIHQAVY6TFmSJVAfHvRM
	Sf3cgJNTmxBZEZXfVxN94fp2owpODzHy9SqqlFtPVpXTWEaJGCMa0UIpoeoVKF+qwDz6qnZDSFahj
	AYmVZZr0eq203oGMdi5BZCaUGczmM4Hw3MelFWgAfuhYK1DBAx9zVKW4SX8a2BuPktAmSbgJ/nBpB
	oqGxQ4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Dss-00GaaW-8Q; Fri, 16 Dec 2022 16:48:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Dsp-00GaX7-Uo
	for linux-mediatek@lists.infradead.org; Fri, 16 Dec 2022 16:48:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AEEF6B81DD0;
	Fri, 16 Dec 2022 16:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA999C433D2;
	Fri, 16 Dec 2022 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671209304;
	bh=jyl/zC15tNhZDmBGJE+3qLmjSeuFuNsHM8XNNGU5gQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMnE57b0hxgZX7IWHY/j8UL+kmKQ24u24QvVKoQ2xy7jZAGERfkdn9XlHDaWH6s1k
	 QfPOzaNEYXOqjhvO6cJA80XBKT93kVnZD/0tAL0g4DTeRhmoRzmR0T3hwvQKh7QMFY
	 nanEVY9vpLxUBUi9E5tqrVozSx782+aL733UaAdf2dYPPUuv6Wr45C1pOj9od2gBSx
	 B9ytBTqj4U12GIEmHfFZOz5NnobreAsCcA+7hjVOOaMH8uX1aTYghLiqXLW/nlGgmD
	 CGmtjq1CZSshYJbPiKYMKErOKMyC/F2sYhXJdSLx0OVrQvpTVcFqNgaGSItnK0I9nA
	 isctU2UWnCMUw==
Date: Fri, 16 Dec 2022 17:48:20 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] wifi: mt76: fix potential memory leakage
Message-ID: <Y5yhVN0lwPOyq6oP@lore-desk>
References: <c663e984077ae903d8d4d34ed470986c6ccb4757.1671157658.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kytPndXVJDl+F4EW"
Content-Disposition: inline
In-Reply-To: <c663e984077ae903d8d4d34ed470986c6ccb4757.1671157658.git.Bo.Jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_084828_180006_E0EADA44 
X-CRM114-Status: GOOD (  13.41  )
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


--kytPndXVJDl+F4EW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Bo Jiao <Bo.Jiao@mediatek.com>
>=20
> fix potential memory leakage, recycle rxwi when mt76_dma_add_buf() call f=
ails.
>=20
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/dma.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wirel=
ess/mediatek/mt76/dma.c
> index fc24b35..9053344 100644
> --- a/drivers/net/wireless/mediatek/mt76/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/dma.c
> @@ -592,6 +592,7 @@ mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_qu=
eue *q)
>  		qbuf.len =3D len - offset;
>  		qbuf.skip_unmap =3D false;
>  		if (mt76_dma_add_buf(dev, q, &qbuf, 1, 0, buf, t) < 0) {
> +			mt76_put_rxwi(dev, t);

I think we should add it even if page_frag_alloc or dma_map_single fail.

Regards,
Lorenzo

>  			dma_unmap_single(dev->dma_dev, addr, len,
>  					 DMA_FROM_DEVICE);
>  			skb_free_frag(buf);
> --=20
> 2.18.0
>=20

--kytPndXVJDl+F4EW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY5yhVAAKCRA6cBh0uS2t
rBTHAP9ya7XWNqF0ld0OIGv50h74+PKRugcN9VCTYk8bV6qaUQEA+wPVmG/pCeCn
jNfS+uiMW1sWTJOALvATPDJm+kvLswg=
=3NtI
-----END PGP SIGNATURE-----

--kytPndXVJDl+F4EW--

