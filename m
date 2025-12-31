Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA6DEE644A
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Dec 2025 22:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZB0aBwHBsHnm/b2GY2momvTrZBbqthwPjLSAEmi3GY=; b=X5My49cvXdNKXk5ZIVsQOZDh0X
	3A1URxZFKyrznkWRXN+FMpcyFMeq9rN+p91naN/cNYlFW7QhbaORcjo4DpEGDxkoDl2ttM2xOgZTW
	eWAlcKtN5IHzmfW4c9SAlAATXzcyOKCw+3JoR6u4N+XhVq1/OxoFeN9Ugu+5qCeYF+PP8quEaMe2B
	iPfAnb7kCV+AruTzYyoA2FqnBJF6twR3+FPZwK7PgWwsOC7Y87SAjacrAJu/swHaqWgXPYgHG27mf
	U8We+YHnaDBUGXLQabd/xEQ0U0/yVGcs1/bqnAJQoAZE7IhtO2V47Hl9edSuB4chH1XtQOZ3D9g3F
	DCkZe9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4oY-00000006OqI-1hOt;
	Wed, 31 Dec 2025 22:37:10 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb4oV-00000006Opk-2yNx
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Dec 2025 22:37:08 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-bf1b402fa3cso10857936a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 14:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767220626; x=1767825426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZB0aBwHBsHnm/b2GY2momvTrZBbqthwPjLSAEmi3GY=;
        b=fDxz+xmy0tGxZ/lQWstuBTgTK+odpqlKmGcdVw05beJWnsV7T6zpJWZeeGCczSFcl8
         WKC7d6T+E2dEsQkuyrLiXGVIorLlwrwuon2w4M10mYXwkQ9Oq1agBHaJhoHiOodUXzFT
         yVmJKKC9a3JB9u0WA7EpT3m0w6AX9ZE+NTDGmw5tMbTCTBZk7KwAkQyuU4v2NYl1nFMp
         h8KoKaneCuIM0J523+xdj9N2EpQGf/FpNWqcvzIOQpJJzB75R5A05Zrxdbv/gZOyvjDD
         P9d56iXToiUOXtjZAjZRiJ63v4bLiqmBxeW0W/ASToSr8yMJ/rCaQbEtrrV+PYFbLU20
         +VNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767220626; x=1767825426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZB0aBwHBsHnm/b2GY2momvTrZBbqthwPjLSAEmi3GY=;
        b=DhvtbwkT2Bf/7UJFqQM8fB/Ym67v0XYp0mb2UTwLMsUYvWSbN6tXGC4vvOyTo+CDIn
         9wXpEGvD7aFd+3HCGRZbVfhhLnW3B975xRRKjcb2n47s15l2Js1vcWl7H4ZP309uKRDw
         DtBz5pv5Uvm4mMDJpNqYJuDSIOUB+VHIWQxOf7WxCmNpaAMdSvUhPwMoJO0kNCDlurmS
         s/FcNIbPbv+G1uk0d1v/P5ABX5DWXohNIBHMp8aBskr/WsgksbKh15R5zph7KTZTtnMp
         s3Iky5KlDcL/uGZXCPvHKcPA3CGVej/C02kkBPmpH8u+QVjMpTx/DYwnkIkCprJNrVgX
         QpjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkXA9vxDUU4FSdlpYQNqYbPzSoQD3M1yA6Bzjz1BpfTCwpfYe+qi8qOxr/ScMGIwQ9Kh+ECihK3nyCPmJa5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvmJsxd6cO9d9akH1oSFnssjcD5W6bKHRAcXRzO0Sj5qk78A0H
	iZIS00VUY4T9Da/drFx/ZLImtGBmLELv67ZAMTauo24sPeGh77QHiUBZ
X-Gm-Gg: AY/fxX6mn1kk7yS5a/kRq+MZxPFXhLw2BR0X/MPpK5Jg2xhVMPYwsVnIj3KbXAbXnUj
	okAUepIn1iSEOXU1jzZCb6CEt7U3xclwmB3lZYojD+Gyr4y+pM3hPGHSXYtKZ6cbkIsYZnIuhTd
	lvixWPDLcYks7RjVCYY3s7uoFTPLhJblOHVKUkHCknjuHgCfs3GQdYFMjZUMoBoIGf/H+Rahe5x
	e2MqDOcUX44hZXl8FVaTDHgXYsTgk11W1hD3+mkbTZjwGq1ruc7jGTF4iJP9j4Sx16eu4np2qJt
	Yw0KAZiD+aWjx+44MRBuhyFCOSH32p3gHaT5IifXHJOeH4Mr/ELDMXHzooAv7da93nTRZNFnh3F
	gu3sOCn5m9aolQgngrLf+5gOFyfFbMBiithnckCFFTdiug0LYk05vIHU11iWdFaolSznbla9022
	RK6JHbss8KV/vve4cWNci1cJDnbEdSUAv+tPFWs6IyIq99+iNuPem7Q6U4DHQ1/g==
X-Google-Smtp-Source: AGHT+IFDO7PqMSfJ9kZvMehwUr1S7PTSmbtdpd6FcboT9jIMWivuwfE88+jhwgbCLEm+TMz2XJeAbg==
X-Received: by 2002:a05:7300:d58b:b0:2b0:4f34:eed3 with SMTP id 5a478bee46e88-2b05ec3d5e0mr20245885eec.27.1767220626281;
        Wed, 31 Dec 2025 14:37:06 -0800 (PST)
Received: from zubuntu.home.zacbowling.com ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffd5f86sm80818712eec.5.2025.12.31.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 14:37:05 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zac@zacbowling.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com
Subject: [PATCH] wifi: mt76: mt7925: fix missing mutex protection in reset and ROC abort paths
Date: Wed, 31 Dec 2025 14:37:02 -0800
Message-ID: <20251231223702.30957-1-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAA5_Hq7vNOy9oCGkkgyukq2OP=a5yL_3ZKBdmNtBXS+zp6byiQ@mail.gmail.com>
References: <CAA5_Hq7vNOy9oCGkkgyukq2OP=a5yL_3ZKBdmNtBXS+zp6byiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_143707_756787_ADB940B7 
X-CRM114-Status: GOOD (  14.45  )
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

This patch is a follow-up to the NULL pointer dereference fix (commit
6790e656030fb23527aa5c0d6eaa28ce029335b1). While that patch prevented
kernel panics from NULL pointer dereferences, it did not address the
underlying system hangs and deadlocks that occur during firmware
recovery.

The issue manifests on Framework Desktop systems with MT7925 WiFi cards
when:
1. Switching between WiFi networks
2. Disconnecting/reconnecting ethernet while WiFi is active
3. Firmware message timeouts trigger hardware reset recovery

During these operations, MCU message timeouts can occur, triggering
mt792x_reset() which queues reset_work. The reset work and ROC abort
functions iterate over active interfaces and call MCU functions that
require the device mutex to be held, but the mutex was not acquired
before the iteration.

This causes system-wide hangs where:
- Network commands (ip, etc.) hang indefinitely
- Processes get stuck in uninterruptible sleep (D state)
- Tailscale and other network services timeout
- System becomes completely unresponsive requiring force reboot

The hang occurs because:
1. Firmware timeouts trigger hardware reset via mt792x_reset()
2. Reset work (mt7925_mac_reset_work) or ROC abort (mt7925_roc_abort_sync)
   tries to iterate interfaces and call MCU functions
3. MCU operations block indefinitely waiting for mutex that's held
   elsewhere, or deadlock occurs
4. Network stack becomes unresponsive

Add mutex protection around interface iteration in both:
- mt7925_mac_reset_work(): Called during firmware recovery after MCU
  timeouts to reconnect all interfaces
- mt7925_roc_abort_sync(): Called during suspend/resume and when aborting
  Remain On Channel operations

This matches the pattern used elsewhere in the driver (e.g., in
mt7925_roc_iter, mt7925_mcu_set_suspend_iter, etc.) where interface
iteration callbacks invoke MCU functions.

Note: The author does not have deep familiarity with this codebase, but
this fix has been tested and appears to resolve the panic and deadlock
issues observed on Framework Desktop hardware with MT7925 WiFi cards.

Reported-by: Zac Bowling <zac@zacbowling.com>
Tested-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

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
index 3001a62a8b67..1f7661175623 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -459,10 +459,13 @@ void mt7925_roc_abort_sync(struct mt792x_dev *dev)
 
 	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
-	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
+	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state)) {
+		mt792x_mutex_acquire(dev);
 		ieee80211_iterate_interfaces(mt76_hw(dev),
 					     IEEE80211_IFACE_ITER_RESUME_ALL,
 					     mt7925_roc_iter, (void *)phy);
+		mt792x_mutex_release(dev);
+	}
 }
 EXPORT_SYMBOL_GPL(mt7925_roc_abort_sync);
 
-- 
2.51.0


