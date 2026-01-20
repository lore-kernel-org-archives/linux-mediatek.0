Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95D7D2ED0F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 06:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gq8BwtBE3udkhb8xxJaDge5ayHDcllBWREYlF8lWPK8=; b=Q8dEks5LADWk/fTxK3GKvn1NI/
	SbabIIU1gMqZ5+G2xZ3kAqhP9YH1ZAi7FxaOj8dZxCt5f+40FjO3mZ8WEiva5oL0Xd67z0ltLPBHN
	lray0IgUsukSrYiVjBlnifhzFtkpQmuZa20xddIZX/1sGPAN5qRcTy6u7EeisTQ8+Pr00LQB6nEI7
	K8KTG4eW26nJXiYRzG/XoOEvAROUxhFZ4HGyi2xbcKz3YlZ0W4Tsg6Px5L3amWIrFGKJHUkwdIGYC
	CdrB0LvSZMfqey7muEPxDR/ABtrk6HCvbFAjs0xSBu6qc/2g8OyQcmJTH+YChjpFpN5Ra0aGKhuCZ
	FpWUL2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ep-00000003GgU-2qf0;
	Tue, 20 Jan 2026 06:29:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ek-00000003Gby-0wUF
	for linux-mediatek@bombadil.infradead.org;
	Tue, 20 Jan 2026 06:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gq8BwtBE3udkhb8xxJaDge5ayHDcllBWREYlF8lWPK8=; b=aNPPBJgt3A56dpcRWveFZtSBFm
	M5xWkuLzj6Hk3j0NNU3nw8J20Z8Imbl94BhnYTO2qq+CGWt2sNNjPDfg/tuDfBzXn41y5VAiZHAHQ
	bojwrU1JkNcy8AKGnR5L8Q2fXJjihLjCWFlDNjy75MD1/BkR7MhcjgbMDYlOLJRhpNEMOurqLsuEI
	gGifiGbEpMzLspFokLQiZwVTypsnkVvF5e0dOVrqfrTfIZjsGB611elPmp5R3pjPWLdHVSOnWrrWg
	L6xD+MDQfhYy9jSf2+cnNtY8gZ8oNWpRqsFoLt1LIQOU3I8v0EwaDAx/2BdKnWLeZTMQhRn2LtCd9
	ZKkcQ8Yw==;
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Eh-0000000DP6s-12Uk
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 06:29:09 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2ae61424095so5027867eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 22:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890545; x=1769495345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gq8BwtBE3udkhb8xxJaDge5ayHDcllBWREYlF8lWPK8=;
        b=AiZHChOuEraVdQ1GcJk/HTbj949PBx2rvVo9dgNHsvbXREP/++Rr1sG+MNIciERHsL
         pte9PFP0ZwnEWkMxIKtg0lkpBodEUitnkvSLB0/3jAIZGaaFNRlZRNv7P2RIN5PXFBh3
         chbQYyXFxqZXyFCFmBKeni9TwxgdRMicH8a4GdFlmYIDcidH5mrydMX28pKuXUTZ79jH
         WHT+eMdiR+SlErwiKvHkhaL5b6AbqUaVdu/qR/ukP24U5OU1vm6rtFdYXuLAq7Xa8fEM
         cgRXzYkB9FabrHGK8GInl4LcCx5bHYs+60pjOq5ZmCxZJact52SzBZ8JVnTVD+t5+UkQ
         k+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890545; x=1769495345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gq8BwtBE3udkhb8xxJaDge5ayHDcllBWREYlF8lWPK8=;
        b=Z8LKmWTa7lzaSC4jrcYwf2Szd4B9vy738kAD/9V8rljG1U31i3tZnDbVrvd8eUuf5b
         +OjLkhVV4nxxo/ea6SCl7FcIxh6q48ySJqe0d9sHt/R2hfwGiL0Wv15XOrb5x8csokRv
         I46/cjOgBHO99ha03WcBSIEN1dyx84JQTUzs2gkKKZe4cud+snMYP4WVOeNDakq6zBaE
         Vuwkj/l7l/osteNlZ3W4nBvS6Ml+NNHbwjcmwNhBkRiWts4ecAlC3m+c1hn/R/dk0tRm
         COlfR9yn/ZdR7/gZ9Y2sJHMYNOguq4/JZNbxisbST0xSJQjjxrEBOo+E/XnsGMsjSV9P
         Qmhw==
X-Forwarded-Encrypted: i=1; AJvYcCX2by0vgitXgkocLGV3worgjfm5iwTRoYYniE9T6uPesyTa9SaPvwlzRXsli4RU/7A5uvmaqyLe7H5xYVwrsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwA8m/mgRMNPVIZ3mtnJ8AmF8fi3CI3YltNRocag4Gn1DUMgc9v
	wwZh3u3hT2+Pp0QB+4/uekn8M8vcfr03E7IRgHP+59srakvIGo/zeYgz
X-Gm-Gg: AZuq6aLFnrmENjPMURXtQqn3jJu7QeG0qLBsqdxua9B0t4uJXd1zjw1qiSCJWjtc+TA
	nywFU0RY7zBo0EXTiaVeVt+lMGVgiaKyv0EWdADTs0y4RV4z3i3H65d20NRpn4ZzNcQiXmplUoc
	mzdYd+DJtwiSC70aj50+Fq7t8g/oaaTCqfRK/r2d0EdP4R6UYLvuYKA5yAUR8etaBcKmkTJYsn9
	N6ilpXd3BbQ0aznGuTbnchmJAucbz8HMbMT/6aC6F0zGkk2aDZ1JGC4Inw/Hn+ZTKnuFvJ7u1GQ
	jnUsiG2HUuYfJGERm6O4UnWNqbrtMdeubEEfM3W1n1BOVuk7xOXYWjO95ziqJcjkI39xyDomHSj
	5SRU7ezWbjyAZ8fVd7sOX2TMj08K8sTfKXsABbYL8olGky5NtZRXcR2lE9OwgmhqRQI8hoef8zI
	0awCvaoHClrTMjQkfYKGvJSAottQeaxUzqhuvgitZVOgqKZoRZpYtll+U/gaKM
X-Received: by 2002:a05:7301:290a:b0:2ae:60fd:6f18 with SMTP id 5a478bee46e88-2b6b4e8a496mr11903860eec.22.1768890544990;
        Mon, 19 Jan 2026 22:29:04 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15706784eec.9.2026.01.19.22.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:29:04 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	stable@vger.kernel.org,
	linux@frame.work,
	zbowling@gmail.com,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH 06/11] wifi: mt76: mt7925: add mutex protection in critical paths
Date: Mon, 19 Jan 2026 22:28:49 -0800
Message-ID: <20260120062854.126501-7-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120062854.126501-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260120062854.126501-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062907_559036_D490F0E5 
X-CRM114-Status: GOOD (  11.57  )
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

Add proper mutex protection for mt7925 driver operations that access
hardware state without proper synchronization. This fixes race conditions
that can cause system instability during power management and recovery.

Fixes added:

1. mac.c: mt7925_mac_reset_work()
   - Wrap ieee80211_iterate_active_interfaces() with mt792x_mutex
   - The vif_connect_iter callback accesses hardware state

2. mac.c: mt7925_mac_sta_assoc()
   - Wrap vif_connect_iter call with mutex protection
   - Called during station association which races with PM

3. main.c: mt7925_set_runtime_pm()
   - Add mutex protection around mt76_connac_pm_wake/sleep
   - Runtime PM can race with other operations

4. main.c: mt7925_set_mlo_pm()
   - Add mutex protection around MLO PM configuration
   - Prevents races during MLO link setup/teardown

5. pci.c: mt7925_pci_resume()
   - Add mutex protection around ieee80211_iterate_active_interfaces
   - The vif iteration accesses hardware state that needs synchronization

These protections ensure consistent hardware state access during power
management transitions and recovery operations.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 device")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ++++--
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c  | 4 ++++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 184efe8afa10..06420ac6ed55 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1331,9 +1331,11 @@ void mt7925_mac_reset_work(struct work_struct *work)
 	dev->hw_full_reset = false;
 	pm->suspended = false;
 	ieee80211_wake_queues(hw);
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7925_vif_connect_iter, NULL);
+	mt792x_mutex_release(dev);
 	mt76_connac_power_save_sched(&dev->mt76.phy, pm);
 
 	mt7925_regd_change(&dev->phy, "00");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 15d1b1b8d9f8..80ca5181150b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -755,9 +755,11 @@ void mt7925_set_runtime_pm(struct mt792x_dev *dev)
 	bool monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
 
 	pm->enable = pm->enable_user && !monitor;
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7925_pm_interface_iter, dev);
+	mt792x_mutex_release(dev);
 	pm->ds_enable = pm->ds_enable_user && !monitor;
 	mt7925_mcu_set_deep_sleep(dev, pm->ds_enable);
 }
@@ -1331,14 +1333,12 @@ mt7925_mlo_pm_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 	if (mvif->mlo_pm_state != MT792x_MLO_CHANGED_PS)
 		return;
 
-	mt792x_mutex_acquire(dev);
 	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 		bss_conf = mt792x_vif_to_bss_conf(vif, i);
 		if (!bss_conf)
 			continue;
 		mt7925_mcu_uni_bss_ps(dev, bss_conf);
 	}
-	mt792x_mutex_release(dev);
 }
 
 void mt7925_mlo_pm_work(struct work_struct *work)
@@ -1347,9 +1347,11 @@ void mt7925_mlo_pm_work(struct work_struct *work)
 					      mlo_pm_work.work);
 	struct ieee80211_hw *hw = mt76_hw(dev);
 
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7925_mlo_pm_iter, dev);
+	mt792x_mutex_release(dev);
 }
 
 void mt7925_scan_work(struct work_struct *work)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index c4161754c01d..3a9e32a1759d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -455,7 +455,9 @@ static int mt7925_pci_suspend(struct device *device)
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
 
+	mt792x_mutex_acquire(dev);
 	mt7925_roc_abort_sync(dev);
+	mt792x_mutex_release(dev);
 
 	err = mt792x_mcu_drv_pmctrl(dev);
 	if (err < 0)
@@ -582,10 +584,12 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 	}
 
 	/* restore previous ds setting */
+	mt792x_mutex_acquire(dev);
 	if (!pm->ds_enable)
 		mt7925_mcu_set_deep_sleep(dev, false);
 
 	mt7925_mcu_regd_update(dev, mdev->alpha2, dev->country_ie_env);
+	mt792x_mutex_release(dev);
 failed:
 	pm->suspended = false;
 
-- 
2.52.0


