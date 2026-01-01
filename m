Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E50BEEB575
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 00:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7hP4/6MzXBlCphVpjUPnbzonToHfVmgk1yWMeGEYqo=; b=yjj2jSTMazl5UOVw930ow0acDZ
	hZnD7qNWpESEJ4ZoBg+ZXmf4NSNYwvn7rYshrl/WwZSntoJRG7RzgHLnRKrKj8dJ+gLjVxR9yaxtH
	vGkFSdPp6s0ClG1MOO6bcUL/n5IXycnbZygFQsZqGy4AKle2mJuuribF0ucB/m+XAXPyYn6TsAgSm
	hJGlJYvYLX9z4AeOPq6dbUU6oWp1IhFkI/yrh+69A/IpDxz+bwTIz3rFJcVNPF4rxmkz3cKX6hQ5Z
	JIbu6ewJmzXskt97mrQEJ/Xnt/QxHQYDMUxLIl7ImvJws8DCjUgt+w7x//G1svOgoU4PKWiJkhxaw
	jCYQcxzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6Sy-00000006SPW-3peS;
	Thu, 01 Jan 2026 00:23:00 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6Sv-00000006SP5-2TeZ
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 00:22:58 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso8881658b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 16:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767226976; x=1767831776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7hP4/6MzXBlCphVpjUPnbzonToHfVmgk1yWMeGEYqo=;
        b=Ar3cFj7YtMosxBjGZrGrE5UFVatyGIujQy5SmY4PVCkpoQsGWpJWj81Me54OGJVIuW
         sNq6sRSv6PgeG9+rc+jeBKYztx77zFJdTzx3tea3zoU48n28oEvPJYAk7cXK4nKyxFUY
         0FWIGkdGv31n2ucQEfXZ2YAYV9vVRthYverCVDJFx4X9jlvXut1+LVimF7rusFofjXD6
         OpoNdsquunG73k4mbablXyEEK5dW/ZhasKBNhzNZMaf8ITgDgKhs5aXettWtJSTnauTe
         sUwk0XU+LWJN6mQb26Mnp9zlCGBX5fC4Nom8h7YACXhaSk0oGwuVBhhPkQjejeu+CcGu
         dxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767226976; x=1767831776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C7hP4/6MzXBlCphVpjUPnbzonToHfVmgk1yWMeGEYqo=;
        b=UcPCyZbTVrsyz0Ok/DiyvixNeK993UmonAtZTjraKuR4mGAP6Wt5ZnlZIOXivTg99/
         yeeqicuymM+ncSJEpsn6pporyUhAGBEkZTM85rv+IrgZXUF/odkqOqUkeQxGpylG6txD
         fOhCaHse39oWqPewJNuRmkple63hhTPVRSYOHOBefTUn/icwX/rHgH03dQ+CPmVa71R3
         YXSRjG5ZonZUvWUS00vPtH9ZK6mNJxrUzQnkn2k+6xS8PIFcRyG9wbzlRceLUg6brj5k
         5xwSdHZaj7daJrx1J6QgNvHhwl+LicD8Wm3OPu+Bf1NCWyXfAWXsrqpE94uoyqssjT+k
         PHzA==
X-Forwarded-Encrypted: i=1; AJvYcCUy+VzKIBLiRCRy2D0Q31xWj0uXLjfcv5+p+o8xIocnrIEpg0wC/vT9iWN7d4Y2+SbIauHEl1+bK2QSH8vJ/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmoE4JpfbPHYf2C/cmttrs2CZhk5OAq2wh4xJOfTHOn82E90C8
	s+KY9mPn9HiOuhlPHzXuiNUArAIuqa9Q6lghFV6wfws4amWKkzdIX3Qy
X-Gm-Gg: AY/fxX5l6N4l1BYd24Q1Qipy5ihcMpHd3Uo5Srpp3wG7N4KPkyuX4I0bw6f3c3DpnUV
	GrtPOgzFjsWKmTRjDNE6KlPee3Qkc6P4nW4s4nNttK/f507vhbosWBjd9nNU2UpyodtqTQxpwOn
	Z3ydSjwC+ZgzVx4shYZL8q7jTQpVrrtgJBPjkYaAPUI+jaRT2jJFpHwzpGnPFJlbeIZcy2EhWsz
	e0oX3apHwVv/8QfwuNjBuv33AqM+GY+BLwMEsY3vA6BKXvgifliL/6SHb8DGsqwlrrLHgkIOtyz
	o4di0MMi62blxjzJzvEJzN6ee+WIty0ZRU7CGc567OPSM0M78upe6i/PjI+XJIRFQLiVyRGu0eI
	L16LaLQAPoJHqvwVv75y5B1KIvfPckyPmGAyFjUnEQhr4dvbVjhVGI7xy7XpKVKTeHO+WtyE4+T
	r+8+PGYb6Ixl4lz4sinijIcdaW1c13Za3cXrTe6TwK2bPODdNLnib6Gbng4y1eN5AR7ExHT1cJW
	g==
X-Google-Smtp-Source: AGHT+IGvR3F8ZvfS9X6tm+SOPzohfY0S2Rtcb+Z9cxmiC/usD4FDeoHXUceXcAntkCJaJbwQT2hJig==
X-Received: by 2002:a05:7022:e24:b0:119:e56b:98ab with SMTP id a92af1059eb24-121722b7ac5mr34376559c88.18.1767226976361;
        Wed, 31 Dec 2025 16:22:56 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm110976431c88.8.2025.12.31.16.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 16:22:55 -0800 (PST)
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
	sean.wang@mediatek.com,
	zac@zacbowling.com
Subject: [PATCH 2/3] wifi: mt76: mt7925: fix missing mutex protection in reset and ROC abort
Date: Wed, 31 Dec 2025 16:22:53 -0800
Message-ID: <20260101002253.19078-1-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251231223702.30957-1-zbowling@gmail.com>
References: <20251231223702.30957-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_162257_638541_4D001127 
X-CRM114-Status: GOOD (  10.32  )
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

During firmware recovery and ROC (Remain On Channel) abort operations,
the driver iterates over active interfaces and calls MCU functions that
require the device mutex to be held, but the mutex was not acquired.

This causes system-wide hangs where network commands hang indefinitely,
processes get stuck in uninterruptible sleep (D state), and the system
becomes completely unresponsive requiring force reboot.

Add mutex protection around interface iteration in:
- mt7925_mac_reset_work(): Called during firmware recovery after MCU
  timeouts to reconnect all interfaces
- mt7925_roc_abort_sync(): Called during suspend/resume and when aborting
  Remain On Channel operations

This matches the pattern used elsewhere in the driver where interface
iteration callbacks invoke MCU functions.

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


