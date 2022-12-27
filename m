Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C575FC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 14:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhkhKuz1T8rY3m+BTG+T8ROPfsy5F+fsbAj5AjslqQI=; b=xbqXyT7c2dR22szVj8o+bkzdFQ
	l2zThij7qLGacySVIDiI6oNvZxCflcnyR5MPm7fFz3EuVmChJnl28zvlBqqmcYb6fwe4q5+/wq4g4
	IMSALHBXiz17mYjBSSwBQprOBDQ9txes96G/FZl8XQ/RYupkqe0JvUnPuPAhQLvvK/nzXIeDCiTxl
	Qf+TTIjHrFqG5juMhUAxO87cF1fi6Vjo3PQIO4cpgozYGyU1MQt5lxxg49J2N4KIUp8N26aJfVhay
	F8F9hamWsT9YQnh8P3xLxuBrfaRAzZRGCzJOkTctx3xiTrzJSsr4vIh2kypkGqMK0hf7kAOg9IBwt
	gT6e82CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAAdP-00DWVT-8e; Tue, 27 Dec 2022 14:08:51 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAAd1-00DWJU-53; Tue, 27 Dec 2022 14:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NhkhKuz1T8rY3m+BTG+T8ROPfsy5F+fsbAj5AjslqQI=; b=bHRRVkl6OIg31PWjSg1UuCP0XI
	uFWEUyviKbGEiVg7WZg8K+xAq7B7Vqs0z067i3HUfUzQ8woB7ZoMh7v2xxf/k7LB5iMpGGEkomW+4
	1ELdEvlxY2VYilCRYjKkxAB7w4AXf2SyLOTxdhyAwIW6Zfta4NRremPVSZ6a84a87BAc=;
Received: from p200300daa720fc040c81ba64b0a9b1e5.dip0.t-ipconnect.de ([2003:da:a720:fc04:c81:ba64:b0a9:b1e5] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pAAcl-00C3RB-A3; Tue, 27 Dec 2022 15:08:11 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 5/5] net: ethernet: mtk_eth_soc: ppe: fix L2 offloading with DSA untagging offload enabled
Date: Tue, 27 Dec 2022 15:08:07 +0100
Message-Id: <20221227140807.48413-5-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221227140807.48413-1-nbd@nbd.name>
References: <20221227140807.48413-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_060827_252889_53BA9ED5 
X-CRM114-Status: GOOD (  11.67  )
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

Check for skb metadata in order to detect the case where the DSA header is not
present.

Fixes: 2d7605a72906 ("net: ethernet: mtk_eth_soc: enable hardware DSA untagging")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 6 +++---
 drivers/net/ethernet/mediatek/mtk_ppe.c     | 5 ++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 214cd80a19a0..b54248bce501 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2039,9 +2039,6 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			skb_checksum_none_assert(skb);
 		skb->protocol = eth_type_trans(skb, netdev);
 
-		if (reason == MTK_PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED)
-			mtk_ppe_check_skb(eth->ppe[0], skb, hash);
-
 		/* When using VLAN untagging in combination with DSA, the
 		 * hardware treats the MTK special tag as a VLAN and untags it.
 		 */
@@ -2054,6 +2051,9 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 				skb_dst_set_noref(skb, &eth->dsa_meta[port]->dst);
 		}
 
+		if (reason == MTK_PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED)
+			mtk_ppe_check_skb(eth->ppe[0], skb, hash);
+
 		skb_record_rx_queue(skb, 0);
 		napi_gro_receive(napi, skb);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 269208a841c7..e366a83cf516 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -8,6 +8,7 @@
 #include <linux/platform_device.h>
 #include <linux/if_ether.h>
 #include <linux/if_vlan.h>
+#include <net/dst_metadata.h>
 #include <net/dsa.h>
 #include "mtk_eth_soc.h"
 #include "mtk_ppe.h"
@@ -700,7 +701,9 @@ void __mtk_ppe_check_skb(struct mtk_ppe *ppe, struct sk_buff *skb, u16 hash)
 		    skb->dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK)
 			goto out;
 
-		tag += 4;
+		if (!skb_metadata_dst(skb))
+			tag += 4;
+
 		if (get_unaligned_be16(tag) != ETH_P_8021Q)
 			break;
 
-- 
2.38.1


