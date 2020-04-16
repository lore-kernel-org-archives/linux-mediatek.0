Return-Path: <SRS0=NHOn=6A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B861C2BB55
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 14:33:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7058B21D7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 14:33:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k2LAuVjq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="H16abqjI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7058B21D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vCmySz76+t8D9dA+g6DWO6WO4z3gqFLpM7LosAtieG4=; b=k2LAuVjq67sVHW
	+t6vUuhAb50KRaM9P79a4WEEOtjXsUV4b/nqSDpMgiTLRpOfTuxJVmHWwpw6uMDCLKNup1mag8INg
	gnNMs/XoD91XTexv6502YbyE3yBUPLkezNyt1yC36jg4I7JYbNuDaSKotJ5iEXE+YHdPDWX5Kofbu
	smEQ8Wp3P/c8QXpFVa8ofNHVrffgqC5qho0W/QrBVCCBAsGoddDEnPkcr49nzMXGkT+0cP6kUadOx
	rvV6Dh3Ioh5JYWl7RrsEZJfkH6spNTn51ewJuLR6kRFuaussCuEgfBZaYlyxS1ifcxwQVq2shrBWb
	qYHTW4MNDqZE0K6JHeqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP5Ze-0005Kg-IK; Thu, 16 Apr 2020 14:33:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP5Zb-0005KL-Eh
 for linux-mediatek@lists.infradead.org; Thu, 16 Apr 2020 14:33:00 +0000
Received: from lore-desk.redhat.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D872521927;
 Thu, 16 Apr 2020 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587047578;
 bh=FhD3Ty+RbHgAW6Fo2GvLifEfqRIh6qjW4sRsLYZRC2M=;
 h=From:To:Cc:Subject:Date:From;
 b=H16abqjI20/S3QLQZCizj/fLdGv8pjxQb4iHBwpEebURa9POO87k0PDla2KljtsGZ
 TFKqViJN1sI/nvKO8LjonjfR/Fd/SlnKdIX1hTmGsAW9C5SWfZpmuqditVlTQUHyii
 vQ3D/nr6a3nOlER2RnlJ+7E1ODAOksO7TBHliMXM=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v3 0/2] introduce usb support to mt7615 driver
Date: Thu, 16 Apr 2020 16:32:49 +0200
Message-Id: <cover.1587047373.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_073259_511604_9A703D14 
X-CRM114-Status: UNSURE (   8.74  )
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
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce support for mt7663u 802.11ac 2x2:2 chipset to mt7615 driver.
Create mt7615-common module as container for mmio and usb shared code

Changes since v2:
- rebased ontop of mt76 master branch
- fix license

Changes since v1:
- rebased ontop of mt76 master branch

Lorenzo Bianconi (2):
  mt76: mt7615: move core shared code in mt7615-common module
  mt76: mt7615: introduce mt7663u support

 drivers/net/wireless/mediatek/mt76/Makefile   |   2 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   1 +
 .../net/wireless/mediatek/mt76/mt7615/Kconfig |  18 +-
 .../wireless/mediatek/mt76/mt7615/Makefile    |  10 +-
 .../wireless/mediatek/mt76/mt7615/debugfs.c   |   1 +
 .../net/wireless/mediatek/mt76/mt7615/dma.c   |  39 --
 .../wireless/mediatek/mt76/mt7615/eeprom.c    |   1 +
 .../net/wireless/mediatek/mt76/mt7615/init.c  | 194 +--------
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 249 ++++-------
 .../net/wireless/mediatek/mt76/mt7615/mac.h   |   5 +-
 .../net/wireless/mediatek/mt76/mt7615/main.c  |  66 +--
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  18 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |   5 +
 .../net/wireless/mediatek/mt76/mt7615/mmio.c  |  30 ++
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  22 +-
 .../wireless/mediatek/mt76/mt7615/pci_init.c  | 189 +++++++++
 .../wireless/mediatek/mt76/mt7615/pci_mac.c   | 184 ++++++++
 .../net/wireless/mediatek/mt76/mt7615/regs.h  |  26 ++
 .../net/wireless/mediatek/mt76/mt7615/usb.c   | 396 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt7615/usb_init.c  | 144 +++++++
 .../wireless/mediatek/mt76/mt7615/usb_mcu.c   |  93 ++++
 21 files changed, 1259 insertions(+), 434 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/usb.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c

-- 
2.25.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
