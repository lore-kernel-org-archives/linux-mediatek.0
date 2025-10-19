Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96832CCD184
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Oct 2025 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5H+MaCr8Gp0YfRAgXVkenTGJLR59RzoE18KNDLcDYQ=; b=vJyklW/cRIN6ESF4tW+sV/HMng
	7VBYQ7yFF/aRNbRQ8GQPEyYI18ECjPG1QM9eljowaMF6lR1KbXgt3l0SRMhD4DJUxnTGIcNEOsIkE
	3ao/FXZweyM336K/CnyzrSGtTH858DM3NdKgZVeiACO5xM5OqCN673tYGAiIwPHwDdmYb+ZVWqO99
	L0V7w9JquR8e68VJ1MQg8ScwnYEcIDZ8mqfNnQ3IeRcnA4RJYLXIAPjBKyKUZ/s0Sw0rU7I3R9rr5
	ixienFuRIJ5+JMZBi7zyUlhSZHLw0idm1wAooHUGXTS5wKO4xS6XJc0l/X4CmHou1nnughivQTaSK
	k9jT8cgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAVmF-0000000BAbV-2H6Z;
	Sun, 19 Oct 2025 15:56:59 +0000
Received: from smtp-81.smtpout.orange.fr ([80.12.242.81] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAVmC-0000000BAb0-2v6W;
	Sun, 19 Oct 2025 15:56:58 +0000
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id AVlyvBh0PDOeWAVlyvdeNf; Sun, 19 Oct 2025 17:56:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1760889410;
	bh=R5H+MaCr8Gp0YfRAgXVkenTGJLR59RzoE18KNDLcDYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=dN+InTtXbEQFgpQGgwNWLk2rLIeP2eEX9Yt1WZuX7ggfe7c7i2PFQHh2dVAcVzOR/
	 GMYQPeRg8zYSYF7mD6y3TaYQ14z4vNy2GVUwM8SgspZ3go8NkpbN1t04Qp1iG4sY5C
	 3d7IBvbk/8aaHsOn/eKKbWctllnznhJLAwlfHu06hOR6buY8iD9GSCtJXgXRrV1eE0
	 wtOCrju4F3dg6zxDlfxefjwF5gYgStxRALOmCC0GgiGjM+xvFhpkGqyVqdQRhMnGfo
	 Vqw8/ds8sqrlhLoKoRqPIPPdKqMF2f0YzR7I8NIx6n8JV5kLA++dzhaL1CtebQHZN3
	 /Da6zRepGe+tA==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 19 Oct 2025 17:56:50 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <c674e933-cf6f-412d-b83b-b225ff6365c9@wanadoo.fr>
Date: Sun, 19 Oct 2025 17:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: add tx checksum offload for mt7915, mt7921,
 mt7981 and mt7986
To: Aleksander Jan Bajkowski <olek2@wp.pl>, nbd@nbd.name, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 howard-yh.hsu@mediatek.com, StanleyYP.Wang@mediatek.com, rosenp@gmail.com,
 luoxueqin@kylinos.cn, chad@monroe.io, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251019155316.3537185-1-olek2@wp.pl>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20251019155316.3537185-1-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_085657_157832_D9EBB843 
X-CRM114-Status: GOOD (  15.40  )
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

Le 19/10/2025 à 17:51, Aleksander Jan Bajkowski a écrit :
> Supports IPv4 and IPv6 TCP + UDP
> 
> In various tests between MT7986 and Intel BE200, I observed a performance
> boost ranging from 2 to 12%, with an average of 5.5%.
> 
> I did the tests on the MT7915, MT7981, MT7986, and MT7921 variants. The
> MT7922, MT7925, and MT799x are untouched for now and still have
> checksumming disabled.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> [rebased and resolved conflicts]
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>   drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 5 +++++
>   drivers/net/wireless/mediatek/mt76/mt7915/init.c     | 3 ++-
>   drivers/net/wireless/mediatek/mt76/mt792x_core.c     | 3 +++
>   3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> index 0db00efe88b0..e31b3e7e2038 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> @@ -372,6 +372,9 @@ mt76_connac2_mac_write_txwi_8023(__le32 *txwi, struct sk_buff *skb,
>   		wmm = sta->wme;
>   	}
>   
> +	val = FIELD_PREP(MT_TXD0_ETH_TYPE_OFFSET, 10);
> +	txwi[0] |= cpu_to_le32(val);
> +
>   	val = FIELD_PREP(MT_TXD1_HDR_FORMAT, MT_HDR_FORMAT_802_3) |
>   	      FIELD_PREP(MT_TXD1_TID, tid);
>   
> @@ -391,6 +394,8 @@ mt76_connac2_mac_write_txwi_8023(__le32 *txwi, struct sk_buff *skb,
>   
>   	val = FIELD_PREP(MT_TXD7_TYPE, fc_type) |
>   	      FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
> +	if (skb->ip_summed == CHECKSUM_PARTIAL)
> +		val |= MT_TXD7_IP_SUM | MT_TXD7_UDP_TCP_SUM;
>   
>   	txwi[7] |= cpu_to_le32(val);
>   }
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> index 5ea8b46e092e..a3bab240afb7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -359,7 +359,8 @@ mt7915_init_wiphy(struct mt7915_phy *phy)
>   	hw->queues = 4;
>   	hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_HE;
>   	hw->max_tx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_HE;
> -	hw->netdev_features = NETIF_F_RXCSUM;
> +	hw->netdev_features = NETIF_F_RXCSUM |
> +			      NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
>   
>   	if (mtk_wed_device_active(&mdev->mmio.wed))
>   		hw->netdev_features |= NETIF_F_HW_TC;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> index c0e56541a954..fe138d2e8e62 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> @@ -632,6 +632,9 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
>   	}
>   	hw->netdev_features = NETIF_F_RXCSUM;
>   
> +	if (is_mt7921(&dev->mt76))
> +		NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;

This looks strange.

Maybe:
	netdev_features |= NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
?

CJ

> +
>   	hw->radiotap_timestamp.units_pos =
>   		IEEE80211_RADIOTAP_TIMESTAMP_UNIT_US;
>   


