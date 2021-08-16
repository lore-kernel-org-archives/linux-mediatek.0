Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CAEC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 00:35:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 989C76138F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 00:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 989C76138F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IPQWUPr/HtTkRNvDLEjkkhFMwGx9iNdmChIg2DFiBIk=; b=2T55eYYkz770Dg
	gwONBrukQodBNuZFMHfEsbyqnH504kEA6xb17mz31CHIGedh8GMWCqfNukE6RS0rnu31yD900xCqL
	opHxuAgFjxAeCOsYV/yKOiZuK0utfnQGwLMkWv0Skn65mmCzKxa2n1NEfu6bUDih2Kv3DULv5RQHh
	rKEHQzlbxeQ+M2LWSnl/4Q5KoChjHvFbQQ4PTas1cYIprOWamutMDFGA+z5cPhj3baUnnxVIpi3a6
	t2xsYvcvBXov61M4U2lXDv+T+8fc/5Oj7xTELAKM75/o5WP+ZszzOvYYwOZ44t73xD61R2JX0FDkj
	4YJvb9QJ9D2fu4UyqDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFQao-00FtMj-7j; Mon, 16 Aug 2021 00:35:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFQad-00FtIF-Ch
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 00:35:01 +0000
X-UUID: de1f3498840f48509244eea881dbe653-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RwAPg+s4ELYW70GlmGQ6ZBZYzoPW5JcJ/YtIPh+jtDM=; 
 b=sAFnneyx+phY5HV0N7oroDHwSTP7s9CZ/d9PH+X2N8ernPjNx0xeSJcAl9QqwwNm98bVJfeBGnDpjudRF7u4N0CoOvYN/b+Rc+MeRVNLBFku09BbJN7YEE7S5kFnJpkpoRFScYzo/hXtlBvnhT/fpfRXhoMHdsUOzgeF4kGvB7E=;
X-UUID: de1f3498840f48509244eea881dbe653-20210815
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1765742626; Sun, 15 Aug 2021 17:34:51 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 17:34:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 08:34:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 Aug 2021 08:34:48 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 1/3] mt76: mt7915: update mac timing settings
Date: Mon, 16 Aug 2021 08:32:26 +0800
Message-ID: <3f393508b9ed8251f4e2408356110af092c8ad3e.1629073504.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_173456_903017_9F0599D3 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

1. EIFS has been divided into OFDM/CCK fields after 11ax generation.
2. For 5G/6G SIFS setting, hardware counts extra 6us for OFDM.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c  | 14 ++++++--------
 drivers/net/wireless/mediatek/mt76/mt7915/regs.h |  5 ++++-
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 0ed86cbf722b..1b8e37e265cb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1575,17 +1575,12 @@ void mt7915_mac_set_timing(struct mt7915_phy *phy)
 		  FIELD_PREP(MT_TIMEOUT_VAL_CCA, 48);
 	u32 ofdm = FIELD_PREP(MT_TIMEOUT_VAL_PLCP, 60) |
 		   FIELD_PREP(MT_TIMEOUT_VAL_CCA, 28);
-	int sifs, offset;
+	int offset;
 	bool is_5ghz = phy->mt76->chandef.chan->band == NL80211_BAND_5GHZ;
 
 	if (!test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
 		return;
 
-	if (is_5ghz)
-		sifs = 16;
-	else
-		sifs = 10;
-
 	if (ext_phy) {
 		coverage_class = max_t(s16, dev->phy.coverage_class,
 				       coverage_class);
@@ -1607,11 +1602,14 @@ void mt7915_mac_set_timing(struct mt7915_phy *phy)
 	mt76_wr(dev, MT_TMAC_CDTR(ext_phy), cck + reg_offset);
 	mt76_wr(dev, MT_TMAC_ODTR(ext_phy), ofdm + reg_offset);
 	mt76_wr(dev, MT_TMAC_ICR0(ext_phy),
-		FIELD_PREP(MT_IFS_EIFS, 360) |
+		FIELD_PREP(MT_IFS_EIFS_OFDM, is_5ghz ? 84 : 78) |
 		FIELD_PREP(MT_IFS_RIFS, 2) |
-		FIELD_PREP(MT_IFS_SIFS, sifs) |
+		FIELD_PREP(MT_IFS_SIFS, 10) |
 		FIELD_PREP(MT_IFS_SLOT, phy->slottime));
 
+	mt76_wr(dev, MT_TMAC_ICR1(ext_phy),
+		FIELD_PREP(MT_IFS_EIFS_CCK, 314));
+
 	if (phy->slottime < 20 || is_5ghz)
 		val = MT7915_CFEND_RATE_DEFAULT;
 	else
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index a213b5cb82f8..91c1fb56b0ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -72,11 +72,14 @@
 #define MT_TMAC_TRCR0_I2T_CHK		GENMASK(24, 16)
 
 #define MT_TMAC_ICR0(_band)		MT_WF_TMAC(_band, 0x0a4)
-#define MT_IFS_EIFS			GENMASK(8, 0)
+#define MT_IFS_EIFS_OFDM			GENMASK(8, 0)
 #define MT_IFS_RIFS			GENMASK(14, 10)
 #define MT_IFS_SIFS			GENMASK(22, 16)
 #define MT_IFS_SLOT			GENMASK(30, 24)
 
+#define MT_TMAC_ICR1(_band)		MT_WF_TMAC(_band, 0x0b4)
+#define MT_IFS_EIFS_CCK			GENMASK(8, 0)
+
 #define MT_TMAC_CTCR0(_band)			MT_WF_TMAC(_band, 0x0f4)
 #define MT_TMAC_CTCR0_INS_DDLMT_REFTIME		GENMASK(5, 0)
 #define MT_TMAC_CTCR0_INS_DDLMT_EN		BIT(17)
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
