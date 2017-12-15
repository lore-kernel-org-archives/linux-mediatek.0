From: <sean.wang@mediatek.com>
Subject: [PATCH v3 net-next 2/3] net: dsa: mediatek: combine MediaTek tag with VLAN tag
Date: Fri, 15 Dec 2017 12:47:01 +0800
Message-ID: <4b976b6cd9a1234f6ff19c201604d3dcb8ec2151.1513312600.git.sean.wang@mediatek.com>
References: <cover.1513312600.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1513312600.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

In order to let MT7530 switch can recognize well those egress packets
having both special tag and VLAN tag, the information about the special
tag should be carried on the existing VLAN tag. On the other hand, it's
unnecessary for extra handling for ingress packets when VLAN tag is
present since it is able to put the VLAN tag after the special tag and
then follow the existing way to parse.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 net/dsa/tag_mtk.c | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index 8475434..11535bc 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -13,10 +13,13 @@
  */
 
 #include <linux/etherdevice.h>
+#include <linux/if_vlan.h>
 
 #include "dsa_priv.h"
 
 #define MTK_HDR_LEN		4
+#define MTK_HDR_XMIT_UNTAGGED		0
+#define MTK_HDR_XMIT_TAGGED_TPID_8100	1
 #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
 #define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
 
@@ -25,20 +28,37 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 {
 	struct dsa_port *dp = dsa_slave_to_port(dev);
 	u8 *mtk_tag;
+	bool is_vlan_skb = true;
 
-	if (skb_cow_head(skb, MTK_HDR_LEN) < 0)
-		return NULL;
-
-	skb_push(skb, MTK_HDR_LEN);
+	/* Build the special tag after the MAC Source Address. If VLAN header
+	 * is present, it's required that VLAN header and special tag is
+	 * being combined. Only in this way we can allow the switch can parse
+	 * the both special and VLAN tag at the same time and then look up VLAN
+	 * table with VID.
+	 */
+	if (!skb_vlan_tagged(skb)) {
+		if (skb_cow_head(skb, MTK_HDR_LEN) < 0)
+			return NULL;
 
-	memmove(skb->data, skb->data + MTK_HDR_LEN, 2 * ETH_ALEN);
+		skb_push(skb, MTK_HDR_LEN);
+		memmove(skb->data, skb->data + MTK_HDR_LEN, 2 * ETH_ALEN);
+		is_vlan_skb = false;
+	}
 
-	/* Build the tag after the MAC Source Address */
 	mtk_tag = skb->data + 2 * ETH_ALEN;
-	mtk_tag[0] = 0;
+
+	/* Mark tag attribute on special tag insertion to notify hardware
+	 * whether that's a combined special tag with 802.1Q header.
+	 */
+	mtk_tag[0] = is_vlan_skb ? MTK_HDR_XMIT_TAGGED_TPID_8100 :
+		     MTK_HDR_XMIT_UNTAGGED;
 	mtk_tag[1] = (1 << dp->index) & MTK_HDR_XMIT_DP_BIT_MASK;
-	mtk_tag[2] = 0;
-	mtk_tag[3] = 0;
+
+	/* Tag control information is kept for 802.1Q */
+	if (!is_vlan_skb) {
+		mtk_tag[2] = 0;
+		mtk_tag[3] = 0;
+	}
 
 	return skb;
 }
-- 
2.7.4
