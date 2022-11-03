Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B97C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 03:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7gHhVJ138wN7rMUd+kmkG6L3GmZ7XSx5wGaoOYN1/E=; b=hTDEPlxo/qfsh2XzGEMesMwHHx
	9BEevo2DiIBmK5fzix6gpsO66xesvPBerXvlcMwqEehMiOacTnUG/gca24SYZd3MMBhPr6yPyOilD
	+e6F7z/asYUWKvWQtjRm47HZ7jgCVPUKKms9HK4xM+FqgKYFCQF6XPJh1nuiu8BtXlBIPDtjovKfR
	bCZsO1D9vtoDvu3+iYpbQW3uL7OcOsLjlKetM6/9E2ejYkHUqMzL01aGTuaILst9z+nyrVlBmH6V/
	lRUrdW1RY26XoFj00nO9R8Da7+UU6D1a21gOQkGjvTfVan9uNYkirNmNEASHH01r920wbwGll17Cc
	UmlIexEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqQsL-00FlLe-19; Thu, 03 Nov 2022 03:26:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqQra-00FkvS-5x; Thu, 03 Nov 2022 03:25:59 +0000
X-UUID: 5ad9d85d69d84c349866ac78c338744e-20221102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=G7gHhVJ138wN7rMUd+kmkG6L3GmZ7XSx5wGaoOYN1/E=;
	b=VQcpqdI82mTMi4q+6J8dOoex2yQb6+naUTZmRWx3Qwfxi/U1H1dNhwFEubBKBie1WCkg4vMH4Yfnx66u6fML2r+TR44m26X0r1e5fSyrHZ2Z1AmEV1jQJlVRIfTCiDfMJTQwlaHAJTic7YgxNW/Fe0p53aVJZO81AzFIuz7y980=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:5505b640-2363-45b5-8cf5-4fc4d45dc04b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:e6f87681-3116-4fbc-b86b-83475c3df513,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5ad9d85d69d84c349866ac78c338744e-20221102
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 18368096; Wed, 02 Nov 2022 20:25:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 3 Nov 2022 11:25:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 3 Nov 2022 11:25:14 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
	<nfraprado@collabora.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
	<jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
	<singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v27 06/11] soc: mediatek: add mtk-mmsys config API for mt8195 vdosys1
Date: Thu, 3 Nov 2022 11:25:07 +0800
Message-ID: <20221103032512.9144-7-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221103032512.9144-1-nancy.lin@mediatek.com>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_202554_306105_C63F2EE8 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add four mmsys config APIs. The config APIs are used for config
mmsys reg. Some mmsys regs need to be set according to the
HW engine binding to the mmsys simultaneously.

1. mtk_mmsys_merge_async_config: config merge async width/height.
   async is used for cross-clock domain synchronization.
2. mtk_mmsys_hdr_confing: config hdr backend async width/height.
3. mtk_mmsys_mixer_in_config and mtk_mmsys_mixer_in_config:
   config mixer related settings.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h    |  6 +++++
 drivers/soc/mediatek/mtk-mmsys.c       | 35 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h |  9 +++++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index fd7b455bd675..454944a9409c 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -75,6 +75,12 @@
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
 
+#define MT8195_VDO1_MERGE0_ASYNC_CFG_WD				0xe30
+#define MT8195_VDO1_HDRBE_ASYNC_CFG_WD				0xe70
+#define MT8195_VDO1_HDR_TOP_CFG					0xd00
+#define MT8195_VDO1_MIXER_IN1_ALPHA				0xd30
+#define MT8195_VDO1_MIXER_IN1_PAD				0xd40
+
 #define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
 #define MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0			1
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 135639f21c9b..f693d7eacff1 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -137,6 +137,41 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
+void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height)
+{
+	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MERGE0_ASYNC_CFG_WD + 0x10 * idx,
+			      ~0, height << 16 | width);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_merge_async_config);
+
+void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height)
+{
+	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
+			      be_height << 16 | be_width);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_confing);
+
+void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
+			       u8 mode, u32 biwidth)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+
+	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_ALPHA + (idx - 1) * 4, ~0,
+			      alpha << 16 | alpha);
+	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(19 + idx),
+			      alpha_sel << (19 + idx));
+	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
+			      GENMASK(31, 16) | GENMASK(1, 0), biwidth << 16 | mode);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_config);
+
+void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap)
+{
+	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
+			      BIT(4), channel_swap << 4);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_channel_swap);
+
 void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
 {
 	if (val)
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 127f1b888ace..ec9190e792f2 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -75,4 +75,13 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 
 void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
 
+void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height);
+
+void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height);
+
+void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
+			       u8 mode, u32 biwidth);
+
+void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


