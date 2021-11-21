Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC79FC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Nov 2021 21:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HF/z3pxGGm3g+e73ufsoCHkYJX/uLEp+41wNy5AozA=; b=l2rto793rRT73lZI+EU7KYe5Fk
	aW+kpFnsIHNKenlU3CiZwPZiXdW5e2cowDbPEEjG1YRyWDInfCtHR18yP5NYkG8h6NVHDbf3VhH7q
	JjzL7yPgrUnFJx4pyg0HQj0ENWHJRQbMv0VmjzI/cFv8DmgFEfgWJl3opdv/28Nllq06AYmTM/l6n
	5K7UExe51Iqkp1x7ZxC2SSWOdlXtHXLe1OLvnnw1fWAfEWQmLUZ2CoQ4VLMWGxp0dja2BwwN6z281
	Ay090KB1WmuD1vcQYNR6jAUAYNxhsG8cLUnXW9saFCt5c92Q7oTihSWQjCJFHvRiBVAv+0iQl85sY
	JGfIS53g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moucR-00EMiF-DF; Sun, 21 Nov 2021 21:43:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moucM-00EMht-3E
 for linux-mediatek@lists.infradead.org; Sun, 21 Nov 2021 21:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637530998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PsAjbjEBX1TEWfbU4V5lfGwmb9wj440rtELetXbcaEo=;
 b=Zp/chlxshyDa40lVA4MrI1q5uVTNgvwxZ1RgSk15pqyjxkf/5sesnksayF9O7t5GWg9hL7
 zfzqUX4ouM77P7Opn5Gq9mXoReqRIBfygardd94UN/AtCU3otdIzfHGDvhgtCn59ZlA4Gu
 SxhAJ6IZbCRVx//2WE9PsQhzLnZxJs0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-vBgP6-GZMK2orhZta7SmzA-1; Sun, 21 Nov 2021 16:43:17 -0500
X-MC-Unique: vBgP6-GZMK2orhZta7SmzA-1
Received: by mail-ed1-f71.google.com with SMTP id
 l15-20020a056402124f00b003e57269ab87so12948347edw.6
 for <linux-mediatek@lists.infradead.org>; Sun, 21 Nov 2021 13:43:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2iyFN2ouNpAbaW2ecmYacgfRXu8R7sEqLFn3id1kdVY=;
 b=k57RsB65xSwS+4YCccp2IyZqCLTCBMgfpBW7RILSXWqigBXW7ozWSVJM0xu0AiFRFZ
 n5irG51S4isols/XX6ldhlI6wT2wL2u/0B8mexnXj+lxnrt0MwSD1M3ZCpkNvQ0NMnfN
 xNtLISeFwk75eK36CEw+fbiAZGeT7UliOed95TfKNHYffM+/0jzyXEstaq9CDXT+8KA5
 5Kp61JXg5IcDjLMeHj2vMaAioUdZAPE7Ecbo4vC6x1X6XjYS7ltsZVgiM8viuBANISsk
 7z6rXvg+ZfBhWibO06nymWnB8MoCOPszmj7C3v7viLbq5/qPCJ0fmESMrFycJUW+jhnM
 yhwg==
X-Gm-Message-State: AOAM531yD6a+mtScRnuOwsXNo1ZvM1fj2R/a2ipRMFGnkaLhhgN85msn
 lAB4alctZBWryLg4EGYa9H1aT3smcANNaYPYu7yz6aiRBhw41aTXju12QFp3DDgZkYgDM6/qP7U
 r0sjvv/Wwh7d6GX6b997mPmFqwDJXOiUL
X-Received: by 2002:a17:906:4fc4:: with SMTP id
 i4mr36073159ejw.81.1637530996166; 
 Sun, 21 Nov 2021 13:43:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvOEcZwGcBECfj6EwNtsd0mg9tg4INpm0xQAAwMqMPZ5xsJDdDduJET5lFAtuNZxbFb/aisA==
X-Received: by 2002:a17:906:4fc4:: with SMTP id
 i4mr36072988ejw.81.1637530994949; 
 Sun, 21 Nov 2021 13:43:14 -0800 (PST)
Received: from localhost (net-93-151-197-210.cust.vodafonedsl.it.
 [93.151.197.210])
 by smtp.gmail.com with ESMTPSA id ga37sm2446072ejc.65.2021.11.21.13.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 13:43:14 -0800 (PST)
Date: Sun, 21 Nov 2021 22:43:12 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 shawnku@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] mt76: mt7921s: fix the device cannot sleep deeply in
 suspend
Message-ID: <YZq9cBbzwtvzEKyN@lore-desk>
References: <YZkDmDIqnePjIF+O@lore-desk--annotate>
 <1637440161-1946-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1637440161-1946-1-git-send-email-sean.wang@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_134322_457989_20382B05 
X-CRM114-Status: GOOD (  35.60  )
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
Content-Type: multipart/mixed; boundary="===============4014119296072723648=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============4014119296072723648==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CoDL8wbKOFWHQBWy"
Content-Disposition: inline

--CoDL8wbKOFWHQBWy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> >> > From: Sean Wang <sean.wang@mediatek.com>
> >> >
> >> > According to the MT7921S firmware, the cmd MCU_UNI_CMD_HIF_CTRL have
> >> > to be last MCU command to execute in suspend handler and all data
> >> > traffic have to be stopped before the cmd MCU_UNI_CMD_HIF_CTRL
> >> > starts as well in order that mt7921 can successfully fall into the d=
eep sleep mode.
> >> >
> >> > Where we reuse the flag MT76_STATE_SUSPEND and avoid creating
> >> > another global flag to stop all of the traffic onto the SDIO bus.
> >> >
> >> > Fixes: 48fab5bbef40 ("mt76: mt7921: introduce mt7921s support")
> >> > Reported-by: Leon Yen <leon.yen@mediatek.com>
> >> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> >> > ---
> >> >  .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  2 +-
> >> > .../net/wireless/mediatek/mt76/mt7921/main.c  |  3 --
> >> > .../net/wireless/mediatek/mt76/mt7921/sdio.c  | 34 ++++++++++++-----=
--
> >> >  drivers/net/wireless/mediatek/mt76/sdio.c     |  3 +-
> >> >  .../net/wireless/mediatek/mt76/sdio_txrx.c    |  3 +-
> >> >  5 files changed, 27 insertions(+), 18 deletions(-)
> >> >
> >> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> >> > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> >> > index 26b4b875dcc0..61c4c86e79c8 100644
> >> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> >> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> >> > @@ -2461,7 +2461,7 @@ void mt76_connac_mcu_set_suspend_iter(void *pr=
iv, u8 *mac,
> >> >=09=09=09=09      struct ieee80211_vif *vif)  {
> >> >=09struct mt76_phy *phy =3D priv;
> >> > -=09bool suspend =3D test_bit(MT76_STATE_SUSPEND, &phy->state);
> >> > +=09bool suspend =3D !test_bit(MT76_STATE_RUNNING, &phy->state);
> >> >=09struct ieee80211_hw *hw =3D phy->hw;
> >> >=09struct cfg80211_wowlan *wowlan =3D hw->wiphy->wowlan_config;
> >> >=09int i;
> >> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> >> > b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> >> > index e022251b4006..0b2a6b7f22ea 100644
> >> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> >> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> >> > @@ -1242,8 +1242,6 @@ static int mt7921_suspend(struct ieee80211_hw =
*hw,
> >> >=09mt7921_mutex_acquire(dev);
> >> >
> >> >=09clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
> >> > -
> >> > -=09set_bit(MT76_STATE_SUSPEND, &phy->mt76->state);
> >> >=09ieee80211_iterate_active_interfaces(hw,
> >> >=09=09=09=09=09    IEEE80211_IFACE_ITER_RESUME_ALL,
> >> >=09=09=09=09=09    mt76_connac_mcu_set_suspend_iter, @@ -1262,7 +1260=
,6 @@
> >> > static int mt7921_resume(struct ieee80211_hw *hw)
> >> >=09mt7921_mutex_acquire(dev);
> >> >
> >> >=09set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
> >> > -=09clear_bit(MT76_STATE_SUSPEND, &phy->mt76->state);
> >> >=09ieee80211_iterate_active_interfaces(hw,
> >> >=09=09=09=09=09    IEEE80211_IFACE_ITER_RESUME_ALL,
> >> >=09=09=09=09=09    mt76_connac_mcu_set_suspend_iter, diff --git
> >> > a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> >> > b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> >> > index 5fee489c7a99..5c88b6b8d097 100644
> >> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> >> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
> >> > @@ -206,6 +206,8 @@ static int mt7921s_suspend(struct device *__dev)
> >> >=09int err;
> >> >
> >> >=09pm->suspended =3D true;
> >> > +=09set_bit(MT76_STATE_SUSPEND, &mdev->phy.state);
> >> > +
> >> >=09cancel_delayed_work_sync(&pm->ps_work);
> >> >=09cancel_work_sync(&pm->wake_work);
> >> >
> >> > @@ -213,10 +215,6 @@ static int mt7921s_suspend(struct device *__dev=
)
> >> >=09if (err < 0)
> >> >=09=09goto restore_suspend;
> >> >
> >> > -=09err =3D mt76_connac_mcu_set_hif_suspend(mdev, true);
> >> > -=09if (err)
> >> > -=09=09goto restore_suspend;
> >> > -
> >> >=09/* always enable deep sleep during suspend to reduce
> >> >=09 * power consumption
> >> >=09 */
> >> > @@ -224,34 +222,45 @@ static int mt7921s_suspend(struct device
> >> > *__dev)
> >> >
> >> >=09mt76_txq_schedule_all(&dev->mphy);
> >> >=09mt76_worker_disable(&mdev->tx_worker);
> >> > -=09mt76_worker_disable(&mdev->sdio.txrx_worker);
> >> >=09mt76_worker_disable(&mdev->sdio.status_worker);
> >> > -=09mt76_worker_disable(&mdev->sdio.net_worker);
> >> >=09cancel_work_sync(&mdev->sdio.stat_work);
> >> >=09clear_bit(MT76_READING_STATS, &dev->mphy.state);
> >> > -
> >> >=09mt76_tx_status_check(mdev, true);
> >> >
> >> > -=09err =3D mt7921_mcu_fw_pmctrl(dev);
> >> > +=09mt76_worker_schedule(&mdev->sdio.txrx_worker);
> >>
> >> I guess mt76_worker_disable() is supposed to do it, right?
> >> I guess we can assume txrx_worker is no longer running here, right?
> >
> >I can see it now, txrx_worker can be running on the different cpu.
> >I guess we need to add just the wait_event_timeout() and move
> >mt76_connac_mcu_set_hif_suspend() below. What do you think?
> >Can you please try the chunk below?
>=20
> mt76_connac_mcu_set_hif_suspend have to rely on txrx_worker and net_worke=
r to
> send the command MCU_UNI_CMD_HIF_CTRL and receive the corresponding event=
,
> so that is why we cannnot disable txrx_worker and net_worker with mt76_wo=
rker_disable
> until the mt76_connac_mcu_set_hif_suspend is done.

ack, right. I forgot about this double dependency :)

>=20
> >
> >Regards,
> >Lorenzo
> >
> >>
> >> > +=09wait_event_timeout(dev->mt76.sdio.wait,
> >> > +=09=09=09   mt76s_txqs_empty(&dev->mt76), 5 * HZ);
> >> > +
> >> > +=09/* It is supposed that SDIO bus is idle at the point */
> >> > +=09err =3D mt76_connac_mcu_set_hif_suspend(mdev, true);
> >> >=09if (err)
> >> >=09=09goto restore_worker;
> >> >
> >> > +=09mt76_worker_disable(&mdev->sdio.txrx_worker);
> >> > +=09mt76_worker_disable(&mdev->sdio.net_worker);
> >> > +
> >> > +=09err =3D mt7921_mcu_fw_pmctrl(dev);
> >> > +=09if (err)
> >> > +=09=09goto restore_txrx_worker;
> >> > +
> >> >=09sdio_set_host_pm_flags(func, MMC_PM_KEEP_POWER);
> >> >
> >> >=09return 0;
> >> >
> >> > +restore_txrx_worker:
> >> > +=09mt76_worker_enable(&mdev->sdio.net_worker);
> >> > +=09mt76_worker_enable(&mdev->sdio.txrx_worker);
> >> > +=09mt76_connac_mcu_set_hif_suspend(mdev, false);
> >> > +
> >> >  restore_worker:
> >> >=09mt76_worker_enable(&mdev->tx_worker);
> >> > -=09mt76_worker_enable(&mdev->sdio.txrx_worker);
> >> >=09mt76_worker_enable(&mdev->sdio.status_worker);
> >> > -=09mt76_worker_enable(&mdev->sdio.net_worker);
> >> >
> >> >=09if (!pm->ds_enable)
> >> >=09=09mt76_connac_mcu_set_deep_sleep(mdev, false);
> >> >
> >> > -=09mt76_connac_mcu_set_hif_suspend(mdev, false);
> >> > -
> >> >  restore_suspend:
> >> > +=09clear_bit(MT76_STATE_SUSPEND, &mdev->phy.state);
> >> >=09pm->suspended =3D false;
> >> >
> >> >=09return err;
> >> > @@ -266,6 +275,7 @@ static int mt7921s_resume(struct device *__dev)
> >> >=09int err;
> >> >
> >> >=09pm->suspended =3D false;
> >> > +=09clear_bit(MT76_STATE_SUSPEND, &mdev->phy.state);
> >> >
> >> >=09err =3D mt7921_mcu_drv_pmctrl(dev);
> >> >=09if (err < 0)
> >> > diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c
> >> > b/drivers/net/wireless/mediatek/mt76/sdio.c
> >> > index c99acc21225e..b0bc7be0fb1f 100644
> >> > --- a/drivers/net/wireless/mediatek/mt76/sdio.c
> >> > +++ b/drivers/net/wireless/mediatek/mt76/sdio.c
> >> > @@ -479,7 +479,8 @@ static void mt76s_status_worker(struct mt76_work=
er *w)
> >> >=09=09=09resched =3D true;
> >> >
> >> >=09=09if (dev->drv->tx_status_data &&
> >> > -=09=09    !test_and_set_bit(MT76_READING_STATS, &dev->phy.state))
> >> > +=09=09    !test_and_set_bit(MT76_READING_STATS, &dev->phy.state) &&
> >> > +=09=09    !test_bit(MT76_STATE_SUSPEND, &dev->phy.state))
> >> >=09=09=09queue_work(dev->wq, &dev->sdio.stat_work);
> >> >=09} while (nframes > 0);
> >> >
> >> > diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> >> > b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> >> > index 649a56790b89..801590a0a334 100644
> >> > --- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> >> > +++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> >> > @@ -317,7 +317,8 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
> >> >=09=09if (ret > 0)
> >> >=09=09=09nframes +=3D ret;
> >> >
> >> > -=09=09if (test_bit(MT76_MCU_RESET, &dev->phy.state)) {
> >> > +=09=09if (test_bit(MT76_MCU_RESET, &dev->phy.state) ||
> >> > +=09=09    test_bit(MT76_STATE_SUSPEND, &dev->phy.state)) {
> >> >=09=09=09if (!mt76s_txqs_empty(dev))
> >> >=09=09=09=09continue;
> >> >=09=09=09else
> >>
> >> since mt76s_tx_run_queue will not run if MT76_MCU_RESET is set, do we
> >> really need to check it for each iteration or is fine something like:
> >>
> >> diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> >> b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> >> index 649a56790b89..68f30a83fa5d 100644
> >> --- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> >> +++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
> >> @@ -317,14 +317,12 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
> >>=09=09if (ret > 0)
> >>=09=09=09nframes +=3D ret;
> >>
> >> -=09=09if (test_bit(MT76_MCU_RESET, &dev->phy.state)) {
> >> -=09=09=09if (!mt76s_txqs_empty(dev))
> >> -=09=09=09=09continue;
> >> -=09=09=09else
> >> -=09=09=09=09wake_up(&sdio->wait);
> >> -=09=09}
> >>=09} while (nframes > 0);
> >>
> >> +=09if (test_bit(MT76_MCU_RESET, &dev->phy.state) &&
> >> +=09    mt76s_txqs_empty(dev))
> >> +=09=09wake_up(&sdio->wait);
> >> +
>=20
> If doing so, mt76s_txqs_empty may not always be true because enqueuing pa=
ckets
> to q_tx or MCU command to q_mcu simultanenously from the other contexts i=
n
> different cpu is possible.
>=20
> It seemed to me we should check it for each iteration to guarantee that w=
e can
> wake up the one that is waiting for the all the queues are empty at some =
time.

IIUC what we are interested here is there are no queued frames into the hw
queues during suspend or reset, right?

>=20
> >>=09/* enable interrupt */
> >>=09sdio_writel(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
> >>=09sdio_release_host(sdio->func);
> >>
> >> Regards,
> >> Lorenzo
> >>
> >> > --
> >> > 2.25.1
> >> >
> >
> >
> >
>=20

--CoDL8wbKOFWHQBWy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYZq9cAAKCRA6cBh0uS2t
rAAEAQDdG6RxR4EcCo2lVK6tXSpauo5fIBSe9nsuXbllDAvbKwD9ED9QCR/o9ucN
Z+fkc9GROkKYXrVb5ApsnNFmBOQefQs=
=7q3c
-----END PGP SIGNATURE-----

--CoDL8wbKOFWHQBWy--



--===============4014119296072723648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4014119296072723648==--


