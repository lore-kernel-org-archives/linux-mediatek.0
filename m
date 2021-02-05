Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63E8C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 05:13:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC2C64FA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 05:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DC2C64FA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QqkWlnfBybHMzX9Mwr4Pk0PtdoU/qN08nsy/0pXBVVA=; b=gjwJg/Iyz1N04YUCEqF0YqzSOt
	p7N7EjBkFy7XMYoKSMLyZmLGcVStkj5QCBmNpAODBmqpVLkQbTCr8kvhLY8L4RwZhqtJcrbqz8OvJ
	19y+AqP8mN3hf4cOApN+vxtNiQc4RM+FIoJEq00jWiYw2oxvXkszSK9DIqcrjjVsWiEyK1SJOkVln
	Wavk5uCYzOaiLmFpy4VGAKnKZdPbgy/KXfk8pMTMXg0E23axm6iiguJfhxBLE6Aj7wUCU5HQQAG7u
	+b+W0DFpLtJTm9TQHUQw91xH+Xqb95MXwFbEZfWkzp+gMw4/V54zD0+gzRQR3NacN3ADWs3Zum4yX
	32pNneew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7tQm-0000pC-BY; Fri, 05 Feb 2021 05:13:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7tQj-0000o3-8B
 for linux-mediatek@lists.infradead.org; Fri, 05 Feb 2021 05:13:19 +0000
X-UUID: 61fc1f0a331e42f198f843c20a1996c7-20210204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=U6TZaMKUYn4btD0KiC7vMAQoLkW3OCR7TRQQiUqTZ2Q=; 
 b=mDQ338WnMr7su8mEhIJmBSRa3v1sh95k1GuFaq+6yY+ZyUq0KYNdQgoChrXjN3Bz8UOZ/I2nZcmJw8euoO679Ej76yuPnE3o7KLpXXvdzxFolV1dMfEsDbS1LpyQ+l7d/r0uf8GWrWl8Opx5NcTbkiY9Ee98sjxjv/lLo2Nz+kk=;
X-UUID: 61fc1f0a331e42f198f843c20a1996c7-20210204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 403322271; Thu, 04 Feb 2021 21:13:08 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Feb 2021 21:13:07 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Feb 2021 13:13:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 5 Feb 2021 13:13:02 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: always use WTBL_MAX_SIZE for tlv allocation
Date: Fri, 5 Feb 2021 13:13:01 +0800
Message-ID: <83ac342b16fbe9a97c91fffa00e5b04644daae9f.1612501861.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6E98898A79103BD3DCE0A041DCCD3BA9A652525557F73286FCC57A4D724CF8C12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_001318_010532_24C51327 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Simplify WTBL defines.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   | 24 -------------------
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  2 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  3 ---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  3 ---
 5 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 3874f45da9eb..411ebb56baef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -362,30 +362,6 @@ enum {
 	BSS_INFO_MAX_NUM
 };
 
-#define MT7615_WTBL_UPDATE_MAX_SIZE	(sizeof(struct wtbl_req_hdr) +	\
-					 sizeof(struct wtbl_generic) +	\
-					 sizeof(struct wtbl_rx) +	\
-					 sizeof(struct wtbl_ht) +	\
-					 sizeof(struct wtbl_vht) +	\
-					 sizeof(struct wtbl_tx_ps) +	\
-					 sizeof(struct wtbl_hdr_trans) +\
-					 sizeof(struct wtbl_ba) +	\
-					 sizeof(struct wtbl_bf) +	\
-					 sizeof(struct wtbl_smps) +	\
-					 sizeof(struct wtbl_pn) +	\
-					 sizeof(struct wtbl_spe))
-
-#define MT7615_STA_UPDATE_MAX_SIZE	(sizeof(struct sta_req_hdr) +	\
-					 sizeof(struct sta_rec_basic) +	\
-					 sizeof(struct sta_rec_ht) +	\
-					 sizeof(struct sta_rec_vht) +	\
-					 sizeof(struct sta_rec_uapsd) + \
-					 sizeof(struct tlv) +	\
-					 MT7615_WTBL_UPDATE_MAX_SIZE)
-
-#define MT7615_WTBL_UPDATE_BA_SIZE	(sizeof(struct wtbl_req_hdr) +	\
-					 sizeof(struct wtbl_ba))
-
 enum {
 	CH_SWITCH_NORMAL = 0,
 	CH_SWITCH_SCAN = 3,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 6cbccfb05f8b..e6ad6cbeb803 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -287,7 +287,7 @@ mt76_connac_mcu_alloc_wtbl_req(struct mt76_dev *dev, struct mt76_wcid *wcid,
 				     &hdr.wlan_idx_hi);
 	if (!nskb) {
 		nskb = mt76_mcu_msg_alloc(dev, NULL,
-					  MT76_CONNAC_WTBL_UPDATE_BA_SIZE);
+					  MT76_CONNAC_WTBL_UPDATE_MAX_SIZE);
 		if (!nskb)
 			return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index c1e1df5f7cd7..9c26b90655a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -304,9 +304,6 @@ struct wtbl_raw {
 					 sizeof(struct tlv) +		\
 					 MT76_CONNAC_WTBL_UPDATE_MAX_SIZE)
 
-#define MT76_CONNAC_WTBL_UPDATE_BA_SIZE	(sizeof(struct wtbl_req_hdr) +	\
-					 sizeof(struct wtbl_ba))
-
 enum {
 	STA_REC_BASIC,
 	STA_REC_RA,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 0296f2aa7997..e0aff0ea2f75 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -592,7 +592,7 @@ mt7915_mcu_alloc_wtbl_req(struct mt7915_dev *dev, struct mt7915_sta *msta,
 
 	if (!nskb) {
 		nskb = mt76_mcu_msg_alloc(&dev->mt76, NULL,
-					  MT7915_WTBL_UPDATE_BA_SIZE);
+					  MT7915_WTBL_UPDATE_MAX_SIZE);
 		if (!nskb)
 			return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 2d584142c27b..2a2f7bf2c94b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -1080,9 +1080,6 @@ enum {
 					 sizeof(struct tlv) +		\
 					 MT7915_WTBL_UPDATE_MAX_SIZE)
 
-#define MT7915_WTBL_UPDATE_BA_SIZE	(sizeof(struct wtbl_req_hdr) +	\
-					 sizeof(struct wtbl_ba))
-
 #define MT7915_BSS_UPDATE_MAX_SIZE	(sizeof(struct sta_req_hdr) +	\
 					 sizeof(struct bss_info_omac) +	\
 					 sizeof(struct bss_info_basic) +\
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
