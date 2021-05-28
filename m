Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBE3C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 14:53:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA90613E9
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 14:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CA90613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zk3vytAAVQgNenDxvsK83eo2yjYtzNV1wckACRf7sI=; b=IBv/f+kkL0vy8L
	qwivno6LAvYg3ZjZv2tsocnwaXr94FzqdvcHlAzHskk242hjnBcSYxy/+OvveAuYhjMoYjBGG3yad
	IWd5pjZKuFC1od8aJRonIeNn8PKqiWlMXPD2zYJ4MnfAm2j4e8bqmN3nRRpde1IjC0OnHPV69JS9B
	UQ1xkZKvN4nuBcJTUIE8p5rOZgSzcATB6ciNHIwED529xyYJl5GMZJhfQWsl3MYf+7x4THdqZFM4G
	iQG/yeb2lFOAOjAP81JowDbEMnitt5XXWnWjiFfoEZn4Wn4UtYtuHKvZcKuKCr0XAVEovowp1n17D
	JuIoQt5/H4/wTy2ji5dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmdrr-00GN8M-8Z; Fri, 28 May 2021 14:53:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmdpT-00GLsF-SB
 for linux-mediatek@lists.infradead.org; Fri, 28 May 2021 14:51:17 +0000
X-UUID: 6799e5b6c3ff4e249b4c3dfecfa01fe9-20210528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IqFXEixS/9LteybwUZNLlQSCVOoMC8Vc8923EpKqJrk=; 
 b=MCsHAxTrpZqpqxNu5q+p9ZmnlVkLoeSjVkNbeMvH53+z5wdmKdF2Pwds8M6YGLwg5bYaVgGFErKF2S/Z1a8AzTiuIS5lVsu9NWmU92mWVapGG6LL2dqu8IU1Nk8qPcWL1qbRCAel8jz4MRWLOeVJ+SeaMRiMo3byu/e1u5XmEiY=;
X-UUID: 6799e5b6c3ff4e249b4c3dfecfa01fe9-20210528
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 440231779; Fri, 28 May 2021 07:51:08 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 May 2021 07:51:06 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 May 2021 22:50:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 May 2021 22:50:53 +0800
Message-ID: <409f8f2687aa9cfed58023c83bd18a47088eddc5.camel@mediatek.com>
Subject: Re: [PATCH v2] mt76: mt7921: introduce mac tx done handling
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu
 <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, Posh Sun
 <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>, Stella Chang
 <Stella.Chang@mediatek.com>, <jemele@google.com>, <yenlinlai@google.com>,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Fri, 28 May 2021 22:50:53 +0800
In-Reply-To: <b43e8c650aa75383c90d8272c719d4d8653f2cb8.1622210871.git.deren.wu@mediatek.com>
References: <b43e8c650aa75383c90d8272c719d4d8653f2cb8.1622210871.git.deren.wu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_075115_963990_2A0C1E7C 
X-CRM114-Status: GOOD (  23.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

The patch was done with v1 already. Please ignore this version.

I will create another patch for coding issue.


Regards,
Deren


On Fri, 2021-05-28 at 22:13 +0800, Deren Wu wrote:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> Instead of read tx status from mac table, add new mechanisam to
> hanele
> tx done event for data frame, every 250ms
> 
> This event indicate the real tx status of this pkt in mac layer and
> would help mac80211 correct status more frequently
> 
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
> change since v2: fix coding style
> ---
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 67 +++++++++++----
> ----
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 47 +++++++++++++
>  .../net/wireless/mediatek/mt76/mt7921/mcu.h   | 28 ++++++++
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +
>  4 files changed, 115 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> index 212832b34674..ec87097146ee 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -13,6 +13,34 @@
>  #define HE_PREP(f, m, v)	le16_encode_bits(le32_get_bits(v,
> MT_CRXV_HE_##m),\
>  						 IEEE80211_RADIOTAP_HE_
> ##f)
>  
> +static u8 mt7921_next_pid(struct mt7921_dev *dev, struct mt76_wcid
> *wcid)
> +{
> +	wcid->packet_id = (wcid->packet_id + 1) & MT_PACKET_ID_MASK;
> +	if (wcid->packet_id == MT_PACKET_ID_NO_ACK ||
> +	    wcid->packet_id == MT_PACKET_ID_NO_SKB)
> +		wcid->packet_id = MT_PACKET_ID_FIRST;
> +	return wcid->packet_id;
> +}
> +
> +unsigned long mt7921_next_txs_set(struct mt7921_dev *dev,
> +				  struct mt76_wcid *wcid,
> +				  u32 timeout)
> +{
> +	struct mt7921_sta *msta;
> +
> +	msta = container_of(wcid, struct mt7921_sta, wcid);
> +	msta->next_txs_ts = jiffies + msecs_to_jiffies(timeout);
> +	return msta->next_txs_ts;
> +}
> +
> +bool mt7921_next_txs_timeout(struct mt7921_dev *dev, struct
> mt76_wcid *wcid)
> +{
> +	struct mt7921_sta *msta;
> +
> +	msta = container_of(wcid, struct mt7921_sta, wcid);
> +	return time_is_before_jiffies(msta->next_txs_ts);
> +}
> +
>  static struct mt76_wcid *mt7921_rx_get_wcid(struct mt7921_dev *dev,
>  					    u16 idx, bool unicast)
>  {
> @@ -726,7 +754,7 @@ void mt7921_mac_write_txwi(struct mt7921_dev
> *dev, __le32 *txwi,
>  	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
>  	struct ieee80211_vif *vif = info->control.vif;
>  	struct mt76_phy *mphy = &dev->mphy;
> -	u8 p_fmt, q_idx, omac_idx = 0, wmm_idx = 0;
> +	u8 pid, p_fmt, q_idx, omac_idx = 0, wmm_idx = 0;
>  	bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
>  	u16 tx_count = 15;
>  	u32 val;
> @@ -795,6 +823,15 @@ void mt7921_mac_write_txwi(struct mt7921_dev
> *dev, __le32 *txwi,
>  		txwi[6] |= cpu_to_le32(val);
>  		txwi[3] |= cpu_to_le32(MT_TXD3_BA_DISABLE);
>  	}
> +
> +	if ((FIELD_GET(MT_TXD2_FRAME_TYPE, txwi[2]) &
> +		(IEEE80211_FTYPE_DATA >> 2)) &&
> +		mt7921_next_txs_timeout(dev, wcid)) {
> +		mt7921_next_txs_set(dev, wcid, 250);
> +		pid = mt7921_next_pid(dev, wcid);
> +		val = MT_TXD5_TX_STATUS_MCU | FIELD_PREP(MT_TXD5_PID,
> pid);
> +		txwi[5] |= cpu_to_le32(val);
> +	}
>  }
>  
>  static void
> @@ -1380,30 +1417,6 @@ mt7921_mac_update_mib_stats(struct mt7921_phy
> *phy)
>  	}
>  }
>  
> -static void
> -mt7921_mac_sta_stats_work(struct mt7921_phy *phy)
> -{
> -	struct mt7921_dev *dev = phy->dev;
> -	struct mt7921_sta *msta;
> -	LIST_HEAD(list);
> -
> -	spin_lock_bh(&dev->sta_poll_lock);
> -	list_splice_init(&phy->stats_list, &list);
> -
> -	while (!list_empty(&list)) {
> -		msta = list_first_entry(&list, struct mt7921_sta,
> stats_list);
> -		list_del_init(&msta->stats_list);
> -		spin_unlock_bh(&dev->sta_poll_lock);
> -
> -		/* query wtbl info to report tx rate for further
> devices */
> -		mt7921_get_wtbl_info(dev, msta->wcid.idx);
> -
> -		spin_lock_bh(&dev->sta_poll_lock);
> -	}
> -
> -	spin_unlock_bh(&dev->sta_poll_lock);
> -}
> -
>  void mt7921_mac_work(struct work_struct *work)
>  {
>  	struct mt7921_phy *phy;
> @@ -1421,10 +1434,6 @@ void mt7921_mac_work(struct work_struct *work)
>  
>  		mt7921_mac_update_mib_stats(phy);
>  	}
> -	if (++phy->sta_work_count == 4) {
> -		phy->sta_work_count = 0;
> -		mt7921_mac_sta_stats_work(phy);
> -	}
>  
>  	mt7921_mutex_release(phy->dev);
>  	ieee80211_queue_delayed_work(phy->mt76->hw, &mphy->mac_work,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> index 5a4c695f73c9..e8cd767ea475 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -531,6 +531,49 @@ mt7921_mcu_low_power_event(struct mt7921_dev
> *dev, struct sk_buff *skb)
>  	trace_lp_event(dev, event->state);
>  }
>  
> +static void
> +mt7921_mcu_tx_done_event(struct mt7921_dev *dev, struct sk_buff
> *skb)
> +{
> +	struct mt7921_mcu_tx_done_event *event;
> +	struct mt7921_sta *msta;
> +	struct mt7921_phy *mphy = &dev->phy;
> +	struct mt7921_mcu_peer_cap peer;
> +	struct ieee80211_sta *sta;
> +	LIST_HEAD(list);
> +
> +	skb_pull(skb, sizeof(struct mt7921_mcu_rxd));
> +	event = (struct mt7921_mcu_tx_done_event *)skb->data;
> +
> +	spin_lock_bh(&dev->sta_poll_lock);
> +	list_splice_init(&mphy->stats_list, &list);
> +
> +	while (!list_empty(&list)) {
> +		msta = list_first_entry(&list, struct mt7921_sta,
> stats_list);
> +		list_del_init(&msta->stats_list);
> +
> +		if (msta->wcid.idx != event->wlan_idx)
> +			continue;
> +
> +		spin_unlock_bh(&dev->sta_poll_lock);
> +
> +		sta = wcid_to_sta(&msta->wcid);
> +
> +		/* peer config based on IEEE SPEC */
> +		memset(&peer, 0x0, sizeof(peer));
> +		peer.bw = event->bw;
> +		peer.g2 = !!(sta->ht_cap.cap &
> IEEE80211_HT_CAP_SGI_20);
> +		peer.g4 = !!(sta->ht_cap.cap &
> IEEE80211_HT_CAP_SGI_40);
> +		peer.g8 = !!(sta->vht_cap.cap &
> IEEE80211_VHT_CAP_SHORT_GI_80);
> +		peer.g16 = !!(sta->vht_cap.cap &
> IEEE80211_VHT_CAP_SHORT_GI_160);
> +		mt7921_mcu_tx_rate_parse(mphy->mt76, &peer,
> +					 &msta->stats.tx_rate, event-
> >tx_rate);
> +
> +		spin_lock_bh(&dev->sta_poll_lock);
> +		break;
> +	}
> +	spin_unlock_bh(&dev->sta_poll_lock);
> +}
> +
>  static void
>  mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *dev, struct
> sk_buff *skb)
>  {
> @@ -557,6 +600,9 @@ mt7921_mcu_rx_unsolicited_event(struct mt7921_dev
> *dev, struct sk_buff *skb)
>  	case MCU_EVENT_LP_INFO:
>  		mt7921_mcu_low_power_event(dev, skb);
>  		break;
> +	case MCU_EVENT_TX_DONE:
> +		mt7921_mcu_tx_done_event(dev, skb);
> +		break;
>  	default:
>  		break;
>  	}
> @@ -577,6 +623,7 @@ void mt7921_mcu_rx_event(struct mt7921_dev *dev,
> struct sk_buff *skb)
>  	    rxd->eid == MCU_EVENT_SCHED_SCAN_DONE ||
>  	    rxd->eid == MCU_EVENT_BSS_ABSENCE ||
>  	    rxd->eid == MCU_EVENT_SCAN_DONE ||
> +	    rxd->eid == MCU_EVENT_TX_DONE ||
>  	    rxd->eid == MCU_EVENT_DBG_MSG ||
>  	    rxd->eid == MCU_EVENT_COREDUMP ||
>  	    rxd->eid == MCU_EVENT_LP_INFO ||
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
> b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
> index 49823d0a3d0a..22ebef4add00 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
> @@ -81,6 +81,7 @@ enum {
>  	MCU_EVENT_REG_ACCESS = 0x05,
>  	MCU_EVENT_LP_INFO = 0x07,
>  	MCU_EVENT_SCAN_DONE = 0x0d,
> +	MCU_EVENT_TX_DONE = 0x0f,
>  	MCU_EVENT_BSS_ABSENCE  = 0x11,
>  	MCU_EVENT_BSS_BEACON_LOSS = 0x13,
>  	MCU_EVENT_CH_PRIVILEGE = 0x18,
> @@ -407,4 +408,31 @@ struct mt7921_txpwr_event {
>  	struct mt7921_txpwr txpwr;
>  } __packed;
>  
> +struct mt7921_mcu_tx_done_event {
> +	u8 pid;
> +	u8 status;
> +	u16 seq;
> +
> +	u8 wlan_idx;
> +	u8 tx_cnt;
> +	u16 tx_rate;
> +
> +	u8 flag;
> +	u8 tid;
> +	u8 rsp_rate;
> +	u8 mcs;
> +
> +	u8 bw;
> +	u8 tx_pwr;
> +	u8 reason;
> +	u8 rsv0[1];
> +
> +	u32 delay;
> +	u32 timestamp;
> +	u32 applied_flag;
> +
> +	u8 txs[28];
> +
> +	u8 rsv1[32];
> +} __packed;
>  #endif
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index 59862ea4951c..a1e4276273d8 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -92,6 +92,8 @@ struct mt7921_sta {
>  	unsigned long ampdu_state;
>  
>  	struct mt7921_sta_key_conf bip;
> +
> +	unsigned long next_txs_ts;
>  };
>  
>  DECLARE_EWMA(rssi, 10, 8);
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
