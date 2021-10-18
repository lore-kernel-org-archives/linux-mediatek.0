Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C67C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 08:10:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C39AE61076
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 08:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C39AE61076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AX0tx4Q1hYXR768T0/QCX1o3AucznUTishdGYvAZh/I=; b=S7nLppQ6pvO5zu
	nBroMjwlzy2DzzhIyeWIQ2TREu343VFVwcum6SUCjajTExjVeo1CzwHP0MFNBBfus2gTKuFekEXmv
	rjJ2BcoAoeay1f2NsKFpfsTyHVt9oj9dTsQZ4rLw5+B8I6MN6C/Vlq9l21sAh35zUlyUcVO8Fm6QJ
	qXZhKApAN+pfZEU02VfudB/+2mtnN2gYNC7Ud7DYQeGurYOsErPvl9MGkGFfKWBjmYVksXua00gYX
	AWVkpPMz3UsWha5qDuQHpv3f80ORrSHjNO8+tSGuPKjpTWsphwNrH3jRnIJUXgdoNG5IpA+fUtdO+
	Kbw2oBzcFHZevqNgfMIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcNiu-00EaeP-Ub; Mon, 18 Oct 2021 08:10:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcNip-00Eacr-FN
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 08:10:18 +0000
X-UUID: 35cf3b7e70e043f98a2349d70a2f6748-20211018
X-UUID: 35cf3b7e70e043f98a2349d70a2f6748-20211018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1677752701; Mon, 18 Oct 2021 01:10:11 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 01:09:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 18 Oct 2021 16:09:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Oct 2021 16:09:54 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v3 1/4] mt76: mt7915: enable HE UL MU-MIMO
Date: Mon, 18 Oct 2021 16:09:38 +0800
Message-ID: <20211018080941.11443-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_011015_548414_4869F767 
X-CRM114-Status: GOOD (  14.44  )
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

Enable HE UL MU-MIMO in sta_rec_muru, which works on both ap and station
mode.

For sending trigger frames, one of the conditions fw uses is to check if
mib rx airtime meets the threshold.
There's a main control of mib rx airtime report register in fw, so we
need to enable the register by mcu cmd instead of directly writing it,
otherwise it will still be disabled by fw.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2: refine mt7915_mcu_sta_muru_tlv()
v3: split patches and rebase to staging tree
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  2 -
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 46 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  1 -
 4 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index ffe744e69482..cedecf2c693d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -386,8 +386,6 @@ mt7915_mac_init_band(struct mt7915_dev *dev, u8 band)
 	      FIELD_PREP(MT_MDP_RCFR1_RX_DROPPED_MCAST, MT_MDP_TO_HIF);
 	mt76_rmw(dev, MT_MDP_BNRCFR1(band), mask, set);
 
-	mt76_set(dev, MT_WF_RMAC_MIB_AIRTIME0(band), MT_WF_RMAC_MIB_RXTIME_EN);
-
 	mt76_rmw_field(dev, MT_DMA_DCR0(band), MT_DMA_DCR0_MAX_RX_LEN, 1536);
 	/* disable rx rate report by default due to hw issues */
 	mt76_clear(dev, MT_DMA_DCR0(band), MT_DMA_DCR0_RXD_G5_EN);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index d4c8759bedd8..8ba60b66e4a9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1534,6 +1534,7 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 			       mvif->cap.he_mu_ebfer ||
 			       mvif->cap.vht_mu_ebfer ||
 			       mvif->cap.vht_mu_ebfee;
+	muru->cfg.mimo_ul_en = true;
 
 	muru->ofdma_dl.punc_pream_rx =
 		HE_PHY(CAP1_PREAMBLE_PUNC_RX_MASK, elem->phy_cap_info[1]);
@@ -2921,6 +2922,47 @@ int mt7915_mcu_set_muru_ctrl(struct mt7915_dev *dev, u32 cmd, u32 val)
 				 sizeof(req), false);
 }
 
+static int
+mt7915_mcu_init_rx_airtime(struct mt7915_dev *dev)
+{
+#define RX_AIRTIME_FEATURE_CTRL		1
+#define RX_AIRTIME_BITWISE_CTRL		2
+#define RX_AIRTIME_CLEAR_EN	1
+	struct {
+		__le16 field;
+		__le16 sub_field;
+		__le32 set_status;
+		__le32 get_status;
+		u8 _rsv[12];
+
+		bool airtime_en;
+		bool mibtime_en;
+		bool earlyend_en;
+		u8 _rsv1[9];
+
+		bool airtime_clear;
+		bool mibtime_clear;
+		u8 _rsv2[98];
+	} __packed req = {
+		.field = cpu_to_le16(RX_AIRTIME_BITWISE_CTRL),
+		.sub_field = cpu_to_le16(RX_AIRTIME_CLEAR_EN),
+		.airtime_clear = true,
+	};
+	int ret;
+
+	ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(RX_AIRTIME_CTRL), &req,
+				sizeof(req), true);
+	if (ret)
+		return ret;
+
+	req.field = cpu_to_le16(RX_AIRTIME_FEATURE_CTRL);
+	req.sub_field = cpu_to_le16(RX_AIRTIME_CLEAR_EN);
+	req.airtime_en = true;
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(RX_AIRTIME_CTRL), &req,
+				 sizeof(req), true);
+}
+
 int mt7915_mcu_init(struct mt7915_dev *dev)
 {
 	static const struct mt76_mcu_ops mt7915_mcu_ops = {
@@ -2955,6 +2997,10 @@ int mt7915_mcu_init(struct mt7915_dev *dev)
 	if (ret)
 		return ret;
 
+	ret = mt7915_mcu_init_rx_airtime(dev);
+	if (ret)
+		return ret;
+
 	return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
 				 MCU_WA_PARAM_RED, 0, 0);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 4043cf547c9e..d66918d914da 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -271,6 +271,7 @@ enum {
 	MCU_EXT_CMD_MAC_INIT_CTRL = 0x46,
 	MCU_EXT_CMD_RX_HDR_TRANS = 0x47,
 	MCU_EXT_CMD_MUAR_UPDATE = 0x48,
+	MCU_EXT_CMD_RX_AIRTIME_CTRL = 0x4a,
 	MCU_EXT_CMD_SET_RX_PATH = 0x4e,
 	MCU_EXT_CMD_TX_POWER_FEATURE_CTRL = 0x58,
 	MCU_EXT_CMD_GET_MIB_INFO = 0x5a,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 6771870a867c..a2e98788f421 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -364,7 +364,6 @@
 
 #define MT_WF_RMAC_MIB_AIRTIME0(_band)	MT_WF_RMAC(_band, 0x0380)
 #define MT_WF_RMAC_MIB_RXTIME_CLR	BIT(31)
-#define MT_WF_RMAC_MIB_RXTIME_EN	BIT(30)
 
 /* WFDMA0 */
 #define MT_WFDMA0_BASE			0xd4000
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
