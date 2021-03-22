Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C4CC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 11:22:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCEDD6191A
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 11:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCEDD6191A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v4ex1ez+nubkojJ/JQS/U2xMj+iUms3Fj0vFQJ8wgfg=; b=S/IRgRgUcsCn+8nc/O7w0XbU7
	Cv2/vunD1LaoHXhub7dsPW2mnLgEWzgvGl6Lwk6WGnbGG7/AZV+9xYsJ1XgizG4j3/6wb8esQeBgy
	ulSGHTrwTQb1ckrxzPc4L1PnJwtUkM8aGzEYLFwhNupNU6jnO8dWiqzcVlMZWNaQ4VkKD4dZ3rzF3
	Zi8KdxgmJdSU4tmQl4Um7kOa8m/8kchpi4Y58FtBFFyFxYeB/xp1u5ioDYQ0yuCT6ZQTOBvAvXYHQ
	T9K2+O8e/FlKGS+1rBPYSez5vu17Ordjjenoh6fCGrRV+vyETC2oLJOepLmV2NYwIjbRoEIuJyZLR
	/bfq9wm9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOIdY-00BQrm-7i; Mon, 22 Mar 2021 11:22:20 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOIcx-00BQgF-0B; Mon, 22 Mar 2021 11:21:47 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout4.routing.net (Postfix) with ESMTP id 692E51007B4;
 Mon, 22 Mar 2021 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1616412101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYeVx8d4LjQCrMjqtdwToyONIZtgo42NmTTPNbi924c=;
 b=ug9Ij2wqVs5oPGAjn8m8HMPznXHwXLmTNqJMlob3uRaB5fQPY/2E12aV+pZc65+yxC+9RN
 WubOvEBS1NhliP5ZGYApPt/8Jl9tPaMzERFP8zbW/sEE+W6xkM8Fv3SKrKtqSpskAZTkmf
 aZAiDp/JC2BNK0qNoJQZnAU1d7JKV6c=
Received: from localhost.localdomain (unknown [80.245.73.88])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id B761436010D;
 Mon, 22 Mar 2021 11:21:40 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] [RFC] net: ethernet: mtk_eth_soc: add ipv6 flow offload
 support
Date: Mon, 22 Mar 2021 12:21:17 +0100
Message-Id: <20210322112117.16162-3-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322112117.16162-1-linux@fw-web.de>
References: <20210322112117.16162-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mail-ID: ce223c4d-bd77-4263-a479-9b2339e766b7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_112143_263154_94C2F121 
X-CRM114-Status: GOOD (  13.36  )
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

From: Frank Wunderlich <frank-w@public-files.de>

adding ipv6 hardware offload support

patch by user graphine (https://github.com/graphine27/)
http://forum.banana-pi.org/u/graphine/summary

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../net/ethernet/mediatek/mtk_ppe_offload.c   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index d0c46786571f..29cf0eb25a22 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -7,6 +7,7 @@
 #include <linux/rhashtable.h>
 #include <linux/if_ether.h>
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
@@ -64,6 +70,14 @@ mtk_flow_set_ipv4_addr(struct mtk_foe_entry *foe, struct mtk_flow_data *data,
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
@@ -127,6 +141,29 @@ mtk_flow_mangle_ipv4(const struct flow_action_entry *act,
 	return 0;
 }
 
+static int
+mtk_flow_mangle_ipv6(const struct flow_action_entry *act,
+		     struct mtk_flow_data *data)
+{
+	__be32 *dest;
+	size_t offset_of_ip6_daddr = offsetof(struct ipv6hdr, daddr);
+	size_t offset_of_ip6_saddr = offsetof(struct ipv6hdr, saddr);
+	u32 idx;
+
+	if (act->mangle.offset >= offset_of_ip6_daddr && act->mangle.offset < offset_of_ip6_daddr) {
+		idx = (act->mangle.offset - offset_of_ip6_saddr) / 4;
+		dest = &data->v6.src_addr.s6_addr32[idx];
+	} else if (act->mangle.offset >= offset_of_ip6_daddr &&
+		   act->mangle.offset < offset_of_ip6_daddr + 16) {
+		idx = (act->mangle.offset - offset_of_ip6_daddr) / 4;
+		dest = &data->v6.dst_addr.s6_addr32[idx];
+	}
+
+	memcpy(dest, &act->mangle.val, sizeof(u32));
+
+	return 0;
+}
+
 static int
 mtk_flow_get_dsa_port(struct net_device **dev)
 {
@@ -249,6 +286,9 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 	case FLOW_DISSECTOR_KEY_IPV4_ADDRS:
 		offload_type = MTK_PPE_PKT_TYPE_IPV4_HNAPT;
 		break;
+	case FLOW_DISSECTOR_KEY_IPV6_ADDRS:
+		offload_type = MTK_PPE_PKT_TYPE_IPV6_ROUTE_5T;
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -284,6 +324,18 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 		mtk_flow_set_ipv4_addr(&foe, &data, false);
 	}
 
+
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
@@ -296,6 +348,9 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 		case FLOW_ACT_MANGLE_HDR_TYPE_IP4:
 			err = mtk_flow_mangle_ipv4(act, &data);
 			break;
+		case FLOW_ACT_MANGLE_HDR_TYPE_IP6:
+			err = mtk_flow_mangle_ipv6(act, &data);
+			break;
 		case FLOW_ACT_MANGLE_HDR_TYPE_ETH:
 			/* handled earlier */
 			break;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
