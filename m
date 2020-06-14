Return-Path: <SRS0=Y4ok=73=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BB8C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2020 18:24:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA969206D7
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2020 18:24:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iik67c6x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ipKJ8JKV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA969206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRFcOzNc/E2aR9HKNBFzid3TXIBireuh5z82CG5pjc0=; b=Iik67c6x9g41Ue
	WCXLOEi9K2conMDDo4KMEtQpnWcSag1hBq1sW+lXYlDI+8pSaTvteLPETW//uqqcZC6O7BLxbwSdj
	ce4/3HgwvnQQ80989oLs2A8x8SZocmqpPWsS2rn3uwvXynamsRjbDeQ3wyFvngqEPeGwnnwxAYo32
	Vmh4EefsK5m9KKrZh0cSFVGquKjFmrNLRCvtpEoiKRTMRDsu3F2s4Z2+4agwefsMcCL/VJeO5s6y9
	vtKsLu+nhpErArApoZNGHsWw0cqKpAbBO4PnA1ZHFj9xaz3bx40dLHbV4zpcpDhV0lF7IfnxpEBde
	86e5zMKrKOhS3YQ2Z8kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkXIR-0005Ni-DY; Sun, 14 Jun 2020 18:23:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkXIP-0005Ml-Cg
 for linux-mediatek@lists.infradead.org; Sun, 14 Jun 2020 18:23:54 +0000
X-UUID: 423fddd992364f8e9877a2e77cd438bd-20200614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6Iu78bEOZUuD+x8ntpu745/T1aWmMJUM0s0T5RAk/6Q=; 
 b=ipKJ8JKVHC9sbrSx8UUwM1DjzHdX/9qfUq8A6J9Ng12BQLLpNMgThctmmgnZ3MRQRQgS2qhqZOH/j1wXIYkaRB4ymAhkoW6V4j+Xu0PdwDwCjKDwUb1xRQ0CaT1SPXp171AD9CHmZYl2onIpI52/1OTc4/0M2hXaGcQ8HJQp7KI=;
X-UUID: 423fddd992364f8e9877a2e77cd438bd-20200614
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 743552410; Sun, 14 Jun 2020 10:23:32 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Jun 2020 11:23:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 02:23:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Jun 2020 02:23:37 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v3 4/4] mt76: mt7915: use ieee80211_tx_queue_params to avoid
 open coded
Date: Mon, 15 Jun 2020 02:23:36 +0800
Message-ID: <f781975807a95d6d823a165d8eef727fb38cf259.1592158312.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1592158312.git.ryder.lee@mediatek.com>
References: <cover.1592158312.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200614_112353_451382_7C3AA9F2 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is easy to add MU EDCA parameters in the future. This patch
also fixes a wrong cw_min assignment.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c   |  6 +-----
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c    | 14 +++++++-------
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h |  9 ++-------
 3 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index e09899748c9b..0c1217d3acd8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -355,11 +355,7 @@ mt7915_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif, u16 queue,
 
 	/* no need to update right away, we'll get BSS_CHANGED_QOS */
 	queue = mt7915_lmac_mapping(dev, queue);
-
-	mvif->wmm[queue].cw_min = params->cw_min;
-	mvif->wmm[queue].cw_max = params->cw_max;
-	mvif->wmm[queue].aifs = params->aifs;
-	mvif->wmm[queue].txop = params->txop;
+	mvif->queue_params[queue] = *params;
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index ca3e700425b6..fa9f32fa9f2e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2888,23 +2888,23 @@ int mt7915_mcu_set_tx(struct mt7915_dev *dev, struct ieee80211_vif *vif)
 	int ac;
 
 	for (ac = 0; ac < IEEE80211_NUM_ACS; ac++) {
+		struct ieee80211_tx_queue_params *q = &mvif->queue_params[ac];
 		struct edca *e = &req.edca[ac];
 
 		e->queue = ac + mvif->wmm_idx * MT7915_MAX_WMM_SETS;
-		e->aifs = mvif->wmm[ac].aifs;
-		e->txop = cpu_to_le16(mvif->wmm[ac].txop);
+		e->aifs = q->aifs;
+		e->txop = cpu_to_le16(q->txop);
 
-		if (mvif->wmm[ac].cw_min)
-			e->cw_min = fls(mvif->wmm[ac].cw_max);
+		if (q->cw_min)
+			e->cw_min = fls(q->cw_min);
 		else
 			e->cw_min = 5;
 
-		if (mvif->wmm[ac].cw_max)
-			e->cw_max = cpu_to_le16(fls(mvif->wmm[ac].cw_max));
+		if (q->cw_max)
+			e->cw_max = cpu_to_le16(fls(q->cw_max));
 		else
 			e->cw_max = cpu_to_le16(10);
 	}
-
 	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EDCA_UPDATE,
 				  &req, sizeof(req), true);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index b3b00d099236..4a063c1e5ea2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -99,15 +99,10 @@ struct mt7915_vif {
 	u8 band_idx;
 	u8 wmm_idx;
 
-	struct {
-		u16 cw_min;
-		u16 cw_max;
-		u16 txop;
-		u8 aifs;
-	} wmm[IEEE80211_NUM_ACS];
-
 	struct mt7915_sta sta;
 	struct mt7915_dev *dev;
+
+	struct ieee80211_tx_queue_params queue_params[IEEE80211_NUM_ACS];
 };
 
 struct mib_stats {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
