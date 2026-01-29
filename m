Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0073D358DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jan 2026 08:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDaqmz+jOzRuCeSxlUAdH2cvfPDelKI52XxXT1MsurU=; b=nGYqoffSTwJBwOmSe7lZd2LQ3R
	RaA8/z4NrxDSMEx7JdjFlbMolGSszi3biaBMbjG+tdPHVpSrIIhezG+2P3rUb/r2jwOF4/33XGzde
	AP6UxuwBVGvts4nf6UQGl2v2D9dUG7+qn50rxNrw+C/eFVtTWG3FSqlp1M7wc+z3tFw/OJ6xk9AQL
	xdR1uFeTlFP7aU/h7X2fCIRHpybQyg5jj0yAo5+XNyoWpoTqHoDp828hggYTJnPcmjNHDDVFoK8lo
	OSHRFTuofTX7URno2sSn20pWR1Goml3ol9aKPnJsoQA2cFewnwR3albmumgQkCWf4unPDlBClYwU2
	u14jjkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNEu-0000000HRr3-42n7;
	Thu, 29 Jan 2026 08:18:56 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNEp-0000000HRo0-1uvF
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jan 2026 08:18:52 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-12336c0a8b6so1318104c88.1
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jan 2026 00:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769674730; x=1770279530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDaqmz+jOzRuCeSxlUAdH2cvfPDelKI52XxXT1MsurU=;
        b=NHDFXzegWMETSnE7I8rpsNMuknqLI8kncWI1ydwOIsR8KBPUs5BiOW3xpr51IiWyxb
         Kit+AfVSKbM4NQcYpptgGD6cFjB+6S2WNjnV1zU142GAuVSVqSC2AmBeYRSW+bKenwDq
         v7Ee9l1RgPOhFMSnqp+wsb2GhCA0RWvZfusLMox4qx4oBn3cpfouATYPF1pdgAfzWChi
         qrLf1lAFWj2tF52iki1IYBVp7BE+hrL9VeWIlILW4CfYC64U4YPorJoBWkZC/lSrePbx
         UGe7w97VJdrlFpeh7FmfvKPHAx5SmK5zpTxPmmGDTPbCXVwo7FsWicrqw5hzpMZz/FEB
         HaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674730; x=1770279530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IDaqmz+jOzRuCeSxlUAdH2cvfPDelKI52XxXT1MsurU=;
        b=nR0129BYDCaRFrJ5n6Jm8ON35lk5h6X6pOeYmCWuQpnkyEZgGWbvj7VixH4dNyDXF4
         dI2ofwrzoQ9YoyiWKOVPhjfIXQjRS2r/iSdIlEqa0BupkuUDwvANFhJSQhsg+ZDAC80A
         6Jb9F8Hmsj/CrQ3wClvkx2Vd2QJJ8k7d/jmEWxmfxKT5PCIV6es8sPxAxpAPvt/XdjmH
         6Ffshz6Y7g4Zc8WAiNWdCD98Z15xfuQlAEVsuyJIGaidEEoY9vnG4G1pUx4sNG1Svyqt
         ddelyQqleMQndQWDnDh038j1p9lPj+ymGJ+ws19Ph7e2SoVWvBz/bMDrVSrVFGVxhYWs
         OZXA==
X-Forwarded-Encrypted: i=1; AJvYcCVHgmGlXjZSr1WTWgGU2tdeWhXtuP1jesJWax7B8dWVLSpVjQEgR2sdXD3NuWDJzI9+9HitueOnFEwWnr1QyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFUCmOHbTrLG9xQJtThknEJzYysuhWkt9eAyHVTZR7+hElj5gk
	ZZmP8ghtkwyxS+QZunJDBoUezcTXo2L0SO+TGtVlbZqjF40Cm2gjUfPF
X-Gm-Gg: AZuq6aIEFvPb7N+Rt3A3bkwZLjhxI2t3IidqeHSjP6KYEhaiDKSioqc7i1TbJE9bqVV
	upGg3gmkIBEsfaj0/wEiT7QRjdFZw7hKHiR80jh8mNShHLN7cr9NbzLnDjybAOfty5WVPtj9KGY
	1q5fJgSjtSvbzfpWlts9jjU8t0/c7rKSol7s0ATti8FR1XeikZ9YVVaEC06kkDSKkuZJSCwnWHB
	s5P/dZMxUmlgG61crta9gqYP9jEBQgDuiJLMutAVLMlxbRKdaNnrRF4J36n5JiyIgoE2csrEZTD
	W8LsXb3r/KmT8LAfbXyo9kPppajt8H1S/SUoJN+JooXG/QjBAKBm2JHp/Yer/IwyWWTkAGE1uKg
	9wcpGIRtYhZLPtofOI30w8r5mClKgvFWHMwO31nF3c4poFOkzv/1elYnWCmDumj9LUdJ4f7VKqm
	JsxFbsB9uBUEoq8DoFOkb+lExNA40cqUAq+CfjTDytm3sQSnypYdNdru+5UiHZv4puQi3BvwQ=
X-Received: by 2002:a05:7022:e0e:b0:11e:70d8:5dbb with SMTP id a92af1059eb24-124a005f9damr4371735c88.7.1769674730326;
        Thu, 29 Jan 2026 00:18:50 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efb4casm5483508c88.16.2026.01.29.00.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:18:49 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: nbd@nbd.name
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	sean.wang@kernel.org,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH v7 3/6] wifi: mt76: mt7925: add mutex protection in critical paths
Date: Thu, 29 Jan 2026 00:18:36 -0800
Message-ID: <20260129081839.179709-4-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129081839.179709-1-zac@zacbowling.com>
References: <c9b81e89-cd29-44f2-b4e8-0179b2049c21@nbd.name>
 <20260129081839.179709-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_001851_539132_2667728A 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
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

Add proper mutex protection for mt7925 driver operations that access
hardware state without proper synchronization. This fixes race conditions
that can cause system instability during power management and recovery.

Fixes:

1. mac.c: mt7925_mac_reset_work()
   - Wrap ieee80211_iterate_active_interfaces() with mt792x_mutex
   - The vif_connect_iter callback accesses hardware state

2. main.c: mt7925_set_runtime_pm()
   - Add mutex protection around ieee80211_iterate_active_interfaces()
   - Runtime PM can race with other operations

These protections ensure consistent hardware state access during power
management transitions and recovery operations.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 device")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index f1f0bc9eab04..88cf214ab452 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1330,9 +1330,11 @@ void mt7925_mac_reset_work(struct work_struct *work)
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
index 88ee90709b75..82de6f30ec27 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -770,9 +770,11 @@ void mt7925_set_runtime_pm(struct mt792x_dev *dev)
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
-- 
2.52.0


