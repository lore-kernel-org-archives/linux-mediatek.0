Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B5BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 05:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjrUhn58UJ2iixvPXa8U4t0rUpopYjwJ8WCuBEibLCE=; b=upZCMgCpmnTN83
	qiNbvGTGOyWDUOQgxkDpdPRetdNvFSgvep5Ie4LtrZZJA2PxYGCeqrzWeKDLQQaLbVF0WQDfDlF2F
	9jKwYhhAmkfO+PqgZMXUbaFffHM6V/I3oFfI/VJW4tABH4eVpEvlipttVvC58It32R3MLCnVJDXsu
	ocN6Z09CANCD+ZKCT1Cbvt9/veaxic5KzVf6DWCclIqE3F3OKD6sKtE62ui5p4CAC2aD1QVx/KrLk
	YRBN/OLgdKKavqX0i4UE6vlvrkB70wGzjY61tSXmO8M/ubFGME28FQ32tm4ii3GsI5+BFEi+vJJpU
	vUGAylVMI0Hl0aNyuBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np1Rm-00A6wC-Am; Thu, 12 May 2022 05:33:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np1QR-00A68e-TS; Thu, 12 May 2022 05:31:49 +0000
X-UUID: 7efa3edea9604a03aa657beaddd8826b-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:e022a3b5-1e83-40ef-b0af-84fa8bdd0226, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:faefae9, CLOUDID:a9d95248-e22d-4f1a-9d3f-55c4a2b00ea4,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 7efa3edea9604a03aa657beaddd8826b-20220511
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1640311449; Wed, 11 May 2022 22:31:39 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 22:31:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 12 May 2022 13:31:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 May 2022 13:31:35 +0800
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
 <singo.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v21 02/25] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
Date: Thu, 12 May 2022 13:31:05 +0800
Message-ID: <20220512053128.31415-3-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220512053128.31415-1-nancy.lin@mediatek.com>
References: <20220512053128.31415-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_223147_982116_696D1E1D 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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

Add vdosys1 reset control bit for MT8195 platform.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 include/dt-bindings/reset/mt8195-resets.h | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
index a26bccc8b957..1ccfe2f28964 100644
--- a/include/dt-bindings/reset/mt8195-resets.h
+++ b/include/dt-bindings/reset/mt8195-resets.h
@@ -26,4 +26,49 @@
 
 #define MT8195_TOPRGU_SW_RST_NUM               16
 
+/* VDOSYS1 */
+#define MT8195_VDOSYS1_SW0_RST_B_SMI_LARB2                     0
+#define MT8195_VDOSYS1_SW0_RST_B_SMI_LARB3                     1
+#define MT8195_VDOSYS1_SW0_RST_B_GALS                          2
+#define MT8195_VDOSYS1_SW0_RST_B_FAKE_ENG0                     3
+#define MT8195_VDOSYS1_SW0_RST_B_FAKE_ENG1                     4
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA0                     5
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA1                     6
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA2                     7
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA3                     8
+#define MT8195_VDOSYS1_SW0_RST_B_VPP_MERGE0                    9
+#define MT8195_VDOSYS1_SW0_RST_B_VPP_MERGE1                    10
+#define MT8195_VDOSYS1_SW0_RST_B_VPP_MERGE2                    11
+#define MT8195_VDOSYS1_SW0_RST_B_VPP_MERGE3                    12
+#define MT8195_VDOSYS1_SW0_RST_B_VPP_MERGE4                    13
+#define MT8195_VDOSYS1_SW0_RST_B_VPP2_TO_VDO1_DL_ASYNC         14
+#define MT8195_VDOSYS1_SW0_RST_B_VPP3_TO_VDO1_DL_ASYNC         15
+#define MT8195_VDOSYS1_SW0_RST_B_DISP_MUTEX                    16
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA4                     17
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA5                     18
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA6                     19
+#define MT8195_VDOSYS1_SW0_RST_B_MDP_RDMA7                     20
+#define MT8195_VDOSYS1_SW0_RST_B_DP_INTF0                      21
+#define MT8195_VDOSYS1_SW0_RST_B_DPI0                          22
+#define MT8195_VDOSYS1_SW0_RST_B_DPI1                          23
+#define MT8195_VDOSYS1_SW0_RST_B_DISP_MONITOR                  24
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC               25
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC               26
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC               27
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC               28
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC               29
+#define MT8195_VDOSYS1_SW0_RST_B_VDO0_DSC_TO_VDO1_DL_ASYNC     30
+#define MT8195_VDOSYS1_SW0_RST_B_VDO0_MERGE_TO_VDO1_DL_ASYNC   31
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0                   32
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0                   33
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE                    34
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1                   48
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1                   49
+#define MT8195_VDOSYS1_SW1_RST_B_DISP_MIXER                    50
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC          51
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC          52
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC          53
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC          54
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC           55
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
