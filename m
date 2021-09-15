Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB62CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:03:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93A0B61185
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93A0B61185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xEkQuZeZKN5AfrVlMhGp5yLmLMPwSChDq/1Lmeipm4=; b=sMrYMKxjJShoXcfkYSIKPfeMYO
	73B7FY7w583vG9Th0kXTNANWH687OXTTdDZ3hFnFRU8DBdn/gw0IRoYAJRjk1j4Ozoq3OxLMfHkND
	gZMcjjbXMW1taefsyKxXPg+nH9UDo3ZBLwZ930NijL011wXG7yl9SFGha8yclHpcpYAI7CC2QcD0m
	CWgXkEO/WAd1+8EQEU5CNx/1VSp2bFOcgoYRfV5Tzv4YsW1s6+4GhGBcmBxw2fbOZOcqtOWaSJvQ2
	KF2ywA0nEzdjTHXuacJ0E5JagEzqB5Ury/Izz0tHiZfUNPt0nUNxtFnDHPAmN+hADj8ROJs2pGGtl
	rjtUKuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQUZF-0097DL-TL; Wed, 15 Sep 2021 13:03:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQUZD-0097Cv-73
 for linux-mediatek@lists.infradead.org; Wed, 15 Sep 2021 13:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631710990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fNJv/M2Qi5N6uRsXUZ0S1syU/QAoqm5N3nua05jDfmU=;
 b=fYzycq52nyrGpd/CyEd+mBtLpNxG2ZUDMnrC/beFqfK4JJQ6iu/YdbIWmOlTHIHVmozr+s
 fEx14q/36MRmCQ5HzNY7CYiJNSQjSVvwHaq20fgDLqzmZVMINV6x/W8csj//chWyb6Alhw
 xyGZ37sfZ/ad6j6H8CSvzD6GqaAqyx8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-89xxWMd8Od-onxDQEgQvnQ-1; Wed, 15 Sep 2021 09:03:08 -0400
X-MC-Unique: 89xxWMd8Od-onxDQEgQvnQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 c25-20020a170906341900b005eea9bf6f4aso1485752ejb.12
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Sep 2021 06:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vsS4gxvVFGdA0MkE8p8zJnAT8/RU139LbW1zE3u6VyQ=;
 b=R046l+CP9nHc/Oo28rGuMXiDXO5LUTVo6Ja8paBYu2XmFezhtgAR6Mj//R9bi3+ZtJ
 Pjg8LA+Vt7Sl6hjgu/PVxTtNJTxrvgu/YCOy77SuP5bpLk1yWREy7KlYdJ+eaecKali6
 DPChb6SNeRaxTiGHvPgD0wfTnkkzGv9vo/8/pWL5H+yNmg+S6Njruo65y/UiRkuMG/IA
 syLvIuwseOeJM/rMsnQ7udzF6qLon2eBnWcGXxRfSuNhJu8KeRjW/tzZ+E5MJ6e09iwm
 6ztHP72a68Q+dNuSaDYibJxJVxzg+xWTtSlyITJ6rpo5lklpkzxHCuU1sTfbIQbrSdvV
 Yadg==
X-Gm-Message-State: AOAM533OpFUC5f5F9l+XUZtdDuhWqQCMBThPdD4/J0eqDQ7MlZeyWT1R
 PTBpnv4IR2hT7bdaBc/3H/e5vfC3dWl2s1TRMWSlxhoAMxGMbfGc6WWsuhDlmUp9CQ9T3xn0Vs0
 TXkve1GiEUBWEYBpqqCRUTdb3eypREl81
X-Received: by 2002:a17:906:844d:: with SMTP id
 e13mr19862557ejy.223.1631710987534; 
 Wed, 15 Sep 2021 06:03:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeZlEPWaqRm4oWWVnZnxSWTn/hIL8kXRCQMija2PHxmYNMvLmQDeu/3SRN6pYBd7zzQ7/5rw==
X-Received: by 2002:a17:906:844d:: with SMTP id
 e13mr19862511ejy.223.1631710987131; 
 Wed, 15 Sep 2021 06:03:07 -0700 (PDT)
Received: from localhost (net-130-25-199-50.cust.vodafonedsl.it.
 [130.25.199.50])
 by smtp.gmail.com with ESMTPSA id di4sm7090471edb.34.2021.09.15.06.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:03:06 -0700 (PDT)
Date: Wed, 15 Sep 2021 15:03:03 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, steve.lee@mediatek.com,
 jemele@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 02/16] mt76: mt7921: refactor dma.c to be pcie specific
Message-ID: <YUHvB0gohA90G9Yj@lore-desk>
References: <cover.1631667941.git.objelf@gmail.com>
 <aa4827ded213e62c4c5521f219f52257ddeb3b1a.1631667941.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <aa4827ded213e62c4c5521f219f52257ddeb3b1a.1631667941.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_060311_381059_44BB37A1 
X-CRM114-Status: GOOD (  17.77  )
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
Content-Type: multipart/mixed; boundary="===============3304512778448764246=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3304512778448764246==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wg5HF+xfc9U35FXT"
Content-Disposition: inline

--Wg5HF+xfc9U35FXT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> This is a preliminary patch to introduce mt7921s support.
>=20
> make dma.c be used dedicately for mt7921e.
>=20
> by moving out mt7921_tx_cleanup from dma.c to mcu.c and then renaming
> mt7921_tx_cleanup to refect the exact thing the function actually does.
>=20
> Finally, dma.c totally become pcie specific one, only needed to
> be compiled only when CONFIG_MT7921E is enabled.
>=20
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/dma.c    | 8 +-------
>  drivers/net/wireless/mediatek/mt76/mt7921/mac.c    | 2 +-
>  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c    | 6 ++++++
>  drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h | 2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/dma.c
> index 802e40e42040..d3e2036a1974 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
> @@ -19,12 +19,6 @@ int mt7921_init_tx_queues(struct mt7921_phy *phy, int =
idx, int n_desc)
>  =09return 0;
>  }
> =20
> -void mt7921_tx_cleanup(struct mt7921_dev *dev)
> -{
> -=09mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WM], false);
> -=09mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WA], false);
> -}
> -
>  static int mt7921_poll_tx(struct napi_struct *napi, int budget)
>  {
>  =09struct mt7921_dev *dev;
> @@ -37,7 +31,7 @@ static int mt7921_poll_tx(struct napi_struct *napi, int=
 budget)
>  =09=09return 0;
>  =09}
> =20
> -=09mt7921_tx_cleanup(dev);
> +=09mt7921_mcu_tx_cleanup(dev);
>  =09if (napi_complete(napi))
>  =09=09mt7921_irq_enable(dev, MT_INT_TX_DONE_ALL);
>  =09mt76_connac_pm_unref(&dev->mphy, &dev->pm);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index d811702a3a2c..580a88b7841e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -1392,7 +1392,7 @@ void mt7921_pm_wake_work(struct work_struct *work)
>  =09=09mt76_for_each_q_rx(&dev->mt76, i)
>  =09=09=09napi_schedule(&dev->mt76.napi[i]);
>  =09=09mt76_connac_pm_dequeue_skbs(mphy, &dev->pm);
> -=09=09mt7921_tx_cleanup(dev);
> +=09=09mt7921_mcu_tx_cleanup(dev);
>  =09=09if (test_bit(MT76_STATE_RUNNING, &mphy->state))
>  =09=09=09ieee80211_queue_delayed_work(mphy->hw, &mphy->mac_work,
>  =09=09=09=09=09=09     MT7921_WATCHDOG_TIME);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index ecdc879216b9..6ba431347b3b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -1369,3 +1369,9 @@ int mt7921_get_txpwr_info(struct mt7921_dev *dev, s=
truct mt7921_txpwr *txpwr)
> =20
>  =09return 0;
>  }
> +
> +void mt7921_mcu_tx_cleanup(struct mt7921_dev *dev)
> +{
> +=09mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WM], false);
> +=09mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WA], false);
> +}

I guess it can be inline in mt7921.h, are you reusing it later?

> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index 70c0f41180a1..4c1c7c4eafac 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -330,7 +330,7 @@ void mt7921_mac_work(struct work_struct *work);
>  void mt7921_mac_reset_work(struct work_struct *work);
>  void mt7921_mac_update_mib_stats(struct mt7921_phy *phy);
>  void mt7921_reset(struct mt76_dev *mdev);
> -void mt7921_tx_cleanup(struct mt7921_dev *dev);
> +void mt7921_mcu_tx_cleanup(struct mt7921_dev *dev);
>  int mt7921e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
>  =09=09=09   enum mt76_txq_id qid, struct mt76_wcid *wcid,
>  =09=09=09   struct ieee80211_sta *sta,
> --=20
> 2.25.1
>=20

--Wg5HF+xfc9U35FXT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYUHvBQAKCRA6cBh0uS2t
rAZdAQDSbK+6Fki/iQTIapHMDc8bXQcSy0XPn+rkKZ0OEUsSIwEAuq1eGv1HEEZQ
w9jpUCkTBs5Q3IVo4i2vy7bn+NN28Qo=
=W87t
-----END PGP SIGNATURE-----

--Wg5HF+xfc9U35FXT--



--===============3304512778448764246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3304512778448764246==--


