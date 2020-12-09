Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B2AC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 18:43:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48BA723101
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 18:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48BA723101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=idhz099VowqM7el4RhTsVfK/Q9z0MqYZFDnCB4F3zFo=; b=1jsiLZXT7KPfSLNQAGsLG2b3b
	cgkPHucLM43ZGlhSMLlirXgy85rmCe3/3PSuhn5JJRPdIIOEzjnE3uryfgabqPPco+wZ6FQcY9JGM
	x4ndEDFqNMtA4OkMXeTGDe831semEttEVLnWxt2fioc6rQRPYgWZ7eaJcWvBQ8R1oQoKijPsSyWfc
	AET3Prn53QlnNf/PS22deBBkPPDTnEjU/bu0iq4wzXuZBFwinE1B5Nq5wkC2hcgl/3fd/JFCVDKcB
	91BlPz/Q3jJtUkcBsLkiBkT8pcAWNYzdLB8wx57gzJK9HW0KbgIFMDEnaeF6Ref5guAd5BUVNExHz
	G+ni37feA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn4Qd-0007uL-Bq; Wed, 09 Dec 2020 18:43:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn4QZ-0007t4-Nf
 for linux-mediatek@lists.infradead.org; Wed, 09 Dec 2020 18:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607539382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1KZSIoFaqkBVOcNbsmwN1bUMt+Qcy66BBnYP0raNcKM=;
 b=awZUXQLTcL64Iu/PojAb/hYF5Bpe0cq7kNqR2jCXLDnoxZ3r3plYkPw5pj/uy1TXzp7rEd
 fJmnD0WzeQ0CvoLgXFYTmIzNISuWthN3JIcOM9iNrbJt9etG3uJCL31f/WNVpTP+dO9ade
 WLytMDqaJKLGsF59PWaHrdYnZ+UsqLc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-XVC0UeS7Nz-eawHIOKv1NA-1; Wed, 09 Dec 2020 13:41:15 -0500
X-MC-Unique: XVC0UeS7Nz-eawHIOKv1NA-1
Received: by mail-wm1-f71.google.com with SMTP id u123so668823wmu.5
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Dec 2020 10:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MUuXGmzlvNA0nqHFSPBjY5QQLvxqOwA8Xwb7SFNgqDc=;
 b=AFoAymN2OlDheRxQ1+BdHTXHV0/WkGU4gl7GW8od/bC4uBQKc74WKK94YKhwtRKy3V
 so1uc42rbnr/v6OrNLynlEUPPhPBO14ABVEyMXaye5MqGFp7AOu+lXK79ImE7sEbhiZv
 kCIYKvhrVqUZBaF2eLhqawa9XEYa6YaJ2i8D8yXdcHbg0EVECXxBTVyugVa86PPEycPp
 au6PqewLvZp4x26R5MLA95fROZ4b5KfhRjUlQqiIxrmFa6O5WaNP2Uu3gwDX2yd+8Qlq
 7qUMIPmtufXrzKQbll+wtOlJiSk7X6hkUpldZC3KLgCLGIM/YiiWxokPnTmITILqErkf
 F1Dg==
X-Gm-Message-State: AOAM532HPFhGAZnxZGMkGO33iueTqvUS5idR2GLCymAyjuhG2wj8Ojg2
 v6CWlvm039tLG+ML+yCLRW2MdoSqODHMs/DWUUt37ag0jimQYV3geFyQ423bTsrYRbrmZ+Fa86+
 aOAfNEp6AejzwnbrN1kduS//4V1VJlDtb
X-Received: by 2002:a1c:2ecc:: with SMTP id u195mr4225677wmu.27.1607539273945; 
 Wed, 09 Dec 2020 10:41:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzw0a0hAtstycfl5aKOmDMEIiB4WHqnPE9xMfyLcrctS8QgJaY29lJVZwVTDb248TEDDWzIUg==
X-Received: by 2002:a1c:2ecc:: with SMTP id u195mr4225657wmu.27.1607539273725; 
 Wed, 09 Dec 2020 10:41:13 -0800 (PST)
Received: from localhost ([151.66.8.153])
 by smtp.gmail.com with ESMTPSA id h184sm5557179wmh.23.2020.12.09.10.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:41:13 -0800 (PST)
Date: Wed, 9 Dec 2020 19:41:09 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH 1/2] mt76: mt7915: reset token when mac_reset happens
Message-ID: <20201209184109.GB2735@lore-desk>
References: <96fb46ff1e2e3a9c0646a3b3dce43c3840b7bae0.1607536573.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <96fb46ff1e2e3a9c0646a3b3dce43c3840b7bae0.1607536573.git.ryder.lee@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_134303_854087_BB450A29 
X-CRM114-Status: GOOD (  17.30  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Content-Type: multipart/mixed; boundary="===============5386549230266003365=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============5386549230266003365==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Reset buffering token in mt7915_mac_reset_work() to avoid possible leakeg=
e,
> which leads to Tx stop after mac reset.
>=20
> Tested-by: Bo Jiao <bo.jiao@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7915/init.c  | 17 +-------------
>  .../net/wireless/mediatek/mt76/mt7915/mac.c   | 23 +++++++++++++++++++
>  .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
>  3 files changed, 25 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/init.c
> index ff29a8090739..255ccd7e3d27 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -672,27 +672,12 @@ int mt7915_register_device(struct mt7915_dev *dev)
> =20
>  void mt7915_unregister_device(struct mt7915_dev *dev)
>  {
> -=09struct mt76_txwi_cache *txwi;
> -=09int id;
> -
>  =09mt7915_unregister_ext_phy(dev);
>  =09mt76_unregister_device(&dev->mt76);
>  =09mt7915_mcu_exit(dev);
>  =09mt7915_dma_cleanup(dev);
> =20
> -=09spin_lock_bh(&dev->token_lock);
> -=09idr_for_each_entry(&dev->token, txwi, id) {
> -=09=09mt7915_txp_skb_unmap(&dev->mt76, txwi);
> -=09=09if (txwi->skb) {
> -=09=09=09struct ieee80211_hw *hw;
> -
> -=09=09=09hw =3D mt76_tx_status_get_hw(&dev->mt76, txwi->skb);
> -=09=09=09ieee80211_free_txskb(hw, txwi->skb);
> -=09=09}
> -=09=09mt76_put_txwi(&dev->mt76, txwi);

it seems to me you are not using latest codebase here. I guess you are miss=
ing
the commit below:

commit 5342758d5522dbf8081360be9c8545bac84b80f3
Author: Felix Fietkau <nbd@nbd.name>
Date:   Sat Nov 21 16:00:14 2020 +0100

mt76: mt7915: stop queues when running out of tx tokens

Avoids packet drops under load with lots of stations

Regards,
Lorenzo

> -=09}
> -=09spin_unlock_bh(&dev->token_lock);
> -=09idr_destroy(&dev->token);
> +=09mt7915_tx_token_put(dev);
> =20
>  =09mt76_free_device(&dev->mt76);
>  }
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mac.c
> index 7f08c88d3282..25623e450bc5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> @@ -1466,6 +1466,26 @@ mt7915_dma_reset(struct mt7915_phy *phy)
>  =09=09 MT_WFDMA1_GLO_CFG_TX_DMA_EN | MT_WFDMA1_GLO_CFG_RX_DMA_EN);
>  }
> =20
> +void mt7915_tx_token_put(struct mt7915_dev *dev);
> +{
> +=09struct mt76_txwi_cache *txwi;
> +=09int id;
> +
> +=09spin_lock_bh(&dev->token_lock);
> +=09idr_for_each_entry(&dev->token, txwi, id) {
> +=09=09mt7915_txp_skb_unmap(&dev->mt76, txwi);
> +=09=09if (txwi->skb) {
> +=09=09=09struct ieee80211_hw *hw;
> +
> +=09=09=09hw =3D mt76_tx_status_get_hw(&dev->mt76, txwi->skb);
> +=09=09=09ieee80211_free_txskb(hw, txwi->skb);
> +=09=09}
> +=09=09mt76_put_txwi(&dev->mt76, txwi);
> +=09}
> +=09spin_unlock_bh(&dev->token_lock);
> +=09idr_destroy(&dev->token);
> +}
> +
>  /* system error recovery */
>  void mt7915_mac_reset_work(struct work_struct *work)
>  {
> @@ -1506,6 +1526,9 @@ void mt7915_mac_reset_work(struct work_struct *work=
)
> =20
>  =09mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_DMA_STOPPED);
> =20
> +=09mt7915_tx_token_put(dev);
> +=09idr_init(&dev->token);
> +
>  =09if (mt7915_wait_reset_state(dev, MT_MCU_CMD_RESET_DONE)) {
>  =09=09mt7915_dma_reset(&dev->phy);
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers=
/net/wireless/mediatek/mt76/mt7915/mt7915.h
> index 5bf76c74373f..3cee1cffc95e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> @@ -468,6 +468,7 @@ int mt7915_tx_prepare_skb(struct mt76_dev *mdev, void=
 *txwi_ptr,
>  =09=09=09  struct ieee80211_sta *sta,
>  =09=09=09  struct mt76_tx_info *tx_info);
>  void mt7915_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_ent=
ry *e);
> +void mt7915_tx_token_put(struct mt7915_dev *dev);
>  int mt7915_init_tx_queues(struct mt7915_phy *phy, int idx, int n_desc);
>  void mt7915_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
>  =09=09=09 struct sk_buff *skb);
> --=20
> 2.18.0
>=20

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCX9EaQwAKCRA6cBh0uS2t
rNLGAP4+MjR1yUwoTUosuMZYLerMkvGPeeszKH33x5hzyksLcQEAwJwNwd1xwwTR
NCGjAqxku4H19Sgz5oWAIFiMIT4RTwE=
=UP9M
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--



--===============5386549230266003365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5386549230266003365==--


