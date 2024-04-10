Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCF4CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxlBASdB2hbh5HOtVhJrROaz3/wicXroi6FhlmEJ+XE=; b=gt/F5aBhfjV9dcFq261mm9C9/D
	xpQGnExvsiGoo6ljD7vBkHW/zg3L+kNvsOH8X8iXw+rZc/SvEKvqg3fNSHF/SgVmku2NQpk2oLbRD
	H4AifwYTdB3Uey8jHZuiz2QR35l2QbLJKNxVWvZHZU5V3y2zQEuhHMWmr63YvnoAamAxOyjr0k/KK
	wL6H/FgrUijJpUBQXqMIKoTZ/yQI8LsLJF7PQCnkqy/tb/t9f7kfERhBv802bb1Rs8dhMXRAMsEO0
	nhzBdb/RFnwwsy1flEBSPk7SuUPQtoj4fYSwpljwJZfG/FEHQ94H+Q74k0QMKerq1HiQFhNsHXttV
	/8jplKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVH2-00000006Pk8-1dmV;
	Wed, 10 Apr 2024 10:33:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVGz-00000006PiZ-3WwO
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 10:33:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 99FBCCE243A;
	Wed, 10 Apr 2024 10:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7D7C433F1;
	Wed, 10 Apr 2024 10:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712745222;
	bh=OclJm2b5coJ7GAqomBi20Q1MQlO98q3YmhtCRp6MHgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHCU2eZlOVQ6Fn1rqVBJQD6A/hdz2jC4nekcQGIJ3Oak/Yv77DbdMrG5fW708QKcE
	 rdBs5r4Ts3uelQLYDfFudenLMLIXZ2oA5PtXL0LimpONBjZXRFaJbnEwd0F+uBMJXi
	 C3X3jBANFqfsSRlW5s2hm6ao9zW1P90fHheC/PrlJaOSZCZmDvCOfKv08x5e1/FbBt
	 WtMtMgAe6h5r/nk/YDEc1v6TgUDuaR6Hho7oYqcfi0sYvxEZk+KTFeYvTCOwaHPUpS
	 jHf+MQ/kRMsCrzrnJu+5gptJKj1ZW8mTuVDMbsQYEYWea2u40nWNNSDpl+a96xO7bC
	 7p9RmfZGXQgyA==
Date: Wed, 10 Apr 2024 12:33:39 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Quan Zhou <quan.zhou@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <Deren.Wu@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Shengxi Xu <shengxi.xu@mediatek.com>,
	Hao Zhang <hao.zhang@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: mt7921e: add LED control support
Message-ID: <ZhZrAyc84-VCdrdw@lore-desk>
References: <b376f88ab9fd69a5e4ba4bbd2c9fff3ef53b8968.1712735769.git.quan.zhou@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8ogLF0/+SbVAItaR"
Content-Disposition: inline
In-Reply-To: <b376f88ab9fd69a5e4ba4bbd2c9fff3ef53b8968.1712735769.git.quan.zhou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_033346_289334_9942531E 
X-CRM114-Status: GOOD (  16.76  )
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


--8ogLF0/+SbVAItaR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[...]

> +static void mt7921_stop(struct ieee80211_hw *hw)
> +{
> +	struct mt792x_dev *dev =3D mt792x_hw_dev(hw);
> +	int err =3D 0;
> +
> +	mt792x_mutex_acquire(dev);
> +	if (mt76_is_mmio(&dev->mt76))
> +		err =3D mt7921_mcu_radio_led_ctrl(dev, EXT_CMD_RADIO_OFF_LED);
> +	mt792x_mutex_release(dev);

you can avoid waking the device up here if it is not a pci one, right?

Regards,
Lorenzo

> +	if (err)
> +		return;
> +
> +	mt792x_stop(hw);
> +}
> +
>  static int
>  mt7921_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
>  {
> @@ -1372,7 +1396,7 @@ static void mt7921_mgd_complete_tx(struct ieee80211=
_hw *hw,
>  const struct ieee80211_ops mt7921_ops =3D {
>  	.tx =3D mt792x_tx,
>  	.start =3D mt7921_start,
> -	.stop =3D mt792x_stop,
> +	.stop =3D mt7921_stop,
>  	.add_interface =3D mt7921_add_interface,
>  	.remove_interface =3D mt792x_remove_interface,
>  	.config =3D mt7921_config,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index 8b4ce32a2cd1..2ebf0ffe78d5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -606,6 +606,20 @@ int mt7921_run_firmware(struct mt792x_dev *dev)
>  }
>  EXPORT_SYMBOL_GPL(mt7921_run_firmware);
> =20
> +int mt7921_mcu_radio_led_ctrl(struct mt792x_dev *dev, u8 value)
> +{
> +	struct {
> +		u8 ctrlid;
> +		u8 rsv[3];
> +	} __packed req =3D {
> +		.ctrlid =3D value,
> +	};
> +
> +	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(ID_RADIO_ON_OFF_CTRL),
> +				&req, sizeof(req), false);
> +}
> +EXPORT_SYMBOL_GPL(mt7921_mcu_radio_led_ctrl);
> +
>  int mt7921_mcu_set_tx(struct mt792x_dev *dev, struct ieee80211_vif *vif)
>  {
>  	struct mt792x_vif *mvif =3D (struct mt792x_vif *)vif->drv_priv;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index 3016636d18c6..07023eb9e5b5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -27,6 +27,10 @@
>  #define MCU_UNI_EVENT_ROC  0x27
>  #define MCU_UNI_EVENT_CLC  0x80
> =20
> +#define EXT_CMD_RADIO_LED_CTRL_ENABLE   0x1
> +#define EXT_CMD_RADIO_ON_LED            0x2
> +#define EXT_CMD_RADIO_OFF_LED           0x3
> +
>  enum {
>  	UNI_ROC_ACQUIRE,
>  	UNI_ROC_ABORT,
> @@ -196,6 +200,7 @@ int mt7921_mcu_fw_log_2_host(struct mt792x_dev *dev, =
u8 ctrl);
>  void mt7921_mcu_rx_event(struct mt792x_dev *dev, struct sk_buff *skb);
>  int mt7921_mcu_set_rxfilter(struct mt792x_dev *dev, u32 fif,
>  			    u8 bit_op, u32 bit_map);
> +int mt7921_mcu_radio_led_ctrl(struct mt792x_dev *dev, u8 value);
> =20
>  static inline u32
>  mt7921_reg_map_l1(struct mt792x_dev *dev, u32 addr)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index 0b69b225bc16..f768e9389ac6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -427,6 +427,10 @@ static int mt7921_pci_suspend(struct device *device)
>  	wait_event_timeout(dev->wait,
>  			   !dev->regd_in_progress, 5 * HZ);
> =20
> +	err =3D mt7921_mcu_radio_led_ctrl(dev, EXT_CMD_RADIO_OFF_LED);
> +	if (err < 0)
> +		goto restore_suspend;
> +
>  	err =3D mt76_connac_mcu_set_hif_suspend(mdev, true);
>  	if (err)
>  		goto restore_suspend;
> @@ -525,9 +529,11 @@ static int mt7921_pci_resume(struct device *device)
>  		mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
> =20
>  	err =3D mt76_connac_mcu_set_hif_suspend(mdev, false);
> +	if (err < 0)
> +		goto failed;
> =20
>  	mt7921_regd_update(dev);
> -
> +	err =3D mt7921_mcu_radio_led_ctrl(dev, EXT_CMD_RADIO_ON_LED);
>  failed:
>  	pm->suspended =3D false;
> =20
> --=20
> 2.18.0
>=20

--8ogLF0/+SbVAItaR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZhZrAwAKCRA6cBh0uS2t
rJvzAP4qQ8wtNWI1xk7v5F1P2+ivI7LtAHu++mTh3wc92gaYjAD/XjKLcWaMzVW/
1n0JDZwxe5pyGo+gJGEJAMYJjPQR7gc=
=6w4M
-----END PGP SIGNATURE-----

--8ogLF0/+SbVAItaR--

