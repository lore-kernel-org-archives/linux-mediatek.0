Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1998C636D3
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Feb 2023 06:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RJdKgApzExava2yzmGGZ4f7XbHFq1+CyNPUaliExuYY=; b=AoudEbnXJ+0fwOOM+RCHgQNvmf
	3rh4eWkPkwY6sWZheg+CEA4sUaGJ7mt8KDhptk4+XMdavdXpBkZlMcXmvz3G44YTp4yyMVypep4qD
	RvfuIzmepvaw0+sXm6QzIGbks2JiYBdZxG+4rAqntbXMGiSoUAfnQv1CTxaCVwHFToeE4yG4BZJs2
	EbvsH7s3/BQ2jjF93klgvVb4F2uYZ4MI9venc0vIDDKJ3ImFSXHG7kROz28RK+AeZ2cxgCFpy9DtC
	PWqJVV2d4XC5iqKW2EmWqRJ2N3c94nJUf34mtMvviNesHnWBdcsmut3/c/5oqxXDsPkiix4IyTwhX
	O2saMdQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR6Dl-00B0bD-Bh; Sun, 12 Feb 2023 06:52:21 +0000
Received: from smtp-18.smtpout.orange.fr ([80.12.242.18] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR6DY-00B0Zo-Uq
	for linux-mediatek@lists.infradead.org; Sun, 12 Feb 2023 06:52:11 +0000
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id R6DPpfF8cfKYFR6DPpGS8u; Sun, 12 Feb 2023 07:52:03 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 12 Feb 2023 07:52:03 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] net: ethernet: mtk_wed: No need to clear memory after a dma_alloc_coherent() call
Date: Sun, 12 Feb 2023 07:51:51 +0100
Message-Id: <d5acce7dd108887832c9719f62c7201b4c83b3fb.1676184599.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_225209_151589_D8E4F7C6 
X-CRM114-Status: UNSURE (   9.80  )
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

dma_alloc_coherent() already clears the allocated memory, there is no need
to explicitly call memset().

Moreover, it is likely that the size in the memset() is incorrect and
should be "size * sizeof(*ring->desc)".

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 95ac4f71d2b2..95d890870984 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -787,7 +787,6 @@ mtk_wed_rro_ring_alloc(struct mtk_wed_device *dev, struct mtk_wed_ring *ring,
 
 	ring->desc_size = sizeof(*ring->desc);
 	ring->size = size;
-	memset(ring->desc, 0, size);
 
 	return 0;
 }
-- 
2.34.1


