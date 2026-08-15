Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BE8C5CFC1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2026 10:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PT2DE6cl5YPBMy2m9I9NSThkbJzai5L9OY2FPvGH160=; b=kDNw2xPScVw3YCNXzOnKDeAoT8
	WFUVBy1TgI2WSGHyaM4qcKuF1Zb0k+DaS51Jd/a6mPzLTZTSZXxJTtfOKxfpSvd2Ar/lnpHDPNLrJ
	N3dyiWe23oLtqoXPetUA0BQEQvBgErMdz08jjZaNs5rVU0wrYOC9SMhhrvlQjSss/1dzwE5kjmE6C
	4uKbIRxp6qCO68HQKnWukHeDVvvUqca0vsAoZLDuXiXUZ7HNzpVqOdD3Dnf1iY6ktnRNWLNouhZOQ
	ptWlFByGl203eAncAUKp9bGS6kekRILTudLomA/L0P/x9DAzQnxDZ7w5B8btySOfIWNhfFV66GJru
	XpBoveaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBcf-00000003jvi-3rC3;
	Sat, 15 Aug 2026 10:28:17 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBcd-00000003jvD-2bAM
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Aug 2026 10:28:16 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-39c8e65e3f5so13615311fa.0
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Aug 2026 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786789693; x=1787394493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PT2DE6cl5YPBMy2m9I9NSThkbJzai5L9OY2FPvGH160=;
        b=ohyWVjSECGvYFjd0McncD1Lcoge15NZzHpK2Dm2JCR54yTxhuFKV4l2E8tpiFhayeS
         8n6/g0Hl3CezwEyMEBC9drwVtkNaqOqeITxdEhdV40rNganFn1Hg1uCDGRXsDPFWUUoQ
         ukH59Pc4YYn9MaZApMnkqsE4wuzno6S15HL78OlBb6th8W+ARzP6JuGOF1nKcoV4n2+J
         lng2dZ1btgczP0Q4a9xHs68cldYHO6y3oePruaxHxmDgbh++Bz46dDO93MF+slBITTg/
         a5NTL0TPRyVPkzse9m2vtDjbNXEFEr3Sg3CTlFw7a9PvxZI+PYU+sagBsz9RYwI118FU
         ZZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786789693; x=1787394493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PT2DE6cl5YPBMy2m9I9NSThkbJzai5L9OY2FPvGH160=;
        b=bxGp6W9Ueus8V1lLpO/922qJVbA3xY1sSjHT9XufEUgD8Q3vlrXzQ+Pt26W+zm00rw
         2f7chTMecKSwWBzT4QXOhR1nZH3cgTSO+jIbDySw7MMZWcfA6YUMXkyHyI/SApJBQBdd
         5CizD9j4Lb1ymEyUbF12vd+Mew3Z0mDJqx6KRAlbpui7PeO4Jp7ZyRF3qm8GIiRjDJVZ
         S8A5bTgGhGzk5pKcAXoXmDhWPWMsnu8Yr7gs9F+z5rCzTMKXlK060Tmi8qVl+x53Xi4W
         09hvlzfLMWOiYSdcVsqFxQGLs0mmevaIKwQlsWNDfaIjHYD0QH6/YZHNA3NIEX+jxOb+
         1YDA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1rLe2M1W3rZj3ZMCDcdkO33SOkLuCjn4hYgaMCPlSnFQm3PVaUlRqIzQGrprTgMI5q8CF+bMcuAjLMCEQjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOlJa7prwAvNhV6ZNHMW0It7eSdDZLfsueiv+hMNxzycniExXk
	8tFJ/5ReHdWOp1zsQ/g8zTLZs3o3UNNMzgqJahag7Xlo1v9Yurp3JfTZ
X-Gm-Gg: AR+sD11ehQQib3+0IJDycfkQnNv2KPU+avaLjye9e1xkEYa+DTCENhnylpUr5nROAgV
	UgK7Zqbr6xNFALen7IvooJQsNW6vB4zVqzm6p4oKx4iY4ehTsy7rXT3mnAys61srmW3jw4B277a
	xRXLrO8tRCUTlS3RQADdWmT7xm/KAQK65jqS1bp6Fs1AwnpeBYELplJ5r/7/fYfpq2w65M3E/mZ
	bgD8QMk6Dgyr47B/GFtLkoZj2F6QtRmEFPzWj7BspjWdvsyxUWhQGKMlS8Zu+KONz9xaL/6Z7Zg
	UBUzWL8ctkwZByeMzhT2UHyZCfcDq874Nki6draEVm3TBx6hdFhsJ+PegkxVgnHS8wTAkK0VbZF
	cIWqsp/sWy5DqapJXngwOwYXN6DjXte83NIaBehfOMVKygZ0KewoiLmxKlxZhccaQ/F19LAAzmk
	VQXoFtnLCByHv6O/+1tVk6lJGgVcTew2rRSjFZwvi32uTuaIJ9SXDWK52AVqdbzrawhiH6CaQV5
	VmKADmvhRep8c4rZsfLfBOkW5o7UI1e36rset+DGjIY49sJJkrxp3yRPLnx
X-Received: by 2002:a05:651c:43cc:10b0:3a1:5c6:b533 with SMTP id 38308e7fff4ca-3a13283bfcemr7273131fa.30.1786789692757;
        Sat, 15 Aug 2026 03:28:12 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1308d1cdcsm10996531fa.18.2026.08.15.03.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 03:28:12 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: JB Tsai <jb.tsai@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH wireless] wifi: mt76: mt7921: fix deadlock on 6 GHz association
Date: Sat, 15 Aug 2026 15:28:06 +0500
Message-ID: <20260815102806.32722-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_032815_701421_57E4F22A 
X-CRM114-Status: GOOD (  16.83  )
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

mt7921_mcu_regd_update() acquires &dev->mt76.mutex, but two of its
callers already hold it: mt76_sta_state() takes the mutex and calls into
the driver with it held, on both the add and the remove path.

  mt76_sta_state                          <- takes &dev->mutex
    mt7921_mac_sta_add
      mt7921_regd_set_6ghz_power_type(vif, true)
        mt7921_mcu_regd_update            <- takes &dev->mutex again

  mt76_sta_state                          <- takes &dev->mutex
    mt7921_mac_sta_remove
      mt7921_regd_set_6ghz_power_type(vif, false)
        mt7921_mcu_regd_update            <- takes &dev->mutex again

Both acquisitions are of the same lock instance, so this is a hard
self-deadlock rather than a missing nesting annotation:

  WARNING: possible recursive locking detected
  wpa_supplicant/5319 is trying to acquire lock:
  ffff88879cd94050 (&dev->mutex#3){+.+.}-{4:4}, at: mt7921_mcu_regd_update+0xc0/0x7a0 [mt7921_common]
  but task is already holding lock:
  ffff88879cd94050 (&dev->mutex#3){+.+.}-{4:4}, at: mt76_sta_state+0x2d4/0xb30 [mt76]
  Call Trace:
   <TASK>
   mt7921_mcu_regd_update+0xc0/0x7a0 [mt7921_common]
   mt7921_regd_set_6ghz_power_type+0x25b/0x2e0 [mt7921_common]
   mt7921_mac_sta_add+0x33f/0x480 [mt7921_common]
   mt76_sta_state+0x335/0xb30 [mt76]
   drv_sta_state+0x284/0x740 [mac80211]
   sta_info_insert_finish+0x4dc/0x1070 [mac80211]
   ieee80211_prep_connection+0xaf3/0x1740 [mac80211]
   ieee80211_mgd_auth+0xcba/0x1a00 [mac80211]
   cfg80211_mlme_auth+0x47b/0xab0 [cfg80211]
   nl80211_authenticate+0xa34/0xdf0 [cfg80211]
   </TASK>

The kernel then says it outright:

  INFO: task wpa_supplicant:5319 is blocked on a mutex likely owned by
  task wpa_supplicant:5319.

The damage is not confined to Wi-Fi. wpa_supplicant blocks while holding
wiphy.mtx, NetworkManager then blocks on wiphy.mtx while holding rtnl,
and everything needing rtnl queues up behind it: rtnl_dumpit, ethtool
ioctls, cleanup_net. The machine is left with no working network stack
and needs sysrq to reboot. Since NetworkManager retries the saved
profile on every boot, an affected kernel stops reaching a usable state
at all once a 6 GHz profile exists.

Before commit e88098133ed4
("wifi: mt76: mt7921: refactor regulatory notifier flow") the function
was lock-free by contract and its callers supplied the lock: the sta_add
and sta_remove paths already held it, and mt7921_regd_notifier() took it
explicitly. That commit moved mt792x_mutex_acquire() inside the
function, which is what mt7921_pci_resume() needed - it had been calling
in with no lock at all - but it left the two mac80211 paths taking the
mutex twice.

That those paths run with the mutex held is not incidental: each ends
with a hand-rolled mt76_connac_power_save_sched(), the half of
mt792x_mutex_release() that the core's plain mutex_lock() does not
provide. The lock-free contract was deliberate.

Split the function: keep a lock-free __mt7921_mcu_regd_update() for
callers that already hold the mutex, and a thin locking wrapper for
those that do not. The regulatory notifier and the PCI resume path are
unchanged.

The deadlock is gated on the band. mt7921_regd_set_6ghz_power_type()
only issues the update when

	vif->bss_conf.chanreq.oper.chan->band == NL80211_BAND_6GHZ

so it takes a 6 GHz association to reach it, which is likely why this
survived seven -rc rounds unreported.

Fixes: e88098133ed4 ("wifi: mt76: mt7921: refactor regulatory notifier flow")
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

#regzbot introduced: e88098133ed4

Not addressed here: the "if (!dev->regd_change) goto err" gate combined
with clearing regd_change on exit makes the sta_add/sta_remove call a
no-op in the common case. That call site may want removing rather than
relocking, but that is a behavioural decision for you.

Tested on an MT7922 (mt7921e) on v7.2-rc7 with a lockdep and UBSAN
build: association with a 6 GHz AP completes (channel 37, 6135 MHz,
160 MHz), roaming between a 5 GHz and a 6 GHz BSS exercises both the
sta_add and the sta_remove call site, "iw reg set NL" and back still
reaches the regulatory notifier, and a deep suspend/resume cycle
reconnects to the 6 GHz BSS. dmesg is clean. v7.1 is unaffected.

 .../net/wireless/mediatek/mt76/mt7921/main.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/regd.c  | 20 +++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7921/regd.h  |  2 ++
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 3480205d5fb9..68a059504e83 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -802,7 +802,7 @@ mt7921_regd_set_6ghz_power_type(struct ieee80211_vif *vif, bool is_add)
 
 out:
 	if (vif->bss_conf.chanreq.oper.chan->band == NL80211_BAND_6GHZ)
-		mt7921_mcu_regd_update(dev, dev->mt76.alpha2, dev->country_ie_env);
+		__mt7921_mcu_regd_update(dev, dev->mt76.alpha2, dev->country_ie_env);
 }
 
 int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
index c0e2b48a50bf..43193c436ddc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
@@ -71,17 +71,18 @@ mt7921_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
 	}
 }
 
-int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
-			   enum environment_cap country_ie_env)
+int __mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
+			     enum environment_cap country_ie_env)
 {
 	struct mt76_dev *mdev = &dev->mt76;
 	struct ieee80211_hw *hw = mdev->hw;
 	struct wiphy *wiphy = hw->wiphy;
 	int ret = 0;
 
+	lockdep_assert_held(&mdev->mutex);
+
 	dev->regd_in_progress = true;
 
-	mt792x_mutex_acquire(dev);
 	if (!dev->regd_change)
 		goto err;
 
@@ -100,13 +101,24 @@ int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
 		goto err;
 
 err:
-	mt792x_mutex_release(dev);
 	dev->regd_change = false;
 	dev->regd_in_progress = false;
 	wake_up(&dev->wait);
 
 	return ret;
 }
+
+int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
+			   enum environment_cap country_ie_env)
+{
+	int ret;
+
+	mt792x_mutex_acquire(dev);
+	ret = __mt7921_mcu_regd_update(dev, alpha2, country_ie_env);
+	mt792x_mutex_release(dev);
+
+	return ret;
+}
 EXPORT_SYMBOL_GPL(mt7921_mcu_regd_update);
 
 void mt7921_regd_notifier(struct wiphy *wiphy,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
index 571f31629e9e..2ea12d3861fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
@@ -8,6 +8,8 @@ struct mt792x_dev;
 struct wiphy;
 struct regulatory_request;
 
+int __mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
+			     enum environment_cap country_ie_env);
 int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
 			   enum environment_cap country_ie_env);
 void mt7921_regd_notifier(struct wiphy *wiphy,
-- 
2.55.0


