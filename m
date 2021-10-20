Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D31C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 15:32:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20392610E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 15:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20392610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s8CpHY6jhrxOLv4oJwzuVv6Yz5xU3POtEzVusXudqfg=; b=nuz+JF8kh3XuEj
	kG/z6LqmnD0lt+NpQWsClu3LD+HeKXSIcef/9+sMunaNQDQF1cQbhRQgGeO+MGW/kRPc56UomT8pP
	9TIbmaAtP+7rA/T+Ons128p9/Ww94BpFYt1cO+eNv3z7V5PXmvi9q821CZseG6rdQhn9aF2gAH5dl
	oyKPDtgOn6h1t8XyInZwSyQDZNlfqyqoP9bu6mcfHKfZWLTc8tHpdWDw+US30wiZWAvWxYn04LzU2
	ZD5dKBmqDrwYuvNSELPt3pcGL72yI1aV+qOX7hzaB8pn4CkRF5UkukrmUTxf0fDL/d205l5HqG+Z6
	Qg10jt7QseNAVg8p+XRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdDZf-0053KX-Bx; Wed, 20 Oct 2021 15:32:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdDSb-00503G-0U
 for linux-mediatek@lists.infradead.org; Wed, 20 Oct 2021 15:24:58 +0000
X-UUID: d2a2ae22764d4f1d8cda0bf629fc5038-20211020
X-UUID: d2a2ae22764d4f1d8cda0bf629fc5038-20211020
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 9378123; Wed, 20 Oct 2021 08:24:52 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 08:24:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Oct 2021 23:24:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Oct 2021 23:24:37 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH] mt76: mt7615: apply cached RF data for DBDC
Date: Wed, 20 Oct 2021 23:24:35 +0800
Message-ID: <5526d0a2cf959d1700c8ed0128f6eee787ec9332.1634720865.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_082457_106240_79D68BBE 
X-CRM114-Status: GOOD (  11.20  )
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

Band0 and band1 share the same hardware, so band0 will stop Tx/Rx when
band1 performs Rx calibration. cal_cache is introduced to solve such
corner cases by moving necessary datas from channel_switch to bootup.

Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 22 +++++++++++++++++--
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 2cb3969e6432..25f9cbe2cd61 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1698,6 +1698,19 @@ int mt7615_mcu_fw_log_2_host(struct mt7615_dev *dev, u8 ctrl)
 				 sizeof(data), true);
 }
 
+static int mt7615_mcu_cal_cache_apply(struct mt7615_dev *dev)
+{
+	struct {
+		bool cache_enable;
+		u8 pad[3];
+	} data = {
+		.cache_enable = true
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_CAL_CACHE, &data,
+				 sizeof(data), false);
+}
+
 static int mt7663_load_n9(struct mt7615_dev *dev, const char *name)
 {
 	u32 offset = 0, override_addr = 0, flag = FW_START_DLYCAL;
@@ -1906,9 +1919,14 @@ int mt7615_mcu_init(struct mt7615_dev *dev)
 	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_FWDL], false);
 	dev_dbg(dev->mt76.dev, "Firmware init done\n");
 	set_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
-	mt7615_mcu_fw_log_2_host(dev, 0);
 
-	return 0;
+	if (dev->dbdc_support) {
+		ret = mt7615_mcu_cal_cache_apply(dev);
+		if (ret)
+			return ret;
+	}
+
+	return mt7615_mcu_fw_log_2_host(dev, 0);
 }
 EXPORT_SYMBOL_GPL(mt7615_mcu_init);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index b89faab04996..4e2c9dafd776 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -531,6 +531,7 @@ enum {
 	MCU_EXT_CMD_TX_POWER_FEATURE_CTRL = 0x58,
 	MCU_EXT_CMD_RXDCOC_CAL = 0x59,
 	MCU_EXT_CMD_TXDPD_CAL = 0x60,
+	MCU_EXT_CMD_CAL_CACHE = 0x67,
 	MCU_EXT_CMD_SET_RDD_TH = 0x7c,
 	MCU_EXT_CMD_SET_RDD_PATTERN = 0x7d,
 };
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
