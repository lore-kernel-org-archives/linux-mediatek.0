Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59054C43217
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 03:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdNxTjiUNEnt6exeUhrWNLgL8l95v8xUiB8itNjMXE4=; b=sGj34A57zj6X9K
	vGNG71tQP7eQ7+oR+kZfutbQvaCs/c/Mr3mZMPsx2/ReINF5Xt7OTedR5dVv8NYWxVw1HvDpJME9V
	9k5AdDJT/bqjPBIwME2PZuMp9flWriQKOAmh9xTbcVQuBVK8Oo8KjnrDqG6G9Ktx7Le7fWCpdkJmU
	YTWEvg8tE83Lqv134ZQZyiubpm255sMmcbW4VUhH7L/O/a29e/8Z+ffVto4SpYwWyrGeKjDJtjJ9u
	D/+4DEWteCEMAqxf8TmzMkgaP9AqBg/YqwD1bad4xT25m+yvtPSuj3DwqQY8E72dFCILJCFhQhrjp
	ZIsT7ohTmGnC6IMdY3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1munPe-00Av26-Mk; Wed, 08 Dec 2021 03:14:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mun6Q-00Amxo-VA; Wed, 08 Dec 2021 02:54:47 +0000
X-UUID: c462cd75aa764fd5bed7d9be70b6b7aa-20211207
X-UUID: c462cd75aa764fd5bed7d9be70b6b7aa-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 670663487; Tue, 07 Dec 2021 19:54:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 18:44:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 8 Dec 2021 10:44:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Dec 2021 10:44:29 +0800
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
Subject: [PATCH v10 10/22] soc: mediatek: add mtk-mutex support for mt8195
 vdosys1
Date: Wed, 8 Dec 2021 10:44:14 +0800
Message-ID: <20211208024426.15595-11-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211208024426.15595-1-nancy.lin@mediatek.com>
References: <20211208024426.15595-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_185443_098345_7A5028F6 
X-CRM114-Status: GOOD (  12.07  )
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
---
 drivers/soc/mediatek/mtk-mutex.c | 54 ++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index ff2f74668e8a..7767fedbd14f 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -112,6 +112,35 @@
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
@@ -302,6 +331,27 @@ static const unsigned long mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
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
@@ -466,6 +516,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DP_INTF0:
 		sof_id = MUTEX_SOF_DP_INTF0;
 		break;
+	case DDP_COMPONENT_DP_INTF1:
+		sof_id = MUTEX_SOF_DP_INTF1;
+		break;
 	default:
 		if (mtx->data->mutex_mod[id] <= BIT(31)) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
@@ -506,6 +559,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
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
