Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B99D47CAD
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9d/7gkP0dehSO2kv5Bs0x2eBF89HHL2x635aV3XfFw=; b=vmp0qoecbgUOnQ2vSLd/3Go8Yq
	eV8n6E9icdH7ovIJDaY+PU1B/1FL/f5zS6fD7X0FlqlUW/L1Wqm6yywLm2KbCAx+PFEBW89/Qvvml
	URymEqgRDxJlln8Zm/cvGlFh1Yv+Xbm+GxkdR7ctqFPIc9Ygw0EaEFRuhigKerKdQjHaGI7MpbYyZ
	3su2IzI3Sp42Rs0ow1FFg0MXw8W+PpOXeXWtOj6TBMicXhW4yHzUDdFQbWyYymWK2Qw4c/k8dDS+g
	gtzSZz8PrsuBwsZLOobheNvKVDoDTBs2z/Ge2KPqB8L1OcV6KbGTy6tGRT6nwsHCICid/nNOzvP2h
	AKTphpdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHU-0000000DOVB-3Vyn;
	Fri, 16 Jan 2026 01:05:40 +0000
Received: from mail-dy1-f171.google.com ([74.125.82.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHJ-0000000DOPI-0ldb
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:32 +0000
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ae38f81be1so2100223eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525528; x=1769130328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9d/7gkP0dehSO2kv5Bs0x2eBF89HHL2x635aV3XfFw=;
        b=d/tsdHu4CzdcBrzckdPWzLMn6x1wwjeTx8FYJxOb7qyZA0EhyFF/ed363IwRX3g10n
         37+LRusS0bRKy7q2x+cZGK2QNORdasOK8VASyuXMDncyHtSQE4dLoAt4tEuQkCN0aIQ5
         oKpJQgzOm2EqwNKaGhDrYJJQQFXqIJIMXVt9NUvx6/ctLbgwObkPR/hCi0xc7z+SDNXQ
         TwEHkLmouaoWSmZVjmnFwu5cBJAcWLEZ9z3mfwr2KBcl0nOpMWgXw2NgG+65mKj/31hy
         jviT28p0uGFSEMN9bxeGKXhQJaG9jEiQmJkyoTp1o31Uf3nGD+eNB24/YC/h2jNp8swc
         OLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525528; x=1769130328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y9d/7gkP0dehSO2kv5Bs0x2eBF89HHL2x635aV3XfFw=;
        b=JHVWqe2M2nUkXSJIu2+1iDACvqaFfJp2eX/aruZobN3oqiAmXG3P9s108zHm6EWcfU
         0pRv+MDn1JfHonz0LuRNsb1ISkod3l222S1gxUsaEBDFs8+OozstPKoTeKW7a3D1fYbS
         bn+CFDN2aZOHQE9+8tV7lJxgpAXIWzcLCSRZbj+8UJts2wPicZhohBWqCTQxpSguNzaD
         YSWa1amIZEiA593uINZIQcfaVcVfzCDYWONVNdFK3RH4zyG1vMvyx5DA0UMWcGaqvYt5
         FfIa7Lg7JSeMDAlNVCTxOpNU1OxyMxDy0/aYuuGTAgsnDeYq8lHFICeW6cjeZ+aPucnP
         uCsg==
X-Forwarded-Encrypted: i=1; AJvYcCWufolcVz8V7gUJ9OjUY5+Sz9kJKci6Wg1YWhkPTmYyKCnIpLnFsInR+OCrCHocSOX8h420Bl1Td6l+NXuZ3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMZdOGp2tjzqi/m+84aE9RMMtB1S07EoMuJAqoc9oGA/HnCsef
	03gmwHCeO2mXVBiSTomIQMl9bhfvJCLJQKVwg45COZsMOR+WBsD8PF7V
X-Gm-Gg: AY/fxX7Q5Yz2wTQyGBN/ZFttYVuZQH53VjcXs5AZe9WXW/Bya74oW7/Tu4Y4jPsm38U
	VLjmfyWQY79iy34O9rgfE/f+kTy6CNUJEg/xsgBAfDeCS5brQ3JpsY8uez+d+EFF0RSYYxat9sN
	dpDxzG1lJ+H63zQUhXMBYaXZR8pb2GV4lhDECrwe2zepNJebn//Ighzap2fXn7Y9dkVY8eLijwd
	j9lJVk/PC9iWtjkWOKJhe3lbEcWFh/ByUW7VpKIEfcdOGN7udxDl4/PT1TyVu+R3XNiEH5MZd7p
	he2kkfc478Jm0WJH88clnhGzICERwjD4UGSHXF2dGtutLl7egdE//EnihrC3Blhz7lzf0E2VAmw
	jZ/P6enTo19lhqfzGvYCJ94nKNDEGDAArXUhSpvbWHTlAXERzPNgkgkSmTjC/PAQ05fhn6Z30nS
	G0kF1a8s88Vj6olgW0CCqL7bLEuZ+HXexPQuvKuUKlmdBz6goJaZg7nazBGq6v1A==
X-Received: by 2002:a05:7301:290a:b0:2ae:60fd:6f18 with SMTP id 5a478bee46e88-2b6b4e8a496mr1565789eec.22.1768525527714;
        Thu, 15 Jan 2026 17:05:27 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:27 -0800 (PST)
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
Subject: [PATCH v4 03/21] wifi: mt76: mt7925: fix missing mutex protection in runtime PM and MLO PM
Date: Thu, 15 Jan 2026 17:05:01 -0800
Message-ID: <20260116010519.37001-4-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170529_268645_7B8D3945 
X-CRM114-Status: GOOD (  11.36  )
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

Two additional code paths iterate over active interfaces and call MCU
functions without proper mutex protection:

1. mt7925_set_runtime_pm(): Called when runtime PM settings change.
   The callback mt7925_pm_interface_iter() calls mt7925_mcu_set_beacon_filter()
   which in turn calls mt7925_mcu_set_rxfilter(). These MCU functions require
   the device mutex to be held.

2. mt7925_mlo_pm_work(): A workqueue function for MLO power management.
   The callback mt7925_mlo_pm_iter() was acquiring mutex internally, which
   is inconsistent with the rest of the driver where the caller holds the
   mutex during interface iteration.

These bugs can cause deadlocks when:
- Power management settings are changed while WiFi is active
- MLO power save state transitions occur during roaming

Move the mutex to the caller in mt7925_mlo_pm_work() for consistency
with the rest of the driver, and add mutex protection in
mt7925_set_runtime_pm().

Found through static analysis (clang-tidy) and comparison with the
MT7615 driver which correctly acquires mutex before interface iteration.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Reported-by: Zac Bowling <zac@zacbowling.com>
Tested-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 3001a62a8b..9f17b21aef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -751,9 +751,11 @@ void mt7925_set_runtime_pm(struct mt792x_dev *dev)
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
@@ -1301,14 +1303,12 @@ mt7925_mlo_pm_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
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
@@ -1317,9 +1317,11 @@ void mt7925_mlo_pm_work(struct work_struct *work)
 					      mlo_pm_work.work);
 	struct ieee80211_hw *hw = mt76_hw(dev);
 
+	mt792x_mutex_acquire(dev);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7925_mlo_pm_iter, dev);
+	mt792x_mutex_release(dev);
 }
 
 void mt7925_scan_work(struct work_struct *work)
-- 
2.52.0


