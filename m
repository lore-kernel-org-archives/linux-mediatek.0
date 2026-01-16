Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F0BD47CA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfMaFn/QyfxelRT8jKmLj/I9JzM5jNepmQsNTMuHcRU=; b=rQTuc/wqXk/wGMqfmCGu7MMXNH
	lGVyuTCEdIu+SLY9a0JU6VBmWerW3OIvEFgY328jOCETrAkbK71F2vmG0A9oyb5f/BGhk5LOw4yKC
	p7CyDtuBwftSUhjpOxwrSv2qrCMkd+bpq02CyFYhLzIfhf8PQjU0WZG1AyzBWLfrYbQk8Gr0quYlx
	11FPzNCOu6YXsa1e+WhbLSBVlskm9IfI3FxBormfzBOAkYVV4OlfJlY6vdMZtg78pJobNrEfBRbuy
	MU3AG8BafwsipvxzAyiit5vwO6IFdRNgOEYbejEyln81+EYZgd4KJ4MJzAvUuh1vwhWJ3WP9LdnYy
	Mlegnzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHH-0000000DOOW-1ch8;
	Fri, 16 Jan 2026 01:05:27 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHE-0000000DOO9-2mzG
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:25 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2b04fcfc0daso1838297eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525523; x=1769130323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfMaFn/QyfxelRT8jKmLj/I9JzM5jNepmQsNTMuHcRU=;
        b=C2YROBOcQvGCF7iGpc7U0r/FCwIDk9qJLjK2Ae+9FPGe4bupX8auYiEiQGWupz/pnj
         n0MorUqOaREwteVxo+JCS5Tvq8j3gzGNzaosys6zwtPlrrTSSXOEh/PNsI72YaKjfR/T
         8YaCLUjZGLT2w6/ZCb9ObeMYzw0DKJEbrfIILnl1+XkiZhi6K2Bh0Wqcpr/zQa8k7idR
         5walFlro6pTT5EPiCo8UuvWbgdXYUeuLpgQoaeK4et4hjPaST+febaoGZ2aLlYZZ8Loj
         F/fkA/rRmmy8YTaqN6wIfLXC6QC8FBma4VFjGYKI0QClroTBNlLPmSa3WYsy25VzDoU5
         8+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525523; x=1769130323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfMaFn/QyfxelRT8jKmLj/I9JzM5jNepmQsNTMuHcRU=;
        b=Wh9CH3QqEkpQKmp+lEEUauhHVcqUn9/+LPI2K7wNC+b5TyC4f7Y5pSHN0dVuyunGmS
         nJEmeJvI2KrZhyn+2n/g8YYG4cmffivqK3AKnvw27JU2gWpgyreE3DwV4llIj3JN/TJq
         bluedkuJxlSrV4lK+x9bObyMKZ5hYCZaS3cL4j0gOt/EoB/CiVSuzchRTsMlueLYLaQu
         ZTEwAFPTK2RXEYdohQDNabwAUPsw3ruRzURe/6sHJ9NalTjqOh8qDnQyIk+kbiSEg06h
         iWrEGn8tDPf9UgbgA387YKMhpAuM0WDfuKvFHzLnzCXxxgk4Y2SNa/fF/tWNtlQtcINT
         qszQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0rczXSEyM7tETa5j98h2DpEGFGPZOeeEl2SY5HijWLu1i1xB3CTtzpqVci1zPv+sPxXksfd7a79JW0iubQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzcXt/u8UEXsqumXsyZaLb08zxxW3jbQmSOr0ABzNQtUV86S53
	goRc/ZCnTQqX52ELEoM0A2lmrAJRhq6f9N39WLpF/W9ub86gOnUfQqiD
X-Gm-Gg: AY/fxX4Fe2Gmldz5Y6lX0XOfkK7tYyV2zPG4WGZ7q4jTR2H5tqmzOLNct1zfut/Cy5Q
	zOwaT8ExSGl5EIF8pR871gM9JQ0cgOjUcEioqn/NpqT+mEyUjvrtnesJWIkJJ6vAEUlG820aSw4
	z+JXNo09TOkkgbtPMAEgl2hJjF5INGWql4hS6OdQy5NdECHRPJzCeiT9g203CjTrpMslB1Ad7ho
	eYYt6nCLcbwEiox0uyLg0heoq0NX5+77mGnv4xrONLSlXcc25yBORJ/sgCNFcayB5p3a3gKYUWQ
	vHs2eO9RHZzsdCDlrrTN5ankVBqAgyTkQpBIMF+wnkQN3XEHoskBVpW79Wx+BQ2L7EgnQkk4TuM
	5bOzrt7W8B3I3mxe7PzsrsG/D+q6+TNEewt9k1NxUv5J4zyMQIG9lT0yem1dvm1EDVLTqcZP3G+
	2WNIF3wtJC3351wZwxhBg94g0hvxZ/pTEPjn9Oykzp8DUmV6nRdIVdl99JvibTh6rETuOQOwd2
X-Received: by 2002:a05:7300:dc85:b0:2ac:816:f31e with SMTP id 5a478bee46e88-2b6b410af48mr1251750eec.29.1768525523160;
        Thu, 15 Jan 2026 17:05:23 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:22 -0800 (PST)
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
	Zac <zac@zacbowling.com>
Subject: [PATCH v4 00/21] wifi: mt76: mt7925/mt7921: stability and MLO fixes
Date: Thu, 15 Jan 2026 17:04:58 -0800
Message-ID: <20260116010519.37001-1-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170524_732623_A8444C76 
X-CRM114-Status: GOOD (  11.59  )
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

This series addresses stability issues in the mt7925 (WiFi 7) and mt7921
drivers, focusing on NULL pointer dereferences, mutex protection, and
MLO (Multi-Link Operation) handling.

Changes since v3:
- Added mt7921 driver fixes (patches 18-19) to address mutex handling
  issues that also affected the older driver
- Fixed mutex deadlocks in mt7921 suspend paths - the mutex was being
  acquired inside functions that were already called with mutex held
- Added mt76 core fix for list corruption in mt76_wcid_cleanup (patch 20)
  that caused crashes during suspend/resume cycles
- Added fix for BA session teardown during beacon loss (patch 21) which
  was causing mac80211 WARN in __ieee80211_stop_tx_ba_session - reported
  by Sean Wang

The mt7921 mutex fixes (patches 18-19) correct improper mutex nesting
where mt7921_roc_abort_sync() and mt7921_set_runtime_pm() were acquiring
the mutex internally, but were called from paths that already held it
(e.g., mt7921_mac_sta_remove via mt76_sta_remove, suspend handlers).

The list corruption fix (patch 20) addresses a bug where mt76_wcid_cleanup()
wasn't removing wcid entries from sta_poll_list before mt76_reset_device()
reinitialized the master list, leaving stale pointers.

The BA session fix (patch 21) makes the ieee80211_stop_tx_ba_cb_irqsafe()
callback unconditional in IEEE80211_AMPDU_TX_STOP_CONT handling - the MCU
command may fail during beacon loss but mac80211 must still be notified
to complete the session teardown.

More notes in https://github.com/zbowling/mt7925

Tested on MT7925 (RZ616) with kernel 6.18.5.

Zac Bowling (21):
  wifi: mt76: mt7921: fix missing mutex protection in multiple paths
  wifi: mt76: mt7921: fix mutex deadlocks in multiple paths
  wifi: mt76: fix list corruption in mt76_wcid_cleanup
  wifi: mt76: mt7925: fix BA session teardown during beacon loss
  wifi: mt76: mt7925: fix NULL pointer dereference in vif iteration
  wifi: mt76: mt7925: fix missing mutex protection in reset and ROC
    abort
  wifi: mt76: mt7925: fix missing mutex protection in runtime PM and MLO
    PM
  wifi: mt76: mt7925: add NULL checks in MCU STA TLV functions
  wifi: mt76: mt7925: add NULL checks for link_conf and mlink in main.c
  wifi: mt76: mt7925: add error handling for AMPDU MCU commands
  wifi: mt76: mt7925: add error handling for BSS info MCU command in
    sta_add
  wifi: mt76: mt7925: add error handling for BSS info in key setup
  wifi: mt76: mt7925: add NULL checks in MLO link and chanctx functions
  wifi: mt76: mt792x: fix NULL pointer dereference in TX path
  wifi: mt76: mt7925: add lockdep assertions for mutex verification
  wifi: mt76: mt7925: fix key removal failure during MLO roaming
  wifi: mt76: mt7925: fix kernel warning in MLO ROC setup
  wifi: mt76: mt7925: add NULL checks for MLO link pointers in MCU
    functions
  wifi: mt76: mt792x: fix firmware reload failure after previous load
    crash
  wifi: mt76: mt7925: add mutex protection in resume path
  wifi: mt76: mt7925: add NULL checks in link station and TX queue setup

 drivers/net/wireless/mediatek/mt76/mac80211.c |  10 ++
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |   2 +
 .../net/wireless/mediatek/mt76/mt7921/main.c  |   8 ++
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |   2 +
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |   2 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |   8 ++
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 125 ++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  48 +++++--
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   4 +
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  27 +++-
 10 files changed, 203 insertions(+), 33 deletions(-)

-- 
2.52.0


