Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45785C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 06:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3Xd8uFkaYIgxw73++NLRpX5K49nBwlW/YtMoujmP6g=; b=4alzO4plRGQXBl
	4ifu8xToEa+03ZAnt61ili+6b3eL9GZ+CnjmqHEILgq6QCJbMuuX5S+tRZzmuthJWDOxfOVSYbwEI
	gJ+8UhY4dKA4HhkAdnmUEfbPgNeS5dvuC6jt+WqwWkyTfG0AmVaQoCfN9+xmzkbYA1rJN2hHIadjO
	m1XK7qwhth5/5qXu9UVHdF1Dh0+7E8VSTJ7iEVER849CeFTbR8/JbeQYpfrT1/vYEy4xvEdLbADnC
	5JDmbIrndrK1ZcuYCYb5Rdqurcu2kDIlcRnO+qY6IWZr1kCVuQX0tI/OWsgKvUs4Uuleb+dfC4yJM
	qZWNbu+A2UE62EI9/aqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYE7-006A79-C0; Fri, 10 Jun 2022 06:34:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYE4-006A5r-Gk; Fri, 10 Jun 2022 06:34:34 +0000
X-UUID: c7bf394ea20149f3a3f3209e7a1dc130-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:1f5f66db-3429-4e8a-be85-84e66a8270a1,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:ad4f5de5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: c7bf394ea20149f3a3f3209e7a1dc130-20220609
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1092909029; Thu, 09 Jun 2022 23:34:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 23:34:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 10 Jun 2022 14:34:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 10 Jun 2022 14:34:25 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, daoyuan huang
	<daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
	<randy.wu@mediatek.com>, <moudy.ho@mediatek.com>,
	<jason-jh.lin@mediatek.com>, <roy-cw.yeh@mediatek.com>,
	<river.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>
Subject: [PATCH v20 2/6] soc: mediatek: mutex: add 8183 MUTEX MOD settings for MDP
Date: Fri, 10 Jun 2022 14:34:19 +0800
Message-ID: <20220610063424.7800-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220610063424.7800-1-moudy.ho@mediatek.com>
References: <20220610063424.7800-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_233432_599021_65B2AC9B 
X-CRM114-Status: GOOD (  12.26  )
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

For the purpose of module independence, related settings should be moved
from MDP to the corresponding driver.
This patch adds 8183 MUTEX MOD settings for MDP.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 1d2c4df18b5c..f8ea09a8bb5d 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -80,6 +80,15 @@
 #define MT8183_MUTEX_MOD_DISP_GAMMA0		16
 #define MT8183_MUTEX_MOD_DISP_DITHER0		17
 
+#define MT8183_MUTEX_MOD_MDP_RDMA0		2
+#define MT8183_MUTEX_MOD_MDP_RSZ0		4
+#define MT8183_MUTEX_MOD_MDP_RSZ1		5
+#define MT8183_MUTEX_MOD_MDP_TDSHP0		6
+#define MT8183_MUTEX_MOD_MDP_WROT0		7
+#define MT8183_MUTEX_MOD_MDP_WDMA		8
+#define MT8183_MUTEX_MOD_MDP_AAL0		23
+#define MT8183_MUTEX_MOD_MDP_CCORR0		24
+
 #define MT8173_MUTEX_MOD_DISP_OVL0		11
 #define MT8173_MUTEX_MOD_DISP_OVL1		12
 #define MT8173_MUTEX_MOD_DISP_RDMA0		13
@@ -273,6 +282,17 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
 };
 
+static const unsigned int mt8183_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
+	[MUTEX_MOD_IDX_MDP_RDMA0] = MT8183_MUTEX_MOD_MDP_RDMA0,
+	[MUTEX_MOD_IDX_MDP_RSZ0] = MT8183_MUTEX_MOD_MDP_RSZ0,
+	[MUTEX_MOD_IDX_MDP_RSZ1] = MT8183_MUTEX_MOD_MDP_RSZ1,
+	[MUTEX_MOD_IDX_MDP_TDSHP0] = MT8183_MUTEX_MOD_MDP_TDSHP0,
+	[MUTEX_MOD_IDX_MDP_WROT0] = MT8183_MUTEX_MOD_MDP_WROT0,
+	[MUTEX_MOD_IDX_MDP_WDMA] = MT8183_MUTEX_MOD_MDP_WDMA,
+	[MUTEX_MOD_IDX_MDP_AAL0] = MT8183_MUTEX_MOD_MDP_AAL0,
+	[MUTEX_MOD_IDX_MDP_CCORR0] = MT8183_MUTEX_MOD_MDP_CCORR0,
+};
+
 static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8186_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8186_MUTEX_MOD_DISP_CCORR0,
@@ -400,6 +420,7 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 	.mutex_sof = mt8183_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
+	.mutex_table_mod = mt8183_mutex_table_mod,
 	.no_clk = true,
 };
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
