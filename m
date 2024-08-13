Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699A7C52D7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylOtYJCuv64drQBOcjEaCE8RUBu0PwU8F0wYCEWH1wo=; b=Lf4niOCkgPxVND9/LJWSjER6Ju
	rz4gwqaHvDZk9bbEG5lZ3Ji0lv9VM6CTb9MAan8qzCo91behbHrq1qawbi9Se83GrakhOvXdD+q0r
	NvH5FN7ieHSOj/lASNsDVMWLao39RBTMZzwmVGYBt9zdjD2jNn6IpMaOmlWWUxxX5zp0TT64W5SRq
	mD0Z1UXb8Ikxu02sy1l2id96HHVgko6k4lou6G0GTg15Fz0z49CZuXiNkvZPDvcJKoHDiAM5QJ4Ub
	mhTxLKsUCCvUxAaWDEAei+nIo9gHA3GOm0I7AVGW9jFnDoxrOZuEGifbVlB3QyngYsqhNyuA0oe2m
	3iB7cIdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdsmG-000000044Db-1Egf;
	Tue, 13 Aug 2024 14:45:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdrf6-00000003tAm-1eOx;
	Tue, 13 Aug 2024 13:34:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5EC64CE1393;
	Tue, 13 Aug 2024 13:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DB5C4AF09;
	Tue, 13 Aug 2024 13:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723556045;
	bh=xSYSi/LZGmEjGZY/ggBNHjYQ1amJc1ZQlnw30K7htBM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DnUyD+q3N+qSy+haAEMA9kFq22UFi2GvMboA3J9Poiw7OOO2lPx4h+IYmCDOtuavO
	 +RkR9JaVihYzsJBrid5o7WhtpbU3S6fDBPkSPWPckVJHSZCdUfKJHkhUydiyVaP7Xh
	 I218EHUykPQjw68fmS0G5Qq9PxBhSXZPz7sphw6t0mt9eYon2AtEEawlrYhgrDtHua
	 Q+ZUzXCbEkjQDE+Xm9e417wfrX+16Ibnxhhct8BSKRgZHD/EgYrYa0VuOfVCs/Td5I
	 78cU0tO+tfiRRCl2fRyvPE6puuLgP0z0nUbzYIec133VhpWUFIaBOCJWd4FlmPelv9
	 RIEMWRPAYCnaw==
From: Simon Horman <horms@kernel.org>
Date: Tue, 13 Aug 2024 14:33:48 +0100
Subject: [PATCH net-next v2 2/3] net: ethernet: mtk_eth_soc: Use
 ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-ipv6_addr-helpers-v2-2-5c974f8cca3e@kernel.org>
References: <20240813-ipv6_addr-helpers-v2-0-5c974f8cca3e@kernel.org>
In-Reply-To: <20240813-ipv6_addr-helpers-v2-0-5c974f8cca3e@kernel.org>
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
X-CRM114-CacheID: sfid-20240813_063408_911358_56020D9E 
X-CRM114-Status: GOOD (  12.56  )
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

Use ipv6_addr_cpu_to_be32 and ipv6_addr_be32_to_cpu helpers to convert
address, rather than open coding the conversion.

No functional change intended.
Compile tested only.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Link: https://lore.kernel.org/netdev/c7684349-535c-45a4-9a74-d47479a50020@lunn.ch/
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c         | 10 +++++-----
 drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c |  9 +++++----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 0acee405a749..ada852adc5f7 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -8,8 +8,11 @@
 #include <linux/platform_device.h>
 #include <linux/if_ether.h>
 #include <linux/if_vlan.h>
+
 #include <net/dst_metadata.h>
 #include <net/dsa.h>
+#include <net/ipv6.h>
+
 #include "mtk_eth_soc.h"
 #include "mtk_ppe.h"
 #include "mtk_ppe_regs.h"
@@ -338,7 +341,6 @@ int mtk_foe_entry_set_ipv6_tuple(struct mtk_eth *eth,
 {
 	int type = mtk_get_ib1_pkt_type(eth, entry->ib1);
 	u32 *src, *dest;
-	int i;
 
 	switch (type) {
 	case MTK_PPE_PKT_TYPE_IPV4_DSLITE:
@@ -359,10 +361,8 @@ int mtk_foe_entry_set_ipv6_tuple(struct mtk_eth *eth,
 		return -EINVAL;
 	}
 
-	for (i = 0; i < 4; i++)
-		src[i] = be32_to_cpu(src_addr[i]);
-	for (i = 0; i < 4; i++)
-		dest[i] = be32_to_cpu(dest_addr[i]);
+	ipv6_addr_be32_to_cpu(src, src_addr);
+	ipv6_addr_be32_to_cpu(dest, dest_addr);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
index 1a97feca77f2..570ebf91f693 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
@@ -3,6 +3,9 @@
 
 #include <linux/kernel.h>
 #include <linux/debugfs.h>
+
+#include <net/ipv6.h>
+
 #include "mtk_eth_soc.h"
 
 struct mtk_flow_addr_info
@@ -47,16 +50,14 @@ static const char *mtk_foe_pkt_type_str(int type)
 static void
 mtk_print_addr(struct seq_file *m, u32 *addr, bool ipv6)
 {
-	__be32 n_addr[4];
-	int i;
+	__be32 n_addr[IPV6_ADDR_WORDS];
 
 	if (!ipv6) {
 		seq_printf(m, "%pI4h", addr);
 		return;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(n_addr); i++)
-		n_addr[i] = htonl(addr[i]);
+	ipv6_addr_cpu_to_be32(n_addr, addr);
 	seq_printf(m, "%pI6", n_addr);
 }
 

-- 
2.43.0


