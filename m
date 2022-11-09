Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4406DC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 19:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbuVVtCAuZsTf4PjNCsXW3z/SnVXA6k+5h3JF8wkBJM=; b=VGSlMPxyD2raEziPEKWifYHQdp
	66t+0zVxFPGoPhjLzh5DmIdN8ReHPWfNzN184QP3SPwyaLLCb7PgcwfYveCDAGyG1U3py6xDgOk45
	nr+ovMjpg0IOoCDH4Iii9alifL3HAqsbPxgqqMavvPAGliCRWnBCq3p4wEc0SXDn4HZSGrwy2GUxb
	EGVOOv4mEGce/qQ8o7R/c23kLNY7rfnqToIXlufu0OKHsRLQ3+9+IUuipNdI2QESd6Uk/RHFJun1L
	3dtS1pNsne2coDLvc4wmzaSX/DoXfbN2mbMvwKMIXXbVNJp+xgtsMd80e8HWaUjayikBWAnl3o6WW
	yh57PFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqou-00GcMA-NW; Wed, 09 Nov 2022 19:33:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqor-00GcKJ-8K
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 19:33:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B219EB81F9E;
	Wed,  9 Nov 2022 19:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32839C433D6;
	Wed,  9 Nov 2022 19:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668022382;
	bh=gwlEiNKt9FhGC2F0HZ75Hi3RUTuLuRS0CLXw9wbl06M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LG1ixwa+8GL6orJ1KCuP2X0pwKhMvtYBdtoHajEMrNgfJK6Hy4pTa2+qnWqiqcXQ/
	 kzjliosm0m15UblQbiJJOW9ENfpPHnqoWX7Qn8heSlPGI3IfKz1AJRdmQ2CYWjRIko
	 yTKqzOrCbpanPuFPtGK+0YW3gsUOQ8x5Bey05iR7kb89JBQm/pdEZPEHISTTc+pxjM
	 4sZbHwDpd28lh6P0pFcy5x2LHEsx6WwNgyFzM9Q31YnuIekx1FwPjX/+vJ2r2MEEQ1
	 kzj7mKqrIUplL7zgsD3iQzxG/663RNB/yBwm/xf+czEVMBMWSdKhxVTliOB5El7vDH
	 NPsa4xljiPQBg==
Date: Wed, 9 Nov 2022 20:32:58 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org,
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek@lists.infradead.org, Bo Jiao <bo.jiao@mediatek.com>
Subject: Re: [PATCH v2 1/4] wifi: mt76: mt7915: rework mt7915_dma_reset()
Message-ID: <Y2wAamDhAYB8Tqn4@localhost.localdomain>
References: <26aefa69d1002616412c4b00bf2e779f71ca3289.1667949443.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EFqP5z/GbJHMzX6u"
Content-Disposition: inline
In-Reply-To: <26aefa69d1002616412c4b00bf2e779f71ca3289.1667949443.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_113305_615339_A0FD641A 
X-CRM114-Status: GOOD (  22.98  )
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


--EFqP5z/GbJHMzX6u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Bo Jiao <bo.jiao@mediatek.com>
>=20
> Reuse mt7915_dma_disable() to reduce duplicated code.
> This is a preliminary patch to enable full system reset.
>=20
> Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7915/dma.c   | 110 ++++++++++++++----
>  .../net/wireless/mediatek/mt76/mt7915/mac.c   |  69 +----------
>  .../wireless/mediatek/mt76/mt7915/mt7915.h    |   1 +
>  3 files changed, 91 insertions(+), 89 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/dma.c
> index e4fa240834d8..5b27093f618b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
> @@ -50,23 +50,37 @@ static void mt7915_dma_config(struct mt7915_dev *dev)
>  #define TXQ_CONFIG(q, wfdma, int, id)	Q_CONFIG(__TXQ(q), (wfdma), (int),=
 (id))
> =20
>  	if (is_mt7915(&dev->mt76)) {
> -		RXQ_CONFIG(MT_RXQ_MAIN, WFDMA0, MT_INT_RX_DONE_BAND0, MT7915_RXQ_BAND0=
);
> -		RXQ_CONFIG(MT_RXQ_MCU, WFDMA1, MT_INT_RX_DONE_WM, MT7915_RXQ_MCU_WM);
> -		RXQ_CONFIG(MT_RXQ_MCU_WA, WFDMA1, MT_INT_RX_DONE_WA, MT7915_RXQ_MCU_WA=
);
> -		RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0, MT_INT_RX_DONE_BAND1, MT7915_RXQ_BAND=
1);
> -		RXQ_CONFIG(MT_RXQ_BAND1_WA, WFDMA1, MT_INT_RX_DONE_WA_EXT, MT7915_RXQ_=
MCU_WA_EXT);
> -		RXQ_CONFIG(MT_RXQ_MAIN_WA, WFDMA1, MT_INT_RX_DONE_WA_MAIN, MT7915_RXQ_=
MCU_WA);
> +		RXQ_CONFIG(MT_RXQ_MAIN, WFDMA0, MT_INT_RX_DONE_BAND0,
> +			   MT7915_RXQ_BAND0);
> +		RXQ_CONFIG(MT_RXQ_MCU, WFDMA1, MT_INT_RX_DONE_WM,
> +			   MT7915_RXQ_MCU_WM);
> +		RXQ_CONFIG(MT_RXQ_MCU_WA, WFDMA1, MT_INT_RX_DONE_WA,
> +			   MT7915_RXQ_MCU_WA);
> +		RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0, MT_INT_RX_DONE_BAND1,
> +			   MT7915_RXQ_BAND1);
> +		RXQ_CONFIG(MT_RXQ_BAND1_WA, WFDMA1, MT_INT_RX_DONE_WA_EXT,
> +			   MT7915_RXQ_MCU_WA_EXT);
> +		RXQ_CONFIG(MT_RXQ_MAIN_WA, WFDMA1, MT_INT_RX_DONE_WA_MAIN,
> +			   MT7915_RXQ_MCU_WA);
>  		TXQ_CONFIG(0, WFDMA1, MT_INT_TX_DONE_BAND0, MT7915_TXQ_BAND0);
>  		TXQ_CONFIG(1, WFDMA1, MT_INT_TX_DONE_BAND1, MT7915_TXQ_BAND1);
> -		MCUQ_CONFIG(MT_MCUQ_WM, WFDMA1, MT_INT_TX_DONE_MCU_WM, MT7915_TXQ_MCU_=
WM);
> -		MCUQ_CONFIG(MT_MCUQ_WA, WFDMA1, MT_INT_TX_DONE_MCU_WA, MT7915_TXQ_MCU_=
WA);
> -		MCUQ_CONFIG(MT_MCUQ_FWDL, WFDMA1, MT_INT_TX_DONE_FWDL, MT7915_TXQ_FWDL=
);
> +		MCUQ_CONFIG(MT_MCUQ_WM, WFDMA1, MT_INT_TX_DONE_MCU_WM,
> +			    MT7915_TXQ_MCU_WM);
> +		MCUQ_CONFIG(MT_MCUQ_WA, WFDMA1, MT_INT_TX_DONE_MCU_WA,
> +			    MT7915_TXQ_MCU_WA);
> +		MCUQ_CONFIG(MT_MCUQ_FWDL, WFDMA1, MT_INT_TX_DONE_FWDL,
> +			    MT7915_TXQ_FWDL);
>  	} else {
> -		RXQ_CONFIG(MT_RXQ_MCU, WFDMA0, MT_INT_RX_DONE_WM, MT7916_RXQ_MCU_WM);
> -		RXQ_CONFIG(MT_RXQ_BAND1_WA, WFDMA0, MT_INT_RX_DONE_WA_EXT_MT7916, MT79=
16_RXQ_MCU_WA_EXT);
> -		MCUQ_CONFIG(MT_MCUQ_WM, WFDMA0, MT_INT_TX_DONE_MCU_WM, MT7915_TXQ_MCU_=
WM);
> -		MCUQ_CONFIG(MT_MCUQ_WA, WFDMA0, MT_INT_TX_DONE_MCU_WA_MT7916, MT7915_T=
XQ_MCU_WA);
> -		MCUQ_CONFIG(MT_MCUQ_FWDL, WFDMA0, MT_INT_TX_DONE_FWDL, MT7915_TXQ_FWDL=
);
> +		RXQ_CONFIG(MT_RXQ_MCU, WFDMA0, MT_INT_RX_DONE_WM,
> +			   MT7916_RXQ_MCU_WM);
> +		RXQ_CONFIG(MT_RXQ_BAND1_WA, WFDMA0, MT_INT_RX_DONE_WA_EXT_MT7916,
> +			   MT7916_RXQ_MCU_WA_EXT);
> +		MCUQ_CONFIG(MT_MCUQ_WM, WFDMA0, MT_INT_TX_DONE_MCU_WM,
> +			    MT7915_TXQ_MCU_WM);
> +		MCUQ_CONFIG(MT_MCUQ_WA, WFDMA0, MT_INT_TX_DONE_MCU_WA_MT7916,
> +			    MT7915_TXQ_MCU_WA);
> +		MCUQ_CONFIG(MT_MCUQ_FWDL, WFDMA0, MT_INT_TX_DONE_FWDL,
> +			    MT7915_TXQ_FWDL);
> =20
>  		if (is_mt7916(&dev->mt76) && mtk_wed_device_active(&dev->mt76.mmio.wed=
)) {
>  			RXQ_CONFIG(MT_RXQ_MAIN, WFDMA0, MT_INT_WED_RX_DONE_BAND0_MT7916,
> @@ -77,16 +91,23 @@ static void mt7915_dma_config(struct mt7915_dev *dev)
>  				   MT7916_RXQ_BAND1);
>  			RXQ_CONFIG(MT_RXQ_MAIN_WA, WFDMA0, MT_INT_WED_RX_DONE_WA_MAIN_MT7916,
>  				   MT7916_RXQ_MCU_WA_MAIN);
> -			TXQ_CONFIG(0, WFDMA0, MT_INT_WED_TX_DONE_BAND0, MT7915_TXQ_BAND0);
> -			TXQ_CONFIG(1, WFDMA0, MT_INT_WED_TX_DONE_BAND1, MT7915_TXQ_BAND1);
> +			TXQ_CONFIG(0, WFDMA0, MT_INT_WED_TX_DONE_BAND0,
> +				   MT7915_TXQ_BAND0);
> +			TXQ_CONFIG(1, WFDMA0, MT_INT_WED_TX_DONE_BAND1,
> +				   MT7915_TXQ_BAND1);
>  		} else {
> -			RXQ_CONFIG(MT_RXQ_MAIN, WFDMA0, MT_INT_RX_DONE_BAND0_MT7916, MT7916_R=
XQ_BAND0);
> -			RXQ_CONFIG(MT_RXQ_MCU_WA, WFDMA0, MT_INT_RX_DONE_WA, MT7916_RXQ_MCU_W=
A);
> -			RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0, MT_INT_RX_DONE_BAND1_MT7916, MT7916_=
RXQ_BAND1);
> +			RXQ_CONFIG(MT_RXQ_MAIN, WFDMA0, MT_INT_RX_DONE_BAND0_MT7916,
> +				   MT7916_RXQ_BAND0);
> +			RXQ_CONFIG(MT_RXQ_MCU_WA, WFDMA0, MT_INT_RX_DONE_WA,
> +				   MT7916_RXQ_MCU_WA);
> +			RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0, MT_INT_RX_DONE_BAND1_MT7916,
> +				   MT7916_RXQ_BAND1);
>  			RXQ_CONFIG(MT_RXQ_MAIN_WA, WFDMA0, MT_INT_RX_DONE_WA_MAIN_MT7916,
>  				   MT7916_RXQ_MCU_WA_MAIN);
> -			TXQ_CONFIG(0, WFDMA0, MT_INT_TX_DONE_BAND0, MT7915_TXQ_BAND0);
> -			TXQ_CONFIG(1, WFDMA0, MT_INT_TX_DONE_BAND1, MT7915_TXQ_BAND1);
> +			TXQ_CONFIG(0, WFDMA0, MT_INT_TX_DONE_BAND0,
> +				   MT7915_TXQ_BAND0);
> +			TXQ_CONFIG(1, WFDMA0, MT_INT_TX_DONE_BAND1,
> +				   MT7915_TXQ_BAND1);
>  		}
>  	}
>  }
> @@ -514,6 +535,53 @@ int mt7915_dma_init(struct mt7915_dev *dev, struct m=
t7915_phy *phy2)
>  	return 0;
>  }
> =20
> +int mt7915_dma_reset(struct mt7915_dev *dev, bool force)
> +{
> +	struct mt76_phy *mphy_ext =3D dev->mt76.phys[MT_BAND1];
> +	int i;
> +
> +	/* clean up hw queues */
> +	for (i =3D 0; i < ARRAY_SIZE(dev->mt76.phy.q_tx); i++) {
> +		mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[i], true);
> +		if (mphy_ext)
> +			mt76_queue_tx_cleanup(dev, mphy_ext->q_tx[i], true);
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(dev->mt76.q_mcu); i++)
> +		mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[i], true);
> +
> +	mt76_for_each_q_rx(&dev->mt76, i)
> +		mt76_queue_rx_cleanup(dev, &dev->mt76.q_rx[i]);
> +
> +	/* reset wfsys */
> +	if (force)
> +		mt7915_wfsys_reset(dev);
> +
> +	mt7915_dma_disable(dev, force);
> +
> +	/* reset hw queues */
> +	for (i =3D 0; i < __MT_TXQ_MAX; i++) {
> +		mt76_queue_reset(dev, dev->mphy.q_tx[i]);
> +		if (mphy_ext)
> +			mt76_queue_reset(dev, mphy_ext->q_tx[i]);
> +	}
> +
> +	for (i =3D 0; i < __MT_MCUQ_MAX; i++)
> +		mt76_queue_reset(dev, dev->mt76.q_mcu[i]);
> +
> +	mt76_for_each_q_rx(&dev->mt76, i)
> +			mt76_queue_reset(dev, &dev->mt76.q_rx[i]);

nit: fix indentation here

> +
> +	mt76_tx_status_check(&dev->mt76, true);
> +
> +	mt7915_dma_enable(dev);
> +
> +	mt76_for_each_q_rx(&dev->mt76, i)
> +		mt76_queue_rx_reset(dev, i);
> +
> +	return 0;
> +}
> +
>  void mt7915_dma_cleanup(struct mt7915_dev *dev)
>  {
>  	mt7915_dma_disable(dev, true);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mac.c
> index 324f0f58572b..3b1259f14de6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> @@ -1306,73 +1306,6 @@ mt7915_update_beacons(struct mt7915_dev *dev)
>  		mt7915_update_vif_beacon, mphy_ext->hw);
>  }
> =20
> -static void
> -mt7915_dma_reset(struct mt7915_dev *dev)
> -{
> -	struct mt76_phy *mphy_ext =3D dev->mt76.phys[MT_BAND1];
> -	u32 hif1_ofs =3D MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
> -	int i;
> -
> -	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
> -		   MT_WFDMA0_GLO_CFG_TX_DMA_EN |
> -		   MT_WFDMA0_GLO_CFG_RX_DMA_EN);
> -
> -	if (is_mt7915(&dev->mt76))
> -		mt76_clear(dev, MT_WFDMA1_GLO_CFG,
> -			   MT_WFDMA1_GLO_CFG_TX_DMA_EN |
> -			   MT_WFDMA1_GLO_CFG_RX_DMA_EN);
> -	if (dev->hif2) {
> -		mt76_clear(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
> -			   MT_WFDMA0_GLO_CFG_TX_DMA_EN |
> -			   MT_WFDMA0_GLO_CFG_RX_DMA_EN);
> -
> -		if (is_mt7915(&dev->mt76))
> -			mt76_clear(dev, MT_WFDMA1_GLO_CFG + hif1_ofs,
> -				   MT_WFDMA1_GLO_CFG_TX_DMA_EN |
> -				   MT_WFDMA1_GLO_CFG_RX_DMA_EN);
> -	}
> -
> -	usleep_range(1000, 2000);
> -
> -	for (i =3D 0; i < __MT_TXQ_MAX; i++) {
> -		mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[i], true);
> -		if (mphy_ext)
> -			mt76_queue_tx_cleanup(dev, mphy_ext->q_tx[i], true);
> -	}
> -
> -	for (i =3D 0; i < __MT_MCUQ_MAX; i++)
> -		mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[i], true);
> -
> -	mt76_for_each_q_rx(&dev->mt76, i)
> -		mt76_queue_rx_reset(dev, i);
> -
> -	mt76_tx_status_check(&dev->mt76, true);
> -
> -	/* re-init prefetch settings after reset */
> -	mt7915_dma_prefetch(dev);
> -
> -	mt76_set(dev, MT_WFDMA0_GLO_CFG,
> -		 MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN);
> -	if (is_mt7915(&dev->mt76))
> -		mt76_set(dev, MT_WFDMA1_GLO_CFG,
> -			 MT_WFDMA1_GLO_CFG_TX_DMA_EN |
> -			 MT_WFDMA1_GLO_CFG_RX_DMA_EN |
> -			 MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
> -			 MT_WFDMA1_GLO_CFG_OMIT_RX_INFO);
> -	if (dev->hif2) {
> -		mt76_set(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
> -			 MT_WFDMA0_GLO_CFG_TX_DMA_EN |
> -			 MT_WFDMA0_GLO_CFG_RX_DMA_EN);
> -
> -		if (is_mt7915(&dev->mt76))
> -			mt76_set(dev, MT_WFDMA1_GLO_CFG + hif1_ofs,
> -				 MT_WFDMA1_GLO_CFG_TX_DMA_EN |
> -				 MT_WFDMA1_GLO_CFG_RX_DMA_EN |
> -				 MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
> -				 MT_WFDMA1_GLO_CFG_OMIT_RX_INFO);
> -	}
> -}
> -
>  void mt7915_tx_token_put(struct mt7915_dev *dev)
>  {
>  	struct mt76_txwi_cache *txwi;
> @@ -1424,7 +1357,7 @@ void mt7915_mac_reset_work(struct work_struct *work)
>  	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_DMA_STOPPED);
> =20
>  	if (mt7915_wait_reset_state(dev, MT_MCU_CMD_RESET_DONE)) {
> -		mt7915_dma_reset(dev);
> +		mt7915_dma_reset(dev, false);
> =20
>  		mt7915_tx_token_put(dev);
>  		idr_init(&dev->mt76.token);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers=
/net/wireless/mediatek/mt76/mt7915/mt7915.h
> index fe6a6d3b0a32..5af26e60e902 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> @@ -443,6 +443,7 @@ s8 mt7915_eeprom_get_power_delta(struct mt7915_dev *d=
ev, int band);
>  int mt7915_dma_init(struct mt7915_dev *dev, struct mt7915_phy *phy2);
>  void mt7915_dma_prefetch(struct mt7915_dev *dev);
>  void mt7915_dma_cleanup(struct mt7915_dev *dev);
> +int mt7915_dma_reset(struct mt7915_dev *dev, bool force);
>  int mt7915_mcu_init(struct mt7915_dev *dev);
>  int mt7915_mcu_twt_agrt_update(struct mt7915_dev *dev,
>  			       struct mt7915_vif *mvif,
> --=20
> 2.36.1
>=20

--EFqP5z/GbJHMzX6u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY2wAZwAKCRA6cBh0uS2t
rFHbAQD7TQIgG5sVi1br1yrzfdYPrg1lBxKDur3Ls4yyqz+p7AD+OvuH/3XJ/0G1
G66ObfSm3bGsjqLe9J4LQszEtLa42gg=
=MhFG
-----END PGP SIGNATURE-----

--EFqP5z/GbJHMzX6u--

