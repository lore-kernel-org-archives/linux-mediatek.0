Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D14C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 23:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgVDH6Qejhvdze2KIPWjOZnFThi/Hg6UYzCgkpwifSk=; b=PBz7WQv/r6ROaV9ruztLy+BuEz
	WtSpycLHNiGoe1kM+3OFVVBhdNKzPeV+4zgB+hNuAze69sN757UfKnegFqCTYzVzc2PC6kmguQ75u
	jh5415XYefKQY+743Btylam672HOXDn3Dq+FbVyFaZlVzEx9gIGC+rFoeT4UQB31tpa+AAJoUBj9P
	MYyG/3wJLWfPdtAlK3hpwpBZ+tR25hXzoBFpKV1l+ivBlb7HNmYlug7EiXbcEgQwyif92QiwSmgOv
	jBwLUAoSvMgKtPFyd0YDEv9a2BW16LqIVTVCA3KSU7osEl6VEsYiLqL1dH7151t45c3/Wjp1PoxLG
	eNCr1m3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN0gT-00GEJN-Rc; Wed, 23 Feb 2022 23:04:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN0gQ-00GEId-4I
 for linux-mediatek@lists.infradead.org; Wed, 23 Feb 2022 23:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645657466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V95pGPJLlj9L5ekfCdpJ+6cBoclcCqykIViJz3ppUSw=;
 b=V1nDNaQSLiCSSOI11v+Ys2zDmTc0NC8jZqMijBh3ugu7iN+67IofPmE0kbx81N3Z/Ens8e
 whb/njgD57gK859o1H2Ttb6ulg0oK8GSG8eAYJafpxOVlVOTOmmXYwBiJZTs5mUzNJcSHh
 CGazohK6gToUCWB9Bgv1aVWdZXuyu1w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-QghT5aIXMa2Xl7zwS1bu-A-1; Wed, 23 Feb 2022 18:04:25 -0500
X-MC-Unique: QghT5aIXMa2Xl7zwS1bu-A-1
Received: by mail-wr1-f69.google.com with SMTP id
 g15-20020adfbc8f000000b001e9506e27ddso18945wrh.22
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Feb 2022 15:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V95pGPJLlj9L5ekfCdpJ+6cBoclcCqykIViJz3ppUSw=;
 b=dWaaCPKxu3iykpwzha9jjwXcy8wX//A5CjSRKksQGXFF3Cj0fAIO0EPIuTDOBhSOWu
 xKhABqRbQQsJn2oOD9FZ0SRFfYKcBHwrbmdjRPR0O1/khCRpSm7znS/aXiq9StGxHUNc
 GL5d4vKxruT/qgTPoKUvpQGcn/mLNnXedj6zqoa1h4pgPpKgz7+A/JSP0IN2FdhBHyiH
 jyN+cySlImK0i9VKwecqT7sY206qsowAsEWCJMVY12g+oyUkhoPjxFuTtBscoeNTOrO7
 jfemo9dx3xttnSvrEGpKVXJuiYjciRe9jQ5/JSm+rvT5/Ibfcgpth8teIn4Dq41VrxjB
 tV4g==
X-Gm-Message-State: AOAM532ln414JQpb+RUuphVzwHM7iiAJxfJDtQVcLsocJ+sFkGVRAyLD
 pX99hW/SY7ALa7NOA5ElR6Z41JNaapoKqDGauNHB7/MuvND4k9+S8cTa+URZj2OEP0etezqp+k5
 ySWyPu+XafENSdL20d45QXlc60q7CusgH
X-Received: by 2002:a5d:584b:0:b0:1e8:b478:ca0 with SMTP id
 i11-20020a5d584b000000b001e8b4780ca0mr1312354wrf.377.1645657464109; 
 Wed, 23 Feb 2022 15:04:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw34gL3dObF4grYIvpi/c1DZzFbKcRvxVHQrTek4Hb+dEClRjXFz288+YeB6rg/Y3KC/cI/hg==
X-Received: by 2002:a5d:584b:0:b0:1e8:b478:ca0 with SMTP id
 i11-20020a5d584b000000b001e8b4780ca0mr1312329wrf.377.1645657463796; 
 Wed, 23 Feb 2022 15:04:23 -0800 (PST)
Received: from localhost ([37.183.9.66]) by smtp.gmail.com with ESMTPSA id
 a3-20020a7bc1c3000000b00380e493660esm923641wmj.42.2022.02.23.15.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 15:04:23 -0800 (PST)
Date: Thu, 24 Feb 2022 00:04:21 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Mark-YW.Chen@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, jenhao.yang@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, jemele@google.com, abhishekpandit@google.com,
 shawnku@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mt76: mt7921: fix up the monitor mode
Message-ID: <Yha9dZyAg8UE1UTb@lore-desk>
References: <7dcfc62d67f1f51e6627cc24000393844aa2b649.1645655280.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7dcfc62d67f1f51e6627cc24000393844aa2b649.1645655280.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_150430_547415_69B4BAED 
X-CRM114-Status: GOOD (  21.19  )
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
Content-Type: multipart/mixed; boundary="===============1560327830717808698=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1560327830717808698==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3DEXWJCIWIMNbrcT"
Content-Disposition: inline


--3DEXWJCIWIMNbrcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Properly set up the monitor mode the firmware can support to fix up
> RTS/CTS and beacon frames cannot be captured and forwarded to the host.
>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 31 +++++++++++++++++++
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  3 ++
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 23 ++++++++------
>  3 files changed, 47 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index 0a646ae51c8d..dded8a7d3efc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -2784,5 +2784,36 @@ int mt76_connac_mcu_rdd_cmd(struct mt76_dev *dev, =
int cmd, u8 index,
>  }
>  EXPORT_SYMBOL_GPL(mt76_connac_mcu_rdd_cmd);
> =20
> +int mt76_connac_mcu_set_sniffer(struct mt76_dev *dev, struct ieee80211_v=
if *vif,
> +				bool enable)

Hi Sean,

can this fw mcu be used with mt7663 fw? If not I guess we should move it in
mt7921/mcu.c

> +{
> +	struct mt76_vif *mvif =3D (struct mt76_vif *)vif->drv_priv;
> +	struct {
> +		struct {
> +			u8 band_idx;
> +			u8 pad[3];
> +		} __packed hdr;
> +		struct sniffer_enable_tlv {
> +			__le16 tag;
> +			__le16 len;
> +			u8 enable;
> +			u8 pad[3];
> +		} __packed enable;
> +		} req =3D {

nit: alignment.

Regards,
Lorenzo

> +		.hdr =3D {
> +			.band_idx =3D mvif->band_idx,
> +		},
> +		.enable =3D {
> +			.tag =3D cpu_to_le16(0),
> +			.len =3D cpu_to_le16(sizeof(struct sniffer_enable_tlv)),
> +			.enable =3D enable,
> +		},
> +	};
> +
> +	return mt76_mcu_send_msg(dev, MCU_UNI_CMD(SNIFFER), &req, sizeof(req),
> +				 true);
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_sniffer);
> +
>  MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index 384c3eab1c8a..96ab1a55af17 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -993,6 +993,7 @@ enum {
>  	MCU_UNI_CMD_SUSPEND =3D 0x05,
>  	MCU_UNI_CMD_OFFLOAD =3D 0x06,
>  	MCU_UNI_CMD_HIF_CTRL =3D 0x07,
> +	MCU_UNI_CMD_SNIFFER =3D 0x24,
>  };
> =20
>  enum {
> @@ -1653,4 +1654,6 @@ int mt76_connac_mcu_set_pm(struct mt76_dev *dev, in=
t band, int enter);
>  int mt76_connac_mcu_restart(struct mt76_dev *dev);
>  int mt76_connac_mcu_rdd_cmd(struct mt76_dev *dev, int cmd, u8 index,
>  			    u8 rx_sel, u8 val);
> +int mt76_connac_mcu_set_sniffer(struct mt76_dev *dev, struct ieee80211_v=
if *vif,
> +				bool enable);
>  #endif /* __MT76_CONNAC_MCU_H */
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index b6e836a4fad7..051a573141f4 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -479,6 +479,16 @@ mt7921_pm_interface_iter(void *priv, u8 *mac, struct=
 ieee80211_vif *vif)
>  	mt7921_mcu_set_beacon_filter(dev, vif, dev->pm.enable);
>  }
> =20
> +static void
> +mt7921_sniffer_interface_iter(void *priv, u8 *mac, struct ieee80211_vif =
*vif)
> +{
> +	struct mt7921_dev *dev =3D priv;
> +	struct ieee80211_hw *hw =3D mt76_hw(dev);
> +	bool enabled =3D !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
> +
> +	mt76_connac_mcu_set_sniffer(&dev->mt76, vif, enabled);
> +}
> +
>  void mt7921_set_runtime_pm(struct mt7921_dev *dev)
>  {
>  	struct ieee80211_hw *hw =3D dev->mphy.hw;
> @@ -516,16 +526,9 @@ static int mt7921_config(struct ieee80211_hw *hw, u3=
2 changed)
>  	}
> =20
>  	if (changed & IEEE80211_CONF_CHANGE_MONITOR) {
> -		bool enabled =3D !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
> -
> -		if (!enabled)
> -			phy->rxfilter |=3D MT_WF_RFCR_DROP_OTHER_UC;
> -		else
> -			phy->rxfilter &=3D ~MT_WF_RFCR_DROP_OTHER_UC;
> -
> -		mt76_rmw_field(dev, MT_DMA_DCR0(0), MT_DMA_DCR0_RXD_G5_EN,
> -			       enabled);
> -		mt76_wr(dev, MT_WF_RFCR(0), phy->rxfilter);
> +		ieee80211_iterate_active_interfaces(hw,
> +						    IEEE80211_IFACE_ITER_RESUME_ALL,
> +						    mt7921_sniffer_interface_iter, dev);
>  		mt7921_set_runtime_pm(dev);
>  	}
> =20
> --=20
> 2.25.1
>=20

--3DEXWJCIWIMNbrcT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYha9dQAKCRA6cBh0uS2t
rPvUAQD/TrEtLbbFmHEfT0EZ/ZDdi5VvHSBF0ZHtHi39izFkBQD/RCVndmE7R5IW
U/3lztjMO89+a27izp4P5ziD5BJMRw0=
=ddkq
-----END PGP SIGNATURE-----

--3DEXWJCIWIMNbrcT--



--===============1560327830717808698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1560327830717808698==--


