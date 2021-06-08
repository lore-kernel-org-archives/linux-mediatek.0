Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C31C4743E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 07:06:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBEC6610E5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 07:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBEC6610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klGv/1k1OdbFd46PHOz5JDynNhrpH+PuOiFZMm25RrA=; b=4gzqPWPdbkXYHr
	jrXc7hF1xaLxc71u8vAaUdEm9OGBgL+f3IfgMEQoQkiJKtd6oIzwUR73EcPW0DGpiYnNk+kXWB8fU
	qFA1LXtLk0Ly1u/IAl56NaMMuwCZYNdLs9D3vXESIiMATETRj7OnpZq84RWRZYXVXcgElt8AxrvQ5
	pbdmmhkJZDOmSBBsFQQtoHh5WsyxgITl2Ur8y5QSQB+HWd5Pz7VUDqsNO0KnwOGFXDPEi2hXrpqr+
	J+aqrpRHjs+g579VmgS/EtkP42X2fH0QlE+BVrGAnfrDGSQDMZ6JqCyQ0cU2ohqA8R3GFfdufYG0V
	b8mjTllZWD1ENYhJo6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqVon-006nX4-0k; Tue, 08 Jun 2021 07:06:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqVok-006nU2-32
 for linux-mediatek@lists.infradead.org; Tue, 08 Jun 2021 07:06:31 +0000
X-UUID: 85720a342e7d436791d7f850dda46452-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CsR3mHKJMwAySkefoI3QApdYaFL9qXwcHUVij8y9e48=; 
 b=OGY87DoC+E4HT1+SEPO1gx9KPqmx1oIYmfFuQdBjKoW0/eI48FzQBcCeisOraI31DpzprTHymNU71OaMQp3NEQA+kz2VnLqsj1RUbNsyCdBfl28ppZDys2DEUK9c6olx+VDuy/8jDsu2vUukV9sZwCX3ffxyIO/fu0fplO+/fpY=;
X-UUID: 85720a342e7d436791d7f850dda46452-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1591290680; Tue, 08 Jun 2021 00:06:23 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 23:56:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 14:56:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Jun 2021 14:56:19 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 2/2] mt76: mt7915: fix rx fcs error count in testmode
Date: Tue, 8 Jun 2021 14:55:58 +0800
Message-ID: <20210608065558.8117-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210608065558.8117-1-shayne.chen@mediatek.com>
References: <20210608065558.8117-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_000630_155950_A8ED1EEE 
X-CRM114-Status: GOOD (  13.32  )
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

FCS error packets are filtered by default and won't be reported to
driver, so that RX fcs error and PER in testmode always show zero.
Fix this issue by reading fcs error count from hw counter.

We did't fix this issue by disabling fcs error rx filter since it may
let HW suffer some SER errors.

Fixes: 5d8a83f09941 ("mt76: mt7915: implement testmode rx support")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index f9d81e3..b220b33 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -464,10 +464,17 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 static void
 mt7915_tm_set_rx_frames(struct mt7915_phy *phy, bool en)
 {
-	if (en)
+	mt7915_tm_set_trx(phy, TM_MAC_RX_RXV, false);
+
+	if (en) {
+		struct mt7915_dev *dev = phy->dev;
+
 		mt7915_tm_update_channel(phy);
 
-	mt7915_tm_set_trx(phy, TM_MAC_RX_RXV, en);
+		/* read-clear */
+		mt76_rr(dev, MT_MIB_SDR3(phy != &dev->phy));
+		mt7915_tm_set_trx(phy, TM_MAC_RX_RXV, en);
+	}
 }
 
 static int
@@ -690,7 +697,11 @@ static int
 mt7915_tm_dump_stats(struct mt76_phy *mphy, struct sk_buff *msg)
 {
 	struct mt7915_phy *phy = mphy->priv;
+	struct mt7915_dev *dev = phy->dev;
+	bool ext_phy = phy != &dev->phy;
+	enum mt76_rxq_id q;
 	void *rx, *rssi;
+	u16 fcs_err;
 	int i;
 
 	rx = nla_nest_start(msg, MT76_TM_STATS_ATTR_LAST_RX);
@@ -735,6 +746,12 @@ mt7915_tm_dump_stats(struct mt76_phy *mphy, struct sk_buff *msg)
 
 	nla_nest_end(msg, rx);
 
+	fcs_err = mt76_get_field(dev, MT_MIB_SDR3(ext_phy),
+				 MT_MIB_SDR3_FCS_ERR_MASK);
+	q = ext_phy ? MT_RXQ_EXT : MT_RXQ_MAIN;
+	mphy->test.rx_stats.packets[q] += fcs_err;
+	mphy->test.rx_stats.fcs_error[q] += fcs_err;
+
 	return 0;
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
