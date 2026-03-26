Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E6510A88D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPLbETzywDZ/LXKktaa48OxW8xTevcANb3hp9TPiGq8=; b=waLk2FZYq2Cssq6YlN6dmjT4v+
	fK3GD4nv01SuxrlhMlBhQypEeq4EQs9fV7tFbZ04US2YUOAmxlUjjWOvZx9YFlk3htIdGOmUPR7AC
	whe0kKqXzPIt/Fb/yNqYDv0XYC5/sOjcRx5oVSO8bWP1u5HMhntRJ/3xVWVDS8kv6nvkfxYx6wK0x
	K4KeYCF+wuiRpTfW5BMqSltDqilqDFDWdbJAD6Jq7k/UfEpx5V9Sz3ktxgZQ71woxf4fEemAVLCkT
	ZkPY76q8jRZxPga7hhDUJwu59Tf9pTDtUCI1BVT9J2aW8itrobzn2DUgc4MLjryu2JbhBO9mXDr39
	SYA4polg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5o8a-00000005uiM-3ZlQ;
	Thu, 26 Mar 2026 17:04:52 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5o8X-00000005ugU-3mUs
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 17:04:51 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1774544655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPLbETzywDZ/LXKktaa48OxW8xTevcANb3hp9TPiGq8=;
	b=jJHpo35c6UoaYo0r2PqWNFsmNOrlCcnvuMLHUiaa7MH9jgeBIdS89t1NeuCeuPCPpMgYsm
	IPbT/ufWg6suIGeNhKkzdMgB0WGk7qsn4JNaKiiNKCinNjz843LXNNcAc7LzbVCF6BQQe9
	xiczeHZbn/cZoLfLbcuqbz9bPmc4bx1Mx9a5X1xlmmBap+SSjuzk/xETD4RrmaCSAxjmHc
	GfjHRsplTQ5BXyAt7Ap6iQACQOwL6Yj6StAUAz5MNfWtW1gauRV26/89tBR1eeR9RlREb+
	hFX6QqEAx218F6IqDiWKaKDmmUxFJjfzSVm9/3XCkUWV6rh0R6pAUkOzLtC5ZA==
From: Lucid Duck <lucid_duck@justthetip.ca>
To: sean.wang@kernel.org
Cc: nbd@nbd.name,
	lorenzo.bianconi@redhat.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	morrownr@gmail.com
Subject: Re: [PATCH 1/3] wifi: mt76: connac: use a helper to cache txpower_cur
Date: Thu, 26 Mar 2026 10:04:07 -0700
Message-ID: <20260326170407.406431-1-lucid_duck@justthetip.ca>
In-Reply-To: <20260325043318.13298-1-sean.wang@kernel.org>
References: <20260325043318.13298-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_100450_336680_5E94F6DF 
X-CRM114-Status: UNSURE (   5.22  )
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

Sean,

Tested the full 3-patch series on MT7921AU. All three bands working
correctly -- txpower reporting is fixed.

Test environment:

  Kernel:     6.19.8-200.fc43.x86_64 (Fedora 43)
  Device:     MediaTek MT7921AU USB (0e8d:7961)
  Firmware:   HW/SW 0x8a108a10, WM 20251223091148
  AP:         Tri-band (2.4/5/6 GHz)
  Regdomain:  CA (DFS-FCC), also tested US, JP, DE
  Note:       Internet maintained via separate USB ethernet
              adapter during WiFi testing

Baseline (stock 6.19.8, pre-patch):

  txpower 3.00 dBm on all bands

Post-patch txpower:

  2.4 GHz  ch 1   (2412 MHz, 20 MHz):   36.00 dBm
  5 GHz    ch 100 (5500 MHz, 80 MHz):    26.00 dBm
  6 GHz    ch 5   (5975 MHz, 80 MHz):    12.00 dBm

All values match expected CA regulatory limits. Connectivity verified
with 0% packet loss on every band.

Stress testing (28 tests, 28 passed, 0 failed):

  - Connect/disconnect: 10 cycles per band (30 total), txpower
    correct and ping 0% loss on every cycle
  - Band switching: 30 sequential hops (2.4 -> 5 -> 6 -> repeat),
    txpower correct on every hop, ping 30/30
  - Module reload: 15 full rmmod/insmod cycles of all mt76 modules,
    txpower correct after every reload
  - Throughput: 100-ping per band, 0% loss on all
      2.4 GHz: avg 2.4 ms, max 23.6 ms
      5 GHz:   avg 1.9 ms, max 8.0 ms
      6 GHz:   avg 2.2 ms, max 3.3 ms
  - Soak: 20-minute continuous test per band (60 min total),
    txpower sampled every 30 seconds, never deviated
      2.4 GHz: 40/40 samples at 36.00 dBm, slab delta -4 kB
      5 GHz:   40/40 samples at 26.00 dBm, slab delta +16 kB
      6 GHz:   40/40 samples at 12.00 dBm, slab delta -16 kB
  - Memory: 50 connect/disconnect cycles, slab delta +64 kB
    (negligible, no leak)
  - Band-hop marathon: 200 random band hops, 200/200 pass,
    ping 200/200 OK, completed in 1232 seconds
  - Concurrent managed + monitor: txpower stable on all bands
    with a monitor VIF present, ping 0% loss
  - Regulatory domain switching: txpower correctly adjusts
    per country on 5 GHz
      CA: 26.00 dBm
      US: 24.00 dBm
      JP: 23.00 dBm
      DE: 26.00 dBm

Zero kernel warnings in dmesg throughout all testing.

For context, I originally reported this bug and submitted a fix in
January (v1 through v4 on linux-wireless, as Lucid Duck). Patches 1
and 2 in this series address the same core issue -- capturing the rate
power loop output and subtracting the path delta before caching
txpower_cur. Patch 3 (the per-vif-link get_txpower callback) is a
good addition that was not in my series.

Reported-by: Lucid Duck <lucid_duck@justthetip.ca>
Tested-by: Lucid Duck <lucid_duck@justthetip.ca>

