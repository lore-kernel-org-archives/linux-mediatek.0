Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E39CAC592
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivGOzrT8qC0L2IC9VkAyS9KFs5t5Pt53OrcEdaZqPDI=; b=Ag7mHNB3OGzjLkKkcSiuyysOME
	JI//z8DW0G1IMXZbYGHSjFdVyRGArhYE5H+fQuVQMeh5fRsoF8o1O+hdRh2k77hSviDIKAoNddQBt
	XQIuw4l9F8kXaIky8ijmEbdqjcOMA9Qd1+TlA8MjyDnN35pPLETaQutQqqdHtGMshnXik8QAKdDLN
	JilNrgPzrKZPrX08jpBCJvIAqu5Y9D/zxmScerBaQn8TQHSeFqHI94qLy39PYZS2tpRWI6oSnnZ4x
	ctxvQZBK3rWaSQCuRTY69d9tObHwMJKgnkfEtOsWJY/tTZ0C91V7BhEhjsAIt5bjfhQ4tVqaD2Qk3
	umnFVkFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1QA-00000008ajj-0IKq;
	Tue, 09 Sep 2025 16:42:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuun-000000065vU-2i1i;
	Tue, 09 Sep 2025 09:45:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 65CB443425;
	Tue,  9 Sep 2025 09:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E483AC4CEF4;
	Tue,  9 Sep 2025 09:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757411129;
	bh=Jp5wZrmPG3Ay7WaTm/T/7P4Kr9YN5jTWdIuMkNr5b/w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e0g7Ih2+8FHHLbL9Ra0lwCbT7tWWUlbMWoKNEWSmUMaTtsmEZJ8+WWm+9xW/OuSOW
	 u/DenXPbBMT2i5GV0kEVwn86vDpx4Q0qVLRk81g6AHN8uESqyxzBVscKL4NcrYx9dB
	 FS1IcC3ac1vc0P1k16Te41ymP0Xs0sDKYxQJnsCLJ7djIGmCbdML+eTh4rVnSI3ucS
	 NtuvEdQ49lzh4DkxLeeNwHBmq7btBbgRSDfUHCg5hcHOjpZsp55eCscUhzeu9BbUWS
	 lBGw3HVZYCAivaKA5uDaf4kwMO0d4sVmyNQAmXBWcJ/gkowruNZ1kBeRSxIwe0nNso
	 /Lb4MdxHEK5tA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 09 Sep 2025 11:45:10 +0200
Subject: [PATCH mt76 v5 02/16] wifi: mt76: Remove q->ndesc check in
 mt76_dma_rx_fill()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-mt7996-rro-rework-v5-2-7d66f6eb7795@kernel.org>
References: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
In-Reply-To: <20250909-mt7996-rro-rework-v5-0-7d66f6eb7795@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_024529_705620_351AB798 
X-CRM114-Status: UNSURE (   7.72  )
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

Remove q->ndesc check in mt76_dma_rx_fill routine since this is already
done in mt76_dma_rx_fill_buf().

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 25c26ff8c8e24352f2bb31c6e185e628a56f609b..18c2a2de59897d038392a00ed5fb5a0de188ac95 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -671,9 +671,6 @@ int mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_queue *q,
 {
 	int frames;
 
-	if (!q->ndesc)
-		return 0;
-
 	spin_lock_bh(&q->lock);
 	frames = mt76_dma_rx_fill_buf(dev, q, allow_direct);
 	spin_unlock_bh(&q->lock);

-- 
2.51.0


