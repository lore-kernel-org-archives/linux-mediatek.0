Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BB4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 08:47:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB15B610C8
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 08:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB15B610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exYAq02Q6v3kZil5sVqDrSD2CnbLlAeVxnbCuPjwjdc=; b=yIvdZ6DIQa+qKasBhQCqEKXimC
	xEOJQKUsrv3jP2uNo+k/xUv7h0nY9V++kR0hHlLhV4D51C05DaaIlL/Ht8OGFnksxEkCPiYnAnuri
	D9WZOQ21G6KbZWnHeCgNhkxQVsyfcFFx0SosKQNL1i4E53FnrW6Jqxwf7M/npLCsL5Vq77btjz7+7
	fKS+HnqJvQimzbt4R6HRTvSGot7SqxOoIYB00dKbWYKrCHPavij2LD3Pomp0KYZ8Nq39nuz9J5v68
	f+QNU1De9QziUgNqwFZuKCav+eIKaU8cOpB7yTu9PkeKjmKXloBnI4RrA2tE+3jcmcXvG7eqY0uHA
	w4gNNs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg14H-007Iev-7e; Thu, 28 Oct 2021 08:47:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg14E-007IeW-Pl
 for linux-mediatek@lists.infradead.org; Thu, 28 Oct 2021 08:47:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88C8C60551;
 Thu, 28 Oct 2021 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635410842;
 bh=gecdne1XAj7GaAChlzxHKs+r4b/HLyjtW86t5MSFcdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UQvvB4qZFhCWeUaRKlyfjE6RmeXD4m0P4kFWAl887Pivbv3X/9uG3MVcmID/GZkk4
 Q5kUGuwGWqIhUX2vgDGRqwvZC4xcXKajKJsaXibTV/9Hw4rhOxIenPOuO02yHzt2vk
 lMAKX4Wp4W9fFQbTjGYCRrhrOZrmJpfkDXMXYZn50SBaSaZ3ct11Tt0kv55uLdW2j4
 taNR9HAvwhivzAE9mXjJsuiK+g/CuM3eZc3c+SFq3GayZZzWOyI8kWDcH1I3+o8LVe
 HjFOLBWP8DgCpaXnLnxprnbcB56iCy4Mi01mxc0aHWG9B5BZMaqn/GFEP1ofALtWoL
 DGkVEf3pqmpLw==
Date: Thu, 28 Oct 2021 10:47:18 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Bo Jiao <Bo.Jiao@mediatek.com>
Subject: Re: [PATCH] mt76: mt7915: add default calibrated data support
Message-ID: <YXpjlrp/4d2AruNE@lore-desk>
References: <20211027080747.24388-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20211027080747.24388-1-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_014722_936565_AB49F4B3 
X-CRM114-Status: GOOD (  23.30  )
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
Content-Type: multipart/mixed; boundary="===============1733089133243185825=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1733089133243185825==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="53fIPWQhf2prwpyD"
Content-Disposition: inline


--53fIPWQhf2prwpyD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Load the default eeprom data when the content of flash/efuse is invalid.
> This could help to eliminate some issues due to incorrect or
> insufficient rf values.
>=20
> Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt7915/eeprom.c    | 83 +++++++++++++++----
>  .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 24 ++++++
>  .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
>  .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 +
>  4 files changed, 98 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers=
/net/wireless/mediatek/mt76/mt7915/eeprom.c
> index ee3d644..626ea4a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: ISC
>  /* Copyright (C) 2020 MediaTek Inc. */
> =20
> +#include <linux/firmware.h>
>  #include "mt7915.h"
>  #include "eeprom.h"
> =20
> @@ -10,6 +11,9 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev =
*dev)
>  	u8 *eeprom =3D mdev->eeprom.data;
>  	u32 val =3D eeprom[MT_EE_DO_PRE_CAL];
> =20
> +	if (!dev->flash_mode)
> +		return 0;
> +
>  	if (val !=3D (MT_EE_WIFI_CAL_DPD | MT_EE_WIFI_CAL_GROUP))
>  		return 0;
> =20
> @@ -21,6 +25,49 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev=
 *dev)
>  	return mt76_get_of_eeprom(mdev, dev->cal, MT_EE_PRECAL, val);
>  }
> =20
> +static int mt7915_check_eeprom(struct mt7915_dev *dev)
> +{
> +	u8 *eeprom =3D dev->mt76.eeprom.data;
> +	u16 val =3D get_unaligned_le16(eeprom);
> +
> +	switch (val) {
> +	case 0x7915:
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int
> +mt7915_eeprom_load_default(struct mt7915_dev *dev)
> +{
> +	char *default_bin =3D MT7915_EEPROM_DEFAULT;
> +	u8 *eeprom =3D dev->mt76.eeprom.data;
> +	const struct firmware *fw =3D NULL;
> +	int ret;
> +
> +	if (dev->dbdc_support)
> +		default_bin =3D MT7915_EEPROM_DEFAULT_DBDC;
> +
> +	ret =3D request_firmware(&fw, default_bin, dev->mt76.dev);
> +	if (ret)
> +		goto out;

nit: you can just drop goto and return ret here

> +
> +	if (!fw || !fw->data) {
> +		dev_err(dev->mt76.dev, "Invalid default bin\n");
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	memcpy(eeprom, fw->data, MT7915_EEPROM_SIZE);
> +	dev->flash_mode =3D true;
> +
> +out:
> +	release_firmware(fw);
> +
> +	return ret;
> +}
> +
>  static int mt7915_eeprom_load(struct mt7915_dev *dev)
>  {
>  	int ret;
> @@ -31,8 +78,8 @@ static int mt7915_eeprom_load(struct mt7915_dev *dev)
> =20
>  	if (ret) {
>  		dev->flash_mode =3D true;
> -		ret =3D mt7915_eeprom_load_precal(dev);
>  	} else {
> +		/* read eeprom data from efuse */
>  		u32 block_num, i;
> =20
>  		block_num =3D DIV_ROUND_UP(MT7915_EEPROM_SIZE,
> @@ -42,20 +89,28 @@ static int mt7915_eeprom_load(struct mt7915_dev *dev)
>  					      i * MT7915_EEPROM_BLOCK_SIZE);
>  	}
> =20
> -	return ret;
> -}
> -
> -static int mt7915_check_eeprom(struct mt7915_dev *dev)
> -{
> -	u8 *eeprom =3D dev->mt76.eeprom.data;
> -	u16 val =3D get_unaligned_le16(eeprom);
> +	if (!dev->flash_mode) {
> +		u8 free_block_num;
> +
> +		mt7915_mcu_get_eeprom_free_block(dev, &free_block_num);
> +		if (free_block_num >=3D 29) {
> +			dev_warn(dev->mt76.dev,
> +				 "efuse info not enough, use default bin\n");
> +			ret =3D mt7915_eeprom_load_default(dev);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> =20
> -	switch (val) {
> -	case 0x7915:
> -		return 0;
> -	default:
> -		return -EINVAL;
> +	ret =3D mt7915_check_eeprom(dev);
> +	if (ret) {
> +		dev_warn(dev->mt76.dev, "eeprom check fail, use default bin\n");
> +		ret =3D mt7915_eeprom_load_default(dev);
> +		if (ret)
> +			return ret;

nit: drop return here or just return 0 at the end

>  	}
> +
> +	return ret;
>  }
> =20
>  void mt7915_eeprom_parse_band_config(struct mt7915_phy *phy)
> @@ -120,7 +175,7 @@ int mt7915_eeprom_init(struct mt7915_dev *dev)
>  	if (ret < 0)
>  		return ret;
> =20
> -	ret =3D mt7915_check_eeprom(dev);
> +	ret =3D mt7915_eeprom_load_precal(dev);
>  	if (ret)
>  		return ret;
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.c
> index b054663..ee9952d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -3580,6 +3580,30 @@ int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, =
u32 offset)
>  	return 0;
>  }
> =20
> +int mt7915_mcu_get_eeprom_free_block(struct mt7915_dev *dev, u8 *block_n=
um)
> +{
> +	struct {
> +		u8 _rsv;
> +		u8 version;
> +		u8 die_idx;
> +		u8 _rsv2;
> +	} __packed req =3D {
> +		.version =3D 1,
> +	};
> +	struct sk_buff *skb;
> +	int ret;
> +
> +	ret =3D mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_QUERY(EFUSE_FREE_=
BLOCK), &req,
> +					sizeof(req), true, &skb);
> +	if (ret)
> +		return ret;
> +
> +	*block_num =3D *(u8 *)skb->data;
> +	dev_kfree_skb(skb);
> +
> +	return 0;
> +}
> +
>  static int mt7915_mcu_set_pre_cal(struct mt7915_dev *dev, u8 idx,
>  				  u8 *data, u32 len, int cmd)
>  {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.h
> index b563e7c..e9f39ed 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
> @@ -278,6 +278,7 @@ enum {
>  	MCU_EXT_CMD_MUAR_UPDATE =3D 0x48,
>  	MCU_EXT_CMD_RX_AIRTIME_CTRL =3D 0x4a,
>  	MCU_EXT_CMD_SET_RX_PATH =3D 0x4e,
> +	MCU_EXT_CMD_EFUSE_FREE_BLOCK =3D 0x4f,
>  	MCU_EXT_CMD_TX_POWER_FEATURE_CTRL =3D 0x58,
>  	MCU_EXT_CMD_GET_MIB_INFO =3D 0x5a,
>  	MCU_EXT_CMD_MWDS_SUPPORT =3D 0x80,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers=
/net/wireless/mediatek/mt76/mt7915/mt7915.h
> index e69b4c8..c6c846d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> @@ -30,6 +30,9 @@
>  #define MT7915_FIRMWARE_WM		"mediatek/mt7915_wm.bin"
>  #define MT7915_ROM_PATCH		"mediatek/mt7915_rom_patch.bin"
> =20
> +#define MT7915_EEPROM_DEFAULT		"mediatek/mt7915_eeprom.bin"
> +#define MT7915_EEPROM_DEFAULT_DBDC	"mediatek/mt7915_eeprom_dbdc.bin"
> +
>  #define MT7915_EEPROM_SIZE		3584
>  #define MT7915_EEPROM_BLOCK_SIZE	16
>  #define MT7915_TOKEN_SIZE		8192
> @@ -423,6 +426,7 @@ int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev =
*dev,
>  				   void *data, u32 field);
>  int mt7915_mcu_set_eeprom(struct mt7915_dev *dev);
>  int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, u32 offset);
> +int mt7915_mcu_get_eeprom_free_block(struct mt7915_dev *dev, u8 *block_n=
um);
>  int mt7915_mcu_set_mac(struct mt7915_dev *dev, int band, bool enable,
>  		       bool hdr_trans);
>  int mt7915_mcu_set_test_param(struct mt7915_dev *dev, u8 param, bool tes=
t_mode,
> --=20
> 2.25.1
>=20

--53fIPWQhf2prwpyD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYXpjlgAKCRA6cBh0uS2t
rMGbAQCSfDkJpP/YJAkg8yTcGa5L/NFjTc2pDv0SurGpAdTFbQD9GJ/GTeYi9nlM
aBO/jSns/WnpobTEYku5EMCpeDG+Twk=
=fC/D
-----END PGP SIGNATURE-----

--53fIPWQhf2prwpyD--


--===============1733089133243185825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1733089133243185825==--

