Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFF1CD98CF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JFLLIafIg2RN3lK3a2syVcO/tejcNuhPUiFDic1ff7A=; b=uAS4FY7H/E6DS3L3+PMlIQ2LPM
	RqJL/RiNhSoUv6MhLrNhSpOPu/DMUpvgiKL8JNwCrpTpnpzoDdARihAGbg/NWl5lBPP0ZJT5uYC2z
	5HJ2R8VZAoYpaoLk3kLXcFOK/GqOWjTMCQ6+sSWjKiuvC4Sdsrjot0J9UkxHLM3zVHQmrTwsBfZ1s
	wj2H9/anxxf4KdpY2/ETRjBbJmikVNLlOVtn76c85EgTsds81whlfAQ3VoK3vl4qe9Xn+pNiQ/32u
	XtaTyD7/gT8mpPWGzOYIK23fhVk0JzPDeA7UHnxygjeR7zxp3Sfn12Oh7ibX2usm5kd2nke3oDUIx
	Ss18V/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8Ht-0000000BX9z-3Oh6;
	Fri, 12 Jun 2026 20:15:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8Hs-0000000BX9r-2EN6
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 20:15:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 03CB8444F5;
	Fri, 12 Jun 2026 20:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EE01F000E9;
	Fri, 12 Jun 2026 20:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781295331;
	bh=JFLLIafIg2RN3lK3a2syVcO/tejcNuhPUiFDic1ff7A=;
	h=From:To:Cc:Subject:Date;
	b=h+lSchtSegzbf7cESfcBDapSMYwPK1AzgV95HWmnL6iyWpNumaMAVTn/QfoUe89Jn
	 Xzrxic5EfnVQECpweIxMdCYGo6PCQpb7zWxJ4OiJmuLMnOJlab6dW9Ntc+m1O4kkDF
	 regR/kyq/TzphCLoXxyZZ8B/rT55vNFLLcYerPPCLAUZ/7NBpaCcBQOXnJMdsgWA3r
	 dsW0JV6mqyaRWB4bys9I4R6UupwC5AYISkHq2y6DxeR3f3wZHu+RUB5ALDrpml1Vfx
	 3w/pr9tVWgRcBr7Vqw2hqj+pCHxiZHsoSNiS8gweHT+EZipjbnb0d9VEldGIAycVKo
	 Np5pzxYT8XYgg==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rex Lu <rex.lu@mediatek.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] [wireless-next v2] wifi: mt76: fix airoha_npu dependency tracking
Date: Fri, 12 Jun 2026 22:13:19 +0200
Message-Id: <20260612201519.4054683-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

There is a new build failure with MT7996E=m MT76_CORE=y and NET_AIROHA_NPU=m:

ld.lld: error: undefined symbol: airoha_npu_get
ld.lld: error: undefined symbol: airoha_npu_put
>>> referenced by npu.c
>>>               drivers/net/wireless/mediatek/mt76/npu.o:(mt76_npu_init) in archive vmlinux.a

Fix this by reworking the dependency for the MT7996_NPU to only
allow enabling that when mt76_core can link against the npu driver.

To make sure this gets caught more easily in the future when additional
mt76 variants need the same dependency, also turn CONFIG_MT76_NPU into
a tristate symbol that has the same dependency.

Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
----
v2: fix typo s/MT76/MT76_CORE/
---
 drivers/net/wireless/mediatek/mt76/Kconfig        | 4 ++--
 drivers/net/wireless/mediatek/mt76/Makefile       | 6 +++++-
 drivers/net/wireless/mediatek/mt76/mt76.h         | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/Kconfig | 2 +-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wireless/mediatek/mt76/Kconfig
index 502303622a53..2ca96e0527c0 100644
--- a/drivers/net/wireless/mediatek/mt76/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/Kconfig
@@ -38,8 +38,8 @@ config MT792x_USB
 	select MT76_USB
 
 config MT76_NPU
-	bool
-	depends on MT76_CORE
+	tristate
+	depends on NET_AIROHA_NPU=y || MT76_CORE=NET_AIROHA_NPU
 
 source "drivers/net/wireless/mediatek/mt76/mt76x0/Kconfig"
 source "drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig"
diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
index 1d42adfe8030..cacdd2b13d05 100644
--- a/drivers/net/wireless/mediatek/mt76/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/Makefile
@@ -12,7 +12,11 @@ mt76-y := \
 	mmio.o util.o trace.o dma.o mac80211.o debugfs.o eeprom.o \
 	tx.o agg-rx.o mcu.o wed.o scan.o channel.o
 
-mt76-$(CONFIG_MT76_NPU) += npu.o
+ifdef CONFIG_MT76_NPU
+# CONFIG_MT76_NPU is tristate to simplify dependency tracking,
+# but it behaves as a bool symbol here.
+mt76-y += npu.o
+endif
 mt76-$(CONFIG_PCI) += pci.o
 mt76-$(CONFIG_NL80211_TESTMODE) += testmode.o
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 07955555f84d..60bd155cc7d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1647,7 +1647,7 @@ int mt76_testmode_dump(struct ieee80211_hw *hw, struct sk_buff *skb,
 int mt76_testmode_set_state(struct mt76_phy *phy, enum mt76_testmode_state state);
 int mt76_testmode_alloc_skb(struct mt76_phy *phy, u32 len);
 
-#ifdef CONFIG_MT76_NPU
+#if IS_ENABLED(CONFIG_MT76_NPU)
 void mt76_npu_check_ppe(struct mt76_dev *dev, struct sk_buff *skb,
 			u32 info);
 int mt76_npu_dma_add_buf(struct mt76_phy *phy, struct mt76_queue *q,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
index 5503d03bf62c..5742bce12fbb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
@@ -16,6 +16,6 @@ config MT7996E
 config MT7996_NPU
 	bool "MT7996 (PCIe) NPU support"
 	depends on MT7996E
-	depends on NET_AIROHA_NPU=y || MT7996E=NET_AIROHA_NPU
+	depends on NET_AIROHA_NPU=y || MT76_CORE=NET_AIROHA_NPU
 	select MT76_NPU
 	default n
-- 
2.39.5


