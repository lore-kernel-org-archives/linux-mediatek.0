Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5A0CA100C
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fpv1SoLY/N77JkIb142ZPgXdcdlyIxxhftHl3vgHLBI=; b=i04boczmGifZ/OlDxZqJKZLgCS
	12nPU6Hmb00Z5GQE/Cuq+Nrlq4fremSPWWkffwDIn2gxs2jrEJ9wbwmEVZaTykNJXPpmYB92fepZ3
	ATzAvSF4RbAlqQ+UBz53Mx5kW3nT8udcqvwuy/WY9Mn5lbAKKilWA35jPVW1EvbddTrlUiIggrkt9
	o271jFBMUFCkWE5FZr5ZrqnZJANLmvRbI9BwazZGgpMfDzoj1MHJNj5VEy5qC/ri0v01+lJ8t4uCA
	6I5i38bbNqbdHZkOpkkCz628N2um0aKL0HbOyyhZsFdZ72dopTVw7VF60S/SJ3h/9X9UYGUIkpn2M
	YjZhiQPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFGK-0000000EYZQ-01Zq;
	Tue, 02 Sep 2025 00:52:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utBbg-0000000DtGw-302i;
	Mon, 01 Sep 2025 20:58:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05F4F44CE7;
	Mon,  1 Sep 2025 20:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89354C4CEF0;
	Mon,  1 Sep 2025 20:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756760307;
	bh=W6N68IbV0jiwtH3MAFqH+TY6TjH35pe5n2zoPQK40aQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QOpYCgvfSGepSbGpUdTTjQGO67nTfgPMz+YnpSz7rN+eVNw2q+jiKKy8Z3qcSKHI9
	 omRE9CCusBBxyTnckKXEatOoGBWxaAXoLTj/wI0QNbaIRNJ7t4nvOpTwQwnS0vZjoW
	 MSR7O7cfPmJzlil5P6yt3QBJa35+V0Afls60WEK8VwJ1x8RzbVF5QjrBeuWWS3edWu
	 hGmer9G9BjzMNuzMFDndm6IKFw9ZVQCz+fEqv8lYgy5RJH+keDOFu9Qku/cnpFoq50
	 jCTPV7+BoZBWDgYupKwYVeFs+kaWgorUQ6TxRkOJRwbZykBT7mGfwa2maln8CWsR68
	 N/myA5/ytyNUA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 01 Sep 2025 22:57:58 +0200
Subject: [PATCH mt76 v2 02/14] wifi: mt76: Remove q->ndesc check in
 mt76_dma_rx_fill()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-mt7996-rro-rework-v2-2-1f95086b51d1@kernel.org>
References: <20250901-mt7996-rro-rework-v2-0-1f95086b51d1@kernel.org>
In-Reply-To: <20250901-mt7996-rro-rework-v2-0-1f95086b51d1@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_135828_778994_6FB1F5C0 
X-CRM114-Status: UNSURE (   7.73  )
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
2.50.1


