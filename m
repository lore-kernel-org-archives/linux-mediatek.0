Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E55C54E49
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 16:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvsM7R7kzz8cIO1kpeGZawLx8Zf/+pjs2xP3K6CyekI=; b=iMAt+jmZRIjOA13aaMiEn0PtLj
	ilneBiDRubhgzGmOLPOfwuc9VgBvFTwh5UoQKZiIUHZtOhUEgwHAILKn1s7lWDUIhtRH5x4c6QeDr
	Q9AbMraj2x3ahvwdHfIkSzi7D2A2rgqStCL344NqTIZSKHu5ciF31L8yo/LftM+A9oKYOX8shEjmh
	ErTM25SaBqgzYyJsK5ELD8BpMOQPxDZV1tFzR1Ryt1h7zwWKkkM3JlXV0RG5jF6GPVltgSJj8QV6H
	nfNiXvdfN4V0g7Z6jFNwDk0wszPFRmkqyNZgVGTS7fIFIoRLmTfWRUaXQqrlJAhlCfy8thd8OtIGQ
	lQo93hwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riGhk-00000005VXY-1g48;
	Thu, 07 Mar 2024 16:34:48 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.183])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riGhg-00000005VVU-1WX7
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Mar 2024 16:34:46 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id C94258C0090;
	Thu,  7 Mar 2024 16:34:35 +0000 (UTC)
Received: from [192.168.100.159] (unknown [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 5FD8713C2B0;
	Thu,  7 Mar 2024 08:34:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 5FD8713C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1709829275;
	bh=HEl67rgBltv239sfOcJC9NNvrvRy/R4jqdWdd3+mDrg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WRAaaX7C1watv5wxRHh6ihR0fiEJsvelFnc8C7O5PuaDtBk+9BLOpGxFM3RS/fdrb
	 bfs3taFseSoIBQN6iRCSvvd9fHOM2y65HQB4AEDYCxZbW+liEnFFpAKdkjag3ghikT
	 DGaq+LJYjO/jUpGaASSLE74l1fP0Gp9H+Uz3HZn8=
Message-ID: <fcaf3039-e1ea-cd82-07d8-2aa33544edfa@candelatech.com>
Date: Thu, 7 Mar 2024 08:34:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] wifi: mt76: mt7921s: fix potential hung tasks during chip
 recovery
Content-Language: en-US
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>, nbd@nbd.name,
 lorenzo@kernel.org
Cc: deren.wu@mediatek.com, Sean.Wang@mediatek.com, Soul.Huang@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com, Shayne.Chen@mediatek.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240307094632.21638-1-mingyen.hsieh@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <20240307094632.21638-1-mingyen.hsieh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1709829278-ek1p80uEYpVq
X-MDID-O: us5;at1;1709829278;ek1p80uEYpVq;<greearb@candelatech.com>;4565bb147eaa37fbc7c729da17b34891
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_083444_503412_1AD47D61 
X-CRM114-Status: GOOD (  20.89  )
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

On 3/7/24 01:46, Mingyen Hsieh wrote:
> From: Leon Yen <leon.yen@mediatek.com>
> 
> During chip recovery (e.g. chip reset), there is a possible situation that
> kernel worker reset_work is holding the lock and waiting for kernel thread
> stat_worker to be parked, while stat_worker is waiting for the release of
> the same lock.
> It causes a deadlock resulting in the dumping of hung tasks messages and
> possible rebooting of the device.
> 
> This patch prevents the execution of stat_worker during the chip recovery.

Hello,

I was able to hang my 7996 system doing a radio reset yesterday.  Is this same
or similar fix needed for 7996?

Thanks
Ben

> 
> Signed-off-by: Leon Yen <leon.yen@mediatek.com>
> Signed-off-by: Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>
> ---
>   drivers/net/wireless/mediatek/mt76/mt7921/mac.c      | 2 ++
>   drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c  | 2 --
>   drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c | 2 --
>   drivers/net/wireless/mediatek/mt76/sdio.c            | 3 ++-
>   4 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> index 867e14f6b93a..73e42ef42983 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -663,6 +663,7 @@ void mt7921_mac_reset_work(struct work_struct *work)
>   	int i, ret;
>   
>   	dev_dbg(dev->mt76.dev, "chip reset\n");
> +	set_bit(MT76_RESET, &dev->mphy.state);
>   	dev->hw_full_reset = true;
>   	ieee80211_stop_queues(hw);
>   
> @@ -691,6 +692,7 @@ void mt7921_mac_reset_work(struct work_struct *work)
>   	}
>   
>   	dev->hw_full_reset = false;
> +	clear_bit(MT76_RESET, &dev->mphy.state);
>   	pm->suspended = false;
>   	ieee80211_wake_queues(hw);
>   	ieee80211_iterate_active_interfaces(hw,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> index c866144ff061..031ba9aaa4e2 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> @@ -64,7 +64,6 @@ int mt7921e_mac_reset(struct mt792x_dev *dev)
>   	mt76_wr(dev, dev->irq_map->host_irq_enable, 0);
>   	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0x0);
>   
> -	set_bit(MT76_RESET, &dev->mphy.state);
>   	set_bit(MT76_MCU_RESET, &dev->mphy.state);
>   	wake_up(&dev->mt76.mcu.wait);
>   	skb_queue_purge(&dev->mt76.mcu.res_q);
> @@ -115,7 +114,6 @@ int mt7921e_mac_reset(struct mt792x_dev *dev)
>   
>   	err = __mt7921_start(&dev->phy);
>   out:
> -	clear_bit(MT76_RESET, &dev->mphy.state);
>   
>   	local_bh_disable();
>   	napi_enable(&dev->mt76.tx_napi);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
> index 389eb0903807..1f77cf71ca70 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
> @@ -98,7 +98,6 @@ int mt7921s_mac_reset(struct mt792x_dev *dev)
>   	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
>   	mt76_txq_schedule_all(&dev->mphy);
>   	mt76_worker_disable(&dev->mt76.tx_worker);
> -	set_bit(MT76_RESET, &dev->mphy.state);
>   	set_bit(MT76_MCU_RESET, &dev->mphy.state);
>   	wake_up(&dev->mt76.mcu.wait);
>   	skb_queue_purge(&dev->mt76.mcu.res_q);
> @@ -135,7 +134,6 @@ int mt7921s_mac_reset(struct mt792x_dev *dev)
>   
>   	err = __mt7921_start(&dev->phy);
>   out:
> -	clear_bit(MT76_RESET, &dev->mphy.state);
>   
>   	mt76_worker_enable(&dev->mt76.tx_worker);
>   
> diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
> index 3e88798df017..a4ed00eebc48 100644
> --- a/drivers/net/wireless/mediatek/mt76/sdio.c
> +++ b/drivers/net/wireless/mediatek/mt76/sdio.c
> @@ -499,7 +499,8 @@ static void mt76s_tx_status_data(struct mt76_worker *worker)
>   	dev = container_of(sdio, struct mt76_dev, sdio);
>   
>   	while (true) {
> -		if (test_bit(MT76_REMOVED, &dev->phy.state))
> +		if (test_bit(MT76_RESET, &dev->phy.state) ||
> +		    test_bit(MT76_REMOVED, &dev->phy.state))
>   			break;
>   
>   		if (!dev->drv->tx_status_data(dev, &update))

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



