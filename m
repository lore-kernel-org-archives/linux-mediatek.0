Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD20C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kxl2CSZJNW//r/LeGu0KYhv4Cd/dvVWan7ft3I7dApc=; b=Zl9uZ0TBBtbtfZ
	PcL7P5W0ckf/87ztm7YJ9yFcaxwGytrOA9kGkylQ4ri/iv6irJHsMr77LPosxrdWCBIrnNH7knA4X
	l1U+moB9IJcU1cN4NmTVC1oWUmf8gCcHC25ooyuotL57k1XxX/KtesIJSfkUc4rxCVpnL2WwTWdTH
	azQG+vpsLkeqZ77UJXdzo8hro2dGYs6K1ETa4krVn6mKnReH0tTNoktIDrwweg2DeswSj11Wy3/+H
	lGv7Q+pYa9h/vodH/gAS/bgHWOGSCV+qRvDINtsEFJK+kshKOVUvzgUKV+K6DPnD5uYmYQv+JT282
	S55GMfplNuvX5/+kls5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmVba-00EKwg-C6; Thu, 05 May 2022 07:08:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmVbX-00EKvD-3o
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 07:08:52 +0000
X-UUID: a3445dbc56094f91b08feae52338ecb9-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:d02d5e4c-5cb4-4083-a906-7ad7b4bac5ea, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:d059a6b2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a3445dbc56094f91b08feae52338ecb9-20220505
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2051692292; Thu, 05 May 2022 00:08:44 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 00:08:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 15:08:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 5 May 2022 15:08:41 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 2/3] mt76: mt7915: introduce mt7915_mac_severe_check()
Date: Thu, 5 May 2022 15:08:35 +0800
Message-ID: <84227dadf436ac1bef9cdfe5edff1f251ef4647e.1651722608.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <40f31a4550ff357468798a5950a62ceec396cbeb.1651722608.git.ryder.lee@mediatek.com>
References: <40f31a4550ff357468798a5950a62ceec396cbeb.1651722608.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_000851_194948_E4A40EF2 
X-CRM114-Status: GOOD (  10.78  )
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

In rare cases, TRB pointers might be out of sync leads to RMAC stopping
Rx that requires minimal recovery, so add this helper to periodically
check TRB status.

Tested-by: Chad Monroe <chad.monroe@smartrg.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 27 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 ++
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  8 ++++++
 3 files changed, 37 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 803e5e05a40a..de317e871577 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -2307,6 +2307,32 @@ void mt7915_mac_update_stats(struct mt7915_phy *phy)
 	}
 }
 
+static void mt7915_mac_severe_check(struct mt7915_phy *phy)
+{
+	struct mt7915_dev *dev = phy->dev;
+	bool ext_phy = phy != &dev->phy;
+	u32 trb;
+
+	if (!phy->omac_mask)
+		return;
+
+	/* In rare cases, TRB pointers might be out of sync leads to RMAC
+	 * stopping Rx, so check status periodically to see if TRB hardware
+	 * requires minimal recovery.
+	 */
+	trb = mt76_rr(dev, MT_TRB_RXPSR0(phy->band_idx));
+
+	if ((FIELD_GET(MT_TRB_RXPSR0_RX_RMAC_PTR, trb) !=
+	     FIELD_GET(MT_TRB_RXPSR0_RX_WTBL_PTR, trb)) &&
+	    (FIELD_GET(MT_TRB_RXPSR0_RX_RMAC_PTR, phy->trb_ts) !=
+	     FIELD_GET(MT_TRB_RXPSR0_RX_WTBL_PTR, phy->trb_ts)) &&
+	    trb == phy->trb_ts)
+		mt7915_mcu_set_ser(dev, SER_RECOVER, SER_SET_RECOVER_L3_RX_ABORT,
+				   ext_phy);
+
+	phy->trb_ts = trb;
+}
+
 void mt7915_mac_sta_rc_work(struct work_struct *work)
 {
 	struct mt7915_dev *dev = container_of(work, struct mt7915_dev, rc_work);
@@ -2359,6 +2385,7 @@ void mt7915_mac_work(struct work_struct *work)
 		mphy->mac_work_count = 0;
 
 		mt7915_mac_update_stats(phy);
+		mt7915_mac_severe_check(phy);
 	}
 
 	mutex_unlock(&mphy->dev->mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 419ff08176b4..42e195dded01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -247,6 +247,8 @@ struct mt7915_phy {
 
 	u8 rdd_state;
 
+	u32 trb_ts;
+
 	u32 rx_ampdu_ts;
 	u32 ampdu_ref;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 1a7f95223be1..7415118f6399 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -173,6 +173,14 @@ enum offs_rev {
 #define MT_MDP_TO_HIF			0
 #define MT_MDP_TO_WM			1
 
+/* TRB: band 0(0x820e1000), band 1(0x820f1000) */
+#define MT_WF_TRB_BASE(_band)		((_band) ? 0x820f1000 : 0x820e1000)
+#define MT_WF_TRB(_band, ofs)		(MT_WF_TRB_BASE(_band) + (ofs))
+
+#define MT_TRB_RXPSR0(_band)		MT_WF_TRB(_band, 0x03c)
+#define MT_TRB_RXPSR0_RX_WTBL_PTR	GENMASK(25, 16)
+#define MT_TRB_RXPSR0_RX_RMAC_PTR	GENMASK(9, 0)
+
 /* TMAC: band 0(0x820e4000), band 1(0x820f4000) */
 #define MT_WF_TMAC_BASE(_band)		((_band) ? 0x820f4000 : 0x820e4000)
 #define MT_WF_TMAC(_band, ofs)		(MT_WF_TMAC_BASE(_band) + (ofs))
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
