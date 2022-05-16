Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A5FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtNrN1DOGNu437PstJYiNQ2Kraage6vBLnkVurGKe0w=; b=Vf1XBdH42gy9bP
	+GH2tkTSjJ3U+9ltC5BGEUM6ddzXKeizRZnQtANWL+bWu1dIf+pzY8YkyH2vBXGuiHHdudYpYl1AG
	Ii76jXdI+52VBVYd6fKclG5Ps8Qz+pLjF8EEKyQC0aYrQmeJwwdygsBUzf8qg3MMUaBoBgJDdm9jC
	S2/adZZxLLGFHG0LQFIx68XGvhpmMjlyYPKivqxR7X1ayp4HaxxuzYbkgGvIVZryrTFzs/lhz+veo
	UopKBL7T+kx+odkN7JUPqDNNqwOksGDegf7jWstp6ld4CmCTsdgnlMK0TiRY5OVqgcRlN9kf81Ib9
	6W8PHgpgdQJwYQGLXyTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdHg-008sNr-QY; Mon, 16 May 2022 16:09:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdGk-008rbM-FC
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 16:08:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1269360FF0;
 Mon, 16 May 2022 16:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA66C3411D;
 Mon, 16 May 2022 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652717305;
 bh=5zNfSJuhI4dXzdSVVXLUoVyHOoDat1Fm5kjHvHG5PMc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ks7uA+fl+FeuvZlHYmnKmrD776FtLfDc+fAM+Ost1IyAlSABNxHfoofa3zKXT9LQ5
 tHjloy/FGGR4BeMt0T4515mBuSQwpmxT3F7rWwBNp+WfhZVYVKlzQAP7TJP6fDNM5Z
 4h+6E5kYT3Kr3THRyexKYMRE44MNzk1J3iVYP2K26K1sJJ6veofoYJ/voG7/us68un
 2n9KM1rxzab8S002CdwjYGHo4Mgk2PG/u19zBZNHQoJguN7KYXVBNSa1SaHHicnMnx
 QBUYqqE7iUpZ8Fyg755PJJ/Q3InORUrYAO3Jmb9CtR56FseZNCaMZQF31ynzS+/17y
 TGKctzsfIW6wQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v2 net-next 14/15] net: ethernet: mtk_eth_soc: convert
 scratch_ring pointer to void
Date: Mon, 16 May 2022 18:06:41 +0200
Message-Id: <235146c3d8620deef0d831cbca76452776ca6a04.1652716741.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_090826_582390_1A9B9946 
X-CRM114-Status: GOOD (  14.10  )
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

Simplify the code converting scratch_ring pointer to void

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 4190172ba902..373d9733e66f 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -827,7 +827,7 @@ static int mtk_init_fq_dma(struct mtk_eth *eth)
 	for (i = 0; i < cnt; i++) {
 		struct mtk_tx_dma_v2 *txd;
 
-		txd = (void *)eth->scratch_ring + i * soc->txrx.txd_size;
+		txd = eth->scratch_ring + i * soc->txrx.txd_size;
 		txd->txd1 = dma_addr + i * MTK_QDMA_PAGE_SIZE;
 		if (i < cnt - 1)
 			txd->txd2 = eth->phy_scratch_ring +
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 57501dd5adcc..d955af42ad93 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1131,7 +1131,7 @@ struct mtk_eth {
 	struct mtk_rx_ring		rx_ring_qdma;
 	struct napi_struct		tx_napi;
 	struct napi_struct		rx_napi;
-	struct mtk_tx_dma		*scratch_ring;
+	void				*scratch_ring;
 	dma_addr_t			phy_scratch_ring;
 	void				*scratch_head;
 	struct clk			*clks[MTK_CLK_MAX];
-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
