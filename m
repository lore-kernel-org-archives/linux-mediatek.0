From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 net-next 2/3] net: dsa: mediatek: combine MediaTek tag with
 VLAN tag
Date: Wed, 13 Dec 2017 12:01:12 +0800
Message-ID: <1391d5ed23981cbeac37eeb860592e7227164341.1513136754.git.sean.wang@mediatek.com>
References: <cover.1513136754.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1513136754.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

In order to let MT7530 switch can recognize well those egress packets
having both special tag and VLAN tag, the information about the special
tag should be carried on the existing VLAN tag. On the other hand, it's
unnecessary for extra handling for ingress packets when VLAN tag is
present since it is able to put the VLAN tag after the special tag and
then follow the existing way to parse.

Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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
