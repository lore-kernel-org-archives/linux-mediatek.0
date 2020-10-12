Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB45C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 13:06:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18C692076C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 13:06:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r3u9IlEh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jH5xnQkZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18C692076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MzJzUmS7OrZNLoTJKjhOaW0bWd38thSE+lCJYpGfbsE=; b=r3u9IlEhn5uKLfgECybSC+06B
	fnoaKBV3LXduwVqwzpxSIspyvCDdHdTdrBH/5R0MaY2NLRvOv8h2h4+M23wfBH1FkgkbJ2VRqwzJO
	+rrbrE53hb8DInOnqjE0ZojcH7l2ayR7QEWNY/4so2GdLJlQ9nVAtqCIZP936cWYreN2g2sQCx/Eq
	gn9RkiLblSCbA+5RnER89GsqGGXomr5rcbBS8ZHpMqsx7zM4bbu+wExU48o4tpb3KpmafJUXJf3kZ
	h/a9uHOnyzTDuTSd4OIhcRoDwXNtceaX6dOq8mR7HP5c3Us/g45FzQBQXzHJGBaOM0WPNFDvldloJ
	EjIX9CXvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRxWp-0001hy-BV; Mon, 12 Oct 2020 13:06:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRxWj-0001ff-93
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 13:06:13 +0000
X-UUID: eed60e35fdd84585a9dc1da894fd42f6-20201012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=j6qJ68jsAKbZ9YKXS9Job211qshOB/7LgiFTP2KAISw=; 
 b=jH5xnQkZmfBYhW2z5fhNWEMBnlvjXpd5DqHBWrpZPZpUHCLnSdMHxbx4pITVcIgtJWwcc/G6x4pKYkoO/kvBhxpEljOgj6PnJd4G1qDCmWPsiNrOjaM/ECCzZKX5MIAAfuVpMrrLFOW21ECLkP9xDieFteTLx1bK+A/v2v32M6M=;
X-UUID: eed60e35fdd84585a9dc1da894fd42f6-20201012
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1412243777; Mon, 12 Oct 2020 05:06:08 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 05:56:05 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 20:55:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 12 Oct 2020 20:55:57 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v3 10/10] mt76: mt7915: add support to set tx frequency offset
 in testmode
Date: Mon, 12 Oct 2020 20:54:03 +0800
Message-ID: <20201012125403.8608-10-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201012125403.8608-1-shayne.chen@mediatek.com>
References: <20201012125403.8608-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_090609_521983_D0221F30 
X-CRM114-Status: GOOD (  13.67  )
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

Support to set tx frequency offset in testmode, which is usally used in
the pre-calibration stage.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 20 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7915/testmode.h  |  6 ++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 89453a6..60c5f1b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -49,6 +49,7 @@ enum {
 enum {
 	MCU_ATE_SET_TRX = 0x1,
 	MCU_ATE_SET_RX_FILTER = 0x3,
+	MCU_ATE_SET_FREQ_OFFSET = 0xa,
 };
 
 struct mt7915_mcu_rxd {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index 7cfb688..9aedae0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -8,6 +8,7 @@
 
 enum {
 	TM_CHANGED_TXPOWER,
+	TM_CHANGED_FREQ_OFFSET,
 
 	/* must be last */
 	NUM_TM_CHANGED
@@ -15,6 +16,7 @@ enum {
 
 static const u8 tm_change_map[] = {
 	[TM_CHANGED_TXPOWER] = MT76_TM_ATTR_TX_POWER,
+	[TM_CHANGED_FREQ_OFFSET] = MT76_TM_ATTR_FREQ_OFFSET,
 };
 
 struct reg_band {
@@ -81,6 +83,19 @@ mt7915_tm_set_tx_power(struct mt7915_phy *phy)
 	return ret;
 }
 
+static int
+mt7915_tm_set_freq_offset(struct mt7915_dev *dev, bool en, u32 val)
+{
+	struct mt7915_tm_cmd req = {
+		.testmode_en = en,
+		.param_idx = MCU_ATE_SET_FREQ_OFFSET,
+		.param.freq.freq_offset = cpu_to_le32(val),
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_ATE_CTRL, &req,
+				 sizeof(req), false);
+}
+
 static int
 mt7915_tm_mode_ctrl(struct mt7915_dev *dev, bool enable)
 {
@@ -247,6 +262,11 @@ mt7915_tm_set_rx_frames(struct mt7915_dev *dev, bool en)
 static void
 mt7915_tm_update_params(struct mt7915_dev *dev, u32 changed)
 {
+	struct mt76_testmode_data *td = &dev->mt76.test;
+	bool en = dev->mt76.test.state != MT76_TM_STATE_OFF;
+
+	if (changed & BIT(TM_CHANGED_FREQ_OFFSET))
+		mt7915_tm_set_freq_offset(dev, en, en ? td->freq_offset : 0);
 	if (changed & BIT(TM_CHANGED_TXPOWER))
 		mt7915_tm_set_tx_power(&dev->phy);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
index b344a64..39d4d2e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
@@ -11,6 +11,11 @@ struct mt7915_tm_trx {
 	u8 rsv;
 };
 
+struct mt7915_tm_freq_offset {
+	u8 band;
+	__le32 freq_offset;
+};
+
 struct mt7915_tm_rx_filter {
 	u8 promiscuous;
 	u8 report_en;
@@ -27,6 +32,7 @@ struct mt7915_tm_cmd {
 	union {
 		__le32 data;
 		struct mt7915_tm_trx trx;
+		struct mt7915_tm_freq_offset freq;
 		struct mt7915_tm_rx_filter filter;
 		u8 test[72];
 	} param;
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
