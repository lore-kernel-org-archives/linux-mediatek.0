Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97362C001E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Aug 2023 18:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJsAJeiGHwiwMezlxYjwfrjUfSzKOv8LuFks8OXsi34=; b=ApcbRisEs0fD/SyfJELHxAo8L6
	vASO42IPHIXhpFzFtbZAESYKDPIqRzRENnK6c0uwTsoRaYwwZxCXI/uy0tU1XE4L/g3VQbt3unkgO
	1gvl5S9xvhBWjf8QzZSplbfHgGu+aKZYNkDv46QqHWrhDwzT7DZA2qK0KwfRyqpdsb+YiUidP8ejr
	2nLjfY+UN/fwAMIhoddaRPEA4cNcaubQHW0a2GUMBy8gl88PCEipsH1SfkQqid9ys5lbOJvEQFh46
	cCslsgSUQattuJ2sekhcqYOmSIS+xa3D8jZepOzAB0cyH2kp+Tl9yynpMDoTZOHPB3eBD7kLb2LIy
	ULDWYjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTnib-005b5v-2C;
	Wed, 09 Aug 2023 18:15:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTniW-005b3p-2t;
	Wed, 09 Aug 2023 18:15:35 +0000
X-UUID: b89a609036e011ee83ed1395ce914268-20230809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dJsAJeiGHwiwMezlxYjwfrjUfSzKOv8LuFks8OXsi34=;
	b=DW4pxE9DfdmdzL+/liVJRmptAgK4mij1+YtuM/BzPli9Y6UGqOkINcsc3w43uXG/rukRRcjbeBCEuXkHtEvvcnAFhyDkGoeDAVwbo8GBF0R71LDrPti6ID3oltFx/F/3KGu3qeoQ2oCWOSn4lu0wtSe42AmegxMM9GANuFO98VY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:c5bc4298-8dd5-42ca-8d2f-707cdd459d91,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.31,REQID:c5bc4298-8dd5-42ca-8d2f-707cdd459d91,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:0ad78a4,CLOUDID:abaf9512-4929-4845-9571-38c601e9c3c9,B
	ulkID:23081002152968K6U2KN,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,
	TF_CID_SPAM_FAS
X-UUID: b89a609036e011ee83ed1395ce914268-20230809
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 891816034; Wed, 09 Aug 2023 11:15:29 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 10 Aug 2023 02:15:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 10 Aug 2023 02:15:26 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Eugen Hristev
	<eugen.hristev@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v9 4/7] drm/mediatek: Add encoder_index function to mtk_ddp_comp_funcs for dpi
Date: Thu, 10 Aug 2023 02:15:22 +0800
Message-ID: <20230809181525.7561-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_111532_952529_BA27CA55 
X-CRM114-Status: GOOD (  14.24  )
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

To support dynamic connector selection function, each ddp_comp need to
get their encoder_index to identify which connector should be selected.

Add encoder_index function to mtk_ddp_comp_funcs and the implementation
of mtk_dpi_encoder_index to get its encoder_index.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     | 1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c          | 9 +++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 1 +
 4 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 2254038519e1..5f07037670e9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -44,6 +44,7 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 
 void mtk_dpi_start(struct device *dev);
 void mtk_dpi_stop(struct device *dev);
+unsigned int mtk_dpi_encoder_index(struct device *dev);
 
 void mtk_dsi_ddp_start(struct device *dev);
 void mtk_dsi_ddp_stop(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 948a53f1f4b3..3d6b3c228f30 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -782,6 +782,15 @@ void mtk_dpi_stop(struct device *dev)
 	mtk_dpi_power_off(dpi);
 }
 
+unsigned int mtk_dpi_encoder_index(struct device *dev)
+{
+	struct mtk_dpi *dpi = dev_get_drvdata(dev);
+	unsigned int encoder_index = drm_encoder_index(&dpi->encoder);
+
+	dev_dbg(dev, "encoder index:%d\n", encoder_index);
+	return encoder_index;
+}
+
 static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index f114da4d36a9..effaaa769b46 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -304,6 +304,7 @@ static const struct mtk_ddp_comp_funcs ddp_dither = {
 static const struct mtk_ddp_comp_funcs ddp_dpi = {
 	.start = mtk_dpi_start,
 	.stop = mtk_dpi_stop,
+	.encoder_index = mtk_dpi_encoder_index,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_dsc = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index febcaeef16a1..326cb57a18c9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -80,6 +80,7 @@ struct mtk_ddp_comp_funcs {
 	void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
 	void (*add)(struct device *dev, struct mtk_mutex *mutex);
 	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
+	unsigned int (*encoder_index)(struct device *dev);
 };
 
 struct mtk_ddp_comp {
-- 
2.18.0


