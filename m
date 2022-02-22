Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EB5C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1naMsRkf0bH0tujphOfpkNEvr4zefICaW+zxkhWeYpw=; b=ah40JunIHI7sgf
	8z6cEJQeBwrRSCDGS4MbfRCdGMskTRSRKKiITbHZbg73tgKbAG0d0knkddZjrBbE5kv0D5PmB3WHZ
	euI02YY/pb4f88nF8hAJCdm5TtRLNppbRJfeR/fhP2pdEhXz3UIlr8HJvMgkIjnhCAZCwTpoSIOWQ
	O28otZequRJ0k2a7JuKBuMU8b0HoAIwqDGc9i+x7v8aD095VpYPriirvwA5NQMiZtCormn3Zk872L
	A4eC8ppzXkZHDpJxbXeqpREuYPUgatCdTXIzThn7foE0fxJWmJY2WsqoGQZXc+qp5CTssNjoW7oAv
	Nk/Mo6smruk+8X3i4uJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMSIy-008zMV-Je; Tue, 22 Feb 2022 10:22:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMSF3-008xEk-Ly; Tue, 22 Feb 2022 10:18:00 +0000
X-UUID: c37a83e73a6541cea45a2229d1865211-20220222
X-UUID: c37a83e73a6541cea45a2229d1865211-20220222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1607555301; Tue, 22 Feb 2022 03:17:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Feb 2022 02:07:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 22 Feb 2022 18:07:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Feb 2022 18:07:43 +0800
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
Subject: [PATCH v12 09/23] soc: mediatek: change the mutex defines and the
 mutex_mod type
Date: Tue, 22 Feb 2022 18:07:27 +0800
Message-ID: <20220222100741.30138-10-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220222100741.30138-1-nancy.lin@mediatek.com>
References: <20220222100741.30138-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_021757_803798_747172D6 
X-CRM114-Status: GOOD (  14.25  )
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

This is a preparation for adding support for mt8195 vdosys1 mutex.
The vdosys1 path component contains ovl_adaptor, merge5,
and dp_intf1. Ovl_adaptor is composed of several sub-elements,
so change it to support multi-bit control.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 242 +++++++++++++++----------------
 1 file changed, 121 insertions(+), 121 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 36502b27fe20..ff2f74668e8a 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -29,113 +29,113 @@
 
 #define INT_MUTEX				BIT(1)
 
-#define MT8167_MUTEX_MOD_DISP_PWM		1
-#define MT8167_MUTEX_MOD_DISP_OVL0		6
-#define MT8167_MUTEX_MOD_DISP_OVL1		7
-#define MT8167_MUTEX_MOD_DISP_RDMA0		8
-#define MT8167_MUTEX_MOD_DISP_RDMA1		9
-#define MT8167_MUTEX_MOD_DISP_WDMA0		10
-#define MT8167_MUTEX_MOD_DISP_CCORR		11
-#define MT8167_MUTEX_MOD_DISP_COLOR		12
-#define MT8167_MUTEX_MOD_DISP_AAL		13
-#define MT8167_MUTEX_MOD_DISP_GAMMA		14
-#define MT8167_MUTEX_MOD_DISP_DITHER		15
-#define MT8167_MUTEX_MOD_DISP_UFOE		16
-
-#define MT8192_MUTEX_MOD_DISP_OVL0		0
-#define MT8192_MUTEX_MOD_DISP_OVL0_2L		1
-#define MT8192_MUTEX_MOD_DISP_RDMA0		2
-#define MT8192_MUTEX_MOD_DISP_COLOR0		4
-#define MT8192_MUTEX_MOD_DISP_CCORR0		5
-#define MT8192_MUTEX_MOD_DISP_AAL0		6
-#define MT8192_MUTEX_MOD_DISP_GAMMA0		7
-#define MT8192_MUTEX_MOD_DISP_POSTMASK0		8
-#define MT8192_MUTEX_MOD_DISP_DITHER0		9
-#define MT8192_MUTEX_MOD_DISP_OVL2_2L		16
-#define MT8192_MUTEX_MOD_DISP_RDMA4		17
-
-#define MT8183_MUTEX_MOD_DISP_RDMA0		0
-#define MT8183_MUTEX_MOD_DISP_RDMA1		1
-#define MT8183_MUTEX_MOD_DISP_OVL0		9
-#define MT8183_MUTEX_MOD_DISP_OVL0_2L		10
-#define MT8183_MUTEX_MOD_DISP_OVL1_2L		11
-#define MT8183_MUTEX_MOD_DISP_WDMA0		12
-#define MT8183_MUTEX_MOD_DISP_COLOR0		13
-#define MT8183_MUTEX_MOD_DISP_CCORR0		14
-#define MT8183_MUTEX_MOD_DISP_AAL0		15
-#define MT8183_MUTEX_MOD_DISP_GAMMA0		16
-#define MT8183_MUTEX_MOD_DISP_DITHER0		17
-
-#define MT8173_MUTEX_MOD_DISP_OVL0		11
-#define MT8173_MUTEX_MOD_DISP_OVL1		12
-#define MT8173_MUTEX_MOD_DISP_RDMA0		13
-#define MT8173_MUTEX_MOD_DISP_RDMA1		14
-#define MT8173_MUTEX_MOD_DISP_RDMA2		15
-#define MT8173_MUTEX_MOD_DISP_WDMA0		16
-#define MT8173_MUTEX_MOD_DISP_WDMA1		17
-#define MT8173_MUTEX_MOD_DISP_COLOR0		18
-#define MT8173_MUTEX_MOD_DISP_COLOR1		19
-#define MT8173_MUTEX_MOD_DISP_AAL		20
-#define MT8173_MUTEX_MOD_DISP_GAMMA		21
-#define MT8173_MUTEX_MOD_DISP_UFOE		22
-#define MT8173_MUTEX_MOD_DISP_PWM0		23
-#define MT8173_MUTEX_MOD_DISP_PWM1		24
-#define MT8173_MUTEX_MOD_DISP_OD		25
-
-#define MT8195_MUTEX_MOD_DISP_OVL0		0
-#define MT8195_MUTEX_MOD_DISP_WDMA0		1
-#define MT8195_MUTEX_MOD_DISP_RDMA0		2
-#define MT8195_MUTEX_MOD_DISP_COLOR0		3
-#define MT8195_MUTEX_MOD_DISP_CCORR0		4
-#define MT8195_MUTEX_MOD_DISP_AAL0		5
-#define MT8195_MUTEX_MOD_DISP_GAMMA0		6
-#define MT8195_MUTEX_MOD_DISP_DITHER0		7
-#define MT8195_MUTEX_MOD_DISP_DSI0		8
-#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0	9
-#define MT8195_MUTEX_MOD_DISP_OVL1		10
-#define MT8195_MUTEX_MOD_DISP_WDMA1		11
-#define MT8195_MUTEX_MOD_DISP_RDMA1		12
-#define MT8195_MUTEX_MOD_DISP_COLOR1		13
-#define MT8195_MUTEX_MOD_DISP_CCORR1		14
-#define MT8195_MUTEX_MOD_DISP_AAL1		15
-#define MT8195_MUTEX_MOD_DISP_GAMMA1		16
-#define MT8195_MUTEX_MOD_DISP_DITHER1		17
-#define MT8195_MUTEX_MOD_DISP_DSI1		18
-#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE1	19
-#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		20
-#define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
-#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY0	22
-#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY1	23
-#define MT8195_MUTEX_MOD_DISP_VDO1_DL_RELAY2	24
-#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY3	25
-#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY4	26
-#define MT8195_MUTEX_MOD_DISP_PWM0		27
-#define MT8195_MUTEX_MOD_DISP_PWM1		28
-
-#define MT2712_MUTEX_MOD_DISP_PWM2		10
-#define MT2712_MUTEX_MOD_DISP_OVL0		11
-#define MT2712_MUTEX_MOD_DISP_OVL1		12
-#define MT2712_MUTEX_MOD_DISP_RDMA0		13
-#define MT2712_MUTEX_MOD_DISP_RDMA1		14
-#define MT2712_MUTEX_MOD_DISP_RDMA2		15
-#define MT2712_MUTEX_MOD_DISP_WDMA0		16
-#define MT2712_MUTEX_MOD_DISP_WDMA1		17
-#define MT2712_MUTEX_MOD_DISP_COLOR0		18
-#define MT2712_MUTEX_MOD_DISP_COLOR1		19
-#define MT2712_MUTEX_MOD_DISP_AAL0		20
-#define MT2712_MUTEX_MOD_DISP_UFOE		22
-#define MT2712_MUTEX_MOD_DISP_PWM0		23
-#define MT2712_MUTEX_MOD_DISP_PWM1		24
-#define MT2712_MUTEX_MOD_DISP_OD0		25
-#define MT2712_MUTEX_MOD2_DISP_AAL1		33
-#define MT2712_MUTEX_MOD2_DISP_OD1		34
-
-#define MT2701_MUTEX_MOD_DISP_OVL		3
-#define MT2701_MUTEX_MOD_DISP_WDMA		6
-#define MT2701_MUTEX_MOD_DISP_COLOR		7
-#define MT2701_MUTEX_MOD_DISP_BLS		9
-#define MT2701_MUTEX_MOD_DISP_RDMA0		10
-#define MT2701_MUTEX_MOD_DISP_RDMA1		12
+#define MT8167_MUTEX_MOD_DISP_PWM		BIT(1)
+#define MT8167_MUTEX_MOD_DISP_OVL0		BIT(6)
+#define MT8167_MUTEX_MOD_DISP_OVL1		BIT(7)
+#define MT8167_MUTEX_MOD_DISP_RDMA0		BIT(8)
+#define MT8167_MUTEX_MOD_DISP_RDMA1		BIT(9)
+#define MT8167_MUTEX_MOD_DISP_WDMA0		BIT(10)
+#define MT8167_MUTEX_MOD_DISP_CCORR		BIT(11)
+#define MT8167_MUTEX_MOD_DISP_COLOR		BIT(12)
+#define MT8167_MUTEX_MOD_DISP_AAL		BIT(13)
+#define MT8167_MUTEX_MOD_DISP_GAMMA		BIT(14)
+#define MT8167_MUTEX_MOD_DISP_DITHER		BIT(15)
+#define MT8167_MUTEX_MOD_DISP_UFOE		BIT(16)
+
+#define MT8192_MUTEX_MOD_DISP_OVL0		BIT(0)
+#define MT8192_MUTEX_MOD_DISP_OVL0_2L		BIT(1)
+#define MT8192_MUTEX_MOD_DISP_RDMA0		BIT(2)
+#define MT8192_MUTEX_MOD_DISP_COLOR0		BIT(4)
+#define MT8192_MUTEX_MOD_DISP_CCORR0		BIT(5)
+#define MT8192_MUTEX_MOD_DISP_AAL0		BIT(6)
+#define MT8192_MUTEX_MOD_DISP_GAMMA0		BIT(7)
+#define MT8192_MUTEX_MOD_DISP_POSTMASK0		BIT(8)
+#define MT8192_MUTEX_MOD_DISP_DITHER0		BIT(9)
+#define MT8192_MUTEX_MOD_DISP_OVL2_2L		BIT(16)
+#define MT8192_MUTEX_MOD_DISP_RDMA4		BIT(17)
+
+#define MT8183_MUTEX_MOD_DISP_RDMA0		BIT(0)
+#define MT8183_MUTEX_MOD_DISP_RDMA1		BIT(1)
+#define MT8183_MUTEX_MOD_DISP_OVL0		BIT(9)
+#define MT8183_MUTEX_MOD_DISP_OVL0_2L		BIT(10)
+#define MT8183_MUTEX_MOD_DISP_OVL1_2L		BIT(11)
+#define MT8183_MUTEX_MOD_DISP_WDMA0		BIT(12)
+#define MT8183_MUTEX_MOD_DISP_COLOR0		BIT(13)
+#define MT8183_MUTEX_MOD_DISP_CCORR0		BIT(14)
+#define MT8183_MUTEX_MOD_DISP_AAL0		BIT(15)
+#define MT8183_MUTEX_MOD_DISP_GAMMA0		BIT(16)
+#define MT8183_MUTEX_MOD_DISP_DITHER0		BIT(17)
+
+#define MT8173_MUTEX_MOD_DISP_OVL0		BIT(11)
+#define MT8173_MUTEX_MOD_DISP_OVL1		BIT(12)
+#define MT8173_MUTEX_MOD_DISP_RDMA0		BIT(13)
+#define MT8173_MUTEX_MOD_DISP_RDMA1		BIT(14)
+#define MT8173_MUTEX_MOD_DISP_RDMA2		BIT(15)
+#define MT8173_MUTEX_MOD_DISP_WDMA0		BIT(16)
+#define MT8173_MUTEX_MOD_DISP_WDMA1		BIT(17)
+#define MT8173_MUTEX_MOD_DISP_COLOR0		BIT(18)
+#define MT8173_MUTEX_MOD_DISP_COLOR1		BIT(19)
+#define MT8173_MUTEX_MOD_DISP_AAL		BIT(20)
+#define MT8173_MUTEX_MOD_DISP_GAMMA		BIT(21)
+#define MT8173_MUTEX_MOD_DISP_UFOE		BIT(22)
+#define MT8173_MUTEX_MOD_DISP_PWM0		BIT(23)
+#define MT8173_MUTEX_MOD_DISP_PWM1		BIT(24)
+#define MT8173_MUTEX_MOD_DISP_OD		BIT(25)
+
+#define MT8195_MUTEX_MOD_DISP_OVL0		BIT(0)
+#define MT8195_MUTEX_MOD_DISP_WDMA0		BIT(1)
+#define MT8195_MUTEX_MOD_DISP_RDMA0		BIT(2)
+#define MT8195_MUTEX_MOD_DISP_COLOR0		BIT(3)
+#define MT8195_MUTEX_MOD_DISP_CCORR0		BIT(4)
+#define MT8195_MUTEX_MOD_DISP_AAL0		BIT(5)
+#define MT8195_MUTEX_MOD_DISP_GAMMA0		BIT(6)
+#define MT8195_MUTEX_MOD_DISP_DITHER0		BIT(7)
+#define MT8195_MUTEX_MOD_DISP_DSI0		BIT(8)
+#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0	BIT(9)
+#define MT8195_MUTEX_MOD_DISP_OVL1		BIT(10)
+#define MT8195_MUTEX_MOD_DISP_WDMA1		BIT(11)
+#define MT8195_MUTEX_MOD_DISP_RDMA1		BIT(12)
+#define MT8195_MUTEX_MOD_DISP_COLOR1		BIT(13)
+#define MT8195_MUTEX_MOD_DISP_CCORR1		BIT(14)
+#define MT8195_MUTEX_MOD_DISP_AAL1		BIT(15)
+#define MT8195_MUTEX_MOD_DISP_GAMMA1		BIT(16)
+#define MT8195_MUTEX_MOD_DISP_DITHER1		BIT(17)
+#define MT8195_MUTEX_MOD_DISP_DSI1		BIT(18)
+#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE1	BIT(19)
+#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		BIT(20)
+#define MT8195_MUTEX_MOD_DISP_DP_INTF0		BIT(21)
+#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY0	BIT(22)
+#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY1	BIT(23)
+#define MT8195_MUTEX_MOD_DISP_VDO1_DL_RELAY2	BIT(24)
+#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY3	BIT(25)
+#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY4	BIT(26)
+#define MT8195_MUTEX_MOD_DISP_PWM0		BIT(27)
+#define MT8195_MUTEX_MOD_DISP_PWM1		BIT(28)
+
+#define MT2712_MUTEX_MOD_DISP_PWM2		BIT(10)
+#define MT2712_MUTEX_MOD_DISP_OVL0		BIT(11)
+#define MT2712_MUTEX_MOD_DISP_OVL1		BIT(12)
+#define MT2712_MUTEX_MOD_DISP_RDMA0		BIT(13)
+#define MT2712_MUTEX_MOD_DISP_RDMA1		BIT(14)
+#define MT2712_MUTEX_MOD_DISP_RDMA2		BIT(15)
+#define MT2712_MUTEX_MOD_DISP_WDMA0		BIT(16)
+#define MT2712_MUTEX_MOD_DISP_WDMA1		BIT(17)
+#define MT2712_MUTEX_MOD_DISP_COLOR0		BIT(18)
+#define MT2712_MUTEX_MOD_DISP_COLOR1		BIT(19)
+#define MT2712_MUTEX_MOD_DISP_AAL0		BIT(20)
+#define MT2712_MUTEX_MOD_DISP_UFOE		BIT(22)
+#define MT2712_MUTEX_MOD_DISP_PWM0		BIT(23)
+#define MT2712_MUTEX_MOD_DISP_PWM1		BIT(24)
+#define MT2712_MUTEX_MOD_DISP_OD0		BIT(25)
+#define MT2712_MUTEX_MOD2_DISP_AAL1		BIT(33)
+#define MT2712_MUTEX_MOD2_DISP_OD1		BIT(34)
+
+#define MT2701_MUTEX_MOD_DISP_OVL		BIT(3)
+#define MT2701_MUTEX_MOD_DISP_WDMA		BIT(6)
+#define MT2701_MUTEX_MOD_DISP_COLOR		BIT(7)
+#define MT2701_MUTEX_MOD_DISP_BLS		BIT(9)
+#define MT2701_MUTEX_MOD_DISP_RDMA0		BIT(10)
+#define MT2701_MUTEX_MOD_DISP_RDMA1		BIT(12)
 
 #define MT2712_MUTEX_SOF_SINGLE_MODE		0
 #define MT2712_MUTEX_SOF_DSI0			1
@@ -183,7 +183,7 @@ enum mtk_mutex_sof_id {
 };
 
 struct mtk_mutex_data {
-	const unsigned int *mutex_mod;
+	const unsigned long *mutex_mod;
 	const unsigned int *mutex_sof;
 	const unsigned int mutex_mod_reg;
 	const unsigned int mutex_sof_reg;
@@ -198,7 +198,7 @@ struct mtk_mutex_ctx {
 	const struct mtk_mutex_data	*data;
 };
 
-static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_BLS] = MT2701_MUTEX_MOD_DISP_BLS,
 	[DDP_COMPONENT_COLOR0] = MT2701_MUTEX_MOD_DISP_COLOR,
 	[DDP_COMPONENT_OVL0] = MT2701_MUTEX_MOD_DISP_OVL,
@@ -207,7 +207,7 @@ static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT2701_MUTEX_MOD_DISP_WDMA,
 };
 
-static const unsigned int mt2712_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt2712_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT2712_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_AAL1] = MT2712_MUTEX_MOD2_DISP_AAL1,
 	[DDP_COMPONENT_COLOR0] = MT2712_MUTEX_MOD_DISP_COLOR0,
@@ -227,7 +227,7 @@ static const unsigned int mt2712_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1] = MT2712_MUTEX_MOD_DISP_WDMA1,
 };
 
-static const unsigned int mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8167_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_CCORR] = MT8167_MUTEX_MOD_DISP_CCORR,
 	[DDP_COMPONENT_COLOR0] = MT8167_MUTEX_MOD_DISP_COLOR,
@@ -242,7 +242,7 @@ static const unsigned int mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT8167_MUTEX_MOD_DISP_WDMA0,
 };
 
-static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8173_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_COLOR0] = MT8173_MUTEX_MOD_DISP_COLOR0,
 	[DDP_COMPONENT_COLOR1] = MT8173_MUTEX_MOD_DISP_COLOR1,
@@ -260,7 +260,7 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
 };
 
-static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
@@ -274,7 +274,7 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
 };
 
-static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8192_MUTEX_MOD_DISP_COLOR0,
@@ -288,7 +288,7 @@ static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
 };
 
-static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_OVL0] = MT8195_MUTEX_MOD_DISP_OVL0,
 	[DDP_COMPONENT_WDMA0] = MT8195_MUTEX_MOD_DISP_WDMA0,
 	[DDP_COMPONENT_RDMA0] = MT8195_MUTEX_MOD_DISP_RDMA0,
@@ -467,16 +467,16 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 		sof_id = MUTEX_SOF_DP_INTF0;
 		break;
 	default:
-		if (mtx->data->mutex_mod[id] < 32) {
+		if (mtx->data->mutex_mod[id] <= BIT(31)) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
 			reg = readl_relaxed(mtx->regs + offset);
-			reg |= 1 << mtx->data->mutex_mod[id];
+			reg |= mtx->data->mutex_mod[id];
 			writel_relaxed(reg, mtx->regs + offset);
 		} else {
 			offset = DISP_REG_MUTEX_MOD2(mutex->id);
 			reg = readl_relaxed(mtx->regs + offset);
-			reg |= 1 << (mtx->data->mutex_mod[id] - 32);
+			reg |= (mtx->data->mutex_mod[id] >> 32);
 			writel_relaxed(reg, mtx->regs + offset);
 		}
 		return;
@@ -512,16 +512,16 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 						  mutex->id));
 		break;
 	default:
-		if (mtx->data->mutex_mod[id] < 32) {
+		if (mtx->data->mutex_mod[id] <= BIT(31)) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
 			reg = readl_relaxed(mtx->regs + offset);
-			reg &= ~(1 << mtx->data->mutex_mod[id]);
+			reg &= ~(mtx->data->mutex_mod[id]);
 			writel_relaxed(reg, mtx->regs + offset);
 		} else {
 			offset = DISP_REG_MUTEX_MOD2(mutex->id);
 			reg = readl_relaxed(mtx->regs + offset);
-			reg &= ~(1 << (mtx->data->mutex_mod[id] - 32));
+			reg &= ~(mtx->data->mutex_mod[id] >> 32);
 			writel_relaxed(reg, mtx->regs + offset);
 		}
 		break;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
