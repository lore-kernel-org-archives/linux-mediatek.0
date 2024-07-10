Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174EDC3DA45
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 08:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MI5vuW1LnaMrn5kfyGwiG4y2NeFearCTZJahac3SH7k=; b=FfLwnZCFGuNZ09kuTrDaP6wwzZ
	1v6OHZf1yIv4KiSnl2ane0fmw6xLvOFZqOxrYQO7P/SkqGR26Ae3xthEAAyM3hl8qsVLBr4nVkdYL
	zv0A4YJUhTDm4eHuwMyA1MnuAVhHwMB0JkmCPFK+qeFe5aIC2BLYxKNhW81mWMYRuVG2ScNabMJlS
	IFbTGZihDICbYdo6sAQa5Ok2q1D6cr9N8CXv7hOemtT5CM8eFqSJKi2Xb//3bSk6FsezbSpXoqFEn
	0rjL1EDM4Y+v5mSnEqBH4aAVOxyw/Ki0QlUvPaKjQWTHFMTgUOleHXuVqdB8Z9aiXWmJOCm2oQefD
	X6ahuC+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSuk-00000009vg5-1zb7;
	Wed, 10 Jul 2024 08:43:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSuh-00000009vdy-3OVc;
	Wed, 10 Jul 2024 08:43:01 +0000
X-UUID: 653bc75c3e9811ef955bff358274dad2-20240710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MI5vuW1LnaMrn5kfyGwiG4y2NeFearCTZJahac3SH7k=;
	b=ompqiySmZiA3qhIaRBMTtm88iyHrQCfQvUm9oMuyHo5wA7D6k2iyr6smZu/skmDgZIrmYddwO0ljVcFQk5exDk6XAEGURmS+5sb3EL37n/DE5x3yvHJdG19n8qvmwvlp08psuU57uyUBLx1mkIw2f9O54WZ/QrPi2ijE50hRuzk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:32d82e5b-b95d-47f4-a7e7-a79b8b044655,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:ba885a6,CLOUDID:75062145-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 653bc75c3e9811ef955bff358274dad2-20240710
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1569678481; Wed, 10 Jul 2024 01:42:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jul 2024 16:42:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jul 2024 16:42:25 +0800
From: Shun-yi Wang <shun-yi.wang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, shun-yi.wang <shun-yi.wang@mediatek.com>
Subject: [PATCH RFC 1/1] remoteproc: mediatek: Support reserved CMA regions
Date: Wed, 10 Jul 2024 16:42:00 +0800
Message-ID: <20240710084200.6561-2-shun-yi.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240710084200.6561-1-shun-yi.wang@mediatek.com>
References: <20240710084200.6561-1-shun-yi.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.598500-8.000000
X-TMASE-MatchedRID: bPjU8R/NGeHeckYuh8C4OQ2IdVM+s7+jUAjrAJWsTe+CsBeCv8CM/az6
	uKpF6xLxqyiNfoPmYnRH3qAy0ABMwKFx4PiqFtlGtw+xHnsmQjPt/okBLaEo+IeUNQK7Qj5cVSd
	AA6mVeIaNy4aKfO9yVTl4fr3J7TtwnU4Y8605XzmTd7CJ8bYw01g3VqSTJ7SoyWCL+8tLbva+Un
	f56ZSSHOLzNWBegCW2wgn7iDBesS1YF3qW3Je6+7hP13miKAO1q/QrR1KGx2yjSCc90prGUVkuj
	HvdNL55pp1v2VcFzg/64xLte41bXiJAkpshrClmC2Elov3YnbR0/j0kEc2v0YCE5xpCtDRTUbJF
	yh4XXyqYo/TPOlMB4bCh3zE4wqa8wIE77PEBbml+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.598500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DFD53FDEE7BA199199010BC5F6077F30E6E3A8A1681A402B60B81F5CCAB7F07D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_014259_881087_C57D64E6 
X-CRM114-Status: GOOD (  15.73  )
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

From: "shun-yi.wang" <shun-yi.wang@mediatek.com>

In order to reserve specific Contiguous Memory Allocator (CMA) regions
for hardware use. When the name of the reserved region contains "cma",
then a corresponding CMA heap is added.

Signed-off-by: shun-yi.wang <shun-yi.wang@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 38 ++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e744c07507ee..ca0a4a52ece9 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -4,6 +4,7 @@
 
 #include <asm/barrier.h>
 #include <linux/clk.h>
+#include <linux/dma-heap.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -1006,22 +1007,43 @@ EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
 
 static int scp_map_memory_region(struct mtk_scp *scp)
 {
-	int ret;
+	int ret, i, err;
 	const struct mtk_scp_sizes_data *scp_sizes;
+	struct device_node *node = scp->dev->of_node;
+	struct of_phandle_iterator it;
+
+	i = 0;
+	of_for_each_phandle(&it, err, node, "memory-region", NULL, 0) {
+		ret = of_reserved_mem_device_init_by_idx(scp->dev, node, i);
+
+		if (ret) {
+			dev_err(scp->dev, "failed to assign memory-region: %s\n",
+				it.node->name);
+			of_node_put(it.node);
+			return -ENOMEM;
+		}
+
+#ifdef CONFIG_DMABUF_HEAPS_CMA
+		if (strstr(it.node->name, "cma")) {
+			/* Reserved cma memory region */
+			ret = dma_heap_add_cma(scp->dev);
+			if (ret) {
+				dev_err(scp->dev, "Failed to add reserved cma");
+				of_node_put(it.node);
+				return ret;
+			}
+		}
+#endif /* CONFIG_DMABUF_HEAPS_CMA */
 
-	ret = of_reserved_mem_device_init(scp->dev);
+		i++;
+	}
 
 	/* reserved memory is optional. */
-	if (ret == -ENODEV) {
+	if (!i) {
 		dev_info(scp->dev, "skipping reserved memory initialization.");
 		return 0;
 	}
 
-	if (ret) {
-		dev_err(scp->dev, "failed to assign memory-region: %d\n", ret);
-		return -ENOMEM;
-	}
-
 	/* Reserved SCP code size */
 	scp_sizes = scp->data->scp_sizes;
 	scp->cpu_addr = dma_alloc_coherent(scp->dev, scp_sizes->max_dram_size,
-- 
2.18.0


