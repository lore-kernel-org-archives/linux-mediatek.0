Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78765C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:00:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38536207BC
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38536207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wAdN6MekEM6+/C2g6fR3XY+0hOQA6DewrOfrumXlMwY=; b=iIAq8Mctrqaot6wlQ7DXrOH2EP
	SdrW+/2o3SGUkB+/yLWRQYsakssh7jBnxa6oRlTF5gFUiLFLS3gq0pzWfM5zUu5CTLQzgUoFQF1E/
	6WjJbhrSkXjGZC9w8vyQAGBAgxmS3gs1UD+gELoZefgSBLKmLz2IHNfAE3PRCB+dIoOMOnF/+aIlA
	PLfvcpAQ1iwFZ36HNIev7DZAN0FUX+0GbraVCa8olAIC/4+httUISrQUKlq17MUOkY4lCYClKtzv1
	XymUUcyZL6zORY9XsvB+cHrlbc8JvIrB2s3l8UAImVaZXdQdd2pg6J9lW4TEXeZH6sPKXSooUWxbk
	l/HG707w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwU9l-0000aP-Cj; Mon, 04 Jan 2021 18:00:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwU9i-0000S4-Bh
 for linux-mediatek@lists.infradead.org; Mon, 04 Jan 2021 18:00:35 +0000
X-UUID: 608e37890efa4c4598af2772928924a1-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=SieptIMo2qaGJdqgHq882WFoHqSh/9wPyqfsPEwvB34=; 
 b=n6Q3IRD55yzvHNe1AwWigtzVjIO2k4MpHzYjDrdyte31wQoUw6JMcdzwMsy2Ez5NR+p/4BTk6f/NGUq7JprYorydBuE+P1JO5B7o56Az8VISR/Z7OyGWokt6xjkgT8p38AIDd+nB8/gClYHthb38TmYgrZpIJiL98rjweLQenBM=;
X-UUID: 608e37890efa4c4598af2772928924a1-20210104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 615164288; Mon, 04 Jan 2021 10:00:23 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 10:00:21 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 02:00:20 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 02:00:20 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v5 00/15]  introduce mt7921e support
Date: Tue, 5 Jan 2021 02:00:04 +0800
Message-ID: <cover.1609781247.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_130034_608390_2FD5D39E 
X-CRM114-Status: GOOD (  15.52  )
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
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 2932 +++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   | 1175 +++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  377 +++
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  279 ++
 .../net/wireless/mediatek/mt76/mt7921/regs.h  |  413 +++
 48 files changed, 8995 insertions(+), 115 deletions(-)
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
