Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF44CC636CA
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:04:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5119B611C0
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5119B611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09VufE35W2DXSfklGZEMYZc4Lu4by/fCo1F9YJ5Cs60=; b=4/BxpexgWyfmCr
	5mzpwpI04zONaNiiLzhB3AiC/leI38++Eu2MiuDg6v2gOfiQykitQc9rjltPGUR3vnCFxPulZIeJd
	ShneROMfW/uZUczcXYVJqGUbRtKMoL3ji6rAJcoKEbNRt8daxTmaO0rOD0izqUihQ160EJUMVLUmQ
	0izcwT1Ukko4sREdmnVuQMii/TNRkeWpLaRs2zBupcFHNgixZg5Ks3oCJ50wbX21xfLY+O0tqEmmw
	c57etZ2So+6qDVF2jHRBPll59Ps6CZkMTCd0Bz13qwjdV1hHqXpn5fzszlqG2FKvvnm5BswmuTHIH
	73N98F/FEMkW6QKZ+vCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4gFY-006GqR-C6; Sat, 17 Jul 2021 09:04:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4gFK-006Glu-0i; Sat, 17 Jul 2021 09:04:31 +0000
X-UUID: 0d97773f37ce40d6b25132b28a59c551-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=E7X397vfK7CkoJhQbIl8gkzL5AL4yu9D5mBggXfpQb8=; 
 b=HxMOYUDca3CY7f20wd5juuTKkIKxNER6Ty3yzjR1hc00cPFs1dZxjdw9I4dNKJS113DpD6vb6AJWSamQutLCk/xIhBycqJsWN8oKfXj1BHjjoLmRc49ZmayKcpLYT5eQa6okjkQ3942NOlFBpB+l1XUyGEnOyqmdYvtcQzgS2BM=;
X-UUID: 0d97773f37ce40d6b25132b28a59c551-20210717
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1758906699; Sat, 17 Jul 2021 02:04:27 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 02:04:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:24 +0800
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
Subject: [PATCH v1 04/10] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys1
Date: Sat, 17 Jul 2021 17:04:02 +0800
Message-ID: <20210717090408.28283-5-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717090408.28283-1-nancy.lin@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_020430_117243_9F8F8C61 
X-CRM114-Status: GOOD (  12.88  )
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
 include/linux/soc/mediatek/mtk-mmsys.h |  3 +
 3 files changed, 91 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index 73e9e8286d50..bc4e291dbe35 100644
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
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN1_SEL
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN2_SEL
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN3_SEL
+	},
+	{
+		DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_ETHDR,
+		MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, SOUT_TO_MIXER_IN4_SEL
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_OUT_SOUT_SEL, MIXER_SOUT_TO_MERGE4_ASYNC_SEL
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN1_SEL_IN, MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN2_SEL_IN, MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN3_SEL_IN, MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN4_SEL_IN, MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_SOUT_SEL_IN, MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
+	},
+	{
+		DDP_COMPONENT_ETHDR, DDP_COMPONENT_MERGE5,
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
index 34cb605e5df9..f9b227a07fe6 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -49,6 +49,9 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_DSC1,
 	DDP_COMPONENT_DSC1_VIRTUAL0,
 	DDP_COMPONENT_DP_INTF0,
+	DDP_COMPONENT_DP_INTF1,
+	DDP_COMPONENT_PSEUDO_OVL,
+	DDP_COMPONENT_ETHDR,
 	DDP_COMPONENT_ID_MAX,
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
