Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9936DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 07:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dluw9mDxQR8m0YcEWpE/L69vU5uBggYri910T1do0pA=; b=gvC1FM8JGoczvN
	tTd2q4PvvZDyIWVOqpAsDt63vzEQM7/Lu9g/hjLaMLNPWSCgiX/fcuKpo/Z8hpjM5i2+I0S663doA
	0Hewe3fpI5YeEGt9pP91KtBcU/j8PKZYv9/R+t2TKmsPw2lGS6TLWwOeeSuDYcTOsJv2d8l8Sd1cJ
	SlV8zUxW96JNO3gI6SaJzT2HXF8Bf37OiogSckLBVcg9e6Q6CqPHaJ9xvz0QKSgKiCB/WBj/gIoV0
	KCzVnzLl7Sj3a3yPnsqVO/Q93n8ujnpyRTJZ02BbqH+R0ndC+IXIfs0ajTyGwjkwy8KK4NZDCko9A
	rSBDb7hzhD2f/DfLZmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh4Vc-007hP4-MU; Wed, 20 Apr 2022 07:12:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh4VY-007hNs-Ag
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 07:12:15 +0000
X-UUID: ffa4c9dc8f6140d8b82a207643262dbe-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b35e054a-37c3-447d-8b54-72ca2fb7480e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:a7857cef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ffa4c9dc8f6140d8b82a207643262dbe-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 499602047; Wed, 20 Apr 2022 00:12:07 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 00:11:49 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Apr 2022 15:11:47 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 20 Apr 2022 15:11:46 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, "lian .
 chen" <lian.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: disable RX_HDR_TRANS_SHORT
Date: Wed, 20 Apr 2022 15:11:44 +0800
Message-ID: <20220420071144.14573-1-bo.jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_001212_424120_C79C5867 
X-CRM114-Status: GOOD (  12.46  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

This patch disables RX_TRANS_SHORT to make MDP to do header translation
when payload less than 8 bytes, hence the (QoS) null data can be encapsulated
to 802.3 format. However, WDS requires (QoS) null data in 802.11 format
to created vlan AP interfaces.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: lian.chen <lian.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/agg-rx.c      | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c  | 4 ----
 drivers/net/wireless/mediatek/mt76/mt7915/regs.h | 3 +++
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
index 7262222..efd1a85 100644
--- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
+++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
@@ -167,6 +167,9 @@ void mt76_rx_aggr_reorder(struct sk_buff *skb, struct sk_buff_head *frames)
 		return;
 	}
 
+	if (!status->aggr)
+		return;
+
 	/* not part of a BA session */
 	ackp = status->qos_ctl & IEEE80211_QOS_CTL_ACK_POLICY_MASK;
 	if (ackp != IEEE80211_QOS_CTL_ACK_POLICY_BLOCKACK &&
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index facd604..12f8757 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -453,6 +453,9 @@ static void mt7915_mac_init(struct mt7915_dev *dev)
 
 	mt76_rmw_field(dev, MT_MDP_DCR1, MT_MDP_DCR1_MAX_RX_LEN, rx_len);
 
+	if (!is_mt7915(&dev->mt76))
+		mt76_clear(dev, MT_MDP_DCR2, MT_MDP_DCR2_RX_TRANS_SHORT);
+
 	/* enable hardware de-agg */
 	mt76_set(dev, MT_MDP_DCR0, MT_MDP_DCR0_DAMSDU_EN);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 5080280..bc2fb00 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -842,10 +842,6 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 	if (!status->wcid || !ieee80211_is_data_qos(fc))
 		return 0;
 
-	/* drop no data frame */
-	if (fc & cpu_to_le16(IEEE80211_STYPE_NULLFUNC))
-		return -EINVAL;
-
 	status->aggr = unicast &&
 		       !ieee80211_is_qos_nullfunc(fc);
 	status->qos_ctl = qos_ctl;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index e4dbf99..bb0dec8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -158,6 +158,9 @@ enum offs_rev {
 #define MT_MDP_DCR1			MT_MDP(0x004)
 #define MT_MDP_DCR1_MAX_RX_LEN		GENMASK(15, 3)
 
+#define MT_MDP_DCR2			MT_MDP(0x0e8)
+#define MT_MDP_DCR2_RX_TRANS_SHORT	BIT(2)
+
 #define MT_MDP_BNRCFR0(_band)		MT_MDP(__OFFS(MDP_BNRCFR0) + \
 					       ((_band) << 8))
 #define MT_MDP_RCFR0_MCU_RX_MGMT	GENMASK(5, 4)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
