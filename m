Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E95C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 02:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYszTDzcbttfvAF3CXSLu+F11if5Sng517HUPZbjxR8=; b=NYImnDlMMtJjqk8bCsKnDAS3Sl
	65/fUJk8fMcmLEMhNBygylfDXvjMuigj9K82Toz4uR6MMFyYNssKR7sM+x0+I5GmsyM7yxHssUQ9v
	Q/LX4b45QxVhyUdmZ6JGSausSASe63f4TNTtLXQPlljyf+Rv5SNHC6s7J6ZXOHY0aRzn1FvLA2WVi
	uGmdvDcBgnfZ9SL/VrIbg79/cI1A4Kiu96Re/q0LpbNSTd+uqUUg7Pm5HwSoHH7p9ibAI4bnc58R6
	EZE3ciZqkxhaucSImPg4+ykbwawz40bbpY44T2++WSMbpydqNP//Tm2CtkxvaKpFHWuH+qiUEdXPK
	4A6etOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oinfN-00AFyH-LH; Thu, 13 Oct 2022 02:09:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oineq-00AFbZ-HZ; Thu, 13 Oct 2022 02:09:15 +0000
X-UUID: c3adf63e8a484419a07e2c6ee8159fef-20221012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iYszTDzcbttfvAF3CXSLu+F11if5Sng517HUPZbjxR8=;
	b=CXMoNK43v9LQ7x+ziKFVJ5/Ke3HkaGgNveo2vbNeC/4sQt9wVVU+Xy/VgEO1a3s4hCS9mmyEcNa5UYVLZIOcsVbdBnM+I62LWDrxeHsNHImnVomtrYz2hhqPy9Dbc2CkjpwNby/qdG60U8MnTNsHGhvjCf8FVTMd4hSVGyg5udM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:2647c070-ce04-4a67-949f-7a9d08225267,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:75
X-CID-INFO: VERSION:1.1.11,REQID:2647c070-ce04-4a67-949f-7a9d08225267,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:75
X-CID-META: VersionHash:39a5ff1,CLOUDID:baf119ff-ee8c-4ff7-afe9-644435e96625,B
	ulkID:221013100335XLD05XQG,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: c3adf63e8a484419a07e2c6ee8159fef-20221012
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 978879451; Wed, 12 Oct 2022 19:04:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 13 Oct 2022 10:03:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 13 Oct 2022 10:03:31 +0800
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
Subject: [PATCH v3 6/8] soc: mediatek: mmsys: add config api for RSZ switching and DCM
Date: Thu, 13 Oct 2022 10:03:27 +0800
Message-ID: <20221013020329.8800-7-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221013020329.8800-1-moudy.ho@mediatek.com>
References: <20221013020329.8800-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_190912_647757_3275ED73 
X-CRM114-Status: GOOD (  11.22  )
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
index 86454c0812b1..c2d42e8cd301 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -160,6 +160,48 @@ void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
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
index 16ac0e5847f0..691d70545311 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -66,4 +66,8 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 
 void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
 
+void mtk_mmsys_vpp_rsz_merge_config(struct device *dev, u32 id, bool enable);
+
+void mtk_mmsys_vpp_rsz_dcm_config(struct device *dev, bool enable);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


