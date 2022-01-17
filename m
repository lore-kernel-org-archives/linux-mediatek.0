Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94547C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 05:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEqlNZU2YpHwNP4iDG4+FKB4VK8iq6QHmQDuACNc9Ac=; b=hVCeebH4ygeims
	//wWxzsczK8I6a6QKo/1JnewC/0n8L5XAAm3urdfXGOYhWEJOkMId+IMw8GyIbH7k07CWwNob6AM6
	V0iaLArd7rX5YL4DEQnAI582UZ5tgCVydL/+LL3cd+jJnRKI7TCwLcfeKTC3IbtBnI0gPzWCDw5mB
	Voraal6VMaxzPx/gu/OxEZwjDJQj1lkbeo6bcgzvvMBiAKHSVeQa6X60AE9pXwRCalFkH+rkJeIgh
	zFJelNZ3E+gPP9AMlzT70S6GcVo+OGvyNjukiQsg1BPIdONVOfGySZNVMKLvLm1DqHmbhwhd/DWff
	zN+6KUV2Lpjaa7F3Y7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Kxe-00DVuu-Vi; Mon, 17 Jan 2022 05:53:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9KxB-00DVkN-9o; Mon, 17 Jan 2022 05:53:18 +0000
X-UUID: 1161aa509fd74812b5d3e26ca16de2fc-20220116
X-UUID: 1161aa509fd74812b5d3e26ca16de2fc-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1394536819; Sun, 16 Jan 2022 22:53:10 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 17 Jan 2022 13:53:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 Jan 2022 13:53:07 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, "Roy-CW . Yeh" <roy-cw.yeh@mediatek.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 04/14] soc: mediatek: mutex: support mt8195 vppsys0/1
Date: Mon, 17 Jan 2022 13:52:44 +0800
Message-ID: <20220117055254.9777-5-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_215317_370285_341F767E 
X-CRM114-Status: GOOD (  11.43  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add mt8195 mdp mutex info to driver data of mtk-mutex

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 53 ++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 7da0f44b6f9a..dd6ef45b582a 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -186,6 +186,23 @@
 #define MT8183_MDP_PIPE_WPEI                   (MT8183_MUTEX_MDP_START + 2)
 #define MT8183_MDP_PIPE_WPEI2                  (MT8183_MUTEX_MDP_START + 3)
 
+#define MT8195_MUTEX_MDP_MOD_MASK		0xFFFFFFFF
+#define MT8195_MUTEX_MDP_MOD1_MASK		0x000000FF
+#define MT8195_MUTEX_MDP_SOF_MASK		0x00000007
+
+#define	MT8195_MDP_PIPE_WPEI			0
+#define	MT8195_MDP_PIPE_WPEI2			1
+#define	MT8195_MDP_PIPE_RDMA0			2
+#define	MT8195_MDP_PIPE_VPP1_SOUT		3
+
+#define	MT8195_MDP_PIPE_RDMA1			1
+#define	MT8195_MDP_PIPE_RDMA2			2
+#define	MT8195_MDP_PIPE_RDMA3			3
+
+#define	MT8195_MDP_PIPE_SPLIT			2
+#define	MT8195_MDP_PIPE_SPLIT2			3
+#define	MT8195_MDP_PIPE_VPP0_SOUT		4
+
 struct mtk_mutex {
 	int id;
 	bool claimed;
@@ -388,6 +405,22 @@ static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 		MT8195_MUTEX_SOF_DP_INTF1 | MT8195_MUTEX_EOF_DP_INTF1,
 };
 
+static const unsigned int mt8195_mutex_vpp0_offset[MDP_PIPE_MAX] = {
+	[MDP_PIPE_WPEI] = MT8195_MDP_PIPE_WPEI,
+	[MDP_PIPE_WPEI2] = MT8195_MDP_PIPE_WPEI2,
+	[MDP_PIPE_RDMA0] = MT8195_MDP_PIPE_RDMA0,
+	[MDP_PIPE_VPP1_SOUT] = MT8195_MDP_PIPE_VPP1_SOUT,
+};
+
+static const unsigned int mt8195_mutex_vpp1_offset[MDP_PIPE_MAX] = {
+	[MDP_PIPE_SPLIT] = MT8195_MDP_PIPE_SPLIT,
+	[MDP_PIPE_SPLIT2] = MT8195_MDP_PIPE_SPLIT2,
+	[MDP_PIPE_RDMA1] = MT8195_MDP_PIPE_RDMA1,
+	[MDP_PIPE_RDMA2] = MT8195_MDP_PIPE_RDMA2,
+	[MDP_PIPE_RDMA3] = MT8195_MDP_PIPE_RDMA3,
+	[MDP_PIPE_VPP0_SOUT] = MT8195_MDP_PIPE_SPLIT,
+};
+
 static const struct mtk_mutex_data mt2701_mutex_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
@@ -444,6 +477,22 @@ static const struct mtk_mutex_data mt8195_mutex_driver_data = {
 	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
 };
 
+static const struct mtk_mutex_data mt8195_vpp0_mutex_driver_data = {
+	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
+	.mutex_mdp_offset = mt8195_mutex_vpp0_offset,
+	.mutex_mdp_mod_mask = MT8195_MUTEX_MDP_MOD_MASK,
+	.mutex_mdp_sof_mask = MT8195_MUTEX_MDP_SOF_MASK,
+};
+
+static const struct mtk_mutex_data mt8195_vpp1_mutex_driver_data = {
+	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
+	.mutex_mdp_offset = mt8195_mutex_vpp1_offset,
+	.mutex_mdp_mod_mask = MT8195_MUTEX_MDP_MOD_MASK,
+	.mutex_mdp_sof_mask = MT8195_MUTEX_MDP_SOF_MASK,
+};
+
 struct mtk_mutex *mtk_mutex_get(struct device *dev)
 {
 	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
@@ -777,6 +826,10 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8192_mutex_driver_data},
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = &mt8195_mutex_driver_data},
+	{ .compatible = "mediatek,mt8195-vpp0-mutex",
+	  .data = &mt8195_vpp0_mutex_driver_data},
+	{ .compatible = "mediatek,mt8195-vpp1-mutex",
+	  .data = &mt8195_vpp1_mutex_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
