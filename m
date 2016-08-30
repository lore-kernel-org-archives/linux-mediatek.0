From: <sean.wang@mediatek.com>
Subject: [PATCH net v3 3/9] net: ethernet: mediatek: fix API usage with skb_free_frag
Date: Tue, 30 Aug 2016 10:59:19 +0800
Message-ID: <1472525965-10661-4-git-send-email-sean.wang@mediatek.com>
References: <1472525965-10661-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1472525965-10661-1-git-send-email-sean.wang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, keyhaede@gmail.com, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

use skb_free_frag() instead of legacy put_page()

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Acked-by: John Crispin <john@phrozen.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 33a890c..0f0072e 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -868,7 +868,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		/* receive data */
 		skb = build_skb(data, ring->frag_size);
 		if (unlikely(!skb)) {
-			put_page(virt_to_head_page(new_data));
+			skb_free_frag(new_data);
 			netdev->stats.rx_dropped++;
 			goto release_desc;
 		}
-- 
1.9.1
