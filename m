Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F3EEEB56D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 06:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyMHOUL6PX8gGCpJKqxA4osFrTSq3zeh+kkY++bT1Ho=; b=11/vRMCP/ga0g0bMHKgcCoWLzp
	DM2vUk19oUjH0cnft6BOR8nefNL28CW0nwqSUafoiGJZvn8Qk+p55Vfd6XEGAkykV/mQHiR3lNwu3
	3Mxx3t6YGH3cIJPc2HSTqZseK9FqRnfTOc3CLOZzkonKBQkKJ+MdrhLEb8c7fHbhOWVTiEx/+H/F4
	Kv8+Mse5fKlIdn9gEK+ZC3u73f7qVBpqa9cYc6LOA/VD/RAFACD0AJhZeetKIXWfZBOg/z2v7kC1B
	pdwo/SF/G/WJmPn4UD+QTb989uNLfEr/595XLCOBx3tVMqKbIzVGAzj7+AgHsnD4ZE000hnqgoxqE
	s0Djy5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7y-00000006e01-2uqn;
	Thu, 01 Jan 2026 06:25:42 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7u-00000006dzD-0wi7
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 06:25:40 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c2dc870e194so3970856a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 22:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767248737; x=1767853537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyMHOUL6PX8gGCpJKqxA4osFrTSq3zeh+kkY++bT1Ho=;
        b=ihUS7Tv80X6oGJftTYD/yCWHTutEXadHvylYsJpd3FRFxEoWMMzTf3KR33jGP5qU1z
         LLbq4As3go60Kd9N9AVmLLAXXhJmAlqTC3g7aRvg/53Ko447G9RKn6UpqNiNQ103Ird5
         kVV4KNX10x6w0WaBmKBXhgM73L8XDHRBdhTOFKxVD3YCVaJEKkPrJzvxfuqWs6edmAo/
         3pTjPsBA4bFLd2nxSzSMmsL/GWgxhwtE7XS+BO/dhS7eSRf1AL3Wpmk8aY3t8pBT/xNU
         5Lji+lOFN+yUCpf5ncusH2R++Vi8ZjqZaxKbzDfi8koY3NtmSQ3Krn5fBLIQPeiDrPFc
         Oo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767248737; x=1767853537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KyMHOUL6PX8gGCpJKqxA4osFrTSq3zeh+kkY++bT1Ho=;
        b=nMvWkDiAEh9f3VQghjU3NZ5C7BFDPD4HMKvCwqdtdZzA/V1LzBQATntEYdoUZx2UKB
         3meiN4vCJYpoFzWIt1VGZOETFmasnxAZ3oJcsIGkggehzEwWYVJQZ+ir7u8d9huqfIyH
         CullA92k+j2JP0Gl5ydVS24Ut8/Y1VOG9Da+Pvm8hoKdslk6tRPeiz7dQGJoYUBFrfcp
         WzhINFgw1qQYPURZzr1sA5deWfQojh8b5ocTgaHvRf01HVdEAiH70PZqDCVs4NcKjihI
         SMXUO36wd/6e2IQx0WaedNDgGabgPt+YCl4kFz9cvIDXGbCUKBAdguWhdaO5bCAMqxJW
         nmYQ==
X-Gm-Message-State: AOJu0YzmtQK8ckPP10aayaYsvDKIkdCEsFf3Q7bpKiDG16l16/gTosal
	iTT0z/k7lQV/vKZtjPllExiNQuvAxI/7hisy6xuSXqcBhrJyf/twnBlT
X-Gm-Gg: AY/fxX69qa2LNMnrZ3Vk0g6flJy39joMHfDSZeopBuUixABfDadFBVR9GyAW7hBhipc
	b1NdhKiFZ8fS9VyxOfoA7/67sOqsozSYDL54f7X6LiqlJTNA9MCmtWPmSsHCQflHgFDhLEhChVt
	KayA5St9C3uBSiRG2d1X2zNTqZORppQ43qsz1lWWfzPnkGgChOiB7TWR0Wq71U8elw8cLFjKKjJ
	6RfZDX59UzccwzsizNQT4JthhSJm6CfP+ADskLzIw78Xc9lONWFx7h8mo2gzFPII8eebAOZlRdV
	eN28dvSxytzRsurzl1GQVZ2jkSk1TTtwEsR8XRBwSxu6Rv4mz83ufYTDGXHNgyS2JS+l/USpakl
	VjFudW7Zxgw6HyqP0hBOFgQfBR8C7HPPAIIfl+IYCYXSMxdJabCwtp/R4f25AJuRMMLYlb+G/1+
	pgE/qvWVrUYds7zXjjlCMCuvgWKLqk1WQKhLW1FMFLsgGR3JkiO3smaSzScXW/vg==
X-Google-Smtp-Source: AGHT+IFruK2Ksd+NMZVj9cqCTMex7QiD3OzwH2E6Y1/xPBTS9H6EF+Ig7Y/w2ekYn4a7Be44BpO66Q==
X-Received: by 2002:a05:7300:3e95:b0:2a4:3593:4668 with SMTP id 5a478bee46e88-2b05ebdd53bmr24110747eec.4.1767248737183;
        Wed, 31 Dec 2025 22:25:37 -0800 (PST)
Received: from zubuntu.home.zacbowling.com ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm85698912eec.0.2025.12.31.22.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 22:25:36 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvalo@kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	ryder.lee@mediatek.com
Subject: [PATCH] wifi: mt76: mt7921: fix missing mutex protection in multiple paths
Date: Wed, 31 Dec 2025 22:25:35 -0800
Message-ID: <20260101062535.186356-1-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAOFcj8Sad3pLohFfRdj5jzK3Zs3FAjFVBuzH=80i_m1YqSbpfA@mail.gmail.com>
References: <CAOFcj8Sad3pLohFfRdj5jzK3Zs3FAjFVBuzH=80i_m1YqSbpfA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_222538_275061_B6D75C46 
X-CRM114-Status: GOOD (  11.73  )
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

The MT7921 driver has the same mutex protection bugs as MT7925 - they were
inherited when MT7925 was forked from MT7921. Several code paths iterate
over active interfaces and call MCU functions without proper mutex protection.

Add mutex protection in the following locations:

1. mt7921_set_runtime_pm() in main.c:
   Called when runtime PM settings change. The callback
   mt7921_pm_interface_iter() calls MCU functions that require
   the device mutex to be held.

2. mt7921_regd_set_6ghz_power_type() in main.c:
   Called during VIF add/remove for 6GHz power type determination.
   Uses ieee80211_iterate_active_interfaces() without mutex.

3. mt7921_mac_reset_work() in mac.c:
   After firmware recovery, iterates interfaces to reconnect them.
   The mt7921_vif_connect_iter() callback calls MCU functions.

4. PCI/SDIO suspend paths (pci.c, sdio.c):
   The mt7921_roc_abort_sync() call iterates interfaces without
   mutex protection.

These bugs can cause system hangs during:
- Power management state transitions
- WiFi reset/recovery
- Suspend/resume cycles
- 6GHz regulatory power type changes

The fix follows the same pattern used in the MT7925 patches.

Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 4 ++++
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 2 ++
 4 files changed, 10 insertions(+)

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
index 5fae9a6e273c..05793a786644 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -619,9 +619,11 @@ void mt7921_set_runtime_pm(struct mt792x_dev *dev)
 	bool monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
 
 	pm->enable = pm->enable_user && !monitor;
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7921_pm_interface_iter, dev);
+	mt792x_mutex_release(dev);
 	pm->ds_enable = pm->ds_enable_user && !monitor;
 	mt76_connac_mcu_set_deep_sleep(&dev->mt76, pm->ds_enable);
 }
@@ -765,9 +767,11 @@ mt7921_regd_set_6ghz_power_type(struct ieee80211_vif *vif, bool is_add)
 	struct mt792x_dev *dev = phy->dev;
 	u32 valid_vif_num = 0;
 
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(mt76_hw(dev),
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7921_calc_vif_num, &valid_vif_num);
+	mt792x_mutex_release(dev);
 
 	if (valid_vif_num > 1) {
 		phy->power_type = MT_AP_DEFAULT;
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
2.51.0


