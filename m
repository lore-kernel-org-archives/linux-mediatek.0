Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31602FED9EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1laft9brAscXHWygDMHywLWraBhdNtqQIsBfWpKqcP0=; b=mTOoY/87lKqWhWjecgVuRmZEnp
	87lw0bo/VDa13rr7eXMb23G7DXQC+dlMb1dIEnN7EISdNGhmHaNODWrtx5+/T6cC4BBp6BQq5fsc2
	RW6F1oeGGoPm8A6/ei7ZT9Dka5+3lzhQcQaeqn+7WHF+2aPPRwCb7NG0WTkEHVy8jhkC5x6x53FdX
	+4Zb/1G2WHDxwJfKpZ9DoA7HpDseCFsstqtE3XBNXT/Jz9If9KrfHJp4csZyUGZPCu5K34VP2RqNY
	578j5dr+UEDifolg0HaOoS8OxWYGL5e1atpMOC8z2OLPolPWLElhLqeHXfhnk+hmEnjCFHy1gG6q1
	dccBni8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YFi-00000006wkf-2WDv;
	Tue, 17 Mar 2026 17:30:47 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YFg-00000006wi2-1M2E
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 17:30:45 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1773768626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1laft9brAscXHWygDMHywLWraBhdNtqQIsBfWpKqcP0=;
	b=xDgoQTnhyg3ZyjO+S1IVetCbyrkyqOeIPe6J+TKd9GIKz4ch07z9d//AGbH27GbGFRfhvt
	OFpP4zyfzwsqTOiVHMCGL08TC0gC/isHPjRU3f2xgEsSHlNAmxH0R+jrTBEc7yGgY9LsPr
	DO4RkydI1nr6V4C57ZLBVvlShhUxL85HWJQIYaIOMCFBrN8XMSUbumBSnRz9USRCzcf9cV
	ESthIKAEB/9tqeujl+3sSsj5WkM9XASvoLaBZmuvf3g4Yn7YEfzu1lNsOuU1S89HW+gz7d
	9RDZBiayNi1sN4CLN3RF71Iw/u6/vm6xuxYUW1oJLKoMIcuaRlDN3ZOt/NYycQ==
From: Lucid Duck <lucid_duck@justthetip.ca>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	sean.wang@kernel.org,
	lorenzo@kernel.org,
	linux-mediatek@lists.infradead.org,
	morrownr@gmail.com,
	Lucid Duck <lucid_duck@justthetip.ca>
Subject: [PATCH v3 0/1] wifi: mt76: mt7921: fix txpower reporting from rate power configuration
Date: Tue, 17 Mar 2026 10:30:15 -0700
Message-ID: <20260317173016.136975-1-lucid_duck@justthetip.ca>
In-Reply-To: <CAGp9Lzp0LEac0DnAzs477fG5rmA+ZjdDHfdAPWccK3GKEY05rw@mail.gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_103044_514328_A400EFD6 
X-CRM114-Status: UNSURE (   7.12  )
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

Sean, Felix,

Here's v3 of the txpower fix, reworked based on both of your feedback.

Felix pointed out in v1 review that the fix should determine the maximum
rate power from the loop in mt76_connac_mcu_rate_txpower_band(). Sean
confirmed this direction in v2 review and clarified that the value should
come from the same computation that configures the firmware's per-rate
power tables, not from bss_conf.txpower.

v3 does exactly that. The loop already computes the right value via
mt76_get_rate_power_limits() but discards the return. This patch
captures it and stores it to phy->txpower_cur for the current channel,
matching how mt7915 handles this in mt7915_mcu_set_txpower_sku().
Nick independently confirmed v2 produced correct values on his
MT7921AU -- v3 preserves those results while addressing the
source-of-truth concern.

Two additional issues came up during implementation:

- mt7921's chanctx callbacks don't update phy->chandef (the common
  mt76_add_chanctx does, but mt7921 overrides it with a minimal
  version). Fixed by syncing chandef from ctx->def and re-triggering
  the rate power path in add_chanctx and change_chanctx.

- For chanctx drivers, mac80211 routes iw set txpower through
  BSS_CHANGED_TXPOWER, not IEEE80211_CONF_CHANGE_POWER, and never
  updates hw->conf.power_level. Added a BSS_CHANGED_TXPOWER handler
  to bridge this into the rate power path.

Tested on Alfa AWUS036AXML (MT7921AU), kernel 6.17.1, Canada:

  Band       Auto       User limit (15dBm)   Stock (before)
  2.4GHz     33 dBm     18 dBm               3 dBm
  5GHz       26 dBm     18 dBm               3 dBm
  6GHz       15 dBm      8 dBm (5dBm limit)  3 dBm

  Values match regulatory limits + 3 dBm 2x2 path delta.

Test suite (973 tests, 3.5 hours):

  Regulatory accuracy:     correct on all 3 bands (2.4/5/6 GHz)

  User txpower sweep:      every 1 dBm from 1 to reg_max, all 3 bands

  Band switching:          100 cycles between 2.4 and 5 GHz, 0 failures

  Module reload:           50 rmmod/insmod/connect/verify cycles, 0 failures

  2-hour soak:             480 samples at 15s intervals, zero drift

  Band rotation soak:      30 rotations across all 3 bands over 1 hour,
                           240 samples, 0 failures

  Regdomain switching:     10 countries (CA/US/JP/DE/GB/AU/NZ/BR/KR/TW)
                           mid-session without reconnecting, all correct
                           (JP correctly dropped to 23 dBm on 5GHz UNII-1)

  Monitor mode:            correct on ch1/6/11 (2.4GHz) and ch36/44/149
                           (5GHz), txpower set works in monitor mode

  Edge cases:              min power (1dBm), over-max clamping, rapid
                           power changes (10 in 10s), all correct

  Firmware cross-check:    debugfs txpower_sku confirms per-rate tables
                           match regulatory limits on all bands

Lucid Duck (1):
  wifi: mt76: mt7921: fix txpower reporting from rate power
    configuration

 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 12 +++++++---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 22 ++++++++++++++++++-
 2 files changed, 30 insertions(+), 4 deletions(-)

--
2.51.0


