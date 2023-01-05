Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF7FC54EBC
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 22:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rbty0gs6HZ2w88q1OVE/CopsJlj2NMIz5EoWxGiEgc8=; b=1GpWlBqQeaOJtpU5jGOX+rof/8
	E4sqiuWgdtdCYZ+h3pW22jwrRnkcxuUA+GOMTCUWGG3+1mSDhJX/QeDqTsUtTs7o7CR528uUHNQC4
	mV9tR6DqcAb1nIbgHeDqELfdCpXW8wWH0QeAUKp04EORUDgyNl6QlyCXmk80/B64ukn+kcDoFAmeb
	FT8VaJPKo+7HuDGxNgba1JLERrqMVbVuBKxRFto+7vqD24HzaUFzB3IcWguzIdQH6cp/pXD+83twI
	LjWOCU9Tddgzor16KDfG+7FqSK/slY1cueEyFMjplMpbe1su7cGSWoJ5R2H9LMdQVQjM1qhJ9G/y9
	LFTo91kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYWW-00FUXf-5a; Thu, 05 Jan 2023 22:15:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVD3-00Dm4j-7t
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 18:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Rbty0gs6HZ2w88q1OVE/CopsJlj2NMIz5EoWxGiEgc8=; b=p+ga8A9NZUfKkCj2XoH/8S94ge
	jy7zV1OjUMI4EdA81ihDyB4i9CQTSsSolZkbXyK+flHA952R7ewUnRIex0ALVEnIIKH0+6QOWtywb
	J/9xDvEW4x4TGNZ8SHPdzOLNridwbnIjtA7jW5JJ/knAawap3G6EivhcWkiRSZOTLIk9GRYE0oTvJ
	CcuN/XR+0OqPf1wJKYa/JlzEQjryVrbUUHci3Z23UyyEXwX4U0A233QerAtFNUq/6y60nvJDV6MPI
	QLI0qssdec8gPP+J+cGYevqrVs2mOnVRdws95BuRW7jYnHSGrFvrna9aJlnBQdt9NIsRDo7+o1L80
	ZZuv4axQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDOxu-001Idh-30
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jan 2023 12:03:25 +0000
X-UUID: 37bf796adfe14c0e97d97307ce9290f5-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Rbty0gs6HZ2w88q1OVE/CopsJlj2NMIz5EoWxGiEgc8=;
	b=GiNX53t+PQe6IS2W9s0R8VZP7dMhga+UOq65gypcVDkb2UedD0kUPk4brtHqzmvchiebtAFJvic4+1LFPYgOxuSKPhCR78JoPCVuwIFUVBnYbWmqhyZSsRH00SBTXs2bC8uI6FwbpC9V5Xe8qavVGZ7s1YU9YGNCG2GvNbdDoJE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:fcabbb2e-e631-47ab-a9a2-f60f467a0165,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:97185a8b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 37bf796adfe14c0e97d97307ce9290f5-20230105
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 141087911; Thu, 05 Jan 2023 04:47:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 Jan 2023 19:47:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 5 Jan 2023 19:47:13 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: mt7915: wed: enable red per-band token drop
Date: Thu, 5 Jan 2023 19:47:11 +0800
Message-ID: <20230105114711.31430-2-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230105114711.31430-1-chui-hao.chiu@mediatek.com>
References: <20230105114711.31430-1-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_120323_363346_20B792A1 
X-CRM114-Status: GOOD (  14.33  )
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

Enable RED to limit the number of token used by each band. If single band
uses too many tokens, it would hurt the throughput of the other bands.The
software path can solve this problem by AQL so enable RED for HW path only.

Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 54 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
 3 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index f1e942b9a887..855a434ecf54 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1171,6 +1171,7 @@ enum {
 	MCU_EXT_CMD_GET_MIB_INFO = 0x5a,
 	MCU_EXT_CMD_TXDPD_CAL = 0x60,
 	MCU_EXT_CMD_CAL_CACHE = 0x67,
+	MCU_EXT_CMD_RED_ENABLE = 0x68,
 	MCU_EXT_CMD_SET_RADAR_TH = 0x7c,
 	MCU_EXT_CMD_SET_RDD_PATTERN = 0x7d,
 	MCU_EXT_CMD_MWDS_SUPPORT = 0x80,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 37a3c1f082d9..a7bc2043a0db 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2291,6 +2291,57 @@ mt7915_mcu_init_rx_airtime(struct mt7915_dev *dev)
 				 sizeof(req), true);
 }
 
+static int mt7915_red_set_watermark(struct mt7915_dev *dev)
+{
+#define RED_GLOBAL_TOKEN_WATERMARK 2
+	u16 nbuf = dev->mt76.mmio.wed.wlan.nbuf;
+	struct {
+		__le32 args[3];
+
+		u8 cmd;
+		u8 version;
+		u8 __rsv1[4];
+		u16 len;
+
+		__le16 high_mark;
+		__le16 low_mark;
+		u8 __rsv2[12];
+	} __packed req = {
+		.args[0] = cpu_to_le32(MCU_WA_PARAM_RED_SETTING),
+		.cmd = RED_GLOBAL_TOKEN_WATERMARK,
+		.len = cpu_to_le16(sizeof(req) - sizeof(req.args)),
+
+		.high_mark = cpu_to_le16(nbuf - 256),
+		.low_mark = cpu_to_le16(nbuf - 256 - 1536),
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_WA_PARAM_CMD(SET), &req,
+				 sizeof(req), false);
+}
+
+int mt7915_mcu_set_red(struct mt7915_dev *dev, bool enabled)
+{
+#define RED_DISABLE		0
+#define RED_BY_WA_ENABLE	2
+	int ret;
+	u32 red_type = enabled ? RED_BY_WA_ENABLE : RED_DISABLE;
+	__le32 req = cpu_to_le32(red_type);
+
+	if (enabled) {
+		ret = mt7915_red_set_watermark(dev);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(RED_ENABLE), &req,
+				sizeof(req), false);
+	if (ret < 0)
+		return ret;
+
+	return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
+				 MCU_WA_PARAM_RED, enabled, 0);
+}
+
 int mt7915_mcu_init_firmware(struct mt7915_dev *dev)
 {
 	int ret;
@@ -2339,8 +2390,7 @@ int mt7915_mcu_init_firmware(struct mt7915_dev *dev)
 	if (ret)
 		return ret;
 
-	return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
-				 MCU_WA_PARAM_RED, 0, 0);
+	return mt7915_mcu_set_red(dev, mtk_wed_device_active(&dev->mt76.mmio.wed));
 }
 
 int mt7915_mcu_init(struct mt7915_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 29b5434bfdb8..b9ea297f382c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -278,6 +278,7 @@ enum {
 	MCU_WA_PARAM_PDMA_RX = 0x04,
 	MCU_WA_PARAM_CPU_UTIL = 0x0b,
 	MCU_WA_PARAM_RED = 0x0e,
+	MCU_WA_PARAM_RED_SETTING = 0x40,
 };
 
 enum mcu_mmps_mode {
-- 
2.18.0


