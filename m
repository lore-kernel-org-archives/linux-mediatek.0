Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7ACC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 23:12:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B448960F59
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 23:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B448960F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cOEfehnuHhyXx77ZG+8pBbP2+jafuPjDGKWCZfrXkGg=; b=SUh1pCJjDJZQzI
	eMVhfxaydGwyzVvW698b0kC4NzqhPXq4PU49YJ5YHTEzq4LL5VD5L4kPhilosrQYnnt7NKaXE2dKU
	V/dFzhg+AGNJh+EYajiOGrQrdfy95ce/4T2m15D82yX3USHAeekzzY0ZNdmeuareUlpnY5SczF7Z5
	vQxM7eZM5vraAiJdGC3Y681Q4e2QnmWm+jwmK0sQ6Hr0ie5+XLYYtN+WvmG/k7QFq7f7ObHrIfql9
	iqMGXZ/ohrvsOS3w0Jz4WEZ0FbtZuQzX8s4EmgST5gJ7CtEYNnDg5yPI/ZQgVC7HKWEV8kf8We6fQ
	9KIXJqPvbQY0onbDg+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcbnU-00HQYK-Vb; Mon, 18 Oct 2021 23:12:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcbnQ-00HQXh-0S
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 23:11:59 +0000
X-UUID: 40550ed0a6c8472885f46551333baa62-20211018
X-UUID: 40550ed0a6c8472885f46551333baa62-20211018
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1776315327; Mon, 18 Oct 2021 16:11:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 16:11:51 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 Oct 2021 07:11:50 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Sean
 Wang <objelf@gmail.com>
Subject: [PATCH v5 00/17] Add MT7921 SDIO WiFi support
Date: Tue, 19 Oct 2021 07:11:30 +0800
Message-ID: <cover.1634598341.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_161156_092031_750929C5 
X-CRM114-Status: GOOD (  19.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <objelf@gmail.com>

The patchset adds the SDIO support to the MT7921 driver, basically are
made up of 3 parts.

PART 1: patch 1-5, 8-9 and 13-15
These are preliminary patches for mt7921s driver to refactor and reuse the
current mt7921e driver as much as possible.

PART 2: patch 6-7, 10-11
These are preliminary patches for mt7921s driver to refactor and reuse the
current mt7663s driver as much as possible.

PART 3: patch 12 and 16-17
These are specific patches for mt7921s driver and reset mechanism in the
same framework where mt7921e have been supported. 

The patchset are built and generated against the current mt76 with the
tag mt76-for-kvalo-2021-10-12 plus the extra pending patches [1] expected to
be merged to mt76 tree soon to help the review and merge process be easier.

The change list from v1 to v2
1. rework the whole driver according to the new patches added
   ("mt76: introduce __mt76_mcu_send_firmware routine"),
   ("mt76: not accounting the MCU header size in __mt76_mcu_send_firmware for mt7915/21") and
   ("mt76: sdio: move common code in mt76_sdio module")
2. drop pci_init.c and sdio_init.c by moving the related logic to pci.c and sdio.c, respectively.
3. cosmetics the patches like removing unnecessary new line, adding an extra space to fixed_map table and so on ...
4. fix typo in commit message

The change list from v2 to v3
1. rebase onto the latest mt76 branch
2. update per Lorenzo comments on v2
3. fix scheduling while atomic in mt7921_mac_sta_poll for mt7921s driver

The change list from v3 to v4
1. change the title of coverletter
2. fix the git message in patch 14
3. rebase onto the mt76-for-kvalo-2021-10-12

The change list from v4 to v5
1. fix endianess warning in mt76_connac_mcu_parse_tx_resource
2. rework the driver with the the following additional patches
   a. mt76: sdio: introduce parse_irq callback
   b. mt76: sdio: export mt76s_alloc_rx_queue and mt76s_alloc_tx routines

[1] The pending patch list prior to add MT7921 SDIO support

dee0a13bcd6e mt76: mt7921: get rid of unused variable in mt7921_mac_tx_free
d56281936470 mt76: mt7921: get rid of unused variable in mt7921_tx_complete_skb
ef853b3f16ef mt76: connac: fix possible NULL pointer dereference in mt76_connac_get_phy_mode_v2
215246fecd9f mt76: mt7915: improve code readability for xmit-queue handler
9953a1186155 mt76: mt7915: introduce mt76 debugfs sub-dir for ext-phy
c7cf56ad8385 mt76: rely on phy pointer in mt76_register_debugfs_fops routine signature
43366b8cef53 mt76: mt7921: add MU EDCA cmd support
44c7f544a257 mt76: sdio: export mt76s_alloc_rx_queue and mt76s_alloc_tx routines

Lorenzo Bianconi (2):
  mt76: sdio: move common code in mt76_sdio module
  mt76: sdio: introduce parse_irq callback

Sean Wang (15):
  mt76: mt7921: refactor mac.c to be bus independent
  mt76: mt7921: refactor dma.c to be pcie specific
  mt76: mt7921: refactor mcu.c to be bus independent
  mt76: mt7921: refactor init.c to be bus independent
  mt76: mt7921: add MT7921_COMMON module
  mt76: connac: move mcu reg access utility routines in mt76_connac_lib
    module
  mt76: mt7663s: rely on mcu reg access utility
  mt76: mt7921: make all event parser reusable between mt7921s and
    mt7921e
  mt76: mt7921: use physical addr to unify register access
  mt76: sdio: extend sdio module to support CONNAC2
  mt76: connac: extend mcu_get_nic_capability
  mt76: mt7921: rely on mcu_get_nic_capability
  mt76: mt7921: refactor mt7921_mcu_send_message
  mt76: mt7921: introduce mt7921s support
  mt76: mt7921s: add reset support

 drivers/net/wireless/mediatek/mt76/Makefile   |   2 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |  24 ++
 .../wireless/mediatek/mt76/mt7615/Makefile    |   2 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  28 --
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  18 +-
 .../net/wireless/mediatek/mt76/mt7615/sdio.c  | 288 ++------------
 .../wireless/mediatek/mt76/mt7615/sdio_mcu.c  |  11 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  93 +++++
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   2 +
 .../net/wireless/mediatek/mt76/mt7921/Kconfig |  18 +-
 .../wireless/mediatek/mt76/mt7921/Makefile    |   8 +-
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |  18 +-
 .../net/wireless/mediatek/mt76/mt7921/dma.c   |  38 +-
 .../wireless/mediatek/mt76/mt7921/eeprom.c    | 101 -----
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  51 +--
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 375 ++----------------
 .../net/wireless/mediatek/mt76/mt7921/mac.h   |   4 +
 .../net/wireless/mediatek/mt76/mt7921/main.c  |   8 +
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 135 ++-----
 .../wireless/mediatek/mt76/mt7921/mt7921.h    | 107 ++++-
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  48 ++-
 .../wireless/mediatek/mt76/mt7921/pci_mac.c   | 348 ++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/pci_mcu.c   | 115 ++++++
 .../net/wireless/mediatek/mt76/mt7921/regs.h  |  22 +-
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  | 317 +++++++++++++++
 .../wireless/mediatek/mt76/mt7921/sdio_mac.c  | 220 ++++++++++
 .../wireless/mediatek/mt76/mt7921/sdio_mcu.c  | 135 +++++++
 drivers/net/wireless/mediatek/mt76/sdio.c     | 282 +++++++++++++
 .../mediatek/mt76/{mt7615 => }/sdio.h         |  33 +-
 .../mediatek/mt76/{mt7615 => }/sdio_txrx.c    | 134 ++++---
 30 files changed, 1995 insertions(+), 990 deletions(-)
 delete mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
 rename drivers/net/wireless/mediatek/mt76/{mt7615 => }/sdio.h (72%)
 rename drivers/net/wireless/mediatek/mt76/{mt7615 => }/sdio_txrx.c (67%)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
