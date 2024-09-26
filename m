Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71402CDE00B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 14:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSll6t1YLqXZcv6+C1T+VzxepgAJSvcVInfOJxgS0NU=; b=v3Vx4DpIj/dwzbvlGKGYqfHe4s
	ujvP82yGS3lFEJzv1ChcOCRWW0snl4Kd1HTonFVczjKMw5GR0mv6JJCHqe2z8RKcBsCEkeSHwxQz+
	fciLbL66RyRE0QbjhHNzWJFXEFMYL0TAWuVNA1nFOSCNFtiBycE8e68tZpkUEyIemuuuAbbb+kshN
	gXLPsmpa16Enr6+/1GTV/NTLBzLFvsj+/TzdDJ39TvHG59u01rlotGTskjySx7AfiPRsbI5DiKlvS
	iR1qqqge1zgbSIeEv2y/g2kqXk+veK1EDIAjvu2JtCOrQO9CLDITfn6D0+L2FPMqAKrWm7H6tYaED
	1HDUeX/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stpGH-00000008YhQ-1wcJ;
	Thu, 26 Sep 2024 14:14:29 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stpGE-00000008Ygl-23N7
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Sep 2024 14:14:27 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1stpGC-000000005kT-321X;
	Thu, 26 Sep 2024 14:14:24 +0000
Date: Thu, 26 Sep 2024 15:14:22 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Subject: Re: [PATCH 3/3] wifi: mt76: mt7996: set correct background radar
 capability
Message-ID: <ZvVsPqwRdL5GltTX@makrotopia.org>
References: <20240926032440.15978-1-shayne.chen@mediatek.com>
 <20240926032440.15978-3-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926032440.15978-3-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_071426_551321_25671AB0 
X-CRM114-Status: GOOD (  16.33  )
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

On Thu, Sep 26, 2024 at 11:24:40AM +0800, Shayne Chen wrote:
> From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> 
> Some of the variants do not support background radar, so add a helper
> to report background radar capability.
> 
> Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>

Tested-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  .../net/wireless/mediatek/mt76/mt7996/init.c  |  7 ++++---
>  .../wireless/mediatek/mt76/mt7996/mt7996.h    | 19 +++++++++++++++++++
>  2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
> index bf70799b4bc4..f6a010b61a8a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
> @@ -390,9 +390,10 @@ mt7996_init_wiphy(struct ieee80211_hw *hw, struct mtk_wed_device *wed)
>  	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
>  	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_MU_MIMO_AIR_SNIFFER);
>  
> -	if (!mdev->dev->of_node ||
> -	    !of_property_read_bool(mdev->dev->of_node,
> -				   "mediatek,disable-radar-background"))
> +	if (mt7996_has_background_radar(phy->dev) &&
> +	    (!mdev->dev->of_node ||
> +	     !of_property_read_bool(mdev->dev->of_node,
> +				    "mediatek,disable-radar-background")))
>  		wiphy_ext_feature_set(wiphy,
>  				      NL80211_EXT_FEATURE_RADAR_BACKGROUND);
>  
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> index 3f3278f43c79..9aec97dd81d9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> @@ -447,6 +447,25 @@ mt7996_band_valid(struct mt7996_dev *dev, u8 band)
>  	return band <= MT_BAND2;
>  }
>  
> +static inline bool
> +mt7996_has_background_radar(struct mt7996_dev *dev)
> +{
> +	switch (mt76_chip(&dev->mt76)) {
> +	case 0x7990:
> +		if (dev->var.type == MT7996_VAR_TYPE_233)
> +			return false;
> +		break;
> +	case 0x7992:
> +		if (dev->var.type == MT7992_VAR_TYPE_23)
> +			return false;
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  extern const struct ieee80211_ops mt7996_ops;
>  extern struct pci_driver mt7996_pci_driver;
>  extern struct pci_driver mt7996_hif_driver;
> -- 
> 2.39.2
> 

