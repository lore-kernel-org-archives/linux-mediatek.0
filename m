Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CC8D2ECF7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXlkCz4y5qXqKXvPxps5UgUbIrX1DfRJdmkrRqQ0Dao=; b=itT2jHqP1bkzcRtapAWjDXCczv
	Q13T/ofKFNWvKnvM6AjtbzBxLB8jgkfGkk8PLvxOkS+KPqfnPZLZtf6DN83R+gKfm++OOqYrfvS58
	HpmNmchbgqSTFjvWZlcj7ZPh4tPHOsC5w75XS0QUNgVBX4npZmwCSv1FPnQqFmMh9cS0cii+nVSGo
	/4DA8fE4JGwDumUJzWlTRigVrYVHb/DsllNvCH1bMTf0NJ8jOEp4zc0VgZ2smyl6G+OfRs98CxPCb
	EKYoh/gM0LaRidF8X/IbSQGh47bnM0NsW/tK4mmSt7NVPF3dyqZWTOKtg3H0i9YFEuoLspBvbwB5z
	6RVMNAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5nD-00000003KAE-2VMB;
	Tue, 20 Jan 2026 07:04:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5nC-00000003KA6-2IX1
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 07:04:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F429600C3;
	Tue, 20 Jan 2026 07:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9497AC16AAE;
	Tue, 20 Jan 2026 07:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768892685;
	bh=hga3ue21UWAE2W0mgxOLtL/aZcuRm+XpQziyEdU1Vj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFTVyrb1xZIs2ufmuCCwRtf8OB8cRTfjy1Uxdju53XAZ+iTO4curPLJZKihuep/f0
	 FeljExq3kaoHiP0+Di24J92psqJ6EvSvgFWh+fSfsQCoKjYNltRX5LYUFCOjyLCRBI
	 NxUxCn5f25fhBY75qQjerpVu1WlfBSr34BFS6OXM=
Date: Tue, 20 Jan 2026 08:04:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zac <zac@zacbowling.com>
Cc: sean.wang@kernel.org, deren.wu@mediatek.com, kvalo@kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org, lorenzo@kernel.org, nbd@nbd.name,
	ryder.lee@mediatek.com, sean.wang@mediatek.com,
	stable@vger.kernel.org, linux@frame.work, zbowling@gmail.com
Subject: Re: [PATCH 02/11] wifi: mt76: mt792x: fix NULL pointer and firmware
 reload issues
Message-ID: <2026012028-barmaid-ouch-e53b@gregkh>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260120062854.126501-1-zac@zacbowling.com>
 <20260120062854.126501-3-zac@zacbowling.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120062854.126501-3-zac@zacbowling.com>
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

On Mon, Jan 19, 2026 at 10:28:45PM -0800, Zac wrote:
> From: Zac Bowling <zac@zacbowling.com>
> 
> This patch combines two fixes for the shared mt792x code used by both
> MT7921 and MT7925 drivers:
> 
> 1. Fix NULL pointer dereference in TX path:
> 
> Add NULL pointer checks in mt792x_tx() to prevent kernel crashes when
> transmitting packets during MLO link removal.
> 
> The function calls mt792x_sta_to_link() which can return NULL if the
> link is being removed, but the return value was dereferenced without
> checking. Similarly, the RCU-protected link_conf and link_sta pointers
> were used without NULL validation.
> 
> This race can occur when:
> - A packet is queued for transmission
> - Concurrently, the link is being removed (mt7925_mac_link_sta_remove)
> - mt792x_sta_to_link() returns NULL for the removed link
> - Kernel crashes on wcid = &mlink->wcid dereference
> 
> Fix by checking mlink, conf, and link_sta before use, freeing the SKB
> and returning early if any pointer is NULL.
> 
> 2. Fix firmware reload failure after previous load crash:
> 
> If the firmware loading process crashes or is interrupted after
> acquiring the patch semaphore but before releasing it, subsequent
> firmware load attempts will fail with 'Failed to get patch semaphore'.
> 
> Apply the same fix from MT7915 (commit 79dd14f): release the patch
> semaphore before starting firmware load and restart MCU firmware to
> ensure clean state.
> 
> Fixes: c74df1c067f2 ("wifi: mt76: mt792x: introduce mt792x-lib module")
> Fixes: 583204ae70f9 ("wifi: mt76: mt792x: move mt7921_load_firmware in mt792x-lib module")
> Link: https://github.com/openwrt/mt76/commit/79dd14f2e8161b656341b6653261779199aedbe4
> Signed-off-by: Zac Bowling <zac@zacbowling.com>
> ---
>  .../net/wireless/mediatek/mt76/mt792x_core.c  | 27 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> index f2ed16feb6c1..05598202b488 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> @@ -95,6 +95,8 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
>  				       IEEE80211_TX_CTRL_MLO_LINK);
>  		sta = (struct mt792x_sta *)control->sta->drv_priv;
>  		mlink = mt792x_sta_to_link(sta, link_id);
> +		if (!mlink)
> +			goto free_skb;
>  		wcid = &mlink->wcid;
>  	}
>  
> @@ -113,9 +115,12 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
>  		link_id = wcid->link_id;
>  		rcu_read_lock();
>  		conf = rcu_dereference(vif->link_conf[link_id]);
> -		memcpy(hdr->addr2, conf->addr, ETH_ALEN);
> -
>  		link_sta = rcu_dereference(control->sta->link[link_id]);
> +		if (!conf || !link_sta) {
> +			rcu_read_unlock();
> +			goto free_skb;
> +		}
> +		memcpy(hdr->addr2, conf->addr, ETH_ALEN);
>  		memcpy(hdr->addr1, link_sta->addr, ETH_ALEN);
>  
>  		if (vif->type == NL80211_IFTYPE_STATION)
> @@ -136,6 +141,10 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
>  	}
>  
>  	mt76_connac_pm_queue_skb(hw, &dev->pm, wcid, skb);
> +	return;
> +
> +free_skb:
> +	ieee80211_free_txskb(hw, skb);
>  }
>  EXPORT_SYMBOL_GPL(mt792x_tx);
>  
> @@ -927,6 +936,20 @@ int mt792x_load_firmware(struct mt792x_dev *dev)
>  {
>  	int ret;
>  
> +	/* Release semaphore if taken by previous failed load attempt.
> +	 * This prevents "Failed to get patch semaphore" errors when
> +	 * recovering from firmware crashes or suspend/resume failures.
> +	 */
> +	ret = mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, false);
> +	if (ret < 0)
> +		dev_dbg(dev->mt76.dev, "Semaphore release returned %d (may be expected)\n", ret);
> +
> +	/* Always restart MCU to ensure clean state before loading firmware */
> +	mt76_connac_mcu_restart(&dev->mt76);
> +
> +	/* Wait for MCU to be ready after restart */
> +	msleep(100);
> +
>  	ret = mt76_connac2_load_patch(&dev->mt76, mt792x_patch_name(dev));
>  	if (ret)
>  		return ret;
> -- 
> 2.52.0
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

