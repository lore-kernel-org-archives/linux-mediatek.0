Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B402FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oF+ZCi/gfPs3/Nz2ijNXFVWbYQXkVr5i2T4p3FyVqBA=; b=FxUD1PiQGAcqdB
	KO0HsIPA2eo69IFPdDpf0dFQqbtBDyPfmapjIq33tLNkz6EqMQZ4q+AdbbchbMYOIZ4HvLlZ95vyT
	07ZAtWzVuVboGBbFCsqrmBNzqpvJuOf/ehvwV+tbebIUE1thtcAusvjes9uyH088Cohf7c6FmPdKK
	F++g2tSQSsw+XuTSdvjn35Wr20vh8rNNNCxi4e5WKUQ8Z3xLM321JdPMW+QYG1kHSOF/reeuWdCBW
	tkTL/c5WpCjS8sxBpDBXDAIQSm2nXsOOEGkTJqNIvPGr5eTC0Ivhe0BmH2GpTXCFQQU06/d4ItT1N
	Epbs+p7pV2PGk/VSpkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Fy0-00GCAf-CL; Tue, 11 Jan 2022 12:09:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Fxx-00GC9F-Bj
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 12:09:30 +0000
X-UUID: 405213407d8446e59758f4f1cf899b0e-20220111
X-UUID: 405213407d8446e59758f4f1cf899b0e-20220111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1699508360; Tue, 11 Jan 2022 05:09:27 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 03:59:27 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 11 Jan 2022 19:59:25 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 11 Jan 2022 19:59:25 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v2 2/5] mt76: redefine mt76_for_each_q_rx to adapt mt7986
 changes
Date: Tue, 11 Jan 2022 19:59:18 +0800
Message-ID: <16ea7aa40bf245d69a09b8ad1620044aca716b43.1641901681.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1641901681.git.Bo.Jiao@mediatek.com>
References: <cover.1641901681.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_040929_433470_CD034C61 
X-CRM114-Status: GOOD (  11.14  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

Check ndesc of q_rx to avoid potential hole in iteration.
This is an intermediate patch to add mt7986 support.

Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2:
- redefine mt76_for_each_q_rx().
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 14f60fc..af6f9fc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -899,8 +899,8 @@ static inline u16 mt76_rev(struct mt76_dev *dev)
 #define mt76_queue_reset(dev, ...)	(dev)->mt76.queue_ops->reset_q(&((dev)->mt76), __VA_ARGS__)
 
 #define mt76_for_each_q_rx(dev, i)	\
-	for (i = 0; i < ARRAY_SIZE((dev)->q_rx) && \
-		    (dev)->q_rx[i].ndesc; i++)
+	for (i = 0; i < ARRAY_SIZE((dev)->q_rx); i++)	\
+		if ((dev)->q_rx[i].ndesc)
 
 struct mt76_dev *mt76_alloc_device(struct device *pdev, unsigned int size,
 				   const struct ieee80211_ops *ops,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
