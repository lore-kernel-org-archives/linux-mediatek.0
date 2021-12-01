Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDC9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 12:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKW3ba+smpQGNVWn/BMOEtUJfdCAlHhlQfQkJG1D1OY=; b=FOlxPeDJe48igo
	UdFiYMnM5ujh1dHKYRE8SLW7jZ6U/pxGihvIKU6taxhCEDV/weM0wPsUJBg2/nNo4vFbfYxg64G6w
	5heCx0L04alxMqmVP9w37QDkz5mxrBRePUjcWVLrew/ewi1elmuS+4OtyPjjiVsfVUkivjQap/N8+
	Pw+c3oC/40GYT2MrSnR84xnrNEVIXECD/ErSdWbVPsoyKJyzPqqVtF57wmRSxf6EklUlmyjuQUK+D
	OCg9b5sYscvWvqUshOBdcHom/9fnOQ/Np3GEGK1tPHj6eRUTais6rWFs/AuZ/8lz3tJkqHWHWiuLC
	23G7BTVteLmDMmFtNIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msOuZ-008WmW-8b; Wed, 01 Dec 2021 12:40:35 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msOuW-008WlV-Jf
 for linux-mediatek@lists.infradead.org; Wed, 01 Dec 2021 12:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gVQYc331BGMCR+nRup6YV5FstprzmHrINE+dZ7VscZg=; b=fx68SFt6PktzpzbsrOkwn0AZTY
 t8VV0OXOJ3eIP7/W41p/KQ6Tck5RHwd78S7enRnjsc+3YUnX3t0CDLefJLINoulQ0cbrkVflP2WBR
 9P2tjNiqdwMcB9/MUDnlRxIB2kuF0HDoQQQYaVLYqw4Mxtxz98ITV7C8VhTP9phCtDgg=;
Received: from p54ae943f.dip0.t-ipconnect.de ([84.174.148.63] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1msOuS-0003Cr-5t; Wed, 01 Dec 2021 13:40:28 +0100
Message-ID: <6999d2e5-a2c5-0247-83c3-f27a0fae157e@nbd.name>
Date: Wed, 1 Dec 2021 13:40:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v3 08/11] mt76: mt7915: update rx rate reporting for mt7916
Content-Language: en-US
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <cover.1637652742.git.Bo.Jiao@mediatek.com>
 <c3519b5f2ed307b18bd0c23e3185ee5d894aa5ca.1637652742.git.Bo.Jiao@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <c3519b5f2ed307b18bd0c23e3185ee5d894aa5ca.1637652742.git.Bo.Jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_044032_850515_3B05B954 
X-CRM114-Status: GOOD (  12.24  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 2021-11-23 08:49, Bo Jiao wrote:
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> index 057ab27..0650140 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> @@ -969,11 +969,14 @@ static void mt7915_sta_statistics(struct ieee80211_hw *hw,
>   	struct mt7915_phy *phy = mt7915_hw_phy(hw);
>   	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
>   	struct rate_info *txrate = &msta->wcid.rate;
> -	struct rate_info rxrate = {};
>   
> -	if (!mt7915_mcu_get_rx_rate(phy, vif, sta, &rxrate)) {
> -		sinfo->rxrate = rxrate;
> -		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_BITRATE);
> +	if (is_mt7915(&phy->dev->mt76)) {
> +		struct rate_info rxrate = {};
> +
> +		if (!mt7915_mcu_get_rx_rate(phy, vif, sta, &rxrate)) {
> +			sinfo->rxrate = rxrate;
> +			sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_BITRATE);
> +		}
>   	}
>   
>   	if (!txrate->legacy && !txrate->flags)

You can simplify this part by leaving the code as-is and only changing 
the if condition like this:

if (is_mt7915(&phy->dev->mt76) &&
     !mt7915_mcu_get_rx_rate(phy, vif, sta, &rxrate) {
	...
}

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
