Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948B6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 13:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+boXdbMogvfewAHbLA+9P1L2X8HVuGx9eHYZNLtUj9Y=; b=ZATUbBvvgzuFO0
	snSNo227hpxLfvry5sUdUQ7LpHbFSyPIwQdeFKwM5iJ705dJ4aPST9yaosXYt6CLjeGVbWhsKqfGL
	sqDxUPDDICEdhOEmdvLX4uuDGBrRoyXt7UsEj4JqzVMhb5x1FiI5O5JOeTwShiah2awSkpgavC6Su
	/goUG0H7AAnf1dI/ZzdqauafMj2uAD7KcmQjjpxlpcDnRY5EUBPGJFWahEKZu+BQEkDNAMIFKQY86
	taIGwCg0SShcrkRmAjTTFZx6GixkiCF88BMd+J/9J95M43xO0ecnNdS9f8dA7vo44HWCQS+wALnJ/
	JjaZKcgR7I8LEbkIhFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJxkx-002p6U-TM; Tue, 15 Feb 2022 13:20:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJxkl-002p49-Tt; Tue, 15 Feb 2022 13:20:25 +0000
X-UUID: 69e7c5161f294fa182bff43507697da5-20220215
X-UUID: 69e7c5161f294fa182bff43507697da5-20220215
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1210741610; Tue, 15 Feb 2022 06:20:18 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 05:20:17 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 21:20:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Feb 2022 21:20:15 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <matthias.bgg@gmail.com>
CC: <chunkuang.hu@kernel.org>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <enric.balletbo@collabora.com>,
 <angelogioacchino.delregno@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [2/2] soc: mediatek: mmsys: add mmsys reset control for MT8186
Date: Tue, 15 Feb 2022 21:19:52 +0800
Message-ID: <20220215131952.27861-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220215131952.27861-1-rex-bc.chen@mediatek.com>
References: <20220215131952.27861-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_052023_987677_85E1D67B 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

Add mmsys reset control register offset 0x160 for MT8186.

This patch is based on mmsys patch for MT8186 on [1].
[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220215075953.3310-4-rex-bc.chen@mediatek.com/

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/soc/mediatek/mt8186-mmsys.h | 2 ++
 drivers/soc/mediatek/mtk-mmsys.c    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
index 7de329f2d729..c72ccf86ea28 100644
--- a/drivers/soc/mediatek/mt8186-mmsys.h
+++ b/drivers/soc/mediatek/mt8186-mmsys.h
@@ -52,6 +52,8 @@
 #define MT8186_DPI0_FROM_DITHER0			1
 #define MT8186_DPI0_FROM_RDMA0				2
 
+#define MT8186_MMSYS_SW0_RST_B				0x160
+
 static const struct mtk_mmsys_routes mmsys_mt8186_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index cab62c3eac05..4fc4c2c9ea20 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -63,6 +63,7 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.clk_driver = "clk-mt8186-mm",
 	.routes = mmsys_mt8186_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
+	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
 };
 
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
