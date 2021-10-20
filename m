Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8381C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:17:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75688610FF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75688610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYJLk6BDaNPTMpeyRaD08o+3TxWIvNXa2UmtjGFrJto=; b=UR3J0T2ftOUpGS
	saSSd6egO4KYd2MN6jRBk9D6/yEH0YOp9uj82NZpfOobepYseDLS56Y5Eu0gjPF5mqKsm4jumV+m+
	gQsQPdBQsjmERAZbeqq8JKRNZZuzJK2YxtMOIqWmeXMo3Kh5iiGTYLK1nalC8oqDCjgYvmOX7rynP
	6bECXv9RSSuNDEPL1pC0bWx4H78hF05aieW208stlJU3CBQxKBRGc7YfImrw8wc5yTzl4sZsMx2ux
	C/Qw+yCgS0DbzwfBH7r0grgKclOtUDbusErsfOsIXqeIWANU27L4zOHFF436q8R2TwlowDZFaqNh7
	WHeOPZPSDZlIFkJmyKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md5qM-003YnL-Q0; Wed, 20 Oct 2021 07:16:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md5p0-003Y5g-PN; Wed, 20 Oct 2021 07:15:37 +0000
X-UUID: f34e63b30f374cca9c813f93d7209711-20211020
X-UUID: f34e63b30f374cca9c813f93d7209711-20211020
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1797981576; Wed, 20 Oct 2021 00:15:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 00:15:30 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 20 Oct 2021 15:15:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Oct 2021 15:15:27 +0800
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
Subject: [PATCH v2 7/9] soc: mediatek: mutex: support mt8195 vppsys0/1
Date: Wed, 20 Oct 2021 15:14:46 +0800
Message-ID: <20211020071448.14187-8-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211020071448.14187-1-roy-cw.yeh@mediatek.com>
References: <20211020071448.14187-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_001534_915050_E3B2C29F 
X-CRM114-Status: GOOD (  11.94  )
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
Acked-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 53 ++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index c100a5249016..0e66b5ff916f 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -122,6 +122,23 @@
 #define MT8183_MDP_PIPE_WPEI			(MT8183_MUTEX_MDP_START + 2)
 #define MT8183_MDP_PIPE_WPEI2			(MT8183_MUTEX_MDP_START + 3)
 
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
@@ -266,6 +283,22 @@ static const unsigned int mt8183_mutex_mdp_offset[MDP_PIPE_MAX] = {
 	[MDP_PIPE_WPEI2] = MT8183_MDP_PIPE_WPEI2,
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
@@ -306,6 +339,22 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 	.no_clk = true,
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
@@ -614,6 +663,10 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8173_mutex_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-mutex",
 	  .data = &mt8183_mutex_driver_data},
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
