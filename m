Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2D1C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 18:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXbdDUdJTVPnLMed7FxuAxPn2g+nDkyDpQXQdQsBD/Q=; b=xdkfT8pmSRp3xk
	rrOZEP1Z0lDWANzuVAxp1jzwQqhm09HUYm9w3V8Mg5wW02Ha+J5YlN2TagF1qiKaQgw7AIkhFm87n
	D3u/XJJRb17wzZRCSEDKfU8pbZv+rl+IZThnNBEbDvXC7P64gwwoK/J7tUiF7ayZet2IYvqphgboA
	es2n7xIqcXFTbg+45rpVRpf79Maa7sMfMxhRWlGiJtzKlkXU/hAgPeDUskYS6eZxPftrPp7AgjrdI
	cefctLym/ikyx/qIRv+TBhcHg3DcRd+8Gsm5C9Y/FvQ5QTcBuUu7dIW1gsLsg7QyLxxxTc5sAUYBL
	h++AUkvnom+AsWUlMM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns77h-00E1Ps-NT; Fri, 20 May 2022 18:13:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns77c-00E1Kk-LU
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 18:13:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4328760FF1;
 Fri, 20 May 2022 18:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD201C34100;
 Fri, 20 May 2022 18:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653070387;
 bh=517w0061VhT0H/2QvPkC4TTyfnG9lp0U3TLqta29KZ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mU4DXDIFZk/KjH0I05ydJghpxRix8vZ/C/1zWjsaIQz9EJsrKCrr2oBTG3R+A6VOl
 FF20FKhIU057fv4aou8hkX95C7Cu+TISGrv6EqffpI/WpLppIgef/L+qA4HpeYRXyQ
 XsCnyinlT8Fxf5C2jWpl6MKsBH8TOfrZyothyVh0yvt8gUGoApNGatO9MejkXzbAvt
 04HHSHcQwh4BGVBoBF5+75ihBo9TuGTXVSlR5/wU5qkaomoTS77JBQgu3Mxim9Wd/X
 Iv5SYAxwPRri8Ek8oyLiGieJP21R2cbEHrb8iYqkiAI+CuZCE/eqj2O58tuv4cn7vG
 IiC0IfYrl9tAw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v3 net-next 15/16] net: ethernet: mtk_eth_soc: convert
 scratch_ring pointer to void
Date: Fri, 20 May 2022 20:11:38 +0200
Message-Id: <830515be544d4106a52102c15da6e7df3d1e04ab.1653069056.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653069056.git.lorenzo@kernel.org>
References: <cover.1653069056.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_111308_764432_2843E715 
X-CRM114-Status: GOOD (  13.93  )
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
index 64c201e763c3..c034fd90dbdc 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -893,7 +893,7 @@ static int mtk_init_fq_dma(struct mtk_eth *eth)
 	for (i = 0; i < cnt; i++) {
 		struct mtk_tx_dma_v2 *txd;
 
-		txd = (void *)eth->scratch_ring + i * soc->txrx.txd_size;
+		txd = eth->scratch_ring + i * soc->txrx.txd_size;
 		txd->txd1 = dma_addr + i * MTK_QDMA_PAGE_SIZE;
 		if (i < cnt - 1)
 			txd->txd2 = eth->phy_scratch_ring +
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index f53024682698..67482124de2a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1033,7 +1033,7 @@ struct mtk_eth {
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
