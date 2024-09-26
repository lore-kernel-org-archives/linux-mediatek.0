Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F00CDE00B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsNPFCqpM28aXAOak52bgpJyFL7FX3dLkyizIG/Oa3w=; b=I2Pn01LfGZF0bzpJkwhmbsMalm
	kOrg6K3JZ5gvbNVVXq8xJYWQjt+6fnGSF70dwHquOHete2r6U5BcpYNMfE7fQ4dN4UJMb5qe1XN3G
	ZeBDRZ/nD7G295yvL/lSC8PPZkYHyXPeruEbZZ4tKCRMSfi5v9WVT1jryudpEYtmXFSB08t5sso9R
	fNqpEOcbhaTP4/4OGoLTbmDd0KQuPYExn0o8nAqzLCYkyzO/7/I0dij+RXCJaMfVvDOfGhvFK6wfz
	KoU+HgX31Q+Ln5tQDDrGQrsKQSIYr//KCYYhPQRG43ACcQTVun3eDJpqEb6o76kJQvAIy1+uwxbIa
	NqeVQfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stpFp-00000008Ydt-0715;
	Thu, 26 Sep 2024 14:14:01 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stpFm-00000008YdS-0u9d
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Sep 2024 14:13:59 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1stpFg-000000005jn-1lUu;
	Thu, 26 Sep 2024 14:13:52 +0000
Date: Thu, 26 Sep 2024 15:13:44 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Subject: Re: [PATCH 1/3] wifi: mt76: mt7996: extend flexibility of
 mt7996_mcu_get_eeprom()
Message-ID: <ZvVsGKmHHX2q_HRx@makrotopia.org>
References: <20240926032440.15978-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926032440.15978-1-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_071358_276755_E271E009 
X-CRM114-Status: GOOD (  20.56  )
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

On Thu, Sep 26, 2024 at 11:24:38AM +0800, Shayne Chen wrote:
> Support passing customized buffer pointer and length to
> mt7996_mcu_get_eeprom().
> 
> This is the preparation for adding more variants support which needs to
> prefetch FEM module from efuse, and also fixes potential OOB issue when
> reading the last efuse block.
> 
> Co-developed-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>

Tested-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c |  9 +++++++--
>  drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 14 ++++++++++----
>  drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  2 +-
>  3 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
> index 4a8237118287..861aba68a725 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
> @@ -86,8 +86,13 @@ static int mt7996_eeprom_load(struct mt7996_dev *dev)
>  		/* read eeprom data from efuse */
>  		block_num = DIV_ROUND_UP(MT7996_EEPROM_SIZE, eeprom_blk_size);
>  		for (i = 0; i < block_num; i++) {
> -			ret = mt7996_mcu_get_eeprom(dev, i * eeprom_blk_size);
> -			if (ret < 0)
> +			u32 len = eeprom_blk_size;
> +
> +			if (i == block_num - 1)
> +				len = MT7996_EEPROM_SIZE % eeprom_blk_size;
> +			ret = mt7996_mcu_get_eeprom(dev, i * eeprom_blk_size,
> +						    NULL, len);
> +			if (ret && ret != -EINVAL)
>  				return ret;
>  		}
>  	}
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> index 327337b31279..fa7832f625d7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -3548,7 +3548,7 @@ int mt7996_mcu_set_eeprom(struct mt7996_dev *dev)
>  				 &req, sizeof(req), true);
>  }
>  
> -int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset)
> +int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset, u8 *buf, u32 buf_len)
>  {
>  	struct {
>  		u8 _rsv[4];
> @@ -3577,15 +3577,21 @@ int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset)
>  	valid = le32_to_cpu(*(__le32 *)(skb->data + 16));
>  	if (valid) {
>  		u32 addr = le32_to_cpu(*(__le32 *)(skb->data + 12));
> -		u8 *buf = (u8 *)dev->mt76.eeprom.data + addr;
> +
> +		if (!buf)
> +			buf = (u8 *)dev->mt76.eeprom.data + addr;
> +		if (!buf_len || buf_len > MT7996_EEPROM_BLOCK_SIZE)
> +			buf_len = MT7996_EEPROM_BLOCK_SIZE;
>  
>  		skb_pull(skb, 48);
> -		memcpy(buf, skb->data, MT7996_EEPROM_BLOCK_SIZE);
> +		memcpy(buf, skb->data, buf_len);
> +	} else {
> +		ret = -EINVAL;
>  	}
>  
>  	dev_kfree_skb(skb);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  int mt7996_mcu_get_eeprom_free_block(struct mt7996_dev *dev, u8 *block_num)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> index ab8c9070630b..55aa5f6ab77d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> @@ -476,7 +476,7 @@ int mt7996_mcu_set_fixed_rate_ctrl(struct mt7996_dev *dev,
>  int mt7996_mcu_set_fixed_field(struct mt7996_dev *dev, struct ieee80211_vif *vif,
>  			       struct ieee80211_sta *sta, void *data, u32 field);
>  int mt7996_mcu_set_eeprom(struct mt7996_dev *dev);
> -int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset);
> +int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset, u8 *buf, u32 buf_len);
>  int mt7996_mcu_get_eeprom_free_block(struct mt7996_dev *dev, u8 *block_num);
>  int mt7996_mcu_get_chip_config(struct mt7996_dev *dev, u32 *cap);
>  int mt7996_mcu_set_ser(struct mt7996_dev *dev, u8 action, u8 set, u8 band);
> -- 
> 2.39.2
> 

