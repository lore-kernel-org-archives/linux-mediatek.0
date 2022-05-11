Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49B8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 23:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0NUGcR1A1QEdzkWucikMvRVFOY1mO5KBoNQe9fGu8pc=; b=bLShYk0BBx6EsF
	e493QLsPzGVTHkRbDiXLOcDvZgHjWwA0Z7wmRXB/bb2pX0+9oDuPVh/1rInM6NSZsW/+rCVZuXAk9
	SnrLLhLenKvO/nBCZR2uZb/HnCVpWRVKfGsBeEBQuwEErxHl+8m8nEyNMYo644/pk8y4K8BYLJphD
	wH2RuyKsEEWGrl46378lhgq5JgKc4qdx5C7iCmM4CT7PD8HIBA042iYmbaXTszYKUdmM78dLDDUOg
	EX9oOCVQSx51icKrxnaS3MR31J8PfLLTMEEFWjKECHBhPr3knga5u3QtsOKFTVIhdw0vjccfFytXR
	t63a8F83/fnt4t+S9N/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1novPt-008yff-5E; Wed, 11 May 2022 23:06:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1novPq-008yeu-Th
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 23:06:48 +0000
X-UUID: a49e65872ef94833aff68070a7c87a0c-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:8ae729e5-7e6e-4df2-94cb-b389bf5b7be9, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-15
X-CID-META: VersionHash:faefae9, CLOUDID:cb4d24e6-38f2-431d-8de7-bf8fac490b0a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a49e65872ef94833aff68070a7c87a0c-20220511
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1914087446; Wed, 11 May 2022 16:06:41 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 16:06:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 07:06:37 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 12 May 2022 07:06:37 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v2 1/2] mt76: add gfp to mt76_mcu_msg_alloc signature
Date: Thu, 12 May 2022 07:06:35 +0800
Message-ID: <51d96f159ec37c2610d3c444177508ffc7781e2c.1652310294.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_160647_002348_27616B31 
X-CRM114-Status: GOOD (  10.36  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

Introduce __mt76_mcu_msg_alloc utility routine in order to specify gfp
flags for mcu message allocation.

Acked-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
v2: new created
---
 drivers/net/wireless/mediatek/mt76/mcu.c  | 8 ++++----
 drivers/net/wireless/mediatek/mt76/mt76.h | 9 ++++++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 3f94c37251df..914ee278e6e2 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -6,14 +6,14 @@
 #include "mt76.h"
 
 struct sk_buff *
-mt76_mcu_msg_alloc(struct mt76_dev *dev, const void *data,
-		   int data_len)
+__mt76_mcu_msg_alloc(struct mt76_dev *dev, const void *data,
+		     int data_len, gfp_t gfp)
 {
 	const struct mt76_mcu_ops *ops = dev->mcu_ops;
 	int length = ops->headroom + data_len + ops->tailroom;
 	struct sk_buff *skb;
 
-	skb = alloc_skb(length, GFP_KERNEL);
+	skb = alloc_skb(length, gfp);
 	if (!skb)
 		return NULL;
 
@@ -25,7 +25,7 @@ mt76_mcu_msg_alloc(struct mt76_dev *dev, const void *data,
 
 	return skb;
 }
-EXPORT_SYMBOL_GPL(mt76_mcu_msg_alloc);
+EXPORT_SYMBOL_GPL(__mt76_mcu_msg_alloc);
 
 struct sk_buff *mt76_mcu_get_response(struct mt76_dev *dev,
 				      unsigned long expires)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index dc0f1b0aa34a..4e8997c45c1b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1345,8 +1345,15 @@ int mt76s_rd_rp(struct mt76_dev *dev, u32 base,
 		struct mt76_reg_pair *data, int len);
 
 struct sk_buff *
+__mt76_mcu_msg_alloc(struct mt76_dev *dev, const void *data,
+		     int data_len, gfp_t gfp);
+static inline struct sk_buff *
 mt76_mcu_msg_alloc(struct mt76_dev *dev, const void *data,
-		   int data_len);
+		   int data_len)
+{
+	return __mt76_mcu_msg_alloc(dev, data, data_len, GFP_KERNEL);
+}
+
 void mt76_mcu_rx_event(struct mt76_dev *dev, struct sk_buff *skb);
 struct sk_buff *mt76_mcu_get_response(struct mt76_dev *dev,
 				      unsigned long expires);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
