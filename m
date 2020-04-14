Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4AFC352BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC7D2076A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:01:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K4rZl4M4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A5iP02uv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC7D2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W08bmcWL2Z/1Frhitx6tDXSwrEm96o1OYP6Ms2zc0/E=; b=K4rZl4M4vEGsZC
	FdrVN3H/uczOqxBC+QxT7muHP0qBRhBDAxv5OhdPRPYtsBB9rV0aa+zVyCsslKQRttguHRDGOD9JR
	CUFsmoWwBQOnSkHBAfpSVGPrXuy1aARVUeSu/D3V0V4+oYWVynXkozAvSSmiLQolKGxrxMh4Qlqbh
	GTHO9ITSBY7S8z4wR/Yb5F2kWvmLKlHTwr1+qQa/kJIYDsiz58oE+txx+QQCGPMthEPm+EUHh0hg4
	PWwfPlAczI/rc+Qrbv3kgVIdt+i55gsBRA+OYvYqzgd7RLvkaMV2O7AS4UiZIt7XhpdqJxA0sK6FX
	pjt7VBFTq7vccGexwcVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOSgZ-0007m9-AJ; Tue, 14 Apr 2020 21:01:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOSgR-0007c2-Nr
 for linux-mediatek@lists.infradead.org; Tue, 14 Apr 2020 21:01:29 +0000
X-UUID: d1b98fb4c18a451dbb81e7fea0d7ff0d-20200414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=X4mXXMKcwtzAjLfTBcqOdaoCYQYElct6qWdwAR4ZP7c=; 
 b=A5iP02uvNVEwI/3BL+l5JDL5/CQXt1f4e5EJyQdv5aL+G9NHrmlXnxTfUtNrHsPLSzGQScTr2Gw+hZsMQxQDpE7eVNUhIbuihajYm4H3y85hER5R4edWfxTRrRzu6p0qrNcM1tSMn4xRz5jvbsKc4RQ50fwDQREyiFFcmqxUSC4=;
X-UUID: d1b98fb4c18a451dbb81e7fea0d7ff0d-20200414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 498528781; Tue, 14 Apr 2020 13:01:22 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Apr 2020 14:01:16 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Apr 2020 05:01:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 15 Apr 2020 05:01:16 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 00/18] Add MediaTek IEEE 802.11ax devices - MT7915E
Date: Wed, 15 Apr 2020 05:00:58 +0800
Message-ID: <cover.1586895593.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_140127_789484_FD6777C2 
X-CRM114-Status: GOOD (  10.79  )
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

MT7915E[1] is MediaTek latest generation IEEE 802.11ax device, which
currently supports AP, Station and Mesh mode.

Even though some code of MT7915 are similar to MT7615. New generation has: 
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
features are work in progress.(e.g. BSS color, TWT, SR, OFDMA and DCM)
They will be gradually added in upcoming days.

The firmwares are available now from https://github.com/ryderlee1110/wireless-fw ,
and will be submitted. At last, the developers are all listed in the series.

[1] https://www.mediatek.com/blog/mediatek-mt7915-wi-fi-6-wave-1-chipset-builds-in-a-range-of-industry-firsts 

Thanks,
Ryder

Changes since v2 -
- drop hw_amsdu patch
- fix kconfig license
- fix debugfs regard to txpower dump issue
- swtich to use "per-phy" to set runtime stream caps for dual band concurrent operation.
- move omac_idx to mt7915_phy to make it independent
- add .get/set_tsf callbacks

Changes since v1 -
- list a missing developer.
- drop unused codes in the hw_tx_amsdu patch.
- add a missing bitwidth change of wcid.
- add more TODO items in the driver.

Ryder Lee (18):
  mt76: avoid rx reorder buffer overflow
  mt76: add support for HE RX rate reporting
  mt76: add Rx stats support for radiotap
  mt76: adjust wcid size to support new 802.11ax generation
  mt76: add HE phy modes and hardware queue
  mt76: add mac80211 driver for MT7915 PCIe-based chipsets
  mt76: mt7915: enable Rx HE rate reporting
  mt76: mt7915: implement HE per-rate tx power support
  mt76: mt7915: register per-phy HE capabilities for each interface
  mt76: mt7915: add HE bss_conf support for interfaces
  mt76: mt7915: add HE capabilities support for peers
  mt76: mt7915: add Rx radiotap header support
  mt76: mt7915: add .sta_add_debugfs support
  mt76: mt7915: add .sta_statistics support
  mt76: mt7915: set peer Tx fixed rate through debugfs
  mt76: mt7915: add tsf related callbacks
  mt76: mt7915: enable firmware module debug support
  mt76: set runtime stream caps by mt76_phy

 drivers/net/wireless/mediatek/mt76/Kconfig    |    1 +
 drivers/net/wireless/mediatek/mt76/Makefile   |    1 +
 drivers/net/wireless/mediatek/mt76/agg-rx.c   |   12 +-
 drivers/net/wireless/mediatek/mt76/mac80211.c |   26 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   46 +-
 .../net/wireless/mediatek/mt76/mt7615/init.c  |    4 +-
 .../net/wireless/mediatek/mt76/mt7615/main.c  |    2 +-
 .../wireless/mediatek/mt76/mt76x2/pci_main.c  |    2 +-
 .../net/wireless/mediatek/mt76/mt7915/Kconfig |   13 +
 .../wireless/mediatek/mt76/mt7915/Makefile    |    6 +
 .../wireless/mediatek/mt76/mt7915/debugfs.c   |  418 +++
 .../net/wireless/mediatek/mt76/mt7915/dma.c   |  283 ++
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  243 ++
 .../wireless/mediatek/mt76/mt7915/eeprom.h    |  125 +
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  589 ++++
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 1458 +++++++++
 .../net/wireless/mediatek/mt76/mt7915/mac.h   |  346 ++
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  831 +++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 2770 +++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  982 ++++++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  460 +++
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |  191 ++
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  355 +++
 23 files changed, 9132 insertions(+), 32 deletions(-)
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
