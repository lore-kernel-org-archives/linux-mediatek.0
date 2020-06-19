Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2998C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 10:05:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 723112073E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 10:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jkiHzZT3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UU96WzUn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 723112073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZbEcwheo1gZOBF8e583nF0HbDjHiYmzg6uc8ta2DOA=; b=jkiHzZT3w47MbD
	TKkUSgL80REiZCMJwEZoicHg2B3wqO4VKU3Lpb73IbsQlkB94qhhlIYBu+drP8hThZ8z5EaqjMnYD
	eGSQmJcJ7TOnctUypfsG5IklUCpYFo7WX5Q3OHJpDCuu+iCqqXD8IblCbhrSMWszc5bh9weuL/lgD
	9zXDn8gX50BucixSqPoPOEJoFnmhSnXh/6hEYVrgU9cYJKJrWmSwhbSWlnkcfC7VSR/5gtq416+l3
	SQFYLq3xSUdtdVxf9ibdgWn/ebPxoasR2b8w6q1VSlTK+I9yA/JXrJxuZN2hBRObDwyz4oKxAr9bQ
	HjBpfCOOcyE1ZtrJCo9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmDtE-0005Cy-KJ; Fri, 19 Jun 2020 10:04:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmDtB-0005Bp-IV
 for linux-mediatek@lists.infradead.org; Fri, 19 Jun 2020 10:04:51 +0000
X-UUID: fd98104499da42519fcea93293d0fca5-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7R3+vIyIcJGIoNqgxDKbx7s8gBbCjRAh+DCyFKieXfA=; 
 b=UU96WzUn/HibU7uQGzUIUYR6RAe0yXjHVb+FoOkIZ/nhonnH48hnA65H+8rbRKFO98ETTugGpJv5HB86p+Vdw1PsSK+gNd8KtV7YsQicoSUuSMjojThAIk6k2so6LgNPfu97Sznk2nO+q8ftMdc/w2AmsNSjAmGN7bitghYuK5U=;
X-UUID: fd98104499da42519fcea93293d0fca5-20200619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1445374094; Fri, 19 Jun 2020 02:04:37 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 03:04:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 18:04:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 19 Jun 2020 18:04:35 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v3 3/3] mt76: mt7915: directly read per-rate tx power from
 registers
Date: Fri, 19 Jun 2020 18:04:25 +0800
Message-ID: <20200619100425.26351-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200619100425.26351-1-shayne.chen@mediatek.com>
References: <20200619100425.26351-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_030449_622051_0BE87E6E 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since driver no longer handler per-rate tx power setting, we need to
read the power values directly from registers.

Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2:
 - fix reg_base and idx calculation
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 57 ++++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  5 ++
 2 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 73a48c9..92affd4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -300,7 +300,8 @@ mt7915_queues_read(struct seq_file *s, void *data)
 }
 
 static void
-mt7915_puts_rate_txpower(struct seq_file *s, s8 txpower_cur, int band)
+mt7915_puts_rate_txpower(struct seq_file *s, struct mt7915_dev *dev,
+			 int band, bool ext_phy)
 {
 	static const char * const sku_group_name[] = {
 		"CCK", "OFDM", "HT20", "HT40",
@@ -308,18 +309,46 @@ mt7915_puts_rate_txpower(struct seq_file *s, s8 txpower_cur, int band)
 		"RU26", "RU52", "RU106", "RU242/SU20",
 		"RU484/SU40", "RU996/SU80", "RU2x996/SU160"
 	};
-	s8 txpower[161];
+	u32 reg_base = MT_TMAC_FP0R0(ext_phy);
 	int i, idx = 0;
 
-	for (i = 0; i < ARRAY_SIZE(txpower); i++)
-		txpower[i] = DIV_ROUND_UP(txpower_cur, 2);
-
 	for (i = 0; i < ARRAY_SIZE(mt7915_sku_group_len); i++) {
-		u8 len = mt7915_sku_group_len[i];
+		u8 cnt, mcs_num = mt7915_sku_group_len[i];
+		s8 txpower[12];
+		int j;
+
+		if (i == SKU_HT_BW20 || i == SKU_HT_BW40) {
+			mcs_num = 8;
+		} else if (i >= SKU_VHT_BW20 && i <= SKU_VHT_BW160) {
+			mcs_num = 10;
+		} else if (i == SKU_HE_RU26) {
+			reg_base = MT_TMAC_FP0R18(ext_phy);
+			idx = 0;
+		}
+
+		for (j = 0, cnt = 0; j < DIV_ROUND_UP(mcs_num, 4); j++) {
+			u32 val;
+
+			if (i == SKU_VHT_BW160 && idx == 60) {
+				reg_base = MT_TMAC_FP0R15(ext_phy);
+				idx = 0;
+			}
+
+			val = mt76_rr(dev, reg_base + (idx / 4) * 4);
+
+			if (idx && idx % 4)
+				val >>= (idx % 4) * 8;
+
+			while (val > 0 && cnt < mcs_num) {
+				s8 pwr = FIELD_GET(MT_TMAC_FP_MASK, val);
+
+				txpower[cnt++] = pwr;
+				val >>= 8;
+				idx++;
+			}
+		}
 
-		mt76_seq_puts_array(s, sku_group_name[i],
-				    txpower + idx, len);
-		idx += len;
+		mt76_seq_puts_array(s, sku_group_name[i], txpower, mcs_num);
 	}
 }
 
@@ -329,18 +358,16 @@ mt7915_read_rate_txpower(struct seq_file *s, void *data)
 	struct mt7915_dev *dev = dev_get_drvdata(s->private);
 	struct mt76_phy *mphy = &dev->mphy;
 	enum nl80211_band band = mphy->chandef.chan->band;
-	s8 txpower = mphy->txpower_cur;
 
-	seq_puts(s, "Band 0:\n");
-	mt7915_puts_rate_txpower(s, txpower, band);
+	seq_puts(s, "Band 0: (unit: 0.5 dBm)\n");
+	mt7915_puts_rate_txpower(s, dev, band, false);
 
 	if (dev->mt76.phy2) {
 		mphy = dev->mt76.phy2;
 		band = mphy->chandef.chan->band;
-		txpower = mphy->txpower_cur;
 
-		seq_puts(s, "Band 1:\n");
-		mt7915_puts_rate_txpower(s, txpower, band);
+		seq_puts(s, "Band 1: (unit: 0.5 dBm)\n");
+		mt7915_puts_rate_txpower(s, dev, band, true);
 	}
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index c121715..d80ae1e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -67,6 +67,11 @@
 #define MT_TMAC_CTCR0_INS_DDLMT_EN		BIT(17)
 #define MT_TMAC_CTCR0_INS_DDLMT_VHT_SMPDU_EN	BIT(18)
 
+#define MT_TMAC_FP0R0(_band)		MT_WF_TMAC(_band, 0x020)
+#define MT_TMAC_FP0R15(_band)		MT_WF_TMAC(_band, 0x080)
+#define MT_TMAC_FP0R18(_band)		MT_WF_TMAC(_band, 0x270)
+#define MT_TMAC_FP_MASK			GENMASK(7, 0)
+
 /* DMA Band 0 */
 #define MT_WF_DMA_BASE			0x21e00
 #define MT_WF_DMA(ofs)			(MT_WF_DMA_BASE + (ofs))
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
