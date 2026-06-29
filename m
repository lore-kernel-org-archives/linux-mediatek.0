Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1B4C43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0BtFT/DLMwlAC+IMAnaYdEaIQ9JUWZrSmMLsMhq+s0=; b=wP0gMkuhjhUI63gSAYPdgUgW7W
	sk/Cw2xN3ZFy+fa98V0ny+FaprhrAEuJtgav9BssawIfbN3p9jUOtKmhvLEqKaNX/3nX4sjQppwa8
	j/Sv0cUavPmS8JHtgFUTzJndvobTlJlvHI+2Bpt/pITrA79Nqwrxb9b5dNqCMjynUz7tzWpyy/fYD
	Beu4PPk6MUckWFhOhLyqmENYCzbLiHRVmFMgwPLMcaKRTkeVlMs2RtlrH7Yfg9+o9IDb6r7WQMI1E
	Ncy75vaXVkru2x+Ry7ggIM700T+fe5mmPmbQbPQgY7jJkaX4IjcUPSvK7htEQnYwRERnYx8EgG5q3
	sqXlyCvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBBE-0000000EZPz-1ZBp;
	Mon, 29 Jun 2026 12:33:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBB9-0000000EZKH-3oga
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 12:33:37 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c12614b81c9so198033366b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 05:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782736414; x=1783341214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0BtFT/DLMwlAC+IMAnaYdEaIQ9JUWZrSmMLsMhq+s0=;
        b=lbW0j5tqgN4VjLuP2GIYWkCSl/Se2LLAQmg7F8s7CZasFLWm2ptVDMJI6rnfAMIq9E
         9IK7s8UntgzEQdODzlmY/GwBias8vwpoKHaRESR4zptc0WAilTxMCNsVAXOwS5MnL93p
         UVHe9Xqcdofb0NNemwo+vgqsf9DYyx7A8MTJk22reZJ+GMUHw46FtSudkg+Z1bk5yOAP
         CnaT1Bw0p/WpdLvm1DZBNnUDhy8KXBh1CqSFmGSWV4xlzKB0h5noBsJZAicrdD/B+SH5
         tS621RUh4Yw1RjTbHaofom1N1eD/3qIoMgDq5TVbGiyxK0LkpF8P8kjtI4tNMWcI2xuN
         MX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736414; x=1783341214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B0BtFT/DLMwlAC+IMAnaYdEaIQ9JUWZrSmMLsMhq+s0=;
        b=Ksm4IyMvBOsS2o7uK9OcLNqR+C282uCz23jWBITkPzjVEjS1TbbWaRwhIER3gLHrOy
         x1PFEXtXQJoNo1S6iI932N9rBRKGtJrqgtkjvBYsHalJ74Z3RledYar7ICnpa0GPgZ+3
         AnXMRT22WlDQELB9wNFTAEQxbUwNp1yzePOPHN4QK6DGeV8Ps6w2ypNPo0eb0VEOlP9t
         sl4iljqCKnmx/ijwvo8Jq1XRXPrZ0+Uw59ZtNcjEC/VA3cOC4tzE881YE+udYC5wBCtD
         wRgvegNgMM6E+mGIuNI7OPlNxz3KazuQpwh5Ie31mEsjv5VHrToCW5w1+v3yf6LPVa3l
         hDXA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+XCkLQj9KHdW+Y+fz6BnDuzfVM3fcCnkJ4sg0VgcLbMPy1ravnEhrIMI5Y4WSUvutm+ZfJmi76h6I7n8jfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVDu1sLgOoPIvh985sOowVuADMdEuCOvJdTrWpxgEnJ3aZkJFW
	6UXQjzNH3aZQsMZdcj5JqyRoDHitEqU4HzDAdmZxNCgvsUisQiawOpu+
X-Gm-Gg: AfdE7cmboBUd0xAtPW+8xzN7K725Y1HeH/4iHEeO5cvL3HyG9KQUFYfUsj6KxomkQyg
	xeALCvv0cTT7o5TP4viaAAEB3TWSsHBEt/Xkl/SOEQsT8Nt8P2W9qsQxj3sHfxQSBk5FbRUfYgz
	+c6dRkiUDgvAa4JzetcLtbbGByesDLG/soawcOysT5IH4WnZ8JCMi4pLkiA3VnVarjvsTk3wj6P
	VnPeIt6f8IYxWwSGRMg6XnUGOmhfB0Nc8YQIpVjXqwu+8KEeIynoEy49UTjroQqWirblgh8k0HK
	kRW20jci+pWXk2bDco755VziotTaCE4guMzqfdf6Sop/QSrTtxw0d/oJYHnLopuXZI+2cto753z
	aaYvMDGl2X2T6+t+/+vrrYaNivbua8MbQ6mFsf99YbQ11k3kDeWp2wcAde7IKQH1pjLIGKxOR0a
	ihmlPU6y0=
X-Received: by 2002:a17:906:f58a:b0:c12:34ec:ad25 with SMTP id a640c23a62f3a-c1234ecbf2bmr445790166b.65.1782736414123;
        Mon, 29 Jun 2026 05:33:34 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05c22sm773866566b.39.2026.06.29.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:33:32 -0700 (PDT)
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
Subject: [PATCH 5/5] netfilter: nf_flow_table_path: add VLAN passthrough support
Date: Mon, 29 Jun 2026 14:32:53 +0200
Message-ID: <20260629123253.1912621-6-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629123253.1912621-1-pawlik.dan@gmail.com>
References: <20260629123253.1912621-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_053335_968137_791E7EA2 
X-CRM114-Status: GOOD (  16.46  )
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

VLAN passthrough packets can be offloaded when bridge-nf-filter-vlan-tagged
is enabled. When a packet has a VLAN tag and the bridge does not have VLAN
filtering enabled (passthrough mode), record the VLAN encap info so the
hardware flow offload entry includes the correct VLAN tag.

Without this change, VLAN-tagged bridged traffic cannot be offloaded by PPE
because the VLAN encap information is missing from the flow entry.

Enable with: echo 1 > /proc/sys/net/bridge/bridge-nf-filter-vlan-tagged

Based on a MediaTek SDK patch by Chak-Kei Lam <chak-kei.lam@mediatek.com>.
Signed-off-by: Ryan Chen <rchen14b@gmail.com>
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 net/netfilter/nf_flow_table_path.c | 32 ++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 580aa1db3cb4..d15c425c88c4 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -17,6 +17,7 @@
 #include <net/netfilter/nf_flow_table.h>
 #include <linux/if_bridge.h>
 #include <linux/if_ether.h>
+#include <linux/if_vlan.h>
 #include <net/route.h>
 #include <net/ip6_route.h>
 
@@ -136,6 +137,29 @@ struct nft_forward_info {
 	enum flow_offload_xmit_type xmit_type;
 };
 
+static void nft_fill_vlan_passthrough_info(const struct nft_pktinfo *pkt,
+					   struct nft_forward_info *info)
+{
+	if (!skb_vlan_tag_present(pkt->skb))
+		return;
+
+	rcu_read_lock();
+	/* when bridge VLAN filtering is enabled, the bridge handles the tag */
+	if (netif_is_bridge_port(pkt->skb->dev) &&
+	    !br_vlan_is_enabled_rcu(pkt->skb->dev)) {
+		if (info->num_encaps >= NF_FLOW_TABLE_ENCAP_MAX) {
+			info->indev = NULL;
+		} else {
+			info->encap[info->num_encaps].id =
+				skb_vlan_tag_get_id(pkt->skb);
+			info->encap[info->num_encaps].proto =
+				pkt->skb->vlan_proto;
+			info->num_encaps++;
+		}
+	}
+	rcu_read_unlock();
+}
+
 static int nft_dev_path_info(const struct net_device_path_stack *stack,
 			     struct nft_forward_info *info,
 			     unsigned char *ha, struct nf_flowtable *flowtable)
@@ -326,8 +350,12 @@ static int nft_dev_forward_path(const struct nft_pktinfo *pkt,
 		nft_br_vlan_dev_fill_forward_path(pkt, &ctx);
 	}
 
-	if (nft_dev_fill_forward_path(&ctx, route, dst, ct, dir, ha, &stack) < 0 ||
-	    nft_dev_path_info(&stack, &info, ha, &ft->data) < 0)
+	if (nft_dev_fill_forward_path(&ctx, route, dst, ct, dir, ha, &stack) < 0)
+		return -ENOENT;
+
+	nft_fill_vlan_passthrough_info(pkt, &info);
+
+	if (nft_dev_path_info(&stack, &info, ha, &ft->data) < 0)
 		return -ENOENT;
 
 	if (!nft_flowtable_find_dev(info.indev, ft))
-- 
2.54.0


