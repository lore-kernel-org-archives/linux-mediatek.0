Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595E1C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xd7Aj3QfwWeKkzst+rHFWDcFclv4IoTJZ5VvgknvJc0=; b=NMh1rX20JR1IGG
	n6QtJqNf1SiPDK+Yk+AjGkFOcUBdlzbwMgPLnPhhrCxuBjNFmW9/xNUCvlhZ5xLVCRas9WLl9TcBL
	yle8jSNL7tRx5tdl3zFxl9aG30vQuRo7uO1cy7CO0YlG4N4u6d6D0UGZ/ilqxAePEplOLNoEIQWEH
	Pg0aWD/YB509bUaZzFtKd9KP0UdebO0r0v0pTdEMz5F0XkawMPb8/6Z3UgBffbW6sU/vXffBdJXZT
	h712Nz2AK7caZiiSkQrxfAIC68q6km6loqOc+vVwHhAuXMJe8iZCS/7xC3b2ZDM4Xi1f8/vwKLC4p
	Wc2PUxnxM10SihpqFkAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ByH-00FCVj-KY; Tue, 11 Jan 2022 07:53:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7ByB-00FCRc-Uj
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 07:53:29 +0000
X-UUID: c6b990de67c4414d9466553ddf0b0625-20220111
X-UUID: c6b990de67c4414d9466553ddf0b0625-20220111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 183209247; Tue, 11 Jan 2022 00:53:22 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 23:51:15 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 11 Jan 2022 15:51:13 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 11 Jan 2022 15:51:13 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH 2/5] mt76: rework dma.c to adapt mt7986 changes
Date: Tue, 11 Jan 2022 15:51:05 +0800
Message-ID: <73fb8a688cfa53e030492f344f72ef64b4167a36.1641886298.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <351271a274dc236f027c58487df6b21c7dbf9fd0.1641886298.git.Bo.Jiao@mediatek.com>
References: <351271a274dc236f027c58487df6b21c7dbf9fd0.1641886298.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_235328_052714_2D522C7B 
X-CRM114-Status: GOOD (  10.86  )
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
 drivers/net/wireless/mediatek/mt76/dma.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index fd4c51b..83f045a 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -660,10 +660,12 @@ mt76_dma_init(struct mt76_dev *dev,
 		 wiphy_name(dev->hw->wiphy));
 	dev->napi_dev.threaded = 1;
 
-	mt76_for_each_q_rx(dev, i) {
-		netif_napi_add(&dev->napi_dev, &dev->napi[i], poll, 64);
-		mt76_dma_rx_fill(dev, &dev->q_rx[i]);
-		napi_enable(&dev->napi[i]);
+	for (i = 0; i < ARRAY_SIZE(dev->q_rx); i++) {
+		if (dev->q_rx[i].ndesc) {
+			netif_napi_add(&dev->napi_dev, &dev->napi[i], poll, 64);
+			mt76_dma_rx_fill(dev, &dev->q_rx[i]);
+			napi_enable(&dev->napi[i]);
+		}
 	}
 
 	return 0;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
