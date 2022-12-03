Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B799C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Dec 2022 08:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G7PaMZS6/hyIDt9quG3UjPne+lkluujZYa1twV0Y0Dg=; b=VFKFrSe98cyWg8D/zN9KuTODaw
	xBVAwNmQE3jRemYfo71htutLEzmHwaWtEy0ALCs7E98hCXmUjxVIOzTmRsrFq3JUtYYPg2FZMVSkH
	4F9TPJjF3QKETpKqci1OQ64kBgp9VIVT0/NHueamWpfeJZ4o4TQV5fX5ct/6KhAnkayXbk9ua19Fx
	m8dPqu0Y9rFtW52guhoKtwZhtaweFKsvxUoRWu4E4OlrZkG6qwl20MP/0n1zHeZzy+W5W2CLAOflX
	wISXkzI59btzs/eKkDgZCYtBEUaLDqvAWYjb3fdLtPoyTQulnz1FAMbfTsnNr4PltG8CzL+Qj/fLi
	SBQXj4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1NZJ-002pFW-0T; Sat, 03 Dec 2022 08:08:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1NZG-002pFB-E9
	for linux-mediatek@lists.infradead.org; Sat, 03 Dec 2022 08:08:16 +0000
X-UUID: c3ef8ab80255421d986b5ae7ceabf77f-20221203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=G7PaMZS6/hyIDt9quG3UjPne+lkluujZYa1twV0Y0Dg=;
	b=Qks8/xxEbvJhIVi8jsnTiO69tob6igurHc5hX31nJymR5hcrd0Ho289NZX/nf+R1gzZ+DtLTTLB76XSbWgbl8z9HlJTuOgxLKE8UhttKVLETo8WxkgRYD0Tb7E0lUCuOE1BAdfZCXlRuxWTZJfzK/3Lc/diAg0IIlewy6qYAgss=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:5a19ebfa-56a7-4c95-adfd-9b198fc9ab72,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:70f9706c-41fe-47b6-8eb4-ec192dedaf7d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c3ef8ab80255421d986b5ae7ceabf77f-20221203
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1209277281; Sat, 03 Dec 2022 01:07:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 3 Dec 2022 15:37:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 3 Dec 2022 15:37:56 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: split mcu chan_mib array up
Date: Sat, 3 Dec 2022 15:37:54 +0800
Message-ID: <51130dcbc200962672540cb726dd9841c5ad7fe9.1670049959.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_000814_684795_69735E39 
X-CRM114-Status: GOOD (  12.85  )
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

The current flow confuses coverity check that leads to false reporting,
so split the offs[] into two pieces according to chipset revision to
silence coverity tool.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 50 ++++++++++---------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index b2652de082ba..ca315af3905b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2974,38 +2974,42 @@ int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy)
 
 int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch)
 {
-	/* strict order */
-	static const u32 offs[] = {
-		MIB_NON_WIFI_TIME,
-		MIB_TX_TIME,
-		MIB_RX_TIME,
-		MIB_OBSS_AIRTIME,
-		MIB_TXOP_INIT_COUNT,
-		/* v2 */
-		MIB_NON_WIFI_TIME_V2,
-		MIB_TX_TIME_V2,
-		MIB_RX_TIME_V2,
-		MIB_OBSS_AIRTIME_V2
-	};
 	struct mt76_channel_state *state = phy->mt76->chan_state;
 	struct mt76_channel_state *state_ts = &phy->state_ts;
 	struct mt7915_dev *dev = phy->dev;
 	struct mt7915_mcu_mib *res, req[5];
 	struct sk_buff *skb;
-	int i, ret, start = 0, ofs = 20;
+	static const u32 *offs;
+	int i, ret, len, offs_cc;
 	u64 cc_tx;
 
-	if (!is_mt7915(&dev->mt76)) {
-		start = 5;
-		ofs = 0;
+	/* strict order */
+	if (is_mt7915(&dev->mt76)) {
+		static const u32 chip_offs[] = {
+			MIB_NON_WIFI_TIME,
+			MIB_TX_TIME,
+			MIB_RX_TIME,
+			MIB_OBSS_AIRTIME,
+			MIB_TXOP_INIT_COUNT,
+		};
+		len = ARRAY_SIZE(chip_offs);
+		offs = chip_offs;
+		offs_cc = 20;
+	} else {
+		static const u32 chip_offs[] = {
+			MIB_NON_WIFI_TIME_V2,
+			MIB_TX_TIME_V2,
+			MIB_RX_TIME_V2,
+			MIB_OBSS_AIRTIME_V2
+		};
+		len = ARRAY_SIZE(chip_offs);
+		offs = chip_offs;
+		offs_cc = 0;
 	}
 
-	for (i = 0; i < 5; i++) {
+	for (i = 0; i < len; i++) {
 		req[i].band = cpu_to_le32(phy->mt76->band_idx);
-		req[i].offs = cpu_to_le32(offs[i + start]);
-
-		if (!is_mt7915(&dev->mt76) && i == 3)
-			break;
+		req[i].offs = cpu_to_le32(offs[i]);
 	}
 
 	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_CMD(GET_MIB_INFO),
@@ -3013,7 +3017,7 @@ int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch)
 	if (ret)
 		return ret;
 
-	res = (struct mt7915_mcu_mib *)(skb->data + ofs);
+	res = (struct mt7915_mcu_mib *)(skb->data + offs_cc);
 
 #define __res_u64(s) le64_to_cpu(res[s].data)
 	/* subtract Tx backoff time from Tx duration */
-- 
2.18.0


