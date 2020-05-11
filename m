Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9742FC54E8E
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69C8520708
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NbF05heE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dLE8vyDv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69C8520708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bu9iRGpmdIHEa1yliNOWer9erME68V1DIZkODw7LLNg=; b=NbF05heEYuJOX9
	3LiNypxlnGIUhQNGFRwMWZOPqb/XYWZz2fBzP31D0pnQzyUa7pDBPzddANIkKLG6kKC1J2mrzIguD
	JfR//e6sllt23IKdYVDVV+s4+M+RdN636ALbmsMsodtbNnj9i3KuiFdde8uRLoppUqPhKMFQCAFyd
	PMl8g7r0oxdOdKZT632CXvxHHjIur5BKAXxk0Ihq1SEDtP0dpOHA0at8Hpdrki1DJeHSAyaIJO4bo
	ghYavjhi8oMf5LuyWCdH92b7gCvN26mrcfG+IambiR/jPPSdSilhNpSlsKafo5KPOiDdSdb14kDwl
	mmhPtK0qCMBBXL4OZLDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYAxL-0004zG-9k; Mon, 11 May 2020 16:07:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYAxJ-0004we-5c
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 16:07:02 +0000
X-UUID: 8dde362b3ecd4ee291c2fdf868f873dd-20200511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Wq5vNatoLxOl6u7ea0lqUPIpt436Lkik0iyxAITq0lQ=; 
 b=dLE8vyDvcHmU/59gDORDAbVRxzDTLbBBFrKjbv/hJlO8GL772Dp6q0rJabbraGd7pUGK0HfT3mIFq98GDOozndlNn6OgvcjEBD2xnuAlbOukSdD7Gwi3BTlzZWGyZupvdrMGu7teIrsyLSSwW3sDkhYq2DrdhgYqKxkIDR76TmE=;
X-UUID: 8dde362b3ecd4ee291c2fdf868f873dd-20200511
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1586572754; Mon, 11 May 2020 08:06:23 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 09:06:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 May 2020 00:06:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 May 2020 00:06:41 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 6/7] mt76: mt7915: allocate proper size for tlv tags
Date: Tue, 12 May 2020 00:06:37 +0800
Message-ID: <2952abbe3b1f47fdf48de37b36af5aed34c03c05.1589212457.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1589212457.git.ryder.lee@mediatek.com>
References: <cover.1589212457.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AD9E4E709F0B02E3936059A6C03D0ADDD4AA97E3B1F282A1A87AB3FEC3CDAC802000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_090701_218250_DE980365 
X-CRM114-Status: UNSURE (   8.22  )
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

Allocating proper memory size according to tlv usage.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 14 +++++++-------
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h | 12 ++++++++++--
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 52e349b17246..f00ad2b66761 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -997,7 +997,7 @@ int mt7915_mcu_add_bss_info(struct mt7915_phy *phy,
 	struct sk_buff *skb;
 
 	skb = mt7915_mcu_alloc_sta_req(phy->dev, mvif, NULL,
-				       MT7915_STA_UPDATE_MAX_SIZE);
+				       MT7915_BSS_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
@@ -1092,10 +1092,10 @@ int mt7915_mcu_add_key(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 {
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
 	struct sk_buff *skb;
+	int len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_sec);
 	int ret;
 
-	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta,
-				       MT7915_STA_UPDATE_MAX_SIZE);
+	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
@@ -2056,9 +2056,9 @@ int mt7915_mcu_add_rate_ctrl(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 	struct sk_buff *skb;
+	int len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_ra);
 
-	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta,
-				       MT7915_STA_UPDATE_MAX_SIZE);
+	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
@@ -2129,9 +2129,9 @@ int mt7915_mcu_set_fixed_rate(struct mt7915_dev *dev,
 	struct sta_rec_ra_fixed *ra;
 	struct sk_buff *skb;
 	struct tlv *tlv;
+	int len = sizeof(struct sta_req_hdr) + sizeof(*ra);
 
-	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta,
-				       MT7915_STA_UPDATE_MAX_SIZE);
+	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index cdeba5a0ef34..34ace6e672d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -951,13 +951,21 @@ enum {
 					 sizeof(struct sta_rec_vht) +	\
 					 sizeof(struct tlv) +		\
 					 sizeof(struct sta_rec_muru) +	\
-					 sizeof(struct sta_rec_sec) +	\
-					 sizeof(struct sta_rec_ra) +	\
 					 MT7915_WTBL_UPDATE_MAX_SIZE)
 
 #define MT7915_WTBL_UPDATE_BA_SIZE	(sizeof(struct wtbl_req_hdr) +	\
 					 sizeof(struct wtbl_ba))
 
+#define MT7915_BSS_UPDATE_MAX_SIZE	(sizeof(struct sta_req_hdr) +	\
+					 sizeof(struct bss_info_omac) +	\
+					 sizeof(struct bss_info_basic) +\
+					 sizeof(struct bss_info_rf_ch) +\
+					 sizeof(struct bss_info_ra) +	\
+					 sizeof(struct bss_info_he) +	\
+					 sizeof(struct bss_info_bmc_rate) +\
+					 sizeof(struct bss_info_ext_bss) +\
+					 sizeof(struct bss_info_sync_mode))
+
 #define MT7915_BEACON_UPDATE_SIZE	(sizeof(struct sta_req_hdr) +	\
 					 sizeof(struct bss_info_bcn_csa) + \
 					 sizeof(struct bss_info_bcn_bcc) + \
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
