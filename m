Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A45BC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 02:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsYYEuCTyLygbbnWJqf8CnEiDyurimHSUasizpCLejA=; b=yL/42BhxzQVAECi26eZqGuNzJ4
	BZfCBIxj0PaDpjXCmso3xFnFG2QpBj9VyXP5bSkhFD4tSaQAK7+zO/xji7nJmX7zyQFIc4BbQzZZw
	HBrExoruAAnUV7hTEPgqFVOxuxCIzAim2iY5H3Bv6Ck0Q9PNYe3K+XNVUAidPF86zMmtGFVH5Jdee
	I+vcLG1aQw/bmyK1rNqUSxMahv0kuqE9G6Ou5ARn6KMOHErTXvW99y2cjrgrWh3a+qwI2sbZs7Zjn
	r/OpJmoAlwn+z87bPwOjRVfTNilBIJOmKWzlUZaVY/FhQGoneDtm5yEGEAi8DGP/zaLsZEayU++DT
	qUS9gPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAiUL-00Aj8A-FG; Thu, 29 Dec 2022 02:17:45 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAiUI-00Aj5Q-2D
	for linux-mediatek@lists.infradead.org; Thu, 29 Dec 2022 02:17:44 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.110.50.13])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 6946B1A006C;
	Thu, 29 Dec 2022 02:17:39 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 936AF440075;
	Thu, 29 Dec 2022 02:17:38 +0000 (UTC)
Received: from [192.168.1.115] (unknown [98.97.40.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id C759413C2B0;
	Wed, 28 Dec 2022 18:17:36 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com C759413C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1672280258;
	bh=qBrV6fXbAu8tEBkw8S0iQndbmaHmFO930kx0wvLt83I=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=XHDFmkmVD8dBfbH69O33QTm93fFfh71SNHkBKp2tXl7BgRujIyGkS5uDtEGh597PE
	 BDPf02ZJcyDC+zarkP/W3CUf4td6m4PlnV2CiQH4bx0hJI5pSYX+/i6p+VY5HYH5IQ
	 ldCu2+B47Umt4t2CxiDc9UKKDxuLN3wCobex2AYQ=
Subject: Re: [PATCH] wifi: mt76: mt7915: remove BW80+80 support
To: MeiChia Chiu <MeiChia.Chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Money Wang <Money.Wang@mediatek.com>
References: <20221229021131.9361-1-MeiChia.Chiu@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <f50c7537-f512-ec82-b3b8-a663bf749b09@candelatech.com>
Date: Wed, 28 Dec 2022 18:17:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20221229021131.9361-1-MeiChia.Chiu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
X-MDID: 1672280259-h2SD7Iw4w6RS
X-MDID-O: us5-at1-1672280259-h2SD7Iw4w6RS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_181742_277711_0CE0238C 
X-CRM114-Status: GOOD (  24.29  )
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

On 12/28/22 6:11 PM, MeiChia Chiu wrote:
> mt7915 doesn't support bw80+80.

You are removing a bunch of 160Mhz support flags as well, was that on
purpose?

 From what I can tell, 7915 does support 160Mhz in 2x2 mode.

Thanks,
Ben

> 
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Money Wang<Money.Wang@mediatek.com>
> Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
> ---
>   .../net/wireless/mediatek/mt76/mt7915/init.c  | 38 +++++--------------
>   1 file changed, 9 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> index 571c94835942..c72d673f02dd 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -38,8 +38,7 @@ static const struct ieee80211_iface_combination if_comb[] = {
>   				       BIT(NL80211_CHAN_WIDTH_20) |
>   				       BIT(NL80211_CHAN_WIDTH_40) |
>   				       BIT(NL80211_CHAN_WIDTH_80) |
> -				       BIT(NL80211_CHAN_WIDTH_160) |
> -				       BIT(NL80211_CHAN_WIDTH_80P80),
> +				       BIT(NL80211_CHAN_WIDTH_160),
>   	}
>   };
>   
> @@ -394,11 +393,6 @@ mt7915_init_wiphy(struct mt7915_phy *phy)
>   			phy->mt76->sband_5g.sband.vht_cap.cap |=
>   				IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_7991 |
>   				IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK;
> -
> -			if (!dev->dbdc_support)
> -				phy->mt76->sband_5g.sband.vht_cap.cap |=
> -					IEEE80211_VHT_CAP_SHORT_GI_160 |
> -					IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ;
>   		} else {
>   			phy->mt76->sband_5g.sband.vht_cap.cap |=
>   				IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454 |
> @@ -834,13 +828,9 @@ mt7915_set_stream_he_txbf_caps(struct mt7915_phy *phy,
>   	int sts = hweight8(phy->mt76->chainmask);
>   	u8 c, sts_160 = sts;
>   
> -	/* Can do 1/2 of STS in 160Mhz mode for mt7915 */
> -	if (is_mt7915(&dev->mt76)) {
> -		if (!dev->dbdc_support)
> -			sts_160 /= 2;
> -		else
> -			sts_160 = 0;
> -	}
> +	/* mt7915 doesn't support bw160 */
> +	if (is_mt7915(&dev->mt76))
> +		sts_160 = 0;
>   
>   #ifdef CONFIG_MAC80211_MESH
>   	if (vif == NL80211_IFTYPE_MESH_POINT)
> @@ -894,9 +884,6 @@ mt7915_set_stream_he_txbf_caps(struct mt7915_phy *phy,
>   	elem->phy_cap_info[3] |= IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER;
>   	elem->phy_cap_info[4] |= IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
>   
> -	/* num_snd_dim
> -	 * for mt7915, max supported sts is 2 for bw > 80MHz and 0 if dbdc
> -	 */
>   	c = FIELD_PREP(IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK,
>   		       sts - 1);
>   	if (sts_160)
> @@ -944,15 +931,10 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
>   	int i, idx = 0, nss = hweight8(phy->mt76->antenna_mask);
>   	u16 mcs_map = 0;
>   	u16 mcs_map_160 = 0;
> -	u8 nss_160;
> +	u8 nss_160 = nss;
>   
> -	if (!is_mt7915(&dev->mt76))
> -		nss_160 = nss;
> -	else if (!dev->dbdc_support)
> -		/* Can do 1/2 of NSS streams in 160Mhz mode for mt7915 */
> -		nss_160 = nss / 2;
> -	else
> -		/* Can't do 160MHz with mt7915 dbdc */
> +	/* Can't do 160MHz with mt7915 */
> +	if (is_mt7915(&dev->mt76))
>   		nss_160 = 0;
>   
>   	for (i = 0; i < 8; i++) {
> @@ -1002,8 +984,7 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
>   		else if (nss_160)
>   			he_cap_elem->phy_cap_info[0] =
>   				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
> -				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G |
> -				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
> +				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
>   		else
>   			he_cap_elem->phy_cap_info[0] =
>   				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G;
> @@ -1075,12 +1056,11 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
>   			break;
>   		}
>   
> +		memset(he_mcs, 0, sizeof(*he_mcs));
>   		he_mcs->rx_mcs_80 = cpu_to_le16(mcs_map);
>   		he_mcs->tx_mcs_80 = cpu_to_le16(mcs_map);
>   		he_mcs->rx_mcs_160 = cpu_to_le16(mcs_map_160);
>   		he_mcs->tx_mcs_160 = cpu_to_le16(mcs_map_160);
> -		he_mcs->rx_mcs_80p80 = cpu_to_le16(mcs_map_160);
> -		he_mcs->tx_mcs_80p80 = cpu_to_le16(mcs_map_160);
>   
>   		mt7915_set_stream_he_txbf_caps(phy, he_cap, i);
>   
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

