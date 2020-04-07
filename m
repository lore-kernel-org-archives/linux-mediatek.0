Return-Path: <SRS0=UhTi=5X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE59EC2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 09:46:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81A5620771
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 09:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jiMrY1bU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Thhl4Bqx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81A5620771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8eQ7B/8PX6mMNquka0hWUghQLPOI5HASPLIioBqsX+0=; b=jiMrY1bUJjrTLX
	fX9io9sFkcZzDEaCnginTYTlaX5XFGBVBzfPtSMNLeMkIi29ambcBrexbBfbAGqKamnqnpYg7iaMr
	+/UlHdHb/t2m0IhrpHVXTZucZBa1NxXeHZNr5BHeZkJL6sjnDqSyo0EBTHu5wkkyxW/ANk3NmEAhY
	veHHm2ltXtshYjq7uScMT62JMci3UdXdkMoHFcUY8u6xQTBo+zmnImKAwWzMWw2luoAJ3qY6v1LTt
	V2YFLGudLNElC5v6vHvJB/ZpukdD/dZ4Avob64JPZ6vYhp0CYVSdjemP63xyPnLf+n43G+2FEnEOR
	sc6uRg4BIRYeOiIFFNHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLkoa-0007H2-Gv; Tue, 07 Apr 2020 09:46:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLkoY-0007Fe-PB
 for linux-mediatek@lists.infradead.org; Tue, 07 Apr 2020 09:46:40 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43C8E206F7;
 Tue,  7 Apr 2020 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586252797;
 bh=vmMFAZvzCoaDq5CXouqdXRp0C/IF3TkazDI9UnOjsII=;
 h=From:To:Cc:Subject:Date:From;
 b=Thhl4BqxmYUIcDweoSj5pgyo3PfGD/T2dthjJXCwTM303+cafT/mhwIjwZ4pSY7rX
 lNfLZ776liWq6n8TW6wAlf+WMWND4tAv5D3i3qtpQexyLQbwgjm7cXOn4OcORyijdQ
 dBitnGvwH7Ga+AAZ4pKYhLpjbPGuKi5SR29Vkexo=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 0/2] introduce usb support to mt7615 driver
Date: Tue,  7 Apr 2020 11:46:27 +0200
Message-Id: <cover.1586252669.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_024638_837237_1E28F535 
X-CRM114-Status: UNSURE (   8.38  )
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

Introduce support for mt7663u 802.11ac 2x2:2 chipset to mt7615 driver.
Create mt7615-common module as container for mmio and usb shared code

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
 .../net/wireless/mediatek/mt76/mt7615/init.c  | 176 +-------
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 244 ++++------
 .../net/wireless/mediatek/mt76/mt7615/mac.h   |   5 +-
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 181 ++++----
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  18 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |   5 +
 .../net/wireless/mediatek/mt76/mt7615/mmio.c  |  30 ++
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  67 ++-
 .../wireless/mediatek/mt76/mt7615/pci_init.c  | 171 +++++++
 .../wireless/mediatek/mt76/mt7615/pci_mac.c   | 179 ++++++++
 .../net/wireless/mediatek/mt76/mt7615/regs.h  |  26 ++
 .../net/wireless/mediatek/mt76/mt7615/usb.c   | 418 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt7615/usb_init.c  | 144 ++++++
 .../wireless/mediatek/mt76/mt7615/usb_mcu.c   |  93 ++++
 21 files changed, 1367 insertions(+), 462 deletions(-)
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
