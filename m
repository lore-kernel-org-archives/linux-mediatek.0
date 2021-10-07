Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB6CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 18:57:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B59E610CC
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 18:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B59E610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E3LYcE6JnpYXe9d2k7XcPgPRL0m/CjfB3GT+bkqIjhI=; b=kBqWEj25HrwK95
	BpQ60i3xWa9ytsB9J197lyacWZvuDS3/8M4VLYmGPBGB1VwkSAiUxDENXFPgbzRwmbqOpa3RVAXza
	ijJf0i2G+6YCO9+ks4cfERrj4fxSBzp4VdemD8d9qOJU4z1jdEszYuiCOFQYW5XQd2hfBqyIxJduM
	7bFgE+N7dQN5F/v6yHIDIdl15GTRV+VMsNQKupc4ZRg7eHkaZy9p04UAkLC2D6u11XE7nA+n/UGgt
	ru/o+oQVkq9EKGxrJIPD6t7uYBbL46tTAPrpPBoNYOnvpCbhaef7My7EpQQJyOOaZZLUeTY4n8bNz
	B7+R/W9SxfefKiZbhHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYYaB-000XfB-OK; Thu, 07 Oct 2021 18:57:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYYa9-000Xek-1E
 for linux-mediatek@lists.infradead.org; Thu, 07 Oct 2021 18:57:30 +0000
X-UUID: d1d1ad3513d947f3bb4316773619a4bf-20211007
X-UUID: d1d1ad3513d947f3bb4316773619a4bf-20211007
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 199531770; Thu, 07 Oct 2021 11:57:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Oct 2021 11:57:18 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Oct 2021 02:57:12 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <shawnku@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mt76: mt7921: add MU EDCA cmd support
Date: Fri, 8 Oct 2021 02:57:11 +0800
Message-ID: <181a8f619a55c5a509c838d2ea5ec64641d4aa19.1633632336.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_115729_129109_E27C656A 
X-CRM114-Status: GOOD (  14.47  )
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

From: Sean Wang <sean.wang@mediatek.com>

Add MU EDCA MCU command support to update MU AC parameter record field
from the access point.

Co-developed-by: Eric-SY Chang <Eric-SY.Chang@mediatek.com>
Signed-off-by: Eric-SY Chang <Eric-SY.Chang@mediatek.com>
Tested-by: Eric-SY Chang <Eric-SY.Chang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 56 ++++++++++++++++++-
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index cb36dd39221c..0ce670d65673 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -563,6 +563,7 @@ enum {
 	MCU_CMD_SCHED_SCAN_ENABLE = MCU_CE_PREFIX | 0x61,
 	MCU_CMD_SCHED_SCAN_REQ = MCU_CE_PREFIX | 0x62,
 	MCU_CMD_GET_NIC_CAPAB = MCU_CE_PREFIX | 0x8a,
+	MCU_CMD_SET_MU_EDCA_PARMS = MCU_CE_PREFIX | 0xb0,
 	MCU_CMD_REG_WRITE = MCU_CE_PREFIX | 0xc0,
 	MCU_CMD_REG_READ = MCU_CE_PREFIX | MCU_QUERY_MASK | 0xc0,
 	MCU_CMD_CHIP_CONFIG = MCU_CE_PREFIX | 0xca,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 56fb7e54e283..53b2eaad2af7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -974,7 +974,31 @@ int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif)
 		.total = IEEE80211_NUM_ACS,
 	};
 	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
-	int ac;
+
+	struct mu_edca {
+		u8 cw_min;
+		u8 cw_max;
+		u8 aifsn;
+		u8 acm;
+		u8 timer;
+		u8 padding[3];
+	};
+	struct mt7921_mcu_mu_tx {
+		u8 ver;
+		u8 pad0;
+		u16 len;
+		u8 bss_idx;
+		u8 qos;
+		u8 wmm_idx;
+		u8 pad1;
+		struct mu_edca edca[IEEE80211_NUM_ACS];
+		u8 pad3[32];
+	} __packed req_mu = {
+		.bss_idx = mvif->mt76.idx,
+		.qos = vif->bss_conf.qos,
+		.wmm_idx = mvif->mt76.wmm_idx,
+	};
+	int ac, ret;
 
 	for (ac = 0; ac < IEEE80211_NUM_ACS; ac++) {
 		struct ieee80211_tx_queue_params *q = &mvif->queue_params[ac];
@@ -995,8 +1019,34 @@ int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif)
 		else
 			e->cw_max = cpu_to_le16(10);
 	}
-	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EDCA_UPDATE, &req,
-				 sizeof(req), true);
+
+	ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EDCA_UPDATE, &req,
+				sizeof(req), true);
+	if (ret)
+		return ret;
+
+	if (!vif->bss_conf.he_support)
+		return 0;
+
+	for (ac = 0; ac < IEEE80211_NUM_ACS; ac++) {
+		struct ieee80211_he_mu_edca_param_ac_rec *q;
+		struct mu_edca *e;
+		int to_aci[] = {1, 0, 2, 3};
+
+		if (!mvif->queue_params[ac].mu_edca)
+			break;
+
+		q = &mvif->queue_params[ac].mu_edca_param_rec;
+		e = &(req_mu.edca[to_aci[ac]]);
+
+		e->cw_min = q->ecw_min_max & 0xf;
+		e->cw_max = (q->ecw_min_max & 0xf0) >> 4;
+		e->aifsn = q->aifsn;
+		e->timer = q->mu_edca_timer;
+	}
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_CMD_SET_MU_EDCA_PARMS, &req_mu,
+				 sizeof(req_mu), false);
 }
 
 int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
