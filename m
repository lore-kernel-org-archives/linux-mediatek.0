Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988D2C52D7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 12:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKq25uWqnQYBecdklFhsOB22xGeJmI2XUHbY1aa+9N8=; b=vhHwi0RE4Bacgb0/SqDZnoC8od
	fVsWXk1CbtwXgUF9UIgYxMCy6lyB3Z6TPA8SlQlppSNpwqH4nWlMPJK4QBU8ydEewJ/MbnWLf+Zin
	HcS3ltEMoI81Vts+Hfuxs2sbR9Rx1eLzq584lYb10WtXtg6gESEPqamuoBLDEgrFScwWjt62GTwKw
	i4RhHIO4txjbYormQCEHoSJ36nqAoBKKfuVL4/oi7OvhFZY/twiHULIwyKpL/LwbightOEIFC1iVZ
	o/eIBcJOp2xpfukQpPv6JiUbPNL+HQ0xsRjHxPy8s5VyFw2gyUCnnfrHvPSHHNUxzkWAWxxIegtmd
	5ncoye0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdTwa-00000000Exo-1Krr;
	Mon, 12 Aug 2024 12:14:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdTuU-00000000EQK-3FJd;
	Mon, 12 Aug 2024 12:12:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EE195CE0E00;
	Mon, 12 Aug 2024 12:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16980C4AF0D;
	Mon, 12 Aug 2024 12:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723464744;
	bh=n+x2KrWbCW9k9T/8jLtkdwC88tN87BOU+rSOFAPkX+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IbLGeEEluTllEtfRh8J3WsTg8HAQsv3BfKqNFwT07D3gaccTp95jCpI+J/btUw80J
	 SPm7RxHFVho7RZXfEHLQWoipKWCfwaPUWTmmBZGKPMP5+9JbXF3Xaq3Xn9GBRfybwQ
	 6hMnKXl02ISuoQKJm/2h2UZWNoRlvIx49qIooSVnFgjI93iG/rwtg4oter2syyXUam
	 lIf6Qap/xh5+CQhgD0EVIW77GXFmENeAKLJYzFQQw5JTpWc2enw+6pspKuQpk3d+Vn
	 F08wDhISzI2zkxuto4APvzVpAzUxVFJqLsuu3l17KuswtMgsUhCA/CreqvipSxSppj
	 mBhMPjTFK1ZoA==
From: Simon Horman <horms@kernel.org>
Date: Mon, 12 Aug 2024 13:11:57 +0100
Subject: [PATCH net-next 3/3] net: hns3: Use
 ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-ipv6_addr-helpers-v1-3-aab5d1f35c40@kernel.org>
References: <20240812-ipv6_addr-helpers-v1-0-aab5d1f35c40@kernel.org>
In-Reply-To: <20240812-ipv6_addr-helpers-v1-0-aab5d1f35c40@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yisen Zhuang <yisen.zhuang@huawei.com>, 
 Salil Mehta <salil.mehta@huawei.com>, Jijie Shao <shaojijie@huawei.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_051227_228579_1DA28F74 
X-CRM114-Status: GOOD (  13.96  )
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

Use new ipv6_addr_cpu_to_be32 and ipv6_addr_be32_to_cpu helper,
and IPV6_ADDR_WORDS. This is arguably slightly nicer.

No functional change intended.
Compile tested only.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Link: https://lore.kernel.org/netdev/c7684349-535c-45a4-9a74-d47479a50020@lunn.ch/
Signed-off-by: Simon Horman <horms@kernel.org>
---
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    | 79 +++++++++++-----------
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.h    |  8 ++-
 2 files changed, 44 insertions(+), 43 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 82574ce0194f..ce629cbc5d01 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -13,8 +13,9 @@
 #include <linux/platform_device.h>
 #include <linux/if_vlan.h>
 #include <linux/crash_dump.h>
-#include <net/ipv6.h>
+
 #include <net/rtnetlink.h>
+
 #include "hclge_cmd.h"
 #include "hclge_dcb.h"
 #include "hclge_main.h"
@@ -6278,15 +6279,15 @@ static void hclge_fd_get_ip4_tuple(struct ethtool_rx_flow_spec *fs,
 static void hclge_fd_get_tcpip6_tuple(struct ethtool_rx_flow_spec *fs,
 				      struct hclge_fd_rule *rule, u8 ip_proto)
 {
-	be32_to_cpu_array(rule->tuples.src_ip, fs->h_u.tcp_ip6_spec.ip6src,
-			  IPV6_SIZE);
-	be32_to_cpu_array(rule->tuples_mask.src_ip, fs->m_u.tcp_ip6_spec.ip6src,
-			  IPV6_SIZE);
+	ipv6_addr_be32_to_cpu(rule->tuples.src_ip,
+			      fs->h_u.tcp_ip6_spec.ip6src);
+	ipv6_addr_be32_to_cpu(rule->tuples_mask.src_ip,
+			      fs->m_u.tcp_ip6_spec.ip6src);
 
-	be32_to_cpu_array(rule->tuples.dst_ip, fs->h_u.tcp_ip6_spec.ip6dst,
-			  IPV6_SIZE);
-	be32_to_cpu_array(rule->tuples_mask.dst_ip, fs->m_u.tcp_ip6_spec.ip6dst,
-			  IPV6_SIZE);
+	ipv6_addr_be32_to_cpu(rule->tuples.dst_ip,
+			      fs->h_u.tcp_ip6_spec.ip6dst);
+	ipv6_addr_be32_to_cpu(rule->tuples_mask.dst_ip,
+			      fs->m_u.tcp_ip6_spec.ip6dst);
 
 	rule->tuples.src_port = be16_to_cpu(fs->h_u.tcp_ip6_spec.psrc);
 	rule->tuples_mask.src_port = be16_to_cpu(fs->m_u.tcp_ip6_spec.psrc);
@@ -6307,15 +6308,15 @@ static void hclge_fd_get_tcpip6_tuple(struct ethtool_rx_flow_spec *fs,
 static void hclge_fd_get_ip6_tuple(struct ethtool_rx_flow_spec *fs,
 				   struct hclge_fd_rule *rule)
 {
-	be32_to_cpu_array(rule->tuples.src_ip, fs->h_u.usr_ip6_spec.ip6src,
-			  IPV6_SIZE);
-	be32_to_cpu_array(rule->tuples_mask.src_ip, fs->m_u.usr_ip6_spec.ip6src,
-			  IPV6_SIZE);
+	ipv6_addr_be32_to_cpu(rule->tuples.src_ip,
+			      fs->h_u.usr_ip6_spec.ip6src);
+	ipv6_addr_be32_to_cpu(rule->tuples_mask.src_ip,
+			      fs->m_u.usr_ip6_spec.ip6src);
 
-	be32_to_cpu_array(rule->tuples.dst_ip, fs->h_u.usr_ip6_spec.ip6dst,
-			  IPV6_SIZE);
-	be32_to_cpu_array(rule->tuples_mask.dst_ip, fs->m_u.usr_ip6_spec.ip6dst,
-			  IPV6_SIZE);
+	ipv6_addr_be32_to_cpu(rule->tuples.dst_ip,
+			      fs->h_u.usr_ip6_spec.ip6dst);
+	ipv6_addr_be32_to_cpu(rule->tuples_mask.dst_ip,
+			      fs->m_u.usr_ip6_spec.ip6dst);
 
 	rule->tuples.ip_proto = fs->h_u.usr_ip6_spec.l4_proto;
 	rule->tuples_mask.ip_proto = fs->m_u.usr_ip6_spec.l4_proto;
@@ -6744,21 +6745,19 @@ static void hclge_fd_get_tcpip6_info(struct hclge_fd_rule *rule,
 				     struct ethtool_tcpip6_spec *spec,
 				     struct ethtool_tcpip6_spec *spec_mask)
 {
-	cpu_to_be32_array(spec->ip6src,
-			  rule->tuples.src_ip, IPV6_SIZE);
-	cpu_to_be32_array(spec->ip6dst,
-			  rule->tuples.dst_ip, IPV6_SIZE);
+	ipv6_addr_cpu_to_be32(spec->ip6src, rule->tuples.src_ip);
+	ipv6_addr_cpu_to_be32(spec->ip6dst, rule->tuples.dst_ip);
 	if (rule->unused_tuple & BIT(INNER_SRC_IP))
 		memset(spec_mask->ip6src, 0, sizeof(spec_mask->ip6src));
 	else
-		cpu_to_be32_array(spec_mask->ip6src, rule->tuples_mask.src_ip,
-				  IPV6_SIZE);
+		ipv6_addr_cpu_to_be32(spec_mask->ip6src,
+				      rule->tuples_mask.src_ip);
 
 	if (rule->unused_tuple & BIT(INNER_DST_IP))
 		memset(spec_mask->ip6dst, 0, sizeof(spec_mask->ip6dst));
 	else
-		cpu_to_be32_array(spec_mask->ip6dst, rule->tuples_mask.dst_ip,
-				  IPV6_SIZE);
+		ipv6_addr_cpu_to_be32(spec_mask->ip6dst,
+				      rule->tuples_mask.dst_ip);
 
 	spec->tclass = rule->tuples.ip_tos;
 	spec_mask->tclass = rule->unused_tuple & BIT(INNER_IP_TOS) ?
@@ -6777,19 +6776,19 @@ static void hclge_fd_get_ip6_info(struct hclge_fd_rule *rule,
 				  struct ethtool_usrip6_spec *spec,
 				  struct ethtool_usrip6_spec *spec_mask)
 {
-	cpu_to_be32_array(spec->ip6src, rule->tuples.src_ip, IPV6_SIZE);
-	cpu_to_be32_array(spec->ip6dst, rule->tuples.dst_ip, IPV6_SIZE);
+	ipv6_addr_cpu_to_be32(spec->ip6src, rule->tuples.src_ip);
+	ipv6_addr_cpu_to_be32(spec->ip6dst, rule->tuples.dst_ip);
 	if (rule->unused_tuple & BIT(INNER_SRC_IP))
 		memset(spec_mask->ip6src, 0, sizeof(spec_mask->ip6src));
 	else
-		cpu_to_be32_array(spec_mask->ip6src,
-				  rule->tuples_mask.src_ip, IPV6_SIZE);
+		ipv6_addr_cpu_to_be32(spec_mask->ip6src,
+				      rule->tuples_mask.src_ip);
 
 	if (rule->unused_tuple & BIT(INNER_DST_IP))
 		memset(spec_mask->ip6dst, 0, sizeof(spec_mask->ip6dst));
 	else
-		cpu_to_be32_array(spec_mask->ip6dst,
-				  rule->tuples_mask.dst_ip, IPV6_SIZE);
+		ipv6_addr_cpu_to_be32(spec_mask->ip6dst,
+				      rule->tuples_mask.dst_ip);
 
 	spec->tclass = rule->tuples.ip_tos;
 	spec_mask->tclass = rule->unused_tuple & BIT(INNER_IP_TOS) ?
@@ -7007,7 +7006,7 @@ static void hclge_fd_get_flow_tuples(const struct flow_keys *fkeys,
 	} else {
 		int i;
 
-		for (i = 0; i < IPV6_SIZE; i++) {
+		for (i = 0; i < IPV6_ADDR_WORDS; i++) {
 			tuples->src_ip[i] = be32_to_cpu(flow_ip6_src[i]);
 			tuples->dst_ip[i] = be32_to_cpu(flow_ip6_dst[i]);
 		}
@@ -7262,14 +7261,14 @@ static int hclge_get_cls_key_ip(const struct flow_rule *flow,
 		struct flow_match_ipv6_addrs match;
 
 		flow_rule_match_ipv6_addrs(flow, &match);
-		be32_to_cpu_array(rule->tuples.src_ip, match.key->src.s6_addr32,
-				  IPV6_SIZE);
-		be32_to_cpu_array(rule->tuples_mask.src_ip,
-				  match.mask->src.s6_addr32, IPV6_SIZE);
-		be32_to_cpu_array(rule->tuples.dst_ip, match.key->dst.s6_addr32,
-				  IPV6_SIZE);
-		be32_to_cpu_array(rule->tuples_mask.dst_ip,
-				  match.mask->dst.s6_addr32, IPV6_SIZE);
+		ipv6_addr_be32_to_cpu(rule->tuples.src_ip,
+				      match.key->src.s6_addr32);
+		ipv6_addr_be32_to_cpu(rule->tuples_mask.src_ip,
+				      match.mask->src.s6_addr32);
+		ipv6_addr_be32_to_cpu(rule->tuples.dst_ip,
+				      match.key->dst.s6_addr32);
+		ipv6_addr_be32_to_cpu(rule->tuples_mask.dst_ip,
+				      match.mask->dst.s6_addr32);
 	} else {
 		rule->unused_tuple |= BIT(INNER_SRC_IP);
 		rule->unused_tuple |= BIT(INNER_DST_IP);
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
index b5178b0f88b3..b9fc719880bb 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
@@ -8,7 +8,9 @@
 #include <linux/phy.h>
 #include <linux/if_vlan.h>
 #include <linux/kfifo.h>
+
 #include <net/devlink.h>
+#include <net/ipv6.h>
 
 #include "hclge_cmd.h"
 #include "hclge_ptp.h"
@@ -718,15 +720,15 @@ struct hclge_fd_cfg {
 };
 
 #define IPV4_INDEX	3
-#define IPV6_SIZE	4
+
 struct hclge_fd_rule_tuples {
 	u8 src_mac[ETH_ALEN];
 	u8 dst_mac[ETH_ALEN];
 	/* Be compatible for ip address of both ipv4 and ipv6.
 	 * For ipv4 address, we store it in src/dst_ip[3].
 	 */
-	u32 src_ip[IPV6_SIZE];
-	u32 dst_ip[IPV6_SIZE];
+	u32 src_ip[IPV6_ADDR_WORDS];
+	u32 dst_ip[IPV6_ADDR_WORDS];
 	u16 src_port;
 	u16 dst_port;
 	u16 vlan_tag1;

-- 
2.43.0


