Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48C2E92FF4
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 07:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCwDyTXjrkEMR8Ti8yX3viSAdWdcHN0KuHSwCPLr4vI=; b=v4Z313TfevJdrM8rhm3CO9YasD
	swSP82UcqPzWsOtzbn3cQ8eZ6HIbGEufc6SN1PupgQKeg0zNrU5lHfRIyReY79UwO0tZzR674TPWY
	Za7dGQ/uHOSCCGEq1nxiEXjdHxdY3DqcW5o3A5lAq76qEL43wjjINR3o30mZltdirFF5A5F2QANT+
	/4wLfxvewzrtmC1sDQQLSD1I2yFEZrGP0FAFy4uMnktcsjvKtVsWCl4RmBZnozATmgsKcCv1qqEkZ
	cEPA+iIz1fqxOkD3xyGxaJxna9GjpMPljNhPGx5yZPSiHG0vTIauxli+6ko6D1Lj6j7tBfHplvUt1
	QbhWGTeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qofRR-005BMV-1N;
	Fri, 06 Oct 2023 07:40:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qofR7-005B3t-1T;
	Fri, 06 Oct 2023 07:39:52 +0000
X-UUID: 8518e4ea641b11ee86758d4a7c00f3a0-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zCwDyTXjrkEMR8Ti8yX3viSAdWdcHN0KuHSwCPLr4vI=;
	b=k7EWTjWnrJHebyAeaRhZWrpaTIhF6hirroZkqZPe5YL2sC72ghNkgw6Np0iCEe0miKicj58FRBMPti6xLhEzIO/jeo6z0DYDI03V+AUpxpXwjzcG1QsTT8fbhdWD9Y42VMemVq/6fQN7S303sV7MCX/FPih46prAxZ5KkgW2yu8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:21f15872-05bc-40d2-8430-0ec173461c47,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:4e75d7c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8518e4ea641b11ee86758d4a7c00f3a0-20231006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 536492409; Fri, 06 Oct 2023 00:39:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 15:38:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 15:38:36 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	Singo Chang <singo.chang@mediatek.com>, "Nancy . Lin"
	<nancy.lin@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	"Hsiao Chien Sung" <shawn.sung@mediatek.com>
Subject: [PATCH v7 13/23] drm/mediatek: Sort OVL adaptor components
Date: Fri, 6 Oct 2023 15:38:21 +0800
Message-ID: <20231006073831.10402-14-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231006073831.10402-1-shawn.sung@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.199100-8.000000
X-TMASE-MatchedRID: VDx4E1LnSkQ/5uXNh96gfgPZZctd3P4BnhD9A3Sa7pbzYcyIF7RSVY90
	GxaR8c3t3zWs5BhDN2ROGSdKDNXNPBFSiKygUX4oXP5rFAucBUEYR+gKWoGXzpsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNUhQ9pL/1/Lzb8/PRWpaeh/7sd84uUNcE+qIo64cFs7ON9GavR+YElU=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.199100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7A38D52DBC05C1F15E416A7302DEA9942620CDDCD1B1538BF194FC16E6C669032000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_003949_496081_A698FBB2 
X-CRM114-Status: GOOD (  11.47  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sort OVL adaptor components' names in alphabetical order.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 4a5fab5ea51f..72758e41b1e6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -27,13 +27,14 @@
 #define MTK_OVL_ADAPTOR_LAYER_NUM 4
 
 enum mtk_ovl_adaptor_comp_type {
-	OVL_ADAPTOR_TYPE_MDP_RDMA = 0,
-	OVL_ADAPTOR_TYPE_MERGE,
 	OVL_ADAPTOR_TYPE_ETHDR,
+	OVL_ADAPTOR_TYPE_MDP_RDMA,
+	OVL_ADAPTOR_TYPE_MERGE,
 	OVL_ADAPTOR_TYPE_NUM,
 };
 
 enum mtk_ovl_adaptor_comp_id {
+	OVL_ADAPTOR_ETHDR0,
 	OVL_ADAPTOR_MDP_RDMA0,
 	OVL_ADAPTOR_MDP_RDMA1,
 	OVL_ADAPTOR_MDP_RDMA2,
@@ -46,7 +47,6 @@ enum mtk_ovl_adaptor_comp_id {
 	OVL_ADAPTOR_MERGE1,
 	OVL_ADAPTOR_MERGE2,
 	OVL_ADAPTOR_MERGE3,
-	OVL_ADAPTOR_ETHDR0,
 	OVL_ADAPTOR_ID_MAX
 };
 
@@ -62,12 +62,13 @@ struct mtk_disp_ovl_adaptor {
 };
 
 static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
+	[OVL_ADAPTOR_TYPE_ETHDR]	= "ethdr",
 	[OVL_ADAPTOR_TYPE_MDP_RDMA]	= "vdo1-rdma",
 	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
-	[OVL_ADAPTOR_TYPE_ETHDR]	= "ethdr",
 };
 
 static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
+	[OVL_ADAPTOR_ETHDR0]	= { OVL_ADAPTOR_TYPE_ETHDR, 0 },
 	[OVL_ADAPTOR_MDP_RDMA0]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 0 },
 	[OVL_ADAPTOR_MDP_RDMA1]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 1 },
 	[OVL_ADAPTOR_MDP_RDMA2]	= { OVL_ADAPTOR_TYPE_MDP_RDMA, 2 },
@@ -80,7 +81,6 @@ static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
 	[OVL_ADAPTOR_MERGE1]	= { OVL_ADAPTOR_TYPE_MERGE, 2 },
 	[OVL_ADAPTOR_MERGE2]	= { OVL_ADAPTOR_TYPE_MERGE, 3 },
 	[OVL_ADAPTOR_MERGE3]	= { OVL_ADAPTOR_TYPE_MERGE, 4 },
-	[OVL_ADAPTOR_ETHDR0]	= { OVL_ADAPTOR_TYPE_ETHDR, 0 },
 };
 
 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
@@ -314,6 +314,7 @@ size_t mtk_ovl_adaptor_get_num_formats(struct device *dev)
 
 void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex)
 {
+	mtk_mutex_add_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA0);
 	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA1);
 	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MDP_RDMA2);
@@ -326,11 +327,11 @@ void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex)
 	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE2);
 	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE3);
 	mtk_mutex_add_comp(mutex, DDP_COMPONENT_MERGE4);
-	mtk_mutex_add_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
 }
 
 void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex)
 {
+	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA0);
 	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA1);
 	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MDP_RDMA2);
@@ -343,11 +344,11 @@ void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex)
 	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE2);
 	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE3);
 	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_MERGE4);
-	mtk_mutex_remove_comp(mutex, DDP_COMPONENT_ETHDR_MIXER);
 }
 
 void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev, unsigned int next)
 {
+	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1);
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1);
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2);
@@ -355,11 +356,11 @@ void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev, unsig
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER);
-	mtk_mmsys_ddp_connect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
 }
 
 void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys_dev, unsigned int next)
 {
+	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1);
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1);
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2);
@@ -367,7 +368,6 @@ void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys_dev, un
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER);
 	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER);
-	mtk_mmsys_ddp_disconnect(mmsys_dev, DDP_COMPONENT_ETHDR_MIXER, next);
 }
 
 static int ovl_adaptor_comp_get_id(struct device *dev, struct device_node *node,
-- 
2.18.0


