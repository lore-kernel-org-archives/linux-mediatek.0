Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E644C47093
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 08:34:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56BAC613CD
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 08:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56BAC613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZ3uohrpSpKkjgRKB+OBmi1K/pt5Scom9bUKA5w1ciI=; b=ziXnSMOOpt19zLKdN9i5qMkBr7
	W2IoI35ku3UJbe1AqEwknIg7piossKdClbGvv9B0nsjLgWz3TK2UJ3T3EQwNNq9zjBE1OfHe2RXrp
	o4DgVbKAzaRV49+Zu5hhu1RAk6w3jYpYz96r8+nXAPEUHAbuDjipjRn54NxWp89AtGhmnv1Cqhgob
	XGznVsOt106aQ7QfNJWohhbdLXP3NnkKaDrffy1ZHVCDBtKYnfoFP0Yi/BkjpTWdOkMU/tQnLs/0K
	wH4X0kQFY6kj/ZVqfhYoxpsNWd+zi68nLyn9FNSZ/sklUjVnLIbxoXc1ko9RQW/Q2HE4bdqCdABgJ
	5naL1A4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loMKU-002gZx-N3; Wed, 02 Jun 2021 08:34:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loLo7-002SmD-RR
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 08:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622620854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ki95pkYX53QROLycZkIx/h4egE+ImAwaK+p9klqFc8=;
 b=IB7K+fItIlLNZ19ff8SUKfbuFWlFRkotvO8SfYX8OrYEpav5Szrjdbe0cSGX2vpHloI5/7
 NfbdE+/x06QQe39MX/tUNHqJabK5qreYo8jkq2cns9dvGBwJJ+RMsPqSgARlTydlemkg2N
 SUAoSB9gTOxFnehmf7V8u9b/6cwxZkM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-q4bSDym3NnKZdAl-SVStPA-1; Wed, 02 Jun 2021 04:00:50 -0400
X-MC-Unique: q4bSDym3NnKZdAl-SVStPA-1
Received: by mail-ej1-f72.google.com with SMTP id
 eb10-20020a170907280ab02903d65bd14481so353845ejc.21
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Jun 2021 01:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JhTNYg0UXB2ejGVfxIE9halIgMdMaFFp/+elkOmXlM0=;
 b=t+GiOO2JYuAhDuLhrSDNGrObPSw9e9b3HHl4H88psobN5BzOepjfbWYtHqNRWHrGBT
 +qu4/UHA45DHTRTM3C4NB1B1teF8v3Wx9h10vOJJeNFiG1puIvX7dH5xD9D/N+1Q88FR
 e6q4S+Xn9KWp2O2pB7bGU+9cPVze70MVZGDZatLI/SyFiXMVZQF+MGCVVEGhy6sLQVDY
 CCUY0cWy02625FIT7FrNMHZsltu+tlDKuJNsTt6TKUM8MMugyZAF96tp61mO0qDnmYb5
 CER2YNteGGPH3znGQMxJsXgLjeSZGgTG/ZmJT1N0ubdbgZxiIwyB8WOMbKbwPNuDWgcy
 gOcw==
X-Gm-Message-State: AOAM530H5QtZTPyiYorJG90qI4Rc9G38oXA4tjcSzCuULP0PyJLvvU6P
 DpzNLT0812RGhLVXIGSM5/eeSJGnYNDmmQRIh0OlKCKY4A9dzP0wavv3HDAXu58a8nLTiCwnN7l
 geHsTS9Uj/PG59Tebl5nAcOfkIQg/rqCL
X-Received: by 2002:a17:906:174e:: with SMTP id
 d14mr33331981eje.397.1622620849410; 
 Wed, 02 Jun 2021 01:00:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4kBQQ+qVbLdHbp+3IgNhckO2HU0Frk857T6F/mIv2SQNg0q0hJFEo9hzt9BWkahSiLcGoNQ==
X-Received: by 2002:a17:906:174e:: with SMTP id
 d14mr33331968eje.397.1622620849195; 
 Wed, 02 Jun 2021 01:00:49 -0700 (PDT)
Received: from localhost (net-93-71-117-34.cust.vodafonedsl.it. [93.71.117.34])
 by smtp.gmail.com with ESMTPSA id o4sm760191edc.94.2021.06.02.01.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 01:00:48 -0700 (PDT)
Date: Wed, 2 Jun 2021 10:00:45 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/3] mt76: mt7921: add mt7921_mcu_sta_update support
Message-ID: <YLc6rWoCtuCdJDiZ@lore-desk>
References: <db74f1c3acd2a2729066810ad72b656681a30693.1622610746.git.objelf@gmail.com>
 <b6998d5ed25f86e1afce68060d840e0e37cb6670.1622610746.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6998d5ed25f86e1afce68060d840e0e37cb6670.1622610746.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_010056_020240_45259E3D 
X-CRM114-Status: GOOD (  18.54  )
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
Content-Type: multipart/mixed; boundary="===============5963410207951837787=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============5963410207951837787==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hTneQT6p+ZoNK9OO"
Content-Disposition: inline

--hTneQT6p+ZoNK9OO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Add mt7921_mcu_sta_update support to make we are able to update the stati=
on
> record with the current state the station has into the mt7921 firmware at
> runtime. That is the prerequisite patch to fix .sta_state incorrect
> implementation for the mt7921 driver.
>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v1->v2: no change
> ---
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 20 +++++++++++++++++++
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 ++
>  2 files changed, 22 insertions(+)

What about squashing this patch with 3/3? it is just used there.

Regards,
Lorenzo

>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index 631f408520c9..3f53bd9b2b55 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -1342,6 +1342,26 @@ int mt7921_mcu_sta_add(struct mt7921_dev *dev, str=
uct ieee80211_sta *sta,
>  =09return mt76_connac_mcu_add_sta_cmd(&dev->mphy, &info);
>  }
> =20
> +int mt7921_mcu_sta_update(struct mt7921_dev *dev, struct ieee80211_sta *=
sta,
> +=09=09=09  struct ieee80211_vif *vif, u8 state)
> +{
> +=09struct mt7921_vif *mvif =3D (struct mt7921_vif *)vif->drv_priv;
> +=09int rssi =3D -ewma_rssi_read(&mvif->rssi);
> +=09struct mt76_sta_cmd_info info =3D {
> +=09=09.sta =3D sta,
> +=09=09.vif =3D vif,
> +=09=09.enable =3D true,
> +=09=09.state =3D state,
> +=09=09.cmd =3D MCU_UNI_CMD_STA_REC_UPDATE,
> +=09=09.rcpi =3D to_rcpi(rssi),
> +=09};
> +=09struct mt7921_sta *msta;
> +
> +=09msta =3D sta ? (struct mt7921_sta *)sta->drv_priv : NULL;
> +=09info.wcid =3D msta ? &msta->wcid : &mvif->sta.wcid;
> +=09return mt76_connac_mcu_update_sta_cmd(&dev->mphy, &info);
> +}
> +
>  int __mt7921_mcu_drv_pmctrl(struct mt7921_dev *dev)
>  {
>  =09struct mt76_phy *mphy =3D &dev->mt76.phy;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index 694f85e52222..13d0f472b043 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -262,6 +262,8 @@ int mt7921_mcu_add_key(struct mt7921_dev *dev, struct=
 ieee80211_vif *vif,
>  int mt7921_set_channel(struct mt7921_phy *phy);
>  int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta=
,
>  =09=09       struct ieee80211_vif *vif, bool enable, u8 state);
> +int mt7921_mcu_sta_update(struct mt7921_dev *dev, struct ieee80211_sta *=
sta,
> +=09=09=09  struct ieee80211_vif *vif, u8 state);
>  int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd);
>  int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif)=
;
>  int mt7921_mcu_set_eeprom(struct mt7921_dev *dev);
> --=20
> 2.25.1
>=20

--hTneQT6p+ZoNK9OO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYLc6qQAKCRA6cBh0uS2t
rOjaAP9XHhEzeIC5SDLO2xrrEm8Y+sP6n3LgsmXhGrrj0xxGxAD/cLV97Y64JDbL
M5McDNe2ica+NLDi2bjnCxn5xDb3iwk=
=YGUP
-----END PGP SIGNATURE-----

--hTneQT6p+ZoNK9OO--



--===============5963410207951837787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5963410207951837787==--


