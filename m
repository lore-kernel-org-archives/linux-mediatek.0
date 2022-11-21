Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEE9C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 13:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gostFoYP0+SlId2RpBGBYGc3O1hdymG4xuuuJ5/Dszg=; b=4O9lQqxrKfpXQtJC72xLXj48Dn
	IRYMQgCs/zOIX84EF7g71ymy+CMCQ0B41EojXsGq/UiInTr4LHFVVsyWhd06D4aIDG8U7xfmWV/B2
	Cww2r6Zzw3himQ4w7o4hpHxfb9o/XkpkEEaXmZZYA9Zhqb7mKGmEGPcSYF7z1H5bePGHYNRxw3qc1
	dDlcEMQ0zSVifbm9PwsCoT6tDhN3np1tm/C42I9Bo6FBvsD+p1IVL/JaGurzvoAuGsifrdpb9832O
	fm7wu4QRLDHLRUS0KtH0DjPrLbgb/fwQo0/awjgyHbyqFdR6MPnbLN0mJ5j4Jyoa9TOwuw1ajnRen
	f3AJseew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox73y-00E38C-Dg; Mon, 21 Nov 2022 13:42:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox73v-00E35c-02
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 13:42:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 643E2B81023;
	Mon, 21 Nov 2022 13:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BC4C433B5;
	Mon, 21 Nov 2022 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669038132;
	bh=Rh9V04sw0eTGJA8GsLZKnM7/0SQ0zwauz/7wuvowjPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5y2O2BP7orSYV40ecDaEHMQ+FtM/0DG2yaYjAWa/LQ3QIFf5JTzL2pH1LtoX1Leb
	 uMeM9RhMC+H+i9QImP9Pw7XOUeUYTMqmFt6WA+yDjNYPJ9MUmlU58t7fn7RO2BcnMg
	 pTp7tuCVztUr4yPvzHNGpUbF51+41D35OXBzRXAWV/mZ7lplzHcneIf5PsTDLvmrGB
	 nVnBezoNdGQyM1GyDdtVlIBiafDI2QVcRiiXipnIiAJCPjGGdegEMm8JphBxtzFZAB
	 PK4pqiuBXiasGEQjml3wt2delMvhE30jwZFz3xoX0QcvFnS4BRbWk6ViJCfaplZEWI
	 p/LQQKlNYM36A==
Date: Mon, 21 Nov 2022 14:42:08 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Sujuan Chen <sujuan.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Bo Jiao <bo.jiao@mediatek.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7915: add wds support when wed is enabled
Message-ID: <Y3uAMEfCxQhC46Hm@lore-desk>
References: <af04db938bf9633225c4358058a39aa3be0e218e.1669022945.git.sujuan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5rNvi9oVjM+cxjjT"
Content-Disposition: inline
In-Reply-To: <af04db938bf9633225c4358058a39aa3be0e218e.1669022945.git.sujuan.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_054215_375003_43802FEC 
X-CRM114-Status: GOOD (  19.15  )
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


--5rNvi9oVjM+cxjjT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[...]
>  };
> =20
>  enum mcu_mmps_mode {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/mmio.c
> index 1fcf34f57a16..d90793d082b8 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
> @@ -773,6 +773,9 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, void=
 *pdev_ptr,
> =20
>  	dev->mt76.rx_token_size =3D wed->wlan.rx_npkt;
> =20
> +	if (!is_mt7915(&dev->mt76))
> +		wed->wlan.wcid_512 =3D true;

I forgot to say this is already in this patch:

https://patchwork.kernel.org/project/linux-wireless/patch/c6a2a58cdd42b47b4=
c22137a40e357dd74ba8014.1668267241.git.lorenzo@kernel.org/

Regards,
Lorenzo

> +
>  	if (mtk_wed_device_attach(wed))
>  		return 0;
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/init.c
> index 79b8055ce4c4..702ff300f8f7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -283,7 +283,7 @@ static int mt7921_init_wcid(struct mt7921_dev *dev)
>  	int idx;
> =20
>  	/* Beacon and mgmt frames should occupy wcid 0 */
> -	idx =3D mt76_wcid_alloc(dev->mt76.wcid_mask, MT7921_WTBL_STA - 1);
> +	idx =3D mt76_wcid_alloc(dev->mt76.wcid_mask, MT7921_WTBL_STA - 1, 0);
>  	if (idx)
>  		return -ENOSPC;
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 41df17efdb3a..3d8771fcb847 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -814,7 +814,7 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct =
ieee80211_vif *vif,
>  	struct mt7921_vif *mvif =3D (struct mt7921_vif *)vif->drv_priv;
>  	int ret, idx;
> =20
> -	idx =3D mt76_wcid_alloc(dev->mt76.wcid_mask, MT7921_WTBL_STA - 1);
> +	idx =3D mt76_wcid_alloc(dev->mt76.wcid_mask, MT7921_WTBL_STA - 1, 0);
>  	if (idx < 0)
>  		return -ENOSPC;
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/init.c
> index cd1657e3585d..4cf055040519 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
> @@ -433,7 +433,7 @@ static int mt7996_init_hardware(struct mt7996_dev *de=
v)
>  		return ret;
> =20
>  	/* Beacon and mgmt frames should occupy wcid 0 */
> -	idx =3D mt76_wcid_alloc(dev->mt76.wcid_mask, MT7996_WTBL_STA);
> +	idx =3D mt76_wcid_alloc(dev->mt76.wcid_mask, MT7996_WTBL_STA, 0);
>  	if (idx)
>  		return -ENOSPC;
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/main.c
> index 21dea3fa7dc1..fd40b515cc5b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> @@ -579,7 +579,7 @@ int mt7996_mac_sta_add(struct mt76_dev *mdev, struct =
ieee80211_vif *vif,
>  	u8 band_idx =3D mvif->phy->mt76->band_idx;
>  	int ret, idx;
> =20
> -	idx =3D mt76_wcid_alloc(dev->mt76.wcid_mask, MT7996_WTBL_STA);
> +	idx =3D mt76_wcid_alloc(dev->mt76.wcid_mask, MT7996_WTBL_STA, 0);
>  	if (idx < 0)
>  		return -ENOSPC;
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/util.c b/drivers/net/wire=
less/mediatek/mt76/util.c
> index 581964425468..0850149f4200 100644
> --- a/drivers/net/wireless/mediatek/mt76/util.c
> +++ b/drivers/net/wireless/mediatek/mt76/util.c
> @@ -42,9 +42,14 @@ bool __mt76_poll_msec(struct mt76_dev *dev, u32 offset=
, u32 mask, u32 val,
>  }
>  EXPORT_SYMBOL_GPL(__mt76_poll_msec);
> =20
> -int mt76_wcid_alloc(u32 *mask, int size)
> +int mt76_wcid_alloc(u32 *mask, int size, u8 flag)
>  {
> +#define MT76_WED_WDS_MIN    256
> +#define MT76_WED_WDS_CNT    16
> +
>  	int i, idx =3D 0, cur;
> +	int min =3D MT76_WED_WDS_MIN;
> +	int max =3D min + MT76_WED_WDS_CNT;
> =20
>  	for (i =3D 0; i < DIV_ROUND_UP(size, 32); i++) {
>  		idx =3D ffs(~mask[i]);
> @@ -53,13 +58,46 @@ int mt76_wcid_alloc(u32 *mask, int size)
> =20
>  		idx--;
>  		cur =3D i * 32 + idx;
> -		if (cur >=3D size)
> +
> +		switch (flag) {
> +		case MT76_WED_DISABLED:
> +			if (cur >=3D size)
> +				goto error;
> +
>  			break;
> +		case MT76_WED_ACTIVE:
> +			if (cur >=3D min && cur < max)
> +				continue;
> +
> +			if (cur >=3D size) {
> +				u32 end =3D MT76_WED_WDS_CNT - 1;
> +
> +				i =3D min / 32;
> +				idx =3D ffs(~mask[i] & GENMASK(end, 0));
> +				if (!idx)
> +					goto error;
> +				idx--;
> +				cur =3D min + idx;
> +			}
> +
> +			break;
> +		case MT76_WED_WDS_ACTIVE:
> +			if (cur < min)
> +				continue;
> +			if (cur >=3D max)
> +				goto error;
> +
> +			break;
> +		default:
> +			WARN_ON(1);
> +			break;
> +		}
> =20
>  		mask[i] |=3D BIT(idx);
>  		return cur;
>  	}
> =20
> +error:
>  	return -1;
>  }
>  EXPORT_SYMBOL_GPL(mt76_wcid_alloc);
> diff --git a/drivers/net/wireless/mediatek/mt76/util.h b/drivers/net/wire=
less/mediatek/mt76/util.h
> index 260965dde94c..c72460e78389 100644
> --- a/drivers/net/wireless/mediatek/mt76/util.h
> +++ b/drivers/net/wireless/mediatek/mt76/util.h
> @@ -27,7 +27,7 @@ enum {
>  #define MT76_INCR(_var, _size) \
>  	(_var =3D (((_var) + 1) % (_size)))
> =20
> -int mt76_wcid_alloc(u32 *mask, int size);
> +int mt76_wcid_alloc(u32 *mask, int size, u8 flag);
> =20
>  static inline void
>  mt76_wcid_mask_set(u32 *mask, int idx)
> --=20
> 2.18.0
>=20

--5rNvi9oVjM+cxjjT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY3uAMAAKCRA6cBh0uS2t
rAGBAQD968eKsugzkCmoIbIahBXSlCzon1I7w5q78GDHkgojxQEAxogW9kRoTZL9
4Qk+yfenFVoiYSBs7ZzyfOveJ93H3Qc=
=pRVI
-----END PGP SIGNATURE-----

--5rNvi9oVjM+cxjjT--

