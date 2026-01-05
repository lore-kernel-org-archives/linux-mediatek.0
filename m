Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC48BC2A074
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAgVTP0BzLqwfWTeezG65MLKR0/RKkukMTGhqy2j9so=; b=x05Dpgl4w+9dG8iDlB2EHapyyD
	YLRVGI6XbZIatlOXO8BdnhyYyA6KY1tLJXnSUhVqUQIMVYpbIVogxRQFCLF2ReOgiFQXrhEEHFNLf
	GWGMrkjX0fy81HFzi7VSFqFdLBjrEfKnTk6e6qgd/76/piuFnuVWYZ8MnXVJP4BuqbbTeDfsIy0HU
	wZNDFIb/AO4Tq/e4J73dc5dUy4QDyRtnjXa29mz25jhkprmLSp5s3OtwbQ040e7j3+xKuopkdVb+A
	phuAf7DKkeGGV09UKfFimaBV5E+e+OAG/0U7keLwEi2UTlGyYWglN/6gVEIBmasfYD8mU4U4SjVH0
	qWkXJJHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYQy-0000000AZqM-05qo;
	Mon, 05 Jan 2026 00:26:56 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYQv-0000000AZp2-1TqY
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:26:54 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso19047803b3a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572812; x=1768177612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAgVTP0BzLqwfWTeezG65MLKR0/RKkukMTGhqy2j9so=;
        b=K7alcCLmn+abCW0gHRD0RTdBH0NXziDHpLRX6gKKeoljzRkOGJBVaLs+rcQaDjMf2X
         NkZcOeXTgNdO4bcTwtmygMooeVzf6ZeftRtWLa94vD5BHBL9KMfI0ZOHr1dJ+Ien8X97
         j9oFOqQAEYAlc/WihUoSSFmgHyJj7gUpo+m2V61JzBXwR7D6WWpD5sv6333uAkMprzW6
         7GwlC+VAAbr5QbL8NmFD0LKxHOfbrflys5dS6+fpaFsBCdhFAVnjB48E+zv3Ris0IKXw
         G7QIqlOeoMGFG9pdPZ106uyAL0+y2h+YhpCc3tQN3b/kyFJqWT7rKinofPaFw17/Ofz2
         1qSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572812; x=1768177612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xAgVTP0BzLqwfWTeezG65MLKR0/RKkukMTGhqy2j9so=;
        b=Jhyv/MbheMNuwWvNZlCmq0VuqX7NyaAemUvuaLlykD7ooEYyRwV3z4hWW5KQKD3VqC
         lO+JTsMtokfuKN+MYGlLLsqUO9uG81UB3KrrIVSMJLiIHg8qjOECm+D6/WdDOMFZ1Bo5
         4zRjERZSXdOmdqUrTtkaz+229Expx8epZExoPJjNXHcYT9+e/Urkauopp4DyQnZyn1jy
         wd6Up/nWHLRspQ3MP00ER7t8Bn6eZhBPYe03Mrk/AM7CyhDIAkvfhomJXI+SlBZ1U/oI
         QTrU/BNpnsimRTaivBkzrcuGUV/hgxxN0ricGnuBX6S0H+vaSPwbUY1C/UB/LHcYTExY
         XMBg==
X-Forwarded-Encrypted: i=1; AJvYcCXhrgy3bn6ms/oWBJ/nbQffSrZCQVG29HleJG06iYBK+eNbLnK3gwbn//mKsWL0OeBIcRMTkYDZ7orzTC2Evg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpwvX0TPQfRJlOCI41cWFUSvvLwQbUzIOAd2iOXwtsPSjtG/VA
	p9ut3zWoPcCjHDAvAuXDLnbq9an3jwuf9WpF7gpGRmSFGB0h+01WD/bv
X-Gm-Gg: AY/fxX58W8Yi/mAEBaI+d8Vj6aulbBxwbJgnKoDkGKbQzlzGb7d1iAYjIgN7hbplh9T
	rlKXoV5a0264H6UwmGBZSYaM5rV7BfiLUWrZ9hr0XiJed2LqJ0mwe9aS8pLGyGWIu08wKxM1syV
	CuYBX9Mx/8TzqBkT2wZlhLsSjQGSlQpzmeYAN4GsT6F5NMvUWte3XW9kcpJaLLrFeu+yXC2X1zP
	VjHzQ24qtsmi/abbH0DtgyGnJRBKmS0kdh/vGSYHMXHMeEAeQ90TQIzt5mXuJnl3sg0fZpUBKmi
	6r0QgA1sZQi6UWwhxj5qv4m8biTLHw9/9bsOUknVAyp8upAHfHV9g9EcTz0rsWFPPvg6j0F6epF
	91EWsDGpbn7cxId9aTGm90+BxZlF5hbFp56m6w1WnAtam2aGQ9uj1WkCwzdUzIrBWuabCf+qREK
	+bGYtEoe6Pp22v+s5zTKU7hMgcclRjyX2kOoShJqIHMc/Wsg8cZ4IRd3shvxYlqYc=
X-Google-Smtp-Source: AGHT+IFKYGpXpbeOzNKq3w85a9004NHjGaMx7/DnJGknvJa/Jb0muU+WLPE3Jt6/U31pHd5HhFvK7A==
X-Received: by 2002:a05:7022:f902:20b0:11c:b3ad:1fe1 with SMTP id a92af1059eb24-121722b1a7bmr41061173c88.11.1767572812230;
        Sun, 04 Jan 2026 16:26:52 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:26:51 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com
Subject: [PATCH 02/17] wifi: mt76: mt7925: fix missing mutex protection in reset and ROC abort
Date: Sun,  4 Jan 2026 16:26:23 -0800
Message-ID: <20260105002638.668723-3-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162653_393932_D3E40F15 
X-CRM114-Status: GOOD (  12.21  )
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

During firmware recovery and ROC (Remain On Channel) abort operations,
the driver iterates over active interfaces and calls MCU functions that
require the device mutex to be held, but the mutex was not acquired.

This causes system-wide deadlocks where the system becomes completely
unresponsive. From logs on affected systems:

  INFO: task kworker/u128:0:48737 blocked for more than 122 seconds.
  Workqueue: mt76 mt7925_mac_reset_work [mt7925_common]
  Call Trace:
   __schedule+0x426/0x12c0
   schedule+0x27/0xf0
   schedule_preempt_disabled+0x15/0x30
   __mutex_lock.constprop.0+0x3d0/0x6d0
   mt7925_mac_reset_work+0x85/0x170 [mt7925_common]

The deadlock manifests approximately every 5 minutes when the adapter
tries to hop to a better BSSID, triggering firmware reset. Network
commands (ip, ifconfig, etc.) hang indefinitely, processes get stuck
in uninterruptible sleep (D state), and reboot hangs as well.

Add mutex protection around interface iteration in:
- mt7925_mac_reset_work(): Called during firmware recovery after MCU
  timeouts to reconnect all interfaces
- mt7925_roc_abort_sync() in suspend path: Called during suspend to
  clean up Remain On Channel operations

This matches the pattern used in mt7615 and other MediaTek drivers where
interface iteration callbacks invoke MCU functions with mutex held:

  // mt7615/main.c - roc_work has mutex protection
  mt7615_mutex_acquire(phy->dev);
  ieee80211_iterate_active_interfaces(...);
  mt7615_mutex_release(phy->dev);

Note: Sean Wang from MediaTek has submitted an alternative fix for the
ROC path using cancel_delayed_work() instead of cancel_delayed_work_sync().
Both approaches address the deadlock; this one adds explicit mutex
protection which may be superseded by the upstream fix.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Link: https://community.frame.work/t/kernel-panic-from-wifi-mediatek-mt7925-nullptr-dereference/79301
Reported-by: Zac Bowling <zac@zacbowling.com>
Tested-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 2 ++
 2 files changed, 4 insertions(+)

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
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index c4161754c01d..e9d62c6aee91 100644
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
-- 
2.51.0


