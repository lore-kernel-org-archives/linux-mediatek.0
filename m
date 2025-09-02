Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131C0CA100F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Sep 2025 00:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65sfH/ad84nrJwQJ1pdXZCCcEwu4ZVnR+CKSuX7QrWI=; b=s/wR+49pKn0324w2N/8Bg6QMvi
	I79xO9w8wO9VSqozMx0vV+J3OD10kDSHy6TPNUY/7zGkee8OlQfDOTpMONwgEpevJheLgtasoStgg
	DAp6/6ovl7PBD5+G435iY//mictS95X6e9nOWk0tBbaN16VyNp3pnQg3gC2nBtS9z05n66JIqtyEE
	+kGVGNqfajKLz59rzc5zdiRSWsvg/IZBvhipiLi07eaTD5ZM+/xJNKe9Uwo2eUms178NvJpWTA3CL
	YTMBvdTgp7tkvoRjjWGVs99x1yQ+q5pSL3qSdgV/F/TKQE8IqlIMAUvvZFejrGcGG0ytcjOhFFV3y
	gzquUfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbc2-00000002owF-0xwJ;
	Wed, 03 Sep 2025 00:44:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWWJ-00000001gaE-1jC1;
	Tue, 02 Sep 2025 19:18:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 686BB60007;
	Tue,  2 Sep 2025 19:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE36C4CEED;
	Tue,  2 Sep 2025 19:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756840698;
	bh=jtgRLf0FRRSizIapqgfH1YFeyTX28uqo02yIy46q7Po=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nuxYmlWGRH7w9WvT0rhVg9y8/iR0d2ac2YOcCxERdFEjgSVol5JNMoHznQSBrtsvJ
	 bkeoQIYadceH9fKZGdOvW5KdVd2cu/4k7xH24NLX+yKi/hJd14VTbBbQBA57z5kSTl
	 SepTnIoLL5NJOzwAEghxbledxFHN7cNLvZ//El0wnFwX9yYtfDnim7D5/wW0d5BJEz
	 274kYdmN0ohhrFbMNsZAT72P+cQXltDPTotIz2sYhxFhaZPjW2/9UHESYJHN3BdoMn
	 Pd2an0k39kTzP9cvsPZaLgn5Hn7vJ3k+dbkwymqT4n8DWp2BNsCvHkR4d5e4gRZZjO
	 /Yte6+8xvSnQw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 02 Sep 2025 21:17:54 +0200
Subject: [PATCH mt76 v3 04/15] wifi: mt76: Do not always enable NAPIs for
 WED RRO queues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-mt7996-rro-rework-v3-4-8f813890959e@kernel.org>
References: <20250902-mt7996-rro-rework-v3-0-8f813890959e@kernel.org>
In-Reply-To: <20250902-mt7996-rro-rework-v3-0-8f813890959e@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
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

Do not initialize NAPIs for WED RRO queues if WED is active.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 68b1dd1dbbe0e2b4850e02ee70253b5e248c69bf..f882b4e10858a233a5422ede80d79c21965136e9 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -967,6 +967,10 @@ mt76_dma_init(struct mt76_dev *dev,
 	init_completion(&dev->mmio.wed_reset_complete);
 
 	mt76_for_each_q_rx(dev, i) {
+		if (mtk_wed_device_active(&dev->mmio.wed) &&
+		    mt76_queue_is_wed_rro(&dev->q_rx[i]))
+			continue;
+
 		netif_napi_add(dev->napi_dev, &dev->napi[i], poll);
 		mt76_dma_rx_fill_buf(dev, &dev->q_rx[i], false);
 		napi_enable(&dev->napi[i]);

-- 
2.50.1


