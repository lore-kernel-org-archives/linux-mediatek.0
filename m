Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FAAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 21:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRwcd0eFm2cULe6zKf/kzDYS7jPzHf52MKG1qNKtIlM=; b=3Mw6me7tqearFv
	DFk8Cfqaxd7BETmU9MoFMTDTXlFVtw+H1saTnlo5ZFjzcYHIxXKzjkdw+7mIJL+l/5pKHuQ7+ta5I
	PwwuAZB9hMi7WymzNqRJRx45XGywoFfovBGbmKg+xu6TxWcCYiAHLf2JEizmGiIMJ2hUz2nZRYesk
	Hp29uvfGAIYkZ8TTu8RoTDDtvv23ECWmug6Y2nppS4byn2X5urUHqEm7hz71NAkjjCh3iJ63/RsiT
	NP5s5x02nLsNtyNtHKR3GMO9goeWdCk9vmbJjqroKGsKFjBySUUtCb5OOqrmB8PTiWmeC4T5Jzxm5
	Fo2aCHNNJh1UbrYHclHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRLC6-001fSQ-MX; Mon, 07 Mar 2022 21:47:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRLC0-001fRq-Fx
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 21:47:03 +0000
X-UUID: 3928255c0d9842a2b675e4d80618091a-20220307
X-UUID: 3928255c0d9842a2b675e4d80618091a-20220307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1318082295; Mon, 07 Mar 2022 14:46:52 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 13:46:51 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Mar 2022 05:46:37 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Mar 2022 05:46:37 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <Deren.Wu@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH] mt76: mt7921: move mt7921_init_hw in a dedicated work
Date: Tue, 8 Mar 2022 05:46:36 +0800
Message-ID: <1646689596-21189-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <0358e31e71481dec87f7ecb3b040db53076ffc4a.1646654230.git.lorenzo@kernel.org>
References: <0358e31e71481dec87f7ecb3b040db53076ffc4a.1646654230.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_134700_599171_55748842 
X-CRM114-Status: GOOD (  17.15  )
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

>Firmware initialization can take a while. Move mt7921_init_hw routine in a dedicated work in order to not slow down bootstrap process.

Hi, Lore

I don't think the patch is really needed and it creates the different state of the driver after mt7921_*_probe between without and with the patch
we should be careful to handle it.

For example.

1) It is possible that ieee80211_ops mt7921_ops is working while mt7921_init_work is not completed, so that creates the race issue between ieee80211_ops mt7921_ops and mt7921_init_work still in progress

2) mt7921[k,s,e].ko are always successful probed ( the .ko are always shown in `lsmod` ) that would confuse the users even when we actually got the failure of hardware initialization in mt7921_init_work

so I would prefer to wait a while in mt7921_*_proble until the hardware is ready to be working to get rid of the extra synchronization to be added as well as keep the driver much simple.

        Sean

>
>Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>---
> .../net/wireless/mediatek/mt76/mt7921/init.c  | 66 +++++++++++++------
> .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +
> 2 files changed, 49 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
>index fa6af85bba7b..332af886b95a 100644
>--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
>+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
>@@ -165,7 +165,7 @@ static int __mt7921_init_hardware(struct mt7921_dev *dev)
>
> static int mt7921_init_hardware(struct mt7921_dev *dev)  {
>-	int ret, idx, i;
>+	int ret, i;
>
>	set_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
>
>@@ -182,6 +182,13 @@ static int mt7921_init_hardware(struct mt7921_dev *dev)
>		return ret;
>	}
>
>+	return 0;
>+}
>+
>+static int mt7921_init_wcid(struct mt7921_dev *dev) {
>+	int idx;
>+
>	/* Beacon and mgmt frames should occupy wcid 0 */
>	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7921_WTBL_STA - 1);
>	if (idx)
>@@ -195,6 +202,42 @@ static int mt7921_init_hardware(struct mt7921_dev *dev)
>	return 0;
> }
>
>+static void mt7921_init_work(struct work_struct *work) {
>+	struct mt7921_dev *dev = container_of(work, struct mt7921_dev,
>+					      init_work);
>+	int ret;
>+
>+	ret = mt7921_init_hardware(dev);
>+	if (ret)
>+		return;
>+
>+	mt76_set_stream_caps(&dev->mphy, true);
>+	mt7921_set_stream_he_caps(&dev->phy);
>+
>+	ret = mt76_register_device(&dev->mt76, true, mt76_rates,
>+				   ARRAY_SIZE(mt76_rates));
>+	if (ret) {
>+		dev_err(dev->mt76.dev, "register device failed\n");
>+		return;
>+	}
>+
>+	ret = mt7921_init_debugfs(dev);
>+	if (ret) {
>+		dev_err(dev->mt76.dev, "debugfs register failed\n");
>+		goto error;
>+	}
>+
>+	ret = mt76_connac_mcu_set_deep_sleep(&dev->mt76, dev->pm.ds_enable);
>+	if (ret)
>+		goto error;
>+
>+	dev->hw_init_done = true;
>+	return;
>+error:
>+	mt76_unregister_device(&dev->mt76);
>+}
>+
> int mt7921_register_device(struct mt7921_dev *dev)  {
>	struct ieee80211_hw *hw = mt76_hw(dev); @@ -222,6 +265,7 @@ int mt7921_register_device(struct mt7921_dev *dev)
>	spin_lock_init(&dev->sta_poll_lock);
>
>	INIT_WORK(&dev->reset_work, mt7921_mac_reset_work);
>+	INIT_WORK(&dev->init_work, mt7921_init_work);
>
>	dev->pm.idle_timeout = MT7921_PM_TIMEOUT;
>	dev->pm.stats.last_wake_event = jiffies; @@ -234,7 +278,7 @@ int mt7921_register_device(struct mt7921_dev *dev)
>	if (mt76_is_sdio(&dev->mt76))
>		hw->extra_tx_headroom += MT_SDIO_TXD_SIZE + MT_SDIO_HDR_SIZE;
>
>-	ret = mt7921_init_hardware(dev);
>+	ret = mt7921_init_wcid(dev);
>	if (ret)
>		return ret;
>
>@@ -262,23 +306,7 @@ int mt7921_register_device(struct mt7921_dev *dev)
>	dev->mphy.hw->wiphy->available_antennas_rx = dev->mphy.chainmask;
>	dev->mphy.hw->wiphy->available_antennas_tx = dev->mphy.chainmask;
>
>-	mt76_set_stream_caps(&dev->mphy, true);
>-	mt7921_set_stream_he_caps(&dev->phy);
>-
>-	ret = mt76_register_device(&dev->mt76, true, mt76_rates,
>-				   ARRAY_SIZE(mt76_rates));
>-	if (ret)
>-		return ret;
>-
>-	ret = mt7921_init_debugfs(dev);
>-	if (ret)
>-		return ret;
>-
>-	ret = mt76_connac_mcu_set_deep_sleep(&dev->mt76, dev->pm.ds_enable);
>-	if (ret)
>-		return ret;
>-
>-	dev->hw_init_done = true;
>+	queue_work(system_wq, &dev->init_work);
>
>	return 0;
> }
>diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
>index 394a677140da..b6c8f84acb64 100644
>--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
>+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
>@@ -204,6 +204,8 @@ struct mt7921_dev {
>	struct list_head sta_poll_list;
>	spinlock_t sta_poll_lock;
>
>+	struct work_struct init_work;
>+
>	u8 fw_debug;
>
>	struct mt76_connac_pm pm;
>--
>2.35.1
>
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
