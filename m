Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCFDE7070E
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HWhEI5bF5adz3evOG1ILv8baFb++nH/qKoP2lrOoMg=; b=mcrqpUlztpqeKImL31G4zw88V9
	+bx4bBHzW96yYa7UFttjlije81B3NhU/j92vaF7ZEtUTFOXpuuFkHULrPrLlZvBJ/B3ysZidqVz8C
	wtUH1/0RCyhvxXOZshNyajChgkYt2VAIMtKMXNCY+aQ1SwDdE6jjwuebPxWZ7CW/A5GeWqoKpFcXE
	eVlc7NIxf0bQTuaKBCuj/ln+tC/K4RQPA/UlO45cRezUpu5t4wzmvMeG3lupY8NLBAGctzfo85t/s
	8PwYstk3D8OudM4jcNha51tdua4PLs3O3YUJIjFBTFNP6gMRLQ5pYqVHr1xr1UZ22PHqMkh5QRsO9
	+Nsnb3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjHAU-005qmz-3D;
	Thu, 21 Sep 2023 10:44:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjHAO-005qkc-0S
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 10:44:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A0EDB61EBD;
	Thu, 21 Sep 2023 10:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC16FC36AF0;
	Thu, 21 Sep 2023 10:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695293055;
	bh=G3gltqhihnma9XLcjHfxtduXPoh5CUvLQuM3489vSHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MQ2ycQaFtgGAdDrF20v1nzk8A59rgJ0XnVBuFF/1pBzAxwG0HJp9w81t1l5DjwcC0
	 kzFKWVi7/H7nQEjC4WaC+SH7OgwoD1VuecAy6vDZ3GFSAehhDiG1Pt1Y3dDVRh7bOb
	 sriX1oZezAz+wp8E66hwAvc+H0bFFcOQUoOeqN9vE/iP8uMx3fhgztQGt20tUtws4/
	 hNGKae0eDy0uDQ4hyfGQhL44VBJAZqDKVbnrboHncV7pSFpsjbajtimUgFmJd2fwCV
	 XvfYB770y5h/FLRk04dAZSfyXrl5b/cFnZVW3zqiLsZGfU+IkL/e7nxboNUU0PvDkY
	 rRIgIO73N7cTQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: lorenzo.bianconi@redhat.com,
	linux-wireless@vger.kernel.org,
	ryder.lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	shayne.chen@mediatek.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 8/9] wifi: mt76: dma: introduce __mt76_dma_queue_reset utility routine
Date: Thu, 21 Sep 2023 12:43:37 +0200
Message-ID: <cffa9f25f1041a6a99b55fd703fd457064c8a823.1695292502.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695292502.git.lorenzo@kernel.org>
References: <cover.1695292502.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_034416_220161_18B7C5A5 
X-CRM114-Status: GOOD (  10.30  )
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

This is a preliminary patch to introduce WED support for mt7996

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index d615d5b1ad42..15923e1540d4 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -195,7 +195,8 @@ mt76_dma_sync_idx(struct mt76_dev *dev, struct mt76_queue *q)
 }
 
 static void
-mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q)
+__mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q,
+		       bool reset_idx)
 {
 	int i;
 
@@ -206,11 +207,19 @@ mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q)
 	for (i = 0; i < q->ndesc; i++)
 		q->desc[i].ctrl = cpu_to_le32(MT_DMA_CTL_DMA_DONE);
 
-	Q_WRITE(q, cpu_idx, 0);
-	Q_WRITE(q, dma_idx, 0);
+	if (reset_idx) {
+		Q_WRITE(q, cpu_idx, 0);
+		Q_WRITE(q, dma_idx, 0);
+	}
 	mt76_dma_sync_idx(dev, q);
 }
 
+static void
+mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q)
+{
+	__mt76_dma_queue_reset(dev, q, true);
+}
+
 static int
 mt76_dma_add_rx_buf(struct mt76_dev *dev, struct mt76_queue *q,
 		    struct mt76_queue_buf *buf, void *data)
-- 
2.41.0


