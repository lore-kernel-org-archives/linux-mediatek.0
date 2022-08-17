Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244F7C25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 07:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKQePQvW1ALuWEXm/VG88ra0mrLbzMpDxPpSOPgt8ag=; b=QVjxPDAA7E4v6C/l2YCG030FRh
	02HdJS1uGMwBB1+jVkx25LUP6D8oSVpwUzuYj4T+y61qhxIR/Rqtg3x0iui3/5VjHCOL2n8zvmxMW
	M0WBc2xBaEOfxoknIW2n/SXbswsj1pM8KJ3nQ9v1nhtBxJAIMRyYv5zlQ8FBzFtkXwOFNTklCndBj
	pxNV3LCBBmSsAD3EPeYoOXTkGj3KKDSm4cxO1g/m7D+rmasfeMxlREMrUp8dY/EJugIEU/Nkv+5sW
	d4TTB2T83Yl6jyEPKjU+JIXysMtyb9lFNr51CFUc6vEOJQAMoCWD6poGGFnBtQuZ+xNFsrzK4FuxC
	LIOJXElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODEr-00CvDB-23; Wed, 17 Aug 2022 07:13:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODEo-00Cv7Y-Qs
	for linux-mediatek@lists.infradead.org; Wed, 17 Aug 2022 07:13:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7FB67611EB;
	Wed, 17 Aug 2022 07:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A4EC433D6;
	Wed, 17 Aug 2022 07:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660720389;
	bh=LHqapTcb35VM5+7p3cR1l3bmFGIURULcrt2t/A88cto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iTT4G5AGVfI5NRsq7timgyCXls5GmC+FHv4nWqui/uUH7rUng+d7MRsPNNDg3CMeq
	 ywyRx4j+AkuiNbxrsqDNOaJk+9nFIUeL0P1dhm+kRpczzmC5bR5IFODLkzPnJox7V7
	 kV/qJUBbFhM67s/uqPeZbGF2iwxYsNa6L/kru8CZvU32Zf4k2LQLkYphdFGh/+yb0z
	 8plTOn4CCaQ9eT5Ia8GXhTPTu1MamKaAwhCWGcxhL6ih0ZZ6/vCnXbb2zatt3fDppc
	 +RK3pj4NHjOJo7IImp5I5yIvRvAID2gDf8uf0HAoj2urgRucd7IU2fCgHTLz9gpHhr
	 t3U66jzM6dp2Q==
Date: Wed, 17 Aug 2022 09:13:06 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
	YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
	Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com,
	km.lin@mediatek.com, jenhao.yang@mediatek.com,
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
	ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
	Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
	steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
	kuabhs@google.com, druth@google.com, abhishekpandit@google.com,
	shawnku@google.com, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/9] wifi: mt76: connac: rely on
 mt76_connac_mcu_uni_set_chctx
Message-ID: <YvyVAmu0RscaE8zs@lore-desk>
References: <cover.1660606893.git.objelf@gmail.com>
 <40d95ad10621c248a9129ef73158adfa9ffd6d17.1660606893.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZU+A2tqBkWBmk+7U"
Content-Disposition: inline
In-Reply-To: <40d95ad10621c248a9129ef73158adfa9ffd6d17.1660606893.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_001314_992861_05E43A34 
X-CRM114-Status: GOOD (  17.40  )
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


--ZU+A2tqBkWBmk+7U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Reuse mt76_connac_mcu_uni_set_chctx to avoid the dupicated code.

I guess you can squash this patch with the previous one.

Regards,
Lorenzo

>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 73 +------------------
>  1 file changed, 1 insertion(+), 72 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index 3d5c70765d4f..3e473a409790 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -1401,7 +1401,6 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *ph=
y,
>  {
>  	struct mt76_vif *mvif =3D (struct mt76_vif *)vif->drv_priv;
>  	struct cfg80211_chan_def *chandef =3D &phy->chandef;
> -	int freq1 =3D chandef->center_freq1, freq2 =3D chandef->center_freq2;
>  	enum nl80211_band band =3D chandef->chan->band;
>  	struct mt76_dev *mdev =3D phy->dev;
>  	struct {
> @@ -1432,43 +1431,6 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *p=
hy,
>  			.qos =3D vif->bss_conf.qos,
>  		},
>  	};
> -	struct {
> -		struct {
> -			u8 bss_idx;
> -			u8 pad[3];
> -		} __packed hdr;
> -		struct rlm_tlv {
> -			__le16 tag;
> -			__le16 len;
> -			u8 control_channel;
> -			u8 center_chan;
> -			u8 center_chan2;
> -			u8 bw;
> -			u8 tx_streams;
> -			u8 rx_streams;
> -			u8 short_st;
> -			u8 ht_op_info;
> -			u8 sco;
> -			u8 band;
> -			u8 pad[2];
> -		} __packed rlm;
> -	} __packed rlm_req =3D {
> -		.hdr =3D {
> -			.bss_idx =3D mvif->idx,
> -		},
> -		.rlm =3D {
> -			.tag =3D cpu_to_le16(UNI_BSS_INFO_RLM),
> -			.len =3D cpu_to_le16(sizeof(struct rlm_tlv)),
> -			.control_channel =3D chandef->chan->hw_value,
> -			.center_chan =3D ieee80211_frequency_to_channel(freq1),
> -			.center_chan2 =3D ieee80211_frequency_to_channel(freq2),
> -			.tx_streams =3D hweight8(phy->antenna_mask),
> -			.ht_op_info =3D 4, /* set HT 40M allowed */
> -			.rx_streams =3D phy->chainmask,
> -			.short_st =3D true,
> -			.band =3D band,
> -		},
> -	};
>  	int err, conn_type;
>  	u8 idx, basic_phy;
> =20
> @@ -1555,40 +1517,7 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *p=
hy,
>  			return err;
>  	}
> =20
> -	switch (chandef->width) {
> -	case NL80211_CHAN_WIDTH_40:
> -		rlm_req.rlm.bw =3D CMD_CBW_40MHZ;
> -		break;
> -	case NL80211_CHAN_WIDTH_80:
> -		rlm_req.rlm.bw =3D CMD_CBW_80MHZ;
> -		break;
> -	case NL80211_CHAN_WIDTH_80P80:
> -		rlm_req.rlm.bw =3D CMD_CBW_8080MHZ;
> -		break;
> -	case NL80211_CHAN_WIDTH_160:
> -		rlm_req.rlm.bw =3D CMD_CBW_160MHZ;
> -		break;
> -	case NL80211_CHAN_WIDTH_5:
> -		rlm_req.rlm.bw =3D CMD_CBW_5MHZ;
> -		break;
> -	case NL80211_CHAN_WIDTH_10:
> -		rlm_req.rlm.bw =3D CMD_CBW_10MHZ;
> -		break;
> -	case NL80211_CHAN_WIDTH_20_NOHT:
> -	case NL80211_CHAN_WIDTH_20:
> -	default:
> -		rlm_req.rlm.bw =3D CMD_CBW_20MHZ;
> -		rlm_req.rlm.ht_op_info =3D 0;
> -		break;
> -	}
> -
> -	if (rlm_req.rlm.control_channel < rlm_req.rlm.center_chan)
> -		rlm_req.rlm.sco =3D 1; /* SCA */
> -	else if (rlm_req.rlm.control_channel > rlm_req.rlm.center_chan)
> -		rlm_req.rlm.sco =3D 3; /* SCB */
> -
> -	return mt76_mcu_send_msg(mdev, MCU_UNI_CMD(BSS_INFO_UPDATE), &rlm_req,
> -				 sizeof(rlm_req), true);
> +	return mt76_connac_mcu_uni_set_chctx(phy, mvif, NULL);
>  }
>  EXPORT_SYMBOL_GPL(mt76_connac_mcu_uni_add_bss);
> =20
> --=20
> 2.25.1
>=20

--ZU+A2tqBkWBmk+7U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYvyVAQAKCRA6cBh0uS2t
rF5bAQCuxPiqG8ZkZVCGnHK0rT7aQUpVMfyLZ+BhQwH/WDqILwD/RiALvSb8yyaF
IRvOmWakFXqio75nVekpFYpU0Fqn4wk=
=f/3G
-----END PGP SIGNATURE-----

--ZU+A2tqBkWBmk+7U--

