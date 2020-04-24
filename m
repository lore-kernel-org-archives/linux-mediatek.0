Return-Path: <SRS0=cCBG=6I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BC8C55196
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 19:33:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF0A2075A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 19:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KyUgr+NT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="U7Wb0L9V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDF0A2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TmoGX6kDZoii+NIMDmqOHCv33hmXv9wc8eLb8QUcoJo=; b=KyUgr+NTD/IXLR
	Eakyn1dp+b9xf8ri+Qr8Tr+CSeHsyjyrcr/9eTaehODYRlZCxMI3vxooV4LVgrv+zRqXE3DXGRcgg
	wpsQnmQYFLhi6+O2Rtu0DjCOYOfB3BdDDZkZ73Cp2uYfKA4EmVWzYJOAc8HGZcid2j9MB/FKKkvqR
	v9PfuNITOaXByFlPiH3jXHxaDcCtKpeSlqy+rL9EmTWOZJCRDCReR3G52gjPhhu0wfEehaWeW+FXT
	j7WsZhykZs3vx26lY9j+WSulgLjd+PinKB3yUJV4yjo16cbyBfJMxdR+f7gJXXruwnE1WwHoSwmMo
	SulDduAeNo3IXzY6wvHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS44Z-0007t9-J6; Fri, 24 Apr 2020 19:33:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS44R-0007k2-DF
 for linux-mediatek@lists.infradead.org; Fri, 24 Apr 2020 19:33:09 +0000
X-UUID: fca100baf6ab452d973ebe26dec3fb49-20200424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=VcIsUHo7RU6gdFBAcFxKEPXf0pzSoIsBkn54abXIC3Y=; 
 b=U7Wb0L9VGxo11TRQ6qphxsUZI5g7Yzp2Pd0EgNCC338eVIuCQ6j/R+58y1Mup0aHDroBgtIWV8tz+aI83LDGoR51adPJlNE5jD7fTyRW3O0idpJ3as0uVCgLrx1ONcGQAYSTHg5kj/Tk3b16e5R3EUGKe+yg9PP6yu75ATHrcFQ=;
X-UUID: fca100baf6ab452d973ebe26dec3fb49-20200424
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1122282600; Fri, 24 Apr 2020 11:33:04 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Apr 2020 12:32:59 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Apr 2020 03:32:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 25 Apr 2020 03:32:48 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v3 00/18] Add MediaTek IEEE 802.11ax devices - MT7915E
Date: Sat, 25 Apr 2020 03:32:21 +0800
Message-ID: <cover.1587756404.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_123307_519760_D7675384 
X-CRM114-Status: GOOD (  10.65  )
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

@Felix, a bit changes and cleanups in v3. Hope this is final one if evevything looks good to you guys.

MT7915 supports only basic HE for the moment, whereas other 802.11ax specific
features are work in progress. They will be gradually added in upcoming days.

The firmwares are available now from https://github.com/ryderlee1110/wireless-fw
At last, the developers are all listed in the series.

https://www.mediatek.com/blog/mediatek-mt7915-wi-fi-6-wave-1-chipset-builds-in-a-range-of-industry-firsts 

Changes since v3 -
- rebase on top of latest mt76 tree.
- adjust timing stuff in mt7915_mac_set_timing.
- some cleanups - use FIELD_GET and max_t whenever possible.

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
 .../net/wireless/mediatek/mt76/mt7915/dma.c   |  285 ++
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  243 ++
 .../wireless/mediatek/mt76/mt7915/eeprom.h    |  125 +
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  589 ++++
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 1462 +++++++++
 .../net/wireless/mediatek/mt76/mt7915/mac.h   |  346 +++
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  831 +++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 2764 +++++++++++++++++
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
