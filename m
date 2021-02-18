Return-Path: <SRS0=w+BI=HU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1293C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1123864E45
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1123864E45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8/+/h7fHwbbaCNyBy0BdY42ERvY1zcmMd2GUJdIajDE=; b=0ErXKeUMb0imXM8u6Oqz0cTfWY
	XisTJEQnYqNvrx/Dqq9Kj6DdDrJtYoLHUGbYXArOL3+EktgdaUV49FD2wE4AA3az7fV63kXwzqyVS
	tXZBNYZlPIlxaUHy3Bbh0IoKpw00nh0pZ2tNPft5oaiGwM4GtVZKx0zrwzd89PS+czhcujVioT+6/
	Vt+0qVvTv0VHY0MtcxOo0mjCkEukgaNxFL0fzy22vv7f2lFThVKw0tL75uYZT4ZJysW2OzVHXCWpo
	3hE3OyCqiSDBrnhAXkLZ1cV2pkyoDw4CbTf5f3CnDCXxGUAbDIQCL9c/1oX+FFaGIhV1xDpgxS/Pg
	dR27lZig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCYGe-0004ci-I2; Thu, 18 Feb 2021 01:38:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCYGB-0004Ot-EQ
 for linux-mediatek@lists.infradead.org; Thu, 18 Feb 2021 01:37:41 +0000
X-UUID: 21cc53374fb64571bf1295368621270f-20210217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=KDn259VOE2LEFNsTRaXY5b/trdHosSOo/yKB6qKBdkw=; 
 b=DXNNK8VxWpZcBB9SpuB3DwtU88ITcBMCaNL4gbmXitkutcDXO2OSb4fkdzWTIn/XlP1eJ4vbew87jrZsxPLjkhNtAnc+sMOfQZFaqny0G/PtE1mCOiVfYXvm3lJGt2Xv0Kw3fX0Nn2zBtbKcKyE4U2UlsIVnQd2wDtFM2sGuAtE=;
X-UUID: 21cc53374fb64571bf1295368621270f-20210217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1988645996; Wed, 17 Feb 2021 17:37:35 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Feb 2021 17:34:45 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Feb 2021 09:34:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 18 Feb 2021 09:34:42 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/3] mt76: mt7615: enable hw rx-amsdu de-aggregation
Date: Thu, 18 Feb 2021 09:34:38 +0800
Message-ID: <b7883f5ee09d13f7cbdf5ab1d5fef61ebc79dcc4.1613603857.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8C5240DE6316DEE306FD2BCACADC91B690D6D2DEDA363B2D5279E379E4E592D02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_203739_695310_9C63AA92 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable hw rx-amsdu de-aggregation support.
This is a preliminary patch to enable rx checksum offload.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c |  3 +--
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c  | 15 ++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7615/mac.h  |  3 +++
 drivers/net/wireless/mediatek/mt76/mt7615/regs.h |  1 +
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 571390fa4de7..a97cc723094c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -116,10 +116,9 @@ mt7615_mac_init(struct mt7615_dev *dev)
 	mt76_set(dev, MT_WF_RMAC_MIB_TIME0, MT_WF_RMAC_MIB_RXTIME_EN);
 	mt76_set(dev, MT_WF_RMAC_MIB_AIRTIME0, MT_WF_RMAC_MIB_RXTIME_EN);
 
-	/* disable hdr translation and hw AMSDU */
 	mt76_wr(dev, MT_DMA_DCR0,
 		FIELD_PREP(MT_DMA_DCR0_MAX_RX_LEN, 3072) |
-		MT_DMA_DCR0_RX_VEC_DROP);
+		MT_DMA_DCR0_RX_VEC_DROP | MT_DMA_DCR0_DAMSDU_EN);
 	/* disable TDLS filtering */
 	mt76_clear(dev, MT_WF_PFCR, MT_WF_PFCR_TDLS_EN);
 	mt76_set(dev, MT_WF_MIB_SCR0, MT_MIB_SCR0_AGG_CNT_RANGE_EN);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 9bae2f66e1ce..928edd158f64 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -238,7 +238,7 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	bool unicast, remove_pad, insert_ccmp_hdr = false;
 	int phy_idx;
 	int i, idx;
-	u8 chfreq;
+	u8 chfreq, amsdu_info;
 
 	memset(status, 0, sizeof(*status));
 
@@ -254,6 +254,9 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	else
 		phy_idx = -1;
 
+	if (rxd2 & MT_RXD2_NORMAL_AMSDU_ERR)
+		return -EINVAL;
+
 	unicast = (rxd1 & MT_RXD1_NORMAL_ADDR_TYPE) == MT_RXD1_NORMAL_U2M;
 	idx = FIELD_GET(MT_RXD2_NORMAL_WLAN_IDX, rxd2);
 	status->wcid = mt7615_rx_get_wcid(dev, idx, unicast);
@@ -446,6 +449,16 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 
 	skb_pull(skb, (u8 *)rxd - skb->data + 2 * remove_pad);
 
+	amsdu_info = FIELD_GET(MT_RXD1_NORMAL_PAYLOAD_FORMAT, rxd1);
+	status->amsdu = !!amsdu_info;
+	if (status->amsdu) {
+		status->first_amsdu = amsdu_info == MT_RXD1_FIRST_AMSDU_FRAME;
+		status->last_amsdu = amsdu_info == MT_RXD1_LAST_AMSDU_FRAME;
+		memmove(skb->data + 2, skb->data,
+			ieee80211_get_hdrlen_from_skb(skb));
+		skb_pull(skb, 2);
+	}
+
 	if (insert_ccmp_hdr) {
 		u8 key_id = FIELD_GET(MT_RXD1_NORMAL_KEY_ID, rxd1);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
index 169f4e17b5b4..ed009d085a53 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
@@ -33,6 +33,9 @@ enum rx_pkt_type {
 
 #define MT_RXD1_NORMAL_BSSID		GENMASK(31, 26)
 #define MT_RXD1_NORMAL_PAYLOAD_FORMAT	GENMASK(25, 24)
+#define MT_RXD1_FIRST_AMSDU_FRAME	GENMASK(1, 0)
+#define MT_RXD1_MID_AMSDU_FRAME		BIT(1)
+#define MT_RXD1_LAST_AMSDU_FRAME	BIT(0)
 #define MT_RXD1_NORMAL_HDR_TRANS	BIT(23)
 #define MT_RXD1_NORMAL_HDR_OFFSET	BIT(22)
 #define MT_RXD1_NORMAL_MAC_HDR_LEN	GENMASK(21, 16)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index 6e5db015b32c..4ebffe52cb8e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -368,6 +368,7 @@ enum mt7615_reg_base {
 
 #define MT_DMA_DCR0			MT_WF_DMA(0x000)
 #define MT_DMA_DCR0_MAX_RX_LEN		GENMASK(15, 2)
+#define MT_DMA_DCR0_DAMSDU_EN		BIT(16)
 #define MT_DMA_DCR0_RX_VEC_DROP		BIT(17)
 
 #define MT_DMA_RCFR0(_band)		MT_WF_DMA(0x070 + (_band) * 0x40)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
