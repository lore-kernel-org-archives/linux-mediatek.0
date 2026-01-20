Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C3AD2ECF7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 06:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSaHJrj/+nVdwpmK2iA7Md9bL4shBev7TU9wO57zhqs=; b=nclCrUCoZ4xgErUhgg4KvMxy1s
	det1gWiIv8rowRWKo1AA7VvSMmp4X9F6+O9GSGIoops8aXLHCFpslYzF/Kd8L6xuLB2UXNQl6WHyb
	vaXN0hCaA4A+E51CXzpciJE5s4jbb62Srq7uumsc9alP0GrEpkQwhm1Uog6WC00fD7Mz1Wo+IXf4n
	celLh4K8qW4zVPFIzIEhiVWEz7rQjW5PRn4fauZB8b2b15UPFAu/p/wGvFcha/EPPNYMZUQXGjQ5e
	H/BMc4E4EmLiA8Xqa69dYIPqzEYSL+yLT4aPIN34KR/GnA8nD2GSiEb6w+n21j3CShLZUIH7UhHGB
	uFPQAfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5El-00000003GdH-1xbn;
	Tue, 20 Jan 2026 06:29:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ef-00000003Gab-3Gnd
	for linux-mediatek@bombadil.infradead.org;
	Tue, 20 Jan 2026 06:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HSaHJrj/+nVdwpmK2iA7Md9bL4shBev7TU9wO57zhqs=; b=jLqmSX5OOtrp7zt1i5z4VnoEkl
	dGqe3mI+98THHfaL/8tjHVopPoSzmYU/iUbayhTxbf4OlnOLSR2rNssS06sncrspYFKYRthmlluO7
	uDMU96nvYlfq+8DmdLJPG37TY9OBKtTrV3AfSIgA7B4WtN0U4sUFiy0aO0uCjoac5KgKJsYQ3lX2r
	HQLAlclWoKzCCaFZmRrnzwYKcdx28shL4jA3Ks5MBmZvcuC/TL/QmDS/NP8M/oq8mWJvGQC7yZ6xa
	ezDM7CJMJxLOeMawU8YnLCbMkOyJqwO7RBBWSI2Nzefrfhgq1SExnWPFN66J7SAy3AAsKT8YBd3T9
	fHpOILXw==;
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ec-0000000DP5k-4160
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 06:29:04 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-12460a7caa2so2243826c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 22:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890541; x=1769495341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSaHJrj/+nVdwpmK2iA7Md9bL4shBev7TU9wO57zhqs=;
        b=k8y0D07nSLXjoGEYJouf3qQ+3H6qNnzP5xMTZFB9i9tmFqezzeXpnHRU9kf4GLv2GQ
         w11R/R8FzCf+5h8V2j6MYPwZi7U19QXh3IrVdBsJ/kXyaim2Qa4A9a0pXXYFahCR8Dly
         jvuFpxJVuCJkpxdG6J55LfC+utcKf7ywx4ow63g5G7ZMdGdecBcMpi+OKV4UtpUPa4nk
         FUXvlvf/oQMRzMLTryAohAXqbj+0Cv0IouSfA+eZWAF5TWxDkjg7ZBy4nDRimGUSHbOg
         VKGkuYuKWiZ6c1Th5AxUKJLVy+NKplPshuRpdMvRJLZfJk2poqPJxNsPHgv7kGe2LE4p
         cryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890541; x=1769495341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSaHJrj/+nVdwpmK2iA7Md9bL4shBev7TU9wO57zhqs=;
        b=SRVXpePW+cPTcQtdB2Wf3SjT8joLm1MeGLp/2KoX86UJ58a327T3lvv5DuAja+AQZ/
         OEC1uqJZ2eJMaTErExwjn2bNyv9u8JTUmC2cva3fdMY2cg0TOyIlBIH9uLZWQDt3e4np
         VaT84+4NAppccfncmHUUPNneNUCLsUz6F4p7GolgxhwZjzruzV0P/L6oUh+irOp7MjyF
         pfO1v8o/4/m7Agq6CV/EXqthiSMpi4+B6OTycQ+E0jfe6jSv1nCaEOY2rbUOi9cGPfuW
         kRBDswdKuLZfopoBFGadXnRBWtS98qGK8ivcw6p10hekILdJEiL6JA/kzElBJCfzCIb9
         XozA==
X-Forwarded-Encrypted: i=1; AJvYcCXyMv4Oh6OO6/hJwamWNr8WaDWCDl9qmMKKClGJwJPSEUudiTRj2FXdyWAONsqEwQuzxi9WAa6+ClY0OYTSew==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoYEXg42azfRskfxA8+OheVq4hYcAMpsZluAniDhe55biv4U5p
	i/REEP/BlLs1hHNXrf5aPdPkVlPNM/XkAnxaY/qys+cGoIEBZGf6x69d
X-Gm-Gg: AZuq6aKu1gxZG8RvEaMX9YHTwN13kjkC7PBSt/91kOlkjTL4Y3IuJw5riQ8YUKM0bak
	FBXCQap8MiILLag+wRDLP6rdUewSkJBYO6rjz0XjmfgZW36ck59gy8iKj84LmFYINdZZ/mS0zWj
	0L2NNZ278DsxHU1uHct3gTuKlS9kvi18H+IUuDDY1vh1yVJ/fRNenT8G1K6HgQdcKspKi9dBFva
	u7lp2dPOCG9XEe3GvXt9Fhp182VJuQB/N6GVV5QumWrTURenEY5uKhaXTNJgiZzly6eKkl656Np
	N0i3wZiZKjbLhKMge4bUyRFrUFuv0yGAtAAg1fuSipYgPucpXmGTm6iICBzLx/kyLC1Jl0JfoAu
	ij+9FER4+xnqgdQTdTAKGMph5WjRF4WIraQhQXT5c0cY5/XZSB8/awBd4AdpOiGVUx0jc8C2Vv1
	qWYYHFuLsFSB+2zOhnNXy/uFJS+Onc4+nIBQnNWoSAAK9iEEWBT8QdNYZJgGEY
X-Received: by 2002:a05:7301:1124:b0:2ae:56dc:eb21 with SMTP id 5a478bee46e88-2b6b4e8b378mr8266159eec.23.1768890540838;
        Mon, 19 Jan 2026 22:29:00 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15706784eec.9.2026.01.19.22.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:29:00 -0800 (PST)
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
Subject: [PATCH 03/11] wifi: mt76: mt7921: add mutex protection in critical paths
Date: Mon, 19 Jan 2026 22:28:46 -0800
Message-ID: <20260120062854.126501-4-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120062854.126501-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260120062854.126501-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062903_170314_643AC5B9 
X-CRM114-Status: GOOD (  13.15  )
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
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 8 ++++++++
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 2 ++
 4 files changed, 14 insertions(+)

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
index 5fae9a6e273c..9315dbdf8880 100644
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
@@ -765,9 +771,11 @@ mt7921_regd_set_6ghz_power_type(struct ieee80211_vif *vif, bool is_add)
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
2.52.0


