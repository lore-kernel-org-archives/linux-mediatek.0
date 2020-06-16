Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C011EC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 12:57:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95BB420B1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 12:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E/EGdx0k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="o+Hw2+/+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95BB420B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CtDIKXMjDBVYxQrKBkEk7Pe5CwKX3/55nU3RG1D+ME=; b=E/EGdx0krlR27U
	yfCHF/ADAMVF5xIu2JfJwlVIn4Uttz/dWznxoNILIAkOSmdCdHT3CSiyu67w6cMZ94AJ7yJhSI4JU
	+GJ+JBnSutXoOUGJ97QdffggXQIHhsofwSXESkzq/wWko6NPcXv3vYb9IT1mf+/SeCXYYBJ/YNlXo
	38atyp3Mb7p3OvNfoH1wlx/DRa8UnP80jYYGfI+CD3jpM4b1fHgWdRIPg/pmIrWrrGdxY5lL7UB49
	OjQUeeydvZJnC46VBaLT74HIEK79r3/ZSEtpVf7+HrvkuY1nJNHVzT98QkDODldQkAH4SNhU3uSkZ
	BsZ+t5HFd9z7pTq0alrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlB9P-0005A0-MY; Tue, 16 Jun 2020 12:57:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlB9E-0004yy-3P
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 12:57:06 +0000
X-UUID: 2c78b3cc02a3469694c5f18e75693374-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cFT7b6H2LRT9dSPfnxzcUSZBaTbz+EV+Si2bOMAYrIw=; 
 b=o+Hw2+/+df3kElzxoJeYCt1JSK+pNNLeMtnnojBJrNUKo6JzIuP70EhLVRJhhWllxEon45aSaivTS3ny6yyECjKGQHxtILe35kuZaKn58hDVh7SKJyyyyojAzNZ8JTNB4+XTEayCa0YiV7bD/RzuuiIn0D2hGD8BU5tO+cDS7uk=;
X-UUID: 2c78b3cc02a3469694c5f18e75693374-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 870427155; Tue, 16 Jun 2020 04:56:49 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 05:47:06 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 20:47:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Jun 2020 20:47:02 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 4/4] mt76: mt7915: add support to read per-rate tx power from
 HW in debugfs
Date: Tue, 16 Jun 2020 20:46:13 +0800
Message-ID: <05dcb80b4bac2e274f2b49479d030588f9dba326.1592276165.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <9ae2b6233284b60206e3513f7bf2eb03d2fbd724.1592276165.git.ryder.lee@mediatek.com>
References: <9ae2b6233284b60206e3513f7bf2eb03d2fbd724.1592276165.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 81AD79F399CF7952C93F3F0FD4020AFF4A34E91C3EFF498E24B5505F11A4EFE82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_055704_148916_C7F69441 
X-CRM114-Status: GOOD (  13.40  )
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

In the previous version, the values of per-rate tx power are calculated
from SW side, but it may be inaccurate if additional limits are applied.
This patch adds support for getting per-rate tx power directly from
registers.

Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 60 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  5 ++
 2 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 38f473d587c9..67bc05600190 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -307,8 +307,8 @@ mt7915_queues_read(struct seq_file *s, void *data)
 }
 
 static void
-mt7915_puts_rate_txpower(struct seq_file *s, s8 *delta,
-			 s8 txpower_cur, int band)
+mt7915_puts_rate_txpower(struct seq_file *s, struct mt7915_dev *dev,
+			 int band, bool ext_phy)
 {
 	static const char * const sku_group_name[] = {
 		"CCK", "OFDM", "HT20", "HT40",
@@ -316,24 +316,51 @@ mt7915_puts_rate_txpower(struct seq_file *s, s8 *delta,
 		"RU26", "RU52", "RU106", "RU242/SU20",
 		"RU484/SU40", "RU996/SU80", "RU2x996/SU160"
 	};
-	s8 txpower[MT7915_SKU_RATE_NUM];
+	u32 reg_base = MT_TMAC_FP0R0(ext_phy);
 	int i, idx = 0;
 
-	for (i = 0; i < MT7915_SKU_RATE_NUM; i++)
-		txpower[i] = DIV_ROUND_UP(txpower_cur + delta[i], 2);
-
 	for (i = 0; i < MAX_SKU_RATE_GROUP_NUM; i++) {
 		const struct sku_group *sku = &mt7915_sku_groups[i];
 		u32 offset = sku->offset[band];
+		u8 cnt, mcs_num = sku->len;
+		s8 txpower[12];
+		int j;
+
+		if (i == SKU_HT_BW20 || i == SKU_HT_BW40) {
+			mcs_num = 8;
+		} else if (i >= SKU_VHT_BW20 && i <= SKU_VHT_BW160) {
+			mcs_num = 10;
+
+			if (idx == 60) {
+				reg_base = MT_TMAC_FP0R15(ext_phy);
+				idx = 0;
+			}
+		} else if (i == SKU_HE_RU26) {
+			reg_base = MT_TMAC_FP0R18(ext_phy);
+			idx = 0;
+		}
 
 		if (!offset) {
-			idx += sku->len;
+			idx += mcs_num;
 			continue;
 		}
 
-		mt76_seq_puts_array(s, sku_group_name[i],
-				    txpower + idx, sku->len);
-		idx += sku->len;
+		for (j = 0, cnt = 0; j < DIV_ROUND_UP(mcs_num, 4); j++) {
+			u32 val = mt76_rr(dev, reg_base + (idx / 4) * 4);
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
+
+		mt76_seq_puts_array(s, sku_group_name[i], txpower, mcs_num);
 	}
 }
 
@@ -343,21 +370,16 @@ mt7915_read_rate_txpower(struct seq_file *s, void *data)
 	struct mt7915_dev *dev = dev_get_drvdata(s->private);
 	struct mt76_phy *mphy = &dev->mphy;
 	enum nl80211_band band = mphy->chandef.chan->band;
-	s8 *delta = dev->rate_power[band];
-	s8 txpower_base = mphy->txpower_cur - delta[MT7915_SKU_MAX_DELTA_IDX];
 
-	seq_puts(s, "Band 0:\n");
-	mt7915_puts_rate_txpower(s, delta, txpower_base, band);
+	seq_puts(s, "Band 0: (unit: 0.5 dBm)\n");
+	mt7915_puts_rate_txpower(s, dev, band, false);
 
 	if (dev->mt76.phy2) {
 		mphy = dev->mt76.phy2;
 		band = mphy->chandef.chan->band;
-		delta = dev->rate_power[band];
-		txpower_base = mphy->txpower_cur -
-			       delta[MT7915_SKU_MAX_DELTA_IDX];
 
-		seq_puts(s, "Band 1:\n");
-		mt7915_puts_rate_txpower(s, delta, txpower_base, band);
+		seq_puts(s, "Band 1: (unit: 0.5 dBm)\n");
+		mt7915_puts_rate_txpower(s, dev, band, true);
 	}
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index e0989141d9da..afd582fd20a1 100644
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
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
