Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24BC60A260A
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 03:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W07afmxw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HOKrsoaS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6CQ4RwIsSCwf2AmMEER4NNMj+9APkwXuHhKo0yLcbVM=; b=W07afmxw4ALFoN
	KBPKBm1QNBAVHKPQqGZoeid1tgebnBrk8hr+UGZRa8VJiQeL5dLplIOBwd4VO4aW5VntbA+mbzdEK
	3SRF4aYYLn1zwUQ2t8j5y69p+YxHOVKiFGfeDlnJOKkDWSVrEC+Q7fzhru3m4uEtDvNwKZMlSAPCV
	81U1JsEC5fi4Zl7oemL9Uxwdd+t++d8lPkT6fqPTG21wDi5+4U4yIP5Hu5MHLVozEoehx8grjN8Lm
	5ZELIv9ategEN3JpmssJrRtX8Ag0rRVDlNkRh0e82LOJYfB8KLhPQzwJkvq8wKyirIhD48TAJp6n7
	05hiqoer1JbweORzNiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFFP-0000000Dx50-3IMO;
	Fri, 20 Nov 2026 03:25:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFFO-0000000Dx3t-2ICk;
	Fri, 20 Nov 2026 03:25:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CB2F41AB6;
	Fri, 20 Nov 2026 03:25:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795145110;
	b=hYhGe2DoH4gjJCquTkcChI58RxcF9/uAG6SAmuIN51Fay6ckqeet3GAOvlwnfPpgnWVX
	 HB8j+GNKrE7KeShZrM9OQNKbV1w0UhtjVzeJ4I0F4BBHSTy0/eOUOFZdXOasQgHCbutZq
	 ocp7fvI0eyt1mJ1OjQzp1c74HtZUcqFgfWNakX2+PK27Quo68jLdS+l9+ASnU+18+z8ko
	 DqaWmhihux01+Pj83gogjXN8Jes91VMEMHDwlYPpqX2yTq+vXvGjikhutLyks+RWX0Rsc
	 lofbmSdEXoChiHOHHLFPPYmY7q++ww1DRXtqYaAjoUnFq8erKu+M1QMmQr5yic/BqsA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795145110;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=6CQ4RwIsSCwf2AmMEER4NNMj+9APkwXuHhKo0yLcbVM=;
	b=dVK53EPC+Crf6kmvsfGMuiKJWQuMoWB4H2RdXm/L87RD7k+bzdViQjfVi5V7+vBLZs7l
	 53PJCfOqqxNwBZ1RK8mhVyc+plwA7gS5I8l8RBw4+sQRxVwrFD3LMZm3w63e310vaczvp
	 Q86gHrB3mETwOkdhFL/jjARvWWKFPG3a2cq2/EdEPTwv/FcIMzOgV4CDKgzw1dL/8AFrK
	 /miY7yxynwvMgAFKL2g7A2ghvQiy2Ba6qWcutdCTpCkG1Y57SQ/KE3lz//VNl8TN0xTYn
	 wlj7eV43G4V047u6hKgdCYP1XtdvU/Q8dpSGxXNKND3QUquIQzcs+dH5TBYCk8PH78w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1160C1F000D0;
	Fri, 20 Nov 2026 03:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795145110;
	bh=6CQ4RwIsSCwf2AmMEER4NNMj+9APkwXuHhKo0yLcbVM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HOKrsoaSRjphNQOUTZ92An9tt6+xHFA49QF9JaBgeAafrCPbSjA3w62HZUskPz3ae
	 cBBIFia3lY+svc1ySYLMsAdFoTmVHxHowOTjfzM4U4mO6IQdREQ4Q48tRn78EDzF3K
	 LjSCRcN3/Aupq1d8dIidHsZA6Ml+FFqokwDJRQlryQ8I/ZLiHaOr2F07gUxoohpREH
	 2kN4A+/cAM3R2k6HGteG0EB05aHzMiDVdNKFRghzwLJmJG/1n6WwxByX1mlV3/EoLd
	 AY7O2XgqdmjJDGL6VLpHVK9dnZd7O8KI4NNOq0urabEKVdKvAL/wO0FBWByQirJA0L
	 cq4L+miRLsQZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8FC2C49581;
	Fri, 20 Nov 2026 03:25:08 +0000 (UTC)
From: Congcong Yao via B4 Relay <devnull+congcong.yao.mediatek.com@kernel.org>
Date: Fri, 20 Nov 2026 11:24:56 +0800
Subject: [PATCH v13 2/2] memory: mtk-smi: mt8188: Add SMI reset and clamp
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-8188-smi-clamp-reset-v13-2-9a9516e81c1d@mediatek.com>
References: <20261120-8188-smi-clamp-reset-v13-0-9a9516e81c1d@mediatek.com>
In-Reply-To: <20261120-8188-smi-clamp-reset-v13-0-9a9516e81c1d@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Friday Yang <friday.yang@mediatek.com>, 
 Congcong Yao <congcong.yao@mediatek.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145107; l=8390;
 i=congcong.yao@mediatek.com; s=20260722; h=from:subject:message-id;
 bh=sy/zYJrfiLSDfi1YF3uJe1dLxyJUidxbNuEHEhkjjL4=;
 b=vEQbEwKrUX+gm6Fw4C4MxCyBOIsb0Zyh4HTMvtakjBnGc50BnpTanfJkLmBpnJi+taC1lr+Hj
 mRwWvc+3fo0AMC+f4FzxD9mYHgHe77X+hjQdP7XveTM0jTrROuIyBY+
X-Developer-Key: i=congcong.yao@mediatek.com; a=ed25519;
 pk=tIrmGxKQQxnfyb48iCCd19063tppPj89U3nupGYAIxg=
X-Endpoint-Received: by B4 Relay for congcong.yao@mediatek.com/20260722
 with auth_id=889
X-Original-From: Congcong Yao <congcong.yao@mediatek.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: congcong.yao@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Friday Yang <friday.yang@mediatek.com>

To prevent handling glitch signals during MTCMOS on/off transitions,
SMI requires clamp and reset operations. Parse the reset settings for
SMI LARBs and the clamp settings for the SMI Sub-Common. Register
genpd callback for the SMI LARBs located in image, camera and IPE
subsystems, and apply reset and clamp operations within the callback.

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
Signed-off-by: Congcong Yao <congcong.yao@mediatek.com>
---
 drivers/memory/mtk-smi.c | 120 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 0ebbaf3411aa..5ec277fea04f 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -14,7 +14,9 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/soc/mediatek/mtk_sip_svc.h>
 #include <soc/mediatek/smi.h>
 #include <dt-bindings/memory/mt2701-larb-port.h>
@@ -34,6 +36,8 @@
 #define SMI_FIFO_TH1			0x238
 #define SMI_FIFO_TH2			0x23c
 #define SMI_DCM				0x300
+#define SMI_COMMON_CLAMP_EN_SET		0x3c4
+#define SMI_COMMON_CLAMP_EN_CLR		0x3c8
 #define SMI_DUMMY			0x444
 
 /* SMI LARB */
@@ -134,6 +138,7 @@ struct mtk_smi_larb_gen {
 	unsigned int			larb_direct_to_common_mask;
 	unsigned int			flags_general;
 	const u8			(*ostd)[SMI_LARB_PORT_NR_MAX];
+	const u8			*clamp_port;
 };
 
 struct mtk_smi {
@@ -150,6 +155,7 @@ struct mtk_smi {
 };
 
 struct mtk_smi_larb { /* larb: local arbiter */
+	struct device			*dev;
 	struct mtk_smi			smi;
 	void __iomem			*base;
 	struct device			*smi_common_dev; /* common or sub-common dev */
@@ -158,6 +164,9 @@ struct mtk_smi_larb { /* larb: local arbiter */
 	u32				*mmu;
 	unsigned char			*bank;
 	bool				bound; /* set once the iommu binds us */
+	u8				smi_comm_in_port_id; /* smi-comm or sub-comm */
+	struct notifier_block		nb;
+	struct reset_control		*rst_con;
 };
 
 static int
@@ -514,6 +523,19 @@ static const u8 mtk_smi_larb_mt8195_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[28] = {0x1a, 0x0e, 0x0a, 0x0a, 0x0c, 0x0e, 0x10,},
 };
 
+static const u8 mtk_smi_larb_clamp_port_mt8188[MTK_LARB_NR_MAX] = {
+	[9]	= BIT(1), /* larb10 */
+	[10]	= BIT(2), /* larb11a */
+	[11]	= BIT(2), /* larb11b */
+	[12]	= BIT(3), /* larb11c */
+	[13]	= BIT(0), /* larb12 */
+	[16]	= BIT(1), /* larb15 */
+	[17]	= BIT(2), /* larb16a */
+	[18]	= BIT(2), /* larb16b */
+	[19]	= BIT(3), /* larb17a */
+	[20]	= BIT(3), /* larb17b */
+};
+
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt2701 = {
 	.port_in_larb = {
 		LARB0_PORT_OFFSET, LARB1_PORT_OFFSET,
@@ -567,6 +589,7 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8188 = {
 	.flags_general	            = MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_SW_FLAG |
 				      MTK_SMI_FLAG_SLEEP_CTL | MTK_SMI_FLAG_CFG_PORT_SEC_CTL,
 	.ostd		            = mtk_smi_larb_mt8188_ostd,
+	.clamp_port                 = mtk_smi_larb_clamp_port_mt8188,
 };
 
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8189 = {
@@ -626,6 +649,43 @@ static void mtk_smi_larb_sleep_ctrl_disable(struct mtk_smi_larb *larb)
 	writel_relaxed(0, larb->base + SMI_LARB_SLP_CON);
 }
 
+static void mtk_smi_larb_clamp_protect_enable(struct mtk_smi_larb *larb, bool enable)
+{
+	struct mtk_smi *common = dev_get_drvdata(larb->smi_common_dev);
+	u32 clamp_offset;
+
+	clamp_offset = enable ? SMI_COMMON_CLAMP_EN_SET : SMI_COMMON_CLAMP_EN_CLR;
+	writel(larb->smi_comm_in_port_id, common->base + clamp_offset);
+}
+
+static int mtk_smi_genpd_callback(struct notifier_block *nb,
+				  unsigned long event, void *data)
+{
+	struct mtk_smi_larb *larb = container_of(nb, struct mtk_smi_larb, nb);
+	int ret;
+
+	switch (event) {
+	case GENPD_NOTIFY_PRE_ON:
+	case GENPD_NOTIFY_PRE_OFF:
+		/* Clamp this larb to avoid the redundant commands */
+		mtk_smi_larb_clamp_protect_enable(larb, true);
+		break;
+	case GENPD_NOTIFY_ON:
+		ret = reset_control_reset(larb->rst_con);
+		if (ret) {
+			dev_err(larb->dev, "Failed to reset smi larb %d\n", ret);
+			return NOTIFY_BAD;
+		}
+
+		mtk_smi_larb_clamp_protect_enable(larb, false);
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
 static int mtk_smi_device_link_common(struct device *dev, struct device **com_dev)
 {
 	struct platform_device *smi_com_pdev;
@@ -685,6 +745,28 @@ static int mtk_smi_dts_clk_init(struct device *dev, struct mtk_smi *smi,
 	return ret;
 }
 
+static int mtk_smi_larb_parse_reset(struct mtk_smi_larb *larb)
+{
+	struct device *dev = larb->dev;
+	int ret;
+
+	larb->smi_comm_in_port_id = larb->larb_gen->clamp_port[larb->larbid];
+	larb->rst_con = devm_reset_control_get_exclusive(dev, "larb");
+	if (IS_ERR(larb->rst_con))
+		return dev_err_probe(dev, PTR_ERR(larb->rst_con),
+				     "Failed to get reset controller\n");
+
+	larb->nb.notifier_call = mtk_smi_genpd_callback;
+	ret = dev_pm_genpd_add_notifier(dev, &larb->nb);
+	if (ret) {
+		larb->nb.notifier_call = NULL;
+		return dev_err_probe(dev, ret,
+				     "Failed to add genpd callback\n");
+	}
+
+	return 0;
+}
+
 static int mtk_smi_larb_probe(struct platform_device *pdev)
 {
 	struct mtk_smi_larb *larb;
@@ -695,6 +777,7 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 	if (!larb)
 		return -ENOMEM;
 
+	larb->dev = dev;
 	larb->larb_gen = of_device_get_match_data(dev);
 	larb->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(larb->base))
@@ -711,15 +794,41 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	pm_runtime_enable(dev);
 	platform_set_drvdata(pdev, larb);
+
+	/* The larbid are sequential for IOMMU if this property is not present */
+	ret = of_property_read_u32(dev->of_node, "mediatek,larb-id", &larb->larbid);
+	if (ret == -EINVAL)
+		goto pm_runtime_en;
+	if (ret || larb->larbid >= MTK_LARB_NR_MAX) {
+		ret = -EINVAL;
+		goto err_link_remove;
+	}
+
+	/*
+	 * Only SMI LARBs in camera, image and IPE subsys need to
+	 * apply clamp and reset operations, others can be skipped.
+	 */
+	if (larb->larb_gen->clamp_port && larb->larb_gen->clamp_port[larb->larbid]) {
+		ret = mtk_smi_larb_parse_reset(larb);
+		if (ret)
+			goto err_link_remove;
+	}
+
+pm_runtime_en:
+	pm_runtime_enable(dev);
 	ret = component_add(dev, &mtk_smi_larb_component_ops);
 	if (ret)
 		goto err_pm_disable;
 	return 0;
 
 err_pm_disable:
+	if (larb->nb.notifier_call)
+		dev_pm_genpd_remove_notifier(&pdev->dev);
+
 	pm_runtime_disable(dev);
+
+err_link_remove:
 	device_link_remove(dev, larb->smi_common_dev);
 	put_device(larb->smi_common_dev);
 	return ret;
@@ -729,6 +838,9 @@ static void mtk_smi_larb_remove(struct platform_device *pdev)
 {
 	struct mtk_smi_larb *larb = platform_get_drvdata(pdev);
 
+	if (larb->nb.notifier_call)
+		dev_pm_genpd_remove_notifier(&pdev->dev);
+
 	device_link_remove(&pdev->dev, larb->smi_common_dev);
 	pm_runtime_disable(&pdev->dev);
 	component_del(&pdev->dev, &mtk_smi_larb_component_ops);
@@ -865,6 +977,11 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8188_vpp = {
 	.init     = mtk_smi_common_mt8195_init,
 };
 
+static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8188 = {
+	.type     = MTK_SMI_GEN2_SUB_COMM,
+	.has_gals = true,
+};
+
 static const struct mtk_smi_common_plat mtk_smi_common_mt8189 = {
 	.type     = MTK_SMI_GEN2,
 	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(3) | F_MMU1_LARB(5) |
@@ -920,6 +1037,7 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt8186-smi-common", .data = &mtk_smi_common_mt8186},
 	{.compatible = "mediatek,mt8188-smi-common-vdo", .data = &mtk_smi_common_mt8188_vdo},
 	{.compatible = "mediatek,mt8188-smi-common-vpp", .data = &mtk_smi_common_mt8188_vpp},
+	{.compatible = "mediatek,mt8188-smi-sub-common", .data = &mtk_smi_sub_common_mt8188},
 	{.compatible = "mediatek,mt8189-smi-common",     .data = &mtk_smi_common_mt8189},
 	{.compatible = "mediatek,mt8189-smi-sub-common", .data = &mtk_smi_sub_common_mt8189},
 	{.compatible = "mediatek,mt8192-smi-common", .data = &mtk_smi_common_mt8192},

-- 
2.43.0



