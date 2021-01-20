Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBD4C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 19:43:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E38DF2343B
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 19:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E38DF2343B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hH72jYThVxev5ezYGNgv1mDXW9IRVfsOOpJWlsWavvI=; b=kFqHRTl0elA+cca8bh6rwmZ6n5
	SkuI7oXGv4bZeYNxJO8zeDQCT5JzsAY7Un54sX4RZ35Z6DdAUzgjadWwI+ZNPGZvJCZs1LPYXf6dO
	38P3MKVLVKzZSnIGUSnIQftB0lhkH6wspiCrK/h5ChNUbJed83wAgJ9FsJDdAV2G7xDDfutaKff6u
	zGn1f/O+ymbht19rEEI8E3bleqoKUtT+TXj5UE/EVcd5ItDJJGFzI4Ma0kljI+PAYmsGXcfKWrb5w
	uxotUM7009oZFZtsvSrRsuRCCQYEo0TxLR7zmzBqnsR6AZzvE+Bm52ZbyKe+QdCmT0Ts3g5d4BodN
	TF0VkJWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2JNd-0007UC-QP; Wed, 20 Jan 2021 19:43:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2JND-0007GR-RQ
 for linux-mediatek@lists.infradead.org; Wed, 20 Jan 2021 19:42:38 +0000
X-UUID: d3f47aa62b6c427099072c4f319f484e-20210120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Xl0JXSA0kTxqHOpqxwHbPGWCAzXHU0ukwt1uLS2Ca98=; 
 b=lNjtY/XUPi+RQKy+xZfLemPdtjIgtioZQC9zFnDuPusliZHiwdmt9yVFmJMRey3VK+lcNnncdtUf0bceLnfVs++afV8UTRHWlePvv1LHBUfydzbAKFGbC2xuRVhKAZho3tToULElyakOt9DwzFc/BdPfl1Pv6BmY3G3Z2Hb16LM=;
X-UUID: d3f47aa62b6c427099072c4f319f484e-20210120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 721360365; Wed, 20 Jan 2021 11:42:26 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 11:34:06 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 03:33:53 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Jan 2021 03:33:53 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v6 00/15] introduce mt7921e support
Date: Thu, 21 Jan 2021 03:33:36 +0800
Message-ID: <cover.1611060302.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_144236_142630_E9F88332 
X-CRM114-Status: GOOD (  16.51  )
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
Cc: ryder.lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Sean
 Wang <objelf@gmail.com>, Soul.Huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <objelf@gmail.com>

Introduce support for mt7921e 802.11ax (Wi-Fi 6) 2x2:2SS chipset.

v2:
- Mark the patch as -next

v3:
- Remove sw scan support
- Get rid of dbdc code
- Run mt7921_configure_filter hodling mt76 mutex
- Correct Txp programming in Txd
- Correct fw log to host command
- Correct eeprom offset definition
- Update rate adaption info report
- Remove unused code and fields in struture
- Split the previous driver into several patches for easy review

v4:
- introduce sched scan support
- introduce 802.11 PS support in sta mode
- introduce support for hardware beacon filter
- introduce beacon_loss mcu event
- introduce PM support
- refine sta_rec_phy and add sta_rec_ra_info
- remove incorrect mt7921_mcu_tx_config member
- fix erroneous endianness conversion in mt7921_tx_complete_skb()
- fix endianness warning in mt7921_get_wtbl_info()
- fix endianness warnings in mt7921_mcu_sta_tlv()
- remove unused code in mt7921_mcu_send_message
- remove scan with random mac until fw is ready
- channel domain is added for hw scan

v5:
- fix implicit conversion from enumeration type
- remove unused function declaration
- drop zero-length packet to avoid Tx hang
- fix MT_CIPHER_BIP_CMAC_128 setkey
- reset token when mac_reset happens
- create mac.h when mac support is added
- reorder the patch of adding module support
- move mac_work in mt76_core module
- move chainmask in mt76_phy
- rebase per moving mac_work in mt76_core module
- rebase per moving chainmask in mt76_phy

v6:
- use UNI_BSS_INFO_BCNFT and UNI_BSS_INFO_PS to carry out
  enabling hardware beacon filter and 802.11 power saving
  mode according to the MT7921 firmware

Lorenzo Bianconi (2):
  mt76: move mac_work in mt76_core module
  mt76: move chainmask in mt76_phy

Sean Wang (13):
  mt76: mt7921: add MAC support
  mt76: mt7921: add MCU support
  mt76: mt7921: add DMA support
  mt76: mt7921: add EEPROM support
  mt76: mt7921: add ieee80211_ops
  mt76: mt7921: introduce mt7921e support
  mt76: mt7921: add debugfs support
  mt76: mt7921: add module support
  mt76: mt7921: introduce schedule scan support
  mt76: mt7921: introduce 802.11 PS support in sta mode
  mt76: mt7921: introduce support for hardware beacon filter
  mt76: mt7921: introduce beacon_loss mcu event
  mt76: mt7921: introduce PM support

 drivers/net/wireless/mediatek/mt76/Kconfig    |    1 +
 drivers/net/wireless/mediatek/mt76/Makefile   |    1 +
 drivers/net/wireless/mediatek/mt76/mt76.h     |    5 +-
 .../net/wireless/mediatek/mt76/mt7603/init.c  |    2 +-
 .../net/wireless/mediatek/mt76/mt7603/mac.c   |   14 +-
 .../net/wireless/mediatek/mt76/mt7603/main.c  |   10 +-
 .../wireless/mediatek/mt76/mt7603/mt7603.h    |    2 -
 .../wireless/mediatek/mt76/mt7615/eeprom.c    |    2 +-
 .../net/wireless/mediatek/mt76/mt7615/init.c  |   16 +-
 .../net/wireless/mediatek/mt76/mt7615/mac.c   |   27 +-
 .../net/wireless/mediatek/mt76/mt7615/main.c  |   15 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |    4 +-
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |    5 -
 .../wireless/mediatek/mt76/mt7615/testmode.c  |    4 +-
 .../net/wireless/mediatek/mt76/mt7615/usb.c   |    2 +-
 .../net/wireless/mediatek/mt76/mt76x0/pci.c   |    4 +-
 .../net/wireless/mediatek/mt76/mt76x0/usb.c   |    4 +-
 drivers/net/wireless/mediatek/mt76/mt76x02.h  |    2 -
 .../net/wireless/mediatek/mt76/mt76x02_mac.c  |   10 +-
 .../net/wireless/mediatek/mt76/mt76x02_phy.c  |    4 +-
 .../net/wireless/mediatek/mt76/mt76x02_util.c |    6 +-
 .../net/wireless/mediatek/mt76/mt76x2/mcu.c   |    2 +-
 .../wireless/mediatek/mt76/mt76x2/pci_init.c  |    2 +-
 .../wireless/mediatek/mt76/mt76x2/pci_main.c  |    4 +-
 .../wireless/mediatek/mt76/mt76x2/usb_init.c  |    2 +-
 .../wireless/mediatek/mt76/mt76x2/usb_main.c  |    2 +-
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |    2 +-
 .../net/wireless/mediatek/mt76/mt7915/init.c  |   17 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |   31 +-
 .../net/wireless/mediatek/mt76/mt7915/main.c  |   11 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |    8 +-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |    3 -
 .../wireless/mediatek/mt76/mt7915/testmode.c  |    2 +-
 .../net/wireless/mediatek/mt76/mt7921/Kconfig |   10 +
 .../wireless/mediatek/mt76/mt7921/Makefile    |    5 +
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |  178 +
 .../net/wireless/mediatek/mt76/mt7921/dma.c   |  356 ++
 .../wireless/mediatek/mt76/mt7921/eeprom.c    |  101 +
 .../wireless/mediatek/mt76/mt7921/eeprom.h    |   27 +
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  254 ++
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 1393 ++++++++
 .../net/wireless/mediatek/mt76/mt7921/mac.h   |  333 ++
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 1051 ++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 2983 +++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   | 1176 +++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  379 +++
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  279 ++
 .../net/wireless/mediatek/mt76/mt7921/regs.h  |  413 +++
 48 files changed, 9049 insertions(+), 115 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/Kconfig
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/Makefile
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/dma.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/eeprom.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/init.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/mac.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/mac.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/main.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/pci.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/regs.h

--
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
