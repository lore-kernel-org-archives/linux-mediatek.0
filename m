Return-Path: <SRS0=IoHK=JP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755B3C433B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 21:28:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D807F610CA
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Apr 2021 21:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D807F610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VnpPgaD50rnneEeA6rWfx4LBzsL93pV7t9QXrU0xLpM=; b=iyhi7KZ+kT8uBoj97gmoph31n
	6FFPFtcVrNKG4i86i/5On3SoGPhkVgkD8IhUQMka0u3Pqu/Tm2mbWTq41vHfBPb+zUUy/f7DTSMGD
	nrYRxFAgKIzQYTNhz/JKGGgpAHHJ3R1FVLHRa3yVaatZdiC1M64BuJVzI3R5hu77MJkymqBRYAo9x
	Z0cGxclGGd8qixhyrm3hJzm6TyYFMe0qeeEeUQdlgqfoRKKrrLY7DqhU+Z77DVnRq4SOY5YVQpwNs
	Be0TiDjDeop3xYWjxvKVeZX0Z695M3nJBkmSma0Va70494YTDcnwfE+oUSbTZzrNlfFFUTqKbGmX2
	OLC2CcCtg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYExv-008cpI-DS; Sun, 18 Apr 2021 21:28:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYExs-008coB-UR
 for linux-mediatek@desiato.infradead.org; Sun, 18 Apr 2021 21:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:In-Reply-To:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xy0uRT9DuQa5KkmgsGXM+reDf4nP2NkCt7+xgBCiMQg=; b=NGBQ0Pu9SES4Css8kdWruJcFFa
 e/zjO4CWAwPF47untasUuwIU4oW+pC0hy8E667PjgjRLpFvPZzkAGAItaYlrxVdLqCxIJqEP/hlB/
 bxpo9QfLXjYKkZTSguFpKPHMtJrcgX926jIUanHhY9wroDt8vjQmETRKyl3IxqddoCi64wLJslwqY
 75nseUO7oemGrbO09hXPFJ2sT6OAMivGy6ViN2HZX0N0nsyMAMLI0QxyYrj1ough8wGOgfjb3tTu0
 S3bOKao788+PJDZxwwLSsl0h5z1VS2UzCAjucijc+Fp5B64qY2hEFZMQRfYI+ObdMwm89WCbm0U/b
 4DWD7S+w==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYExn-00AhPZ-6d
 for linux-mediatek@lists.infradead.org; Sun, 18 Apr 2021 21:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618781296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xy0uRT9DuQa5KkmgsGXM+reDf4nP2NkCt7+xgBCiMQg=;
 b=I+g4aAZJn3dyYb3ueIJwhxqAO7vORo06wvheOp+TFIAn9cxCWjhj6S4YlqkivSh5kabmHm
 MEqrPl6BLsH9zNomRlEYAcnbPcUQG2pmd7Nw3mkBwjKiD/C9CkSdTtqph3L9NNfJlh2iT3
 x40IM1x4H40PgQ7I9VfkmKDVl3AbOr0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-cdtUD_lvPXCspvneZYOJ7Q-1; Sun, 18 Apr 2021 17:26:17 -0400
X-MC-Unique: cdtUD_lvPXCspvneZYOJ7Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 r14-20020a50d68e0000b0290385504d6e4eso108278edi.7
 for <linux-mediatek@lists.infradead.org>; Sun, 18 Apr 2021 14:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TPcs5TB0ONhcFVAEw0E0MCP+R2+YREZ08wBbXd6m+0c=;
 b=NPK/KkmKSER66S4wWJormqrLbrof4qbnZuEaqBaKP0gg2UtQ3MGzbB/S1PLuN4kppD
 9qZ6HzdPjzIOegCzwvVVwQUVikgXMAPLmixlG+PshCGWhm0SK2GfJb2FO6xh9aNYf4/l
 Fro7592popzGfy4nb7lmIeasV1Es/71l6VlZYbisl522Wi7/IGMl/tTgvH1B1lWYruRm
 zILNX8lFTXtrNTIpgNQpNCwvYm7S58xweCCrXWx6fTCkeBaaL2F9jfQMpdsvScH+i48L
 d8JMQhIFouCznoKZQCV8IZiV4b41wvVScLOBxFhV1QBziARiuv9z0XGdhEKP/5iaRFHq
 YaLw==
X-Gm-Message-State: AOAM533Um0HDBmejh5GhUzvxKut+LUbcSkmptPZblQEWVLL/EVhB6UQd
 xTjR6MuM7Q3f/qOV8WnxnV4nVKVZ7ZDfoK/mynawYSfmOi01QbDEVa654bSsa0tToGy6FqKt3Tj
 w3yMsBWUE1isaVZo+qx4HkhPikIy9gyzf
X-Received: by 2002:a17:906:3e54:: with SMTP id
 t20mr18905025eji.53.1618781176568; 
 Sun, 18 Apr 2021 14:26:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBKJZIgQlc9hQywL+WtI+KLt35fb6/JZtjFfLmtl/EiX87D0fiTdVmmH6NDI4Gb6cbNDZ6cQ==
X-Received: by 2002:a17:906:3e54:: with SMTP id
 t20mr18905020eji.53.1618781176413; 
 Sun, 18 Apr 2021 14:26:16 -0700 (PDT)
Received: from localhost ([151.66.28.185])
 by smtp.gmail.com with ESMTPSA id s20sm11194233edu.93.2021.04.18.14.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 14:26:15 -0700 (PDT)
Date: Sun, 18 Apr 2021 23:26:12 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mt76: mt7915: add thermal sensor device support
Message-ID: <YHyj9H52zgoDXWbN@lore-desk>
References: <b51d79d257e150a09d51029e3465e2ce925d6cfe.1618691395.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <b51d79d257e150a09d51029e3465e2ce925d6cfe.1618691395.git.ryder.lee@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_142819_376619_C133F8BA 
X-CRM114-Status: GOOD (  14.04  )
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
Content-Type: multipart/mixed; boundary="===============8488985803891092222=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============8488985803891092222==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TFPJU7dGCv8470U4"
Content-Disposition: inline

--TFPJU7dGCv8470U4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[...]
> =20
> +static ssize_t mt7915_thermal_show_temp(struct device *dev,
> +=09=09=09=09=09struct device_attribute *attr,
> +=09=09=09=09=09char *buf)
> +{
> +=09struct mt7915_phy *phy =3D dev_get_drvdata(dev);
> +=09int temperature;
> +
> +=09mutex_lock(&phy->dev->mt76.mutex);
> +=09temperature =3D mt7915_mcu_get_temperature(phy);
> +=09mutex_unlock(&phy->dev->mt76.mutex);

I guess we do not need this lock here since mcu already has its own lock (m=
cu
mutex) and mt7915 does not support runtime-pm.

Regards,
Lorenzo

> +
> +=09if (temperature < 0)
> +=09=09return temperature;
> +
> +=09/* display in millidegree celcius */
> +=09return sprintf(buf, "%u\n", temperature * 1000);
> +}
> +
> +static SENSOR_DEVICE_ATTR(temp1_input, 0444, mt7915_thermal_show_temp,
> +=09=09=09  NULL, 0);
> +
> +static struct attribute *mt7915_hwmon_attrs[] =3D {
> +=09&sensor_dev_attr_temp1_input.dev_attr.attr,
> +=09NULL,
> +};
> +ATTRIBUTE_GROUPS(mt7915_hwmon);
> +
> +static int mt7915_thermal_init(struct mt7915_phy *phy)
> +{
> +=09struct wiphy *wiphy =3D phy->mt76->hw->wiphy;
> +=09struct device *hwmon;
> +
> +=09/* TODO: add cooling device for throttling */
> +
> +=09if (!IS_REACHABLE(CONFIG_HWMON))
> +=09=09return 0;
> +
> +=09hwmon =3D devm_hwmon_device_register_with_groups(&wiphy->dev,
> +=09=09=09=09=09=09       wiphy_name(wiphy), phy,
> +=09=09=09=09=09=09       mt7915_hwmon_groups);
> +=09if (IS_ERR(hwmon))
> +=09=09return PTR_ERR(hwmon);
> +
> +=09return 0;
> +}
> +
>  static void
>  mt7915_init_txpower(struct mt7915_dev *dev,
>  =09=09    struct ieee80211_supported_band *sband)
> @@ -286,6 +334,10 @@ static int mt7915_register_ext_phy(struct mt7915_dev=
 *dev)
>  =09if (ret)
>  =09=09goto error;
> =20
> +=09ret =3D mt7915_thermal_init(phy);
> +=09if (ret)
> +=09=09goto error;
> +
>  =09return 0;
> =20
>  error:
> @@ -739,6 +791,10 @@ int mt7915_register_device(struct mt7915_dev *dev)
>  =09if (ret)
>  =09=09return ret;
> =20
> +=09ret =3D mt7915_thermal_init(&dev->phy);
> +=09if (ret)
> +=09=09return ret;
> +
>  =09ieee80211_queue_work(mt76_hw(dev), &dev->init_work);
> =20
>  =09ret =3D mt7915_register_ext_phy(dev);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.c
> index 559ad230eabe..17a617df6dba 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -3469,16 +3469,17 @@ int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *ph=
y)
>  =09return 0;
>  }
> =20
> -int mt7915_mcu_get_temperature(struct mt7915_dev *dev, int index)
> +int mt7915_mcu_get_temperature(struct mt7915_phy *phy)
>  {
> +=09struct mt7915_dev *dev =3D phy->dev;
>  =09struct {
>  =09=09u8 ctrl_id;
>  =09=09u8 action;
> -=09=09u8 band;
> +=09=09u8 dbdc_idx;
>  =09=09u8 rsv[5];
>  =09} req =3D {
>  =09=09.ctrl_id =3D THERMAL_SENSOR_TEMP_QUERY,
> -=09=09.action =3D index,
> +=09=09.dbdc_idx =3D phy !=3D &dev->phy,
>  =09};
> =20
>  =09return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(THERMAL_CTRL), &req,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers=
/net/wireless/mediatek/mt76/mt7915/mt7915.h
> index 80eb35231a1a..d5296e2d481b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> @@ -357,7 +357,7 @@ int mt7915_mcu_set_radar_th(struct mt7915_dev *dev, i=
nt index,
>  =09=09=09    const struct mt7915_dfs_pattern *pattern);
>  int mt7915_mcu_apply_group_cal(struct mt7915_dev *dev);
>  int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy);
> -int mt7915_mcu_get_temperature(struct mt7915_dev *dev, int index);
> +int mt7915_mcu_get_temperature(struct mt7915_phy *phy);
>  int mt7915_mcu_get_tx_rate(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx=
);
>  int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif =
*vif,
>  =09=09=09   struct ieee80211_sta *sta, struct rate_info *rate);
> --=20
> 2.18.0
>=20

--TFPJU7dGCv8470U4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYHyj8gAKCRA6cBh0uS2t
rFc1AP0TzFM9UeSoGdkc3dw0YHYpaI+eTfh5nH0oLez6fUqLYgEAmuffVpsIXLN9
vSsV+rGBbRwtmHzZoNXIQqCWZRrHdg8=
=5nH8
-----END PGP SIGNATURE-----

--TFPJU7dGCv8470U4--



--===============8488985803891092222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8488985803891092222==--


