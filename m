Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64525C43602
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZkMfYGbmmBFNVQavhfnwkj1f6U3WSLYvJuEXnZXuTc=; b=luXE92lOfiGg3X+sAEpV4LaxpA
	nsyV2cEok7r+2TR3bVemJGuFTmCL2M9iRUUNqRffvftMoMd+2wVpOzwoMWbEXyIEPQjaDOmQ9YygF
	GS5mpjcBKIDI+eLCjO9n//hJxKWXYBdF4HGJlnSIn2JcyWEpnNrrarx+UrnG1TBbJG98PBPBXY3o6
	JWLEdHfnilFJAVJENRzLjDfuTnP5sLvaZavEicAuwEUiWBtpoDCc7OhFJKsnnWGnbqzlucz+3SoU9
	uehTVlJCd0oKUgc8BTNhPcYfdAlus6az8f+TgWosc6QRKmK23YEFT5TZrDrnOQcVBF4QqLHnawAiv
	kYbvFzsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQ4-0000000G2wt-1FHw;
	Tue, 30 Jun 2026 06:58:08 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSPy-0000000G2sw-49Ms
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:58:04 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-46ed4f66256so3282948f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782802681; x=1783407481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZkMfYGbmmBFNVQavhfnwkj1f6U3WSLYvJuEXnZXuTc=;
        b=IDD5tFD20ScoB3ue/EPl5z6uX/lVxlx8l37+nFOwN0e8jshCpoW56hRDYui2qd5vjU
         LKy0Fjba0yYnnzof6bpCMzL4CH5Vs0yMohaOPAVSxRTcldnOG6rZit2PsOAmEjnAYXqj
         5yM+M2O1Cqiy4r1PJNUhIvOL20BilKRCvBZJlKd2T7m9Zvh4ULwUdd6/vUpJOqWrVbbq
         Tv3+9APktjN5hYAz0uX1zkon+BJY3Yq8aNnhizUu523w/ApoeVvdvGccP+TcuCnypH6g
         03+bitD8leKc3ZBdhLXfZbUew9rcTRLBvAUPW8S9/rpN/ZZQB3Qn7rGacEy3eCzvN6z0
         UEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782802681; x=1783407481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ZkMfYGbmmBFNVQavhfnwkj1f6U3WSLYvJuEXnZXuTc=;
        b=IsD7/6LHnQ3yO6YlNlnE3l1xsxRDCamuSrPooGL7cDmvtRjqwTL3Qr09ptxL/Lj3nX
         ywFu8FdQkcRKEJromJ/7ftkf1RXyPSXRkG8w0935ltpKyEhZv9bu9Q/eGNTKA+pWoI8P
         S9pbuz22stbdadrVM6qi7i7NRdUYlQP1QBPoSUoE3h1gh/VVZ0quxzCs0BaUfArdQjec
         5I7/THycMkAol4UICB3d0YYp7NkLmTp7jFxZkgyTYCFoTY1koP0OlSy9eaPfQsbM34sO
         u7ePmyEmcL6F6it8FVLNYdbWqWCgp1qbcHukNKt/9prWzvoqu8qIl6QnkJ8Z1iQRovAx
         1YDw==
X-Forwarded-Encrypted: i=1; AHgh+Rpxd+ZyYqMNgjnIz+HDrJLTFTv8wrwM569ux6ibF5r7wF8hhmo72pCN0mZoHD68fKO7bSMidJ7oWLlYfvCbZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZszx5wqs/m1S0nKJdsy+EmZ5fiqMrHzI8FMp3NlyBC7SCVX7Y
	DSMQXgSCYQ82dcl7qrKG8pJaNWosuJqKcdzsX3jay3/gi7qxvGHXRV/+
X-Gm-Gg: AfdE7cmTsb/Mc2DKJGsIEykSquW1aU/9FWepOrE+WYFnu/KtvqLSlsUXQejG1X07m2s
	CD3g+aftNqL9XVDHB8gt9Rp+t5659JIVcHMCHI2igia210XkoVHuXgpGwXu3izVCiKb+ZTO+iMh
	6cHV7/oVZscoSTz4UsytYLUv4RannxOssIxhc+TROJ00sD4Bvcc1AlahO1+iTgAm9fPzMWyKCKr
	gx81YSXUPQ1qwu9Yj/OAWudPAijH/7/FFKxwxwRFnHoIVwbSFJLS/f/SJv/XYGO1hr4ZHNN0Bwk
	hNJCtmgKQpor82FOoytHbKyorwXBckDJksnx8LWn0oYJyYcaJjWn8nB/QR+EiG94CLrluxfdndY
	MnKdjbS1niExpMKLUdhmuCAvWb9dFHT3lY/9a1Ok1knBWb3Dn6T4nkTWsq33kR01orlzLzS4L9I
	6MBsAKPqGFpaPHulnXGw==
X-Received: by 2002:a05:6000:2dc7:b0:475:f0d1:eb6f with SMTP id ffacd0b85a97d-475f0d1ed54mr649075f8f.60.1782802681185;
        Mon, 29 Jun 2026 23:58:01 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm4570949f8f.19.2026.06.29.23.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:58:00 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH 3/5] netfilter: nf_flow_table_path: add L2 bridge offload
Date: Tue, 30 Jun 2026 08:57:33 +0200
Message-ID: <20260630065735.3341614-4-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630065735.3341614-1-pawlik.dan@gmail.com>
References: <20260630065735.3341614-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_235803_082699_221402C6 
X-CRM114-Status: GOOD (  23.52  )
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

From: Ryan Chen <rchen14b@gmail.com>

Allow nft_flow_offload to accelerate traffic forwarded at layer 2 through
Linux bridge ports.

Detection: nft_flow_offload_is_bridging() identifies bridged flows by
checking that the ingress device is a bridge port and that the destination
MAC appears in the bridge FDB with a forwarding destination port (non-local
entry). VLAN resolution and FDB lookup are combined in a single
br_port_get_rcu() call via br_fdb_has_forwarding_entry_rcu().

Routing: nft_flow_route_bridging() allocates minimal dst entries anchored
to the bridge master device via rt_dst_alloc()/ip6_dst_alloc(). A full
routing table lookup via nf_route() is intentionally avoided: it fails for
prefixes that are only bridged, not routed, through the bridge interface
(e.g. when the bridge has no IP address or the bridged subnet is not in
the routing table).

MAC addresses: for bridged flows, nft_dev_forward_path() copies Ethernet
addresses directly from the packet header instead of going through the
neighbour table. Direction (original vs reply) is resolved against the
conntrack direction so both flow directions receive the correct MAC pair.

VLAN context: nft_br_vlan_dev_fill_forward_path() pre-populates the
net_device_path_ctx with the port VLAN id and protocol before the forward
path walk, enabling VLAN-aware hardware offload entries.

Also:
- info->indev is updated for every path type in nft_dev_path_info() so
  the bridge ingress device is correctly tracked regardless of path type.
- nft_flow_route() is now a thin dispatcher that delegates to
  nft_flow_route_routing() (routed traffic) or nft_flow_route_bridging()
  (bridged traffic); the exported API is unchanged.

Path discovery infrastructure was moved to nf_flow_table_path.c in
commit 93d7a7ed0734 ("netfilter: flowtable: move path discovery
infrastructure to its own file"), so all changes land in that file.

Based on a MediaTek SDK patch by Bo-Cun Chen <bc-bocun.chen@mediatek.com>.
Co-developed-by: Daniel Pawlik <pawlik.dan@gmail.com>
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
Signed-off-by: Ryan Chen <rchen14b@gmail.com>
---
 net/netfilter/nf_flow_table_path.c | 167 +++++++++++++++++++++++++++--
 1 file changed, 157 insertions(+), 10 deletions(-)

diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 98c03b487f52..6c470854127f 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -15,6 +15,10 @@
 #include <net/netfilter/nf_conntrack_core.h>
 #include <net/netfilter/nf_conntrack_extend.h>
 #include <net/netfilter/nf_flow_table.h>
+#include <linux/if_bridge.h>
+#include <linux/if_ether.h>
+#include <net/route.h>
+#include <net/ip6_route.h>
 
 static enum flow_offload_xmit_type nft_xmit_type(struct dst_entry *dst)
 {
@@ -42,7 +46,25 @@ static bool nft_is_valid_ether_device(const struct net_device *dev)
 	return true;
 }
 
-static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
+static bool nft_flow_offload_is_bridging(struct sk_buff *skb)
+{
+	bool ret;
+
+	if (!netif_is_bridge_port(skb->dev))
+		return false;
+	if (!skb_mac_header_was_set(skb))
+		return false;
+
+	rcu_read_lock();
+	ret = br_fdb_has_forwarding_entry_rcu(skb->dev, skb,
+					      eth_hdr(skb)->h_dest);
+	rcu_read_unlock();
+
+	return ret;
+}
+
+static int nft_dev_fill_forward_path(struct net_device_path_ctx *ctx,
+				     const struct nf_flow_route *route,
 				     const struct dst_entry *dst_cache,
 				     const struct nf_conn *ct,
 				     enum ip_conntrack_dir dir, u8 *ha,
@@ -58,6 +80,12 @@ static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
 		goto out;
 	}
 
+	/* Bridging fastpath copies Ethernet addresses into ha; do not replace
+	 * them via neighbour lookup on the routed destination device.
+	 */
+	if (!is_zero_ether_addr(ha))
+		goto out;
+
 	n = dst_neigh_lookup(dst_cache, daddr);
 	if (!n)
 		return -1;
@@ -72,7 +100,23 @@ static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
 		return -1;
 
 out:
-	return dev_fill_forward_path(dev, ha, stack);
+	return __dev_fill_forward_path(ctx, ha, stack);
+}
+
+static void nft_br_vlan_dev_fill_forward_path(const struct nft_pktinfo *pkt,
+					      struct net_device_path_ctx *ctx)
+{
+	__be16 proto = 0;
+	u16 vlan_id;
+
+	rcu_read_lock();
+	vlan_id = br_vlan_get_offload_info_rcu(pkt->skb->dev, pkt->skb, &proto);
+	if (vlan_id) {
+		ctx->num_vlans = 1;
+		ctx->vlan[0].id = vlan_id;
+		ctx->vlan[0].proto = proto;
+	}
+	rcu_read_unlock();
 }
 
 struct nft_forward_info {
@@ -103,13 +147,13 @@ static int nft_dev_path_info(const struct net_device_path_stack *stack,
 
 	for (i = 0; i < stack->num_paths; i++) {
 		path = &stack->path[i];
+		info->indev = path->dev;
 		switch (path->type) {
 		case DEV_PATH_ETHERNET:
 		case DEV_PATH_DSA:
 		case DEV_PATH_VLAN:
 		case DEV_PATH_PPPOE:
 		case DEV_PATH_TUN:
-			info->indev = path->dev;
 			if (is_zero_ether_addr(info->h_source))
 				memcpy(info->h_source, path->dev->dev_addr, ETH_ALEN);
 
@@ -244,6 +288,7 @@ static int nft_flow_tunnel_update_route(const struct nft_pktinfo *pkt,
 }
 
 static int nft_dev_forward_path(const struct nft_pktinfo *pkt,
+				bool is_bridging,
 				struct nf_flow_route *route,
 				const struct nf_conn *ct,
 				enum ip_conntrack_dir dir,
@@ -251,11 +296,33 @@ static int nft_dev_forward_path(const struct nft_pktinfo *pkt,
 {
 	const struct dst_entry *dst = route->tuple[dir].dst;
 	struct net_device_path_stack stack;
+	struct net_device_path_ctx ctx = {
+		.dev	= dst->dev,
+	};
 	struct nft_forward_info info = {};
+	enum ip_conntrack_info pkt_ctinfo;
+	enum ip_conntrack_dir skb_dir;
+	struct ethhdr *eth;
 	unsigned char ha[ETH_ALEN];
 	int i;
 
-	if (nft_dev_fill_forward_path(route, dst, ct, dir, ha, &stack) < 0 ||
+	memset(ha, 0, sizeof(ha));
+
+	if (is_bridging) {
+		nf_ct_get(pkt->skb, &pkt_ctinfo);
+		eth = eth_hdr(pkt->skb);
+		skb_dir = CTINFO2DIR(pkt_ctinfo);
+		if (skb_dir != dir) {
+			memcpy(ha, eth->h_source, ETH_ALEN);
+			memcpy(info.h_source, eth->h_dest, ETH_ALEN);
+		} else {
+			memcpy(ha, eth->h_dest, ETH_ALEN);
+			memcpy(info.h_source, eth->h_source, ETH_ALEN);
+		}
+		nft_br_vlan_dev_fill_forward_path(pkt, &ctx);
+	}
+
+	if (nft_dev_fill_forward_path(&ctx, route, dst, ct, dir, ha, &stack) < 0 ||
 	    nft_dev_path_info(&stack, &info, ha, &ft->data) < 0)
 		return -ENOENT;
 
@@ -292,9 +359,11 @@ static int nft_dev_forward_path(const struct nft_pktinfo *pkt,
 	return 0;
 }
 
-int nft_flow_route(const struct nft_pktinfo *pkt, const struct nf_conn *ct,
-		   struct nf_flow_route *route, enum ip_conntrack_dir dir,
-		   struct nft_flowtable *ft)
+static int nft_flow_route_routing(const struct nft_pktinfo *pkt,
+				  const struct nf_conn *ct,
+				  struct nf_flow_route *route,
+				  enum ip_conntrack_dir dir,
+				  struct nft_flowtable *ft)
 {
 	struct dst_entry *this_dst = skb_dst(pkt->skb);
 	struct dst_entry *other_dst = NULL;
@@ -334,12 +403,12 @@ int nft_flow_route(const struct nft_pktinfo *pkt, const struct nf_conn *ct,
 	nft_default_forward_path(route, this_dst, dir);
 	nft_default_forward_path(route, other_dst, !dir);
 
-	if (route->tuple[dir].xmit_type	== FLOW_OFFLOAD_XMIT_NEIGH &&
-	    nft_dev_forward_path(pkt, route, ct, dir, ft) < 0)
+	if (route->tuple[dir].xmit_type == FLOW_OFFLOAD_XMIT_NEIGH &&
+	    nft_dev_forward_path(pkt, false, route, ct, dir, ft) < 0)
 		goto err_dst_release;
 
 	if (route->tuple[!dir].xmit_type == FLOW_OFFLOAD_XMIT_NEIGH &&
-	    nft_dev_forward_path(pkt, route, ct, !dir, ft) < 0)
+	    nft_dev_forward_path(pkt, false, route, ct, !dir, ft) < 0)
 		goto err_dst_release;
 
 	return 0;
@@ -349,4 +418,82 @@ int nft_flow_route(const struct nft_pktinfo *pkt, const struct nf_conn *ct,
 	dst_release(route->tuple[!dir].dst);
 	return -ENOENT;
 }
+
+static int nft_flow_route_bridging(const struct nft_pktinfo *pkt,
+				   const struct nf_conn *ct,
+				   struct nf_flow_route *route,
+				   enum ip_conntrack_dir dir,
+				   struct nft_flowtable *ft)
+{
+	struct dst_entry *dsts[IP_CT_DIR_MAX] = {};
+	struct net_device *br_dev;
+	int i;
+
+	/* Allocate minimal dsts anchored to the bridge master device to supply
+	 * xmit_type and MTU. A full routing lookup via nf_route() is avoided
+	 * because it fails for prefixes that are bridged but not routed.
+	 */
+	rcu_read_lock();
+	br_dev = netdev_master_upper_dev_get_rcu(pkt->skb->dev);
+	if (!br_dev || !netif_is_bridge_master(br_dev)) {
+		rcu_read_unlock();
+		return -ENOENT;
+	}
+
+	for (i = 0; i < IP_CT_DIR_MAX; i++) {
+		switch (nft_pf(pkt)) {
+		case NFPROTO_IPV4: {
+			struct rtable *rt;
+
+			rt = rt_dst_alloc(br_dev, 0, RTN_UNICAST, true);
+			if (rt)
+				dsts[i] = &rt->dst;
+			break;
+		}
+		case NFPROTO_IPV6: {
+			struct rt6_info *rt;
+
+			rt = ip6_dst_alloc(nft_net(pkt), br_dev, 0);
+			if (rt)
+				dsts[i] = &rt->dst;
+			break;
+		}
+		}
+	}
+	rcu_read_unlock();
+
+	if (!dsts[dir] || !dsts[!dir]) {
+		dst_release(dsts[dir]);
+		dst_release(dsts[!dir]);
+		return -ENOENT;
+	}
+
+	nft_default_forward_path(route, dsts[dir], dir);
+	nft_default_forward_path(route, dsts[!dir], !dir);
+	/* Drop allocation references; route->tuple[*].dst holds the clones. */
+	dst_release(dsts[dir]);
+	dst_release(dsts[!dir]);
+
+	if (route->tuple[dir].xmit_type == FLOW_OFFLOAD_XMIT_NEIGH &&
+	    route->tuple[!dir].xmit_type == FLOW_OFFLOAD_XMIT_NEIGH) {
+		if (nft_dev_forward_path(pkt, true, route, ct, dir, ft) ||
+		    nft_dev_forward_path(pkt, true, route, ct, !dir, ft)) {
+			dst_release(route->tuple[dir].dst);
+			dst_release(route->tuple[!dir].dst);
+			return -ENOENT;
+		}
+	}
+
+	return 0;
+}
+
+int nft_flow_route(const struct nft_pktinfo *pkt, const struct nf_conn *ct,
+		   struct nf_flow_route *route, enum ip_conntrack_dir dir,
+		   struct nft_flowtable *ft)
+{
+	if (nft_flow_offload_is_bridging(pkt->skb))
+		return nft_flow_route_bridging(pkt, ct, route, dir, ft);
+
+	return nft_flow_route_routing(pkt, ct, route, dir, ft);
+}
 EXPORT_SYMBOL_GPL(nft_flow_route);
-- 
2.54.0


