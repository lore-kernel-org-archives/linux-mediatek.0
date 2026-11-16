Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CB2606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LV7XWFLR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=A9KBuaqKW9NRLgpAmLyRiZPYwVxcgjbkYEelXOuGRcE=; b=LV7XWFLRqZA1ZVCQ+ksd1QqnDM
	fQ6R5Qskk/DVxQ7SjkgInIGFSaG6ie1YsbXwVPq8e5Bv9mWKBkbzXgzPMOU7H+v/LFMHzIrkevWDk
	k9J67mYBEwyf4Z0aVGCSzaLxY/EwAuAvU8wHwNQloQf4N9v8PH6u/xpNtu17Z9sRjhyXX4v6K68Jz
	jQNwALYQ3dZrmF9mN6/4sHotpRFgaPN7w+l25StxR8MflK08kAnQsgRBfoDJZCaskib3YcdFram60
	utj8lvNtAES6yL6aLvFhtr1jzNste0EW5IiJil3WLmg16uOvdl7SSGOQcMaWYpTZIy80pwCNgFKqw
	nwqcNJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5wK-000000048pT-1NRq;
	Mon, 16 Nov 2026 23:16:44 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5wH-000000048oq-4Aao
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:16:43 +0000
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-55e0090c580so1277787b6e.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870998; x=1795475798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A9KBuaqKW9NRLgpAmLyRiZPYwVxcgjbkYEelXOuGRcE=;
        b=IpuRf6UBFOdCMEsve+KB2+JPTF8u/Ni9IZqTGLsIoIMfjlHJOFLYFsXqC46hLvPgWs
         WM7/DcIebyZMxebHu19l4s96KiAd/ZnDMNMRyUB2P+H80yl7rCFGTXPPth0IZogdjo8E
         gD20oJi02tN3XBlNCnTOHhPfLwfkRehyz7vXbTDPMkqjGeZ69uNl/q7UIP4wSrcxFvl/
         DeHGNzq53wY08+IjIg2XZpdsVWoMmDyhboAEwy7leLyTiQ34RZrFBX55j1Tr9QvdwEnb
         FZzpajZAx+N7hCO06pFHvZBoXWe2wyAZWaTUnSApef4rgfMu3tSkA+g5ij5oEqhF3n1f
         za+A==
X-Forwarded-Encrypted: i=1; AL+hErE+FLJZubHpEuI13c+jzla3fhT9AB0GBLChL5szHDccs0VHqXry2FAXIaIb7715fqsr3srOvPJzwujpCJCP+Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z9fIuKWvd9boTYFwimzzWeFGKK4ZHelBQcWq15pc3HoHglI9bMN
	uqN7NtUomR5XbqF5E2p9Fb/wvj9Evf8QC2uZHyvoUf46Q5k/LUbWrs6+
X-Gm-Gg: AYBFou3VmeBnsLNAgiyXNLrZQUAQ1cd5aiC0T4nrcHyl2155Vv624odH8GeQNOxuWU2
	hpBUZQptxuK5XQD/XAO3c1Ym0KhBTKHBf8SnE0+bA5gqaiG4yHYqmfZLx1kRAbNjkJVwjUDjkCi
	BljLw8l1t5OTCYHbTRPxs0ZR/UPZ08FbdqZSdLU8UcEO/mU7t/BPHC1v2CUs2+Wq2LCbROm8v0s
	CHEU7TlZyowQwHS5myEuIT79GDl9bmf8143zZ8C/y9LS9VldLt38xQvBuhesRwwopEwcMW+0STB
	LMg3axREzrmO7/zDieuHszgzF7OltyWJa71vP7leyrGHj/dTjmFNh5z/+v95xjGSfPWKdxJlhon
	SawMPNDhiK04qQ2dLxnLpwrd/fiXeJj4+bIoFyKzwOxpuTIEnvI/YaMDgl302m/q7aJG19Fgo1c
	dwRztGsIgS7AohROvbJaV9BCLZDZY2KzuvQ3xKnmSkubBT2CcjiAv4X1uyXg1ENiuVIUMqHxXoy
	xEwAWvbfTjP9zQxtaDsVGQLKUVvnOJpU+snhVBj55IWu0MLaxwEcBktzx1SNxdvkvljZyEGvwdY
	tAIaVi5vzTQom0ETV4MWfloYGKdVMpGoX8k4R9K0S+0rKnFxBZzQeuz+ktFjpQNjAUbCot4SiVI
	+nAY7qvLJ
X-Received: by 2002:a05:6808:150b:b0:4d6:9283:1bdf with SMTP id 5614622812f47-56e6542e524mr8646041b6e.60.1794870998341;
        Mon, 16 Nov 2026 15:16:38 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:16:37 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v2 00/19] wifi: mt76: mt7925: add NAN security and improve NDP reliability (part 2)
Date: Mon, 16 Nov 2026 17:16:11 -0600
Message-ID: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151642_042671_CBA69828 
X-CRM114-Status: GOOD (  11.09  )
X-Spam-Score: -0.5 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is part 2 of the MT7925 NAN work. It continues the 15-patch series
that fixed NAN operation and NDP performance:

https://lore.kernel.org/all/20260824195227.12589-1-sean.wang@kernel.org/

This series adds low power event control and key management for secure
NAN and NAN data interfaces. It also makes unicast management TX respect
peer availability and discovery windows, and fixes shared BSS teardown,
cluster event ordering, and device removal and frame lifetime issues
found during NDP setup and teardown. The last patch lets the station +
NAN combination use three channels.

The 19 patches here cover the mt76 follow-up work. The separate mac80211
NAN receive-filter change is not included in this series.

Changes since v1 (23 patches):
 - Drop the NAN MAC address randomization patches (v1 01-04). As Felix
   pointed out on v1 03, mt7925_nan_start_mac_randomization() had no
   caller in the series, so the work never ran and the NMI/NDI address
   setters were unreachable. This also drops the NDI setter that Felix
   asked about on v1 02 (whether bss_conf->addr and the netdev address
   need updating along with vif->addr); that will be addressed when the
   code is re-added together with the interface that drives it.
 - Drop the NDC-aware TX GTK table (v1 08) and fold what remains into
   "implement mt7925_nan_set_key". As Felix pointed out on v1 08,
   nothing ever filled nan_tx_gtk_table[]. set_key keeps returning
   -EOPNOTSUPP for the NAN_DATA TX GTK, so mac80211 falls back to
   software crypto, as before.
 - Patch 19 (allow three channels in the NAN combination) is new and
   independent of the rest of the series.
 - Rebased onto the current mt76 tree; context adjusted in a few
   patches, no functional change.


Chengwei Yu (5):
  wifi: mt76: mt7925: add NAN low power event control on suspend/resume
  wifi: mt76: mt7925: implement NAN key management MCU command
  wifi: mt76: mt7925: add per-peer RX IGTK/BIGTK and RX GTK WTBLs
  wifi: mt76: mt7925: implement mt7925_nan_set_key for NAN security
  wifi: mt76: mt7925: install NAN BIP keys standalone in sta_key_tlv

Jacobs Wu (14):
  wifi: mt76: mt7925: do not disable RX NAPI twice on unload
  wifi: mt76: mt7925: assign the interface WTBL to the NAN management
    TXQ
  wifi: mt76: mt7925: do not deactivate shared NAN BSS on peer STA
    removal
  wifi: mt76: gate NAN unicast mgmt by peer availability via STA queues
  wifi: mt76: mt7925: hold NAN mgmt TX to the discovery window
  wifi: mt76: mt7925: double the retry budget for NAN unicast management
  wifi: mt76: mt7925: let TX status of DW-held NAN frames outlive the DW
    period
  wifi: mt76: mt7925: defer the NAN joined-cluster event out of
    NAN_START
  wifi: mt76: mt7925: steer NAN handshake frames by committed-bitmap
    state
  wifi: mt76: mt7925: disable only the RX NAPI instances that exist
  wifi: mt76: mt7925: stop queueing resets once the device is being
    removed
  wifi: mt76: mt7925: bound the lifetime of NAN unicast management
    frames
  wifi: mt76: mt7925: always deliver the joined-cluster event through
    the deferred work
  wifi: mt76: mt792x: allow three channels in the NAN combination

 drivers/net/wireless/mediatek/mt76/mt76.h     |   1 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |  23 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  97 ++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  30 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  11 +
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |   3 +
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 604 +++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/nan.h   | 115 ++++
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  19 +-
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |  58 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  63 ++
 .../net/wireless/mediatek/mt76/mt792x_core.c  |   9 +-
 drivers/net/wireless/mediatek/mt76/tx.c       |  25 +-
 13 files changed, 1019 insertions(+), 39 deletions(-)


base-commit: cb766c8865eb6b6d2c2372047f2e41d7d2e38449
-- 
2.43.0


