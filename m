Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46B7C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 02:39:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B41322249
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 02:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YKKpCj8d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kzj2ynUF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B41322249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IIZD1V8N3yWwriXwh3IGQgdn2hzt3kBBeVwYcaFmhLU=; b=YKKpCj8dB56iINqlqWvpoVOqJ6
	Qf5yPI4180x4qhQKpNNNWtBMIN5Hu7estGi2A9x988jxIBu2ZztT3t4QZOCicOwoOBjUAmHIH9l7L
	iwH+nHTAZskEqu1hAL4l4uylMxmqBn+0yFnP9Y66wKHusVaoIYSL7+PDf5NvoBMLqByYqiVG18XTn
	ssKr36hXNjmljfqtflpbOk+7/c5HNk1qwgElVXwKVXOT/X5YgvlE1NR96HqIRETweBFz3fNSe8LFt
	b3EFfvsGf2lf+AUeT6BD4GIraQ0CjAygCq1LzGzuOSfq+6jOcr/DFP1F/y+SySn5H96grqu7Q9HC/
	becENsuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVQVC-0003TG-LN; Thu, 22 Oct 2020 02:38:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVQV9-0003S8-Na
 for linux-mediatek@lists.infradead.org; Thu, 22 Oct 2020 02:38:53 +0000
X-UUID: dfe125c98e184054911256c138696503-20201021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zY34pkVXqvHFrUkI7Cdx5qzwRfOG6aaDums30Ks561c=; 
 b=kzj2ynUFC+ih4Yb+ejqmgZ0cscFEE0Kd2hp0GdCj/fXmFntlwlHiZJ/XmNLhMFk8hPXQj/0VOngqjIsCA/chZSOOCNYHZjbg8KMKyIogXEBKjp3Tk1+7xmxCMuZumBmzaHMPYaBlJ+MSJBIjJCHsTeusu3D5IiIeK3uwJ/zZt38=;
X-UUID: dfe125c98e184054911256c138696503-20201021
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 668180037; Wed, 21 Oct 2020 18:38:48 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 19:28:45 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 10:28:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 10:28:38 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v4 01/10] mt76: testmode: switch ib and wb rssi to array type
 for per-antenna report
Date: Thu, 22 Oct 2020 10:28:11 +0800
Message-ID: <20201022022820.3077-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_223852_005042_541B0660 
X-CRM114-Status: GOOD (  12.78  )
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

Change ib_rssi and wb_rssi into array type, since they could be reported
by per-antenna.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2: move Reviewed-by before s-o-b

 .../net/wireless/mediatek/mt76/mt7615/mac.c   |  4 ++--
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  4 ++--
 .../wireless/mediatek/mt76/mt7615/testmode.c  | 24 ++++++++++++++++---
 drivers/net/wireless/mediatek/mt76/testmode.h |  4 ++--
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 8dc645e..9aad2ee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -215,8 +215,8 @@ static void mt7615_mac_fill_tm_rx(struct mt7615_dev *dev, __le32 *rxv)
 	dev->test.last_rcpi[1] = FIELD_GET(MT_RXV4_RCPI1, rxv4);
 	dev->test.last_rcpi[2] = FIELD_GET(MT_RXV4_RCPI2, rxv4);
 	dev->test.last_rcpi[3] = FIELD_GET(MT_RXV4_RCPI3, rxv4);
-	dev->test.last_ib_rssi = FIELD_GET(MT_RXV3_IB_RSSI, rxv3);
-	dev->test.last_wb_rssi = FIELD_GET(MT_RXV3_WB_RSSI, rxv3);
+	dev->test.last_ib_rssi[0] = FIELD_GET(MT_RXV3_IB_RSSI, rxv3);
+	dev->test.last_wb_rssi[0] = FIELD_GET(MT_RXV3_WB_RSSI, rxv3);
 #endif
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index f72506d..50ea9ef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -303,8 +303,8 @@ struct mt7615_dev {
 
 		s16 last_freq_offset;
 		u8 last_rcpi[4];
-		s8 last_ib_rssi;
-		s8 last_wb_rssi;
+		s8 last_ib_rssi[4];
+		s8 last_wb_rssi[4];
 	} test;
 #endif
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
index 1f33628..8fc97a5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
@@ -335,9 +335,7 @@ mt7615_tm_dump_stats(struct mt76_dev *mdev, struct sk_buff *msg)
 	if (!rx)
 		return -ENOMEM;
 
-	if (nla_put_s32(msg, MT76_TM_RX_ATTR_FREQ_OFFSET, dev->test.last_freq_offset) ||
-	    nla_put_s32(msg, MT76_TM_RX_ATTR_IB_RSSI, dev->test.last_ib_rssi) ||
-	    nla_put_s32(msg, MT76_TM_RX_ATTR_WB_RSSI, dev->test.last_wb_rssi))
+	if (nla_put_s32(msg, MT76_TM_RX_ATTR_FREQ_OFFSET, dev->test.last_freq_offset))
 		return -ENOMEM;
 
 	rssi = nla_nest_start(msg, MT76_TM_RX_ATTR_RCPI);
@@ -350,6 +348,26 @@ mt7615_tm_dump_stats(struct mt76_dev *mdev, struct sk_buff *msg)
 
 	nla_nest_end(msg, rssi);
 
+	rssi = nla_nest_start(msg, MT76_TM_RX_ATTR_IB_RSSI);
+	if (!rssi)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(dev->test.last_ib_rssi); i++)
+		if (nla_put_s8(msg, i, dev->test.last_ib_rssi[i]))
+			return -ENOMEM;
+
+	nla_nest_end(msg, rssi);
+
+	rssi = nla_nest_start(msg, MT76_TM_RX_ATTR_WB_RSSI);
+	if (!rssi)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(dev->test.last_wb_rssi); i++)
+		if (nla_put_s8(msg, i, dev->test.last_wb_rssi[i]))
+			return -ENOMEM;
+
+	nla_nest_end(msg, rssi);
+
 	nla_nest_end(msg, rx);
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
index 691fe57..02c9495 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/testmode.h
@@ -99,8 +99,8 @@ enum mt76_testmode_stats_attr {
  *
  * @MT76_TM_RX_ATTR_FREQ_OFFSET: frequency offset (s32)
  * @MT76_TM_RX_ATTR_RCPI: received channel power indicator (array, u8)
- * @MT76_TM_RX_ATTR_IB_RSSI: internal inband RSSI (s8)
- * @MT76_TM_RX_ATTR_WB_RSSI: internal wideband RSSI (s8)
+ * @MT76_TM_RX_ATTR_IB_RSSI: internal inband RSSI (array, s8)
+ * @MT76_TM_RX_ATTR_WB_RSSI: internal wideband RSSI (array, s8)
  */
 enum mt76_testmode_rx_attr {
 	MT76_TM_RX_ATTR_UNSPEC,
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
