Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC27C54E8E
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D305A206E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WRAwkMgo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GahBo0Zv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D305A206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PLWXz+tt62h0sg5Twaw9gjRPtdpPZLQB3lLCNHyWKo=; b=WRAwkMgo6+b5r3
	19SGPGYQ9IIdfzWXoB/jyeg4Vz6H5vGhdmInopofv5CoW8Xy3GLO2a1hlpGWUCzRBqhadTwc3Ev8S
	Vzo0hef1fBeRE1rO4Xz52brdD/+T5r1qifFvETkg99GLM4dJjaDXmW+Q7L/6l/4VaJTwSxeXXT6Li
	UY4DWIjfDk8H8UHnzjlVI35S3/+GSdBLfxPaTAMQA59kLHwWWREQbZN23rhdmonKo/IiMph3ew/3R
	mV177c4bbENAa94F8Ock+pRIlHkKoOfMaJORwQXNr3GhbB+F4Hp8SdeZSwfxnrBUuTmhfXkRs1zRy
	AnnsDLms22djNqLIrY6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYAxP-00055P-Uh; Mon, 11 May 2020 16:07:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYAxK-0004we-NY
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 16:07:04 +0000
X-UUID: fb06e11a311f42f496f233e2d7192c71-20200511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=iqLbPXSZEh+NBhvm0FnTNsHDsy4qGYixGJzBK4ImsXw=; 
 b=GahBo0Zv5gfu+hQ+lwt9ja+NkSFRTo45FwGhqMOTZYBh83vs/DuUbKSLqEPEL9qjOcQ+jGNU9u/nxN6iQEFOZ/7GwVBNTiKKPw2MNiGvqwZ5GanZcrcXyF2e0HE97UpAz3OldSwERinipRioCAFHRC/w4ZashrqW1esnbUqAcFU=;
X-UUID: fb06e11a311f42f496f233e2d7192c71-20200511
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1916221756; Mon, 11 May 2020 08:06:26 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 09:06:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 May 2020 00:06:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 May 2020 00:06:41 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 5/7] mt76: mt7915: add debugfs to track TxBF status
Date: Tue, 12 May 2020 00:06:36 +0800
Message-ID: <e8d3288f7b7bb2a26c06a5dfbfa57c5904aaf8a1.1589212457.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1589212457.git.ryder.lee@mediatek.com>
References: <cover.1589212457.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_090702_796613_788FC59F 
X-CRM114-Status: UNSURE (   7.91  )
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

Add debug counters to track status of beamformer and beamformee.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 45 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 20 +++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index c6c009cd773e..ee0066fedd04 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -143,6 +143,48 @@ mt7915_ampdu_stat_read_phy(struct mt7915_phy *phy,
 	seq_printf(file, "BA miss count: %d\n", phy->mib.ba_miss_cnt);
 }
 
+static void
+mt7915_txbf_stat_read_phy(struct mt7915_phy *phy, struct seq_file *s)
+{
+	struct mt7915_dev *dev = s->private;
+	bool ext_phy = phy != &dev->phy;
+	int cnt;
+
+	if (!phy)
+		return;
+
+	/* Tx Beamformer monitor */
+	seq_puts(s, "\nTx Beamformer applied PPDU counts: ");
+
+	cnt = mt76_rr(dev, MT_ETBF_TX_APP_CNT(ext_phy));
+	seq_printf(s, "iBF: %ld, eBF: %ld\n",
+		   FIELD_GET(MT_ETBF_TX_IBF_CNT, cnt),
+		   FIELD_GET(MT_ETBF_TX_EBF_CNT, cnt));
+
+	/* Tx Beamformer Rx feedback monitor */
+	seq_puts(s, "Tx Beamformer Rx feedback statistics: ");
+
+	cnt = mt76_rr(dev, MT_ETBF_RX_FB_CNT(ext_phy));
+	seq_printf(s, "All: %ld, HE: %ld, VHT: %ld, HT: %ld\n",
+		   FIELD_GET(MT_ETBF_RX_FB_ALL, cnt),
+		   FIELD_GET(MT_ETBF_RX_FB_HE, cnt),
+		   FIELD_GET(MT_ETBF_RX_FB_VHT, cnt),
+		   FIELD_GET(MT_ETBF_RX_FB_HT, cnt));
+
+	/* Tx Beamformee Rx NDPA & Tx feedback report */
+	cnt = mt76_rr(dev, MT_ETBF_TX_NDP_BFRP(ext_phy));
+	seq_printf(s, "Tx Beamformee sucessful feedback frames: %ld\n",
+		   FIELD_GET(MT_ETBF_TX_FB_CPL, cnt));
+	seq_printf(s, "Tx Beamformee feedback triggerd counts: %ld\n",
+		   FIELD_GET(MT_ETBF_TX_FB_TRI, cnt));
+
+	/* Tx SU counters */
+	cnt = mt76_rr(dev, MT_MIB_DR11(ext_phy));
+	seq_printf(s, "Tx single-user sucessful MPDU counts: %d\n", cnt);
+
+	seq_puts(s, "\n");
+}
+
 static int
 mt7915_tx_stats_read(struct seq_file *file, void *data)
 {
@@ -150,7 +192,10 @@ mt7915_tx_stats_read(struct seq_file *file, void *data)
 	int stat[8], i, n;
 
 	mt7915_ampdu_stat_read_phy(&dev->phy, file);
+	mt7915_txbf_stat_read_phy(&dev->phy, file);
+
 	mt7915_ampdu_stat_read_phy(mt7915_ext_phy(dev), file);
+	mt7915_txbf_stat_read_phy(mt7915_ext_phy(dev), file);
 
 	/* Tx amsdu info */
 	seq_puts(file, "Tx MSDU stat:\n");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 6600fc625196..c121715f8bff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -75,6 +75,24 @@
 #define MT_DMA_DCR0_MAX_RX_LEN		GENMASK(15, 3)
 #define MT_DMA_DCR0_RXD_G5_EN		BIT(23)
 
+/* ETBF: band 0(0x24000), band 1(0xa4000) */
+#define MT_WF_ETBF_BASE(_band)		((_band) ? 0xa4000 : 0x24000)
+#define MT_WF_ETBF(_band, ofs)		(MT_WF_ETBF_BASE(_band) + (ofs))
+
+#define MT_ETBF_TX_NDP_BFRP(_band)	MT_WF_ETBF(_band, 0x040)
+#define MT_ETBF_TX_FB_CPL		GENMASK(31, 16)
+#define MT_ETBF_TX_FB_TRI		GENMASK(15, 0)
+
+#define MT_ETBF_TX_APP_CNT(_band)	MT_WF_ETBF(_band, 0x0f0)
+#define MT_ETBF_TX_IBF_CNT		GENMASK(31, 16)
+#define MT_ETBF_TX_EBF_CNT		GENMASK(15, 0)
+
+#define MT_ETBF_RX_FB_CNT(_band)	MT_WF_ETBF(_band, 0x0f8)
+#define MT_ETBF_RX_FB_ALL		GENMASK(31, 24)
+#define MT_ETBF_RX_FB_HE		GENMASK(23, 16)
+#define MT_ETBF_RX_FB_VHT		GENMASK(15, 8)
+#define MT_ETBF_RX_FB_HT		GENMASK(7, 0)
+
 /* LPON: band 0(0x24200), band 1(0xa4200) */
 #define MT_WF_LPON_BASE(_band)		((_band) ? 0xa4200 : 0x24200)
 #define MT_WF_LPON(_band, ofs)		(MT_WF_LPON_BASE(_band) + (ofs))
@@ -104,6 +122,8 @@
 #define MT_MIB_SDR37(_band)		MT_WF_MIB(_band, 0x09c)
 #define MT_MIB_SDR37_RXTIME_MASK	GENMASK(23, 0)
 
+#define MT_MIB_DR11(_band)		MT_WF_MIB(_band, 0x0cc)
+
 #define MT_MIB_MB_SDR0(_band, n)	MT_WF_MIB(_band, 0x100 + ((n) << 4))
 #define MT_MIB_RTS_RETRIES_COUNT_MASK	GENMASK(31, 16)
 #define MT_MIB_RTS_COUNT_MASK		GENMASK(15, 0)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
