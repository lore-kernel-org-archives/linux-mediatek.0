Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8B9C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TXVeK2XZRnS2l1FHjwfRTYCJAXGiQuPXD9S/0sSz3o=; b=1UFk6e7tTc4+ek5B4tqwm0IEzE
	2pOQLfWVUfsaToB5H9Mq7Q4bvNoPXGij8uCvfz9hubl9A+wi3IkdaMtjU/7GJq6nc5naiatqezTZz
	kpzXoJWPoUNpc/en8djwWnksPEYm7J6Riu+q0c3ujIIrx6J4GdfxBq20IN7bZzl45wzEnj5xptIDC
	zjn7alxJoENci1Te310MxsZiIba/WO8ltntNgloS1wJq6AfEvto8uhx8CW1hZMuiQjRbNLwsHTsfG
	dO1Ykb7towbBd2wYIcmUcjfVRFLw3vkDYGqZO03wy2nbK46QD/62GZq0Q/RrkuhODnkKYkw67kGNB
	1G/ITRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2r78-00Gd7g-LF; Wed, 07 Dec 2022 09:53:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2r44-00GZnx-Us; Wed, 07 Dec 2022 09:50:15 +0000
X-UUID: b44b26a309ab49b48a4d5784681e4386-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4TXVeK2XZRnS2l1FHjwfRTYCJAXGiQuPXD9S/0sSz3o=;
	b=qmC4ysqVHcgnz+LHN+TI4uaRUk6B6D6ZqPyzK0fh84eM329G9TS8QBwrqzx356cQkKaws8LwST0kSheMA3vQdRVeyP0Y4jTHsAHKEyt56adnp7i3ISKiOENRBQOoDContwvhI2AvDG5FwkTm7VMjqOkk6aOKOWIhM2SWd2Wpk+s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:bac52cff-1b5f-4117-b424-9301f4ce5b06,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.14,REQID:bac52cff-1b5f-4117-b424-9301f4ce5b06,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:dcaaed0,CLOUDID:3e019324-4387-4253-a41d-4f6f2296b154,B
	ulkID:221207175005XYVEB5JQ,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b44b26a309ab49b48a4d5784681e4386-20221207
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1671294005; Wed, 07 Dec 2022 02:50:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 17:49:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 17:49:23 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v4 6/8] soc: mediatek: mmsys: add config api for RSZ switching and DCM
Date: Wed, 7 Dec 2022 17:49:19 +0800
Message-ID: <20221207094921.15450-7-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221207094921.15450-1-moudy.ho@mediatek.com>
References: <20221207094921.15450-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_015009_037316_3A6B558D 
X-CRM114-Status: GOOD (  12.36  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Due to MT8195 HW design, some RSZs have additional settings that
need to be configured in MMSYS.

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h    | 13 ++++++++
 drivers/soc/mediatek/mtk-mmsys.c       | 42 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h |  4 +++
 3 files changed, 59 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index abfe94a30248..a1b8e3fd037e 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -75,6 +75,19 @@
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
 
+/* VPPSYS1 */
+#define MT8195_VPP1_HW_DCM_1ST_DIS0				0x150
+#define MT8195_VPP1_HW_DCM_1ST_DIS1				0x160
+#define MT8195_VPP1_HW_DCM_2ND_DIS0				0x1a0
+#define MT8195_VPP1_HW_DCM_2ND_DIS1				0x1b0
+#define MT8195_SVPP2_BUF_BF_RSZ_SWITCH				0xf48
+#define MT8195_SVPP3_BUF_BF_RSZ_SWITCH				0xf74
+
+/* VPPSYS1 HW DCM client*/
+#define MT8195_SVPP1_MDP_RSZ					BIT(25)
+#define MT8195_SVPP2_MDP_RSZ					BIT(4)
+#define MT8195_SVPP3_MDP_RSZ					BIT(5)
+
 static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 5a3189544c5a..d98e16408680 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -175,6 +175,48 @@ void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
 
+void mtk_mmsys_vpp_rsz_merge_config(struct device *dev, u32 id, bool enable)
+{
+	u32 reg;
+
+	switch (id) {
+	case 2:
+		reg = MT8195_SVPP2_BUF_BF_RSZ_SWITCH;
+		break;
+	case 3:
+		reg = MT8195_SVPP3_BUF_BF_RSZ_SWITCH;
+		break;
+	default:
+		dev_err(dev, "Invalid id %d\n", id);
+		return;
+	}
+
+	mtk_mmsys_update_bits(dev_get_drvdata(dev), reg, ~0, enable);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_vpp_rsz_merge_config);
+
+void mtk_mmsys_vpp_rsz_dcm_config(struct device *dev, bool enable)
+{
+	u32 client;
+
+	client = MT8195_SVPP1_MDP_RSZ;
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_VPP1_HW_DCM_1ST_DIS0, client,
+			      ((enable) ? client : 0));
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_VPP1_HW_DCM_2ND_DIS0, client,
+			      ((enable) ? client : 0));
+
+	client = MT8195_SVPP2_MDP_RSZ | MT8195_SVPP3_MDP_RSZ;
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_VPP1_HW_DCM_1ST_DIS1, client,
+			      ((enable) ? client : 0));
+	mtk_mmsys_update_bits(dev_get_drvdata(dev),
+			      MT8195_VPP1_HW_DCM_2ND_DIS1, client,
+			      ((enable) ? client : 0));
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_vpp_rsz_dcm_config);
+
 static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
 				  bool assert)
 {
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index b85f66db33e1..5ed593cccfe6 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -74,4 +74,8 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 
 void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
 
+void mtk_mmsys_vpp_rsz_merge_config(struct device *dev, u32 id, bool enable);
+
+void mtk_mmsys_vpp_rsz_dcm_config(struct device *dev, bool enable);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


