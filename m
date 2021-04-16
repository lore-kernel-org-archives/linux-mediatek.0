Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3185C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 22:17:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECBCC611AF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 22:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECBCC611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ym9vL13zckdO187zJ8EJUd8lOXSswJnwls5Vh5fEniE=; b=M7XLJ5B1whIQNcsIoP8jCtpxz
	gYVjCoGgYgrIclQASaPZgOoPwjC/xIPhJJxTnaJbc2wRyic3+KsduINpfMR8HgkXM+h4RwjxftkKX
	ZH+3w0TaXrUxfrnI+WyT9HdRnxOx9PFISPeMyFoe86vvckLCyT0GssWO/Ozw6LRNQGCQFEyV4feHp
	L5KCVpkUUotMgPyqD+pqsxkkCVtE0CK0PhlMlrheu1iImNHyBAlfTCpks/wka+I4pZXkIGNmEe9x0
	e6G+1sOO4q9wXRWcJ0sx8WywORUV29O3J0PDdbwkDfrXYfE7YADUshEt3EaX5WMwj+ubl7+KH5qWt
	r6/sx0C3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXWll-003Yyg-HO; Fri, 16 Apr 2021 22:16:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXWlb-003Yw4-Aq
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 22:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=dnxJc3oKJTUarFm1ljHdDY0Rj/H3ClEnqjcw5rZ9B5A=; b=2KYVuVN2Egz/M7MdTmYFdi8IKl
 +TA9EY9gOkxt6HdOGUuQOAWZFzjdDJV8QQd/QCyPTgl/zpfelDZpPWvYhwUKaVSWa0KgD5nBmMa+u
 1NLHQFn4Yy1e3FjBCnI8EhG96gfEq9pZag6NbT+mprBInDqR+AKcQf1hS3aq6aSPQZY9bAXSPqqpH
 Jg8w7nQ7jXCPZwwIuQlgS3gZ67LcG7JPi0tTr7vsr4l8yqmyu0YJDcpjy+tV/KBhVES3tFk+Gfgzj
 NPqFcSgqfkcFACHMisSaKVw8ALTJY3qwacLgUiQ9hLn/exTUAmo5I3OoTvTDPsVH7L6VL7dV3UlLA
 moxNYitg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXWlW-009kIo-52
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 22:16:46 +0000
X-UUID: d6fe6184e4014461b74bc1081fbd3c53-20210416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dnxJc3oKJTUarFm1ljHdDY0Rj/H3ClEnqjcw5rZ9B5A=; 
 b=BdTKF/vX/k47pp3VwPbFd3Q+aInnnAGUMAoxLsqvGUg0lX6gfmdNZLCjISyOKsgFAm/lYP+FUZpyiFiblwiHidQsTyeBeViwPHs1ivZSxdKiqHJDJYnq5ORF8Uh3NoFOwRQKvzEvqXk3bzonEOqUiIj4qSLXixRibDrJa7DyJQA=;
X-UUID: d6fe6184e4014461b74bc1081fbd3c53-20210416
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 781172536; Fri, 16 Apr 2021 15:16:37 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 15:16:36 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Apr 2021 06:16:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Apr 2021 06:16:22 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 3/3] mt76: mt7915: directly read per-rate tx power from
 registers
Date: Sat, 17 Apr 2021 06:16:19 +0800
Message-ID: <1341b8a7123fe04b11d8ab65240c4a19e5ca43e3.1618609024.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <6c1be8713dfd1154b5ec61b2b094eb156d9fb659.1618609024.git.ryder.lee@mediatek.com>
References: <6c1be8713dfd1154b5ec61b2b094eb156d9fb659.1618609024.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 899A4C9C601A63917558AC33361A8FA682CB2848391D4A10DD5B88F479AEC0712000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_151642_222137_90F125A8 
X-CRM114-Status: GOOD (  13.27  )
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

From: Shayne Chen <shayne.chen@mediatek.com>

Since driver no longer handler per-rate tx power setting, we need to
read the power values directly from registers.

Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 68 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  5 ++
 2 files changed, 51 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 93bde072fe4d..65d44135a560 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -311,7 +311,7 @@ mt7915_queues_read(struct seq_file *s, void *data)
 }
 
 static void
-mt7915_puts_rate_txpower(struct seq_file *s, s8 txpower_cur, int band)
+mt7915_puts_rate_txpower(struct seq_file *s, struct mt7915_phy *phy)
 {
 	static const char * const sku_group_name[] = {
 		"CCK", "OFDM", "HT20", "HT40",
@@ -319,18 +319,54 @@ mt7915_puts_rate_txpower(struct seq_file *s, s8 txpower_cur, int band)
 		"RU26", "RU52", "RU106", "RU242/SU20",
 		"RU484/SU40", "RU996/SU80", "RU2x996/SU160"
 	};
-	s8 txpower[161];
+	struct mt7915_dev *dev = dev_get_drvdata(s->private);
+	bool ext_phy = phy != &dev->phy;
+	u32 reg_base;
 	int i, idx = 0;
 
-	for (i = 0; i < ARRAY_SIZE(txpower); i++)
-		txpower[i] = DIV_ROUND_UP(txpower_cur, 2);
+	if (!phy)
+		return;
+
+	reg_base = MT_TMAC_FP0R0(ext_phy);
+	seq_printf(s, "\nBand %d\n", ext_phy);
 
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
 
-		mt76_seq_puts_array(s, sku_group_name[i],
-				    txpower + idx, len);
-		idx += len;
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
+
+		mt76_seq_puts_array(s, sku_group_name[i], txpower, mcs_num);
 	}
 }
 
@@ -338,21 +374,9 @@ static int
 mt7915_read_rate_txpower(struct seq_file *s, void *data)
 {
 	struct mt7915_dev *dev = dev_get_drvdata(s->private);
-	struct mt76_phy *mphy = &dev->mphy;
-	enum nl80211_band band = mphy->chandef.chan->band;
-	s8 txpower = mphy->txpower_cur;
-
-	seq_puts(s, "Band 0:\n");
-	mt7915_puts_rate_txpower(s, txpower, band);
 
-	if (dev->mt76.phy2) {
-		mphy = dev->mt76.phy2;
-		band = mphy->chandef.chan->band;
-		txpower = mphy->txpower_cur;
-
-		seq_puts(s, "Band 1:\n");
-		mt7915_puts_rate_txpower(s, txpower, band);
-	}
+	mt7915_puts_rate_txpower(s, &dev->phy);
+	mt7915_puts_rate_txpower(s, mt7915_ext_phy(dev));
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index dfb8880657bf..efe0f2904c66 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -82,6 +82,11 @@
 #define MT_TMAC_CTCR0_INS_DDLMT_EN		BIT(17)
 #define MT_TMAC_CTCR0_INS_DDLMT_VHT_SMPDU_EN	BIT(18)
 
+#define MT_TMAC_FP0R0(_band)		MT_WF_TMAC(_band, 0x020)
+#define MT_TMAC_FP0R15(_band)		MT_WF_TMAC(_band, 0x080)
+#define MT_TMAC_FP0R18(_band)		MT_WF_TMAC(_band, 0x270)
+#define MT_TMAC_FP_MASK			GENMASK(7, 0)
+
 #define MT_TMAC_TFCR0(_band)		MT_WF_TMAC(_band, 0x1e0)
 
 #define MT_WF_DMA_BASE(_band)		((_band) ? 0xa1e00 : 0x21e00)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
