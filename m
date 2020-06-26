Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF86DC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:25:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC1820B80
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:25:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kkyR7tsC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ygzOV/rJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDC1820B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JylA8WCGyYc1XAIpeTdubLTTQmUYqdJKhlNFUqnQ81A=; b=kkyR7tsC1FEI4pzy5LAN0i9lyP
	brYV2swSkrDVuxkLOZZ61l63MQ515l2fg56NUut15ZX1mSKF7fre9q+WoSVq+wJSNS6HpbdyroRLU
	pbbwGwjt/69aJN94UfVaqOrOOcsiQv19wNGG8FTU4jWlpbre3spDh9TcUy8dLmsawqYdsraLzcad5
	ROxbDJdlwORy6wncMQPdRrHEH6Q2SvLctM382gH2SOoXYJJyuAlG95uex+6W3yIcpELIxyMorSFAG
	IRXxbmXVo8GLSCDnt/lbFR5j2QIZaVl1ejfwBxmcd+i0NyFip3eqffQ4yqBiQwYE0xWBbrEfwpjPQ
	BPYcG7cA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jovqm-0001u7-Fr; Fri, 26 Jun 2020 21:25:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jovqk-0001tK-3l
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 21:25:30 +0000
Received: from localhost.localdomain.com (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9128C20B1F;
 Fri, 26 Jun 2020 21:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593206728;
 bh=+T9NvsXtOyvF9Opeckil8MObmla13qqGEOfn8ntgF5M=;
 h=From:To:Cc:Subject:Date:From;
 b=ygzOV/rJq05DBqBbJkXNulhL+xSYPIOZd/a0qWDxlIc77DNb2ArhGYsoUyngpuJkF
 spRh1KIHA7/GeTncKn+gRYdRyQqmedt+gAH0wgXfKQ9hudSso4SztQegQWfVh1G6/o
 T1i+7rWsDKKGiVaEZAK7ur/4rdeNBbaxGexfZx64=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 00/17] add runtime-pm support to mt7663 driver
Date: Fri, 26 Jun 2020 23:25:00 +0200
Message-Id: <cover.1593204577.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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

This series enable runtime power management support available in mt7663 offload
firmware in order to put the device in a reduced power consumption state if
idle for a configurable period of time. mt76 driver wakes the chipset up before
tx packets, accessing register map or sending mcu messages.

Tested-by: Sean Wang <sean.wang@mediatek.com>

Lorenzo Bianconi (17):
  mt76: mt7615: avoid polling in fw_own for mt7663
  mt76: move mt76 worqueue in common code
  mt76: mt7615: add mt7615_pm_wake utility routine
  mt76: mt7615: introduce mt7615_mutex_{acquire,release} utilities
  mt76: mt7615: wake device before accessing regmap in debugfs
  mt76: mt7615: wake device before configuring hw keys
  mt76: mt7615: introduce pm_power_save delayed work
  mt76: mt7615: wake device in mt7615_update_channel before access
    regmap
  mt76: mt7615: acquire driver_own before configuring device for suspend
  mt76: mt7615: wake device before pulling packets from mac80211 queues
  mt76: mt7615: wake device before pushing frames in mt7615_tx
  mt76: mt7615: check MT76_STATE_PM flag before accessing the device
  mt76: mt7615: do not request {driver,fw}_own if already granted
  mt76: mt7615: add runtime-pm knob in mt7615 debugfs
  mt76: mt7615: enable beacon hw filter for runtime-pm
  mt76: mt7615: add idle-timeout knob in mt7615 debugfs
  mt76: mt7615: improve mt7615_driver_own reliability

 drivers/net/wireless/mediatek/mt76/mac80211.c |  15 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   6 +-
 .../wireless/mediatek/mt76/mt7615/debugfs.c   |  57 +++++
 .../net/wireless/mediatek/mt76/mt7615/init.c  |   7 +
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 186 +++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 200 +++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  55 +++--
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  44 ++++
 .../net/wireless/mediatek/mt76/mt7615/pci.c   |   4 +
 .../wireless/mediatek/mt76/mt7615/pci_init.c  |   4 +
 .../net/wireless/mediatek/mt76/mt7615/usb.c   |  17 +-
 .../wireless/mediatek/mt76/mt7615/usb_mcu.c   |   6 +-
 .../net/wireless/mediatek/mt76/mt76x0/usb.c   |   6 +-
 .../net/wireless/mediatek/mt76/mt76x2/usb.c   |   7 +-
 drivers/net/wireless/mediatek/mt76/usb.c      |  20 +-
 15 files changed, 515 insertions(+), 119 deletions(-)

-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
