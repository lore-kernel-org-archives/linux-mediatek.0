Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA38C3F2CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:41:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D21FB20663
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:41:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HGuYftOz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pt+tj8db"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D21FB20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JjE9r8b3SyLZZaWfnG+wmGhWuWalWR7TbrTAvrmOALI=; b=HGuYftOz+Xihve
	XdOR1uKT/fd/pcuuR0pg3tmU+LGR8tPbmOf+emMvE5ezJkzAKqdc29hR3yuCJonXB8YUXxvyhV9Cl
	5jLtRr/FIsiA4fRB/ShVsemrDGOA8pU9QBt0ZhraG6T/hBniQgbgpcDUEgTxKNcBWBn/Ja4D8tYx1
	eCCjx43WcLmOl/T8baMa5w0U4OUWYg6CYSx7pCX7BiTr0cOvJTtnYPxNs90ZGO2BaI5tSK9t6M9Cm
	rtLYHFVQfBySm+obgFm1PAX7ZDMyxltpK5FD8Mf1MfXJydpEZOWMOEyECS31RRHS6+CjUANN+PN0c
	2T+ACcmBgqUR1qpv4KMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFHn-0006Jg-Fz; Tue, 17 Mar 2020 16:41:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFHk-0006JJ-F6
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:41:45 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BB1F20663;
 Tue, 17 Mar 2020 16:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463303;
 bh=IjW4g5M1HNkV84LEuAtowL2ke1/JWAWPnyqvm0y3bps=;
 h=From:To:Cc:Subject:Date:From;
 b=pt+tj8dbnCt6z83pRofmkGt0KlJ9uO1UUd5Yc9qQP2D6gk9FadWz3gC0XvOLSZequ
 baN3sr643RtgyvRraqLJ081X3JDov/+uieYyNGjPomq1qrypXjTQfGbD4IAY0i9gCW
 Bq5m2ROSEjyvU/Natirs0KiIQTdM0rgOBb6y/4zg=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 00/25] Introduce mt7663e support to mt7615 driver
Date: Tue, 17 Mar 2020 17:41:07 +0100
Message-Id: <cover.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094144_529231_72ACBA55 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce support for mt7663e 802.11ac 2x2:2 chipset to mt7615 driver.
Introduce mt7615e_reg_map and mt7663e_regmap to reuse mt7615 code.
MCU code refactoring.
Introduce UNI MCU commands.

Changes since v3:
- align commands to new firmware version

Changes since v2:
- fix nss configuration
- remove mt7615_mcu_uni_set_state routine

Changes since v1:
- MCU code refactoring
- Introduce UNI MCU commands for firmware v3
- add firmware v3 support


Lorenzo Bianconi (25):
  mt76: mt7615: introduce mt7615_mcu_fill_msg
  mt76: mt7615: introduce mt7615_mcu_wait_response
  mt76: mt7615: cleanup fw queue just for mmio devices
  mt76: mt7615: introduce mt7615_init_device routine
  mt76: always init to 0 mcu messages
  mt76: mt7615: introduce mt7615_mcu_send_message routine
  mt76: mt7615: add mt7615_mcu_ops data structure
  mt76: mt7615: move mt7615_mcu_set_bmc to mt7615_mcu_ops
  mt76: mt7615: move mt7615_mcu_set_sta in mt7615_mcu_ops
  mt76: mt7615: rely on skb API for mt7615_mcu_set_eeprom
  mt76: mt7615: rework mt7615_mcu_set_bss_info using skb APIs
  mt76: mt7615: move more mcu commands in mt7615_mcu_ops data structure
  mt76: mt7615: introduce MCU_FW_PREFIX for fw mcu commands
  mt76: mt7615: introduce mt7615_register_map
  mt76: mt7615: add mt7663e support to mt7615_reg_map
  mt76: mt7615: add mt7663e support to mt7615_{driver,firmware}_own
  mt76: mt7615: add mt7663e support to mt7615_mcu_set_eeprom
  mt76: mt7615: introduce mt7615_eeprom_parse_hw_band_cap routine
  mt76: mt7615: introduce mt7615_init_mac_chain routine
  mt76: mt7615: introduce uni cmd command types
  mt76: mt7615: introduce set_bmc and st_sta for uni commands
  mt76: mt7615: add more uni mcu commands
  mt76: mt7615: introduce set_ba uni command
  mt76: mt7615: get rid of sta_rec_wtbl data structure
  mt76: mt7615: introduce mt7663e support

 drivers/net/wireless/mediatek/mt76/mcu.c      |    6 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |    4 +
 .../net/wireless/mediatek/mt76/mt7603/mcu.c   |    1 -
 .../net/wireless/mediatek/mt76/mt7615/dma.c   |   50 +-
 .../wireless/mediatek/mt76/mt7615/eeprom.c    |   66 +-
 .../wireless/mediatek/mt76/mt7615/eeprom.h    |    2 +
 .../net/wireless/mediatek/mt76/mt7615/init.c  |  157 +-
 .../net/wireless/mediatek/mt76/mt7615/mac.c   |   23 +-
 .../net/wireless/mediatek/mt76/mt7615/mac.h   |   11 +-
 .../net/wireless/mediatek/mt76/mt7615/main.c  |   36 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 2761 ++++++++++-------
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  144 +-
 .../net/wireless/mediatek/mt76/mt7615/mmio.c  |   67 +-
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |   63 +-
 .../net/wireless/mediatek/mt76/mt7615/pci.c   |    8 +-
 .../net/wireless/mediatek/mt76/mt7615/regs.h  |   87 +-
 .../net/wireless/mediatek/mt76/mt7615/soc.c   |    2 +-
 17 files changed, 2197 insertions(+), 1291 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
