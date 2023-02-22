Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE00C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XoTE1Y0kgqkbERWdM8h2NTPwpe++eTPbYpM0hlp1XaM=; b=bfb/5m7u3FnGVxZkghkqgw+7uj
	Im9cADj5qpI+RlHdq2DDR1lRWg6pK55jiY7sR+K420HVv2r6uWQjmyoS2r4AMx2RLYKvMHgLl5usc
	wGEJfzJLZtn7txb57MzuXLJPzqHxc+4s2mllU+Z/OW7SwxXqxcOLiiP2D4rTp1a5S4Va39m+fc5MH
	0gdvdK34NZ1PtMx2WbhAMgPuqk51CBHwOVth7I1G7SjmEwiO2t9dri9CiKWrFvNACQuUehZzUictN
	3I4AWKyPd/toKrjvQbkc3aNImvPVXrzlKJj6agD6/n5oyl+n13UkZZOyMj82HKjrf1qQF5oZkBCwJ
	w648/JzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmVv-00C032-5O; Wed, 22 Feb 2023 10:38:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmI3-00BtCC-LF
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 10:24:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30F3961314;
	Wed, 22 Feb 2023 10:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8409CC433D2;
	Wed, 22 Feb 2023 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677061438;
	bh=/IPqJeGoKimjKk8TQKkgo327g7gx9IzFFcnl0z+a32U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mkgnYa44WjsnBwuRg3yuLBvS4gFNYXwRu72NouLMesRcP0jHRx5Ka3lXHmwuSQtHn
	 DQ9alQ5kkWQikxYufIBVLdTts59QCUVf1JK4Rxn2WCuLJ1aee5z+4073alGTjaCFQs
	 b+osux5N4jfk9RDV8bTI9R1AMfHSoqxZ1i8KGWAViWr6ZsPjQqYpLGEMI6BU/3DWQl
	 +mKsQQnHNFbuv1L+kDSri8PetRzFY1ZkANlJ6dYWFfQ/MzmVtcsxEVgu56iNpBfxIi
	 8YC0PhjAVnmIX3td+H1zzrR8MSS2vjzxuTYOU7VSHaxMvcRBxcAT5D92bEcuTPxOvG
	 EXiRqW7ZQOEfw==
Date: Wed, 22 Feb 2023 11:23:54 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Sujuan Chen <sujuan.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Bo Jiao <bo.jiao@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: mt76: mt7915: add dev->hif2 support for mt7916
 WED device
Message-ID: <Y/XtOhW5fUshrUPY@lore-desk>
References: <73e1988a12a60fa0c661edc8328a302b92392b94.1677056399.git.sujuan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jW1opb75XE5j4F3L"
Content-Disposition: inline
In-Reply-To: <73e1988a12a60fa0c661edc8328a302b92392b94.1677056399.git.sujuan.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_022359_777211_759E1937 
X-CRM114-Status: GOOD (  18.77  )
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


--jW1opb75XE5j4F3L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Enable two PCIe interfaces (dev->hif2) support for mt7916 when WED is ena=
bled.
>=20
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/dma.c  | 10 ++++++++--
>  drivers/net/wireless/mediatek/mt76/mt7915/mcu.c  |  4 +++-
>  drivers/net/wireless/mediatek/mt76/mt7915/mmio.c | 10 +++++-----
>  3 files changed, 16 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/dma.c
> index abe17dac9996..43a5456d4b97 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
> @@ -87,8 +87,14 @@ static void mt7915_dma_config(struct mt7915_dev *dev)
>  				   MT7916_RXQ_BAND0);
>  			RXQ_CONFIG(MT_RXQ_MCU_WA, WFDMA0, MT_INT_WED_RX_DONE_WA_MT7916,
>  				   MT7916_RXQ_MCU_WA);
> -			RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0, MT_INT_WED_RX_DONE_BAND1_MT7916,
> -				   MT7916_RXQ_BAND1);
> +			if (dev->hif2)
> +				RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0,
> +					   MT_INT_RX_DONE_BAND1_MT7916,
> +					   MT7916_RXQ_BAND1);
> +			else
> +				RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0,
> +					   MT_INT_WED_RX_DONE_BAND1_MT7916,
> +					   MT7916_RXQ_BAND1);
>  			RXQ_CONFIG(MT_RXQ_MAIN_WA, WFDMA0, MT_INT_WED_RX_DONE_WA_MAIN_MT7916,
>  				   MT7916_RXQ_MCU_WA_MAIN);
>  			TXQ_CONFIG(0, WFDMA0, MT_INT_WED_TX_DONE_BAND0,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.c
> index 5545a8bdf1d0..1dfbcc9bf755 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -2370,7 +2370,9 @@ int mt7915_mcu_init_firmware(struct mt7915_dev *dev)
>  	if (ret)
>  		return ret;
> =20
> -	if (mtk_wed_device_active(&dev->mt76.mmio.wed) && is_mt7915(&dev->mt76))
> +	if ((mtk_wed_device_active(&dev->mt76.mmio.wed) &&
> +	     is_mt7915(&dev->mt76)) ||
> +	    (!mtk_wed_get_rx_capa(&dev->mt76.mmio.wed)))

you do not need brackets around mtk_wed_get_rx_capa().

Regards,
Lorenzo

>  		mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(CAPABILITY), 0, 0, 0);
> =20
>  	ret =3D mt7915_mcu_set_mwds(dev, 1);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/mmio.c
> index 225a19604d3e..6f0c0e2ae045 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
> @@ -989,13 +989,13 @@ irqreturn_t mt7915_irq_handler(int irq, void *dev_i=
nstance)
>  	struct mt7915_dev *dev =3D dev_instance;
>  	struct mtk_wed_device *wed =3D &dev->mt76.mmio.wed;
> =20
> -	if (mtk_wed_device_active(wed)) {
> +	if (mtk_wed_device_active(wed))
>  		mtk_wed_device_irq_set_mask(wed, 0);
> -	} else {
> +	else
>  		mt76_wr(dev, MT_INT_MASK_CSR, 0);
> -		if (dev->hif2)
> -			mt76_wr(dev, MT_INT1_MASK_CSR, 0);
> -	}
> +
> +	if (dev->hif2)
> +		mt76_wr(dev, MT_INT1_MASK_CSR, 0);
> =20
>  	if (!test_bit(MT76_STATE_INITIALIZED, &dev->mphy.state))
>  		return IRQ_NONE;
> --=20
> 2.18.0
>=20

--jW1opb75XE5j4F3L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY/XtOgAKCRA6cBh0uS2t
rENuAQD4VLHFi+3as+XO3kqv/YNJnjnIwnzxtjNgbjSOaOQ+PQEA/W7ZaHwxlSK2
9IZuP08C7N/VpbvHyKD697BA639yjAQ=
=OivV
-----END PGP SIGNATURE-----

--jW1opb75XE5j4F3L--

