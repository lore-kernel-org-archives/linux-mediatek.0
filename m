Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD775C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 17:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1qsfyzWWq81pJ5ku2X5n7HBixEnB8TtH7K3GGYie9I=; b=mZZ1BGaqTC5GYwh9iLFBWrfNzt
	R3TVRTthZS2EbXj7QV51L2W5PJCLb4IV5xVnA05HPgYyCvSYWTbrui6D3JpTZOFVKOAkCnHy3nmn5
	DcC42k6Ti+SEEG2Nl6zYB+AV3IjGYeJ8tUc4qIVA4g7rd8yrRKRVgKmwYNv8XC32Qe4Tnxg/F1xNa
	zGpR5Tci0N6/OJUM657MuYUqlXIIpviVsl+xHw1MfmIY8JeeY1N3qlFpYGReaZK1WdZQHgLr22Yxz
	AZL2zfXQUUgqif0YXy7GSFlddjZ7UyrxF4Q+qxZcItJyS7bQ66f+stz/FCORVoiLNF7DceP8O95zz
	WcvodYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAgM-00GMOq-P5; Mon, 21 Nov 2022 17:34:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAgI-00GMKC-Sd
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 17:34:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E3EA26134E;
	Mon, 21 Nov 2022 17:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4438C433C1;
	Mon, 21 Nov 2022 17:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669052045;
	bh=WoHgYE2RYULinnf+Grea8HLwRU6ayhN3s2m++MmUh48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtNbDAQLh8xzGG9y1Xv73V3PRNzVinb63/e2VbAfPKPV1mQ3LBy19NFUeiln48gc2
	 Y7CkLbm4KCpVVehQUS46HYSfiDmI7fSQJDv10ooXlTzW8paxjqOtzDlLhMWTp50WTz
	 NVFzr8oB3BTNqG5HXYCnfkEE6Gvv3sXqRUPAsJQt9zRZr63BXSJw37c5JkXPdlFpEd
	 EiReHMSd1JE3Y5I93KYv7nGsKk3f8ABSzA2B2wKv1V9x6QD+Eo+2oh/6OxdS4KzAEk
	 CG8GbWlh8o/4eTTgq6Q7rrifkRQShGbSOe72Mzi5T+f7mTgxj8yuxArp48hnyVFEQj
	 hbDp9IRNvFRmg==
Date: Mon, 21 Nov 2022 18:34:01 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, lorenzo.bianconi@redhat.com,
	sujuan.chen@mediatek.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 1/5] net: ethernet: mtk_wed: return status value
 in mtk_wdma_rx_reset
Message-ID: <Y3u2iWXXhpmapOxu@lore-desk>
References: <cover.1669020847.git.lorenzo@kernel.org>
 <8917d87eded7142a3a792c3ba64434a983278247.1669020847.git.lorenzo@kernel.org>
 <20221121165521.396686-1-alexandr.lobakin@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D6UKkadRkug9UHO+"
Content-Disposition: inline
In-Reply-To: <20221121165521.396686-1-alexandr.lobakin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_093407_079399_0ECD8BB5 
X-CRM114-Status: GOOD (  21.89  )
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


--D6UKkadRkug9UHO+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> From: Lorenzo Bianconi <lorenzo@kernel.org>
> Date: Mon, 21 Nov 2022 09:59:21 +0100
>=20
> > Move MTK_WDMA_RESET_IDX configuration in mtk_wdma_rx_reset routine.
> > This is a preliminary patch to add Wireless Ethernet Dispatcher reset
> > support.
> >=20
> > Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
> > Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/mediatek/mtk_wed.c | 25 ++++++++++++-------------
> >  1 file changed, 12 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethe=
rnet/mediatek/mtk_wed.c
> > index 7d8842378c2b..dc898ded2f05 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> > @@ -101,17 +101,21 @@ mtk_wdma_read_reset(struct mtk_wed_device *dev)
> >  	return wdma_r32(dev, MTK_WDMA_GLO_CFG);
> >  }
> > =20
> > -static void
> > +static int
> >  mtk_wdma_rx_reset(struct mtk_wed_device *dev)
> >  {
> >  	u32 status, mask =3D MTK_WDMA_GLO_CFG_RX_DMA_BUSY;
> > -	int i;
> > +	int i, ret;
> > =20
> >  	wdma_clr(dev, MTK_WDMA_GLO_CFG, MTK_WDMA_GLO_CFG_RX_DMA_EN);
> > -	if (readx_poll_timeout(mtk_wdma_read_reset, dev, status,
> > -			       !(status & mask), 0, 1000))
> > +	ret =3D readx_poll_timeout(mtk_wdma_read_reset, dev, status,
> > +				 !(status & mask), 0, 10000);
>=20
> You didn't mention anywhere this change of the timeout from 1000 to
> 10000, and for example for me it's not clear from the code why you
> did this. Maybe leave a comment in the commitmsg?
> Same in 2/5 for Tx, also 1000 -> 10000.

ops I forgot them, sorry. I actually aligned the these values to the vendor=
 sdk.

Regards,
Lorenzo

>=20
> > +	if (ret)
> >  		dev_err(dev->hw->dev, "rx reset failed\n");
> > =20
> > +	wdma_w32(dev, MTK_WDMA_RESET_IDX, MTK_WDMA_RESET_IDX_RX);
> > +	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
> > +
> >  	for (i =3D 0; i < ARRAY_SIZE(dev->rx_wdma); i++) {
> >  		if (dev->rx_wdma[i].desc)
> >  			continue;
>=20
> [...]
>=20
> > --=20
> > 2.38.1
>=20
> Thanks,
> Olek

--D6UKkadRkug9UHO+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY3u2iQAKCRA6cBh0uS2t
rLRFAP9YtkOiRlkkeWw3D1wAHIzJguolL5YjFqGopi33a9mNjAD/fvo9xMJiV7H+
HxEvuLk7+eIH9SoTEhh8FD8I5NAxGw0=
=NV9O
-----END PGP SIGNATURE-----

--D6UKkadRkug9UHO+--

