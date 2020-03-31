Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB688C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 06:57:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DF7C20748
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 06:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RWlqSGUP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="e0pjuefH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DF7C20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=if+Mux1IZiSIW5m8eWgSedFKtEPUhwomi581tXYpPX8=; b=RWlqSGUPfSkd8Y
	eU5w9MAcnOsYEbMJt6+1aHbo1HvReC7E4qhM+YVdSHSqxheZ3fTWpUBCp9/SuXubJ6auUQxGMFkYg
	Vrwm+45Oxzu2gHfZQUdM+ExE6fGUaFLERg4R5YeSV4AWIZKnj37uIG2wJ1LeAKOB0N2IW/GSabifM
	r6rpt2DQ+UA6Nc+TGHFUX9KHTFQuQRavulXFN9jhDVewTTWSeyWWSe4SMTTNntSQVnNHamlBss23Q
	e0a9ZoDoTDmLiL7XFwOrQimqp1eG7dao/HU4R+hpCg0m7ZC+kJS/dJ6TTCyRaue6maezB8W9QGYEr
	iKqWxTkhI9ZL/v7b5PEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJAq2-00022g-FP; Tue, 31 Mar 2020 06:57:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJApy-000214-4f
 for linux-mediatek@lists.infradead.org; Tue, 31 Mar 2020 06:57:27 +0000
X-UUID: e549a97610db40f9bdc784f286116b83-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=X0OcyMvL4lbrg36Mk7oc4dDFTS47i4dhzRfE8BnWJPY=; 
 b=e0pjuefH4LBBOaf69KOvQC2jlL8ddbwbVAK2zY/rPkbPiDIwlTPLitU5ep5SyFascGU8WVl8BHFaj6JSUOs33kKirsnk2N5EArdjBURte9Xama95FVC90tn11lY4VB/6CaGxnMNgGntVqTnw5xgMQPoO/+LOunrgdyaUdHOr/5A=;
X-UUID: e549a97610db40f9bdc784f286116b83-20200330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 632516069; Mon, 30 Mar 2020 22:57:07 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 23:51:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Mar 2020 14:51:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 31 Mar 2020 14:51:38 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/4] mt76: mt7615: enable aggr_stats for both phy
Date: Tue, 31 Mar 2020 14:51:36 +0800
Message-ID: <5f658e6a42f653299db86244942618730ffb9926.1585636614.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1fc90ec2a64d062ac7264aaa3dd158f2282ad7b8.1585636614.git.ryder.lee@mediatek.com>
References: <1fc90ec2a64d062ac7264aaa3dd158f2282ad7b8.1585636614.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 07D14E5CF4D800D171A703094CC85C8C5D681E1C11756252B4BC06F32B9DEBC62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_235726_194234_5B2CA1A1 
X-CRM114-Status: UNSURE (   9.45  )
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

Use bottom half of aggr_stats for second phy.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7615/debugfs.c   |  4 +++-
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 21 ++++++++++---------
 .../net/wireless/mediatek/mt76/mt7615/regs.h  |  3 ++-
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index 9fd40d723201..980e7e3cf37e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -145,8 +145,10 @@ mt7615_ampdu_stat_read_phy(struct mt7615_phy *phy,
 		seq_printf(file, "%3d -%3d | ",
 			   bound[i], bound[i + 1]);
 	seq_puts(file, "\nCount:  ");
+
+	range = ext_phy ? ARRAY_SIZE(dev->mt76.aggr_stats) / 2 : 0;
 	for (i = 0; i < ARRAY_SIZE(bound); i++)
-		seq_printf(file, "%8d | ", dev->mt76.aggr_stats[i]);
+		seq_printf(file, "%8d | ", dev->mt76.aggr_stats[i + range]);
 	seq_puts(file, "\n");
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index a27a6d164009..8572973cc4c8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -82,8 +82,10 @@ void mt7615_mac_reset_counters(struct mt7615_dev *dev)
 {
 	int i;
 
-	for (i = 0; i < 4; i++)
-		mt76_rr(dev, MT_TX_AGG_CNT(i));
+	for (i = 0; i < 4; i++) {
+		mt76_rr(dev, MT_TX_AGG_CNT(0, i));
+		mt76_rr(dev, MT_TX_AGG_CNT(1, i));
+	}
 
 	memset(dev->mt76.aggr_stats, 0, sizeof(dev->mt76.aggr_stats));
 	dev->mt76.phy.survey_time = ktime_get_boottime();
@@ -1751,13 +1753,14 @@ mt7615_mac_update_mib_stats(struct mt7615_phy *phy)
 	struct mt7615_dev *dev = phy->dev;
 	struct mib_stats *mib = &phy->mib;
 	bool ext_phy = phy != &dev->phy;
-	int i;
+	int i, aggr;
 
 	memset(mib, 0, sizeof(*mib));
 
 	mib->fcs_err_cnt = mt76_get_field(dev, MT_MIB_SDR3(ext_phy),
 					  MT_MIB_SDR3_FCS_ERR_MASK);
 
+	aggr = ext_phy ? ARRAY_SIZE(dev->mt76.aggr_stats) / 2 : 0;
 	for (i = 0; i < 4; i++) {
 		u32 data, val, val2;
 
@@ -1772,6 +1775,11 @@ mt7615_mac_update_mib_stats(struct mt7615_phy *phy)
 			mib->rts_cnt = FIELD_GET(MT_MIB_RTS_COUNT_MASK, val2);
 			mib->rts_retries_cnt = data;
 		}
+
+		val = mt76_rr(dev, MT_TX_AGG_CNT(ext_phy, i));
+
+		dev->mt76.aggr_stats[aggr++] += val & 0xffff;
+		dev->mt76.aggr_stats[aggr++] += val >> 16;
 	}
 }
 
@@ -1779,7 +1787,6 @@ void mt7615_mac_work(struct work_struct *work)
 {
 	struct mt7615_dev *dev;
 	struct mt7615_phy *ext_phy;
-	int i, idx;
 
 	dev = (struct mt7615_dev *)container_of(work, struct mt76_dev,
 						mac_work.work);
@@ -1799,12 +1806,6 @@ void mt7615_mac_work(struct work_struct *work)
 		dev->mac_work_count = 0;
 	}
 
-	for (i = 0, idx = 0; i < 4; i++) {
-		u32 val = mt76_rr(dev, MT_TX_AGG_CNT(i));
-
-		dev->mt76.aggr_stats[idx++] += val & 0xffff;
-		dev->mt76.aggr_stats[idx++] += val >> 16;
-	}
 	mutex_unlock(&dev->mt76.mutex);
 
 	mt76_tx_status_check(&dev->mt76, NULL, false);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index 1e0d95b917e1..d91041613df8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -406,7 +406,8 @@ enum mt7615_reg_base {
 						  ((n) << 4))
 #define MT_MIB_ACK_FAIL_COUNT_MASK	GENMASK(31, 16)
 
-#define MT_TX_AGG_CNT(n)		MT_WF_MIB(0xa8 + ((n) << 2))
+#define MT_TX_AGG_CNT(_band, n)		MT_WF_MIB(0xa8 + ((_band) << 9) + \
+						  ((n) << 2))
 
 #define MT_DMA_SHDL(ofs)		(dev->reg_map[MT_DMA_SHDL_BASE] + (ofs))
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
