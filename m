Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D3BCFC274
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 08:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y+olST8w9L1bmQWPvzyB/DLsZjm8Pf3Fnd+REUY4aOQ=; b=0cjqzGR0APvLvlnu53474Od+Sh
	/bZsSmxQGYAsuDNyDXprx30xe9CThaymRlHXIGmIipPftEO9887tRQFHT//XxLuZo8SmX9Xq2aCyj
	cdQzsQbsodTcXXykoeCG0J6zlV9ZAi1B3eggNchMbkMnn6ikMqbE7wLIsrvr8BRxTrU4OGNQtWmqM
	w0vOdv8uqdg7Jz0XpfJbuEBFDx/D0jbiFQ1ggeHXoLdwEGNgDRIheKyw0Id7QmmDk+i7p0jFJs4bV
	slRWrtamtv+4OBjCM2kdy17+gnlAJ2SmuAneoXq6Hs4o4lHtGMBhNc7Zuu6a12IBNYHdK4EWrHjAM
	l4RMA7gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0clf-00000007UBN-2Qt0;
	Tue, 15 Oct 2024 08:18:59 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0clD-00000007TzG-397c;
	Tue, 15 Oct 2024 08:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=y+olST8w9L1bmQWPvzyB/DLsZjm8Pf3Fnd+REUY4aOQ=; b=XB+ebulVCajAqXaxMgX/MKVrqq
	lA7o3FZP43feVJV9Ul2yrWBLfPf9RjMpY7QIOLjcf+i+/nUyiV9H1KRUEA+vdYzjEO12BCJZd16np
	tX5dL4xQIMjTeCur1G3N6g7q7F6FJqD8Wv5pNoXTuzjFu1rI7llYzM15DxOGsGLw7Grs=;
Received: from p54ae9bfc.dip0.t-ipconnect.de ([84.174.155.252] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1t0ckm-0091io-0H;
	Tue, 15 Oct 2024 10:18:04 +0200
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: ethernet: mtk_eth_soc: fix memory corruption during fq dma init
Date: Tue, 15 Oct 2024 10:17:55 +0200
Message-ID: <20241015081755.31060-1-nbd@nbd.name>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_011831_900309_CEC8EE8B 
X-CRM114-Status: GOOD (  12.58  )
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

The loop responsible for allocating up to MTK_FQ_DMA_LENGTH buffers must
only touch as many descriptors, otherwise it ends up corrupting unrelated
memory. Fix the loop iteration count accordingly.

Fixes: c57e55819443 ("net: ethernet: mtk_eth_soc: handle dma buffer size soc specific")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 16ca427cf4c3..ed7313c10a05 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1171,7 +1171,7 @@ static int mtk_init_fq_dma(struct mtk_eth *eth)
 		if (unlikely(dma_mapping_error(eth->dma_dev, dma_addr)))
 			return -ENOMEM;
 
-		for (i = 0; i < cnt; i++) {
+		for (i = 0; i < len; i++) {
 			struct mtk_tx_dma_v2 *txd;
 
 			txd = eth->scratch_ring + (j * MTK_FQ_DMA_LENGTH + i) * soc->tx.desc_size;
-- 
2.47.0


