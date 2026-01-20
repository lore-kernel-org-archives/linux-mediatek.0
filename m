Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1593D2ED0F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 06:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YznedogKosCYjQoxhmZaws4K9eCkq32zETWn/NeO/UE=; b=xhVdTp22u+LTE2ePIAq5R7qUMZ
	n7P+vaTsh8QpEd3two3BgiFjTIdW+GOx8zWtVvRXUt+CEGxDrxF9ABsqbwIkTYJeZRwHAwwQHRYDL
	GInR5zqXY9DUuvnv1h6dqrtYhyOb/mE9WTpknGe7z+nJh4YkWeU6iY9wrfKli1AQavwl7LLgFHNhG
	DwKbvnrou4H3FV3T8I12ppqKYw9VHFIS5bsn5UH55AqVq5qpnsEpkUWHjVneYQ4CMvCG6UJK2pMfp
	+bUYyC1Iq/qaAfKcQgfksdyv3ADhwx8f5e+7sgqEWXQfcVxWi+y8SU45wFODu7+OIviu44ib9Jv+n
	Xu4boZMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ed-00000003GaQ-49st;
	Tue, 20 Jan 2026 06:29:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ec-00000003GaB-1fcI
	for linux-mediatek@bombadil.infradead.org;
	Tue, 20 Jan 2026 06:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YznedogKosCYjQoxhmZaws4K9eCkq32zETWn/NeO/UE=; b=epaluYmi6RQaqUjYiJpiZarWdV
	aaygBE7hI46ypm+vMfkiugC9yqaIvo6QULnRRUeJR5cHJBcdlqDVZqkVySOW1ILwTVP/AavguIKaB
	KQKBEx/UXaErJ7C9MNjtogSqK+9OFLqRv1Wut+d24cUGngJo9EEYfq2WwXuB/uSjWc8NBEsNt4VgU
	+2VjSgM1ilB/7L/aj5FoB1ElkMK7nnFMZl8XNqM85bpfs+WCW65bQt37N1nOY/liA1iiVqNHdHbDm
	GaDeCrZ5eT6Y9wzcY+c3mctIO2yYgoM29UlecHW00YXzvvvBGKwQTLfrQZANf1ztpMHCIH3W2iJ2K
	i1g9LL2A==;
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5EZ-0000000DP5C-0Opr
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 06:29:01 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2b453b17e41so3137150eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 22:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890537; x=1769495337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YznedogKosCYjQoxhmZaws4K9eCkq32zETWn/NeO/UE=;
        b=NLYI29jb4I4V1JCJDH6XTS1oWknDIDpxejk/xVyOdHaODoF4SpnLvBAJg6G2VgFqtG
         si3OMa3IrkCqBHxtGf07uW+mb/d8ROu7r1tnWMZiYUdO1H2/6B9oBjGj0r+zjobopL7I
         hM9CufjyJKz70SScCHD++tmtXpEVUtR7my4YPJAHjgWeC2PWFmPUygyjfSfNCbAaTdAh
         JlHHRPKkt53ksTiTWYttXCZHFEVQ8K1u/VUEF6ykTPNyTOnfdxFVclB8/ZhCbc1NZY8n
         45E01Li9vxxNNDykUy1Fkg32rsSi3B1X7TdBdZifPqfR5Q2g0aZcjcLs6k5wr0YqOrr7
         O0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890537; x=1769495337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YznedogKosCYjQoxhmZaws4K9eCkq32zETWn/NeO/UE=;
        b=ITAj9dRFLZz9QCas+ZFKbVFwxEAUFFgWd7pMrYsjRLGxQP3Ca6yef47KJpcS/wslXG
         jQdTLAHnOAKYSQMg19l+jz6uYLF009jgpqPnurTD24NiBTEUH5nFYIC4d4YQ9+PsK3i4
         mBAWX8GDTeqSKIX0YwDTjAmwC+Q18e6rTI2dGuNvJj4aDXeFHOAtBMQ2SCxKIzw5OZy3
         /eqvqMqzomTM5zUSnEUk6fjjsXe+yuAOgIpkUQHBjUNsVD0umMtwuhq4SyY2hD9UgZsb
         MH85eng0asls23tEgwlvhhbCJ7nZ6OzAhpEEi5oXE/xjHRWsXSd031IEszc3tf71mCPB
         F+qw==
X-Forwarded-Encrypted: i=1; AJvYcCUIjvNQIoyI63J1xV1kD0KM7ScKRQFQ+67flPYwgSWGhCikzCaf75ByxxguqKVu6MjGzxCdpr+Ovv3OfQv8GA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4c0qrt1M3sDzPo28xI8UinOPNjqd/DHrkQHISLlZs+4Bp3P5u
	IHAIa/PYxX6y42FOKbL11n9HojSctYcR0/3tyWhBbMRYsvu4ZY8pKzjVf5bVdgqY
X-Gm-Gg: AZuq6aLGzo8aRnywYMNcEdz4VHoPRMItKLI/Gqibwn7jp8oGTcnlWJZkUM5EDIBfruL
	UavNs0Y0nMuyPCqFjAvGxwkGi8UY3R71cZnQNQv8Rb4ihCIL6/WGbzj2nfAt928RZiXPfLPl166
	GlYo2yKm05KtjRxB9hgCivktaK3AOzy4Zs3hYgvU19jkfUK3hoM8+KJm9JaxAyNtP0FzbTINwIT
	ZniQ1f57NPSWPy2z7Uq/gtclN0slwH+J+syvd+urZNb/zxeo6aDGcoLoYrwphzBSnHZtNgpO9pR
	+7h39zbBR1T6xgASaBL6NPzKmPvsVM6sfeTjndZypVfFwMvwCGcxUc8D2dl2X0phm/YiMY0atgq
	18yWB2PCnmMlpyfVc1oQjvTFzQn9XLm81rTO4wanastlr2aJI/eX43RrJtLJiXUcet3+sGBDY8z
	/B1uWVnzG77R3viEzcKEpHg8aOcVx2jM9bue35Y2vSk0Pv0yITsLH+eWmwCXZ3
X-Received: by 2002:a05:7300:7493:b0:2a4:701a:b9ba with SMTP id 5a478bee46e88-2b6b357e24dmr9383608eec.14.1768890536577;
        Mon, 19 Jan 2026 22:28:56 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15706784eec.9.2026.01.19.22.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:28:56 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	stable@vger.kernel.org,
	linux@frame.work,
	zbowling@gmail.com,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v5 00/11] wifi: mt76: mt7925/mt7921 stability fixes
Date: Mon, 19 Jan 2026 22:28:43 -0800
Message-ID: <20260120062854.126501-1-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062859_276401_3A2C50DF 
X-CRM114-Status: GOOD (  12.59  )
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

This series addresses stability issues in the mt7925 (WiFi 7) and mt7921
drivers, focusing on NULL pointer dereferences, mutex protection, MLO
(Multi-Link Operation) handling, and ROC (Remain-On-Channel) state machine
fixes.

Changes since v4:
- Reorganized 27 patches into 11 cleaner, logically-grouped patches for
  easier review. Patches are now ordered by subsystem dependency:
  mt76 core -> mt792x shared -> mt7921 -> mt7925

- Consolidated ROC-related fixes (previously patches 22-27) into a single
  comprehensive patch (11/11) that addresses the interconnected deadlock
  and race condition issues discovered through extended testing

- New issues fixed since v4:
  * ROC deadlock in sta removal path - cancel_work_sync() was waiting for
    roc_work which needed the mutex already held by sta_remove
  * ROC timer race during suspend - timer could fire after suspend started
    but before ROC was properly aborted
  * Async ROC abort race condition - double-free when async abort raced
    with normal ROC completion
  * Added ROC rate limiting with exponential backoff to mitigate MLO
    authentication failures caused by rapid ROC requests overwhelming
    the MT7925 firmware
  * Fixed spurious ieee80211_remain_on_channel_expired() callback when
    ROC wasn't actually active (found via code review)

- Added corresponding mt7921 fixes (patches 3-4) since the older driver
  shares similar code paths and exhibited the same deadlock patterns

- Firmware reload fix (patch 2) addresses crashes when the device needs
  recovery after a failed firmware load - the semaphore wasn't being
  released, causing subsequent loads to hang

Investigation and Testing:
  All issues were discovered through real-world testing on Framework 16
  laptops with the MT7925 (RZ616) WiFi module. Crash dumps, dmesg logs,
  and detailed analysis are available in the repository below.

  A DKMS version with extensive debug logging is available for community
  testing. This has been instrumental in tracking down the more subtle
  race conditions and deadlocks that only manifest under specific timing
  conditions.

  Repository: https://github.com/zbowling/mt7925
    - kernels/    - Pre-built patches for 6.17, 6.18, 6.19-rc, nbd168
    - dkms/       - DKMS module with extra debug logging
    - crashes/    - Crash investigation logs and analysis

Acknowledgments:
  Thank you to the community members who tested the DKMS version and
  provided crash reports, dmesg dumps, and helped track down the more
  elusive deadlocks. Your patience and detailed bug reports made these
  fixes possible.

Tested on MT7925 (RZ616) with kernels 6.17.13, 6.18.5, and 6.19-rc5.

Zac Bowling (11):
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

 drivers/net/wireless/mediatek/mt76/mac80211.c    |   8 +
 drivers/net/wireless/mediatek/mt76/mt76.h        |   1 +
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c  |   2 +
 drivers/net/wireless/mediatek/mt76/mt7921/main.c |  37 ++-
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c  |   2 -
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c |   2 -
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  |   8 +
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 257 +++++++++++++--
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  |  46 ++-
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c  |   4 +
 drivers/net/wireless/mediatek/mt76/mt792x.h      |   7 +
 drivers/net/wireless/mediatek/mt76/mt792x_core.c |  17 +-
 12 files changed, 340 insertions(+), 51 deletions(-)

--
2.52.0


