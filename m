Return-Path: <SRS0=IoHK=JP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF8EC433ED
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 16:47:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 607D961278
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 16:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 607D961278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LBEAv7+vOMj9KK583RlxHlVLaMaQiNeZcj59n56OyfA=; b=BF3lQthI6oZc4h47v4GwHHkcw
	UCHe2JlFILMjj4IFcMqBSNVTX3w7htYLsBTnrMqckhm6xcjBkjECbXr1Iw1WeTmXnTyWgfbXst5iA
	3cstQtJoBaPIOMm//4jQSlvvzX4vEOvcVsuV/7qIl0oKSjxSMadS5drlaXXIwRtwOacLeI7l3C92P
	Kj7QrWb0y9OYUOGZ6KCB1QdYZNnMpJn+7oN8bXogC/FE61nVUUKCr4iyVEZnVzaXhPCG+FasHZ/b7
	s5f+dfBLPanI/+naCQw+HVYcAYJwap2X1eQQL4pefTgM0iUU3tYWGbI5zo9Ws+XGBAk6NsgLynrb0
	KCnW1nvow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYAa8-008KQA-2z; Sun, 18 Apr 2021 16:47:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAa7-008KQ0-0t
 for linux-mediatek@desiato.infradead.org; Sun, 18 Apr 2021 16:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=s/6z2HqtlUfq6R9+4LpcZzClWdaylOT81WzSXrbpEu4=; b=IozAubrXGKZJ2h2oPupMLNaN11
 1L2/M4sPKdFc7NrCxdkvYrQb2kqi31NHQ1H1tqkoraanblcbHfwNBzCSNYg7D53Ub2vdfmpTkLlIV
 N4FrjicPqwyy3fF2ggxZVbOCwuVJyX1SkFBxdGJwb7QRCTT2rHzPSv6R7BrDUnGSnlTMrxwmQKIkK
 JiSQCgaTknmttGFdZnFFmnIyiSthOnsP2OtM02GIKvtKLFL+NYSXMfD79eNy0hc7gMEHPJ9WqswSm
 NPcrBUtYh8ZpPSWDE2fKq08kI1CT82rwpUsX5056AZRTgSkzjeedDBXkpIdPMFSeg8BDgYVOuj3SX
 ufei9+Og==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAa3-00AWGV-Vw
 for linux-mediatek@lists.infradead.org; Sun, 18 Apr 2021 16:47:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C6AD6100A;
 Sun, 18 Apr 2021 16:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618764451;
 bh=WnDSXoIRCYnMg1SVhxKJWxnei4sbr24dbv/WMObxnXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cUw6ngmZ6asuJvVZR0iuQ5bvbTnXbXQ6dOadZWyzLbo+V3gjkZzPqq5kAQLwQa9a/
 7fHeMT37OaI5/+Ebkba1hPNtPzuDIq1SSWSboXNNm1g4dW1HSjI7Yc0AcilVqVVGPe
 rP+2Ukf2D398SHhpJXyIeaaip24BEKJA1NPZmDJzZlV1A5EEPIVl9u2SnQdptbgI/S
 7ULwMC+YlugU8dRGM3EObGyQ+99dQJnqyZBTLJPCzltiWXfBNvxki/v3PXVvmzveKC
 QBMbdn6CnyPjHiF7amSL1/F9sze5KuBKM1WFUb/OLegCz/iVjUWbS85lGRbJfmgIQ7
 MaBIlOMat/GqQ==
Date: Sun, 18 Apr 2021 18:47:26 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/6] mt76: mt7921: move mt7921_dma_reset in dma.c
Message-ID: <YHxinpO6Ev8qbbuf@lore-desk>
References: <1618763767-1292-1-git-send-email-sean.wang@mediatek.com>
 <1618763767-1292-2-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1618763767-1292-2-git-send-email-sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_094732_098569_399F2204 
X-CRM114-Status: GOOD (  21.12  )
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
Content-Type: multipart/mixed; boundary="===============0892117797596373663=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0892117797596373663==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZSpN3+iknRa2U5sg"
Content-Disposition: inline


--ZSpN3+iknRa2U5sg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> Move mt7921_dma_reset routine in dma.c and make mt7921_dma_prefetch
> static. Moreover add force parameter to mt7921_dma_reset signature.
> This is a preliminary patch to reset dma mt7921_mcu_drv_pmctrl.
>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../net/wireless/mediatek/mt76/mt7921/dma.c   | 71 +++++++++++++++++++
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 66 +----------------
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +-
>  3 files changed, 73 insertions(+), 66 deletions(-)

Hi Sean,

I have just posted a preliminary series mandatory to enable deep sleep on m=
t7921.
I can post my patches of this seires (the one you posted) on top of it,
or if you prefer, can you please repost on top of my new series?

Regards,
Lorenzo

>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/dma.c
> index 992faf82ad09..f8815aa247eb 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
> @@ -206,6 +206,77 @@ static int mt7921_dmashdl_disabled(struct mt7921_dev=
 *dev)
>  	return 0;
>  }
> =20
> +int mt7921_dma_reset(struct mt7921_dev *dev, bool force)
> +{
> +	int i;
> +
> +	if (force) {
> +		/* reset */
> +		mt76_clear(dev, MT_WFDMA0_RST,
> +			   MT_WFDMA0_RST_DMASHDL_ALL_RST |
> +			   MT_WFDMA0_RST_LOGIC_RST);
> +
> +		mt76_set(dev, MT_WFDMA0_RST,
> +			 MT_WFDMA0_RST_DMASHDL_ALL_RST |
> +			 MT_WFDMA0_RST_LOGIC_RST);
> +	}
> +
> +	/* disable WFDMA0 */
> +	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
> +		   MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN |
> +		   MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN |
> +		   MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
> +		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO |
> +		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
> +
> +	if (!mt76_poll(dev, MT_WFDMA0_GLO_CFG,
> +		       MT_WFDMA0_GLO_CFG_TX_DMA_BUSY |
> +		       MT_WFDMA0_GLO_CFG_RX_DMA_BUSY, 0, 1000))
> +		return -ETIMEDOUT;
> +
> +	/* reset hw queues */
> +	for (i =3D 0; i < __MT_TXQ_MAX; i++)
> +		mt76_queue_reset(dev, dev->mphy.q_tx[i]);
> +
> +	for (i =3D 0; i < __MT_MCUQ_MAX; i++)
> +		mt76_queue_reset(dev, dev->mt76.q_mcu[i]);
> +
> +	mt76_for_each_q_rx(&dev->mt76, i)
> +		mt76_queue_reset(dev, &dev->mt76.q_rx[i]);
> +
> +	mt76_tx_status_check(&dev->mt76, NULL, true);
> +
> +	/* configure perfetch settings */
> +	mt7921_dma_prefetch(dev);
> +
> +	/* reset dma idx */
> +	mt76_wr(dev, MT_WFDMA0_RST_DTX_PTR, ~0);
> +
> +	/* configure delay interrupt */
> +	mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG0, 0);
> +
> +	mt76_set(dev, MT_WFDMA0_GLO_CFG,
> +		 MT_WFDMA0_GLO_CFG_TX_WB_DDONE |
> +		 MT_WFDMA0_GLO_CFG_FIFO_LITTLE_ENDIAN |
> +		 MT_WFDMA0_GLO_CFG_CLK_GAT_DIS |
> +		 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
> +		 MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN |
> +		 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
> +
> +	mt76_set(dev, MT_WFDMA0_GLO_CFG,
> +		 MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN);
> +
> +	mt76_set(dev, MT_WFDMA_DUMMY_CR, MT_WFDMA_NEED_REINIT);
> +
> +	/* enable interrupts for TX/RX rings */
> +	mt7921_irq_enable(dev,
> +			  MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
> +			  MT_INT_MCU_CMD);
> +	mt76_set(dev, MT_MCU2HOST_SW_INT_ENA, MT_MCU_CMD_WAKE_RX_PCIE);
> +
> +	return 0;
> +}
> +
>  int mt7921_dma_init(struct mt7921_dev *dev)
>  {
>  	/* Increase buffer size to receive large VHT/HE MPDUs */
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index 3145880df6e7..4e319f1521a6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -1220,70 +1220,6 @@ int mt7921_wfsys_reset(struct mt7921_dev *dev)
>  				WFSYS_SW_INIT_DONE, WFSYS_SW_INIT_DONE, 500);
>  }
> =20
> -static void
> -mt7921_dma_reset(struct mt7921_dev *dev)
> -{
> -	int i;
> -
> -	/* reset */
> -	mt76_clear(dev, MT_WFDMA0_RST,
> -		   MT_WFDMA0_RST_DMASHDL_ALL_RST | MT_WFDMA0_RST_LOGIC_RST);
> -
> -	mt76_set(dev, MT_WFDMA0_RST,
> -		 MT_WFDMA0_RST_DMASHDL_ALL_RST | MT_WFDMA0_RST_LOGIC_RST);
> -
> -	/* disable WFDMA0 */
> -	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
> -		   MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN |
> -		   MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN |
> -		   MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
> -		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO |
> -		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
> -
> -	mt76_poll(dev, MT_WFDMA0_GLO_CFG,
> -		  MT_WFDMA0_GLO_CFG_TX_DMA_BUSY |
> -		  MT_WFDMA0_GLO_CFG_RX_DMA_BUSY, 0, 1000);
> -
> -	/* reset hw queues */
> -	for (i =3D 0; i < __MT_TXQ_MAX; i++)
> -		mt76_queue_reset(dev, dev->mphy.q_tx[i]);
> -
> -	for (i =3D 0; i < __MT_MCUQ_MAX; i++)
> -		mt76_queue_reset(dev, dev->mt76.q_mcu[i]);
> -
> -	mt76_for_each_q_rx(&dev->mt76, i)
> -		mt76_queue_reset(dev, &dev->mt76.q_rx[i]);
> -
> -	mt76_tx_status_check(&dev->mt76, NULL, true);
> -
> -	/* configure perfetch settings */
> -	mt7921_dma_prefetch(dev);
> -
> -	/* reset dma idx */
> -	mt76_wr(dev, MT_WFDMA0_RST_DTX_PTR, ~0);
> -
> -	/* configure delay interrupt */
> -	mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG0, 0);
> -
> -	mt76_set(dev, MT_WFDMA0_GLO_CFG,
> -		 MT_WFDMA0_GLO_CFG_TX_WB_DDONE |
> -		 MT_WFDMA0_GLO_CFG_FIFO_LITTLE_ENDIAN |
> -		 MT_WFDMA0_GLO_CFG_CLK_GAT_DIS |
> -		 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
> -		 MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN |
> -		 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
> -
> -	mt76_set(dev, MT_WFDMA0_GLO_CFG,
> -		 MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN);
> -
> -	mt76_set(dev, MT_WFDMA_DUMMY_CR, MT_WFDMA_NEED_REINIT);
> -
> -	/* enable interrupts for TX/RX rings */
> -	mt7921_irq_enable(dev,
> -			  MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
> -			  MT_INT_MCU_CMD);
> -}
> -
>  void mt7921_tx_token_put(struct mt7921_dev *dev)
>  {
>  	struct mt76_txwi_cache *txwi;
> @@ -1354,7 +1290,7 @@ mt7921_mac_reset(struct mt7921_dev *dev)
>  		mt76_queue_rx_cleanup(dev, &dev->mt76.q_rx[i]);
> =20
>  	mt7921_wfsys_reset(dev);
> -	mt7921_dma_reset(dev);
> +	mt7921_dma_reset(dev, true);
> =20
>  	mt76_for_each_q_rx(&dev->mt76, i) {
>  		mt76_queue_rx_reset(dev, i);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index c34cf3e3a26b..9b476641616d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -253,7 +253,7 @@ int mt7921_eeprom_get_target_power(struct mt7921_dev =
*dev,
>  				   u8 chain_idx);
>  void mt7921_eeprom_init_sku(struct mt7921_dev *dev);
>  int mt7921_dma_init(struct mt7921_dev *dev);
> -void mt7921_dma_prefetch(struct mt7921_dev *dev);
> +int mt7921_dma_reset(struct mt7921_dev *dev, bool force);
>  void mt7921_dma_cleanup(struct mt7921_dev *dev);
>  int mt7921_run_firmware(struct mt7921_dev *dev);
>  int mt7921_mcu_init(struct mt7921_dev *dev);
> --=20
> 2.25.1
>=20

--ZSpN3+iknRa2U5sg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYHxinAAKCRA6cBh0uS2t
rCq/AQCk/o+hPyuX8rKBSBDYDt50iTNYnJD5tE7rRoGhZE/IZwEA0wZWPjX9mIA+
F2kHh7WmBxwUmdXlxVWgEtEtI8jJ3AA=
=ABh/
-----END PGP SIGNATURE-----

--ZSpN3+iknRa2U5sg--


--===============0892117797596373663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0892117797596373663==--

