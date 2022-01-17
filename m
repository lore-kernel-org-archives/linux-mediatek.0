Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D640FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 06:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diu5WxVnKGRJ8UVkANGYNWQpbuoKTWOr1q4c99HS9Lw=; b=ySKOQKS8kEeiN9
	f+/0Vh2sm3G+J9qliV6I3wkS0uy4suxCDZ9Nj4Q/X9s8zmQPvb2x8OShNDSkTObIf8zwEfRf7sVqe
	SjUtj7kBlEFS1mOXa+FvnkNfwUyJ3LWhy6SjRjVyjFsGSaKEcXe/7spcXdSSgpe8aAz4AXvV6TEbV
	mo3t5Cwkbxzy0uIMnrbazQnb95aES91rmXQEjenUPRO5ldoXGrTjdC/SOEgkiK0Gh/xDEQFtQkgDe
	vJAH6ri8m1UhxyGww/HGYE1hd+3Qk0L9xSEqv3BUy4EvnxJvGESJ0AlkSYpGOKxjA1SF+U3AA/tTx
	ZXmEitrjFp4GZvHGVUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9L8B-00DZ8S-LR; Mon, 17 Jan 2022 06:04:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9L6p-00DYUz-D6; Mon, 17 Jan 2022 06:03:17 +0000
X-UUID: 575bf5d3846b4588ae482d316adbee1c-20220116
X-UUID: 575bf5d3846b4588ae482d316adbee1c-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 479686079; Sun, 16 Jan 2022 23:03:10 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 13:53:07 +0800
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
Subject: [PATCH v1 03/14] soc: mediatek: mmsys: support mt8195 vppsys0/1
Date: Mon, 17 Jan 2022 13:52:43 +0800
Message-ID: <20220117055254.9777-4-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_220315_491866_ABE7681D 
X-CRM114-Status: GOOD (  16.36  )
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

Add mt8195 vppsys driver data
Add interface for mdp to set config table

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h    | 23 +++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c       | 22 ++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.h       |  3 +++
 include/linux/soc/mediatek/mtk-mmsys.h |  4 ++++
 4 files changed, 52 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index e04cabdfa2dc..460d55e3ef86 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -165,6 +165,18 @@
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		BIT(17)
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(BIT(17) | BIT(16))
 
+/* VPPSYS0 */
+#define VPPSYS0_HW_DCM_1ST_DIS0					0x050
+
+/* VPPSYS1 */
+#define VPPSYS1_HW_DCM_1ST_DIS0					0x150
+#define VPPSYS1_HW_DCM_1ST_DIS1					0x160
+#define VPPSYS1_HW_DCM_2ND_DIS0					0x1a0
+#define VPPSYS1_HW_DCM_2ND_DIS1					0x1b0
+#define VPP0_DL_IRELAY_WR					0x920
+#define SVPP2_BUF_BF_RSZ_SWITCH					0xf48
+#define SVPP3_BUF_BF_RSZ_SWITCH					0xf74
+
 static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
@@ -217,4 +229,15 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	}
 };
 
+static const u32 mmsys_mt8195_mdp_vppsys_config_table[] = {
+	VPPSYS0_HW_DCM_1ST_DIS0,
+	VPP0_DL_IRELAY_WR,
+	VPPSYS1_HW_DCM_1ST_DIS0,
+	VPPSYS1_HW_DCM_1ST_DIS1,
+	VPPSYS1_HW_DCM_2ND_DIS0,
+	VPPSYS1_HW_DCM_2ND_DIS1,
+	SVPP2_BUF_BF_RSZ_SWITCH,
+	SVPP3_BUF_BF_RSZ_SWITCH,
+};
+
 #endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index a6ae10946eb6..c7beaa61ad64 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -79,10 +79,16 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 
 static const struct mtk_mmsys_driver_data mt8195_vppsys0_driver_data = {
 	.clk_driver = "clk-mt8195-vpp0",
+	.mdp_mmsys_configs = mmsys_mt8195_mdp_vppsys_config_table,
+	.mdp_num_mmsys_configs = ARRAY_SIZE(mmsys_mt8195_mdp_vppsys_config_table),
+	.vppsys = true,
 };
 
 static const struct mtk_mmsys_driver_data mt8195_vppsys1_driver_data = {
 	.clk_driver = "clk-mt8195-vpp1",
+	.mdp_mmsys_configs = mmsys_mt8195_mdp_vppsys_config_table,
+	.mdp_num_mmsys_configs = ARRAY_SIZE(mmsys_mt8195_mdp_vppsys_config_table),
+	.vppsys = true,
 };
 
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
@@ -137,6 +143,18 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
+void mtk_mmsys_mdp_write_config(struct device *dev,
+				struct mmsys_cmdq_cmd *cmd,
+				u32 alias_id, u32 value, u32 mask)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	const u32 *configs = mmsys->data->mdp_mmsys_configs;
+
+	cmdq_pkt_write_mask(cmd->pkt, mmsys->cmdq_base.subsys,
+			    mmsys->addr + configs[alias_id], value, mask);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_mdp_write_config);
+
 void mtk_mmsys_write_reg_by_cmdq(struct device *dev,
 				 struct mmsys_cmdq_cmd *cmd,
 				 u32 offset, u32 value, u32 mask)
@@ -367,6 +385,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	if (IS_ERR(clks))
 		return PTR_ERR(clks);
 
+	if (mmsys->data->vppsys)
+		goto EXIT;
+
 	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
 					    PLATFORM_DEVID_AUTO, NULL, 0);
 	if (IS_ERR(drm)) {
@@ -374,6 +395,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return PTR_ERR(drm);
 	}
 
+EXIT:
 	return 0;
 }
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index ad8b92389b54..909713a28c14 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -94,6 +94,9 @@ struct mtk_mmsys_driver_data {
 	const unsigned int num_routes;
 	bool has_gce_client_reg;
 	const unsigned int *mdp_isp_ctrl;
+	const u32 *mdp_mmsys_configs;
+	const unsigned int mdp_num_mmsys_configs;
+	bool vppsys;
 };
 
 /*
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index a772e53af9b5..946d161c8937 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -194,4 +194,8 @@ void mtk_mmsys_mdp_camin_ctrl(struct device *dev, struct mmsys_cmdq_cmd *cmd,
 			      enum mtk_mdp_comp_id id,
 			      u32 camin_w, u32 camin_h);
 
+void mtk_mmsys_mdp_write_config(struct device *dev,
+				struct mmsys_cmdq_cmd *cmd,
+				u32 alias_id, u32 value, u32 mask);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
