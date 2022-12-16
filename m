Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3B2C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 02:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=23KUXDJdBgZTEKi7SidofKO0o5BuEsUkq/IELsxruIQ=; b=lJ4btiA3YP0jubB/frRPN0Zc4n
	mbFdBvQ4iQvFguHOt5lBknb3sLiktckXHJrp2PFln1NaRFN4FGN8zshvY40m4Ph0VfH4O8MmhJu+L
	6BxnFPS4d2dQZPxr6OpzQgUjbmMcrVTFOIVrv1Xif8u/hbBR+kdDPQCrJ3BvclLpjYFW9dMjK/0L+
	D2j0d6HrV/gYFt2eeepWWTiPuZStBB+FJufUFFRiT89a5ui/i442uZINrmzRUGC5gjHlZyKnRQqbk
	aDCf/HSsH27we5D3Xmb2x4c4fE+O5QAMZYd/hI6K0NhpZkC+e7eJO/03s1c1vA3kkOO6iTMT8ahYS
	iLxDsp8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p60Uf-00CPnE-MB; Fri, 16 Dec 2022 02:30:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p60Ub-00CPlu-3e
	for linux-mediatek@lists.infradead.org; Fri, 16 Dec 2022 02:30:34 +0000
X-UUID: 22da98ae26fe4f78a653e559a5c5644d-20221215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=23KUXDJdBgZTEKi7SidofKO0o5BuEsUkq/IELsxruIQ=;
	b=qRrxCiWkx3i2ubrhFInjJ2xigOxzFNKhEqfGYYWyK++R2kfMJcmjqaPIz1bEUQfs9jr/1c7jcsNfH2Qc9Ql9tjlFxZD0fGybjySwzlzzgkLfNSoQwlA1lpU4xH8U1dSNXURqBZPjNWhFbzc/iUZLWLoA+LAYBplBwFJb0K3iySA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:f81f30de-ecdc-41e9-953b-2977f6e312e7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:c497c9af-9f02-4d44-9c44-6e4bb4e4f412,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 22da98ae26fe4f78a653e559a5c5644d-20221215
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <bo.jiao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 420945893; Thu, 15 Dec 2022 19:30:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 16 Dec 2022 10:30:00 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Dec 2022 10:29:59 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
	<ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Bo Jiao
	<Bo.Jiao@mediatek.com>
Subject: [PATCH] wifi: mt76: fix potential memory leakage
Date: Fri, 16 Dec 2022 10:29:55 +0800
Message-ID: <c663e984077ae903d8d4d34ed470986c6ccb4757.1671157658.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_183033_177073_87217EC7 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bo Jiao <Bo.Jiao@mediatek.com>

fix potential memory leakage, recycle rxwi when mt76_dma_add_buf() call fails.

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index fc24b35..9053344 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -592,6 +592,7 @@ mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_queue *q)
 		qbuf.len = len - offset;
 		qbuf.skip_unmap = false;
 		if (mt76_dma_add_buf(dev, q, &qbuf, 1, 0, buf, t) < 0) {
+			mt76_put_rxwi(dev, t);
 			dma_unmap_single(dev->dma_dev, addr, len,
 					 DMA_FROM_DEVICE);
 			skb_free_frag(buf);
-- 
2.18.0


