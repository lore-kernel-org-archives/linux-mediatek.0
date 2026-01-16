Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B1FD47CAE
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPmr/YvMhh6PyVTDX5uGjbBQK9qU8oKB4kDMk8rc0co=; b=y2D+DSZmBDjaiILg3BTNObKKbi
	Bfw8eEJu/n0a0WctKYJ20iJmhIsZvAsyBPAo6XaVwtkklTiHeOjuKgHU3UWhwOp2SyPhb72bI9ydu
	I2TNXARf3kUryaOhDFxw5S6erDfgXbNCHdlPd3hdVk3ApnPxW2HxCx4gH13K1YqXCg7e54c+wUq+o
	M9ICAYCBPbIId49M+o7/sRlx6ph2/labIaJWvsbA3zHj4kyNTSDOsnMZg2v/hbHr2WyOuEWeYp3Wk
	bJRSKucPmzazN7VJeFE9rIFoE9CAqr21MEJhORu1bE7mG8zQCIxLWMZVGkv08ACUYEi1Hu8X7MgO9
	/4nexfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHr-0000000DOoS-0TCK;
	Fri, 16 Jan 2026 01:06:03 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHg-0000000DOgU-2Jix
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:53 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2ac3d5ab81bso1765262eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525551; x=1769130351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPmr/YvMhh6PyVTDX5uGjbBQK9qU8oKB4kDMk8rc0co=;
        b=AhAxzITpbY7OtcOD3SC8npM8qq6TCMoiJi5Z+ryp4l3REk5QBaAF81MlfW3pKCW2+T
         s6ySPxj+42tXk29PnnKycVkc0oN3BVIVEKwkOhth0kyaSYJZFNvB3CV3liaZ+sFEb39U
         UrDCIkUkjNTHMK07OFVktxYoAMHzcu1PmYL91Ucxt8Np+GpFdoeyKliYmBZW6cEzjiiv
         YadRaEzKjrBryifBpDbtv/mPihT3qzhCUFHXkwGe1kA1O9SU/UhRTkNQR+uGG4Rc8KG6
         1cXTo+KdQS9SKsCzr5nvVMdL/PFsHZg1cRJEpH0oOTjfaHp2hsc4RU8Mqpd/nffxWDZV
         ZQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525551; x=1769130351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPmr/YvMhh6PyVTDX5uGjbBQK9qU8oKB4kDMk8rc0co=;
        b=qarlvfGAW74eDLxF/rhmDrtAbM/EDleU1OgF6CN4GyadT1BT0iL6/9JQbfvnJICMv7
         baM417tDdv9Csf2K5iEt5hIm5gQtttgb/8H1pJ99JOMl24LTUdHe0VtvcZFuBeKwa+w/
         5KbhSZotCbxOXJw8RCck4s86IyIpoaBykW7oJVCHHC1xnZynkjEByQWdL+QZ/8VyKDdp
         s3C2uwSo+ML+PDiEqmAh7hMbceJ+9kwm0PVpf9Vg6o9V9yBM4cY2KBd2AqFjrTEEUIbT
         5XWDYxDx0ADAQ3QbDo+H9BhNUokHAVlAFg0BbfmvAViojx041/Wi4JQBGUFxRu17KSoe
         V5hA==
X-Forwarded-Encrypted: i=1; AJvYcCVfhoSj2Ag1C2+odzNWExL4T3SwEa34KxB08GcC8JnPm08Ytt/OiElng8X5EAJEp0EfOOG01Av8OYX8IFdSxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWyhFCDEJlFzOGgXPfZQrdXRbHBRe7MeS9a4ZaKhDFZSFQvuAS
	dNuYX+Rl2WDvaXM26UxQmpJb3Oc9OH3at3wttU8QMGpwEDJ5Y5sxowtL
X-Gm-Gg: AY/fxX6+vbUA8VoMk+zXYQ/DNx06qobC444RGmuwGVuKAc+vtzoPYfiLq0xkp6MRKsM
	8vyihsoGXXG0Qas96u7EaH82VC5UfDx5mDXsUFdoEajXPbn8/pSi4W3QY3g4f6e/wcTVlQF7ifW
	ZptipjCcVK4EoNoQ+ByF/z7t3MOPKs82vGGw+8HkJieFXIrVSd8hBHfOTTbMa22A/FJMcJHivZS
	dOnLuskAGM6zgU+VgKx4KKc2t4nXUQeBfhTOgCon2lzLTYjj0opDUHpk72AVkGADaWPUZ+GnMoP
	xWyT8O0lPhpEe+4Gk4Eur6JUrebAaQ0LIhuk8erFtdtzZ4pyv5v+5XE+ttVlw+oI9VZB2P4aSMA
	/Ae8JMKjuVBRuXCRxpfU9oY9zaxiZaknhPns4mhLxGRecCQnwfHOA1FQyb+t081WZqrmJp+sz8w
	nuupItJiXGkp6m9iwLzu46Dn8e604DD2aqKRr8OfjAbtwMwtWne85TEfrph9E2CQ==
X-Received: by 2002:a05:7301:7c0b:b0:2ae:56d7:b02 with SMTP id 5a478bee46e88-2b6b46c6449mr1393747eec.9.1768525551316;
        Thu, 15 Jan 2026 17:05:51 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:50 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	linux@frame.work,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	Zac <zac@zacbowling.com>
Subject: [PATCH v4 19/21] wifi: mt76: mt7921: fix mutex deadlocks in multiple paths
Date: Thu, 15 Jan 2026 17:05:17 -0800
Message-ID: <20260116010519.37001-20-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170552_611501_3008C401 
X-CRM114-Status: GOOD (  13.30  )
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

Fix mutex handling to prevent deadlocks:

- mt7921_roc_abort_sync(): Remove internal mutex acquire/release since
  this function is called from contexts that already hold the mutex
  (mt7921_mac_sta_remove via mt76_sta_remove). Add mutex at caller sites
  that don't hold it (pci.c and sdio.c suspend paths).

- mt7921_set_runtime_pm(): Remove internal mutex acquire/release since
  the only caller (debugfs) already holds the mutex.

The previous patches incorrectly added mutex acquire inside functions
that can be called from contexts where the mutex is already held,
causing deadlocks.

Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 13 +++++++------
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c  |  2 ++
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c |  2 ++
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 8fc3770d1b..9315dbdf88 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -373,13 +373,15 @@ void mt7921_roc_abort_sync(struct mt792x_dev *dev)
 
 	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
-	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state)) {
-		mt792x_mutex_acquire(dev);
+	/* Note: caller must hold mutex if ieee80211_iterate_interfaces is
+	 * needed for ROC cleanup. Some call sites (like mt7921_mac_sta_remove)
+	 * already hold the mutex via mt76_sta_remove(). For suspend paths,
+	 * the mutex should be acquired before calling this function.
+	 */
+	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		ieee80211_iterate_interfaces(mt76_hw(dev),
 					     IEEE80211_IFACE_ITER_RESUME_ALL,
 					     mt7921_roc_iter, (void *)phy);
-		mt792x_mutex_release(dev);
-	}
 }
 EXPORT_SYMBOL_GPL(mt7921_roc_abort_sync);
 
@@ -622,11 +624,10 @@ void mt7921_set_runtime_pm(struct mt792x_dev *dev)
 	bool monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
 
 	pm->enable = pm->enable_user && !monitor;
-	mt792x_mutex_acquire(dev);
+	/* Note: caller (debugfs) must hold mutex before calling this function */
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7921_pm_interface_iter, dev);
-	mt792x_mutex_release(dev);
 	pm->ds_enable = pm->ds_enable_user && !monitor;
 	mt76_connac_mcu_set_deep_sleep(&dev->mt76, pm->ds_enable);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index ec96861832..9f76b334b9 100644
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
index 3421e53dc9..92ea281181 100644
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


