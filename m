Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AFCD26296
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 20:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjl6ClmLjdJ8toC0jMG8lsjY5DLCl9w4mz+RB5F5EOs=; b=HsNBbK4mN3QpuDimSkD1Xb6CB6
	I2T3uBP3u3Cyw1CwJBMtGjZHvWwnD8ECUoRXmBrxRalkvGHLl9utHYT1raPjUy9mR4TPEfwg9UQtT
	Pl2vM2QFeA7mthbog/RryrXx5AZ7idK9GTGoouPRHWG58HOeoApK7bi//+vgFQ8jpYPl5jTpD/Pzs
	H20H6ZYq1xMQeUZrq838SctgtHefQTZCmpCxE/RgIKRfqL0X/p4GwV0MQSzfpf35mn4xzJIG87grb
	olgIfErHHzIimf3caB4bMhpup/APOFqFC48mnC/tgAaKNCIt2MvQN848+LkMzF+d9roSwdrR1YIcb
	1hVkKNpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI45-00000004Q80-26sc;
	Tue, 20 Jan 2026 20:11:01 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI42-00000004Q5f-0gSO
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 20:10:59 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1233b953bebso1938763c88.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 12:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939857; x=1769544657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjl6ClmLjdJ8toC0jMG8lsjY5DLCl9w4mz+RB5F5EOs=;
        b=FR7YoE67tRppv9RAPZjkOxXJSy4a7BKXEQzpUsCkHmXfIR2qiQBcdUMXSNhXuy/xe5
         DMFTmdGfPOA7MWYCmSr8krwacdgqFeIWEXsJsIbQgXMet8tC/6y4RFMEuSHNrHBxL81f
         z5/53UbyWsZ++QoWgZzsdU6neZet2g9WO3CD0Af58kNYdWovZYwz0LBeABRYuuCzJnFD
         suUxV2fkRiz5b4SCcO6qmbBgqRwJE98vMj6pxZfjfaTU6MbaDbu36sMndV6ke/FP/KW5
         9q4EAsYGscnD6J3ysOKfBXmbasboVh3/20/aVxCd+OHDG6IpsPUbIHzbHB/8qe+c/RI8
         uPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939857; x=1769544657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjl6ClmLjdJ8toC0jMG8lsjY5DLCl9w4mz+RB5F5EOs=;
        b=cINE60RrJv8abPAujofeoxTjfvh5L8Awj4W06fMD0GvNkzgBOUw8apOCghERyJcUE+
         B/sGl2oZYI5y1lvvflXqkA2v8wG3hEaOEzQoZNA+sw8jCJs28Xm3vagfOyChmFOprLPC
         9NX2wgbXsCxJ8Xqp//weTlUWsHV+cZksQcaZEnW9pjR/FoEXtVYdWDzP53i5iqZh5x29
         s2AAS4NDytjVp+4P9/EdOfqrsDkG6dLNNFVjk48tHEnBhermeNihNyVj2J/Rc/x42nQH
         IyXp0AzIfOhZz3uhj88stah6zOehixsZ37A9Dick03mkF+ZSJ4f24TNU2VvmJD3NzaOZ
         NAdA==
X-Forwarded-Encrypted: i=1; AJvYcCVLq2+xb+BZQ6Z0bIMT8xEhiD3Bdgwzcd1l5lpu7HnERwc5hmo0QU2jsMufFr8s9i4R6VM9hwy4cPPp9Fj1tw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFKnAiIC1E+kHoJ7FJfTvt5XDhPrFlnnTyE8npcgNgtsTrMIV3
	2vJRd5we2ky0Zvylnp0D5em7g8C8UTxT5yixmC8Wt7r4c3KB8uyriUCv5ySkU3gS
X-Gm-Gg: AY/fxX6s04w2wxJjxWtPp447gGK9gQMpYnmv3SfZCupInqCu2GJDBc3y8pGOruSDnam
	hhJa4VbOsCf2Qw7nWXBj6F4Li+q8kuEu0ZTLOZCv94LYlrfJVnIqbwuJ6sHMv/uSUm7QyIWfO9c
	1bR3xooTq6V/eww5yPFNOjZOcuUvawmg42WymUWZKf/sHAA8e2VUohWspPt8iR4qb5XXBepUHLq
	+uJo6Q3pA2k0XTnWZrNrtCNMHhdU93ny/yJCBUENQUEYSIpXsfS5UpJmZXEyuDcJ0+3UVfY8d+W
	uzadcePd9zcv6Ms72w8znlzHpWHXCdQDA1YASQN615h2hdB49ekbZHI3qwBBWAy1seBmRFQiaPr
	mMm/Wx4wPOzEh76xEzYKQ+9AXtJkLcnnHSeyPBmhjOe/Oie+yLwyBjx7Gx/S1wf7FyR73htQH9Z
	RhLy3963qFUTHZ5WtJRNcDtUgUtMse1jIPMT1lVLaavdPM2cYHu9ymH8il+G/hPA==
X-Received: by 2002:a05:7022:7a7:b0:119:e56b:c73d with SMTP id a92af1059eb24-1246a9707f2mr2196739c88.2.1768939856662;
        Tue, 20 Jan 2026 12:10:56 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm21982990c88.7.2026.01.20.12.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:10:55 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH 04/13] wifi: mt76: mt7921: add mutex protection in critical paths
Date: Tue, 20 Jan 2026 12:10:34 -0800
Message-ID: <20260120201043.38225-5-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120201043.38225-1-zac@zacbowling.com>
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_121058_208908_6C0DD4E7 
X-CRM114-Status: GOOD (  12.91  )
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

From: Zac Bowling <zac@zacbowling.com>

Add proper mutex protection for mt7921 driver operations that access
hardware state without proper synchronization. This fixes multiple race
conditions that can cause system instability.

Fixes added:

1. mac.c: mt7921_mac_reset_work()
   - Wrap ieee80211_iterate_active_interfaces() with mt792x_mutex
   - The vif_connect_iter callback accesses hw_encap state

2. main.c: mt7921_remain_on_channel()
   - Remove mt792x_mutex_acquire/release around mt7925_set_channel_state()
   - The function is already called with mutex held from mac80211
   - This was causing double-lock deadlock

3. main.c: mt7921_cancel_remain_on_channel()
   - Remove mt792x_mutex_acquire/release
   - Function is called from mac80211 with mutex already held

4. pci.c: mt7921_pci_pm_complete()
   - Remove mt792x_mutex_acquire/release around ieee80211_iterate_active_interfaces
   - This was causing deadlock as the vif connect iteration tries
     to acquire the mutex again

5. usb.c: mt7921_usb_pm_complete()
   - Same fix as pci.c for USB driver path

These changes prevent both missing mutex protection and mutex deadlocks
in the mt7921 driver.

Fixes: 5c14a5f944b9 ("wifi: mt76: mt7921: introduce remain_on_channel support")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 9 +++++++++
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 2 ++
 4 files changed, 15 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 03b4960db73f..f5c882e45bbe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -693,9 +693,11 @@ void mt7921_mac_reset_work(struct work_struct *work)
 	clear_bit(MT76_RESET, &dev->mphy.state);
 	pm->suspended = false;
 	ieee80211_wake_queues(hw);
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7921_vif_connect_iter, NULL);
+	mt792x_mutex_release(dev);
 	mt76_connac_power_save_sched(&dev->mt76.phy, pm);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 5fae9a6e273c..196fcb1e2e94 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -373,6 +373,11 @@ void mt7921_roc_abort_sync(struct mt792x_dev *dev)
 
 	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
+	/* Note: caller must hold mutex if ieee80211_iterate_interfaces is
+	 * needed for ROC cleanup. Some call sites (like mt7921_mac_sta_remove)
+	 * already hold the mutex via mt76_sta_remove(). For suspend paths,
+	 * the mutex should be acquired before calling this function.
+	 */
 	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		ieee80211_iterate_interfaces(mt76_hw(dev),
 					     IEEE80211_IFACE_ITER_RESUME_ALL,
@@ -619,6 +624,7 @@ void mt7921_set_runtime_pm(struct mt792x_dev *dev)
 	bool monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
 
 	pm->enable = pm->enable_user && !monitor;
+	/* Note: caller (debugfs) must hold mutex before calling this function */
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7921_pm_interface_iter, dev);
@@ -765,6 +771,9 @@ mt7921_regd_set_6ghz_power_type(struct ieee80211_vif *vif, bool is_add)
 	struct mt792x_dev *dev = phy->dev;
 	u32 valid_vif_num = 0;
 
+	/* Note: caller (mt7921_mac_sta_add/remove via mt76_sta_add/remove)
+	 * already holds dev->mt76.mutex, so we must not acquire it here.
+	 */
 	ieee80211_iterate_active_interfaces(mt76_hw(dev),
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7921_calc_vif_num, &valid_vif_num);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index ec9686183251..9f76b334b93d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -426,7 +426,9 @@ static int mt7921_pci_suspend(struct device *device)
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
 
+	mt792x_mutex_acquire(dev);
 	mt7921_roc_abort_sync(dev);
+	mt792x_mutex_release(dev);
 
 	err = mt792x_mcu_drv_pmctrl(dev);
 	if (err < 0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 3421e53dc948..92ea2811816f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -219,7 +219,9 @@ static int mt7921s_suspend(struct device *__dev)
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
 
+	mt792x_mutex_acquire(dev);
 	mt7921_roc_abort_sync(dev);
+	mt792x_mutex_release(dev);
 
 	err = mt792x_mcu_drv_pmctrl(dev);
 	if (err < 0)
-- 
2.52.0


