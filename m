Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8DCC2A073
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGsItTLYZ1AgpgK0DoAEs/2zR0B3ANCxJg83nnOaKnY=; b=n1klraAGOk877YaRnGR6lKw4u7
	0/hDadlGJyqSzAO9HzIyakEtoRqie93dKg0STBR0ugjD7eIawnNhmMa/iaE3imPIzCxONSJq1M/wS
	m50W15pnKBPQHsABKx45LD2Kh2oHJRNRbG7UirUZ5AaLlVr2Gt/NP/PjtCGxWIOxjhpPkgYREFCid
	FlQpKvKs2wD5VOde7WAHSt7OG1BvY7f2T6T0EGi3LDQ7FThZzUjnOC28so8b3D2cwYlYmXIzIiqom
	jU1w2VEe32UNmq+ZYkqXTQO9JeMyxY6CR5VUsDayfC6A05Ee5Xsz+8llO1idXK4frAv8XziLxnuQ1
	gbo/H1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYQw-0000000AZpn-47yf;
	Mon, 05 Jan 2026 00:26:55 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYQt-0000000AZoV-3ESQ
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:26:53 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c4464dfeae8so1153602a12.3
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572810; x=1768177610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGsItTLYZ1AgpgK0DoAEs/2zR0B3ANCxJg83nnOaKnY=;
        b=Lj2aEwxnNXKZnsBhU3xDDDBHuvMlZNMxhIPkkKqPTYZXaQTcI8PZ0vtUefV0DwRvLx
         w7MPipipxUOaiERDAq89QyQ+ExRiXw5L/NGto8eZhYHg8Aed3cZ9IEG4zE0RJD+yirJ8
         tL+afUBP15JSR2QHV4H8rjgXtzA7Z8FJvbBkwmaZsjTFe+8zCyZNElpuQfAhAJ1ckZM0
         JeGYVNZa0Gr0+2lWLJcoq13vEhYo7sN+heVnXPFimUNSAlD89i1jejXzUjzTd0fAIqIL
         zDsvhnmeNbXApyS5Ec9mc4+k1xtQX5HMrckcVdhgaLBY4C9u4LO3V+SV4gxXG2NAkATx
         bJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572810; x=1768177610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TGsItTLYZ1AgpgK0DoAEs/2zR0B3ANCxJg83nnOaKnY=;
        b=qKG6v39UPAFPv2RN2EA9QPQK1VxPOJEK0AkjpkkEfqq9b9a7OHqKzH4VtXdTzcUMKa
         BljOdDKszbhl0nWeKXbdYdyzA2Uma4DOelCDNvXFcs5ChM5QzLZ5hux+626VM8w+K6xT
         1QNbqUfxilTHXOfW3kXPbHEdZv3J98RBXy7Qaz+3xvcY4zLiv7PpmD14wqIZUyxvPSqa
         EZ9ck7FjS+wf4OJCE+oZbTkLn8fXZxw1Qc9fH/hTJYORdn6gI7jzshemN2ZxR03jTT5T
         ODS4juMRcREiT08t8d2rfkOljjPDtah2HJx1ch32+1oo9mdQob4tojutghDomG4uq0Om
         6O/w==
X-Forwarded-Encrypted: i=1; AJvYcCXVeTupscjCMG3euMYMvNUN5YMraf3vUKNUbRApMEy1uRirNO92Co5PEBhDydVRaO2BsBYkMJ/YMi4wazQARw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6OiJiQZ0gHadAEX2PYpbUSLzP9ex0ykqmioVoa1lWjIVktIsa
	T5uCuU99AHjZ7noA8QAts5w/8934ENEnbYdTwuEbmq+Yyl3HmcmtgjRp
X-Gm-Gg: AY/fxX73m2+jlbAFymb/ygvCGBWh38dttYpB9rOPZFRWz5EyVGDJWSf1A/jJovDoSyA
	oI9Xt+9zvo3ZsBP8S+GbtXsQPCO1gr2msM99FfNQzDfAFSh00gtSG0QKOJUSr4YWHNivwMeeAy2
	eyrXuGJRBUaN6TeR9MSFY382McJyL09srWi/zJ9WE/y7FZ5OY5QAP27GGWKM54yKtTFsrQYIp5o
	Rv8eBuxHDtZoHd1xfGHktnIweMrg2M4dsvqo4C7EAYmBQrZ8oaO4u6KvLahJMD0OlmDdBoT0zgH
	mVziOTcauOHQfGIdj6N+slUpC4H7NUoVRyduThFsIQpjCZv0XdVPXA8HtZTDnsYWGVzD6HkBbLi
	uGo5F+aHMf10MC4Q134XnsE+cdXC4ZuAXup4IythZ06Xr3jJnzWxNIanV62lLRpOj6/j4I6FogD
	u9jMGTte01C5GIvgFPmkrcxcB437ZH4IFajuVRqhCOoFXqfe+z1xHanAHUE9m3PwqbgirPKcpiF
	A==
X-Google-Smtp-Source: AGHT+IGUlMoLAZTEdBS6DMTK8EyIRJTt+D9XZZtlYRD44utmmdlWurYUMUg/4PMNfp15VP8DPQf4tg==
X-Received: by 2002:a05:7022:1e13:b0:11b:79f1:847 with SMTP id a92af1059eb24-121722b44bfmr31712624c88.12.1767572809919;
        Sun, 04 Jan 2026 16:26:49 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:26:49 -0800 (PST)
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
Subject: [PATCH v3 00/17] wifi: mt76: mt7925/mt792x: comprehensive stability fixes
Date: Sun,  4 Jan 2026 16:26:21 -0800
Message-ID: <20260105002638.668723-1-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102200524.290779-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162651_877236_0287A8E5 
X-CRM114-Status: GOOD (  10.25  )
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

This patch series addresses kernel panics, system deadlocks, and various
stability issues in the MT7925 WiFi driver. The issues were discovered on
kernel 6.17 (Ubuntu 25.10) and fixes were developed and tested on 6.18.2.

These patches are based on the wireless tree (nbd168/wireless.git) as
requested by Sean Wang.

== Problem Description ==

The MT7925 driver has several bugs that cause:
- Kernel NULL pointer dereferences during BSSID roaming
- System-wide deadlocks requiring hard reboot
- Firmware reload failures after suspend/resume
- Key removal errors during MLO roaming

These issues manifest approximately every 5 minutes when the adapter
tries to switch to a better BSSID, particularly in enterprise environments
with multiple access points.

== Root Causes ==

1. Missing mutex protection around ieee80211_iterate_active_interfaces()
   when the callback invokes MCU functions (patches 2, 3, 16)

2. NULL pointer dereferences where mt792x_vif_to_bss_conf(),
   mt792x_sta_to_link(), and similar functions return NULL during
   MLO state transitions but results are not checked (patches 1, 4, 5,
   9, 10, 14, 17)

3. Ignored MCU return values hiding firmware errors (patches 6, 7, 8)

4. WARN_ON_ONCE used where NULL is expected during normal MLO AP
   setup (patch 13)

5. Firmware semaphore not released after failed load attempts (patch 15)

6. Key removal returning error when link is already torn down (patch 12)

== Testing ==

Stress tested by hammering the driver with custom test script.

Tested on:
- Framework Desktop (AMD Ryzen AI Max 300 Series) with MT7925 (RZ717)
- This whole patch series was tested on Kernel 6.18.2 and 6.17.12 (Ubuntu 25.10)
- Enterprise WiFi environment with multiple WIFI 7 APs with MLO enabled

Before patches: System hangs/panics every 5-15 minutes during BSSID roaming
After patches: Stable for 24+ hours under continuous stress testing

== Crash Traces Fixed ==

Primary NULL pointer dereference:
  BUG: kernel NULL pointer dereference, address: 0000000000000010
  Workqueue: mt76 mt7925_mac_reset_work [mt7925_common]
  RIP: 0010:mt76_connac_mcu_uni_add_dev+0x9c/0x780 [mt76_connac_lib]
  Call Trace:
   mt7925_vif_connect_iter+0xcb/0x240 [mt7925_common]
   __iterate_interfaces+0x92/0x130 [mac80211]
   ieee80211_iterate_interfaces+0x3d/0x60 [mac80211]
   mt7925_mac_reset_work+0x105/0x190 [mt7925_common]

Deadlock trace:
  INFO: task kworker/u128:0:48737 blocked for more than 122 seconds.
  Workqueue: mt76 mt7925_mac_reset_work [mt7925_common]
  Call Trace:
   __mutex_lock.constprop.0+0x3d0/0x6d0
   mt7925_mac_reset_work+0x85/0x170 [mt7925_common]

== Related Links ==

Framework Community discussion:
https://community.frame.work/t/kernel-panic-from-wifi-mediatek-mt7925-nullptr-dereference/79301

OpenWrt GitHub issues:
https://github.com/openwrt/mt76/issues/1014
https://github.com/openwrt/mt76/issues/1036

GitHub repository with additional analysis:
https://github.com/zbowling/mt7925

Zac Bowling (17):
  wifi: mt76: mt7925: fix NULL pointer dereference in vif iteration
  wifi: mt76: mt7925: fix missing mutex protection in reset and ROC abort
  wifi: mt76: mt7925: fix missing mutex protection in runtime PM and MLO PM
  wifi: mt76: mt7925: add NULL checks in MCU STA TLV functions
  wifi: mt76: mt7925: add NULL checks for link_conf and mlink in main.c
  wifi: mt76: mt7925: add error handling for AMPDU MCU commands
  wifi: mt76: mt7925: add error handling for BSS info MCU command in sta_add
  wifi: mt76: mt7925: add error handling for BSS info in key setup
  wifi: mt76: mt7925: add NULL checks in MLO link and chanctx functions
  wifi: mt76: mt792x: fix NULL pointer dereference in TX path
  wifi: mt76: mt7925: add lockdep assertions for mutex verification
  wifi: mt76: mt7925: fix key removal failure during MLO roaming
  wifi: mt76: mt7925: fix kernel warning in MLO ROC setup
  wifi: mt76: mt7925: add NULL checks for MLO link pointers in MCU functions
  wifi: mt76: mt792x: fix firmware reload failure after previous load crash
  wifi: mt76: mt7925: add mutex protection in resume path
  wifi: mt76: mt7925: add NULL checks in link station and TX queue setup

 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 27 +++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  |  8 +++++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 95 +++++++++++++++++++++---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 52 ++++++++++++++---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c  |  6 +++
 5 files changed, 170 insertions(+), 18 deletions(-)

-- 
2.51.0

