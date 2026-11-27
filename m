Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6F3606A329
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=npoUr/il;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hgLxHWyn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=y7mPTl/ddoDpH27Ms6SdLDucsZisBPKb6oAxlPTfUnM=; b=npoUr/ilpZezbzX1XlJLveJvMj
	4+BQBIGnEzRyI2RKswiyWhdB0lf5nMweLaV5q0lTEOfs3iRPkIbc5fD/sqm8JqPwJZwqCdO7xYu/L
	/GrDAnVdDAOq6sq+Klvg20c4I78rYotj673C95Nhu/vL8mk1JembmbKyFFKR/sbyOga1YSE3Ka2tx
	whnBpRXx8NJDowHi/r6vU4TRo38C2QZ3/iOPqUHhGsHJvHcJ6TCoUSieqNLiM0KYZOz/wGTH9/9k4
	a026L8mHE51PmzJEr/W3e+0pZsrJugjZkbzeKPouS7NHaEq1kpnI2KFxggZDDbzTFk7Lb+Q8oOdT7
	YhG01aEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrQb-0000000FG4j-3k9R;
	Fri, 27 Nov 2026 08:35:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrQa-0000000FG4U-20f9;
	Fri, 27 Nov 2026 08:35:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A70C6025A;
	Fri, 27 Nov 2026 08:35:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795768531;
	b=2YzzzCUs1qs5kQ/BT5NY9TjGYzZibvbtgT6mRVs21xiuGwa2v5LJ/dvOTG2/oTM6xj9z
	 /ZjcAAy0rBqG+0mK7KjcEkxm8TV4M3rDVC/zyjRLMegwDRpYqnhzCxTFmfsHOQVci1LRZ
	 dji9ErcEesaVygyiu6YRf8P1zuz4UOR7YgmceKPgaEGwHqn3BgslPzGbk4nJjsKEUnQj/
	 WufHRcwP9J+2/x2ME46cgdI1GKs6WBjsxCEh9gpmAIYuUTIrJy7t1ceoD1jHGhfjzyHYP
	 cuw1ES+1dQC9A7/Xct9sP5eiW7NswRqUiLdYaHDxIU8BEeoZ7wJokdFLpUkrGxDpXTQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795768531;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=y7mPTl/ddoDpH27Ms6SdLDucsZisBPKb6oAxlPTfUnM=;
	b=lyXw91PN4Vbrn8Pwv3hgXqzpal5GkMGG+qYywS0p8Vc8OT9wkT/BySpPo2jTcVzsuOPw
	 b8i3JgnYiwVm16SaQjLRwrjN1+umtQyHqSUXWz5AYIny3rzzhP8caVR7C/vS7AX9jqx7K
	 zB1nygMOOr+Cp+rTCgL+kuJMG+h2XLMj3qTULQdhRbbTeB/Pq+KNeI6MAUsK77e0Qvosj
	 hpijVWf3r3VwEi7frrqlbq31OD+jWfYJvCvVtoJw91641vQiW5Xcys/G0Y/nBl3VCOoYj
	 P1UthKPPmLSLxXcdOuXrsyfhziSv8uIk4cdAUOjZ0TPOJbn+unaursniE/7vBAkvWkA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D77C51F00897;
	Fri, 27 Nov 2026 08:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795768531;
	bh=y7mPTl/ddoDpH27Ms6SdLDucsZisBPKb6oAxlPTfUnM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=hgLxHWynwiXRZV7BWNRx3E1sqJ52FHv/7IdZb8Hj6IAHi9/gPFf8Sf6lGaGUIomEh
	 4sw6GfnLE8fApgHeQqRr1Ya+rYb78DmuA2BrFIwCsExSzhRemCI1O/5K+V4sSxj3dT
	 34kbkys9b7IQTgPznzQxnxOoLy1Lu9R3TvfToARV3S5EWNOZN7dQvvhSxVjfpZeFLx
	 x0/3Tl80Thx6XztAnB3q+q7715qz30/LQR8BwdiLIET0NKIFqo42MK9Y4N2HH1n+ek
	 1adzbMiS3LFaBPbzml4sROg6bO9cDneKwpUbtA2E21vBbDBwAPoAADY5bV3guL9oc/
	 3yvSbDVzHjYmA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 533444B63E;
	Fri, 27 Nov 2026 08:35:28 +0000 (UTC)
From: Murad Dadashev via B4 Relay <devnull+llamapersonaltv.gmail.com@kernel.org>
Subject: [PATCH 00/10] wifi: mt76: mt7603: add MT7603U USB support
Date: Fri, 27 Nov 2026 11:35:11 +0300
Message-Id: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9ACWsC/x3MQQ6DMAwEwK8gn2spCRBov4J6SKgBH0iRDRUS4
 u+EHme1uwcoCZPCqzhA6MfK35RhHwX0U0gjIX+ywRnnrXUNzmvjTblhNZCPz9jW1tSQ24vQwPv
 /qXtnx6CEUULqp3u/LboKhRnvHM7zAgQPgch5AAAA
X-Change-ID: 20261127-mt7603u-4fe6b9b85105
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Murad Dadashev <llamapersonaltv@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795768526; l=3763;
 i=llamapersonaltv@gmail.com; s=20261127; h=from:subject:message-id;
 bh=NxB3jZIIBFZlJM5Ywm3MKCBzXE8TLrTc5WJa1Gak8SU=;
 b=Eh5i5pjPN5Tgt4edY2Bc7IKJnKGiTkgkT8NYznZPneV+eqV7WWrCGbYZPwLm5zyGFJOPfUFRs
 cUEdjJ2nGBWAfaOHJ9zKHygrRJIO62TAR9QN4n9HKdolFO8tggR3+my
X-Developer-Key: i=llamapersonaltv@gmail.com; a=ed25519;
 pk=CeMIX207ioWRbMAA6A2GYgT+DpeVlKHVn7I0KjfHeCg=
X-Endpoint-Received: by B4 Relay for llamapersonaltv@gmail.com/20261127
 with auth_id=1664
X-Original-From: Murad Dadashev <llamapersonaltv@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: llamapersonaltv@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for MT7603U USB 2.0 dongles (0e8d:7603) to the
mt7603 driver. It follows the layout of mt7615/mt7663u: the core code
moves into a new mt7603-common module, and the PCIe/SoC glue and the
new USB driver become separate modules on top of it.

Patches 1-7 prepare the shared code. Apart from the module split, the
changes that affect MT7603E and MT76x8 are:

- patch 4 only passes the TSSI enable flag to the firmware when the
  eFuse has a TSSI slope. The tested dongle sets the flag without any
  TSSI calibration, and the firmware stops transmitting in AP mode
  when TSSI is enabled.
- patch 5 adds set_antenna with separate TX and RX masks. The tested
  dongle loses about half of its two-stream frames on one TX chain;
  "iw phy phyX set antenna 1 3" keeps both RX chains and uses one TX
  stream.

Everything else that touches shared code only changes behaviour on
non-MMIO buses: register access over USB sleeps, so WTBL updates that
run in atomic context are deferred to work items, and PCIe-only setup
is skipped.

Patch 8 adds the MT7603 queue mapping to mt76-usb, patch 9 adds the
USB driver, and patch 10 adds AP mode, using an hrtimer computed from
the TSF instead of the pre-TBTT interrupt to refill the hardware beacon
and broadcast queues.

The device works with the existing mt7603_e2.bin firmware.

Tested on a 0e8d:7603 dongle on a Raspberry Pi 4, with the series
backported to 6.18:
- station mode with WPA2 on 2.4 GHz
- AP mode with hostapd and WPA2, about 56 Mbit/s in each direction
  with a single client at MCS 7

MT7603E and MT76x8 are build tested only, as I do not have that
hardware.

Claude Code was used throughout development of this series, for parts
of the code and changelogs, and for debugging. I reviewed the patches
and tested them on real hardware as described above.

---
Murad Dadashev (10):
      wifi: mt76: mt7603: split core code into mt7603-common
      wifi: mt76: mt7603: make mcu message helpers usable by other buses
      wifi: mt76: mt7603: set beacon and CAB queue index in the TXD directly
      wifi: mt76: mt7603: only enable TSSI with valid calibration data
      wifi: mt76: mt7603: allow configuring TX and RX antennas separately
      wifi: mt76: mt7603: defer WTBL updates when register access can sleep
      wifi: mt76: mt7603: skip PCIe specific setup on non-MMIO buses
      wifi: mt76: usb: add MT7603 queue mapping
      wifi: mt76: mt7603: add MT7603U USB support
      wifi: mt76: mt7603: add AP mode support for USB devices

 drivers/net/wireless/mediatek/mt76/mt7603/Kconfig  |  20 +-
 drivers/net/wireless/mediatek/mt76/mt7603/Makefile |  12 +-
 drivers/net/wireless/mediatek/mt76/mt7603/beacon.c | 217 +++++++++++--
 drivers/net/wireless/mediatek/mt76/mt7603/core.c   |   4 +
 drivers/net/wireless/mediatek/mt76/mt7603/dma.c    |   1 +
 drivers/net/wireless/mediatek/mt76/mt7603/eeprom.c |   1 +
 drivers/net/wireless/mediatek/mt76/mt7603/eeprom.h |   2 +
 drivers/net/wireless/mediatek/mt76/mt7603/init.c   |  40 ++-
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c    | 154 ++++++++-
 drivers/net/wireless/mediatek/mt76/mt7603/main.c   | 103 ++++--
 drivers/net/wireless/mediatek/mt76/mt7603/mcu.c    |  37 ++-
 drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h |  33 +-
 drivers/net/wireless/mediatek/mt76/mt7603/pci.c    |  28 ++
 drivers/net/wireless/mediatek/mt76/mt7603/usb.c    | 350 +++++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/usb.c           |  17 +
 15 files changed, 929 insertions(+), 90 deletions(-)
---
base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
change-id: 20261127-mt7603u-4fe6b9b85105

Best regards,
-- 
Murad Dadashev <llamapersonaltv@gmail.com>



