Return-Path: <SRS0=HztP=GC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCF6C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Dec 2020 18:26:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F246922287
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Dec 2020 18:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F246922287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qmeDeigxeT8/Ewt3hT/AXbdTZUcpLQJ5qUeP8w2IYS0=; b=MPLhijigFtG6PWRGEfgayyLoRy
	l6cSJ8RI7va0OvKD3XPSFlswINbxZFzwEEmTbXYybXH80UwI9YHwoc5Kwsi7S5NB/xoNjXOZZGFOK
	5VgwXe6b7W31sHC3IPnbCgz/LxhMaPHECcgtQWWXn0ICTQPDMUv5JwLAfMovZy+4Z6UKBOWq7kYn3
	Ns3UOEqyoIterSUbkkMdT2JVAO/zjDLpUxnYGaM9QugNPK7zlKQu8ze5XUTkENy83UBDTGolC11x/
	TfN7cjSANLLv6AmBOwfIL6oQtn3GYC4E2ufwoMk/0Lg+d/2jBht9ywOCEe50XFrE8dS3GmO2IpLlN
	MkBQoQDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kugBJ-0008AX-0j; Wed, 30 Dec 2020 18:26:45 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kugBF-00087x-9Q
 for linux-mediatek@lists.infradead.org; Wed, 30 Dec 2020 18:26:42 +0000
X-UUID: 91c7279a30dc417c9bfcdd20e999c066-20201230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=l3GY+mfu4V5Zd/o9b9BBWpf8XY4WYLRXgBzlZ+/5ChA=; 
 b=Ig9jBGpJ3zLoJjgAG0WTYHlNeOyOGV2PCYDvS+/VanYf6bVOX9KUC49NGUi4eCH0snUPDdkdGLc+RzOyTPgEcKVg3Uh7wRwLUDzGHnWHKuzEaAbc8dCJ2AgNAO79w3ISTqZLfqu/bCTIvrTfjtVjCBLE76REHaT2viGF/t/Ct1g=;
X-UUID: 91c7279a30dc417c9bfcdd20e999c066-20201230
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1621321840; Wed, 30 Dec 2020 10:25:02 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Dec 2020 10:06:44 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Dec 2020 02:06:30 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 31 Dec 2020 02:06:30 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v4 00/13] introduce mt7921e support
Date: Thu, 31 Dec 2020 02:06:11 +0800
Message-ID: <cover.1609347310.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_132641_475290_0734D4A0 
X-CRM114-Status: GOOD (  12.96  )
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

Sean Wang (13):
  mt76: mt7921: add module support
  mt76: mt7921: add MCU support
  mt76: mt7921: add MAC support
  mt76: mt7921: add DMA support
  mt76: mt7921: add EEPROM support
  mt76: mt7921: add ieee80211_ops
  mt76: mt7921: introduce mt7921e support
  mt76: mt7921: add debugfs support
  mt76: mt7921: introduce schedule scan support
  mt76: mt7921: introduce 802.11 PS support in sta mode
  mt76: mt7921: introduce support for hardware beacon filter
  mt76: mt7921: introduce beacon_loss mcu event
  mt76: mt7921: introduce PM support

 drivers/net/wireless/mediatek/mt76/Kconfig    |    1 +
 drivers/net/wireless/mediatek/mt76/Makefile   |    1 +
 .../net/wireless/mediatek/mt76/mt7921/Kconfig |   10 +
 .../wireless/mediatek/mt76/mt7921/Makefile    |    5 +
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |  178 +
 .../net/wireless/mediatek/mt76/mt7921/dma.c   |  356 ++
 .../wireless/mediatek/mt76/mt7921/eeprom.c    |  101 +
 .../wireless/mediatek/mt76/mt7921/eeprom.h    |   27 +
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  270 ++
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 1366 ++++++++
 .../net/wireless/mediatek/mt76/mt7921/mac.h   |  333 ++
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 1050 ++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 2924 +++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   | 1175 +++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  374 +++
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  279 ++
 .../net/wireless/mediatek/mt76/mt7921/regs.h  |  413 +++
 17 files changed, 8863 insertions(+)
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
