Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99677C4743C
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 02:32:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 549FB6128E
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 02:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 549FB6128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ala0DVrcM3jlXt1oxk6pBv5E68sc06FUpWO3O4AS444=; b=svXwmQ+35lGfc2
	GjtZH07sh5ObgOnWRbxUXAlcZfYnB9ADiM/5nZkzVU8+wX2LDM3e0CEVopY2kecAPHSJ2fHkZ7QEb
	S+e+n7aEPVctv31ISobIW70wc3S/EEqJvODJgndz6Z/NT2Rg4pe/ZYjXrydUo9im+ocPbQ2953pj3
	81ZirtSqi5pyGSimDuRMXYec1qvRyS2rcJUothshVZ3XZW7h02NqCqT2udaP55X799eQGx7yoIVpa
	YhI+AUZ3aJmLFqbHzEDuNB/ttxBfEyRHYpFwlqfLYZPFJRib8ptNIVLPNODHoq0XfWMJzVbvEfxv6
	aiYvMh1JG64IKYUGjaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvWCy-005Q1L-P5; Tue, 22 Jun 2021 02:32:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvWCw-005Q0e-Jh
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 02:32:12 +0000
X-UUID: 0d6e834d8338487aac417c1d03bf7434-20210621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eTodyqMyYRd024o564gRpnPI6Tqoq4hTYqKHDs4/ipk=; 
 b=oe44yEYAWj0/IONSU6+jBXgF4uOWAtJs8+uCANyV8Xe1v1B1emL1xLWTJEa5vZbx05rHdw6jqrZWb7RPB70Ya9QcDYnCObC0d+T9TXNqgC7uplntSFOUzFShOPnRTi84IlBXD98cQ8ESO4MlWofmReNU1GoTL/9gpdCoMouHf48=;
X-UUID: 0d6e834d8338487aac417c1d03bf7434-20210621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1223082600; Mon, 21 Jun 2021 19:32:01 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Jun 2021 19:31:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 10:31:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Jun 2021 10:31:58 +0800
Message-ID: <10817fc92345946be76860d6944acb2205677447.camel@mediatek.com>
Subject: Re: [PATCH v2] mt76: mt7921: add .set_sar_specs support
From: Ryder Lee <ryder.lee@mediatek.com>
To: <sean.wang@mediatek.com>, <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>,
 <Leon.Yen@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <jemele@google.com>, <yenlinlai@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 22 Jun 2021 10:31:58 +0800
In-Reply-To: <28d23d04a251490241763dd0b5fe50a523f6fb02.1624316313.git.objelf@gmail.com>
References: <28d23d04a251490241763dd0b5fe50a523f6fb02.1624316313.git.objelf@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_193210_701529_6705AB08 
X-CRM114-Status: GOOD (  21.04  )
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

On Tue, 2021-06-22 at 07:07 +0800, sean.wang@mediatek.com wrote:
> From: YN Chen <YN.Chen@mediatek.com>
> 
> add .set_sar_specs to allow configuring SAR power limitations on the
> frequency ranges from the userland.
> 
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
> ---
> v2: 1. loop enhancement with considering no overlapping freqs
>     2. error handling for devm_kcalloc
>     3. sanity check without acquire lock
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h     |  3 ++
>  .../net/wireless/mediatek/mt76/mt76_connac.h  |  5 +++
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 26 +++++++++++-
>  .../net/wireless/mediatek/mt76/mt7921/init.c  | 33 ++++++++++++++-
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 41
> +++++++++++++++++++
>  5 files changed, 105 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h
> b/drivers/net/wireless/mediatek/mt76/mt76.h
> index 25c5ceef5257..63ce5242c4d5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -636,6 +636,9 @@ struct mt76_phy {
>  		struct sk_buff **tail;
>  		u16 seqno;
>  	} rx_amsdu[__MT_RXQ_MAX];
> +
> +	void *frp_data;
> +	u8 num_frps;
>  };
>  
>  struct mt76_dev {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> index f49d97d0a1c5..95c7d1cac7c4 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> @@ -83,6 +83,11 @@ struct mt76_connac_coredump {
>  	unsigned long last_activity;
>  };
>  
> +struct mt76_connac_freq_range_power {
> +	const struct cfg80211_sar_freq_ranges *range;
> +	s8 power;
> +};
> +
>  extern const struct wiphy_wowlan_support mt76_connac_wowlan_support;
>  
>  static inline bool is_mt7921(struct mt76_dev *dev)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index 5c3a81e5f559..497de1d91c7c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -1749,6 +1749,26 @@ mt76_connac_mcu_build_sku(struct mt76_dev
> *dev, s8 *sku,
>  	}
>  }
>  
> +static s8 mt76_connac_get_sar_power(struct mt76_phy *phy,
> +				    struct ieee80211_channel *chan,
> +				    s8 target_power)
> +{
> +	struct mt76_connac_freq_range_power *frp = phy->frp_data;
> +	int freq, i;
> +
> +	freq = ieee80211_channel_to_frequency(chan->hw_value, chan-
> >band);
> +	for (i = 0 ; i < phy->num_frps; i++) {
> +		if (frp[i].range &&
> +		    freq >= frp[i].range->start_freq &&
> +		    freq < frp[i].range->end_freq) {
> +			target_power = min_t(s8, frp[i].power,
> target_power);
> +			break;
> +		}
> +	}
> +
> +	return target_power;
> +}
> +
>  static int
>  mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
>  				  enum nl80211_band band)
> @@ -1816,9 +1836,13 @@ mt76_connac_mcu_rate_txpower_band(struct
> mt76_phy *phy,
>  				.hw_value = ch_list[idx],
>  				.band = band,
>  			};
> +			s8 sar_power;
> +
> +			sar_power = mt76_connac_get_sar_power(phy,
> &chan,
> +							      tx_power)
> ;
>  
>  			mt76_get_rate_power_limits(phy, &chan, &limits,
> -						   tx_power);
> +						   sar_power);
>  
>  			tx_power_tlv.last_msg = ch_list[idx] ==
> last_ch;
>  			sku_tlbv.channel = ch_list[idx];
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> index a9ce10b98827..c11a5b925209 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -24,6 +24,20 @@ static const struct ieee80211_iface_combination
> if_comb[] = {
>  	}
>  };
>  
> +const struct cfg80211_sar_freq_ranges mt7921_sar_freq_ranges[] = {
> +	{ .start_freq = 2402, .end_freq = 2494, },
> +	{ .start_freq = 5150, .end_freq = 5350, },
> +	{ .start_freq = 5350, .end_freq = 5470, },
> +	{ .start_freq = 5470, .end_freq = 5725, },
> +	{ .start_freq = 5725, .end_freq = 5950, },
> +};
> +
> +static const struct cfg80211_sar_capa mt7921_sar_capa = {
> +	.type = NL80211_SAR_TYPE_POWER,
> +	.num_freq_ranges = ARRAY_SIZE(mt7921_sar_freq_ranges),
> +	.freq_ranges = &mt7921_sar_freq_ranges[0],
> +};
> +
> 

Nowthat we have frps in mt76.h we can make these SAR chunk sharable as
well to provide a common ground to other mt76 station devices might
require set_sar_spec.

Ryder
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
