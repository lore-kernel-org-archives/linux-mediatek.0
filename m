Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31217C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 22:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jR/J/7zA0uBqFqkaSAOmJGKpCO8Ut5vbDpP6O780OPg=; b=tGu6gntpc8DZqDr7W2gp/++vN+
	TdKmq4jv9Zcs9PbvO79McNgkSPKU8+zX4WoRvu+j6sofeq/YUOlo/7SH5NJ6aJuO0MvYIZz1A7YSY
	hfp1uYvINb0S+XFB5rKHm7DUfjH/dP49N+ubu5a7SJT985FK1wlx2CMCiksDeanZWtMGZ/1w2I8kl
	nufaoRTSpOZWcpIM9WZNcO3UYnmHN7jgrbwdZF1kqazMjLD5QWcvY7nh6znbR8cU61tU6aizqsn32
	f2yUPa9hc4rRduRnRpT5xen202lE5E/oE6Hpmg4RSt90t//bk9eDl9EhmNLwehwvfDeu8kd4BBZva
	GJNH838Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRM93-001rVf-VD; Mon, 07 Mar 2022 22:48:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRM91-001rU0-6S
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 22:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R4l17NtUg/2qSB9utxPA3lCpWe8wKiOV5UHWKOcozVk=;
 b=LzbZv8O882aLFCw/PWuolBBMo6QKaHzLxFRcZ2j0D7/O3qZoK7KcJ9y+MTXY35nB8hKht2
 LH1eRhiGnAbZAzA152YbSNLzF2A4WoSUSF7IHOM6rQGMoBIi83JZnl8cLR5YL3LdDWCFyZ
 luvTxARzU3N3mj6ey0A31toytNXDcdg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-lkH60AVwOPagkCDH1xo5dg-1; Mon, 07 Mar 2022 17:47:55 -0500
X-MC-Unique: lkH60AVwOPagkCDH1xo5dg-1
Received: by mail-qk1-f197.google.com with SMTP id
 12-20020a37090c000000b0067b32f93b90so2772031qkj.16
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 14:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R4l17NtUg/2qSB9utxPA3lCpWe8wKiOV5UHWKOcozVk=;
 b=QFplv1MyZmBQrfs19Fx9iHsZXrtz+PglQVRxnP4cVG3pHcqSC5roO8ws1ojz0Fxz3u
 baGK6PIbxfFI4ETRY1VjnmpBAOVL8q38cvja4yXshxv5tpN5P877/EWM8eG6exGxCRkP
 y1GAvhBmJmpxdijDajGYa5p2B2l+5bajr17ts2lp8HQmH6tvUURimV955qlb7cWgsXkN
 j9mTRDsh/YqdoBCkdjPpLKLiUu54pV4G3j6kN5pjYHekQq2ptWlV38Ywy4Yd2sdXXOWu
 i397mFV+wOiPvcMBYCDrcYqpk5ZZNEHwiJo5CPZmfPsZuW9/3cunr3GaUiGQkFrwxI2S
 crNQ==
X-Gm-Message-State: AOAM533XEDFS//LtlPVvBFRITPcYj68HQwgqtl//bu18VDYGp3UG3WYM
 VasBZfJC4yXGDxrZ4isLebfYFr/4PN3EpP/Z/we7hCRKxIJw7T4XkR+aE/Z8nMavrtpxvJXUGs2
 F9LGiJukvBAB/qvxc+mvMFbi+k7POScid
X-Received: by 2002:ac8:4e46:0:b0:2cb:28cc:2157 with SMTP id
 e6-20020ac84e46000000b002cb28cc2157mr11399623qtw.167.1646693274930; 
 Mon, 07 Mar 2022 14:47:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcgJP//sec9YUVIExe+YiSKE3N/wCsSa0MisM99MctdIJrdqhtw9gN3bVHYVXe6E/ckFThWg==
X-Received: by 2002:ac8:4e46:0:b0:2cb:28cc:2157 with SMTP id
 e6-20020ac84e46000000b002cb28cc2157mr11399606qtw.167.1646693274646; 
 Mon, 07 Mar 2022 14:47:54 -0800 (PST)
Received: from localhost ([37.183.9.66]) by smtp.gmail.com with ESMTPSA id
 q9-20020a05622a030900b002dd2c3a9fccsm9812369qtw.38.2022.03.07.14.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:47:54 -0800 (PST)
Date: Mon, 7 Mar 2022 23:47:51 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Deren.Wu@mediatek.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: move mt7921_init_hw in a dedicated work
Message-ID: <YiaLl++oijKrByBA@lore-desk>
References: <0358e31e71481dec87f7ecb3b040db53076ffc4a.1646654230.git.lorenzo@kernel.org>
 <1646689596-21189-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1646689596-21189-1-git-send-email-sean.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_144759_362569_F44B63B2 
X-CRM114-Status: GOOD (  26.57  )
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
Content-Type: multipart/mixed; boundary="===============6312613654604106637=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6312613654604106637==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G4rL/TNDZ89nVV1r"
Content-Disposition: inline


--G4rL/TNDZ89nVV1r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> >Firmware initialization can take a while. Move mt7921_init_hw routine in=
 a dedicated work in order to not slow down bootstrap process.
>=20
> Hi, Lore

Hi Sean,

>=20
> I don't think the patch is really needed and it creates the different sta=
te of the driver after mt7921_*_probe between without and with the patch
> we should be careful to handle it.
>=20
> For example.
>=20
> 1) It is possible that ieee80211_ops mt7921_ops is working while mt7921_i=
nit_work is not completed, so that creates the race issue between ieee80211=
_ops mt7921_ops and mt7921_init_work still in progress

Can you please elaborate on this? The device will not be "visible" to mac80=
211
till init_work completes since we run mt76_register_device() in
mt7921_init_work().

>=20
> 2) mt7921[k,s,e].ko are always successful probed ( the .ko are always sho=
wn in `lsmod` ) that would confuse the users even when we actually got the =
failure of hardware initialization in mt7921_init_work

If mt7921_init_work fails, we will remove the wiphy, so it will not be visi=
ble
to the user.

>=20
> so I would prefer to wait a while in mt7921_*_proble until the hardware i=
s ready to be working to get rid of the extra synchronization to be added a=
s well as keep the driver much simple.

In the current codebase the time needed for device probing is quite visible=
 on
usb (afaiu this time is needed for fw initialization).

Regards,
Lorenzo

>=20
>         Sean
>=20
> >
> >Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> >---
> > .../net/wireless/mediatek/mt76/mt7921/init.c  | 66 +++++++++++++------
> > .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +
> > 2 files changed, 49 insertions(+), 19 deletions(-)
> >
> >diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/=
net/wireless/mediatek/mt76/mt7921/init.c
> >index fa6af85bba7b..332af886b95a 100644
> >--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> >+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> >@@ -165,7 +165,7 @@ static int __mt7921_init_hardware(struct mt7921_dev =
*dev)
> >
> > static int mt7921_init_hardware(struct mt7921_dev *dev)  {
> >-	int ret, idx, i;
> >+	int ret, i;
> >
> >	set_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
> >
> >@@ -182,6 +182,13 @@ static int mt7921_init_hardware(struct mt7921_dev *=
dev)
> >		return ret;
> >	}
> >
> >+	return 0;
> >+}
> >+
> >+static int mt7921_init_wcid(struct mt7921_dev *dev) {
> >+	int idx;
> >+
> >	/* Beacon and mgmt frames should occupy wcid 0 */
> >	idx =3D mt76_wcid_alloc(dev->mt76.wcid_mask, MT7921_WTBL_STA - 1);
> >	if (idx)
> >@@ -195,6 +202,42 @@ static int mt7921_init_hardware(struct mt7921_dev *=
dev)
> >	return 0;
> > }
> >
> >+static void mt7921_init_work(struct work_struct *work) {
> >+	struct mt7921_dev *dev =3D container_of(work, struct mt7921_dev,
> >+					      init_work);
> >+	int ret;
> >+
> >+	ret =3D mt7921_init_hardware(dev);
> >+	if (ret)
> >+		return;
> >+
> >+	mt76_set_stream_caps(&dev->mphy, true);
> >+	mt7921_set_stream_he_caps(&dev->phy);
> >+
> >+	ret =3D mt76_register_device(&dev->mt76, true, mt76_rates,
> >+				   ARRAY_SIZE(mt76_rates));
> >+	if (ret) {
> >+		dev_err(dev->mt76.dev, "register device failed\n");
> >+		return;
> >+	}
> >+
> >+	ret =3D mt7921_init_debugfs(dev);
> >+	if (ret) {
> >+		dev_err(dev->mt76.dev, "debugfs register failed\n");
> >+		goto error;
> >+	}
> >+
> >+	ret =3D mt76_connac_mcu_set_deep_sleep(&dev->mt76, dev->pm.ds_enable);
> >+	if (ret)
> >+		goto error;
> >+
> >+	dev->hw_init_done =3D true;
> >+	return;
> >+error:
> >+	mt76_unregister_device(&dev->mt76);
> >+}
> >+
> > int mt7921_register_device(struct mt7921_dev *dev)  {
> >	struct ieee80211_hw *hw =3D mt76_hw(dev); @@ -222,6 +265,7 @@ int mt792=
1_register_device(struct mt7921_dev *dev)
> >	spin_lock_init(&dev->sta_poll_lock);
> >
> >	INIT_WORK(&dev->reset_work, mt7921_mac_reset_work);
> >+	INIT_WORK(&dev->init_work, mt7921_init_work);
> >
> >	dev->pm.idle_timeout =3D MT7921_PM_TIMEOUT;
> >	dev->pm.stats.last_wake_event =3D jiffies; @@ -234,7 +278,7 @@ int mt79=
21_register_device(struct mt7921_dev *dev)
> >	if (mt76_is_sdio(&dev->mt76))
> >		hw->extra_tx_headroom +=3D MT_SDIO_TXD_SIZE + MT_SDIO_HDR_SIZE;
> >
> >-	ret =3D mt7921_init_hardware(dev);
> >+	ret =3D mt7921_init_wcid(dev);
> >	if (ret)
> >		return ret;
> >
> >@@ -262,23 +306,7 @@ int mt7921_register_device(struct mt7921_dev *dev)
> >	dev->mphy.hw->wiphy->available_antennas_rx =3D dev->mphy.chainmask;
> >	dev->mphy.hw->wiphy->available_antennas_tx =3D dev->mphy.chainmask;
> >
> >-	mt76_set_stream_caps(&dev->mphy, true);
> >-	mt7921_set_stream_he_caps(&dev->phy);
> >-
> >-	ret =3D mt76_register_device(&dev->mt76, true, mt76_rates,
> >-				   ARRAY_SIZE(mt76_rates));
> >-	if (ret)
> >-		return ret;
> >-
> >-	ret =3D mt7921_init_debugfs(dev);
> >-	if (ret)
> >-		return ret;
> >-
> >-	ret =3D mt76_connac_mcu_set_deep_sleep(&dev->mt76, dev->pm.ds_enable);
> >-	if (ret)
> >-		return ret;
> >-
> >-	dev->hw_init_done =3D true;
> >+	queue_work(system_wq, &dev->init_work);
> >
> >	return 0;
> > }
> >diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/driver=
s/net/wireless/mediatek/mt76/mt7921/mt7921.h
> >index 394a677140da..b6c8f84acb64 100644
> >--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> >+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> >@@ -204,6 +204,8 @@ struct mt7921_dev {
> >	struct list_head sta_poll_list;
> >	spinlock_t sta_poll_lock;
> >
> >+	struct work_struct init_work;
> >+
> >	u8 fw_debug;
> >
> >	struct mt76_connac_pm pm;
> >--
> >2.35.1
> >
> >
> >
>=20

--G4rL/TNDZ89nVV1r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYiaLlwAKCRA6cBh0uS2t
rINRAPwMEqqJSqZrKkBMHnZCGKdl0qG2LgtbR+2tHRFZb/NW+gEA5LiyDV3v8BRa
zfjJ/6daLh/EcA8bJGgw2xEvs6FUBQw=
=aVQc
-----END PGP SIGNATURE-----

--G4rL/TNDZ89nVV1r--



--===============6312613654604106637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6312613654604106637==--


