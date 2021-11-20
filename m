Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6766C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Nov 2021 20:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Zf+kJgvkeJtt7TfuBqVg1++O78S30255W5+m3TcQyM=; b=n2SxTUk2GkGefi
	uFiR34HQszCtoMfkVawySUPO9+iXhen8KCif2SdwH48WvU7tX13VKmBmK5qBZRxMb9M9muRWfVOTM
	PZ3FB3+aFa326L7MNrv4FcD6YCE0ndsc1IiOmHrAoHdoCEFvZNNUVnBBmWQ7Hmb/vQki13HKdZx24
	6Fr/0SRiuzDZEfhQlXsMlQ5bN8NRYLnX1NPhOZjHEc//8gzmQh+BROizUgX5ugQjZSbnXK+sA/m20
	4ECCGxE3DwF1qLu644L4uOBcauQ4RK8sNv/HTwAmts7qEq7v/oqi/utw5+cTINuADSG43QD7yfWsQ
	ERxu+4utLVc7CzUPRiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moWzQ-00CwV2-4L; Sat, 20 Nov 2021 20:29:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moWzL-00CwUD-5E
 for linux-mediatek@lists.infradead.org; Sat, 20 Nov 2021 20:29:34 +0000
X-UUID: 81cd273617ef436d825bccd4eda52c52-20211120
X-UUID: 81cd273617ef436d825bccd4eda52c52-20211120
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 553635234; Sat, 20 Nov 2021 13:29:25 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 20 Nov 2021 12:29:24 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Nov 2021 04:29:22 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 21 Nov 2021 04:29:22 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo.bianconi@redhat.com>
CC: <nbd@nbd.name>, <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
 <frankgor@google.com>, <jemele@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/2] mt76: mt7921s: fix the device cannot sleep deeply in
 suspend
Date: Sun, 21 Nov 2021 04:29:21 +0800
Message-ID: <1637440161-1946-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YZkDmDIqnePjIF+O@lore-desk--annotate>
References: <YZkDmDIqnePjIF+O@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_122931_244810_C7FC0147 
X-CRM114-Status: GOOD (  30.49  )
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

From: Sean Wang <sean.wang@mediatek.com>

>> > From: Sean Wang <sean.wang@mediatek.com>
>> >
>> > According to the MT7921S firmware, the cmd MCU_UNI_CMD_HIF_CTRL have
>> > to be last MCU command to execute in suspend handler and all data
>> > traffic have to be stopped before the cmd MCU_UNI_CMD_HIF_CTRL
>> > starts as well in order that mt7921 can successfully fall into the deep sleep mode.
>> >
>> > Where we reuse the flag MT76_STATE_SUSPEND and avoid creating
>> > another global flag to stop all of the traffic onto the SDIO bus.
>> >
>> > Fixes: 48fab5bbef40 ("mt76: mt7921: introduce mt7921s support")
>> > Reported-by: Leon Yen <leon.yen@mediatek.com>
>> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> > ---
>> >  .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  2 +-
>> > .../net/wireless/mediatek/mt76/mt7921/main.c  |  3 --
>> > .../net/wireless/mediatek/mt76/mt7921/sdio.c  | 34 ++++++++++++-------
>> >  drivers/net/wireless/mediatek/mt76/sdio.c     |  3 +-
>> >  .../net/wireless/mediatek/mt76/sdio_txrx.c    |  3 +-
>> >  5 files changed, 27 insertions(+), 18 deletions(-)
>> >
>> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> > index 26b4b875dcc0..61c4c86e79c8 100644
>> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> > @@ -2461,7 +2461,7 @@ void mt76_connac_mcu_set_suspend_iter(void *priv, u8 *mac,
>> >				      struct ieee80211_vif *vif)  {
>> >	struct mt76_phy *phy = priv;
>> > -	bool suspend = test_bit(MT76_STATE_SUSPEND, &phy->state);
>> > +	bool suspend = !test_bit(MT76_STATE_RUNNING, &phy->state);
>> >	struct ieee80211_hw *hw = phy->hw;
>> >	struct cfg80211_wowlan *wowlan = hw->wiphy->wowlan_config;
>> >	int i;
>> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> > b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> > index e022251b4006..0b2a6b7f22ea 100644
>> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
>> > @@ -1242,8 +1242,6 @@ static int mt7921_suspend(struct ieee80211_hw *hw,
>> >	mt7921_mutex_acquire(dev);
>> >
>> >	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
>> > -
>> > -	set_bit(MT76_STATE_SUSPEND, &phy->mt76->state);
>> >	ieee80211_iterate_active_interfaces(hw,
>> >					    IEEE80211_IFACE_ITER_RESUME_ALL,
>> >					    mt76_connac_mcu_set_suspend_iter, @@ -1262,7 +1260,6 @@
>> > static int mt7921_resume(struct ieee80211_hw *hw)
>> >	mt7921_mutex_acquire(dev);
>> >
>> >	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
>> > -	clear_bit(MT76_STATE_SUSPEND, &phy->mt76->state);
>> >	ieee80211_iterate_active_interfaces(hw,
>> >					    IEEE80211_IFACE_ITER_RESUME_ALL,
>> >					    mt76_connac_mcu_set_suspend_iter, diff --git
>> > a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
>> > b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
>> > index 5fee489c7a99..5c88b6b8d097 100644
>> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
>> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
>> > @@ -206,6 +206,8 @@ static int mt7921s_suspend(struct device *__dev)
>> >	int err;
>> >
>> >	pm->suspended = true;
>> > +	set_bit(MT76_STATE_SUSPEND, &mdev->phy.state);
>> > +
>> >	cancel_delayed_work_sync(&pm->ps_work);
>> >	cancel_work_sync(&pm->wake_work);
>> >
>> > @@ -213,10 +215,6 @@ static int mt7921s_suspend(struct device *__dev)
>> >	if (err < 0)
>> >		goto restore_suspend;
>> >
>> > -	err = mt76_connac_mcu_set_hif_suspend(mdev, true);
>> > -	if (err)
>> > -		goto restore_suspend;
>> > -
>> >	/* always enable deep sleep during suspend to reduce
>> >	 * power consumption
>> >	 */
>> > @@ -224,34 +222,45 @@ static int mt7921s_suspend(struct device
>> > *__dev)
>> >
>> >	mt76_txq_schedule_all(&dev->mphy);
>> >	mt76_worker_disable(&mdev->tx_worker);
>> > -	mt76_worker_disable(&mdev->sdio.txrx_worker);
>> >	mt76_worker_disable(&mdev->sdio.status_worker);
>> > -	mt76_worker_disable(&mdev->sdio.net_worker);
>> >	cancel_work_sync(&mdev->sdio.stat_work);
>> >	clear_bit(MT76_READING_STATS, &dev->mphy.state);
>> > -
>> >	mt76_tx_status_check(mdev, true);
>> >
>> > -	err = mt7921_mcu_fw_pmctrl(dev);
>> > +	mt76_worker_schedule(&mdev->sdio.txrx_worker);
>>
>> I guess mt76_worker_disable() is supposed to do it, right?
>> I guess we can assume txrx_worker is no longer running here, right?
>
>I can see it now, txrx_worker can be running on the different cpu.
>I guess we need to add just the wait_event_timeout() and move
>mt76_connac_mcu_set_hif_suspend() below. What do you think?
>Can you please try the chunk below?

mt76_connac_mcu_set_hif_suspend have to rely on txrx_worker and net_worker to
send the command MCU_UNI_CMD_HIF_CTRL and receive the corresponding event,
so that is why we cannnot disable txrx_worker and net_worker with mt76_worker_disable
until the mt76_connac_mcu_set_hif_suspend is done.

>
>Regards,
>Lorenzo
>
>>
>> > +	wait_event_timeout(dev->mt76.sdio.wait,
>> > +			   mt76s_txqs_empty(&dev->mt76), 5 * HZ);
>> > +
>> > +	/* It is supposed that SDIO bus is idle at the point */
>> > +	err = mt76_connac_mcu_set_hif_suspend(mdev, true);
>> >	if (err)
>> >		goto restore_worker;
>> >
>> > +	mt76_worker_disable(&mdev->sdio.txrx_worker);
>> > +	mt76_worker_disable(&mdev->sdio.net_worker);
>> > +
>> > +	err = mt7921_mcu_fw_pmctrl(dev);
>> > +	if (err)
>> > +		goto restore_txrx_worker;
>> > +
>> >	sdio_set_host_pm_flags(func, MMC_PM_KEEP_POWER);
>> >
>> >	return 0;
>> >
>> > +restore_txrx_worker:
>> > +	mt76_worker_enable(&mdev->sdio.net_worker);
>> > +	mt76_worker_enable(&mdev->sdio.txrx_worker);
>> > +	mt76_connac_mcu_set_hif_suspend(mdev, false);
>> > +
>> >  restore_worker:
>> >	mt76_worker_enable(&mdev->tx_worker);
>> > -	mt76_worker_enable(&mdev->sdio.txrx_worker);
>> >	mt76_worker_enable(&mdev->sdio.status_worker);
>> > -	mt76_worker_enable(&mdev->sdio.net_worker);
>> >
>> >	if (!pm->ds_enable)
>> >		mt76_connac_mcu_set_deep_sleep(mdev, false);
>> >
>> > -	mt76_connac_mcu_set_hif_suspend(mdev, false);
>> > -
>> >  restore_suspend:
>> > +	clear_bit(MT76_STATE_SUSPEND, &mdev->phy.state);
>> >	pm->suspended = false;
>> >
>> >	return err;
>> > @@ -266,6 +275,7 @@ static int mt7921s_resume(struct device *__dev)
>> >	int err;
>> >
>> >	pm->suspended = false;
>> > +	clear_bit(MT76_STATE_SUSPEND, &mdev->phy.state);
>> >
>> >	err = mt7921_mcu_drv_pmctrl(dev);
>> >	if (err < 0)
>> > diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c
>> > b/drivers/net/wireless/mediatek/mt76/sdio.c
>> > index c99acc21225e..b0bc7be0fb1f 100644
>> > --- a/drivers/net/wireless/mediatek/mt76/sdio.c
>> > +++ b/drivers/net/wireless/mediatek/mt76/sdio.c
>> > @@ -479,7 +479,8 @@ static void mt76s_status_worker(struct mt76_worker *w)
>> >			resched = true;
>> >
>> >		if (dev->drv->tx_status_data &&
>> > -		    !test_and_set_bit(MT76_READING_STATS, &dev->phy.state))
>> > +		    !test_and_set_bit(MT76_READING_STATS, &dev->phy.state) &&
>> > +		    !test_bit(MT76_STATE_SUSPEND, &dev->phy.state))
>> >			queue_work(dev->wq, &dev->sdio.stat_work);
>> >	} while (nframes > 0);
>> >
>> > diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> > b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> > index 649a56790b89..801590a0a334 100644
>> > --- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> > +++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> > @@ -317,7 +317,8 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
>> >		if (ret > 0)
>> >			nframes += ret;
>> >
>> > -		if (test_bit(MT76_MCU_RESET, &dev->phy.state)) {
>> > +		if (test_bit(MT76_MCU_RESET, &dev->phy.state) ||
>> > +		    test_bit(MT76_STATE_SUSPEND, &dev->phy.state)) {
>> >			if (!mt76s_txqs_empty(dev))
>> >				continue;
>> >			else
>>
>> since mt76s_tx_run_queue will not run if MT76_MCU_RESET is set, do we
>> really need to check it for each iteration or is fine something like:
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> index 649a56790b89..68f30a83fa5d 100644
>> --- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> +++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> @@ -317,14 +317,12 @@ void mt76s_txrx_worker(struct mt76_sdio *sdio)
>>		if (ret > 0)
>>			nframes += ret;
>>
>> -		if (test_bit(MT76_MCU_RESET, &dev->phy.state)) {
>> -			if (!mt76s_txqs_empty(dev))
>> -				continue;
>> -			else
>> -				wake_up(&sdio->wait);
>> -		}
>>	} while (nframes > 0);
>>
>> +	if (test_bit(MT76_MCU_RESET, &dev->phy.state) &&
>> +	    mt76s_txqs_empty(dev))
>> +		wake_up(&sdio->wait);
>> +

If doing so, mt76s_txqs_empty may not always be true because enqueuing packets
to q_tx or MCU command to q_mcu simultanenously from the other contexts in
different cpu is possible.

It seemed to me we should check it for each iteration to guarantee that we can
wake up the one that is waiting for the all the queues are empty at some time.

>>	/* enable interrupt */
>>	sdio_writel(sdio->func, WHLPCR_INT_EN_SET, MCR_WHLPCR, NULL);
>>	sdio_release_host(sdio->func);
>>
>> Regards,
>> Lorenzo
>>
>> > --
>> > 2.25.1
>> >
>
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
