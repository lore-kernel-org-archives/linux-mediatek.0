Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E55FC982FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 13:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Soq+uaSVZc0Vr6aYGk5pA/lJkY6ZZ4f3sD6Luc3ZKWU=; b=EQVCRVxEUBrqkSZFrIT8APUCy7
	5KZPREdPIYtWNPvriOIdjAvJEFtmlIVbbgg1Gb2KOpBZXnBplkju3T7pOGRS4JsKzH4MS2J7945Cr
	GYoYQvYNLH/2Fx5pTDyRnGnh0p85dXOeudgFzVLeUkqYYDLNtovZakwgR/4TZ8dd/Bt0zB1zuyCqj
	Bbx1aS4D7stHcmFA12uTe89xWhpjs5za3xLEt9J16QtaZAuB61rnrmq/hjZf+PU1rzG7gsflj9A4w
	V1nmFR1ciNysi4/hMGx73rSQ6dy1FhABQE93DsR8l8PC1g6JRJQTJjj9up59LGGcv/4SrEvPwZirk
	snCAG/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MwS-00000008NcA-3h7m;
	Wed, 23 Sep 2026 13:23:20 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MwQ-00000008Nbe-2SbP
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Sep 2026 13:23:19 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-5c675e64ffcso1626989e0c.0
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2026 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169797; x=1790774597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Soq+uaSVZc0Vr6aYGk5pA/lJkY6ZZ4f3sD6Luc3ZKWU=;
        b=iYbN9uV1Mc7qWnmBafmfNLhSMSo89FKcts0gkLfmIOLVD/Jo2ppcroTC4w0kT/bsVc
         Map1eS7H4R412TacdEPzsgCabZ1mTw/qya/oqst55My9AVs0Glgxfep2aCEOmwjyRKw8
         4QghshIycht/lJ9QNrMKMbIDy16IVs09XYE5ZC0n53Gd6/PowZdmYyUoO3XxEpRZTLKN
         nkcB6C2SitlxBrOugylkFjv0iFnXz/roI5d4UTwoTQDN7qosHBfTbSMRawZ2UtCoMf0e
         L8wYK24/70OPx3FfDRGXAlnCzl28mp+IK52Vk88OSMerOfdCXG5uKXrBJCy30bQI+mj5
         Dkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169797; x=1790774597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Soq+uaSVZc0Vr6aYGk5pA/lJkY6ZZ4f3sD6Luc3ZKWU=;
        b=YcNwvajO9XGtOKfQghlThs5Ua+XVkGQEdqq/WAFzg0iLMDB5k6YIpzg05n6ZCPMGuO
         HXXj55qO2kYCWqWiAiGsFXxgdosLALM9MWHOdZcQ0zceHlqcpqf6yuL2kCOkTa0RoYkG
         RARHaMmMu93dhYpM2oYuNpyIbByZm3DQVm/mwjCpgq32JQ/rGkgz5MHzJ4FwNNEz5Btl
         6UmtAMw4sg2jBFt9He8cO9LqybUFC3gC7Jvfg8wgym388f8ZC5YEf4v5Fs8QsFdg8vSS
         nbVjSkzXlCT8zEDqAf5Q8UfAp3O+zFq2nV47evOPoausUnJ8PJU8gEjQRhX7vuo6BpC4
         CwVg==
X-Forwarded-Encrypted: i=1; AKwUvBxi0AoxD8qYc6xyb2jF8GzqPHwIAA6OfOaTlc23AaKi1H2DPgZKUKANG4if8h6Be1ftOicq/FQ0Asbubf/R7w==@lists.infradead.org
X-Gm-Message-State: AFuF++nwyeKzLX9mRVxpsVo5ouLJTNK6zOUUw3MuinJa6XzVKWvkoEiE
	UEHcmohaU8NNQKnsyTa4XLfGA7Cva5q5OX6Ppzkk0MHP/G9V5vawGYWs
X-Gm-Gg: AYBFou1gAmQesf09hAftDSaaaw4jzQHxuCxlRm3DPBWmrwB00w+ols2GtedMwJhnVJV
	EE5pqWQ5nQxNWa/LsYgeVNi3Uz5BE+wSPcDV/DBnV6IpfreR3QeOrpfMA/Ft3b1civSRAS8tnP3
	cWFN/3fzJQQP9E54oGbl6/ZnAGj33wiwYHle+ic9JzU8fzU12myWWMkI3vZh4xYay8FwKOEnEtl
	G/AB8HeSaHT+iANSjV2Dc3JaHcch1zziKGAzbfAXredT6ASCVur+ezj8N6DWuzJmwxxoHihEUH7
	z9AcNoprdw9xoGTORZGfNHMMJG2+pWELHLpPIHMYQvfmv76rVrpmFFbR/DAJP1AJ1swKbzjhTDS
	CRItsv8SCc6T60aHMOsYi5FXbopJivp8Db1v50WgYfVR8zZ9aCR2xkv9Dd3haYIc/5r/aTtYda4
	4J6GjxCa5TkUOEv9sLM95XXMNIsY5tYMBn1VDVuIFzmFfAmiQg73LskYjuS6IIwg/OFd20vfHzT
	oVVk2eNIpFR55cRRZi9k0HE11qn+x0fXPNPOWgSlfatrAA=
X-Received: by 2002:a05:6102:8192:10b0:785:6b42:b7b0 with SMTP id ada2fe7eead31-7aa9df8e032mr4971928137.4.1790169796917;
        Wed, 23 Sep 2026 06:23:16 -0700 (PDT)
Received: from localhost.localdomain ([190.177.169.131])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98517a8ecaesm2910924241.12.2026.09.23.06.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:23:15 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH 0/2] wifi: mt76: mt7603: bound the frames a station keeps in the hardware
Date: Wed, 23 Sep 2026 10:22:54 -0300
Message-ID: <20260923132257.8729-1-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_062318_639710_A6015FDF 
X-CRM114-Status: GOOD (  15.80  )
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

mt7603 completes a frame to mac80211 as soon as DMA has copied it, so
AQL never sees the frames the hardware still holds for a station. On a
TP-Link Archer XR500v (EN751221 + MT7603E) with one client, counters
added to upstream mt76 showed the hardware holding about 200 frames for
a single downloading client, nearly the whole 256-entry tx ring, and up
to 740 under bidirectional load.

With a client that toggles PM often (here a Samsung Galaxy A56 with
Bluetooth on, which enters power save several times per second under
load), every PS entry loops all of those frames back to the host, and
the PS queue keeps only 64 of them. The frames freed per second roughly
matched the client's TCP retransmissions per second.

The series holds a station's tx queues while the hardware owes it too
many TX statuses (a new MT_WCID_FLAG_TX_HOLD, honoured by the mt76 tx
scheduler like the non-AQL limit), and sizes the PS queue so that what
the hardware loops back fits. It depends on "wifi: mt76: mt7603: don't
drop short frames looped back on PS entry" [1], without which the count
leaks one frame for every BlockAck request that is looped back.

This is an RFC because I am not sure a driver-side hold is the approach
you want. Questions:

- Would you rather keep the airtime of each frame accounted until its TX
  status, so that AQL sees what the hardware holds, instead of a count
  in the driver?
- The marks (hold at 96, release at 48) and the PS queue size (tx ring
  minus 64) were tuned with one client only.
- If a held station sees neither a TX status nor a loop-back return for
  a second, its count is reset. In the tests below this happened 0 to 3
  times in 30 minutes, probably when the client slept for more than a
  second with frames still in the hardware. Is there a better signal?
- The raw re-send of the PS queue on wake-up bypasses the hold, so the
  count can briefly exceed the high mark (up to 134 here).

Either change alone makes things worse, which is why the cap and the PS
queue size are one patch. In a 30 minute bidirectional test (iperf3
-P 4, one client, a ping from a wired host every 200 ms) that cycled
through the four combinations every minute, about 7 minutes each:

                          upstream  bigger PSQ     cap  cap + PSQ
  frames in hw (max)           748         844      98        134
  PSQ frees per second          92         213      51          0
  downlink Mbit/s             12.2        15.2    10.6       17.0
  seconds without downlink      45         108     111         10
  longest stall (s)             10          53      16          1
  retransmits per second      15.4         8.9    10.2        3.0
  uplink Mbit/s               64.0        60.7    63.8       59.3
  ping median/p99 (ms)     119/339    145/2915 125/482    130/292
  pings lost                  6.0%       13.7%    7.5%      0.13%

The stalls come in bursts of PM toggling, with up to 22-28 PS entries
per second. In the worst stretch, the minute with the cap and the
bigger queue had 2 seconds without downlink progress, against 20, 41 and
39 in the neighbouring minutes of the other combinations.

Two shorter runs toggled the cap alone (PS queue of 64) every 30
seconds, over 60 seconds of download and 300 of bidirectional traffic,
with a 2.4 GHz wireless headset dongle nearby. In the download phases,
with the cap: PSQ frees went from 59.5 to 7.3 and from 54.5 to 5.3 per
second, retransmits from 54.9 to 8.2 and from 58.8 to 9.1 per second,
the ping median from 38 to 23 and from 32 to 25 ms, and throughput from
56 to 61 and from 59 to 63 Mbit/s. Bidirectional retransmits went from
13.5 to 6.0 and from 13.8 to 8.3 per second.

Testing: OpenWrt with kernel 6.18.41 and the mac80211 backport of
6.18.39, openwrt/mt76 at be5ce79105 plus [1], this series, the board's
local patches (EEPROM file from DT, two crash fixes, beacon stall
recovery, fixes for the mt76x2e radio) and debugfs counters that are
not part of the series. AP on channel 1, HT20. One device and one client
only: no MT7628/MT7688, and nothing with several busy stations. The
series is against wireless-next; on openwrt/mt76, where it was built
and tested, patch 1 only differs in context (mt76_wcid_primary() in the
non-AQL check).

[1] https://lore.kernel.org/linux-wireless/20260922220814.15070-1-pcristian292@gmail.com/

Tools: an AI coding assistant (Claude Opus 5.5 in Claude Code) wrote the
instrumentation, analyzed the data, and drafted these patches and this
letter; the tests ran on my device.

Cristian Papa (2):
  wifi: mt76: let a driver hold a station's tx queues
  wifi: mt76: mt7603: bound the frames a station keeps in the hardware

 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 .../wireless/mediatek/mt76/mt7603/debugfs.c   | 32 ++++++++++
 .../net/wireless/mediatek/mt76/mt7603/dma.c   |  7 ++-
 .../net/wireless/mediatek/mt76/mt7603/init.c  |  2 +
 .../net/wireless/mediatek/mt76/mt7603/mac.c   | 58 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7603/main.c  | 20 +++++--
 .../wireless/mediatek/mt76/mt7603/mt7603.h    | 51 ++++++++++++++++
 drivers/net/wireless/mediatek/mt76/tx.c       |  7 +++
 8 files changed, 172 insertions(+), 6 deletions(-)


base-commit: 10cfa109c880092df32e396647b4afdca9be8350
prerequisite-patch-id: b2c7fb85fb032bec084c6e325be32ea1172af916
-- 
2.47.3


