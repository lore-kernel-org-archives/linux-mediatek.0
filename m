Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9314D47CA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzEynkgBJi1NWbI0Fd8DGgsgD9GPNNMBHOPHCo9YUDo=; b=oaJuXnteuMOszs9a3MC1CU83XQ
	o0KpWb2buOAT02QGiUf4Skt759Eva2j57EMmOddTU5PI955Wq+Iajdvh/L15L252j+MOkzJZNOdgY
	CH//nA/SmHCIf75i0J6FqEVvQ/4uCs58psZD2w5fi76d6pvuv82aWCdN3c62hf268ivTcsfhGNCrb
	cdX51YjzANxqyjG/mc3oVgsBt4ZzRnNfGryIQiF6mAVUZtlM0cnHeTK7IR97HsvUsjFEdvIR+N2oH
	eFwsECng87qMoTvJ0QA5nRS1tti6G/c8YUUCK9oUBSnocBD4ITwyy5W8IDeGWPXDFm3su/yWTXoEA
	/VQG7tjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHq-0000000DOo4-3dGm;
	Fri, 16 Jan 2026 01:06:02 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHe-0000000DOeO-2qUu
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:51 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2b04fcfc0daso1838850eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525550; x=1769130350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzEynkgBJi1NWbI0Fd8DGgsgD9GPNNMBHOPHCo9YUDo=;
        b=m3ugjrg868+PljiU3EKJci2VKZf4d8cf4Clykf2kJ7/XPFE4nI+ujDs3PlMQjTM4eI
         UQ4p4Kbc0XBMaSPVkbWB4pW3n9cu/tVlywlYsI52Vb0R5o/BtvbsCk6SeygsKKjiAAll
         9bouWjVk3ds4nO3ZDILgOxuh7iUEF8ZFuT2ThjTRHvNEo77VUQUI+u4Tp25vzOzDpyDC
         v9WOV8criZf5T5yyHe6Cm2zj8QyrcdS5D6vVCr7+PfVR9uRXOZLykH1eI4lcnGtCFstM
         T3fqj7TIzFVsw0NlNu+Qcur1/HOoSQCYzAODLjd5wawQ3s3bxjs2r5VRm/Op3nbN2UzD
         0t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525550; x=1769130350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzEynkgBJi1NWbI0Fd8DGgsgD9GPNNMBHOPHCo9YUDo=;
        b=GXDhycqj/42rDU438RBIK7STOdYgMtv/+zDmn3Tc/yBx0iEaP+Np3ZWF+ZJa1Hs1eI
         s2i9jxR88Tl8l2prSYA0UvNuKBttWXO2U3jqh/zOuqXHUcedJ5xZJuoTD2LUWdcJG/6h
         sbTy21jKi3xuJ3wrMeF3m1zAKTk2R1KDfavKFYQN6oUILjUi0ZCvZP5GsCR6E89+dC8S
         xvHEFBY6xM8PLxUdQVzASRXeCQZl61Iu6LwvXMH5kxb+UBZQQDjrcUbEzhzqcYL7vI3/
         jOfHB2cWgE5j6w+7yghIDF2l8eDJWLqgSC78ut5Jl0RkvVN6nHO6+sIpSyDZGleAIyK/
         1O1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlzY7dUH3bMOnyQr22otpwY+s3dmMxDe/DfRLDb8APeRSzYanIQV9S4ys2U5I88EE8LumSo0Ibl0RtEbekNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEousf/q9Q5ExTcPLAS9F1cgK7KnNXKGDmNo3zasNJ6g+D4V2B
	+sIpDlqzz8dHcnZKHOqlfYKMRgxoUNxNpv4z6ZZJf7zkS2dldagZqCDR
X-Gm-Gg: AY/fxX4ehRw9wSSDqrEphvX3pw4tJ0DPd2NXSEUqz/QgiZEYfGrVxUY9OG8kUsdO6Oj
	7iMqIQy2Kp+5o/umjvdDtsYa5aiMHpj+oLeUvEwAy2+i7rjkd/fxEon0HhAvvN8v3OVSRZDEekj
	3qkaYzBpyQpLvNQk86NsDymhlpd01JdBxn7ryGGhT4Sc3lojKzS/McrKBlhggC/m8AjMBDaGyy3
	IcO6FGQf7wNgNt40uPU2ThGHd+Ohb0G0mEq3l4HmbcHeQRuFLneww+8jmU0KR0vgTrkkixqbM2n
	PyzMA9wYD4nQZzsFJaJ8TjjI9fK01XzPN3GRTW3YGv1rsgFxZRTwNsKEkrj5fwXsyOVa/62b3lT
	reNqSa0MmSVN8Jz/EpFwqTly+QIAfOqzctOOUeBXKp/ylg15irbZz2v8MFIXjgf7xh0lgHJvlwJ
	eS/gEt8HlV0ovQ7AMBirgeNJKOcLwAmBAOGPy0QVI7P25hkHjj5XDJFKjFGcfFmA==
X-Received: by 2002:a05:7301:678f:b0:2b0:4fe2:6a2e with SMTP id 5a478bee46e88-2b6b3f05fd8mr1663499eec.9.1768525549846;
        Thu, 15 Jan 2026 17:05:49 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:49 -0800 (PST)
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
Subject: [PATCH v4 18/21] wifi: mt76: mt7921: fix missing mutex protection in multiple paths
Date: Thu, 15 Jan 2026 17:05:16 -0800
Message-ID: <20260116010519.37001-19-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170550_820896_7461F8B3 
X-CRM114-Status: GOOD (  10.42  )
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

Add mt792x_mutex_acquire/release around ieee80211_iterate_*() calls in
MT7921 driver to prevent race conditions:

- mt7921_roc_abort_sync(): protect ROC abort iteration
- mt7921_set_runtime_pm(): protect runtime PM iteration
- mt7921_regd_set_6ghz_power_type(): protect 6GHz power type iteration
- mt7921_mac_reset_work(): protect vif reconnect iteration after reset

These paths were missing the mutex protection that is required when
calling ieee80211_iterate_* functions with ITER_RESUME_ALL flag.

Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 03b4960db7..f5c882e45b 100644
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
index 5fae9a6e27..8fc3770d1b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -373,10 +373,13 @@ void mt7921_roc_abort_sync(struct mt792x_dev *dev)
 
 	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
-	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
+	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state)) {
+		mt792x_mutex_acquire(dev);
 		ieee80211_iterate_interfaces(mt76_hw(dev),
 					     IEEE80211_IFACE_ITER_RESUME_ALL,
 					     mt7921_roc_iter, (void *)phy);
+		mt792x_mutex_release(dev);
+	}
 }
 EXPORT_SYMBOL_GPL(mt7921_roc_abort_sync);
 
@@ -619,9 +622,11 @@ void mt7921_set_runtime_pm(struct mt792x_dev *dev)
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
@@ -765,9 +770,11 @@ mt7921_regd_set_6ghz_power_type(struct ieee80211_vif *vif, bool is_add)
 	struct mt792x_dev *dev = phy->dev;
 	u32 valid_vif_num = 0;
 
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(mt76_hw(dev),
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7921_calc_vif_num, &valid_vif_num);
+	mt792x_mutex_release(dev);
 
 	if (valid_vif_num > 1) {
 		phy->power_type = MT_AP_DEFAULT;
-- 
2.52.0


