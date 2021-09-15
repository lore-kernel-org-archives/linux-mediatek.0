Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C84C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:02:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49A62610A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49A62610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKc8/C5PRrTUmbqNqu+5X8y9I01AYZrfh3WpeTUC+ak=; b=JR0sEisfbJiVEcXXfQ2hI1stFK
	g6lVbbLMSxA/Sq6f8/SIYtbkK7dGCGBfZa19b+wfUNIEQa7hGRytbldOIMjBQVixJoGEe8afTS6vK
	TnPNYf0FoEI+aP/YJJN3QaqlB5X82iUfgxxJZfLP6SA5sLp7AqI1HKE0/NQBNfQPcirA3hEMPbbmz
	Y7QH7L+y1oI/1NsMTQvcL6st6VyiRnMBuELzdrsb55MSWmXX/p5H2PXwVEGt2vpk6b3vEWyAuJ1gd
	3C90xAbyGGs6nXuQ+un8hhfSg88JIUQsp61MeFw43sYDQY+0FFmRuYDLPVU03qPVU1mG1/LYixHwr
	+OkwJCrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQUYB-00974s-Gd; Wed, 15 Sep 2021 13:02:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQUY6-009743-GO
 for linux-mediatek@lists.infradead.org; Wed, 15 Sep 2021 13:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631710919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XbILCgsbW9IECDkfvEmLbOhB6wRzCd1gIQ+KV9uhaOQ=;
 b=Ysgiv+9NdwPYe56cR9b5jUiRf2LoudLAZfgu8/lgErGVuuTp7SYU+pLWlMWbdbhS+7lLxy
 6CMIm+LA1ltM4TMpK1CU1KAWo1nPaEUW7aiIrFx6f55ow/j0ei83YTxSpmYw2rWqI5MeCN
 PGi28oWgns1iSmjOq8jyI+L64mjdcSU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-oGo-2PTVMz-VNh_p-um4XQ-1; Wed, 15 Sep 2021 09:01:58 -0400
X-MC-Unique: oGo-2PTVMz-VNh_p-um4XQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 y19-20020a056402441300b003cd8ce2b987so1582328eda.6
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Sep 2021 06:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ffaLTFLTMxukcmSGGqoBnsd6QSo763HLuSsxUjAHzOM=;
 b=eg/f9YtNIb5gQV9uNVdc4ReHzOZ5zuPaa+TGCi8VUhy6DCofAjU7noEzKfY6pXOVgN
 euHLhkuHdgorU1XwbK20xugBmlK0IsGFRvCw0VRMnP7rZqt2i077duXi3V0xQH1DibJk
 XxOxnBdTGiVquPVQOi69mkNk30zVCMKlC+i2kqh2AkAuMqSvnSoRkKeb6Y5O/Oq0GtgW
 H02fHluat1p/hyviyfVVY8aDdNIlsMzhqQuiSTKvfGSQivrzsSH3QHdSDjjOhiqvBix3
 Br9AdSLQDVsNaVPTslZTj7qJHxNWKVEqf4NAw5JlJYKTPDFHgz6b96kJYnkc1pCrKC4x
 LZpg==
X-Gm-Message-State: AOAM533ppTjWzhQX/3t8gczAPWwdpNkhHkVMcF31Hs4SJsn7ok5dCDYz
 Q+1EVpXli/A8HujtXc1LhWCE4JF2ZsNg4eGium0ndPLvy4hRb6sR0wIEXQESKEWz46DCx6i9SID
 Cpp/wwSAzDhwCATb91kJko1iyYNlGttyK
X-Received: by 2002:a17:906:8608:: with SMTP id
 o8mr24896215ejx.470.1631710916536; 
 Wed, 15 Sep 2021 06:01:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1yL43OJ7BO2VEntcp+Z3insmaCbigzjREEZqPSUIqijihyYzlJ9n6rfzF3qOb5u9X8Iw0RQ==
X-Received: by 2002:a17:906:8608:: with SMTP id
 o8mr24896168ejx.470.1631710915941; 
 Wed, 15 Sep 2021 06:01:55 -0700 (PDT)
Received: from localhost (net-130-25-199-50.cust.vodafonedsl.it.
 [130.25.199.50])
 by smtp.gmail.com with ESMTPSA id i6sm6202995ejd.57.2021.09.15.06.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:01:55 -0700 (PDT)
Date: Wed, 15 Sep 2021 15:01:52 +0200
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
Subject: Re: [PATCH v1 01/16] mt76: mt7921: refactor mac.c to be bus
 independent
Message-ID: <YUHuwOVrlXvDS08a@lore-desk>
References: <cover.1631667941.git.objelf@gmail.com>
 <f0d66c706432282ca97156f2d0c514d7c260ec09.1631667941.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f0d66c706432282ca97156f2d0c514d7c260ec09.1631667941.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_060202_796116_28F89E6F 
X-CRM114-Status: GOOD (  20.88  )
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
Content-Type: multipart/mixed; boundary="===============6863183074066015998=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============6863183074066015998==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="avc4J7JIHHPHavfO"
Content-Disposition: inline

--avc4J7JIHHPHavfO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> This is a preliminary patch to introduce mt7921s support.
>=20
> Split out a new pci_mac.c from mac.c to make mac.c reusable between
> mt7921s and mt7921e.

Hi Sean,

mostly fine, just few nitpicks inline.

Regards,
Lorenzo

>=20
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt7921/Makefile    |   2 +-
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 331 +----------------
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  25 +-
>  .../net/wireless/mediatek/mt76/mt7921/pci.c   |  12 +-
>  .../wireless/mediatek/mt76/mt7921/pci_mac.c   | 345 ++++++++++++++++++
>  5 files changed, 379 insertions(+), 336 deletions(-)
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile b/drivers=
/net/wireless/mediatek/mt76/mt7921/Makefile
> index 3471d82fc265..554202358470 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
> @@ -4,5 +4,5 @@ obj-$(CONFIG_MT7921E) +=3D mt7921e.o
> =20
>  CFLAGS_trace.o :=3D -I$(src)
> =20
> -mt7921e-y :=3D pci.o mac.o mcu.o dma.o eeprom.o main.o init.o debugfs.o =
trace.o
> +mt7921e-y :=3D pci.o pci_mac.o mac.o mcu.o dma.o eeprom.o main.o init.o =
debugfs.o trace.o
>  mt7921e-$(CONFIG_NL80211_TESTMODE) +=3D testmode.o
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index 27f13228c5a7..d811702a3a2c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -49,7 +49,7 @@ bool mt7921_mac_wtbl_update(struct mt7921_dev *dev, int=
 idx, u32 mask)
>  =09=09=09 0, 5000);
>  }
> =20
> -static void mt7921_mac_sta_poll(struct mt7921_dev *dev)
> +void mt7921_mac_sta_poll(struct mt7921_dev *dev)
>  {
>  =09static const u8 ac_to_tid[] =3D {
>  =09=09[IEEE80211_AC_BE] =3D 0,
> @@ -836,7 +836,7 @@ mt7921_mac_write_txwi_80211(struct mt7921_dev *dev, _=
_le32 *txwi,
>  =09txwi[7] |=3D cpu_to_le32(val);
>  }
> =20
> -static void
> +void

can you please remove new line here?

>  mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32 *txwi,
>  =09=09      struct sk_buff *skb, struct mt76_wcid *wcid,
>  =09=09      struct ieee80211_key_conf *key, int pid,
> @@ -922,86 +922,7 @@ mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32=
 *txwi,
>  =09}
>  }
> =20
> -static void
> -mt7921_write_hw_txp(struct mt7921_dev *dev, struct mt76_tx_info *tx_info=
,
> -=09=09    void *txp_ptr, u32 id)
> -{
> -=09struct mt7921_hw_txp *txp =3D txp_ptr;
> -=09struct mt7921_txp_ptr *ptr =3D &txp->ptr[0];
> -=09int i, nbuf =3D tx_info->nbuf - 1;
> -
> -=09tx_info->buf[0].len =3D MT_TXD_SIZE + sizeof(*txp);
> -=09tx_info->nbuf =3D 1;
> -
> -=09txp->msdu_id[0] =3D cpu_to_le16(id | MT_MSDU_ID_VALID);
> -
> -=09for (i =3D 0; i < nbuf; i++) {
> -=09=09u16 len =3D tx_info->buf[i + 1].len & MT_TXD_LEN_MASK;
> -=09=09u32 addr =3D tx_info->buf[i + 1].addr;
> -
> -=09=09if (i =3D=3D nbuf - 1)
> -=09=09=09len |=3D MT_TXD_LEN_LAST;
> -
> -=09=09if (i & 1) {
> -=09=09=09ptr->buf1 =3D cpu_to_le32(addr);
> -=09=09=09ptr->len1 =3D cpu_to_le16(len);
> -=09=09=09ptr++;
> -=09=09} else {
> -=09=09=09ptr->buf0 =3D cpu_to_le32(addr);
> -=09=09=09ptr->len0 =3D cpu_to_le16(len);
> -=09=09}
> -=09}
> -}
> -
> -int mt7921_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
> -=09=09=09  enum mt76_txq_id qid, struct mt76_wcid *wcid,
> -=09=09=09  struct ieee80211_sta *sta,
> -=09=09=09  struct mt76_tx_info *tx_info)
> -{
> -=09struct mt7921_dev *dev =3D container_of(mdev, struct mt7921_dev, mt76=
);
> -=09struct ieee80211_tx_info *info =3D IEEE80211_SKB_CB(tx_info->skb);
> -=09struct ieee80211_key_conf *key =3D info->control.hw_key;
> -=09struct mt76_txwi_cache *t;
> -=09struct mt7921_txp_common *txp;
> -=09int id, pid;
> -=09u8 *txwi =3D (u8 *)txwi_ptr;
> -
> -=09if (unlikely(tx_info->skb->len <=3D ETH_HLEN))
> -=09=09return -EINVAL;
> -
> -=09if (!wcid)
> -=09=09wcid =3D &dev->mt76.global_wcid;
> -
> -=09t =3D (struct mt76_txwi_cache *)(txwi + mdev->drv->txwi_size);
> -=09t->skb =3D tx_info->skb;
> -
> -=09id =3D mt76_token_consume(mdev, &t);
> -=09if (id < 0)
> -=09=09return id;
> -
> -=09if (sta) {
> -=09=09struct mt7921_sta *msta =3D (struct mt7921_sta *)sta->drv_priv;
> -
> -=09=09if (time_after(jiffies, msta->last_txs + HZ / 4)) {
> -=09=09=09info->flags |=3D IEEE80211_TX_CTL_REQ_TX_STATUS;
> -=09=09=09msta->last_txs =3D jiffies;
> -=09=09}
> -=09}
> -
> -=09pid =3D mt76_tx_status_skb_add(mdev, wcid, tx_info->skb);
> -=09mt7921_mac_write_txwi(dev, txwi_ptr, tx_info->skb, wcid, key,
> -=09=09=09      pid, false);
> -
> -=09txp =3D (struct mt7921_txp_common *)(txwi + MT_TXD_SIZE);
> -=09memset(txp, 0, sizeof(struct mt7921_txp_common));
> -=09mt7921_write_hw_txp(dev, tx_info, txp, id);
> -
> -=09tx_info->skb =3D DMA_DUMMY_DATA;
> -
> -=09return 0;
> -}
> -
> -static void
> +void

can you please remove new line here?

>  mt7921_tx_check_aggr(struct ieee80211_sta *sta, __le32 *txwi)
>  {
>  =09struct mt7921_sta *msta;
> @@ -1026,143 +947,6 @@ mt7921_tx_check_aggr(struct ieee80211_sta *sta, __=
le32 *txwi)
>  =09=09ieee80211_start_tx_ba_session(sta, tid, 0);
>  }
> =20
> -static void
> -mt7921_txp_skb_unmap(struct mt76_dev *dev, struct mt76_txwi_cache *t)
> -{
> -=09struct mt7921_txp_common *txp;
> -=09int i;
> -
> -=09txp =3D mt7921_txwi_to_txp(dev, t);
> -
> -=09for (i =3D 0; i < ARRAY_SIZE(txp->hw.ptr); i++) {
> -=09=09struct mt7921_txp_ptr *ptr =3D &txp->hw.ptr[i];
> -=09=09bool last;
> -=09=09u16 len;
> -
> -=09=09len =3D le16_to_cpu(ptr->len0);
> -=09=09last =3D len & MT_TXD_LEN_LAST;
> -=09=09len &=3D MT_TXD_LEN_MASK;
> -=09=09dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf0), len,
> -=09=09=09=09 DMA_TO_DEVICE);
> -=09=09if (last)
> -=09=09=09break;
> -
> -=09=09len =3D le16_to_cpu(ptr->len1);
> -=09=09last =3D len & MT_TXD_LEN_LAST;
> -=09=09len &=3D MT_TXD_LEN_MASK;
> -=09=09dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf1), len,
> -=09=09=09=09 DMA_TO_DEVICE);
> -=09=09if (last)
> -=09=09=09break;
> -=09}
> -}
> -
> -static void
> -mt7921_txwi_free(struct mt7921_dev *dev, struct mt76_txwi_cache *t,
> -=09=09 struct ieee80211_sta *sta, bool clear_status,
> -=09=09 struct list_head *free_list)
> -{
> -=09struct mt76_dev *mdev =3D &dev->mt76;
> -=09__le32 *txwi;
> -=09u16 wcid_idx;
> -
> -=09mt7921_txp_skb_unmap(mdev, t);
> -=09if (!t->skb)
> -=09=09goto out;
> -
> -=09txwi =3D (__le32 *)mt76_get_txwi_ptr(mdev, t);
> -=09if (sta) {
> -=09=09struct mt76_wcid *wcid =3D (struct mt76_wcid *)sta->drv_priv;
> -
> -=09=09if (likely(t->skb->protocol !=3D cpu_to_be16(ETH_P_PAE)))
> -=09=09=09mt7921_tx_check_aggr(sta, txwi);
> -
> -=09=09wcid_idx =3D wcid->idx;
> -=09} else {
> -=09=09wcid_idx =3D FIELD_GET(MT_TXD1_WLAN_IDX, le32_to_cpu(txwi[1]));
> -=09}
> -
> -=09__mt76_tx_complete_skb(mdev, wcid_idx, t->skb, free_list);
> -
> -out:
> -=09t->skb =3D NULL;
> -=09mt76_put_txwi(mdev, t);
> -}
> -
> -static void
> -mt7921_mac_tx_free(struct mt7921_dev *dev, struct sk_buff *skb)
> -{
> -=09struct mt7921_tx_free *free =3D (struct mt7921_tx_free *)skb->data;
> -=09struct mt76_dev *mdev =3D &dev->mt76;
> -=09struct mt76_txwi_cache *txwi;
> -=09struct ieee80211_sta *sta =3D NULL;
> -=09LIST_HEAD(free_list);
> -=09struct sk_buff *tmp;
> -=09bool wake =3D false;
> -=09u8 i, count;
> -
> -=09/* clean DMA queues and unmap buffers first */
> -=09mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[MT_TXQ_PSD], false);
> -=09mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[MT_TXQ_BE], false);
> -
> -=09/* TODO: MT_TX_FREE_LATENCY is msdu time from the TXD is queued into =
PLE,
> -=09 * to the time ack is received or dropped by hw (air + hw queue time)=
.
> -=09 * Should avoid accessing WTBL to get Tx airtime, and use it instead.
> -=09 */
> -=09count =3D FIELD_GET(MT_TX_FREE_MSDU_CNT, le16_to_cpu(free->ctrl));
> -=09for (i =3D 0; i < count; i++) {
> -=09=09u32 msdu, info =3D le32_to_cpu(free->info[i]);
> -=09=09u8 stat;
> -
> -=09=09/* 1'b1: new wcid pair.
> -=09=09 * 1'b0: msdu_id with the same 'wcid pair' as above.
> -=09=09 */
> -=09=09if (info & MT_TX_FREE_PAIR) {
> -=09=09=09struct mt7921_sta *msta;
> -=09=09=09struct mt7921_phy *phy;
> -=09=09=09struct mt76_wcid *wcid;
> -=09=09=09u16 idx;
> -
> -=09=09=09count++;
> -=09=09=09idx =3D FIELD_GET(MT_TX_FREE_WLAN_ID, info);
> -=09=09=09wcid =3D rcu_dereference(dev->mt76.wcid[idx]);
> -=09=09=09sta =3D wcid_to_sta(wcid);
> -=09=09=09if (!sta)
> -=09=09=09=09continue;
> -
> -=09=09=09msta =3D container_of(wcid, struct mt7921_sta, wcid);
> -=09=09=09phy =3D msta->vif->phy;
> -=09=09=09spin_lock_bh(&dev->sta_poll_lock);
> -=09=09=09if (list_empty(&msta->poll_list))
> -=09=09=09=09list_add_tail(&msta->poll_list, &dev->sta_poll_list);
> -=09=09=09spin_unlock_bh(&dev->sta_poll_lock);
> -=09=09=09continue;
> -=09=09}
> -
> -=09=09msdu =3D FIELD_GET(MT_TX_FREE_MSDU_ID, info);
> -=09=09stat =3D FIELD_GET(MT_TX_FREE_STATUS, info);
> -
> -=09=09txwi =3D mt76_token_release(mdev, msdu, &wake);
> -=09=09if (!txwi)
> -=09=09=09continue;
> -
> -=09=09mt7921_txwi_free(dev, txwi, sta, stat, &free_list);
> -=09}
> -
> -=09if (wake)
> -=09=09mt76_set_tx_blocked(&dev->mt76, false);
> -
> -=09napi_consume_skb(skb, 1);
> -
> -=09list_for_each_entry_safe(skb, tmp, &free_list, list) {
> -=09=09skb_list_del_init(skb);
> -=09=09napi_consume_skb(skb, 1);
> -=09}
> -
> -=09mt7921_mac_sta_poll(dev);
> -=09mt76_worker_schedule(&dev->mt76.tx_worker);
> -}
> -
>  static bool
>  mt7921_mac_add_txs_skb(struct mt7921_dev *dev, struct mt76_wcid *wcid, i=
nt pid,
>  =09=09       __le32 *txs_data)
> @@ -1330,9 +1114,6 @@ void mt7921_queue_rx_skb(struct mt76_dev *mdev, enu=
m mt76_rxq_id q,
>  =09=09type =3D PKT_TYPE_NORMAL_MCU;
> =20
>  =09switch (type) {
> -=09case PKT_TYPE_TXRX_NOTIFY:
> -=09=09mt7921_mac_tx_free(dev, skb);
> -=09=09break;
>  =09case PKT_TYPE_RX_EVENT:
>  =09=09mt7921_mcu_rx_event(dev, skb);
>  =09=09break;
> @@ -1354,33 +1135,6 @@ void mt7921_queue_rx_skb(struct mt76_dev *mdev, en=
um mt76_rxq_id q,
>  =09}
>  }
> =20
> -void mt7921_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_ent=
ry *e)
> -{
> -=09struct mt7921_dev *dev;
> -
> -=09if (!e->txwi) {
> -=09=09dev_kfree_skb_any(e->skb);
> -=09=09return;
> -=09}
> -
> -=09dev =3D container_of(mdev, struct mt7921_dev, mt76);
> -
> -=09/* error path */
> -=09if (e->skb =3D=3D DMA_DUMMY_DATA) {
> -=09=09struct mt76_txwi_cache *t;
> -=09=09struct mt7921_txp_common *txp;
> -=09=09u16 token;
> -
> -=09=09txp =3D mt7921_txwi_to_txp(mdev, e->txwi);
> -=09=09token =3D le16_to_cpu(txp->hw.msdu_id[0]) & ~MT_MSDU_ID_VALID;
> -=09=09t =3D mt76_token_put(mdev, token);
> -=09=09e->skb =3D t ? t->skb : NULL;
> -=09}
> -
> -=09if (e->skb)
> -=09=09mt76_tx_complete_skb(mdev, e->wcid, e->skb);
> -}
> -
>  void mt7921_mac_reset_counters(struct mt7921_phy *phy)
>  {
>  =09struct mt7921_dev *dev =3D phy->dev;
> @@ -1496,20 +1250,6 @@ void mt7921_update_channel(struct mt76_phy *mphy)
>  =09mt76_connac_power_save_sched(mphy, &dev->pm);
>  }
> =20
> -void mt7921_tx_token_put(struct mt7921_dev *dev)
> -{
> -=09struct mt76_txwi_cache *txwi;
> -=09int id;
> -
> -=09spin_lock_bh(&dev->mt76.token_lock);
> -=09idr_for_each_entry(&dev->mt76.token, txwi, id) {
> -=09=09mt7921_txwi_free(dev, txwi, NULL, false, NULL);
> -=09=09dev->mt76.token_count--;
> -=09}
> -=09spin_unlock_bh(&dev->mt76.token_lock);
> -=09idr_destroy(&dev->mt76.token);
> -}
> -
>  static void
>  mt7921_vif_connect_iter(void *priv, u8 *mac,
>  =09=09=09struct ieee80211_vif *vif)
> @@ -1524,69 +1264,6 @@ mt7921_vif_connect_iter(void *priv, u8 *mac,
>  =09mt7921_mcu_set_tx(dev, vif);
>  }
> =20
> -static int
> -mt7921_mac_reset(struct mt7921_dev *dev)
> -{
> -=09int i, err;
> -
> -=09mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
> -
> -=09mt76_wr(dev, MT_WFDMA0_HOST_INT_ENA, 0);
> -=09mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0x0);
> -
> -=09set_bit(MT76_RESET, &dev->mphy.state);
> -=09set_bit(MT76_MCU_RESET, &dev->mphy.state);
> -=09wake_up(&dev->mt76.mcu.wait);
> -=09skb_queue_purge(&dev->mt76.mcu.res_q);
> -
> -=09mt76_txq_schedule_all(&dev->mphy);
> -
> -=09mt76_worker_disable(&dev->mt76.tx_worker);
> -=09napi_disable(&dev->mt76.napi[MT_RXQ_MAIN]);
> -=09napi_disable(&dev->mt76.napi[MT_RXQ_MCU]);
> -=09napi_disable(&dev->mt76.napi[MT_RXQ_MCU_WA]);
> -=09napi_disable(&dev->mt76.tx_napi);
> -
> -=09mt7921_tx_token_put(dev);
> -=09idr_init(&dev->mt76.token);
> -
> -=09mt7921_wpdma_reset(dev, true);
> -
> -=09mt76_for_each_q_rx(&dev->mt76, i) {
> -=09=09napi_enable(&dev->mt76.napi[i]);
> -=09=09napi_schedule(&dev->mt76.napi[i]);
> -=09}
> -
> -=09clear_bit(MT76_MCU_RESET, &dev->mphy.state);
> -
> -=09mt76_wr(dev, MT_WFDMA0_HOST_INT_ENA,
> -=09=09MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
> -=09=09MT_INT_MCU_CMD);
> -=09mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
> -
> -=09err =3D mt7921_run_firmware(dev);
> -=09if (err)
> -=09=09goto out;
> -
> -=09err =3D mt7921_mcu_set_eeprom(dev);
> -=09if (err)
> -=09=09goto out;
> -
> -=09err =3D mt7921_mac_init(dev);
> -=09if (err)
> -=09=09goto out;
> -
> -=09err =3D __mt7921_start(&dev->phy);
> -out:
> -=09clear_bit(MT76_RESET, &dev->mphy.state);
> -
> -=09napi_enable(&dev->mt76.tx_napi);
> -=09napi_schedule(&dev->mt76.tx_napi);
> -=09mt76_worker_enable(&dev->mt76.tx_worker);
> -
> -=09return err;
> -}
> -
>  /* system error recovery */
>  void mt7921_mac_reset_work(struct work_struct *work)
>  {
> @@ -1608,7 +1285,7 @@ void mt7921_mac_reset_work(struct work_struct *work=
)
>  =09for (i =3D 0; i < 10; i++) {
>  =09=09__mt7921_mcu_drv_pmctrl(dev);
> =20
> -=09=09if (!mt7921_mac_reset(dev))
> +=09=09if (!mt7921_dev_reset(dev))
>  =09=09=09break;
>  =09}
>  =09mutex_unlock(&dev->mt76.mutex);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index e14b86b1c6d1..70c0f41180a1 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -133,6 +133,11 @@ struct mt7921_phy {
>  =09struct delayed_work scan_work;
>  };
> =20
> +#define mt7921_dev_reset(dev)=09((dev)->hif_ops->reset(dev))
> +struct mt7921_hif_ops {
> +=09int (*reset)(struct mt7921_dev *dev);
> +};
> +
>  struct mt7921_dev {
>  =09union { /* must be first */
>  =09=09struct mt76_dev mt76;
> @@ -156,6 +161,7 @@ struct mt7921_dev {
> =20
>  =09struct mt76_connac_pm pm;
>  =09struct mt76_connac_coredump coredump;
> +=09const struct mt7921_hif_ops *hif_ops;
>  };
> =20
>  enum {
> @@ -325,13 +331,13 @@ void mt7921_mac_reset_work(struct work_struct *work=
);
>  void mt7921_mac_update_mib_stats(struct mt7921_phy *phy);
>  void mt7921_reset(struct mt76_dev *mdev);
>  void mt7921_tx_cleanup(struct mt7921_dev *dev);
> -int mt7921_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
> -=09=09=09  enum mt76_txq_id qid, struct mt76_wcid *wcid,
> -=09=09=09  struct ieee80211_sta *sta,
> -=09=09=09  struct mt76_tx_info *tx_info);
> +int mt7921e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
> +=09=09=09   enum mt76_txq_id qid, struct mt76_wcid *wcid,
> +=09=09=09   struct ieee80211_sta *sta,
> +=09=09=09   struct mt76_tx_info *tx_info);
> =20
>  void mt7921_tx_worker(struct mt76_worker *w);
> -void mt7921_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_ent=
ry *e);
> +void mt7921e_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_en=
try *e);
>  int mt7921_init_tx_queues(struct mt7921_phy *phy, int idx, int n_desc);
>  void mt7921_tx_token_put(struct mt7921_dev *dev);
>  void mt7921_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
> @@ -366,4 +372,13 @@ int mt7921_testmode_cmd(struct ieee80211_hw *hw, str=
uct ieee80211_vif *vif,
>  =09=09=09void *data, int len);
>  int mt7921_testmode_dump(struct ieee80211_hw *hw, struct sk_buff *msg,
>  =09=09=09 struct netlink_callback *cb, void *data, int len);
> +void mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32 *txwi,
> +=09=09=09   struct sk_buff *skb, struct mt76_wcid *wcid,
> +=09=09=09   struct ieee80211_key_conf *key, int pid,
> +=09=09=09   bool beacon);
> +void mt7921_tx_check_aggr(struct ieee80211_sta *sta, __le32 *txwi);
> +void mt7921_mac_sta_poll(struct mt7921_dev *dev);
> +void mt7921e_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
> +=09=09=09  struct sk_buff *skb);
> +int mt7921e_mac_reset(struct mt7921_dev *dev);
>  #endif
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index cd710360d180..b01b9b7c42b4 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -104,9 +104,9 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>  =09=09=09=09SURVEY_INFO_TIME_RX |
>  =09=09=09=09SURVEY_INFO_TIME_BSS_RX,
>  =09=09.token_size =3D MT7921_TOKEN_SIZE,
> -=09=09.tx_prepare_skb =3D mt7921_tx_prepare_skb,
> -=09=09.tx_complete_skb =3D mt7921_tx_complete_skb,
> -=09=09.rx_skb =3D mt7921_queue_rx_skb,
> +=09=09.tx_prepare_skb =3D mt7921e_tx_prepare_skb,
> +=09=09.tx_complete_skb =3D mt7921e_tx_complete_skb,
> +=09=09.rx_skb =3D mt7921e_queue_rx_skb,
>  =09=09.rx_poll_complete =3D mt7921_rx_poll_complete,
>  =09=09.sta_ps =3D mt7921_sta_ps,
>  =09=09.sta_add =3D mt7921_mac_sta_add,
> @@ -114,6 +114,11 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>  =09=09.sta_remove =3D mt7921_mac_sta_remove,
>  =09=09.update_survey =3D mt7921_update_channel,
>  =09};
> +
> +=09static const struct mt7921_hif_ops mt7921_pcie_ops =3D {
> +=09=09.reset =3D mt7921e_mac_reset,
> +=09};
> +
>  =09struct mt7921_dev *dev;
>  =09struct mt76_dev *mdev;
>  =09int ret;
> @@ -147,6 +152,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>  =09}
> =20
>  =09dev =3D container_of(mdev, struct mt7921_dev, mt76);
> +=09dev->hif_ops =3D &mt7921_pcie_ops;
> =20
>  =09mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
>  =09tasklet_init(&dev->irq_tasklet, mt7921_irq_tasklet, (unsigned long)de=
v);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/driver=
s/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> new file mode 100644
> index 000000000000..f211dafa311c
> --- /dev/null
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> @@ -0,0 +1,345 @@
> +// SPDX-License-Identifier: ISC
> +/* Copyright (C) 2021 MediaTek Inc. */
> +
> +#include "mt7921.h"
> +#include "../dma.h"
> +#include "mac.h"
> +
> +static void
> +mt7921_write_hw_txp(struct mt7921_dev *dev, struct mt76_tx_info *tx_info=
,
> +=09=09    void *txp_ptr, u32 id)
> +{
> +=09struct mt7921_hw_txp *txp =3D txp_ptr;
> +=09struct mt7921_txp_ptr *ptr =3D &txp->ptr[0];
> +=09int i, nbuf =3D tx_info->nbuf - 1;
> +
> +=09tx_info->buf[0].len =3D MT_TXD_SIZE + sizeof(*txp);
> +=09tx_info->nbuf =3D 1;
> +
> +=09txp->msdu_id[0] =3D cpu_to_le16(id | MT_MSDU_ID_VALID);
> +
> +=09for (i =3D 0; i < nbuf; i++) {
> +=09=09u16 len =3D tx_info->buf[i + 1].len & MT_TXD_LEN_MASK;
> +=09=09u32 addr =3D tx_info->buf[i + 1].addr;
> +
> +=09=09if (i =3D=3D nbuf - 1)
> +=09=09=09len |=3D MT_TXD_LEN_LAST;
> +
> +=09=09if (i & 1) {
> +=09=09=09ptr->buf1 =3D cpu_to_le32(addr);
> +=09=09=09ptr->len1 =3D cpu_to_le16(len);
> +=09=09=09ptr++;
> +=09=09} else {
> +=09=09=09ptr->buf0 =3D cpu_to_le32(addr);
> +=09=09=09ptr->len0 =3D cpu_to_le16(len);
> +=09=09}
> +=09}
> +}
> +
> +int mt7921e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
> +=09=09=09   enum mt76_txq_id qid, struct mt76_wcid *wcid,
> +=09=09=09   struct ieee80211_sta *sta,
> +=09=09=09   struct mt76_tx_info *tx_info)
> +{
> +=09struct mt7921_dev *dev =3D container_of(mdev, struct mt7921_dev, mt76=
);
> +=09struct ieee80211_tx_info *info =3D IEEE80211_SKB_CB(tx_info->skb);
> +=09struct ieee80211_key_conf *key =3D info->control.hw_key;
> +=09struct mt76_txwi_cache *t;
> +=09struct mt7921_txp_common *txp;
> +=09int id, pid;
> +=09u8 *txwi =3D (u8 *)txwi_ptr;
> +
> +=09if (unlikely(tx_info->skb->len <=3D ETH_HLEN))
> +=09=09return -EINVAL;
> +
> +=09if (!wcid)
> +=09=09wcid =3D &dev->mt76.global_wcid;
> +
> +=09t =3D (struct mt76_txwi_cache *)(txwi + mdev->drv->txwi_size);
> +=09t->skb =3D tx_info->skb;
> +
> +=09id =3D mt76_token_consume(mdev, &t);
> +=09if (id < 0)
> +=09=09return id;
> +
> +=09if (sta) {
> +=09=09struct mt7921_sta *msta =3D (struct mt7921_sta *)sta->drv_priv;
> +
> +=09=09if (time_after(jiffies, msta->last_txs + HZ / 4)) {
> +=09=09=09info->flags |=3D IEEE80211_TX_CTL_REQ_TX_STATUS;
> +=09=09=09msta->last_txs =3D jiffies;
> +=09=09}
> +=09}
> +
> +=09pid =3D mt76_tx_status_skb_add(mdev, wcid, tx_info->skb);
> +=09mt7921_mac_write_txwi(dev, txwi_ptr, tx_info->skb, wcid, key,
> +=09=09=09      pid, false);
> +
> +=09txp =3D (struct mt7921_txp_common *)(txwi + MT_TXD_SIZE);
> +=09memset(txp, 0, sizeof(struct mt7921_txp_common));
> +=09mt7921_write_hw_txp(dev, tx_info, txp, id);
> +
> +=09tx_info->skb =3D DMA_DUMMY_DATA;
> +
> +=09return 0;
> +}
> +
> +static void
> +mt7921_txp_skb_unmap(struct mt76_dev *dev, struct mt76_txwi_cache *t)
> +{
> +=09struct mt7921_txp_common *txp;
> +=09int i;
> +
> +=09txp =3D mt7921_txwi_to_txp(dev, t);
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(txp->hw.ptr); i++) {
> +=09=09struct mt7921_txp_ptr *ptr =3D &txp->hw.ptr[i];
> +=09=09bool last;
> +=09=09u16 len;
> +
> +=09=09len =3D le16_to_cpu(ptr->len0);
> +=09=09last =3D len & MT_TXD_LEN_LAST;
> +=09=09len &=3D MT_TXD_LEN_MASK;
> +=09=09dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf0), len,
> +=09=09=09=09 DMA_TO_DEVICE);
> +=09=09if (last)
> +=09=09=09break;
> +
> +=09=09len =3D le16_to_cpu(ptr->len1);
> +=09=09last =3D len & MT_TXD_LEN_LAST;
> +=09=09len &=3D MT_TXD_LEN_MASK;
> +=09=09dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf1), len,
> +=09=09=09=09 DMA_TO_DEVICE);
> +=09=09if (last)
> +=09=09=09break;
> +=09}
> +}
> +
> +static void
> +mt7921_txwi_free(struct mt7921_dev *dev, struct mt76_txwi_cache *t,
> +=09=09 struct ieee80211_sta *sta, bool clear_status,
> +=09=09 struct list_head *free_list)
> +{
> +=09struct mt76_dev *mdev =3D &dev->mt76;
> +=09__le32 *txwi;
> +=09u16 wcid_idx;
> +
> +=09mt7921_txp_skb_unmap(mdev, t);
> +=09if (!t->skb)
> +=09=09goto out;
> +
> +=09txwi =3D (__le32 *)mt76_get_txwi_ptr(mdev, t);
> +=09if (sta) {
> +=09=09struct mt76_wcid *wcid =3D (struct mt76_wcid *)sta->drv_priv;
> +
> +=09=09if (likely(t->skb->protocol !=3D cpu_to_be16(ETH_P_PAE)))
> +=09=09=09mt7921_tx_check_aggr(sta, txwi);
> +
> +=09=09wcid_idx =3D wcid->idx;
> +=09} else {
> +=09=09wcid_idx =3D FIELD_GET(MT_TXD1_WLAN_IDX, le32_to_cpu(txwi[1]));
> +=09}
> +
> +=09__mt76_tx_complete_skb(mdev, wcid_idx, t->skb, free_list);
> +
> +out:
> +=09t->skb =3D NULL;
> +=09mt76_put_txwi(mdev, t);
> +}
> +
> +static void
> +mt7921_mac_tx_free(struct mt7921_dev *dev, struct sk_buff *skb)
> +{
> +=09struct mt7921_tx_free *free =3D (struct mt7921_tx_free *)skb->data;
> +=09struct mt76_dev *mdev =3D &dev->mt76;
> +=09struct mt76_txwi_cache *txwi;
> +=09struct ieee80211_sta *sta =3D NULL;
> +=09LIST_HEAD(free_list);
> +=09struct sk_buff *tmp;
> +=09bool wake =3D false;
> +=09u8 i, count;
> +
> +=09/* clean DMA queues and unmap buffers first */
> +=09mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[MT_TXQ_PSD], false);
> +=09mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[MT_TXQ_BE], false);
> +
> +=09/* TODO: MT_TX_FREE_LATENCY is msdu time from the TXD is queued into =
PLE,
> +=09 * to the time ack is received or dropped by hw (air + hw queue time)=
.
> +=09 * Should avoid accessing WTBL to get Tx airtime, and use it instead.
> +=09 */
> +=09count =3D FIELD_GET(MT_TX_FREE_MSDU_CNT, le16_to_cpu(free->ctrl));
> +=09for (i =3D 0; i < count; i++) {
> +=09=09u32 msdu, info =3D le32_to_cpu(free->info[i]);
> +=09=09u8 stat;
> +
> +=09=09/* 1'b1: new wcid pair.
> +=09=09 * 1'b0: msdu_id with the same 'wcid pair' as above.
> +=09=09 */
> +=09=09if (info & MT_TX_FREE_PAIR) {
> +=09=09=09struct mt7921_sta *msta;
> +=09=09=09struct mt7921_phy *phy;
> +=09=09=09struct mt76_wcid *wcid;
> +=09=09=09u16 idx;
> +
> +=09=09=09count++;
> +=09=09=09idx =3D FIELD_GET(MT_TX_FREE_WLAN_ID, info);
> +=09=09=09wcid =3D rcu_dereference(dev->mt76.wcid[idx]);
> +=09=09=09sta =3D wcid_to_sta(wcid);
> +=09=09=09if (!sta)
> +=09=09=09=09continue;
> +
> +=09=09=09msta =3D container_of(wcid, struct mt7921_sta, wcid);
> +=09=09=09phy =3D msta->vif->phy;
> +=09=09=09spin_lock_bh(&dev->sta_poll_lock);
> +=09=09=09if (list_empty(&msta->poll_list))
> +=09=09=09=09list_add_tail(&msta->poll_list, &dev->sta_poll_list);
> +=09=09=09spin_unlock_bh(&dev->sta_poll_lock);
> +=09=09=09continue;
> +=09=09}
> +
> +=09=09msdu =3D FIELD_GET(MT_TX_FREE_MSDU_ID, info);
> +=09=09stat =3D FIELD_GET(MT_TX_FREE_STATUS, info);
> +
> +=09=09txwi =3D mt76_token_release(mdev, msdu, &wake);
> +=09=09if (!txwi)
> +=09=09=09continue;
> +
> +=09=09mt7921_txwi_free(dev, txwi, sta, stat, &free_list);
> +=09}
> +
> +=09if (wake)
> +=09=09mt76_set_tx_blocked(&dev->mt76, false);
> +
> +=09napi_consume_skb(skb, 1);
> +
> +=09list_for_each_entry_safe(skb, tmp, &free_list, list) {
> +=09=09skb_list_del_init(skb);
> +=09=09napi_consume_skb(skb, 1);
> +=09}
> +
> +=09mt7921_mac_sta_poll(dev);
> +=09mt76_worker_schedule(&dev->mt76.tx_worker);
> +}
> +
> +void mt7921e_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
> +=09=09=09  struct sk_buff *skb)
> +{
> +=09struct mt7921_dev *dev =3D container_of(mdev, struct mt7921_dev, mt76=
);
> +=09__le32 *rxd =3D (__le32 *)skb->data;
> +=09enum rx_pkt_type type;
> +
> +=09type =3D FIELD_GET(MT_RXD0_PKT_TYPE, le32_to_cpu(rxd[0]));
> +
> +=09switch (type) {
> +=09case PKT_TYPE_TXRX_NOTIFY:
> +=09=09mt7921_mac_tx_free(dev, skb);
> +=09=09break;
> +=09default:
> +=09=09mt7921_queue_rx_skb(mdev, q, skb);
> +=09=09break;
> +=09}
> +}
> +
> +void mt7921e_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_en=
try *e)
> +{
> +=09struct mt7921_dev *dev;
> +
> +=09if (!e->txwi) {
> +=09=09dev_kfree_skb_any(e->skb);
> +=09=09return;
> +=09}
> +
> +=09dev =3D container_of(mdev, struct mt7921_dev, mt76);
> +
> +=09/* error path */
> +=09if (e->skb =3D=3D DMA_DUMMY_DATA) {
> +=09=09struct mt76_txwi_cache *t;
> +=09=09struct mt7921_txp_common *txp;
> +=09=09u16 token;
> +
> +=09=09txp =3D mt7921_txwi_to_txp(mdev, e->txwi);
> +=09=09token =3D le16_to_cpu(txp->hw.msdu_id[0]) & ~MT_MSDU_ID_VALID;
> +=09=09t =3D mt76_token_put(mdev, token);
> +=09=09e->skb =3D t ? t->skb : NULL;
> +=09}
> +
> +=09if (e->skb)
> +=09=09mt76_tx_complete_skb(mdev, e->wcid, e->skb);
> +}
> +
> +void mt7921_tx_token_put(struct mt7921_dev *dev)
> +{
> +=09struct mt76_txwi_cache *txwi;
> +=09int id;
> +
> +=09spin_lock_bh(&dev->mt76.token_lock);
> +=09idr_for_each_entry(&dev->mt76.token, txwi, id) {
> +=09=09mt7921_txwi_free(dev, txwi, NULL, false, NULL);
> +=09=09dev->mt76.token_count--;
> +=09}
> +=09spin_unlock_bh(&dev->mt76.token_lock);
> +=09idr_destroy(&dev->mt76.token);
> +}
> +
> +int

can you please remove new line here?

> +mt7921e_mac_reset(struct mt7921_dev *dev)
> +{
> +=09int i, err;
> +
> +=09mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
> +
> +=09mt76_wr(dev, MT_WFDMA0_HOST_INT_ENA, 0);
> +=09mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0x0);
> +
> +=09set_bit(MT76_RESET, &dev->mphy.state);
> +=09set_bit(MT76_MCU_RESET, &dev->mphy.state);
> +=09wake_up(&dev->mt76.mcu.wait);
> +=09skb_queue_purge(&dev->mt76.mcu.res_q);
> +
> +=09mt76_txq_schedule_all(&dev->mphy);
> +
> +=09mt76_worker_disable(&dev->mt76.tx_worker);
> +=09napi_disable(&dev->mt76.napi[MT_RXQ_MAIN]);
> +=09napi_disable(&dev->mt76.napi[MT_RXQ_MCU]);
> +=09napi_disable(&dev->mt76.napi[MT_RXQ_MCU_WA]);
> +=09napi_disable(&dev->mt76.tx_napi);
> +
> +=09mt7921_tx_token_put(dev);
> +=09idr_init(&dev->mt76.token);
> +
> +=09mt7921_wpdma_reset(dev, true);
> +
> +=09mt76_for_each_q_rx(&dev->mt76, i) {
> +=09=09napi_enable(&dev->mt76.napi[i]);
> +=09=09napi_schedule(&dev->mt76.napi[i]);
> +=09}
> +
> +=09clear_bit(MT76_MCU_RESET, &dev->mphy.state);
> +
> +=09mt76_wr(dev, MT_WFDMA0_HOST_INT_ENA,
> +=09=09MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
> +=09=09MT_INT_MCU_CMD);
> +=09mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
> +
> +=09err =3D mt7921_run_firmware(dev);
> +=09if (err)
> +=09=09goto out;
> +
> +=09err =3D mt7921_mcu_set_eeprom(dev);
> +=09if (err)
> +=09=09goto out;
> +
> +=09err =3D mt7921_mac_init(dev);
> +=09if (err)
> +=09=09goto out;
> +
> +=09err =3D __mt7921_start(&dev->phy);
> +out:
> +=09clear_bit(MT76_RESET, &dev->mphy.state);
> +
> +=09napi_enable(&dev->mt76.tx_napi);
> +=09napi_schedule(&dev->mt76.tx_napi);
> +=09mt76_worker_enable(&dev->mt76.tx_worker);
> +
> +=09return err;
> +}
> --=20
> 2.25.1
>=20

--avc4J7JIHHPHavfO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYUHuvQAKCRA6cBh0uS2t
rC/EAQCT0Ip4X1q6km8iYQj0F4WAIeXCHyYywPeE3LEvW/7DQwD7BLuCBfr14v8S
uKIhXPrAVUrO4qfE7akjdbKSXjrHnwc=
=CX7q
-----END PGP SIGNATURE-----

--avc4J7JIHHPHavfO--



--===============6863183074066015998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6863183074066015998==--


