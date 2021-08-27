Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05138C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 18:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D1FF60FC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 18:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D1FF60FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IUD8NdEApWRWI+ggoizn43p/7wxxpVDdev9DSssBH4=; b=c5eZt1wp+WuzTVi36yarWBGnrm
	tTq+b9r9tA/5r80MFicbj2DYTeswxJEJZ7ZIsvBd2dMS6gfIoQNtQxZX/Ud36prDlrA/44MAd4pPf
	BLesMEc+vOAtX5dsNydgZwRjb8jFCNw5q15UKe4p5k9S2LIrNE4UH2/SkJE59hI7m7d7WJgYgYn1q
	7fpSr7iEU3kEIoqv3tctwZJI9kQu7baY3guQ5+qtVvVLYhA7dlA+KlG2fELqo4J9rJcGVOJeCvF9/
	yssYtfc7uCHyeG+Sfs1UvnJ2QkleCT49T6GzhfENLIjhsWdrJ82bhbQiViVQUwcj7tYYy1VJUh8gU
	InxwNtow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJgNv-00CwAu-4h; Fri, 27 Aug 2021 18:15:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJgNr-00CwAX-R1
 for linux-mediatek@lists.infradead.org; Fri, 27 Aug 2021 18:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630088117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dH0FMok90O75lHdCdncZaTnnsrKrbZCeMmLiQ8syGcM=;
 b=XZx+8gv/tPR5UGowF33AQEqKbNvK5v8M9hkSzQDzzlU8FTSusKgG5dlqDrr+JqM4whSPUy
 AWuINTzklxZhMdv8TcOD0fRI8nPzw8ZKkZPSYfCc0alqQ7/NvzqUehbsEZag9Q0kI/GpKz
 WVT1G7flY7lPp/ro1Q9Z9VaJW+H+bgI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-p_xcO3unNQST4sRPMSyHbw-1; Fri, 27 Aug 2021 14:12:59 -0400
X-MC-Unique: p_xcO3unNQST4sRPMSyHbw-1
Received: by mail-ej1-f72.google.com with SMTP id
 22-20020a170906301600b005ca77a21183so2994438ejz.20
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Aug 2021 11:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/8VY6th4bSVsPkwqEJ4X+M5eRdXqdaKLqp253ozSJIs=;
 b=E0do6RwLJdm/a3F54JUziGfs1kYh+cMpc3ZNE+nfF1pZt3vxpwB0ZJJceypsIVXpj7
 3ZXtng39KZSQianpz0gxTY8Xips5IRwuUoSp4VCCWlFulT8Dsol5xQ+XUl+tEVTkErL5
 /6yRTQ89RCCYtfT4LWNw1oxtwVpqGEUgiG8ZjpVjUkUOF0VSodYNpxStgRVYtf2Eyomo
 m4hS5Ai4PskWiW3lNNZ/sf06qZ1Rby6c2hHwL0qRN82qpmodBVtQFA9Zzzr1PjVWZSRB
 5d7hDFarGtNTYnkYET38xVmx5He/cnVQljAbbhGk00BovnSvftCwGpej56F8By6NJgt1
 piYw==
X-Gm-Message-State: AOAM5333la5dqBHs1Sn+BEu4z8qqEDUHRGUJ/nTH39/mK/NX/eVAVuzd
 EYrQoH/38ubjzGp4iLbtetz51y9o/XcD4e7h8IVUDPrI5xnoWBNPnZXXC3rWawsAn5zHemZTgs9
 q3dXNvPywT+Q3TwCWjKM5rt4mwK9dSWy8
X-Received: by 2002:a17:906:ae0c:: with SMTP id
 le12mr11213253ejb.169.1630087978481; 
 Fri, 27 Aug 2021 11:12:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYn/Ne0fFY94d2/y5xKlCw9kxnU9vWdOSC4nQy7IIgVAYtqIjwJkS7I6jXIKBsjQXAlMfBTg==
X-Received: by 2002:a17:906:ae0c:: with SMTP id
 le12mr11213240ejb.169.1630087978330; 
 Fri, 27 Aug 2021 11:12:58 -0700 (PDT)
Received: from localhost (net-47-53-3-199.cust.vodafonedsl.it. [47.53.3.199])
 by smtp.gmail.com with ESMTPSA id
 v24sm3614924edq.79.2021.08.27.11.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 11:12:57 -0700 (PDT)
Date: Fri, 27 Aug 2021 20:12:54 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Chad Monroe <chad@monroe.io>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Rubio Lu <Rubio-DW.Lu@mediatek.com>,
 Ben Greear <greearb@candelatech.com>
Subject: Re: [PATCH 1/2] mt76: mt7615: fix STA mode connection on DFS channels
Message-ID: <YSkrJtKTB40u1U9H@lore-desk>
References: <54c9a89210608d2a9b9adf37a8c2a743275e5723.1630081048.git.chad@monroe.io>
MIME-Version: 1.0
In-Reply-To: <54c9a89210608d2a9b9adf37a8c2a743275e5723.1630081048.git.chad@monroe.io>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_111520_006498_67257670 
X-CRM114-Status: GOOD (  16.39  )
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
Content-Type: multipart/mixed; boundary="===============5748279498196576492=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============5748279498196576492==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cAwtYvyHVBtACe+o"
Content-Disposition: inline

--cAwtYvyHVBtACe+o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Only AP, adhoc and mesh mode needs to check CAC.
> Stations, in particular, do not need this check.
>=20
> Signed-off-by: Rubio Lu <Rubio-DW.Lu@mediatek.com>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Chad Monroe <chad@monroe.io>
> ---
>  .../net/wireless/mediatek/mt76/mt7615/mac.c   | 38 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mac.c
> index ed1bba42a322..78b55e872da0 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> @@ -2153,6 +2153,32 @@ static int mt7615_dfs_start_radar_detector(struct =
mt7615_phy *phy)
>  =09return 0;
>  }
> =20
> +struct mt7615_vif_counts {
> +=09u32 mesh;
> +=09u32 adhoc;
> +=09u32 ap;

I think u8 it is enough here. Moreover I think we can just count dfs_vif, w=
hat
do you think?

> +};
> +
> +static void
> +mt7615_vif_counts(void *priv, u8 *mac, struct ieee80211_vif *vif)
> +{
> +=09struct mt7615_vif_counts *counts =3D priv;
> +
> +=09switch (vif->type) {
> +=09case NL80211_IFTYPE_ADHOC:
> +=09=09counts->adhoc++;
> +=09=09break;
> +=09case NL80211_IFTYPE_MESH_POINT:
> +=09=09counts->mesh++;
> +=09=09break;
> +=09case NL80211_IFTYPE_AP:
> +=09=09counts->ap++;
> +=09=09break;
> +=09default:
> +=09=09break;
> +=09}
> +}
> +
>  static int
>  mt7615_dfs_init_radar_specs(struct mt7615_phy *phy)
>  {
> @@ -2196,6 +2222,7 @@ int mt7615_dfs_init_radar_detector(struct mt7615_ph=
y *phy)
>  =09struct mt7615_dev *dev =3D phy->dev;
>  =09bool ext_phy =3D phy !=3D &dev->phy;
>  =09int err;
> +=09struct mt7615_vif_counts counts =3D {0};
> =20
>  =09if (is_mt7663(&dev->mt76))
>  =09=09return 0;
> @@ -2223,9 +2250,14 @@ int mt7615_dfs_init_radar_detector(struct mt7615_p=
hy *phy)
>  =09phy->dfs_state =3D chandef->chan->dfs_state;
> =20
>  =09if (chandef->chan->flags & IEEE80211_CHAN_RADAR) {
> -=09=09if (chandef->chan->dfs_state !=3D NL80211_DFS_AVAILABLE)
> -=09=09=09return mt7615_dfs_start_radar_detector(phy);
> -
> +=09=09if (chandef->chan->dfs_state !=3D NL80211_DFS_AVAILABLE) {
> +=09=09=09ieee80211_iterate_active_interfaces(phy->mt76->hw,
> +=09=09=09=09IEEE80211_IFACE_ITER_RESUME_ALL,
> +=09=09=09=09mt7615_vif_counts, &counts);
> +=09=09=09if (counts.ap + counts.adhoc + counts.mesh)
> +=09=09=09=09mt7615_dfs_start_radar_detector(phy);

here we are not considering the return value of
mt7615_dfs_start_radar_detector()

Regards,
Lorenzo

> +=09=09=09return 0;
> +=09=09}
>  =09=09return mt7615_mcu_rdd_cmd(dev, RDD_CAC_END, ext_phy,
>  =09=09=09=09=09  MT_RX_SEL0, 0);
>  =09}
> --=20
> 2.20.1
>=20

--cAwtYvyHVBtACe+o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYSkrJAAKCRA6cBh0uS2t
rK6PAQDDJusHNSS6Ji0PK6yzz8lYoqtGNB6q2zSzAuGgeBrtVQEA70pLdnR4dkMs
uA47S0Tp+3hYumQL2qbA9OEwqeo0bQo=
=TW1W
-----END PGP SIGNATURE-----

--cAwtYvyHVBtACe+o--



--===============5748279498196576492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5748279498196576492==--


