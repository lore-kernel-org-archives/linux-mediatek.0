Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0731ED47CA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3AlYUZTasc+1BNyrEOuxrME8CBfLRDkLtwgOBsYdMoM=; b=lYUnE1agqyUX2HaD3IJhkD9uk/
	bdJ6Oafs3Bq6XCrJMibs6lkfcvTIKKeYV4FMVqf9Dt0bkZkwo78YTzH2GY56W9IawyZbs1YvvepUo
	uE/99DLfs28CzrZ+qtVzM/4PdOLYCRbu6oSiMvFdFD/bARLxxTQPVrFZQK+C4qk4NP4NgBH1sx8VF
	RzEuqAoFWrm1dScBt0luCoZaxzut6enQ7FgPSr4q+RFvjEIIGVrMUoSxFgDsKnrOrdYRDJPOrZTGz
	NY3ETNAxWba4QlklGa0kHs2v42239SfThtoU/Pz2jCWeol2rBdAjaKDsfWRFz23Il334u/mv0zEk9
	tIXkBt0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHO-0000000DORk-0EeE;
	Fri, 16 Jan 2026 01:05:34 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHH-0000000DOOV-2XmC
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:28 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2b6bb644e8eso30925eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525527; x=1769130327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AlYUZTasc+1BNyrEOuxrME8CBfLRDkLtwgOBsYdMoM=;
        b=Ue4iI3fq4JQcE5TIg1ldxhgDK1HfFYG/rgyx7V9bwOnKFkUQqXqY+BW6CgbFlgEi69
         h0aaHv8u/9ZhxhBIDvFiXEev9R2MnQeEay4+3fM4RrzC4EX5vYIAem0pdMKa9kLBmJV6
         xafme0MnXxaNkCVMafesc/EFWzOyIVDWFDhnZ+odtVgZwQNUNQlImDUCT1VE6y9pR5Lr
         Py3JWU7LBJ0Ds0Y5a2o7vUfd73tVPRKFHHodxSsiB3VKJm/o7xCt24N3z8bzvNZqn9et
         smvepf5QucX98oKjZ1aPt4lWaPaWeEbOnaxkA485agVM5ue5US29NqgITvjsSLHtMF84
         07eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525527; x=1769130327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3AlYUZTasc+1BNyrEOuxrME8CBfLRDkLtwgOBsYdMoM=;
        b=KNlH5QtWDam58dNJEVl77wA0kMFwZ45EUb7ZCYF2CA0eSHr4nK4wihBgMVQeHNRCGe
         Qcm/qkqzi5iJRH6qf62Z48yyVklhC9ipmPdvkFEuaaWz+8ROGigLWPhoQ36gSmTDfXvA
         s/XAfGKH7MkfIXg5aJEjVYzXP592ivpTfwHJBRgjxKLJVpdELfkAnFJFRDkKsLF6/V3N
         I9YcG8tMZ5dFYE3idlQJqr58M/Ml0PU5R3ySCvRLMo524le9yxHCggxSAkLKw9JQFynI
         2Ncl65u8/G3ZsFNePFxuFuN90lh9SKmR4es88mY3fvVAP1+YYKcFagdVBF2BT018i2Pi
         siCw==
X-Forwarded-Encrypted: i=1; AJvYcCVBjMnWox9BV+uUWUvFUL8iV0yDBnv6fVFKC4CQCNC6GR0S5fVVQ5wvnKKLMVoXNA6jlrli1gV+7QNRWk7QgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGx5Q4QFByi9do7duhiNArQ5kZx8AlPgF4G3uqAakkio2nzZ3U
	ru3+7irxxTh3G6xDT/YEUbXeSteiQaOYAwQR0DGvUtZvLBciVYNQNDva
X-Gm-Gg: AY/fxX6kNMv+KCTOXeAUqCXG2ac6jqG1RGUcLaI6/3fj55Z7UswjDhGu3UpydZ3a+ZE
	JFKAQ8eb+PrxyFlgt/tZtsugfhDfCXdVNVi2C01kwRAVplfL/xNlqjxTO4OGyx2QxTyobwAQHUF
	S9K16GL4MP6ytstu5FkP1/56SybdiXLsspdohZoO5h0UrkoT6ox4Zj+kmANZECC2vtxfpkiUDcE
	ieoOlKV8hHSQBqKEizzKG9SQM3wg1gVg1rcVN9uTwp5uHQZsBJskzzONBJqmh8uFXoBzafp9o0u
	5SdmwxacXvKJF5Yqmt+e+A95BlyH6bbW/ksBslSMliYQPXifI18iyJSu3aEY8LCXUlaR+Jya3mp
	OrCuCxmRX8wLxx/oRFYzM8pG06No+pkoLQvA0TI0GIyP3ubRVm7B6Ws1ZuHWuWvDNq6G9lgK1eb
	UIXix5HOvTz/BwBIVV+dkMCWm5I1SD8Qvvz86JG/l89aiVsS/4WaJW62+QiN7UnA==
X-Received: by 2002:a05:7301:650c:b0:2ae:51ae:5cfd with SMTP id 5a478bee46e88-2b6b4104264mr1496968eec.22.1768525526187;
        Thu, 15 Jan 2026 17:05:26 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:25 -0800 (PST)
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
	Zac Bowling <zbowling@gmail.com>,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v4 02/21] wifi: mt76: mt7925: fix missing mutex protection in reset and ROC abort
Date: Thu, 15 Jan 2026 17:05:00 -0800
Message-ID: <20260116010519.37001-3-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170527_646752_E81254B8 
X-CRM114-Status: GOOD (  12.20  )
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

From: Zac Bowling <zbowling@gmail.com>

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
index 184efe8afa..06420ac6ed 100644
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
index c4161754c0..e9d62c6aee 100644
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
2.52.0


