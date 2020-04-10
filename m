Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE55DC2D0EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 22:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDE122083E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 22:51:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OwOXKScg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WuURoQ0p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDE122083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3bewpzVsBo1bnpuWXl5EE7auASimttkfKlAElKsdQ8M=; b=OwOXKScg6siuNv
	vDr/KId+XXuPOJ0+Ut2Rbenp1M04E6QA5X3Iui480Ax33lwZ+efjKPT3IhXYPsd2MaJPXr66yoVU7
	hzFlANEQ9n3LUqDH/rVl1lEISvg4rxbFzS9hpw9x6IvN5eQg98h4PmNRkQ+9Vv2F7ICRWIQfnME6o
	B31OKdRo8yXnrz8YBHVehAspsXQQ35Ui8pzoG+WV+SoI2FHL/KT8DEgACR/PbA+ZgvQa9uHw1Or6U
	Rzzjq6qMcERhD1ApnLdD812GF8UgDDeQj3T7qMk9OpB+Pqh4JbLuEBPMPr6iCvZqxY98hsITNQvcw
	ZKQFrm9/AXnlHy49alTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jN2V5-0002tP-0T; Fri, 10 Apr 2020 22:51:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jN2V0-0002s3-Qr
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 22:51:48 +0000
X-UUID: 2ed44563f2524a10810214eff9fd633d-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=E6T8CvMlDePTd5m09V8Ph5AJ/o4Cuco49hQVLbeEteI=; 
 b=WuURoQ0pOcdUOHUMP6HqtUG0Yzt5sH64PVPo5FpV9BDMaH/hcq15pxLnbyinuOmW5XsFMD7NdlX0hG8uWgP4tzvLrm0V/xZvUwsS0EajrIR9AAkvbPiVE5kbdNy7OW9FYCmYZ82/Qe1aKwYyKIZUPl9jXyI9Kl942aQ4DbS3/vw=;
X-UUID: 2ed44563f2524a10810214eff9fd633d-20200410
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1601993977; Fri, 10 Apr 2020 14:51:41 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 15:51:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Apr 2020 06:51:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Apr 2020 06:51:32 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v1 00/16] Add MediaTek IEEE 802.11ax devices - MT7915E
Date: Sat, 11 Apr 2020 06:51:15 +0800
Message-ID: <cover.1586558901.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: DC6111F31614940DC01EC65F9A05269E44939643ADD1D0DF96176F1BA086E2D62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_155146_882425_9CA382EC 
X-CRM114-Status: GOOD (  10.32  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT7915E is the latest generation IEEE 802.11ax NIC in MediaTek, which
currently supports AP, Station and Mesh mode.

Even though some code of MT7915[1] are similar to MT7615. New generation has: 
- Huge amounts of HE dedicated parts.
- New designs of PHY/firmware/DMA scheme.
- Most fields of txd/txs/rxd/rxv are rearranged or deprecated.
- Support much more offloading stuff.

Most importantly, for the sake of convenience to get family devices supported
in the future, it was concluded to be simpler to have a clean start for this
generation. This makes maintenance easier and avoids major changes in MT7615,
which currently shares the codes with low power capable device MT7663. It will
increase the risk of regressions in existing flow.

MT7915 supports only basic HE for the moment, whereas other 802.11ax specific
features, such as BSS color, TWT, SR, DCM and OFDMA are work in progress,
and will be gradually added in upcoming days.

The firmwares are available now from https://github.com/ryderlee1110/wireless-fw ,
and will be submitted soon. At last, the developers are all listed in the series.

[1] https://www.mediatek.com/blog/mediatek-mt7915-wi-fi-6-wave-1-chipset-builds-in-a-range-of-industry-firsts 

Thanks,
Ryder

Changes since v1 -
- list a missing developer.
- drop unused codes in the hw_tx_amsdu patch.
- add a missing bitwidth change of wcid.
- add more TODO items in the driver.

Ryder Lee (16):
  mt76: avoid rx reorder buffer overflow
  mt76: add support for HE RX rate reporting
  mt76: add Rx stats support for radiotap
  mt76: adjust wcid size to support new 802.11ax generation
  mt76: add HE phy modes and hardware queue
  mt76: add mac80211 driver for MT7915 PCIe-based chipsets
  mt76: mt7915: implement HE per-rate tx power support
  mt76: mt7915: add offloading Tx AMSDU support
  mt76: mt7915: register HE capabilities for each interface
  mt76: mt7915: add HE bss_conf support for interfaces
  mt76: mt7915: add HE capabilities support for peers
  mt76: mt7915: add Rx radiotap header support
  mt76: mt7915: add .sta_add_debugfs support
  mt76: mt7915: add .sta_statistics support
  mt76: mt7915: set peer Tx fixed rate through debugfs
  mt76: mt7915: enable firmware module debug support

 drivers/net/wireless/mediatek/mt76/Kconfig    |    1 +
 drivers/net/wireless/mediatek/mt76/Makefile   |    1 +
 drivers/net/wireless/mediatek/mt76/agg-rx.c   |   12 +-
 drivers/net/wireless/mediatek/mt76/mac80211.c |   10 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   45 +-
 .../net/wireless/mediatek/mt76/mt7915/Kconfig |   13 +
 .../wireless/mediatek/mt76/mt7915/Makefile    |    6 +
 .../wireless/mediatek/mt76/mt7915/debugfs.c   |  415 +++
 .../net/wireless/mediatek/mt76/mt7915/dma.c   |  283 ++
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  236 ++
 .../wireless/mediatek/mt76/mt7915/eeprom.h    |  125 +
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  592 ++++
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 1460 +++++++++
 .../net/wireless/mediatek/mt76/mt7915/mac.h   |  346 ++
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  780 +++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 2798 +++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 1003 ++++++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  459 +++
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |  213 ++
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  344 ++
 20 files changed, 9122 insertions(+), 20 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/Kconfig
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/Makefile
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/dma.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/init.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/mac.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/mac.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/main.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/pci.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/regs.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
