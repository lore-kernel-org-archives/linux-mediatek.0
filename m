Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392C9C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E945F2074D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:01:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TFrkAeOw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SWW7y5Bq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E945F2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gwjFtFkBRfYPlkOIfe+ZUBrwf5IMSchY16nPntQ2qo=; b=TFrkAeOwDPT4OR
	w2HVxfugw9xxfPmW7zGmmehk+cHQrBLRN0khklOPcgnj/anyfXK+5MBFNVc+r0zJ8Y+iYAqB9+gO0
	TkCvMK22/dOxb2DTKBTkPcS9nrjwgmztY9f/6Br9z3UYBNKTbCOFbd92YQQMHY5h+JpSRm0jkgqSd
	ARKCVnXZgwAMNeo7BBbkldSPyI+0FzqUYBziU0EOYShQh3hrDGalckQBf6nTfv96kPsNsi6K+SwR/
	hzYIUrlrFWgmDYTrQygGwerM8dB9/v3ybssEtTX5J0ZDpqZ9RZTiukiTVIPhJI2flzlAwYJVz0tMd
	nDYv78rrEsP6wimgKArQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOSgX-0007ky-Sa; Tue, 14 Apr 2020 21:01:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOSgR-0007cp-Nq
 for linux-mediatek@lists.infradead.org; Tue, 14 Apr 2020 21:01:29 +0000
X-UUID: f78c1d6f560445b2abfd52d68708faf1-20200414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qAGna+YzhJJ3zmJEB3vwmvVURvXGdm2yuKOFOs0b/Ko=; 
 b=SWW7y5BqjLuYXBtvx+mKJF71PguDFwqp9KFvYHFhRoFvYg1XSwty9apNzXRiIVFc6XZSTztXEuviRU1Y+zWqTyXW+pGp339IelxMb/zfRbvzaoVHj9tedr9/1p0taf9Hd/o8Pce/TfmfcDNjkr/J19Vy7ttvhwdGyHpELZCO1J0=;
X-UUID: f78c1d6f560445b2abfd52d68708faf1-20200414
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1958476096; Tue, 14 Apr 2020 13:01:26 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Apr 2020 14:01:20 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Apr 2020 05:01:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 15 Apr 2020 05:01:19 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 04/18] mt76: adjust wcid size to support new 802.11ax
 generation
Date: Wed, 15 Apr 2020 05:01:02 +0800
Message-ID: <a1b388851794afeb91dfb5657e5c2ec509d6028b.1586895593.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586895593.git.ryder.lee@mediatek.com>
References: <cover.1586895593.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 10945DA5F8B90E1D7C96CF7F0B49E204F0F33C170637F0C8C3CBECF1F7CCE00F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_140127_786037_04C35C1B 
X-CRM114-Status: UNSURE (   8.27  )
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
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The newer 802.11ax devices (i.e. MT7915E) can connect to much more
peers than previous generations.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 8d27af61b62e..b26a90fa5d92 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -181,7 +181,7 @@ enum mt76_wcid_flags {
 	MT_WCID_FLAG_PS,
 };
 
-#define MT76_N_WCIDS 128
+#define MT76_N_WCIDS 288
 
 /* stored in ieee80211_tx_info::hw_queue */
 #define MT_TX_HW_QUEUE_EXT_PHY		BIT(3)
@@ -201,7 +201,7 @@ struct mt76_wcid {
 	struct ewma_signal rssi;
 	int inactive_count;
 
-	u8 idx;
+	u16 idx;
 	u8 hw_key_idx;
 
 	u8 sta:1;
@@ -268,7 +268,7 @@ struct mt76_rx_tid {
 
 struct mt76_tx_cb {
 	unsigned long jiffies;
-	u8 wcid;
+	u16 wcid;
 	u8 pktid;
 	u8 flags;
 };
@@ -441,7 +441,7 @@ struct mt76_mmio {
 struct mt76_rx_status {
 	union {
 		struct mt76_wcid *wcid;
-		u8 wcid_idx;
+		u16 wcid_idx;
 	};
 
 	unsigned long reorder_time;
@@ -618,7 +618,7 @@ enum mt76_phy_type {
 #define mt76_hw(dev) (dev)->mphy.hw
 
 static inline struct ieee80211_hw *
-mt76_wcid_hw(struct mt76_dev *dev, u8 wcid)
+mt76_wcid_hw(struct mt76_dev *dev, u16 wcid)
 {
 	if (wcid <= MT76_N_WCIDS &&
 	    mt76_wcid_mask_test(dev->wcid_phy_mask, wcid))
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
