Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2843ECDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pacP5LZW3vzgC3Z6DBMZenKCut8yM7RX/yjXv/4OVzw=; b=YI3rUy2AGap4Gg+2t4A5vVwKDc
	glbbItkrUQ6DHVuBrrnsTcwtvtZRWbzqXMaOPNCXx4VqoeOKXLTO5ShgTksXt1D3EzNm98P6Rt5xb
	gmAfH1wSYs2f5QIDIWHvAryGx4u9mUmudnfuiJHx9fE6V++OtzdJojzXDpMmzFZt8IP3hcfStkS1P
	/hiXFXlhWzTjZ6MySqjDQkQXnYY+eYeGnfU2wWvzov8xGtoRIB6lCbWgE38OcIJQFaJEgbq3NWJYp
	eXIUgmapkiQDncaTSGDWmreNc2Et3hhQcqlb6ztTzl0nEzTrLWM3o23QilTz7O3P9nEcYV2bmKir+
	9Nuj26YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsL26-009MEp-34;
	Mon, 16 Oct 2023 10:41:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsL1O-009LaH-2k;
	Mon, 16 Oct 2023 10:40:30 +0000
X-UUID: 667dbcfc6c1011ee86758d4a7c00f3a0-20231016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pacP5LZW3vzgC3Z6DBMZenKCut8yM7RX/yjXv/4OVzw=;
	b=PtoTTIIqtCDQ+HqXZ2KX6Cc66OiaS80+YE6PkCIyA91B0A+6GnvycXEVQLrjwwe7vT1boq1uMCbkO7+BdY+27vVxetof+Zwfdh2e9V25aWxjUJqYF2contvQ9Nwa4zymystIdsEDSiBGUEO9q8ZHpeUlTXU6LYNOJ/o1ra2VBW0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:2c6c16ea-a413-4345-83fb-e0f9fe88040f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:90da1615-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 667dbcfc6c1011ee86758d4a7c00f3a0-20231016
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1581782770; Mon, 16 Oct 2023 03:40:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Oct 2023 18:40:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Oct 2023 18:40:15 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v8 15/23] drm/mediatek: Manage component's clock with function pointers
Date: Mon, 16 Oct 2023 18:40:02 +0800
Message-ID: <20231016104010.3270-16-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231016104010.3270-1-shawn.sung@mediatek.com>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.901800-8.000000
X-TMASE-MatchedRID: uYOEf1I6Oo0b7D0aLEL5Ob2xWbKjBfWPy1y/jIuoZZ4x3z93vsEFGlaP
	6AhhdqyDkPk8oBU71Swz42d4hTjtM6h+3Rlbev+JkDpLRKO9xhSZ2scyRQcer19eTSR8I6du4uR
	3pP7Rlrc+1MUqk5HN+7u2F2cs3EHUIkzJoP2DD5eeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDh+5h3eNot2ZG8Y/G3RLR859ZCE9NdYEbRO7t5IIJTe1RMmnt19ykuB8R3mNYe3fpq6mF
	oav3WmOgh/JX3cyUSn6kLGPI+Kv2HmVKZusLp922v9OjYWA2uMMswg45VMfPXY3pGDmoik6
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.901800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C04CEED41E5EC516CA8FC0E34D4BF764B2D156B564F778A8E166FF70A9A835902000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_034026_977900_CF08FCB0 
X-CRM114-Status: GOOD (  17.30  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hsiao Chien
 Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

By registering component related functions to the pointers,
we can easily manage them within a for-loop and simplify the
logic of clock control significantly.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 111 +++++++-----------
 1 file changed, 44 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 60e5dfe9ef0d..fffef2a4f919 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -53,6 +53,7 @@ struct ovl_adaptor_comp_match {
 	enum mtk_ovl_adaptor_comp_type type;
 	enum mtk_ddp_comp_id comp_id;
 	int alias_id;
+	const struct mtk_ddp_comp_funcs *funcs;
 };
 
 struct mtk_disp_ovl_adaptor {
@@ -67,20 +68,35 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
 	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
 };
 
+static const struct mtk_ddp_comp_funcs _ethdr = {
+	.clk_enable = mtk_ethdr_clk_enable,
+	.clk_disable = mtk_ethdr_clk_disable,
+};
+
+static const struct mtk_ddp_comp_funcs _merge = {
+	.clk_enable = mtk_merge_clk_enable,
+	.clk_disable = mtk_merge_clk_disable,
+};
+
+static const struct mtk_ddp_comp_funcs _rdma = {
+	.clk_enable = mtk_mdp_rdma_clk_enable,
+	.clk_disable = mtk_mdp_rdma_clk_disable,
+};
+
 static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
-	[OVL_ADAPTOR_ETHDR0] = { OVL_ADAPTOR_TYPE_ETHDR, DDP_COMPONENT_ETHDR_MIXER, 0 },
-	[OVL_ADAPTOR_MDP_RDMA0] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA0, 0 },
-	[OVL_ADAPTOR_MDP_RDMA1] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA1, 1 },
-	[OVL_ADAPTOR_MDP_RDMA2] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA2, 2 },
-	[OVL_ADAPTOR_MDP_RDMA3] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA3, 3 },
-	[OVL_ADAPTOR_MDP_RDMA4] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA4, 4 },
-	[OVL_ADAPTOR_MDP_RDMA5] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA5, 5 },
-	[OVL_ADAPTOR_MDP_RDMA6] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA6, 6 },
-	[OVL_ADAPTOR_MDP_RDMA7] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA7, 7 },
-	[OVL_ADAPTOR_MERGE0] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE1, 1 },
-	[OVL_ADAPTOR_MERGE1] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE2, 2 },
-	[OVL_ADAPTOR_MERGE2] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE3, 3 },
-	[OVL_ADAPTOR_MERGE3] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE4, 4 },
+	[OVL_ADAPTOR_ETHDR0] = { OVL_ADAPTOR_TYPE_ETHDR, DDP_COMPONENT_ETHDR_MIXER, 0, &_ethdr },
+	[OVL_ADAPTOR_MDP_RDMA0] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA0, 0, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA1] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA1, 1, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA2] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA2, 2, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA3] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA3, 3, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA4] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA4, 4, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA5] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA5, 5, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA6] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA6, 6, &_rdma },
+	[OVL_ADAPTOR_MDP_RDMA7] = { OVL_ADAPTOR_TYPE_MDP_RDMA, DDP_COMPONENT_MDP_RDMA7, 7, &_rdma },
+	[OVL_ADAPTOR_MERGE0] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE1, 1, &_merge },
+	[OVL_ADAPTOR_MERGE1] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE2, 2, &_merge },
+	[OVL_ADAPTOR_MERGE2] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE3, 3, &_merge },
+	[OVL_ADAPTOR_MERGE3] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE4, 4, &_merge },
 };
 
 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
@@ -186,73 +202,34 @@ void mtk_ovl_adaptor_stop(struct device *dev)
 
 int mtk_ovl_adaptor_clk_enable(struct device *dev)
 {
-	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
-	struct device *comp;
-	int ret;
 	int i;
-
-	for (i = 0; i < OVL_ADAPTOR_MERGE0; i++) {
-		comp = ovl_adaptor->ovl_adaptor_comp[i];
-		ret = pm_runtime_get_sync(comp);
-		if (ret < 0) {
-			dev_err(dev, "Failed to enable power domain %d, err %d\n", i, ret);
-			goto pwr_err;
-		}
-	}
+	int ret;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
 
 	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
-		comp = ovl_adaptor->ovl_adaptor_comp[i];
-
-		if (i < OVL_ADAPTOR_MERGE0)
-			ret = mtk_mdp_rdma_clk_enable(comp);
-		else if (i < OVL_ADAPTOR_ETHDR0)
-			ret = mtk_merge_clk_enable(comp);
-		else
-			ret = mtk_ethdr_clk_enable(comp);
+		dev = ovl_adaptor->ovl_adaptor_comp[i];
+		if (!dev)
+			continue;
+		ret = comp_matches[i].funcs->clk_enable(dev);
 		if (ret) {
-			dev_err(dev, "Failed to enable clock %d, err %d\n", i, ret);
-			goto clk_err;
+			while (--i >= 0)
+				comp_matches[i].funcs->clk_disable(dev);
+			return ret;
 		}
 	}
-
-	return ret;
-
-clk_err:
-	while (--i >= 0) {
-		comp = ovl_adaptor->ovl_adaptor_comp[i];
-		if (i < OVL_ADAPTOR_MERGE0)
-			mtk_mdp_rdma_clk_disable(comp);
-		else if (i < OVL_ADAPTOR_ETHDR0)
-			mtk_merge_clk_disable(comp);
-		else
-			mtk_ethdr_clk_disable(comp);
-	}
-	i = OVL_ADAPTOR_MERGE0;
-
-pwr_err:
-	while (--i >= 0)
-		pm_runtime_put(ovl_adaptor->ovl_adaptor_comp[i]);
-
-	return ret;
+	return 0;
 }
 
 void mtk_ovl_adaptor_clk_disable(struct device *dev)
 {
-	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
-	struct device *comp;
 	int i;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
 
 	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
-		comp = ovl_adaptor->ovl_adaptor_comp[i];
-
-		if (i < OVL_ADAPTOR_MERGE0) {
-			mtk_mdp_rdma_clk_disable(comp);
-			pm_runtime_put(comp);
-		} else if (i < OVL_ADAPTOR_ETHDR0) {
-			mtk_merge_clk_disable(comp);
-		} else {
-			mtk_ethdr_clk_disable(comp);
-		}
+		dev = ovl_adaptor->ovl_adaptor_comp[i];
+		if (!dev)
+			continue;
+		comp_matches[i].funcs->clk_disable(dev);
 	}
 }
 
-- 
2.18.0


