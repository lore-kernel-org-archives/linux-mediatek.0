Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADCAC2B9F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 13:07:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72A4E613B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 13:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72A4E613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U7eXGh5dQuuAABTzDti5fs78m6J7mBv1FIzHDZ2+bxg=; b=CnvZMPX+m/4UlSTOhQ6OLfqUaS
	4/X/+tkmc6mwmtHJ4UpP8WykF9E5SrC0GnVrzCWFY+sgcnVZWd+/QUVilNOIzI27hEPQXiB7MHUoE
	7zpw8dqJN7F8H9zmpewFQZATUw/7lHHBdaDXkZHW6IjXqR3OFcUgqXNn6j2TFLXpn8wMqfnkNijav
	RydWwP00ACS+7MkBhUcCTB5sh2pRO26euzUka0gsYe49t7wJRS97dLlTVgM/gtyFBWgRqvW9+Xkqg
	zkGVjvA2qUdRPsiMrU8QWdUAMlyE0mZvVyBfLHj6s7c2bgUSIk8LYs+rBgziucV9IBrzB7FXgEWSw
	deguWIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmcCt-00Fdm0-9f; Fri, 28 May 2021 13:07:19 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmbxY-00FWte-LP
 for linux-mediatek@lists.infradead.org; Fri, 28 May 2021 12:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k/+M1sKBjC5GKmu+DERy9KJMuRoPW65z3WcZazvAzLk=; b=ZJHkyfb+eZ0z8u5lusZGKChf9m
 J5bukcQzpxfIc0ukldOZ8Ue8JCuacXVtOiTxhErPOXP91OQcvIF679C915Q7u6UvgiDDjC2MzvBPD
 w01AmrTIf2rnk/svLSQtkvImMBZc6vAdZ8ZFuQ8rrsyVgY76G1lMQjbQeEb7E98FdJKI=;
Received: from p54ae9ff2.dip0.t-ipconnect.de ([84.174.159.242] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lmbxS-0003Ki-PW; Fri, 28 May 2021 14:51:22 +0200
To: sean.wang@mediatek.com, lorenzo.bianconi@redhat.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com, jemele@google.com,
 yenlinlai@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
 <1620659697-12048-4-git-send-email-sean.wang@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 4/9] mt76: mt7921: enable deep sleep at runtime
Message-ID: <6020930d-14dd-4150-3d91-454128bb9fc7@nbd.name>
Date: Fri, 28 May 2021 14:51:21 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1620659697-12048-4-git-send-email-sean.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_055129_050739_63445796 
X-CRM114-Status: GOOD (  21.97  )
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


Hi Sean,

On 2021-05-10 17:14, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Enable the deep sleep mode with that firmware is able to trap into
> the doze state at runtime to reduce the power consumption further.
> 
> The deep sleep mode is not allowed in the STA state transition with
> the firmware to have the fast connection experience as we've done in
> the full power mode
> 
> Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 20 +++++++++++++
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  3 ++
>  .../net/wireless/mediatek/mt76/mt7921/init.c  |  6 +++-
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 28 +++++++++++++++++--
>  4 files changed, 54 insertions(+), 3 deletions(-)
> 
>  void mt7921_unregister_device(struct mt7921_dev *dev)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> index 39b3e769925e..5dbccbefe047 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -848,6 +848,31 @@ mt7921_sta_remove(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
>  			      IEEE80211_STA_NOTEXIST);
>  }
>  
> +static int mt7921_sta_state(struct ieee80211_hw *hw,
> +			    struct ieee80211_vif *vif,
> +			    struct ieee80211_sta *sta,
> +			    enum ieee80211_sta_state old_state,
> +			    enum ieee80211_sta_state new_state)
> +{
> +	struct mt7921_dev *dev = mt7921_hw_dev(hw);
> +
> +	if (dev->pm.enable) {
> +		mt7921_mutex_acquire(dev);
> +		mt76_connac_sta_state_dp(&dev->mt76, old_state, new_state);
> +		mt7921_mutex_release(dev);
> +	}
> +
> +	if (old_state == IEEE80211_STA_AUTH &&
> +	    new_state == IEEE80211_STA_ASSOC) {
> +		return mt7921_sta_add(hw, vif, sta);
> +	} else if (old_state == IEEE80211_STA_ASSOC &&
> +		   new_state == IEEE80211_STA_AUTH) {
> +		return mt7921_sta_remove(hw, vif, sta);
> +	}
> +
> +	return 0;
> +}
> +
>  static int
>  mt7921_get_stats(struct ieee80211_hw *hw,
>  		 struct ieee80211_low_level_stats *stats)
> @@ -1191,8 +1216,7 @@ const struct ieee80211_ops mt7921_ops = {
>  	.conf_tx = mt7921_conf_tx,
>  	.configure_filter = mt7921_configure_filter,
>  	.bss_info_changed = mt7921_bss_info_changed,
> -	.sta_add = mt7921_sta_add,
> -	.sta_remove = mt7921_sta_remove,
> +	.sta_state = mt7921_sta_state,
>  	.sta_pre_rcu_remove = mt76_sta_pre_rcu_remove,
>  	.set_key = mt7921_set_key,
>  	.sta_set_decap_offload = mt7921_sta_set_decap_offload,
Unfortunately, we can't switch from sta_add/remove to .sta_state here.
When .sta_state is implemented, mac80211 assumes that the station entry
is usable after the NOTEXIST->NONE transition, while the driver state is
only created after the AUTH->ASSOC transition.

Can you please send a fix, or a replacement patch?

Thanks,

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
