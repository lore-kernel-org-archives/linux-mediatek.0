Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8EAC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kG9AXeTl19f4EKHdYTi1yOfVIk3bG1ak9XH8Lo3CoA=; b=UVs4MpnUHKYCIBo/P4vmnDdPSP
	DCzXZwoNcw0xlWqHRWr6I/2GtDAwOSIR1WQOSWxFOVg9MVaSMGkofbXZlskkYVDksoCwPXrAocioF
	Tqu2kxen1/RSs67Sq+1xJMORe+DWvWIc8VGOMPbRp6indq2j5Wh/b98a/Bi6YBhOkyXfu9kEJfJYZ
	lJ3G31Ge+F9DYnRxYB2yMnH2vSopr4/yFu2CoLOjqvY8uD7yhQcgC+LZk20+0Ef/0kvmX6QS42tBj
	nLpPlW2i7LZ8TF0eHhKSlNR8dC6IqcZ74y0vHqfrMGZN3DVXJaXm4fGW/OvaUC2Vda4oC18Sovcug
	p6mkUsqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIqsi-00Gy9i-1V;
	Thu, 28 Dec 2023 13:57:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIqsg-00Gy9K-0h
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Dec 2023 13:57:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 29931B80DF4;
	Thu, 28 Dec 2023 13:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8A8C433C9;
	Thu, 28 Dec 2023 13:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703771818;
	bh=hATKOzQ3Q86ZtUqOoVn7GJyRPGck95qMw+6ADEnabXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwhCzhasK6hswS3nE4O0iXFkWECzy6V4t+bZSD8boruVp/yREufAWt5WF50OyJRbE
	 tXiJTrQsI9yo469f2vD61Qhd3KubX7UGWbpkeYcaVF9rjMmwfvlymkzuHV4CneYSCE
	 XnnC0G62dLcaPzCmMgIfVm6KdEPpWoeRHBJ3NEo5JQACC8s8je/k8/OtQoq6Tmtq5t
	 e1LyAJCStWkOP4enFH7igkYrHx/v6BzUWonwJl8MH/AwiPzHBbJSCsIwjJMwZFSAHW
	 QZnsOn1zARfkRTN7lZajwZXp4pQPcta8dMUV47Td0ywpieRXtKdJMQCdfuUi0drYta
	 qrvFRYh2RTTnA==
Date: Thu, 28 Dec 2023 14:56:52 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: nbd@nbd.name, deren.wu@mediatek.com, Sean.Wang@mediatek.com,
	Soul.Huang@mediatek.com, Leon.Yen@mediatek.com,
	Eric-SY.Chang@mediatek.com, km.lin@mediatek.com,
	robin.chiu@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
	Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com,
	Shayne.Chen@mediatek.com, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 04/10] wifi: mt76: mt7925: fix wmm queue mapping
Message-ID: <ZY1-pG8isKAXBhqa@lore-rh-laptop>
References: <20231228090749.15191-1-mingyen.hsieh@mediatek.com>
 <20231228090749.15191-5-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WQ30o7v/EYClCnAa"
Content-Disposition: inline
In-Reply-To: <20231228090749.15191-5-mingyen.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_055702_566901_62844E5F 
X-CRM114-Status: GOOD (  15.64  )
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


--WQ30o7v/EYClCnAa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>=20
> Firmware uses access class index (ACI) for wmm parameters update,
> so convert mac80211 queue to ACI in mt7925_conf_tx().
>=20
> Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for =
mt7925 chips")
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7925/main.c  | 21 ++++++++++++++++++-
>  .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  2 +-
>  2 files changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/main.c
> index a080df58120f..b832dd8adee5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> @@ -1273,6 +1273,25 @@ mt7925_channel_switch_beacon(struct ieee80211_hw *=
hw,
>  	mt792x_mutex_release(dev);
>  }
> =20
> +static int
> +mt7925_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
> +	       unsigned int link_id, u16 queue,
> +	       const struct ieee80211_tx_queue_params *params)
> +{
> +	struct mt792x_vif *mvif =3D (struct mt792x_vif *)vif->drv_priv;
> +	const u8 mq_to_aci[] =3D {

nit: static const here

Regards,
Lorenzo

> +		    [IEEE80211_AC_VO] =3D 3,
> +		    [IEEE80211_AC_VI] =3D 2,
> +		    [IEEE80211_AC_BE] =3D 0,
> +		    [IEEE80211_AC_BK] =3D 1,
> +	};
> +
> +	/* firmware uses access class index */
> +	mvif->queue_params[mq_to_aci[queue]] =3D *params;
> +
> +	return 0;
> +}
> +
>  static int
>  mt7925_start_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
>  		struct ieee80211_bss_conf *link_conf)
> @@ -1396,7 +1415,7 @@ const struct ieee80211_ops mt7925_ops =3D {
>  	.add_interface =3D mt7925_add_interface,
>  	.remove_interface =3D mt792x_remove_interface,
>  	.config =3D mt7925_config,
> -	.conf_tx =3D mt792x_conf_tx,
> +	.conf_tx =3D mt7925_conf_tx,
>  	.configure_filter =3D mt7925_configure_filter,
>  	.bss_info_changed =3D mt7925_bss_info_changed,
>  	.start_ap =3D mt7925_start_ap,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.c
> index 4811fccbe30e..0299045b4b83 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -895,7 +895,7 @@ int mt7925_mcu_set_tx(struct mt792x_dev *dev, struct =
ieee80211_vif *vif)
> =20
>  		e =3D (struct edca *)tlv;
>  		e->set =3D WMM_PARAM_SET;
> -		e->queue =3D ac + mvif->mt76.wmm_idx * MT76_CONNAC_MAX_WMM_SETS;
> +		e->queue =3D ac;
>  		e->aifs =3D q->aifs;
>  		e->txop =3D cpu_to_le16(q->txop);
> =20
> --=20
> 2.18.0
>=20

--WQ30o7v/EYClCnAa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZY1+oQAKCRA6cBh0uS2t
rPj8AP0Qg+6JBTjCMzdcyWCdxF9WJUoD8KX46+BDiNcsAwtWfwD9GQOsR6uC8i+V
DBdzmKvn6Mg5rijo8s1SO00vDUv96Ak=
=GFFC
-----END PGP SIGNATURE-----

--WQ30o7v/EYClCnAa--

