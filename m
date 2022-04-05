Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 19:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yzX+P8VH4KxV6ob8zl4STTNfxIY+hcpuAjDFunIhiw=; b=SrZCNhTW8yBHdA
	KkqmQe68sWV+v0i+qznznDb5UDo5ORk/tP/Nxf0v92wekUDA9753QPLrrZB9BgcnuvEFsFbHnhbyh
	I4UC2bQWRpzZC3Cu+DI2CSezL6hreAdWqWlkb146uOIGEg8xLDApvjyYr9FxI04ZE/3j2yAh6Tdin
	25LLGGYLvMcNcDowbfmrEW6PQD2BVACZHJ+2PsxJbbWuk52KnuU/M4VCHbAmDhdkNXZdnJEjDS8qf
	FesGEih0c96Jtap3USJ44nQdU+xE6SSiPGcEPvgdzpPOKmXlSmH0DBUmUQnnRs2R0aCltXVo6daw2
	1dXs/MUsPVAIM96Bg2OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbpLB-002TdI-AR; Tue, 05 Apr 2022 19:59:49 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbpJf-002Sb1-Fp; Tue, 05 Apr 2022 19:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PZEg5szaXbIhbL1e77PZtiylr+OggSY5UFkfbd2FJus=; b=oW3o1rkXgUKGFaIfSwFntKTRBV
 TP1XJvpgDDt/87NziK0rjMNqkgPYwZfPNwwRMmLNZ/XlwQQ//ugnoL4zRUo5EXfKf9umZkteMrMDr
 XnLvf+GkyxIrVxXXHnTKAnLAr9biL31rHs4jSdoL5PvHbFPQ2kRzxhskn07HMJpvry7s=;
Received: from p200300daa70ef200456864e8b8d10029.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:4568:64e8:b8d1:29] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nbpJW-00035V-JN; Tue, 05 Apr 2022 21:58:06 +0200
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Bentham <db260179@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/14] net: ethernet: mtk_eth_soc: add ipv6 flow offload
 support
Date: Tue,  5 Apr 2022 21:57:50 +0200
Message-Id: <20220405195755.10817-10-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405195755.10817-1-nbd@nbd.name>
References: <20220405195755.10817-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_125815_728304_0E9CA2A0 
X-CRM114-Status: GOOD (  12.46  )
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

From: David Bentham <db260179@gmail.com>

Add the missing IPv6 flow offloading support for routing only.
Hardware flow offloading is done by the packet processing engine (PPE)
of the Ethernet MAC and as it doesn't support mangling of IPv6 packets,
IPv6 NAT cannot be supported.

Signed-off-by: David Bentham <db260179@gmail.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/ethernet/mediatek/mtk_ppe_offload.c   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index bcf342bb9051..0113cddcebf4 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -6,6 +6,7 @@
 #include <linux/if_ether.h>
 #include <linux/rhashtable.h>
 #include <linux/ip.h>
+#include <linux/ipv6.h>
 #include <net/flow_offload.h>
 #include <net/pkt_cls.h>
 #include <net/dsa.h>
@@ -20,6 +21,11 @@ struct mtk_flow_data {
 			__be32 src_addr;
 			__be32 dst_addr;
 		} v4;
+
+		struct {
+			struct in6_addr src_addr;
+			struct in6_addr dst_addr;
+		} v6;
 	};
 
 	__be16 src_port;
@@ -65,6 +71,14 @@ mtk_flow_set_ipv4_addr(struct mtk_foe_entry *foe, struct mtk_flow_data *data,
 					    data->v4.dst_addr, data->dst_port);
 }
 
+static int
+mtk_flow_set_ipv6_addr(struct mtk_foe_entry *foe, struct mtk_flow_data *data)
+{
+	return mtk_foe_entry_set_ipv6_tuple(foe,
+					    data->v6.src_addr.s6_addr32, data->src_port,
+					    data->v6.dst_addr.s6_addr32, data->dst_port);
+}
+
 static void
 mtk_flow_offload_mangle_eth(const struct flow_action_entry *act, void *eth)
 {
@@ -296,6 +310,9 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 	case FLOW_DISSECTOR_KEY_IPV4_ADDRS:
 		offload_type = MTK_PPE_PKT_TYPE_IPV4_HNAPT;
 		break;
+	case FLOW_DISSECTOR_KEY_IPV6_ADDRS:
+		offload_type = MTK_PPE_PKT_TYPE_IPV6_ROUTE_5T;
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -331,6 +348,17 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 		mtk_flow_set_ipv4_addr(&foe, &data, false);
 	}
 
+	if (addr_type == FLOW_DISSECTOR_KEY_IPV6_ADDRS) {
+		struct flow_match_ipv6_addrs addrs;
+
+		flow_rule_match_ipv6_addrs(rule, &addrs);
+
+		data.v6.src_addr = addrs.key->src;
+		data.v6.dst_addr = addrs.key->dst;
+
+		mtk_flow_set_ipv6_addr(&foe, &data);
+	}
+
 	flow_action_for_each(i, act, &rule->action) {
 		if (act->id != FLOW_ACTION_MANGLE)
 			continue;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
