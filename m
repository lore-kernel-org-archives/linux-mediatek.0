Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB9BC432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 18:45:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE7EE60EB5
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 18:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE7EE60EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCEAZqbx6Fr4GOlYH32a8iU2kJld0EhPk/CS6uUse94=; b=eq0o2DKhosjBIGkr8cKqpGwgQK
	YfWRe5E6JFOB1LUele1U368JoNC1LCJGqYsmS9yjBGtZPURMpE532E/IabFxV9ix34TGQ0AgC94oy
	QGjC5AI5/9nf4GKX3wILd1BQBH4cu7kOajTRRRodRDihNR8nE/vZ7Eigw87Gn18Ac1HoB69xAP1BM
	6gdPDS+7u3s9XZzMdTyHyoHfx39tZVBh9Q2Ei6aqx+rvnPKPTeA5S7erKWh1a0r3f4rAeKmC26GxV
	fe977AQaRoej/NDjfC7cxHilhcTCQ2IW+A5jNBYCUKTYWHVago9Xqf1pV7kQahK7Xq0Gu9cQkztJU
	3D4TO0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJgqb-00CywQ-AX; Fri, 27 Aug 2021 18:45:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJgqX-00Cyvt-Sk
 for linux-mediatek@lists.infradead.org; Fri, 27 Aug 2021 18:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630089896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5nDCwg5hs/i6bix8QdrCcML1GjnUwpbAq7zUf7Dm4tA=;
 b=Lo6jqKoRDZ4G5hZSOBNYOTti/G1l4uO3d0WQrrszHgOz1/0CaVPsi/grdOAnO5/i+r4CPL
 Tx5bEhXem6CtRmewMTI+Vk6OOgNXWv8Pk/Z90ENW/GtX8cYE8J4wdiowViWjY5bCDCkA+Y
 aixX2ez29IeEGJ5mEHF7m/1cia00Xsk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-xkKOyxwgMeSm9YgbW9EjRw-1; Fri, 27 Aug 2021 14:44:53 -0400
X-MC-Unique: xkKOyxwgMeSm9YgbW9EjRw-1
Received: by mail-ej1-f71.google.com with SMTP id
 c25-20020a170906529900b005c56c92caa2so3028555ejm.19
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Aug 2021 11:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GKTEKILYopUZMceo/SvcBY7xL5qbjDWf3wbuGwU275M=;
 b=sMzdU+z7nCHwiWWD9pBTJNsv+JkjpvCq6ApvUtvmNEe8TjiHPOT60TIwgnmAzWoOWr
 ZLnX0uXMTIUwMxhIn+yYUl5xsL/zqtx3t1KboUjk4/3vMsMHHKKNRfzz+jBlTcWOW57l
 V9jUlLQgH0y6z0gi/rFyp5ehJaeZ5aTQkFLNE2Z/Lp8Ac8EisWCaeI0pnW04ht++Gm5D
 zFdMgjG6B/Mh0DND++bjIHb6KUMWXLIYWO2BsmmqxztofqKlqf/IyHaonyy3uUFmwtkP
 rm5MHzb0EaupOoc79avLDyLB+kcapNGBdiRi7qE/N2HRBOEY4yGDjrEp8BGzQZHCrPpG
 b2rA==
X-Gm-Message-State: AOAM5331EOYNDgFwhNIdOKiS5Kz6jwVWSpY0J+qPt2IZeBGsWh0wvB9m
 uNDyFE7TEF8XSGFrEoiA6MOfcqMLkwp5cxor3O8cAO6Ncn7DGGxNtd4pEU7+qIw6EN17wPHv4Bj
 MIPSDHbDdxRDRvelv3hrd1qCGTo85GQ5G
X-Received: by 2002:a17:906:93ef:: with SMTP id
 yl15mr11641544ejb.229.1630089891390; 
 Fri, 27 Aug 2021 11:44:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn8kDZv8r73ghWNHOsZxx+Cr88NJ+Zr3y719xbWWZYCEM/Y7Gq78VMeXuFODeiUjr7VUgnOA==
X-Received: by 2002:a17:906:93ef:: with SMTP id
 yl15mr11641526ejb.229.1630089891117; 
 Fri, 27 Aug 2021 11:44:51 -0700 (PDT)
Received: from localhost (net-47-53-3-199.cust.vodafonedsl.it. [47.53.3.199])
 by smtp.gmail.com with ESMTPSA id
 y13sm3818191edd.45.2021.08.27.11.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 11:44:50 -0700 (PDT)
Date: Fri, 27 Aug 2021 20:44:47 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Chad Monroe <chad@monroe.io>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Ben Greear <greearb@candelatech.com>
Subject: Re: [PATCH 2/2] mt76: mt7615: fix radar detector logic
Message-ID: <YSkyn9eqQKLXcncf@lore-desk>
References: <54c9a89210608d2a9b9adf37a8c2a743275e5723.1630081048.git.chad@monroe.io>
 <4a4bb98aa6dd1c7f4671d11a901fb8cf35f49308.1630081048.git.chad@monroe.io>
MIME-Version: 1.0
In-Reply-To: <4a4bb98aa6dd1c7f4671d11a901fb8cf35f49308.1630081048.git.chad@monroe.io>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_114458_140751_D645E446 
X-CRM114-Status: GOOD (  31.43  )
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
Content-Type: multipart/mixed; boundary="===============4371922055985192914=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============4371922055985192914==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="znaAPSv3wzvrJXLm"
Content-Disposition: inline

--znaAPSv3wzvrJXLm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Before this patch, if AP went from ch 100 to ch 36, the radar detector
> logic in the firmware was not being disabled.  This made the AP appear
> to be up, but no beacons were seen on air until module reload or
> reboot.
>=20
> To reproduce this, I change hostapd.conf and restart hostapd.  Others
> on openwrt used their UI to make changes and problem was seen, but
> stil others changed channels in some other way and/or had some other
> difference and could *not* reproduce it.  So, something perhaps a
> bit subtle.
>=20
> To fix the problem, stop depending on comparing dfs_state, store last
> freq/bandwidth to detect changes in that, and streamline code that
> checks to enable/disable radar detection.  And add in error checking
> and dev_dbg logic so one can see what is actually happening if need
> to debug this again.
>=20
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Chad Monroe <chad@monroe.io>
> ---
>  .../net/wireless/mediatek/mt76/mt7615/init.c  |  12 ++-
>  .../net/wireless/mediatek/mt76/mt7615/mac.c   | 102 ++++++++++++------
>  .../net/wireless/mediatek/mt76/mt7615/main.c  |  25 ++++-
>  .../wireless/mediatek/mt76/mt7615/mt7615.h    |   6 +-
>  4 files changed, 104 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7615/init.c
> index 05235a60d413..23dde13c2703 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> @@ -333,6 +333,7 @@ mt7615_regd_notifier(struct wiphy *wiphy,
>  =09struct mt76_phy *mphy =3D hw->priv;
>  =09struct mt7615_phy *phy =3D mphy->priv;
>  =09struct cfg80211_chan_def *chandef =3D &mphy->chandef;
> +=09int ret;
> =20
>  =09memcpy(dev->mt76.alpha2, request->alpha2, sizeof(dev->mt76.alpha2));
>  =09dev->mt76.region =3D request->dfs_region;
> @@ -342,14 +343,18 @@ mt7615_regd_notifier(struct wiphy *wiphy,
> =20
>  =09mt7615_mutex_acquire(dev);
> =20
> -=09if (chandef->chan->flags & IEEE80211_CHAN_RADAR)
> -=09=09mt7615_dfs_init_radar_detector(phy);
> -
>  =09if (mt7615_firmware_offload(phy->dev)) {
>  =09=09mt76_connac_mcu_set_channel_domain(mphy);
>  =09=09mt76_connac_mcu_set_rate_txpower(mphy);
>  =09}
> =20
> +=09if (chandef->chan->flags & IEEE80211_CHAN_RADAR) {
> +=09=09ret =3D mt7615_dfs_init_radar_detector(phy);
> +=09=09if (ret < 0)
> +=09=09=09dev_err(dev->mt76.dev, "init-wifi: dfs-init-radar-detector fail=
ed: %d",
> +=09=09=09=09ret);

I guess this chunck does not make any difference since mt7663 does not supp=
ort
dfs (w offload fw).

> +=09}
> +
>  =09mt7615_mutex_release(dev);
>  }
> =20
> @@ -550,7 +555,6 @@ void mt7615_init_device(struct mt7615_dev *dev)
>  =09dev->pm.stats.last_wake_event =3D jiffies;
>  =09dev->pm.stats.last_doze_event =3D jiffies;
>  =09mt7615_cap_dbdc_disable(dev);
> -=09dev->phy.dfs_state =3D -1;
> =20
>  #ifdef CONFIG_NL80211_TESTMODE
>  =09dev->mt76.test_ops =3D &mt7615_testmode_ops;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mac.c
> index 78b55e872da0..571fa73baa76 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> @@ -2101,14 +2101,29 @@ void mt7615_tx_token_put(struct mt7615_dev *dev)
>  }
>  EXPORT_SYMBOL_GPL(mt7615_tx_token_put);
> =20
> -static void mt7615_dfs_stop_radar_detector(struct mt7615_phy *phy)
> +int mt7615_dfs_stop_radar_detector(struct mt7615_phy *phy, bool ext_phy)
>  {
>  =09struct mt7615_dev *dev =3D phy->dev;
> +=09int err;
> +
> +=09dev_dbg(dev->mt76.dev, "dfs-stop-radar-detector, rdd-state: 0x%x",
> +=09=09phy->rdd_state);
> +
> +=09err =3D mt7615_mcu_rdd_cmd(dev, RDD_NORMAL_START, ext_phy,
> +=09=09=09=09 MT_RX_SEL0, 0);
> +=09if (err < 0) {
> +=09=09dev_err(dev->mt76.dev, "mcu-rdd-cmd RDD_NORMAL_START failed: %d",
> +=09=09=09err);
> +=09=09/* I think best to carry on, even if we have an error here. */
> +=09}

I guess you just moved mt7615_mcu_rdd_cmd(dev, RDD_NORMAL_START, ..) here b=
ut
the logic is the same as before, right? If so I think we can drop it

> =20
>  =09if (phy->rdd_state & BIT(0))
>  =09=09mt7615_mcu_rdd_cmd(dev, RDD_STOP, 0, MT_RX_SEL0, 0);
>  =09if (phy->rdd_state & BIT(1))
>  =09=09mt7615_mcu_rdd_cmd(dev, RDD_STOP, 1, MT_RX_SEL0, 0);
> +=09phy->rdd_state =3D 0;
> +
> +=09return err;
>  }
> =20
>  static int mt7615_dfs_start_rdd(struct mt7615_dev *dev, int chain)
> @@ -2116,11 +2131,14 @@ static int mt7615_dfs_start_rdd(struct mt7615_dev=
 *dev, int chain)
>  =09int err;
> =20
>  =09err =3D mt7615_mcu_rdd_cmd(dev, RDD_START, chain, MT_RX_SEL0, 0);
> +
> +=09dev_dbg(dev->mt76.dev, "dfs-start-rdd, RDD_START rv: %d", err);
>  =09if (err < 0)
>  =09=09return err;
> =20
> -=09return mt7615_mcu_rdd_cmd(dev, RDD_DET_MODE, chain,
> -=09=09=09=09  MT_RX_SEL0, 1);
> +=09err =3D mt7615_mcu_rdd_cmd(dev, RDD_DET_MODE, chain, MT_RX_SEL0, 1);
> +=09dev_dbg(dev->mt76.dev, "dfs-start-rdd, RDD_DET_MODE rv: %d", err);
> +=09return err;
>  }
> =20
>  static int mt7615_dfs_start_radar_detector(struct mt7615_phy *phy)
> @@ -2227,48 +2245,70 @@ int mt7615_dfs_init_radar_detector(struct mt7615_=
phy *phy)
>  =09if (is_mt7663(&dev->mt76))
>  =09=09return 0;
> =20
> -=09if (dev->mt76.region =3D=3D NL80211_DFS_UNSET) {
> -=09=09phy->dfs_state =3D -1;
> -=09=09if (phy->rdd_state)
> -=09=09=09goto stop;
> +=09dev_dbg(dev->mt76.dev,
> +=09=09"dfs-init-radar-detector, region: %d freq: %d chandef dfs-state: %=
d",
> +=09=09dev->mt76.region, chandef->chan->center_freq,
> +=09=09chandef->chan->dfs_state);
> =20
> +=09if (test_bit(MT76_SCANNING, &phy->mt76->state)) {
> +=09=09dev_dbg(dev->mt76.dev, "init-radar, was scanning, no change.\n");
>  =09=09return 0;
>  =09}
> =20
> -=09if (test_bit(MT76_SCANNING, &phy->mt76->state))
> -=09=09return 0;
> +=09if (dev->mt76.region =3D=3D NL80211_DFS_UNSET) {
> +=09=09dev_dbg(dev->mt76.dev,
> +=09=09=09"dfs-init-radar, region is UNSET, disable radar.");
> +=09=09goto stop;
> +=09}
> +
> +=09if (!(chandef->chan->flags & IEEE80211_CHAN_RADAR)) {
> +=09=09dev_dbg(dev->mt76.dev,
> +=09=09=09"dfs-init-radar, chandef does not want radar.");
> +=09=09goto stop;
> +=09}
> +
> +=09ieee80211_iterate_active_interfaces(phy->mt76->hw,
> +=09=09=09=09=09    IEEE80211_IFACE_ITER_RESUME_ALL,
> +=09=09=09=09=09    mt7615_vif_counts, &counts);
> +
> +=09if (!(counts.ap + counts.adhoc + counts.mesh)) {
> +=09=09/* No beaconning interfaces, do not start CAC */
> +=09=09dev_dbg(dev->mt76.dev,
> +=09=09=09"dfs-init-radar, no AP/Mesh/Adhoc vifs active, stop radar.");
> +=09=09goto stop;
> +=09}
> =20
> -=09if (phy->dfs_state =3D=3D chandef->chan->dfs_state)
> +=09/* At this point, we need radar detection, see if we have started
> +=09 * it already.
> +=09 */
> +=09if (phy->rdd_state) {

Are you sure this approach works with DBDC? in this case phy->rdd_state is =
not
0 but the radar detection has not started on this phy.

> +=09=09if (chandef->chan->dfs_state =3D=3D NL80211_DFS_AVAILABLE) {
> +=09=09=09/* CAC is already complete. */
> +=09=09=09dev_dbg(dev->mt76.dev,
> +=09=09=09=09"init-radar, RADAR started and DFS state is AVAILABLE, call =
RDD_CAC_END");
> +=09=09=09return mt7615_mcu_rdd_cmd(dev, RDD_CAC_END, ext_phy,
> +=09=09=09=09=09=09  MT_RX_SEL0, 0);
> +=09=09}
> +=09=09dev_dbg(dev->mt76.dev,
> +=09=09=09"init-radar, rdd_state indicates RADAR already started,"
> +=09=09=09" DFS state: %d not YET available, rdd_state: 0x%x",
> +=09=09=09chandef->chan->dfs_state, phy->rdd_state);
>  =09=09return 0;
> +=09}
> =20
>  =09err =3D mt7615_dfs_init_radar_specs(phy);
>  =09if (err < 0) {
> -=09=09phy->dfs_state =3D -1;
> +=09=09dev_err(dev->mt76.dev, "dfs-init-radar-specs failed: %d",
> +=09=09=09err);
>  =09=09goto stop;
>  =09}
> =20
> -=09phy->dfs_state =3D chandef->chan->dfs_state;
> -
> -=09if (chandef->chan->flags & IEEE80211_CHAN_RADAR) {
> -=09=09if (chandef->chan->dfs_state !=3D NL80211_DFS_AVAILABLE) {
> -=09=09=09ieee80211_iterate_active_interfaces(phy->mt76->hw,
> -=09=09=09=09IEEE80211_IFACE_ITER_RESUME_ALL,
> -=09=09=09=09mt7615_vif_counts, &counts);
> -=09=09=09if (counts.ap + counts.adhoc + counts.mesh)
> -=09=09=09=09mt7615_dfs_start_radar_detector(phy);
> -=09=09=09return 0;
> -=09=09}
> -=09=09return mt7615_mcu_rdd_cmd(dev, RDD_CAC_END, ext_phy,
> -=09=09=09=09=09  MT_RX_SEL0, 0);
> -=09}
> +=09err =3D mt7615_dfs_start_radar_detector(phy);
> +=09dev_dbg(dev->mt76.dev, "dfs-start-radar-detector rv: %d", err);
> +=09return err;
> =20
>  stop:
> -=09err =3D mt7615_mcu_rdd_cmd(dev, RDD_NORMAL_START, ext_phy, MT_RX_SEL0=
, 0);
> -=09if (err < 0)
> -=09=09return err;
> -
> -=09mt7615_dfs_stop_radar_detector(phy);
> -=09return 0;
> +=09return mt7615_dfs_stop_radar_detector(phy, ext_phy);
>  }
> =20
>  int mt7615_mac_set_beacon_filter(struct mt7615_phy *phy,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7615/main.c
> index 7154acf3eb9b..484c8803726f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> @@ -291,6 +291,8 @@ static void mt7615_init_dfs_state(struct mt7615_phy *=
phy)
>  =09struct mt76_phy *mphy =3D phy->mt76;
>  =09struct ieee80211_hw *hw =3D mphy->hw;
>  =09struct cfg80211_chan_def *chandef =3D &hw->conf.chandef;
> +=09struct mt7615_dev *dev =3D phy->dev;
> +=09bool ext_phy =3D phy !=3D &dev->phy;
> =20
>  =09if (hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
>  =09=09return;
> @@ -298,11 +300,23 @@ static void mt7615_init_dfs_state(struct mt7615_phy=
 *phy)
>  =09if (!(chandef->chan->flags & IEEE80211_CHAN_RADAR))
>  =09=09return;
> =20
> -=09if (mphy->chandef.chan->center_freq =3D=3D chandef->chan->center_freq=
 &&
> -=09    mphy->chandef.width =3D=3D chandef->width)
> +=09if (phy->dfs_center_freq =3D=3D chandef->chan->center_freq &&
> +=09    phy->dfs_ch_width =3D=3D chandef->width)
>  =09=09return;

Why do we need phy->dfs_center_freq and phy->dfs_ch_width? if I read correc=
tly
the code mphy->chandef.* is updated in mt76_set_channel() so we do not need
them for thec check above, right?

Regards,
Lorenzo

> =20
> -=09phy->dfs_state =3D -1;
> +=09/* We are being moved to a new frequency/bw, still on DFS.  Stop
> +=09 * any existing DFS, then will start it again in the
> +=09 * init-radar-detector logic.
> +=09 */
> +=09if (phy->rdd_state) {
> +=09=09dev_dbg(dev->mt76.dev,
> +=09=09=09"init-dfs-state, channel changed, old: %d:%d  new: %d:%d, stopp=
ing radar.",
> +=09=09=09phy->dfs_center_freq, phy->dfs_ch_width,
> +=09=09=09chandef->chan->center_freq, chandef->width);
> +=09=09mt7615_dfs_stop_radar_detector(phy, ext_phy);
> +=09}
> +=09phy->dfs_center_freq =3D chandef->chan->center_freq;
> +=09phy->dfs_ch_width =3D chandef->width;
>  }
> =20
>  int mt7615_set_channel(struct mt7615_phy *phy)
> @@ -336,8 +350,11 @@ int mt7615_set_channel(struct mt7615_phy *phy)
> =20
>  =09mt7615_mac_set_timing(phy);
>  =09ret =3D mt7615_dfs_init_radar_detector(phy);
> -=09if (ret)
> +=09if (ret < 0) {
> +=09=09dev_err(dev->mt76.dev, "set-channel: dfs-init-radar-detector faile=
d: %d",
> +=09=09=09ret);
>  =09=09goto out;
> +=09}
> =20
>  =09mt7615_mac_cca_stats_reset(phy);
>  =09ret =3D mt7615_mcu_set_sku_en(phy, true);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers=
/net/wireless/mediatek/mt76/mt7615/mt7615.h
> index 58a98b5c0cbc..6a3209439492 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
> @@ -164,8 +164,9 @@ struct mt7615_phy {
>  =09u8 slottime;
> =20
>  =09u8 chfreq;
> -=09u8 rdd_state;
> -=09int dfs_state;
> +=09u8 rdd_state; /* radar detection started bitfield */
> +=09enum nl80211_chan_width dfs_ch_width;
> +=09u32 dfs_center_freq;
> =20
>  =09u32 rx_ampdu_ts;
>  =09u32 ampdu_ref;
> @@ -540,6 +541,7 @@ int mt7615_mcu_set_sku_en(struct mt7615_phy *phy, boo=
l enable);
>  int mt7615_mcu_apply_rx_dcoc(struct mt7615_phy *phy);
>  int mt7615_mcu_apply_tx_dpd(struct mt7615_phy *phy);
>  int mt7615_dfs_init_radar_detector(struct mt7615_phy *phy);
> +int mt7615_dfs_stop_radar_detector(struct mt7615_phy *phy, bool ext_phy)=
;
> =20
>  int mt7615_mcu_set_roc(struct mt7615_phy *phy, struct ieee80211_vif *vif=
,
>  =09=09       struct ieee80211_channel *chan, int duration);
> --=20
> 2.20.1
>=20

--znaAPSv3wzvrJXLm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYSkynQAKCRA6cBh0uS2t
rMOGAQD43z+Ip6lJ2NYlurzOczMIQWFy50dl+DDWkP6lHqdxQgD9F0z/wHXE2huu
tnzRI3u2ED4Cqx42W6l7o+flNkzk1gA=
=OpuX
-----END PGP SIGNATURE-----

--znaAPSv3wzvrJXLm--



--===============4371922055985192914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4371922055985192914==--


