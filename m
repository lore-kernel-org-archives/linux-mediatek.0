Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B98EC04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 04:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGqErloYwrbXUxMLMFvmaAe2Hxyh/wgUo5745N2j3QY=; b=x2FUkFMDCIbTNKg7JpHPElzFah
	GwYIW/U6WTboScseNkbO4mWdlGXk2URHToxaCBp7JyEud+/jaiycMMY5T5bydCIWhs3skyt6Urx7P
	KdPygGxe/vyU4sYpe1iM/YRltGwORoI6bqKqtWhZIrCssp9HNZQ9Yc3sdolsTe1/gKOV6WAhOv/GS
	Y89CODC0ekSsOZhS63XFiWDVlYCaKn77nZhH7PdCbdae969hCohqQ34QHT5cohzI2GLllEuTsFGeH
	JH/PhPEf8ahiiY1ksyFu8kCujgIWeV4m6ig4uiYEpKlr1YKk1NQrZsQc0xHjzIaDw9vUZjScfYBMh
	mHyveKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRQPH-006eSl-2B;
	Thu, 03 Aug 2023 04:57:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRQPE-006eSM-33
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 04:57:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2BFE761BB6;
	Thu,  3 Aug 2023 04:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDE8C433C8;
	Thu,  3 Aug 2023 04:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691038667;
	bh=yew0nIIdv5+4cZdHKECsN2/+DIEEPUIsBer6rmfZnuQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=sZfGRrT+SOUTRe8tt6a0byCjSYAkLQ+OIBSAyZzxMVkpnzuynGE8YsPTu+xOyZP3p
	 hkrqR15pNZOVnRaV16erWiKaDOt3iftzNWAsvwre5cpPlHOV/32O3b34tn2Q0jAsMi
	 3qnKBtOyc3rf6Ic9LW6SsmRxyZ/Qvj7qBXdAhgxwA3JQtLT+2xgdNpY4RqaJzamb9Y
	 n3tWEy9MblzCaO1VK9Lh+ZHNgggafqeuPyZC6T9AsInpj5qaYybmFYqvQ/60+sa+XJ
	 VTxNePln3pYzM2GfdrrYh2aoY/rvWSbVOYGQnllU0XZdMeU9lCYZZB0A7c15eIir9f
	 21jGc3tjyvxSQ==
From: Kalle Valo <kvalo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  <linux-wireless@vger.kernel.org>,
  Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,  Shayne Chen
 <shayne.chen@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,
  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] wifi: mt76: mt7915: enable BSS_CHANGED_MU_GROUPS support
References: <ff63866d7d62d088edd4a9f7587320f8f59a361f.1690999957.git.ryder.lee@mediatek.com>
Date: Thu, 03 Aug 2023 07:58:07 +0300
In-Reply-To: <ff63866d7d62d088edd4a9f7587320f8f59a361f.1690999957.git.ryder.lee@mediatek.com>
	(Ryder Lee's message of "Thu, 3 Aug 2023 02:49:44 +0800")
Message-ID: <87bkfozpr4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_215749_055170_8D88A5E4 
X-CRM114-Status: GOOD (  16.08  )
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

Ryder Lee <ryder.lee@mediatek.com> writes:

> The Group ID Management frame is an Action frame of category VHT.
> It is transmitted by the AP to assign or change the user position
> of a STA for one or more group IDs.
>
> Also, sniffer can use a given group id to monitor STA that belongs
> to that group.
>
> Notify underlying driver of changes via BSS_CHANGED_MU_GROUPS.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Change-Id: I3d2f5508a2b6eb7c929c3997c31a9285713c8bea

No Change-Id, please.

> --- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> @@ -593,6 +593,34 @@ mt7915_update_bss_color(struct ieee80211_hw *hw,
>  	}
>  }
>  
> +static void
> +mt7915_update_mu_group(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
> +		       struct ieee80211_bss_conf *info)
> +{
> +	struct mt7915_phy *phy = mt7915_hw_phy(hw);
> +	struct mt7915_dev *dev = mt7915_hw_dev(hw);
> +	u8 i, band = phy->mt76->band_idx;
> +	u32 *mu;
> +
> +	mu = (u32 *)info->mu_group.membership;

Is this safe on big endian?

> +	for (i = 0; i < WLAN_MEMBERSHIP_LEN / sizeof(*mu); i++) {
> +		if (is_mt7916(&dev->mt76))
> +			mt76_wr(dev, MT_WF_PHY_RX_GID_TAB_VLD_MT7916(band, i),
> +				mu[i]);
> +		else
> +			mt76_wr(dev, MT_WF_PHY_RX_GID_TAB_VLD(band, i), mu[i]);
> +	}
> +
> +	mu = (u32 *)info->mu_group.position;

And this?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

