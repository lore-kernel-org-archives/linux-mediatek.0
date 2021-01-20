Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B0BC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 19:42:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C71F32343F
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 19:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C71F32343F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hWkrOavl3h57DZ4HQa4ctKwIKnQ1X6kuU4frdfyhrk4=; b=HhHGe1ZkK6w3HosrJFjE6wKPL
	a97P/dl10N8nnv1b0zIc6pS7cmUOlqHqUXmyR5NzuIDDQp2QfUMxOdXTaFoScgL+g6uH3wE+uVYVq
	v6w7RABIfO3uj7muNPrlEhYEz3MyWXQq65iGEbm+24NSbnfuSDaIVV4NdIfWI21Qu1pZYkzUdxbPU
	vDDwGN3UltPvKvWIzBd/NzRSmGlOrkZdeOJKa1FqgaA4GFJQu89IZ4LKa6qITHa1DTg4oBzKMzsoN
	yT/xOdo8y5DeHNQMEiNL+rwK6WdO/rU5FVITYInzr4uELAqxUUgrpmBAQ/j6w8F11p3IY493Gg67o
	ltxRji/aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2JND-0007Ij-U1; Wed, 20 Jan 2021 19:42:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2JN8-0007GB-TD
 for linux-mediatek@lists.infradead.org; Wed, 20 Jan 2021 19:42:33 +0000
X-UUID: 59baf90501334dbdbf655b82d799a579-20210120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PiXEsKpl8yqASOUA7jMTl9StRieF3q2ha1Lq6hgX+3M=; 
 b=TCCqCK84E7JaIzardwR5MmTwkYfbi1Hm56HAmsykXaYwgR9Ib9GqwYe1328oPbSWZRb77eJU64hGSTsnu5/M6GyyyoNDAdmgJ+WoKYwOEcQyi3kPjVnLd2Pl8+tlHot+LS5ZyhgpjJQwcXDqFszWBU/ESe3I0avo+P0mtHuktOk=;
X-UUID: 59baf90501334dbdbf655b82d799a579-20210120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 959162610; Wed, 20 Jan 2021 11:42:26 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 11:34:08 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 03:33:55 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Jan 2021 03:33:55 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v6 10/15] mt76: mt7921: add module support
Date: Thu, 21 Jan 2021 03:33:46 +0800
Message-ID: <3b0bbd318d1507dc747a37cef57ef2207ec72cc0.1611060302.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1611060302.git.objelf@gmail.com>
References: <cover.1611060302.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_144231_191777_00CBA18A 
X-CRM114-Status: GOOD (  16.98  )
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
 linux-mediatek@lists.infradead.org, Soul.Huang@mediatek.com,
 Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Add mt7921 as the pci driver module.

The purpose of the patch is to check about if the following patches are
able to compile properly.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/Kconfig         |  1 +
 drivers/net/wireless/mediatek/mt76/Makefile        |  1 +
 drivers/net/wireless/mediatek/mt76/mt7921/Kconfig  | 10 ++++++++++
 drivers/net/wireless/mediatek/mt76/mt7921/Makefile |  5 +++++
 4 files changed, 17 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/Kconfig
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/Makefile

diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wireless/mediatek/mt76/Kconfig
index 31015d2a8e7d..5f42ce3267cb 100644
--- a/drivers/net/wireless/mediatek/mt76/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/Kconfig
@@ -29,3 +29,4 @@ source "drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig"
 source "drivers/net/wireless/mediatek/mt76/mt7603/Kconfig"
 source "drivers/net/wireless/mediatek/mt76/mt7615/Kconfig"
 source "drivers/net/wireless/mediatek/mt76/mt7915/Kconfig"
+source "drivers/net/wireless/mediatek/mt76/mt7921/Kconfig"
diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
index e53584db0756..1d72093b61a3 100644
--- a/drivers/net/wireless/mediatek/mt76/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/Makefile
@@ -31,3 +31,4 @@ obj-$(CONFIG_MT76x2_COMMON) += mt76x2/
 obj-$(CONFIG_MT7603E) += mt7603/
 obj-$(CONFIG_MT7615_COMMON) += mt7615/
 obj-$(CONFIG_MT7915E) += mt7915/
+obj-$(CONFIG_MT7921E) += mt7921/
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7921/Kconfig
new file mode 100644
index 000000000000..24932d2e8dee
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: ISC
+config MT7921E
+	tristate "MediaTek MT7921E (PCIe) support"
+	select MT76_CORE
+	depends on MAC80211
+	depends on PCI
+	help
+	  This adds support for MT7921E 802.11ax 2x2:2SS wireless devices.
+
+	  To compile this driver as a module, choose M here.
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
new file mode 100644
index 000000000000..09d1446ad933
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
@@ -0,0 +1,5 @@
+#SPDX-License-Identifier: ISC
+
+obj-$(CONFIG_MT7921E) += mt7921e.o
+
+mt7921e-y := pci.o mac.o mcu.o dma.o eeprom.o main.o init.o debugfs.o
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
