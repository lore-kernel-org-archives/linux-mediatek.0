Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689DAC43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 07:02:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3654420578
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 07:02:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uh4Ly1FJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kKAvCiQZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3654420578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=weOCvu4HdM/5GJti0hTciwkpmwOwx68uI/sKmEreY4c=; b=uh4Ly1FJovnddJ
	CrE8cryvztPF36sKsRwAXoa6OQEjpcqxJ8h3mcgIrrrewtfOuJzR9lyYX5qZi/9sZhtfYr4cbTCer
	PmOOWgmjQHyREogGTEnz+2bvDn+jDn+9V2kn+/juD9x0RI3+iRg8dYxqzMOv2b6JsEA/+DvbdONyZ
	YkNI+swgNTQKeMuY9WsfQDzTNkgjLcOfycV3ygjl7HzI1SMvt8/nFoVp3jGx0Qml2VVW3rvguQ6g8
	GojScxY2M0X+pRJYjMVb6TT4gM4qCRSGCQzkpx7bve/Gj6CG1gsTa05C0KlPdX0M2KOb8AkE5GzeA
	SP+RLWk0E1dJHkzbHo5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJAuJ-0003Wi-Tg; Tue, 31 Mar 2020 07:01:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJAuG-0003WN-TP
 for linux-mediatek@lists.infradead.org; Tue, 31 Mar 2020 07:01:54 +0000
X-UUID: e96ea5dcf4464275b7987c7c5985542f-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dWeUYI7xrUUPpwG9uIR3lS1sfk04c5uMrHZowKdcRA8=; 
 b=kKAvCiQZlWcsvD4NLcuYMZM3Bmt7JKbTHxendko8EMmDGkfrhyT3d/J/qQpNmfP0KWtANPK50DnwjHHvIcj9ZO+3k7P1ZMLwYnnMCJZ8kOyozbF6t4d3zWqeDRpVfOeIzi/G9NhUx59yKaxnHDynAw1b4gaAOgz3B+bEUyOs5L8=;
X-UUID: e96ea5dcf4464275b7987c7c5985542f-20200330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 955154370; Mon, 30 Mar 2020 23:01:34 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 23:51:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Mar 2020 14:51:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 31 Mar 2020 14:51:39 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 3/4] mt76: mt7615: cleanup mib related defines and structs
Date: Tue, 31 Mar 2020 14:51:37 +0800
Message-ID: <e919aa5ca8cd440f982860b9192199ed47b81504.1585636614.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1fc90ec2a64d062ac7264aaa3dd158f2282ad7b8.1585636614.git.ryder.lee@mediatek.com>
References: <1fc90ec2a64d062ac7264aaa3dd158f2282ad7b8.1585636614.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_000152_957008_2E627B51 
X-CRM114-Status: UNSURE (   9.69  )
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

Simplify mib macros and use proper type for related counters.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 16 ++++++-------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  8 +++----
 .../net/wireless/mediatek/mt76/mt7615/regs.h  | 23 ++++++++-----------
 3 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 8572973cc4c8..f30dc015e88e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1535,8 +1535,8 @@ void mt7615_mac_set_scs(struct mt7615_dev *dev, bool enable)
 		mt76_set(dev, MT_WF_PHY_MIN_PRI_PWR(1),
 			 MT_WF_PHY_PD_BLK(1));
 		if (is_mt7622(&dev->mt76)) {
-			mt76_set(dev, MT_MIB_M0_MISC_CR, 0x7 << 8);
-			mt76_set(dev, MT_MIB_M0_MISC_CR, 0x7);
+			mt76_set(dev, MT_MIB_M0_MISC_CR(0), 0x7 << 8);
+			mt76_set(dev, MT_MIB_M0_MISC_CR(0), 0x7);
 		}
 	} else {
 		mt76_clear(dev, MT_WF_PHY_MIN_PRI_PWR(0),
@@ -1762,18 +1762,18 @@ mt7615_mac_update_mib_stats(struct mt7615_phy *phy)
 
 	aggr = ext_phy ? ARRAY_SIZE(dev->mt76.aggr_stats) / 2 : 0;
 	for (i = 0; i < 4; i++) {
-		u32 data, val, val2;
+		u32 val, val2;
 
 		val = mt76_get_field(dev, MT_MIB_MB_SDR1(ext_phy, i),
 				     MT_MIB_ACK_FAIL_COUNT_MASK);
 		if (val > mib->ack_fail_cnt)
 			mib->ack_fail_cnt = val;
 
-		val2 = mt76_rr(dev, MT_MIB_MB_SDR0(ext_phy, i));
-		data = FIELD_GET(MT_MIB_RTS_RETRIES_COUNT_MASK, val2);
-		if (data > mib->rts_retries_cnt) {
-			mib->rts_cnt = FIELD_GET(MT_MIB_RTS_COUNT_MASK, val2);
-			mib->rts_retries_cnt = data;
+		val = mt76_rr(dev, MT_MIB_MB_SDR0(ext_phy, i));
+		val2 = FIELD_GET(MT_MIB_RTS_RETRIES_COUNT_MASK, val);
+		if (val2 > mib->rts_retries_cnt) {
+			mib->rts_cnt = FIELD_GET(MT_MIB_RTS_COUNT_MASK, val);
+			mib->rts_retries_cnt = val2;
 		}
 
 		val = mt76_rr(dev, MT_TX_AGG_CNT(ext_phy, i));
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 676ca622c35a..000070769217 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -113,10 +113,10 @@ struct mt7615_vif {
 };
 
 struct mib_stats {
-	u32 ack_fail_cnt;
-	u32 fcs_err_cnt;
-	u32 rts_cnt;
-	u32 rts_retries_cnt;
+	u16 ack_fail_cnt;
+	u16 fcs_err_cnt;
+	u16 rts_cnt;
+	u16 rts_retries_cnt;
 };
 
 struct mt7615_phy {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index d91041613df8..58aaa57fb451 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -379,35 +379,32 @@ enum mt7615_reg_base {
 #define MT_LPON_UTTR1			MT_LPON(0x01c)
 
 #define MT_WF_MIB_BASE			(dev->reg_map[MT_MIB_BASE])
-#define MT_WF_MIB(ofs)			(MT_WF_MIB_BASE + (ofs))
+#define MT_WF_MIB(_band, ofs)		(MT_WF_MIB_BASE + (ofs) + (_band) * 0x200)
 
-#define MT_MIB_M0_MISC_CR		MT_WF_MIB(0x00c)
+#define MT_MIB_M0_MISC_CR(_band)	MT_WF_MIB(_band, 0x00c)
 
-#define MT_MIB_SDR3(n)			MT_WF_MIB(0x014 + ((n) << 9))
+#define MT_MIB_SDR3(_band)		MT_WF_MIB(_band, 0x014)
 #define MT_MIB_SDR3_FCS_ERR_MASK	GENMASK(15, 0)
 
-#define MT_MIB_SDR9(n)			MT_WF_MIB(0x02c + ((n) << 9))
+#define MT_MIB_SDR9(_band)		MT_WF_MIB(_band, 0x02c)
 #define MT_MIB_SDR9_BUSY_MASK		GENMASK(23, 0)
 
-#define MT_MIB_SDR16(n)			MT_WF_MIB(0x048 + ((n) << 9))
+#define MT_MIB_SDR16(_band)		MT_WF_MIB(_band, 0x048)
 #define MT_MIB_SDR16_BUSY_MASK		GENMASK(23, 0)
 
-#define MT_MIB_SDR36(n)			MT_WF_MIB(0x098 + ((n) << 9))
+#define MT_MIB_SDR36(_band)		MT_WF_MIB(_band, 0x098)
 #define MT_MIB_SDR36_TXTIME_MASK	GENMASK(23, 0)
-#define MT_MIB_SDR37(n)			MT_WF_MIB(0x09c + ((n) << 9))
+#define MT_MIB_SDR37(_band)		MT_WF_MIB(_band, 0x09c)
 #define MT_MIB_SDR37_RXTIME_MASK	GENMASK(23, 0)
 
-#define MT_MIB_MB_SDR0(_band, n)	MT_WF_MIB(0x100 + ((_band) << 9) + \
-						  ((n) << 4))
+#define MT_MIB_MB_SDR0(_band, n)	MT_WF_MIB(_band, 0x100 + ((n) << 4))
 #define MT_MIB_RTS_RETRIES_COUNT_MASK	GENMASK(31, 16)
 #define MT_MIB_RTS_COUNT_MASK		GENMASK(15, 0)
 
-#define MT_MIB_MB_SDR1(_band, n)	MT_WF_MIB(0x104 + ((_band) << 9) + \
-						  ((n) << 4))
+#define MT_MIB_MB_SDR1(_band, n)	MT_WF_MIB(_band, 0x104 + ((n) << 4))
 #define MT_MIB_ACK_FAIL_COUNT_MASK	GENMASK(31, 16)
 
-#define MT_TX_AGG_CNT(_band, n)		MT_WF_MIB(0xa8 + ((_band) << 9) + \
-						  ((n) << 2))
+#define MT_TX_AGG_CNT(_band, n)		MT_WF_MIB(_band, 0xa8 + ((n) << 2))
 
 #define MT_DMA_SHDL(ofs)		(dev->reg_map[MT_DMA_SHDL_BASE] + (ofs))
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
