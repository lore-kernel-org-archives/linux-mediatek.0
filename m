From: Weitao Hou <houweitaoo@gmail.com>
Subject: [PATCH] net: fix typos in code comments
Date: Sun, 19 May 2019 11:09:23 +0800
Message-ID: <20190519030923.18343-1-houweitaoo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, royluo@google.com, kvalo@codeaurora.org, davem@davemloft.net, matthias.bgg@gmail.com
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Weitao Hou <houweitaoo@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

fix lenght to length

Signed-off-by: Weitao Hou <houweitaoo@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c b/drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c
index 6b89f7eab26c..e0f5e6202a27 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_usb_core.c
@@ -53,7 +53,7 @@ int mt76x02u_skb_dma_info(struct sk_buff *skb, int port, u32 flags)
 	pad = round_up(skb->len, 4) + 4 - skb->len;
 
 	/* First packet of a A-MSDU burst keeps track of the whole burst
-	 * length, need to update lenght of it and the last packet.
+	 * length, need to update length of it and the last packet.
 	 */
 	skb_walk_frags(skb, iter) {
 		last = iter;
-- 
2.18.0
