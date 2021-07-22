Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFA8C63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:47:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEB8F61241
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEB8F61241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PXzgMP0G7q01jsiGLxQuMzgKyj5kM4Dw+alLRbOyD8=; b=PEd1sFTQCVHLc0
	RhoU+yAepjJ0xuMABvSHRohfemVnoR6dvQi7pOss+s3x4m8uBEPFSsNhLW8DvkPw7yWleB4+9YAJ5
	QoFStZilmC28492J67u7cwIDvIYkabqMFkmUsMZ9L4HIEKjj7Fqv4cNioAFlQ82JK9YqutXhfloDv
	+wzBDpe291JQ0csS+gcUHmBPQASbg02T1gskeLbJogfxvRXhXmRevdxxpisTMyDfnSKakUL9hIsEK
	Tcj7thAMO7OaB6sGe0rRmYxzePTU4hJL7L3u93acE8v2w3Rb2iNmz4fViSGzO170nSHRUrYzE98om
	7/nROUJGs8iYoBm8EzBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6VIJ-000zGv-4M; Thu, 22 Jul 2021 09:47:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6VHD-000ypO-O3; Thu, 22 Jul 2021 09:46:02 +0000
X-UUID: 3d51dd21cf904b55b666be14e5d2dd6e-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EgMENEdpqVfBBwiS1wiZU8w16T8cV1vEPUbhMPm9q/c=; 
 b=Jsm8hWNHEiSVeBVTqYL/UKMT1cz6CV53Dbb4VsBznvKdcC6yWpN0ZlmsyAVAfa5++WRdVGOgCyOSYKOQtb3GQkMCWWrfTaysuk0NYldP8HHAtuq623f2hWkHHhQ8VNQCWSanHZGpmmduHUvaozh9SiskuMVuPbBibSM+MbYqKnQ=;
X-UUID: 3d51dd21cf904b55b666be14e5d2dd6e-20210722
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2021594857; Thu, 22 Jul 2021 02:45:56 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 02:45:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:45:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:45:53 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v2 07/14] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys1
Date: Thu, 22 Jul 2021 17:45:44 +0800
Message-ID: <20210722094551.15255-8-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210722094551.15255-1-nancy.lin@mediatek.com>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_024559_839898_771759AA 
X-CRM114-Status: GOOD (  13.91  )
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

Add mt8195 vdosys1 clock driver name and routing table to
the driver data of mtk-mmsys.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h    | 83 ++++++++++++++++++++++++--
 drivers/soc/mediatek/mtk-mmsys.c       | 10 ++++
 include/linux/soc/mediatek/mtk-mmsys.h |  2 +
 3 files changed, 90 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index 73e9e8286d50..104ba575f765 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -64,16 +64,16 @@
 #define SOUT_TO_VPP_MERGE0_P1_SEL				(1 << 0)
 
 #define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL			0xf40
-#define SOUT_TO_HDR_VDO_FE0					(0 << 0)
+#define SOUT_TO_MIXER_IN1_SEL					(1 << 0)
 
 #define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL			0xf44
-#define SOUT_TO_HDR_VDO_FE1					(0 << 0)
+#define SOUT_TO_MIXER_IN2_SEL					(1 << 0)
 
 #define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL			0xf48
-#define SOUT_TO_HDR_GFX_FE0					(0 << 0)
+#define SOUT_TO_MIXER_IN3_SEL					(1 << 0)
 
 #define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL			0xf4c
-#define SOUT_TO_HDR_GFX_FE1					(0 << 0)
+#define SOUT_TO_MIXER_IN4_SEL					(1 << 0)
 
 #define MT8195_VDO1_MIXER_IN1_SOUT_SEL				0xf58
 #define MIXER_IN1_SOUT_TO_DISP_MIXER				(0 << 0)
@@ -88,7 +88,7 @@
 #define MIXER_IN4_SOUT_TO_DISP_MIXER				(0 << 0)
 
 #define MT8195_VDO1_MIXER_OUT_SOUT_SEL				0xf34
-#define MIXER_SOUT_TO_HDR_VDO_BE0				(0 << 0)
+#define MIXER_SOUT_TO_MERGE4_ASYNC_SEL				(1 << 0)
 
 #define MT8195_VDO1_MERGE4_SOUT_SEL				0xf18
 #define MERGE4_SOUT_TO_VDOSYS0					(0 << 0)
@@ -185,6 +185,79 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	}, {
 		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
 		MT8195_VDO0_SEL_OUT, SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN1_SEL
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN2_SEL
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN3_SEL
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN4_SEL
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_OUT_SOUT_SEL, MIXER_SOUT_TO_MERGE4_ASYNC_SEL
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN1_SEL_IN, MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN2_SEL_IN, MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN3_SEL_IN, MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN4_SEL_IN, MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_SOUT_SEL_IN, MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE4_ASYNC_SEL_IN, MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
+	},
+	{
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
+		MT8195_VDO1_DISP_DPI1_SEL_IN, DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
+	},
+	{
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
+		MT8195_VDO1_MERGE4_SOUT_SEL, MERGE4_SOUT_TO_DPI1_SEL
+	},
+	{
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO1_DISP_DP_INTF0_SEL_IN,
+		DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
+	},
+	{
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO1_MERGE4_SOUT_SEL, MERGE4_SOUT_TO_DP_INTF0_SEL
 	}
 };
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 1fb241750897..9e31aad6c5c8 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -59,6 +59,12 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
+	.clk_driver = "clk-mt8195-vdo1",
+	.routes = mmsys_mt8195_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
+};
+
 struct mtk_mmsys {
 	void __iomem *regs;
 	const struct mtk_mmsys_driver_data *data;
@@ -168,6 +174,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8195-vdosys0",
 		.data = &mt8195_vdosys0_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8195-vdosys1",
+		.data = &mt8195_vdosys1_driver_data,
+	},
 	{ }
 };
 
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 34cb605e5df9..338c71570aeb 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -49,6 +49,8 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_DSC1,
 	DDP_COMPONENT_DSC1_VIRTUAL0,
 	DDP_COMPONENT_DP_INTF0,
+	DDP_COMPONENT_DP_INTF1,
+	DDP_COMPONENT_PSEUDO_OVL,
 	DDP_COMPONENT_ID_MAX,
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
