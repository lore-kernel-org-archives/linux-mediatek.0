Return-Path: <SRS0=NTS1=G2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D653C433E6
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:45:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27D2D23A5B
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27D2D23A5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FIEkm4yZ8aV4ZzV2RHc+2NGBW3On26HvaPv46OaWDPw=; b=mhCHB25HUs3/NsZb2xuBndLTG
	upqQgAw2ZG/Flw7kgjyCwS8E1iNEmbF1ECTzPjlwbFyjJUI+63GeN/rTB1OZdJD1n3UAB9snP0L3G
	F9yeoyGjtVL0bIY9PWxJe6m4YFsRheSEAiXvjqWpMooCydQtwgm/DmaNy3ZldsXH89fOa1CBlw/9o
	dZJAn4G8H2CrV5RWpXbcrCrFV2oSCIVLx2/EQATFqA9yc30x1rmvKw79BKdUYAFSWblkJMOwXLb3g
	KZClKGmXqhzJcZ9Sy1iVqipKEB3SzhodhgLFiBew9pQICBzLfcAGIeFjBjtd942UJxikFI3Xagj2P
	uYvyvxRUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3EYC-0005hd-BQ; Sat, 23 Jan 2021 08:45:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3EY2-0005Xt-8P
 for linux-mediatek@lists.infradead.org; Sat, 23 Jan 2021 08:45:38 +0000
X-UUID: 6c74b16cb9ce4162acf762c219b793b1-20210123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sNRht3KuUC0q1GK6o9DK+o8yI2JwC70RdEbvlUH1i6c=; 
 b=phVQX0KZKzzPxpRmPCBsL+grfY19KSmlUqZVe0eDjVjwVhkwKGMSWG1ryt0hyEiRT5pI27IuNn9AOwrz6h+n4bxAfrt3V92R59ZJoQTAe16HkYS7/kb+ngPxheZVgR48K8ZrqCc0HJTxrQ208gUFzKgND+7N9/SpLybxRJie810=;
X-UUID: 6c74b16cb9ce4162acf762c219b793b1-20210123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 960501746; Sat, 23 Jan 2021 00:45:30 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 00:35:29 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 16:35:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Jan 2021 16:35:15 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v7 08/22] mt76: mt7921: add module support
Date: Sat, 23 Jan 2021 16:34:59 +0800
Message-ID: <feac135d366a16bd554eeccd18ecdc5f6ab619e2.1611389300.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1611389300.git.objelf@gmail.com>
References: <cover.1611389300.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_034534_499366_2426A32E 
X-CRM114-Status: GOOD (  16.17  )
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
index 74f99f08d0b5..9ff43f1fc50d 100644
--- a/drivers/net/wireless/mediatek/mt76/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/Kconfig
@@ -33,3 +33,4 @@ source "drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig"
 source "drivers/net/wireless/mediatek/mt76/mt7603/Kconfig"
 source "drivers/net/wireless/mediatek/mt76/mt7615/Kconfig"
 source "drivers/net/wireless/mediatek/mt76/mt7915/Kconfig"
+source "drivers/net/wireless/mediatek/mt76/mt7921/Kconfig"
diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
index eac419c64788..94efe3c29053 100644
--- a/drivers/net/wireless/mediatek/mt76/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/Makefile
@@ -34,3 +34,4 @@ obj-$(CONFIG_MT76x2_COMMON) += mt76x2/
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
