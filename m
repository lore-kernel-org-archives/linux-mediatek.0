Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5885FC07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D62061CB9
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D62061CB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r19a3T7ZZXERdnSaP2ecCGEtSaojN3lonXh3jp0raRo=; b=SKx3sCjF69afes
	5WYYMg/nfnhKPAld+9YNnybvWU8JuSIzUwuuIPKPMWGzS5EeFW8rLrzj5OaOflPZlKaLudRyX6gB6
	Du/mey5hMCGif2GTfuDTVaU/0ws5ruuX8qD6I1t7aj3I5u0JMp2DhiPSyYx6Zm+aguMSQmhk+th53
	HeendrJc4XO0B6u1LErA5m6YjEKj8vmsynaxb6f0xdrD4E4oTl/RkhKbHB/9cCQIYFp4dHdIhzKOU
	Jf4oVKgboycMw0qZYJnDbeoXpgdWsdCdjbLhMtpD2DlZ3/jnf159U6Z+qoBj/eBawf8ruhEL7AxiA
	r97IlbxEjqwB1Ea86i6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0yxe-00DJeS-Rt; Wed, 07 Jul 2021 04:14:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0yvw-00DIt3-LO; Wed, 07 Jul 2021 04:13:15 +0000
X-UUID: 5c1f8e20969040cb87166377608d4903-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wspaxkPlcA0L2SEag5Ij44sOEXw3MZVYk8ndI0D/+Y4=; 
 b=V16V+ZxY65q5ALfBopOZG2MoEpRzsgrzKhu10m4SeZi5u1Yb8O2ae4Wi20ueZQXZ+NXljK4HaKJYfqhJd6LPjqh+m99YAqanBhECQ1ImaUUCCw/YE0/bGqWa74UarJsxoAJlRFZBAA453iWRJV6pR0WkN7dVH75MkITYnxvljrk=;
X-UUID: 5c1f8e20969040cb87166377608d4903-20210706
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 627962526; Tue, 06 Jul 2021 21:13:00 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 21:12:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 12:12:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 7 Jul 2021 12:12:56 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v1 04/17] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Date: Wed, 7 Jul 2021 12:12:36 +0800
Message-ID: <20210707041249.29816-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_211312_746033_EF631E56 
X-CRM114-Status: GOOD (  19.33  )
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

1. Add mtk-mmsys support for mt8195 vodsys0.
2. Change the clock driver of vdosys0 is probed
   from the probe of mtk-mmsys.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8195-vdo0.c |  24 ++--
 drivers/soc/mediatek/mt8195-mmsys.h    | 173 +++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c       |  11 ++
 3 files changed, 198 insertions(+), 10 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
index 8e23f267a1e6..940be5377f70 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo0.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
@@ -94,20 +94,24 @@ static const struct mtk_clk_desc vdo0_desc = {
 	.num_clks = ARRAY_SIZE(vdo0_clks),
 };
 
-static const struct of_device_id of_match_clk_mt8195_vdo0[] = {
-	{
-		.compatible = "mediatek,mt8195-vdosys0",
-		.data = &vdo0_desc,
-	}, {
-		/* sentinel */
-	}
-};
+static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_onecell_data *clk_data;
+
+	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(vdo0_clks));
+
+	mtk_clk_register_gates(node, vdo0_clks, ARRAY_SIZE(vdo0_clks),
+			clk_data);
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
 
 static struct platform_driver clk_mt8195_vdo0_drv = {
-	.probe = mtk_clk_simple_probe,
+	.probe = clk_mt8195_vdo0_probe,
 	.driver = {
 		.name = "clk-mt8195-vdo0",
-		.of_match_table = of_match_clk_mt8195_vdo0,
 	},
 };
 
diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
new file mode 100644
index 000000000000..47f3d0ea3c6c
--- /dev/null
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -0,0 +1,173 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
+#define __SOC_MEDIATEK_MT8195_MMSYS_H
+
+#define MT8195_VDO0_OVL_MOUT_EN					0xf14
+#define MOUT_DISP_OVL0_TO_DISP_RDMA0				BIT(0)
+#define MOUT_DISP_OVL0_TO_DISP_WDMA0				BIT(1)
+#define MOUT_DISP_OVL0_TO_DISP_OVL1				BIT(2)
+#define MOUT_DISP_OVL1_TO_DISP_RDMA1				BIT(4)
+#define MOUT_DISP_OVL1_TO_DISP_WDMA1				BIT(5)
+#define MOUT_DISP_OVL1_TO_DISP_OVL0				BIT(6)
+
+#define MT8195_VDO0_SEL_IN					0xf34
+#define SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT			(0 << 0)
+#define SEL_IN_VPP_MERGE_FROM_DISP_DITHER1			(1 << 0)
+#define SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0			(2 << 0)
+#define SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0			(0 << 4)
+#define SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE			(1 << 4)
+#define SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1			(0 << 5)
+#define SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE			(1 << 5)
+#define SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE			(0 << 8)
+#define SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT			(1 << 8)
+#define SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT			(0 << 9)
+#define SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT			(0 << 12)
+#define SEL_IN_DP_INTF0_FROM_VPP_MERGE				(1 << 12)
+#define SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0			(2 << 12)
+#define SEL_IN_DSI0_FROM_DSC_WRAP0_OUT				(0 << 16)
+#define SEL_IN_DSI0_FROM_DISP_DITHER0				(1 << 16)
+#define SEL_IN_DSI1_FROM_DSC_WRAP1_OUT				(0 << 17)
+#define SEL_IN_DSI1_FROM_VPP_MERGE				(1 << 17)
+#define SEL_IN_DISP_WDMA1_FROM_DISP_OVL1			(0 << 20)
+#define SEL_IN_DISP_WDMA1_FROM_VPP_MERGE			(1 << 20)
+#define SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN			(0 << 21)
+#define SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1			(1 << 21)
+#define SEL_IN_DISP_WDMA0_FROM_DISP_OVL0			(0 << 22)
+#define SEL_IN_DISP_WDMA0_FROM_VPP_MERGE			(1 << 22)
+
+#define MT8195_VDO0_SEL_OUT					0xf38
+#define SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN			(0 << 0)
+#define SOUT_DISP_DITHER0_TO_DSI0				(1 << 0)
+#define SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN			(0 << 1)
+#define SOUT_DISP_DITHER1_TO_VPP_MERGE				(1 << 1)
+#define SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT			(2 << 1)
+#define SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE				(0 << 4)
+#define SOUT_VDO1_VIRTUAL0_TO_DP_INTF0				(1 << 4)
+#define SOUT_VPP_MERGE_TO_DSI1					(0 << 8)
+#define SOUT_VPP_MERGE_TO_DP_INTF0				(1 << 8)
+#define SOUT_VPP_MERGE_TO_SINA_VIRTUAL0				(2 << 8)
+#define SOUT_VPP_MERGE_TO_DISP_WDMA1				(3 << 8)
+#define SOUT_VPP_MERGE_TO_DSC_WRAP0_IN				(4 << 8)
+#define SOUT_VPP_MERGE_TO_DSC_WRAP1_IN				(0 << 11)
+#define SOUT_VPP_MERGE_TO_DISP_WDMA0				(1 << 11)
+#define SOUT_DSC_WRAP0_OUT_TO_DSI0				(0 << 12)
+#define SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0			(1 << 12)
+#define SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE				(2 << 12)
+#define SOUT_DSC_WRAP1_OUT_TO_DSI1				(0 << 16)
+#define SOUT_DSC_WRAP1_OUT_TO_DP_INTF0				(1 << 16)
+#define SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0			(2 << 16)
+#define SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE				(3 << 16)
+
+#define MT8195_VDO1_VPP3_ASYNC_SOUT				0xf54
+#define SOUT_TO_VPP_MERGE0_P0_SEL				(0 << 0)
+#define SOUT_TO_VPP_MERGE0_P1_SEL				(1 << 0)
+
+#define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL			0xf40
+#define SOUT_TO_HDR_VDO_FE0					(0 << 0)
+
+#define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL			0xf44
+#define SOUT_TO_HDR_VDO_FE1					(0 << 0)
+
+#define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL			0xf48
+#define SOUT_TO_HDR_GFX_FE0					(0 << 0)
+
+#define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL			0xf4c
+#define SOUT_TO_HDR_GFX_FE1					(0 << 0)
+
+#define MT8195_VDO1_MIXER_IN1_SOUT_SEL				0xf58
+#define MIXER_IN1_SOUT_TO_DISP_MIXER				(0 << 0)
+
+#define MT8195_VDO1_MIXER_IN2_SOUT_SEL				0xf5c
+#define MIXER_IN2_SOUT_TO_DISP_MIXER				(0 << 0)
+
+#define MT8195_VDO1_MIXER_IN3_SOUT_SEL				0xf60
+#define MIXER_IN3_SOUT_TO_DISP_MIXER				(0 << 0)
+
+#define MT8195_VDO1_MIXER_IN4_SOUT_SEL				0xf64
+#define MIXER_IN4_SOUT_TO_DISP_MIXER				(0 << 0)
+
+#define MT8195_VDO1_MIXER_OUT_SOUT_SEL				0xf34
+#define MIXER_SOUT_TO_HDR_VDO_BE0				(0 << 0)
+
+#define MT8195_VDO1_MERGE4_SOUT_SEL				0xf18
+#define MERGE4_SOUT_TO_VDOSYS0					(0 << 0)
+#define MERGE4_SOUT_TO_DPI0_SEL					(1 << 0)
+#define MERGE4_SOUT_TO_DPI1_SEL					(2 << 0)
+#define MERGE4_SOUT_TO_DP_INTF0_SEL				(3 << 0)
+
+#define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
+#define VPP_MERGE0_P0_SEL_IN_FROM_SVPP2				(0 << 0)
+#define VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0			(1 << 0)
+
+#define MT8195_VDO1_VPP_MERGE0_P1_SEL_IN			0xf08
+#define VPP_MERGE0_P1_SEL_IN_FROM_SVPP3				(0 << 0)
+#define VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1			(1 << 0)
+
+#define MT8195_VDO1_VPP_MERGE1_P0_SEL_IN			0xf3c
+#define VPP_MERGE1_P0_SEL_IN_FROM_VPP3_ASYNC_SOUT		(0 << 0)
+#define VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2			(1 << 0)
+
+#define MT8195_VDO1_MIXER_IN1_SEL_IN				0xf24
+#define MIXER_IN1_SEL_IN_FROM_HDR_VDO_FE0			(0 << 0)
+#define MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT			(1 << 0)
+
+#define MT8195_VDO1_MIXER_IN2_SEL_IN				0xf28
+#define MIXER_IN2_SEL_IN_FROM_HDR_VDO_FE1			(0 << 0)
+#define MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT			(1 << 0)
+
+#define MT8195_VDO1_MIXER_IN3_SEL_IN				0xf2c
+#define MIXER_IN3_SEL_IN_FROM_HDR_GFX_FE0			(0 << 0)
+#define MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT			(1 << 0)
+
+#define MT8195_VDO1_MIXER_IN4_SEL_IN				0xf30
+#define MIXER_IN4_SEL_IN_FROM_HDR_GFX_FE1			(0 << 0)
+#define MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT			(1 << 0)
+
+#define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
+#define MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			(0 << 0)
+#define MIXER_SOUT_SEL_IN_FROM_MIXER_IN1_SOUT			(1 << 0)
+#define MIXER_SOUT_SEL_IN_FROM_MIXER_IN2_SOUT			(2 << 0)
+#define MIXER_SOUT_SEL_IN_FROM_MIXER_IN3_SOUTR			(3 << 0)
+#define MIXER_SOUT_SEL_IN_FROM_MIXER_IN4_SOUTR			(4 << 0)
+
+#define MT8195_VDO1_MERGE4_ASYNC_SEL_IN				0xf50
+#define MERGE4_ASYNC_SEL_IN_FROM_HDR_VDO_BE0			(0 << 0)
+#define MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT			(1 << 0)
+#define MERGE4_ASYNC_SEL_IN_FROM_MERGE0_ASYNC_SOUT		(2 << 0)
+#define MERGE4_ASYNC_SEL_IN_FROM_MERGE1_ASYNC_SOUT		(3 << 0)
+#define MERGE4_ASYNC_SEL_IN_FROM_MERGE2_ASYNC_SOUT		(4 << 0)
+#define MERGE4_ASYNC_SEL_IN_FROM_MERGE3_ASYNC_SOUT		(5 << 0)
+
+#define MT8195_VDO1_DISP_DPI0_SEL_IN				0xf0c
+#define DISP_DPI0_SEL_IN_FROM_VPP_MERGE4_MOUT			(0 << 0)
+#define DISP_DPI0_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT		(1 << 0)
+#define DISP_DPI0_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT		(2 << 0)
+
+#define MT8195_VDO1_DISP_DPI1_SEL_IN				0xf10
+#define DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT			(0 << 0)
+#define DISP_DPI1_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT		(1 << 0)
+#define DISP_DPI1_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT		(2 << 0)
+
+#define MT8195_VDO1_DISP_DP_INTF0_SEL_IN			0xf14
+#define DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT		(0 << 0)
+#define DISP_DP_INTF0_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT	(1 << 0)
+#define DISP_DP_INTF0_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT	(2 << 0)
+
+static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8195_VDO0_OVL_MOUT_EN, MOUT_DISP_OVL0_TO_DISP_RDMA0
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_RDMA1,
+		MT8195_VDO0_OVL_MOUT_EN, MOUT_DISP_OVL1_TO_DISP_RDMA1
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_IN, SEL_IN_DSI0_FROM_DISP_DITHER0
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_OUT, DDP_COMPONENT_DSI0
+	}
+};
+
+#endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 080660ef11bf..1fb241750897 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -13,6 +13,7 @@
 #include "mtk-mmsys.h"
 #include "mt8167-mmsys.h"
 #include "mt8183-mmsys.h"
+#include "mt8195-mmsys.h"
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
@@ -52,6 +53,12 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
+	.clk_driver = "clk-mt8195-vdo0",
+	.routes = mmsys_mt8195_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
+};
+
 struct mtk_mmsys {
 	void __iomem *regs;
 	const struct mtk_mmsys_driver_data *data;
@@ -157,6 +164,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8183-mmsys",
 		.data = &mt8183_mmsys_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8195-vdosys0",
+		.data = &mt8195_vdosys0_driver_data,
+	},
 	{ }
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
