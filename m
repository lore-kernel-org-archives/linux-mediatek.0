Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C84D26296
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 20:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRIzu+6S6vBi95fXcSYAvUvufcVOFBJ3gUVr6PCcUOA=; b=va1PUnph19pjcPXSGSg+IdLQWA
	onszTKl9M73eXzG8KNK5Bs2kTBuFCz25eR0j/uDffV+Ir5WkYB2PLVmqfY+SAOPOkKq9vpOk5UvVg
	kHdtgV+7qcdgPDVGJRWtOFilYfwO3gZ6/bVs4DimusNCuypkM5CRNGjmKoy65s9j5KiXzLOmM1Efb
	iTHcblmWrsIQFpDm2009gf8LIQQvaPm+zBlgMcVm8by5CmAyHGHXyaW49qe3u77uFo0A2KmMTbF9T
	BMgh0uYEvuwmBv6cQI1XHJ5aWE1tldPNC4Re3tcA/3MIa78oGJ+herOoZq4m2b59KK2bvhypmPueu
	5HLCH6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI3s-00000004Q2A-4Aub;
	Tue, 20 Jan 2026 20:10:48 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI3r-00000004Q1a-0aV2
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 20:10:48 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-12332910300so9237994c88.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 12:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939846; x=1769544646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRIzu+6S6vBi95fXcSYAvUvufcVOFBJ3gUVr6PCcUOA=;
        b=G3JU1kMGcjwD9IzNVGGe0UF0qlnxguvQCxJGU9Xtm7aEOgXHAgdudhnN8a0WYlDxGD
         8fGxV7PR8LFmw12X4/RLY8wM933LVU303u5qCXNGN699XQvx3JwQwHH3ChO0bDrxr6BZ
         tsKwL8p9xsv1LPsq7ud1m8E3S6vkB3rGihA9P3mw+lSPRYtqxEXM2qxFtmh1x7MEmECU
         b56hXRbARMRomWR+6blLvLEW5roVBdr2Ecfw/IXEc1/kqYv+/P42Ya5IcqKoyghsuSUP
         lR6yEB2NSNladlCbSSSKep+XOA2o+5tAvxCx3qpDuEbzCLJ5qpGdtFIiDS82l6JDvMcC
         On+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939846; x=1769544646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yRIzu+6S6vBi95fXcSYAvUvufcVOFBJ3gUVr6PCcUOA=;
        b=tlnAYGvij+8zJh1f5ZMbslQih6uqHFUJF2+6lN9tppoFHldZwKMQVtiMmsQXjq5lPh
         D3HAVeWIxsGN57py6g9Uw28Nd0m7Y/4vcvJ/ZAaDp6fuity/bPmgyh3cWbVJ8hrb4lQl
         XwKd4AyVGLlxg33qns5FnBA0il0qv/ML49Y22AV1RB4U5EklSUPrs6PiuHatWlmlwz0T
         yzEZOreD5LoANSgxVX+BQO4zOmvOnhoeuGfWm2EJm+I1icVtf4W8IIAPz8E+fAReoe+d
         rR27njeCBV6mCoNqtfLF1/5MmOOj0kmh/qNU3cNgJQfhxhSXs7ntIFtQl2wfzujBVkvs
         B+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVojRuN61jTcSTMHo6rx0WKEz7nX2BUZ8d+Z8taSZZWsDZbF4/VN0oH3fbOpnQ7hvN/D5w7GOFHNzvs6D103A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLFxxvKQOdR9leoz/X87q997mjwuBYATQSlgXywMKVvjOEu2j8
	FFr/shGmBZVABzyh1dPYNFs2599uaR2AXHq95HaWEjgT85abOmpQUFnR
X-Gm-Gg: AY/fxX5XI4nBJdaNNMngbuoOpPf/2NUqtoqk/7EBw3o0oV6pbVruMDCA6OlXw7RkEmz
	wQsodCXO3gkameoytZmB+B/G4YlY2YNcf4NuXPR0kCiHBt2w+a7jGSeBzVDTjyCYHVczRjNRQRX
	6cuxB2FUg8+ObPwQKuXvU4j7E500B/d1JLhcWRueXcuWdS5HswnIVqJUTk2IkUp414Vox8dQ4NG
	iQY3zQzsrAIiZzeCAMb3jd7+XElL0eBLEDZLQ96Y/FEH4hG/YYfk/OhVMvNtc9HKQpWfoWO5lqk
	uUHZuINxy7DYsfMvavcT20wJUrotda5Hrtk7nnosvD6hXRjcgdG7cbtsemKO7eOpCGm21Ib8CIo
	y3ntndC0G2Kh37Zh+AqkNZvxtR5pcrxBlPcqQgWciqoic+k+ttSoXnWoWh+PBppFWpkqOEtUpQ+
	Q8h8xtsILu0NNaJG29GrJKCMUrTs4IIJiHX9Kn/dBaDvrnylEgzRyNygbvNDcIXI3D3No8o/9O
X-Received: by 2002:a05:7022:a82:b0:11b:9386:a3c8 with SMTP id a92af1059eb24-1244a7690f2mr13531760c88.41.1768939845915;
        Tue, 20 Jan 2026 12:10:45 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm21982990c88.7.2026.01.20.12.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:10:44 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH v6 00/13] wifi: mt76: stability fixes for deadlocks, NULL derefs, and race conditions
Date: Tue, 20 Jan 2026 12:10:30 -0800
Message-ID: <20260120201043.38225-1-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_121047_187624_924D386A 
X-CRM114-Status: GOOD (  11.17  )
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

TLDR: This series addresses stability issues in both the MT7921 and MT7925 
WiFi drivers that cause kernel panics, deadlocks, and system hangs 
on various systems using these drivers.

This v6 series is rebased on Sean Wang's upstream deadlock fix already sent
which is now included as patch 01/13. The remaining 12 patches are my stability
fixes.

Changes since v5:
- Rebased on Sean Wang's fix for mt7925_roc_abort_sync deadlock (now patch 1)
  and removed my work around for the same issue as Sean's fix is better.
- Fixed format string warning in patch 12: %lu -> %u for jiffies_to_msecs()
  return type (caught by kernel test robot)
- Added patch 13: fix double wcid initialization race condition - removes
  duplicate mt76_wcid_init() call that occurred after rcu_assign_pointer(),
  which could cause list corruption, memory leaks, and race conditions
  (this is a pre-existing bug in upstream, not introduced by this series)

Zac Bowling (12):
  wifi: mt76: fix list corruption in mt76_wcid_cleanup
  wifi: mt76: mt792x: fix NULL pointer and firmware reload issues
  wifi: mt76: mt7921: add mutex protection in critical paths
  wifi: mt76: mt7921: fix deadlock in sta removal and suspend ROC abort
  wifi: mt76: mt7925: add comprehensive NULL pointer protection for MLO
  wifi: mt76: mt7925: add mutex protection in critical paths
  wifi: mt76: mt7925: add MCU command error handling
  wifi: mt76: mt7925: add lockdep assertions for mutex verification
  wifi: mt76: mt7925: fix MLO roaming and ROC setup issues
  wifi: mt76: mt7925: fix BA session teardown during beacon loss
  wifi: mt76: mt7925: fix ROC deadlocks and race conditions
  wifi: mt76: mt7925: fix double wcid initialization race condition

Sean Wang (1):
  wifi: mt76: mt7925: fix potential deadlock in mt7925_roc_abort_sync

 drivers/net/wireless/mediatek/mt76/mac80211.c    |  10 +
 drivers/net/wireless/mediatek/mt76/mt76.h        |   1 +
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c  |   2 +
 drivers/net/wireless/mediatek/mt76/mt7921/main.c |  28 ++-
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  |   8 +
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 303 ++++++++++++++++++++---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  |  48 +++-
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c  |   2 +
 drivers/net/wireless/mediatek/mt76/mt792x.h      |   7 +
 drivers/net/wireless/mediatek/mt76/mt792x_core.c |  27 +-
 10 files changed, 390 insertions(+), 46 deletions(-)

--
2.52.0


