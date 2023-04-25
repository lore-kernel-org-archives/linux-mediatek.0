Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8F4C77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8mmHHQqaaM/zSL+TPgZDbi2cGRVPqk3ofrV63LYygU=; b=TIpjeCyQcms6zjOJNcPFerfSKi
	WozvhpfIHL+cD4e/uuw9pyOsYOzYNAX1EZi2U81oHraZpAtflLRjwHQLJtPtfw0LbgFee/2ZJCIm6
	GXPg2PidFILeoGq4ZkXPB2ev+wJDO6cz8JcDO9sQU/l6QFoYLrsH+ue3sy5UXcNemHo/PlzIjo53W
	DTNNu07VyQUrhCDZ2owHeMUpHbRx8m3n8b4Ht9+3qMbCFUmVRXCnPupMrn6WUKVsjeaezrh3dxHqr
	aSwlZ0PLJRem02pYR2B/e9uQLjY9yt8oaqGp/8i8RdvpqN6os0F6MsIGszbrcGaQCbnDDHmhFIlwy
	GtFHRYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prEPC-000adT-13;
	Tue, 25 Apr 2023 08:52:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prEP8-000acj-2X
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 08:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682412721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v8mmHHQqaaM/zSL+TPgZDbi2cGRVPqk3ofrV63LYygU=;
	b=J+iiliPvgHOcGqu3899hUolL698zLSW5HSjnuGWK7WgJD2gs+UpIVGJk2u6nfmAyC2IVL5
	JEQWDze8OXD/iyS9Plr/KLJYivr0QF1vIFSgCgT8NPmhBKOgu5e0j3ITiiV0Fxwbfq8GE7
	QcSvNf4wNuhMfs8drvCFHcUekwH0vzs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-TRxnoWvGNK6l-TjVEOEzzg-1; Tue, 25 Apr 2023 04:49:31 -0400
X-MC-Unique: TRxnoWvGNK6l-TjVEOEzzg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5069f2ae8eeso14141466a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 01:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682412570; x=1685004570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8mmHHQqaaM/zSL+TPgZDbi2cGRVPqk3ofrV63LYygU=;
        b=PGiwrxKMywhQe1OHxXeCb6vr41YYqEWtO7US441QqzjBKCdANmsGEE6qpn3t7JjVvz
         /v92WKZe9qnB8sYmjH2ai91WlJM0ZNj6jXQfYWCHxOnpAYq0oJsEvCNdB7Zwb2/wFIoQ
         41futuTxYWvCd96j5yvPfFmYzPpFG3OZYsqwVro4TJbGiNqsUbh9wD1dFnmwaS8GLtU7
         rKZ27JBefrdz8obyOM/J7ORqyAuE6bR6TuXvsSwyx6eSMPZPgcrOgNuR8/rzXxaSTr5i
         9GQb0dDba64Q2Jqjd01CTBtDhFqLNAJgotqJR7uoafIlfsEGlUEx5kvaJ+J8yz0TtZDm
         dPUA==
X-Gm-Message-State: AAQBX9cnw7CRboaWrTZFw2B/NabuiL5tdQR/wvMrv0tw8o3ZVP+ZXdXm
	f9Hkd1oXg0df19PQqeKzTLr2A0opaVPSjr0hgvS/rAEKCTPpnm+ZRVNDL30f2elTIOLFAn0EWw/
	zfqO71/O0E8vRgw+8Ti0dXvl8q38UYGGX
X-Received: by 2002:a05:6402:1810:b0:504:a32d:7b28 with SMTP id g16-20020a056402181000b00504a32d7b28mr15617482edy.17.1682412570501;
        Tue, 25 Apr 2023 01:49:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZaPal43FFI7S/LfrGOGimURwXwKFw8Kr3ku8bz+U/4F4v/vriDh4irw0HpgL5PWIjdL8kVHA==
X-Received: by 2002:a05:6402:1810:b0:504:a32d:7b28 with SMTP id g16-20020a056402181000b00504a32d7b28mr15617462edy.17.1682412570060;
        Tue, 25 Apr 2023 01:49:30 -0700 (PDT)
Received: from localhost (net-130-25-106-149.cust.vodafonedsl.it. [130.25.106.149])
        by smtp.gmail.com with ESMTPSA id d15-20020a170906040f00b0092b8c1f41ebsm6350042eja.24.2023.04.25.01.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:49:29 -0700 (PDT)
Date: Tue, 25 Apr 2023 10:49:27 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org,
	Shayne Chen <shayne.chen@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: Re: [PATCH 1/2] wifi: mt76: mt7915: rework tx bytes/packets when WED
 is active
Message-ID: <ZEeUF8T8gmjGIk5e@lore-desk>
References: <d9466e4641a7db661058896f4ccd4bba4a9cdb3b.1682411744.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hyja8z9qWK79G75q"
Content-Disposition: inline
In-Reply-To: <d9466e4641a7db661058896f4ccd4bba4a9cdb3b.1682411744.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_015207_062178_E0C4797D 
X-CRM114-Status: GOOD (  29.56  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--hyja8z9qWK79G75q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Peter Chiu <chui-hao.chiu@mediatek.com>
>=20
> 1. Mixed tx_byte calculation - need to handle both (non)binding packets
>    when WED is enabled.
> 2. PPDU based TxS can only reports MPDU counts whereas mac80211 requires
>    MSDU unit(NL80211_STA_INFO_TX_PACKETS).
>=20
> To solve above issues - switch to use TxS reporting for all tx_byte when
> WED is active and get MSDU Tx counts from WA statistic.

It seems to me we are doining multiple logic tasks in this patch. Can you
please split them on multiple patches?

>=20
> Note that mt7915 WA firmware only counts tx_packet for WED path, so
> driver needs to take care of host path.
>=20
> Fixes: 43eaa3689507 ("wifi: mt76: add PPDU based TxS support for WED devi=
ce")
> Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h     |  2 +-
>  .../wireless/mediatek/mt76/mt76_connac_mac.c  |  8 +-
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
>  .../net/wireless/mediatek/mt76/mt7915/init.c  |  6 ++
>  .../net/wireless/mediatek/mt76/mt7915/main.c  |  6 +-
>  .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 74 +++++++++++++++++--
>  .../net/wireless/mediatek/mt76/mt7915/mmio.c  | 30 +-------
>  .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
>  drivers/net/wireless/mediatek/mt76/tx.c       |  6 ++
>  9 files changed, 91 insertions(+), 43 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 6b07b8fafec2..0e9f4197213a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -277,7 +277,7 @@ struct mt76_sta_stats {
>  	u64 tx_mcs[16];		/* mcs idx */
>  	u64 tx_bytes;
>  	/* WED TX */
> -	u32 tx_packets;
> +	u32 tx_packets;		/* unit: MSDU */
>  	u32 tx_retries;
>  	u32 tx_failed;
>  	/* WED RX */
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mac.c
> index d39a3cc5e381..84985a989293 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> @@ -521,9 +521,9 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev=
, __le32 *txwi,
>  		q_idx =3D wmm_idx * MT76_CONNAC_MAX_WMM_SETS +
>  			mt76_connac_lmac_mapping(skb_get_queue_mapping(skb));
> =20
> -		/* counting non-offloading skbs */
> -		wcid->stats.tx_bytes +=3D skb->len;
> -		wcid->stats.tx_packets++;
> +		/* mt7915 WA only counts WED path */
> +		if (mtk_wed_device_active(&dev->mmio.wed) && is_mt7915(dev))
> +			wcid->stats.tx_packets++;

I think this will crash mt7921 usb/sdio drivers. It is enough to swap
the conditions since mt7915 supports mmio only mode.

>  	}
> =20
>  	val =3D FIELD_PREP(MT_TXD0_TX_BYTES, skb->len + sz_txd) |
> @@ -610,8 +610,6 @@ bool mt76_connac2_mac_fill_txs(struct mt76_dev *dev, =
struct mt76_wcid *wcid,
>  		stats->tx_bytes +=3D
>  			le32_get_bits(txs_data[5], MT_TXS5_MPDU_TX_BYTE) -
>  			le32_get_bits(txs_data[7], MT_TXS7_MPDU_RETRY_BYTE);
> -		stats->tx_packets +=3D
> -			le32_get_bits(txs_data[5], MT_TXS5_MPDU_TX_CNT);

I think this will break accounting for mt7921, right?

Regards,
Lorenzo

>  		stats->tx_failed +=3D
>  			le32_get_bits(txs_data[6], MT_TXS6_MPDU_FAIL_CNT);
>  		stats->tx_retries +=3D
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index ca1ce97a6d2f..7a52b68491b6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -998,6 +998,7 @@ enum {
>  	MCU_EXT_EVENT_ASSERT_DUMP =3D 0x23,
>  	MCU_EXT_EVENT_RDD_REPORT =3D 0x3a,
>  	MCU_EXT_EVENT_CSA_NOTIFY =3D 0x4f,
> +	MCU_EXT_EVENT_WA_TX_STAT =3D 0x74,
>  	MCU_EXT_EVENT_BCC_NOTIFY =3D 0x75,
>  	MCU_EXT_EVENT_MURU_CTRL =3D 0x9f,
>  };
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/init.c
> index ac2049f49bb3..927a98a315ae 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -499,6 +499,12 @@ mt7915_mac_init_band(struct mt7915_dev *dev, u8 band)
>  	set =3D FIELD_PREP(MT_WTBLOFF_TOP_RSCR_RCPI_MODE, 0) |
>  	      FIELD_PREP(MT_WTBLOFF_TOP_RSCR_RCPI_PARAM, 0x3);
>  	mt76_rmw(dev, MT_WTBLOFF_TOP_RSCR(band), mask, set);
> +
> +	/* MT_TXD5_TX_STATUS_HOST (MPDU format) has higher priority than
> +	 * MT_AGG_ACR_PPDU_TXS2H (PPDU format) even though ACR bit is set.
> +	 */
> +	if (mtk_wed_device_active(&dev->mt76.mmio.wed))
> +		mt76_set(dev, MT_AGG_ACR4(band), MT_AGG_ACR_PPDU_TXS2H);
>  }
> =20
>  static void
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/main.c
> index 61157248d742..b306a4fae1fc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> @@ -1043,8 +1043,10 @@ static void mt7915_sta_statistics(struct ieee80211=
_hw *hw,
>  		sinfo->tx_bytes =3D msta->wcid.stats.tx_bytes;
>  		sinfo->filled |=3D BIT_ULL(NL80211_STA_INFO_TX_BYTES64);
> =20
> -		sinfo->tx_packets =3D msta->wcid.stats.tx_packets;
> -		sinfo->filled |=3D BIT_ULL(NL80211_STA_INFO_TX_PACKETS);
> +		if (!mt7915_mcu_wed_wa_tx_stats(phy->dev, msta->wcid.idx)) {
> +			sinfo->tx_packets =3D msta->wcid.stats.tx_packets;
> +			sinfo->filled |=3D BIT_ULL(NL80211_STA_INFO_TX_PACKETS);
> +		}
> =20
>  		if (mtk_wed_get_rx_capa(&phy->dev->mt76.mmio.wed)) {
>  			sinfo->rx_bytes =3D msta->wcid.stats.rx_bytes;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.c
> index 9fcb22fa1f97..5916dcaa8c7e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -164,7 +164,9 @@ mt7915_mcu_parse_response(struct mt76_dev *mdev, int =
cmd,
>  	}
> =20
>  	rxd =3D (struct mt76_connac2_mcu_rxd *)skb->data;
> -	if (seq !=3D rxd->seq)
> +	if (seq !=3D rxd->seq &&
> +	    !(rxd->eid =3D=3D MCU_CMD_EXT_CID &&
> +	      rxd->ext_eid =3D=3D MCU_EXT_EVENT_WA_TX_STAT))
>  		return -EAGAIN;
> =20
>  	if (cmd =3D=3D MCU_CMD(PATCH_SEM_CONTROL)) {
> @@ -395,12 +397,14 @@ void mt7915_mcu_rx_event(struct mt7915_dev *dev, st=
ruct sk_buff *skb)
>  	struct mt76_connac2_mcu_rxd *rxd;
> =20
>  	rxd =3D (struct mt76_connac2_mcu_rxd *)skb->data;
> -	if (rxd->ext_eid =3D=3D MCU_EXT_EVENT_THERMAL_PROTECT ||
> -	    rxd->ext_eid =3D=3D MCU_EXT_EVENT_FW_LOG_2_HOST ||
> -	    rxd->ext_eid =3D=3D MCU_EXT_EVENT_ASSERT_DUMP ||
> -	    rxd->ext_eid =3D=3D MCU_EXT_EVENT_PS_SYNC ||
> -	    rxd->ext_eid =3D=3D MCU_EXT_EVENT_BCC_NOTIFY ||
> -	    !rxd->seq)
> +	if ((rxd->ext_eid =3D=3D MCU_EXT_EVENT_THERMAL_PROTECT ||
> +	     rxd->ext_eid =3D=3D MCU_EXT_EVENT_FW_LOG_2_HOST ||
> +	     rxd->ext_eid =3D=3D MCU_EXT_EVENT_ASSERT_DUMP ||
> +	     rxd->ext_eid =3D=3D MCU_EXT_EVENT_PS_SYNC ||
> +	     rxd->ext_eid =3D=3D MCU_EXT_EVENT_BCC_NOTIFY ||
> +	     !rxd->seq) &&
> +	     !(rxd->eid =3D=3D MCU_CMD_EXT_CID &&
> +	       rxd->ext_eid =3D=3D MCU_EXT_EVENT_WA_TX_STAT))
>  		mt7915_mcu_rx_unsolicited_event(dev, skb);
>  	else
>  		mt76_mcu_rx_event(&dev->mt76, skb);
> @@ -3733,6 +3737,62 @@ int mt7915_mcu_twt_agrt_update(struct mt7915_dev *=
dev,
>  				 &req, sizeof(req), true);
>  }
> =20
> +int mt7915_mcu_wed_wa_tx_stats(struct mt7915_dev *dev, u16 wlan_idx)
> +{
> +	struct {
> +		__le32 cmd;
> +		__le32 num;
> +		__le32 __rsv;
> +		__le16 wlan_idx;
> +	} req =3D {
> +		.cmd =3D cpu_to_le32(0x15),
> +		.num =3D cpu_to_le32(1),
> +		.wlan_idx =3D cpu_to_le16(wlan_idx),
> +	};
> +	struct mt7915_mcu_wa_tx_stat {
> +		__le16 wlan_idx;
> +		u8 __rsv[2];
> +
> +		/* tx_bytes is deprecated since WA byte counter uses u32,
> +		 * which easily leads to overflow.
> +		 */
> +		__le32 tx_bytes;
> +		__le32 tx_packets;
> +	} *res;
> +	struct mt76_wcid *wcid;
> +	struct sk_buff *skb;
> +	int ret;
> +
> +	ret =3D mt76_mcu_send_and_get_msg(&dev->mt76, MCU_WA_PARAM_CMD(QUERY),
> +					&req, sizeof(req), true, &skb);
> +	if (ret)
> +		return ret;
> +
> +	if (!is_mt7915(&dev->mt76))
> +		skb_pull(skb, 4);
> +
> +	res =3D (struct mt7915_mcu_wa_tx_stat *)skb->data;
> +
> +	if (le16_to_cpu(res->wlan_idx) !=3D wlan_idx) {
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	rcu_read_lock();
> +
> +	wcid =3D rcu_dereference(dev->mt76.wcid[wlan_idx]);
> +	if (wcid)
> +		wcid->stats.tx_packets +=3D le32_to_cpu(res->tx_packets);
> +	else
> +		ret =3D -EINVAL;
> +
> +	rcu_read_unlock();
> +out:
> +	dev_kfree_skb(skb);
> +
> +	return ret;
> +}
> +
>  int mt7915_mcu_rf_regval(struct mt7915_dev *dev, u32 regidx, u32 *val, b=
ool set)
>  {
>  	struct {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/mmio.c
> index 45f3558bf31c..2fa059af23de 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
> @@ -545,8 +545,6 @@ static u32 mt7915_rmw(struct mt76_dev *mdev, u32 offs=
et, u32 mask, u32 val)
>  static int mt7915_mmio_wed_offload_enable(struct mtk_wed_device *wed)
>  {
>  	struct mt7915_dev *dev;
> -	struct mt7915_phy *phy;
> -	int ret;
> =20
>  	dev =3D container_of(wed, struct mt7915_dev, mt76.mmio.wed);
> =20
> @@ -554,43 +552,19 @@ static int mt7915_mmio_wed_offload_enable(struct mt=
k_wed_device *wed)
>  	dev->mt76.token_size =3D wed->wlan.token_start;
>  	spin_unlock_bh(&dev->mt76.token_lock);
> =20
> -	ret =3D wait_event_timeout(dev->mt76.tx_wait,
> -				 !dev->mt76.wed_token_count, HZ);
> -	if (!ret)
> -		return -EAGAIN;
> -
> -	phy =3D &dev->phy;
> -	mt76_set(dev, MT_AGG_ACR4(phy->mt76->band_idx), MT_AGG_ACR_PPDU_TXS2H);
> -
> -	phy =3D dev->mt76.phys[MT_BAND1] ? dev->mt76.phys[MT_BAND1]->priv : NUL=
L;
> -	if (phy)
> -		mt76_set(dev, MT_AGG_ACR4(phy->mt76->band_idx),
> -			 MT_AGG_ACR_PPDU_TXS2H);
> -
> -	return 0;
> +	return !wait_event_timeout(dev->mt76.tx_wait,
> +				   !dev->mt76.wed_token_count, HZ);
>  }
> =20
>  static void mt7915_mmio_wed_offload_disable(struct mtk_wed_device *wed)
>  {
>  	struct mt7915_dev *dev;
> -	struct mt7915_phy *phy;
> =20
>  	dev =3D container_of(wed, struct mt7915_dev, mt76.mmio.wed);
> =20
>  	spin_lock_bh(&dev->mt76.token_lock);
>  	dev->mt76.token_size =3D MT7915_TOKEN_SIZE;
>  	spin_unlock_bh(&dev->mt76.token_lock);
> -
> -	/* MT_TXD5_TX_STATUS_HOST (MPDU format) has higher priority than
> -	 * MT_AGG_ACR_PPDU_TXS2H (PPDU format) even though ACR bit is set.
> -	 */
> -	phy =3D &dev->phy;
> -	mt76_clear(dev, MT_AGG_ACR4(phy->mt76->band_idx), MT_AGG_ACR_PPDU_TXS2H=
);
> -
> -	phy =3D dev->mt76.phys[MT_BAND1] ? dev->mt76.phys[MT_BAND1]->priv : NUL=
L;
> -	if (phy)
> -		mt76_clear(dev, MT_AGG_ACR4(phy->mt76->band_idx),
> -			   MT_AGG_ACR_PPDU_TXS2H);
>  }
> =20
>  static void mt7915_mmio_wed_release_rx_buf(struct mtk_wed_device *wed)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers=
/net/wireless/mediatek/mt76/mt7915/mt7915.h
> index b3ead3530740..3053f4abf7db 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> @@ -539,6 +539,7 @@ int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, st=
ruct ieee80211_vif *vif,
>  			   struct ieee80211_sta *sta, struct rate_info *rate);
>  int mt7915_mcu_rdd_background_enable(struct mt7915_phy *phy,
>  				     struct cfg80211_chan_def *chandef);
> +int mt7915_mcu_wed_wa_tx_stats(struct mt7915_dev *dev, u16 wcid);
>  int mt7915_mcu_rf_regval(struct mt7915_dev *dev, u32 regidx, u32 *val, b=
ool set);
>  int mt7915_mcu_wa_cmd(struct mt7915_dev *dev, int cmd, u32 a1, u32 a2, u=
32 a3);
>  int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 type, u8 ctrl);
> diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wirele=
ss/mediatek/mt76/tx.c
> index 72b3ec715e47..99d395bd1bba 100644
> --- a/drivers/net/wireless/mediatek/mt76/tx.c
> +++ b/drivers/net/wireless/mediatek/mt76/tx.c
> @@ -121,6 +121,7 @@ int
>  mt76_tx_status_skb_add(struct mt76_dev *dev, struct mt76_wcid *wcid,
>  		       struct sk_buff *skb)
>  {
> +	struct ieee80211_hdr *hdr =3D (struct ieee80211_hdr *)skb->data;
>  	struct ieee80211_tx_info *info =3D IEEE80211_SKB_CB(skb);
>  	struct mt76_tx_cb *cb =3D mt76_tx_skb_cb(skb);
>  	int pid;
> @@ -133,6 +134,11 @@ mt76_tx_status_skb_add(struct mt76_dev *dev, struct =
mt76_wcid *wcid,
>  	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
>  		return MT_PACKET_ID_NO_ACK;
> =20
> +	if (mtk_wed_device_active(&dev->mmio.wed) &&
> +	    ((info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) ||
> +	      ieee80211_is_data(hdr->frame_control)))
> +		return MT_PACKET_ID_WED;
> +
>  	if (!(info->flags & (IEEE80211_TX_CTL_REQ_TX_STATUS |
>  			     IEEE80211_TX_CTL_RATE_CTRL_PROBE)))
>  		return MT_PACKET_ID_NO_SKB;
> --=20
> 2.18.0
>=20

--hyja8z9qWK79G75q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZEeUFwAKCRA6cBh0uS2t
rIt6AP9lH+jk+PPR+ui+EzOhPP7K9ZgnTf/uB5hI5GHMbn1l/wD+IKyNB8xsQuPH
a28quofX7vcNXSy2EPAVIzs4y3UAjwY=
=4WIU
-----END PGP SIGNATURE-----

--hyja8z9qWK79G75q--


