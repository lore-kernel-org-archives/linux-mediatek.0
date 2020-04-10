Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45ADC2D0EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 22:51:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B26C22084D
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 22:51:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XOR4J/SZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q6tpyfkY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B26C22084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4eZWSDW4kx3W6v0KSco6KHTaWqBjOqc3WpHyYfiVuN0=; b=XOR4J/SZuEjrkG
	UIMSiBKXhtQbnnFC2HAuvQS9FV2Tcj61svlW0SZME6lWTKFVdHpUENYT3DGtm40Jco+Kz/MXkuR45
	129SyDtqXG3x7pqLjk36AfaROOHcDTZ9n/uDEWwBEe/dqOzA4BF7xraOEDo33cPNIBholsYOuVd3i
	iSu1NTKwZmuwUXKeKxOgbXxU2t4HGUs75/Nu3q0mMro5/ipNDCamn/oFBmwABmxNYsFAtsva+ZmwB
	lKYLfdMsTYAaWvtmUlZApEzEZsp0xHySm4d60eh1FlurtI4xk1SwJ/btE11eyHqRwtZeaGn2HBl8a
	lfPHcB4BefpB/2yavF6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jN2V4-0002sm-Dl; Fri, 10 Apr 2020 22:51:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jN2V0-0002s2-Qs
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 22:51:48 +0000
X-UUID: bc2d36a3aadf4c85b8f471190723904f-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=w7xtRv8vlqO5EQ+J2L0Cx4x5jxri0BXKTgW3PSYCHdw=; 
 b=Q6tpyfkYQbzG18trtRMiWzJzreDjcR8PUV9NBp0YyDCxMsVcBMzvIsaLkP0K9+4uYpt2L+KNgN2KQJwFTE/HJd+Fn1TshckQkW3RkxoupTCQGEAUX1oXfzzWs1lfHfCEvgBjESKLpX7lHHAJn6A/jRHSdThdfTplM/jFZsD/uWQ=;
X-UUID: bc2d36a3aadf4c85b8f471190723904f-20200410
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1320509772; Fri, 10 Apr 2020 14:51:41 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 15:51:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Apr 2020 06:51:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Apr 2020 06:51:33 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v1 01/16] mt76: avoid rx reorder buffer overflow
Date: Sat, 11 Apr 2020 06:51:16 +0800
Message-ID: <749e0b262ffe77a854d9d78b6eb833db77c96541.1586558901.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586558901.git.ryder.lee@mediatek.com>
References: <cover.1586558901.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_155146_882178_A26E4366 
X-CRM114-Status: UNSURE (   7.15  )
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

Enlarge slot to support 11ax 256 BA (256 MPDUs in an AMPDU)

Signed-off-by: Chih-Min Chen <chih-min.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/agg-rx.c | 8 ++++----
 drivers/net/wireless/mediatek/mt76/mt76.h   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
index f77f03530259..acdbe6f8248d 100644
--- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
+++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
@@ -152,8 +152,8 @@ void mt76_rx_aggr_reorder(struct sk_buff *skb, struct sk_buff_head *frames)
 	struct ieee80211_sta *sta;
 	struct mt76_rx_tid *tid;
 	bool sn_less;
-	u16 seqno, head, size;
-	u8 ackp, idx;
+	u16 seqno, head, size, idx;
+	u8 ackp;
 
 	__skb_queue_tail(frames, skb);
 
@@ -239,7 +239,7 @@ void mt76_rx_aggr_reorder(struct sk_buff *skb, struct sk_buff_head *frames)
 }
 
 int mt76_rx_aggr_start(struct mt76_dev *dev, struct mt76_wcid *wcid, u8 tidno,
-		       u16 ssn, u8 size)
+		       u16 ssn, u16 size)
 {
 	struct mt76_rx_tid *tid;
 
@@ -264,7 +264,7 @@ EXPORT_SYMBOL_GPL(mt76_rx_aggr_start);
 
 static void mt76_rx_aggr_shutdown(struct mt76_dev *dev, struct mt76_rx_tid *tid)
 {
-	u8 size = tid->size;
+	u16 size = tid->size;
 	int i;
 
 	spin_lock_bh(&tid->lock);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e31d98a4f88f..36fe163889b8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -244,8 +244,8 @@ struct mt76_rx_tid {
 	struct delayed_work reorder_work;
 
 	u16 head;
-	u8 size;
-	u8 nframes;
+	u16 size;
+	u16 nframes;
 
 	u8 num;
 
@@ -794,7 +794,7 @@ int mt76_get_survey(struct ieee80211_hw *hw, int idx,
 void mt76_set_stream_caps(struct mt76_dev *dev, bool vht);
 
 int mt76_rx_aggr_start(struct mt76_dev *dev, struct mt76_wcid *wcid, u8 tid,
-		       u16 ssn, u8 size);
+		       u16 ssn, u16 size);
 void mt76_rx_aggr_stop(struct mt76_dev *dev, struct mt76_wcid *wcid, u8 tid);
 
 void mt76_wcid_key_setup(struct mt76_dev *dev, struct mt76_wcid *wcid,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
