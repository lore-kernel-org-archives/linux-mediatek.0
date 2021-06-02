Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658F4C47083
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 08:32:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 324A16139A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 08:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 324A16139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCVpeIvSEyqXFZ93HoqrhehONg/Yp7t7W8ql69QTuKk=; b=V5r5Y8JwCz38uC6CmHoqKsuNtg
	cgTrxi3z3cG3fiBK2MFwyPS9CsMObOBPTBiGDe86+kBiRdjaYHug5YJnW14EH3wBX7x7xk6BSbj+/
	Nr+WfC0WhyGYLE/YnLbaNYKQL4PVnD3pQcuXvgDPGJ00P1qcRM3CyDMwv+4jesvfAXTeOZiynZ7lQ
	fnjpbZBCVq3Za9kh0cOcrFDDDVdHwX/FV5WAwr4RylR6lZ7QbMcrVdkV9Aqs9CV/ixNXsnst3yOrp
	yL1THzSS7TIu9LsuYK7Uuddc2ia8xeAKiwalYq+NqZqAqoPfKpiZHco2Nw0a1d6ParJvrNeO8HFIR
	U17DtN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loMIQ-002fef-Ey; Wed, 02 Jun 2021 08:32:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loLf7-002Q2T-SL
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 07:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622620296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2+XaJpwdEBmLWNiQVyT6Wy4p1G93muYZEalj5L+PEgY=;
 b=Sqm7BTOFJE4lV+DwQOJGk/E1SPbR/IAO0LiuZgM6GbtuAtUvlsGO6GH1bcaMqg94GXIOXG
 NYl5FvqL26Xl63p8oj0AVgSZxlLMhi4EdnatqvVbDHVJuOUWCrf4HIOGdlKz+YSL1SJSOg
 p33WOshnMLXq/QTcWnJUt/pUKYyLsVw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-Dpt7_7YuNXGKME9GwJM-cw-1; Wed, 02 Jun 2021 03:51:32 -0400
X-MC-Unique: Dpt7_7YuNXGKME9GwJM-cw-1
Received: by mail-ej1-f69.google.com with SMTP id
 z1-20020a1709068141b02903cd421d7803so347704ejw.22
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Jun 2021 00:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y+f0Rpgg0gwVYNW1Y9Krvvm4PfIusPfL9uW367O1ntI=;
 b=CRw9BGk090UGBAiHK7TU4d8sauSbfjU2tL7/AmzUtr8Zo7fTbY9xIPDy+v6kmZWIIn
 RWbzer2LiG/JwhdnYU/BTeWMRlK/kBztU30R/NjR+58o1H1bEO/QLojhjbUsxAX+Q/AD
 W31eKhy0TJGEjYoKi2QLIfD0ae8B118zIWDFv87eBijFuYBLKEpVTBDHGg669Ii4vDvX
 bXv2jduSPXkQIequU5uuuKKRV+m6atS+Gqtz2vNtpMfi3Ac8G20KmSv6//C3ZscAhJMD
 Agcu14KXWUUKfhNQ6H/xG97A8spKqi9LDLqws8UzNpvktdXrC7ng/xfMlKYA97s+Zbmq
 gwmg==
X-Gm-Message-State: AOAM5318gtg24wI7BLQw/rDmty9gCL8OMtI9L/T+BJrARWLNRuL6uyp8
 Xc5R/GzaT3WXKaubIicKYtrXKSmGfSi03/BPOt0IS8au5lCiUE30Pr1rY+rq3GGQIURXqHW47zD
 kiPuOhQNIG5qAH9lhxuSJd+ZntIRIOcAr
X-Received: by 2002:a17:906:2510:: with SMTP id
 i16mr11677787ejb.218.1622620291805; 
 Wed, 02 Jun 2021 00:51:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0sR/o/Yumpl2rg9bzsyGs5NERtEaEoQlu+H/n93uTFJ+f1PJPBApZQglMqwHlSIZ4T44uLw==
X-Received: by 2002:a17:906:2510:: with SMTP id
 i16mr11677767ejb.218.1622620291633; 
 Wed, 02 Jun 2021 00:51:31 -0700 (PDT)
Received: from localhost (net-93-71-117-34.cust.vodafonedsl.it. [93.71.117.34])
 by smtp.gmail.com with ESMTPSA id dn4sm780881edb.88.2021.06.02.00.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 00:51:31 -0700 (PDT)
Date: Wed, 2 Jun 2021 09:51:28 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/3] mt76: mt7921: fix sta_state incorrect
 implementation
Message-ID: <YLc4gHgI6FpIGzMZ@lore-desk>
References: <db74f1c3acd2a2729066810ad72b656681a30693.1622610746.git.objelf@gmail.com>
 <129b40e5ff277efc0a1b0ff9b8c3dfb8a44ad7fe.1622610746.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <129b40e5ff277efc0a1b0ff9b8c3dfb8a44ad7fe.1622610746.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_005138_118455_0C946E69 
X-CRM114-Status: GOOD (  22.05  )
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
Content-Type: multipart/mixed; boundary="===============1005723356608671088=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============1005723356608671088==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mqgd5ozUDJP6SQDL"
Content-Disposition: inline

--mqgd5ozUDJP6SQDL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> When .sta_state is implemented, mac80211 assumes that the station entry i=
s
> usable after the NOTEXIST->NONE transition.
>=20
> So we should create the sta entry as early as possible in order that
> mac80211 pass assoc/auth frames to mt76 with the newly created sta entry,
> and add .sta_assoc to mt76 core to refresh the sta entry again when sta i=
s
> being associated.
>=20
> Fixes: 8aa5a9b7361c ("mt76: mt7921: enable deep sleep at runtime")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v1->v2: Put back the careless change not belonged to the patch to keep
> =09mt7921_mcu_sta_add for BC entry and mt76_connac_mcu_uni_add_bss
> =09on the association.
> ---
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 53 ++++++++-----------
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +
>  .../net/wireless/mediatek/mt76/mt7921/pci.c   |  1 +
>  3 files changed, 26 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index ece0cecf049d..ae07367a091a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -610,15 +610,11 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struc=
t ieee80211_vif *vif,
>  =09if (ret)
>  =09=09return ret;
> =20
> -=09if (vif->type =3D=3D NL80211_IFTYPE_STATION && !sta->tdls)
> -=09=09mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.wcid,
> -=09=09=09=09=09    true);
> -
>  =09mt7921_mac_wtbl_update(dev, idx,
>  =09=09=09       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> =20
>  =09ret =3D mt7921_mcu_sta_add(dev, sta, vif, true,
> -=09=09=09=09 MT76_STA_INFO_STATE_3);
> +=09=09=09=09 MT76_STA_INFO_STATE_1);
>  =09if (ret)
>  =09=09return ret;
> =20
> @@ -627,6 +623,27 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct=
 ieee80211_vif *vif,
>  =09return 0;
>  }
> =20
> +void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *v=
if,
> +=09=09=09  struct ieee80211_sta *sta)
> +{
> +=09struct mt7921_dev *dev =3D container_of(mdev, struct mt7921_dev, mt76=
);
> +=09struct mt7921_sta *msta =3D (struct mt7921_sta *)sta->drv_priv;
> +=09struct mt7921_vif *mvif =3D (struct mt7921_vif *)vif->drv_priv;
> +

here you need to grab grub the dev mutex because mt76 code does not do it f=
or
you

%s/mt76_connac_pm_wake(&dev->mphy, &dev->pm)/mt7921_mutex_acquire()/
> +=09mt76_connac_pm_wake(&dev->mphy, &dev->pm);
> +
> +=09if (vif->type =3D=3D NL80211_IFTYPE_STATION && !sta->tdls)
> +=09=09mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.wcid,
> +=09=09=09=09=09    true);
> +
> +=09mt7921_mac_wtbl_update(dev, msta->wcid.idx,
> +=09=09=09       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> +
> +=09mt7921_mcu_sta_update(dev, sta, vif, MT76_STA_INFO_STATE_3);
> +
> +=09mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
%s/mt76_connac_power_save_sched/mt7921_mutex_release/
> +}
> +
>  void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *=
vif,
>  =09=09=09   struct ieee80211_sta *sta)
>  {
> @@ -781,22 +798,6 @@ mt7921_ampdu_action(struct ieee80211_hw *hw, struct =
ieee80211_vif *vif,
>  =09return ret;
>  }
> =20
> -static int
> -mt7921_sta_add(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
> -=09       struct ieee80211_sta *sta)
> -{
> -=09return mt76_sta_state(hw, vif, sta, IEEE80211_STA_NOTEXIST,
> -=09=09=09      IEEE80211_STA_NONE);
> -}
> -
> -static int
> -mt7921_sta_remove(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
> -=09=09  struct ieee80211_sta *sta)
> -{
> -=09return mt76_sta_state(hw, vif, sta, IEEE80211_STA_NONE,
> -=09=09=09      IEEE80211_STA_NOTEXIST);
> -}
> -
>  static int mt7921_sta_state(struct ieee80211_hw *hw,
>  =09=09=09    struct ieee80211_vif *vif,
>  =09=09=09    struct ieee80211_sta *sta,
> @@ -811,15 +812,7 @@ static int mt7921_sta_state(struct ieee80211_hw *hw,
>  =09=09mt7921_mutex_release(dev);
>  =09}
> =20
> -=09if (old_state =3D=3D IEEE80211_STA_AUTH &&
> -=09    new_state =3D=3D IEEE80211_STA_ASSOC) {
> -=09=09return mt7921_sta_add(hw, vif, sta);
> -=09} else if (old_state =3D=3D IEEE80211_STA_ASSOC &&
> -=09=09   new_state =3D=3D IEEE80211_STA_AUTH) {
> -=09=09return mt7921_sta_remove(hw, vif, sta);
> -=09}
> -
> -=09return 0;
> +=09return mt76_sta_state(hw, vif, sta, old_state, new_state);
>  }
> =20
>  static int
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index 13d0f472b043..e97a74341ccd 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -264,6 +264,8 @@ int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct=
 ieee80211_sta *sta,
>  =09=09       struct ieee80211_vif *vif, bool enable, u8 state);
>  int mt7921_mcu_sta_update(struct mt7921_dev *dev, struct ieee80211_sta *=
sta,
>  =09=09=09  struct ieee80211_vif *vif, u8 state);
> +void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *v=
if,
> +=09=09=09  struct ieee80211_sta *sta);
>  int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd);
>  int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif)=
;
>  int mt7921_mcu_set_eeprom(struct mt7921_dev *dev);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index 13263f50dc00..27906b2cd912 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -106,6 +106,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>  =09=09.rx_poll_complete =3D mt7921_rx_poll_complete,
>  =09=09.sta_ps =3D mt7921_sta_ps,
>  =09=09.sta_add =3D mt7921_mac_sta_add,
> +=09=09.sta_assoc =3D mt7921_mac_sta_assoc,
>  =09=09.sta_remove =3D mt7921_mac_sta_remove,
>  =09=09.update_survey =3D mt7921_update_channel,
>  =09};
> --=20
> 2.25.1
>=20

--mqgd5ozUDJP6SQDL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYLc4egAKCRA6cBh0uS2t
rGzwAQD8IbmW3FYmLgelgNHokp8ahwkrUg4lUkY4HTl3f0dBSQD7BvbELrGaESi0
pk+BU/AV5VldmF2Annh8U16y3OgarwY=
=EKZY
-----END PGP SIGNATURE-----

--mqgd5ozUDJP6SQDL--



--===============1005723356608671088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1005723356608671088==--


