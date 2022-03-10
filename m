Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D136FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 04:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDgb54DNh0/RfphX6iO/ODe9/LBASNdX0zY7k1d10oM=; b=GNiRIfiGHXzlxg
	StEXd3ER2Gcj7l7HTgJgZopti5IAkqW9sYzqkiv1vMag1kIt8zasdMLP4KgACY74vs+Y9CLwEUfkG
	K/IwBYRL+9KrjWfQKbLhVwUIRuuTjBEUglYwo8vaSpJTYRLJjLWk369k9jsb7EsfvZ2qkGcm3pG8F
	2wI64XmpwXQebqp5SOUDAL6yPiMrZBUTsiVCP0W/AynmU24gMUl9U5eMRD7gSbKKc2NCI1Jho2sgV
	zjqR3sWVYfYv+ZRbJY3YqjXrHg1CUpW8fnfUalfH1FUHFFYgyeGq7f5PDB0KaLlggZMO5mHZb0+tB
	u8BsOiZhI4+1TDbzIBig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSA2H-00BInE-I8; Thu, 10 Mar 2022 04:04:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS9uk-00BEbS-Bj; Thu, 10 Mar 2022 03:56:36 +0000
X-UUID: 71320f22ac044e1f834b4e7744823abf-20220309
X-UUID: 71320f22ac044e1f834b4e7744823abf-20220309
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 777878742; Wed, 09 Mar 2022 20:56:30 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 19:55:19 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 11:55:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Mar 2022 11:55:18 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v14 09/22] soc: mediatek: add mtk-mutex support for mt8195
 vdosys1
Date: Thu, 10 Mar 2022 11:55:02 +0800
Message-ID: <20220310035515.16881-10-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220310035515.16881-1-nancy.lin@mediatek.com>
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_195634_439565_712F88F0 
X-CRM114-Status: GOOD (  11.85  )
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

Add mtk-mutex support for mt8195 vdosys1.
The vdosys1 path component contains ovl_adaptor, merge5,
and dp_intf1. Ovl_adaptor is composed of several sub-elements.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 54 ++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index cb791671d751..70e6043e99df 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -129,6 +129,35 @@
 #define MT8195_MUTEX_MOD_DISP_PWM0		BIT(27)
 #define MT8195_MUTEX_MOD_DISP_PWM1		BIT(28)
 
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA0	BIT(0)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA1	BIT(1)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA2	BIT(2)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA3	BIT(3)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA4	BIT(4)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA5	BIT(5)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA6	BIT(6)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA7	BIT(7)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE0	BIT(8)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE1	BIT(9)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE2	BIT(10)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE3	BIT(11)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE4	BIT(12)
+#define MT8195_MUTEX_MOD_DISP1_VPP2_DL_RELAY	BIT(13)
+#define MT8195_MUTEX_MOD_DISP1_VPP3_DL_RELAY	BIT(14)
+#define MT8195_MUTEX_MOD_DISP1_VDO0_DSC_DL_ASYNC	BIT(15)
+#define MT8195_MUTEX_MOD_DISP1_VDO0_MERGE_DL_ASYNC	BIT(16)
+#define MT8195_MUTEX_MOD_DISP1_VDO1_OUT_DL_RELAY	BIT(17)
+#define MT8195_MUTEX_MOD_DISP1_DISP_MIXER	BIT(18)
+#define MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE0	BIT(19)
+#define MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE1	BIT(20)
+#define MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE0	BIT(21)
+#define MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE1	BIT(22)
+#define MT8195_MUTEX_MOD_DISP1_HDR_VDO_BE0	BIT(23)
+#define MT8195_MUTEX_MOD_DISP1_HDR_MLOAD	BIT(24)
+#define MT8195_MUTEX_MOD_DISP1_DPI0		BIT(25)
+#define MT8195_MUTEX_MOD_DISP1_DPI1		BIT(26)
+#define MT8195_MUTEX_MOD_DISP1_DP_INTF0		BIT(27)
+
 #define MT2712_MUTEX_MOD_DISP_PWM2		BIT(10)
 #define MT2712_MUTEX_MOD_DISP_OVL0		BIT(11)
 #define MT2712_MUTEX_MOD_DISP_OVL1		BIT(12)
@@ -332,6 +361,27 @@ static const u64 mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
 	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
 	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
+	[DDP_COMPONENT_OVL_ADAPTOR] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA0 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA1 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA2 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA3 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA4 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA5 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA6 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA7 |
+				      MT8195_MUTEX_MOD_DISP1_VPP_MERGE0 |
+				      MT8195_MUTEX_MOD_DISP1_VPP_MERGE1 |
+				      MT8195_MUTEX_MOD_DISP1_VPP_MERGE2 |
+				      MT8195_MUTEX_MOD_DISP1_VPP_MERGE3 |
+				      MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE0 |
+				      MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE1 |
+				      MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE0 |
+				      MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE1 |
+				      MT8195_MUTEX_MOD_DISP1_HDR_VDO_BE0 |
+				      MT8195_MUTEX_MOD_DISP1_HDR_MLOAD |
+				      MT8195_MUTEX_MOD_DISP1_DISP_MIXER,
+	[DDP_COMPONENT_MERGE5] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE4,
+	[DDP_COMPONENT_DP_INTF1] = MT8195_MUTEX_MOD_DISP1_DP_INTF0,
 };
 
 static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
@@ -517,6 +567,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DP_INTF0:
 		sof_id = MUTEX_SOF_DP_INTF0;
 		break;
+	case DDP_COMPONENT_DP_INTF1:
+		sof_id = MUTEX_SOF_DP_INTF1;
+		break;
 	default:
 		if (mtx->data->mutex_mod[id] <= BIT(31)) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
@@ -557,6 +610,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DPI0:
 	case DDP_COMPONENT_DPI1:
 	case DDP_COMPONENT_DP_INTF0:
+	case DDP_COMPONENT_DP_INTF1:
 		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
 			       mtx->regs +
 			       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
