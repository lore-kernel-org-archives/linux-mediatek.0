Return-Path: <SRS0=jwT2=OY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4DBC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 06:35:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FC3861381
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 06:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FC3861381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iW1BO7rJrnIBNQWIVemA/uue1WuHNVOIxAlQHbYMcKQ=; b=nDE92Z0UYkJQvC
	0K+LxXxYxqnJbAYcHrywHgsRfaqeL0WU0HUVAJbVwFrJZeUaIYox/IBqmjHvVHg0HwmOyec5kx5iv
	cj9CtXpmDHk4yT3uWyJiPhFCx8yx5rAp/CStO8IEsfWQe3ZYdUprMieQg8IlNEmlpk7PJ2oQFOhYQ
	E5OSFzNRkpgBqXWzHNB6B5vUXYOtyiMAql6pqCli3987S8ODlnWT9wTuawcSZsm/wQsKpfriiz9YT
	AUOSxCgCCskqajL8x34OrpWlVOeqEYzuDK8LteQwL+nxlWjxLRzvXQVXUrqdrndAmr+UfHydtMwU3
	s9V2Es/snmV6PdjN0wTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXHZI-005LEg-Cs; Mon, 04 Oct 2021 06:35:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXHW6-005JXY-Ow; Mon, 04 Oct 2021 06:32:05 +0000
X-UUID: 8136ee74d7234aa0942595a29925db1f-20211003
X-UUID: 8136ee74d7234aa0942595a29925db1f-20211003
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 991950773; Sun, 03 Oct 2021 23:31:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 Oct 2021 23:21:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 4 Oct 2021 14:21:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 4 Oct 2021 14:21:44 +0800
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
Subject: [PATCH v6 10/16] soc: mediatek: add mtk-mutex support for mt8195
 vdosys1
Date: Mon, 4 Oct 2021 14:21:34 +0800
Message-ID: <20211004062140.29803-11-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211004062140.29803-1-nancy.lin@mediatek.com>
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_233202_858219_531C9A7F 
X-CRM114-Status: GOOD (  12.27  )
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
and dp_intf1. Ovl_adaptor is composed of several sub-elements,
so change it to support multi-bit control.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 296 ++++++++++++++++++-------------
 1 file changed, 175 insertions(+), 121 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 36502b27fe20..7767fedbd14f 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -29,113 +29,142 @@
 
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
@@ -183,7 +212,7 @@ enum mtk_mutex_sof_id {
 };
 
 struct mtk_mutex_data {
-	const unsigned int *mutex_mod;
+	const unsigned long *mutex_mod;
 	const unsigned int *mutex_sof;
 	const unsigned int mutex_mod_reg;
 	const unsigned int mutex_sof_reg;
@@ -198,7 +227,7 @@ struct mtk_mutex_ctx {
 	const struct mtk_mutex_data	*data;
 };
 
-static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_BLS] = MT2701_MUTEX_MOD_DISP_BLS,
 	[DDP_COMPONENT_COLOR0] = MT2701_MUTEX_MOD_DISP_COLOR,
 	[DDP_COMPONENT_OVL0] = MT2701_MUTEX_MOD_DISP_OVL,
@@ -207,7 +236,7 @@ static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT2701_MUTEX_MOD_DISP_WDMA,
 };
 
-static const unsigned int mt2712_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt2712_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT2712_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_AAL1] = MT2712_MUTEX_MOD2_DISP_AAL1,
 	[DDP_COMPONENT_COLOR0] = MT2712_MUTEX_MOD_DISP_COLOR0,
@@ -227,7 +256,7 @@ static const unsigned int mt2712_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1] = MT2712_MUTEX_MOD_DISP_WDMA1,
 };
 
-static const unsigned int mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8167_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_CCORR] = MT8167_MUTEX_MOD_DISP_CCORR,
 	[DDP_COMPONENT_COLOR0] = MT8167_MUTEX_MOD_DISP_COLOR,
@@ -242,7 +271,7 @@ static const unsigned int mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT8167_MUTEX_MOD_DISP_WDMA0,
 };
 
-static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8173_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_COLOR0] = MT8173_MUTEX_MOD_DISP_COLOR0,
 	[DDP_COMPONENT_COLOR1] = MT8173_MUTEX_MOD_DISP_COLOR1,
@@ -260,7 +289,7 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
 };
 
-static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
@@ -274,7 +303,7 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
 };
 
-static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8192_MUTEX_MOD_DISP_COLOR0,
@@ -288,7 +317,7 @@ static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
 };
 
-static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_OVL0] = MT8195_MUTEX_MOD_DISP_OVL0,
 	[DDP_COMPONENT_WDMA0] = MT8195_MUTEX_MOD_DISP_WDMA0,
 	[DDP_COMPONENT_RDMA0] = MT8195_MUTEX_MOD_DISP_RDMA0,
@@ -302,6 +331,27 @@ static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
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
@@ -466,17 +516,20 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DP_INTF0:
 		sof_id = MUTEX_SOF_DP_INTF0;
 		break;
+	case DDP_COMPONENT_DP_INTF1:
+		sof_id = MUTEX_SOF_DP_INTF1;
+		break;
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
@@ -506,22 +559,23 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DPI0:
 	case DDP_COMPONENT_DPI1:
 	case DDP_COMPONENT_DP_INTF0:
+	case DDP_COMPONENT_DP_INTF1:
 		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
 			       mtx->regs +
 			       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
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
