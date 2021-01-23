Return-Path: <SRS0=NTS1=G2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F80C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:35:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93EB023433
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93EB023433
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U6Ad0SiNlcLHG/HdD3JZ3LTq9GZ8IV8y8hukrXz0XcU=; b=RCRzZmjIdGWTpuQbjdcBjqnfNQ
	s5rNvcI4wEx3dzPppAjZEd+EwP4ocW16/PyT/rLMRVodU/1P0AweNWkhoe7PbmrgVelfys53vFyq8
	gTjZvxn/wWG21iqiQ7Zkkpoql86kvRc7h6b4cDgq+nyOpZaAxgHIKpzLyhaCq51R/hSbSv4D8YuIw
	jR1pVyoDOLM1hc5QcAOy//RaltpJ03/9rJBON+6OwD/ebAPjgxlnK+0gWeMxrA3MbbPbH4QIs1/1o
	OHIGd/IMWaB31cTL+3nmikUDzuEtIsYir6OAbSdKamEfZ42veMxFKtOPlDC99CDPmlY5DGpsDuWZL
	bXMbF6CQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3EOI-0004wt-Dd; Sat, 23 Jan 2021 08:35:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3EOC-0004w0-Ci
 for linux-mediatek@lists.infradead.org; Sat, 23 Jan 2021 08:35:25 +0000
X-UUID: 13b777b1724f4d14a8fb8688256c1c0a-20210123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=mOiXjNI0xlmx4NzesX+xGF3hglAsgKN3M6+3SiPF2Pk=; 
 b=cc4Kl4O3tS7yAGCxdvePMMATS558+yL/p4OPMF0XDO2nxqa3MM4PwEA2+e9Cr8jxX3WyofPXhEGI4ngAWCIth8NY0c8npt8uO8urMOjUOxBnoVAFxhF6WpHmZVM0FX2P5k1gZ//vcicjUMEp73uE2sPMe/MxemjflHZEOm+t24s=;
X-UUID: 13b777b1724f4d14a8fb8688256c1c0a-20210123
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 945991216; Sat, 23 Jan 2021 00:35:17 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 00:35:15 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 16:35:14 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Jan 2021 16:35:14 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v7 00/22] introduce mt7921e support
Date: Sat, 23 Jan 2021 16:34:51 +0800
Message-ID: <cover.1611389300.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_033524_583183_D45E2E9A 
X-CRM114-Status: GOOD (  16.13  )
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

v7:
- remove the merged patches
- rebase onto the series mt76: introduce mt76_connac common module
	https://patchwork.kernel.org/project/linux-wireless/list/?series=418597
- rely on mt76_connac_mcu common library
- rely on mt76_connac_mcu module for sched_scan and hw_scan
- rely on mt76_connac_mcu module for suspend and WoW support
- introduce regdomain notifier support
- enable MSI interrupts
- introduce Runtime PM support
- add coredump support
- add sta statistics
- disable Rx header translation on default
- set nss to 2 on default

Lorenzo Bianconi (6):
  mt76: mt7921: rely on mt76_connac_mcu common library
  mt76: mt7921: rely on mt76_connac_mcu module for sched_scan and
    hw_scan
  mt76: mt7921: rely on mt76_connac_mcu module for suspend and WoW
    support
  mt76: mt7921: introduce regdomain notifier support
  mt76: mt7921: enable MSI interrupts
  mt76: mt7663: introduce coredump support

Sean Wang (16):
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
  mt76: mt7921: introduce Runtime PM support
  mt76: mt7921: add coredump support
  mt76: mt7921: add sta statistics

 drivers/net/wireless/mediatek/mt76/Kconfig    |    1 +
 drivers/net/wireless/mediatek/mt76/Makefile   |    1 +
 .../net/wireless/mediatek/mt76/mt7615/Kconfig |    1 +
 .../wireless/mediatek/mt76/mt7615/debugfs.c   |   17 +
 .../net/wireless/mediatek/mt76/mt7615/init.c  |    2 +
 .../net/wireless/mediatek/mt76/mt7615/mac.c   |   43 +
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |    4 +
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |    1 +
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |    4 +-
 .../net/wireless/mediatek/mt76/mt76_connac.h  |   14 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  370 +++-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   25 +
 .../net/wireless/mediatek/mt76/mt7921/Kconfig |   11 +
 .../wireless/mediatek/mt76/mt7921/Makefile    |    5 +
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |  250 +++
 .../net/wireless/mediatek/mt76/mt7921/dma.c   |  356 ++++
 .../wireless/mediatek/mt76/mt7921/eeprom.c    |  100 ++
 .../wireless/mediatek/mt76/mt7921/eeprom.h    |   27 +
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  282 +++
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 1516 +++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mac.h   |  333 ++++
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 1161 +++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 1308 ++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   |  434 +++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  342 ++++
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  292 ++++
 .../net/wireless/mediatek/mt76/mt7921/regs.h  |  419 +++++
 27 files changed, 7309 insertions(+), 10 deletions(-)
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
