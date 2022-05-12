Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52434C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zindEwBN3i+QBfDHTWMyv0Dhwr2dNPRObb18+w6fgcg=; b=Z3o+SUPSe80LYj
	+nbWIkysHNRzCsekrrvNG7oFFRgA81M39gNa117Mg84+FEqzOpMps1HTf5tgUWxqkE4nbuuVhetx0
	ceK3CjYqA9Npp7S2qirDpzC+BQjjF2BoZjpA23OhfIbTAY5hwiPsvu4CGKbOp0az9rlnusgdnxeUY
	Z6LVz6Vz2C0o/sKz6co5MsznTqf2uMxYLzvPeplfv0wQFPgM0XjprkU7V64xUbng3QvMDXm1+39sz
	kYMsR9dZ0hbse6JrxNq/sjix5ZSx8jY6A//vzd2b0/RwwJ40vwjinmodBXd1Irqk7rEhDcvgXr6vl
	Ec4UGIbZZgXwbhVguW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np3z8-00AtXb-0w; Thu, 12 May 2022 08:15:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np3yw-00AtUn-FC; Thu, 12 May 2022 08:15:35 +0000
X-UUID: 6a01b92f77b84a85b82a88f1ab92d8e6-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:060e5aa8-20b6-45a4-a6d3-8233c0cf9e91, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:faefae9, CLOUDID:cc9b09a7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6a01b92f77b84a85b82a88f1ab92d8e6-20220512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 20817947; Thu, 12 May 2022 01:15:29 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 01:05:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 16:05:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 May 2022 16:05:25 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>
CC: <airlied@linux.ie>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jason-jh.lin@mediatek.com>,
 <nancy.lin@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 2/3] dt-bindings: reset: mt8195: add vdosys1 reset control
 bit
Date: Thu, 12 May 2022 16:05:22 +0800
Message-ID: <20220512080523.25082-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220512080523.25082-1-rex-bc.chen@mediatek.com>
References: <20220512080523.25082-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_011534_555578_FCC8436A 
X-CRM114-Status: UNSURE (   7.98  )
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

From: "Nancy.Lin" <nancy.lin@mediatek.com>

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
