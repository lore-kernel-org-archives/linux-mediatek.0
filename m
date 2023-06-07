Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2975C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHZ5pK7jB7tXpFRBJY3BYm8jPO6geMxkX0omTpVH8Vc=; b=ZuxiKgzQwMSoX0aVVTuFav6/Fs
	wBKTFp44F+NtRZemnvc/E6vlEifYP8pwUOy3tF8myKvA5AZZIvyMOBhnsWBBHI5ZB75Dmr5XuhOZg
	WFgwMheUzUqzlt8FXu7FwwOEeL3pjjASy0eGm8CUew8DCQXGFnHsr2JxXFk+0liOcxdaBzNzTAIft
	WQtWskYQXkgN1fGW2jPmfLUtOHUmTPDnfIF/Z42CFHwCp7Z14owfv6nKB6UheNXmXnqOFrtuKUD2d
	PO2dxWwo29h4nXyEmy2jsuBqt5bu//E/ZMblIyvtTsDxjEMZz/aB6Q+w1c+jwmdfOgd9BIZo4mrW2
	Nkcyo6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6orX-0053Ns-0x;
	Wed, 07 Jun 2023 08:49:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6orU-0053ME-0G;
	Wed, 07 Jun 2023 08:49:50 +0000
X-UUID: 3e7f15a0051011ee83ed1395ce914268-20230607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qHZ5pK7jB7tXpFRBJY3BYm8jPO6geMxkX0omTpVH8Vc=;
	b=L6uVfp6D/6bqAs8dC5drR4wvcclmP5HHbWED+v4yfOuOb5sXTQE4JR8r6AmVSshfh0Ojg7iunP8+BSh1N1fow5xB5f1vkfhPAsKD1dRuO9vTxPpPVBr4S89pu4zDfd4Hrcmg/S18PYqh5c2DS8oK3dOGhWHECpC7AgTFdY6zeWU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:b83132a0-6287-4466-ae55-6197db3e9a98,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:2acba83d-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 3e7f15a0051011ee83ed1395ce914268-20230607
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1885142621; Wed, 07 Jun 2023 01:49:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Jun 2023 16:49:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Jun 2023 16:49:04 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,02/10] media: mediatek: vcodec: align fw interface
Date: Wed, 7 Jun 2023 16:48:53 +0800
Message-ID: <20230607084901.28021-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607084901.28021-1-yunfei.dong@mediatek.com>
References: <20230607084901.28021-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_014948_121472_A1040814 
X-CRM114-Status: GOOD (  16.05  )
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

Align scp and vpu firmware interface, remove the depedency for
'struct mtk_vcodec_dev' and 'struct mtk_vcodec_ctx'. It will be
much easier to separate video encoder and decoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mediatek/vcodec/mtk_vcodec_fw.c   |  7 +++----
 .../media/platform/mediatek/vcodec/mtk_vcodec_fw.h   |  3 +--
 .../platform/mediatek/vcodec/mtk_vcodec_fw_priv.h    | 11 +++++------
 .../platform/mediatek/vcodec/mtk_vcodec_fw_scp.c     |  9 ++++++---
 .../platform/mediatek/vcodec/mtk_vcodec_fw_vpu.c     | 12 ++++++++----
 5 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.c
index 556e54aadac9..be9159acacf8 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.c
@@ -5,15 +5,14 @@
 #include "mtk_vcodec_util.h"
 #include "mtk_vcodec_drv.h"
 
-struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
-					   enum mtk_vcodec_fw_type type,
+struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_type type,
 					   enum mtk_vcodec_fw_use fw_use)
 {
 	switch (type) {
 	case VPU:
-		return mtk_vcodec_fw_vpu_init(dev, fw_use);
+		return mtk_vcodec_fw_vpu_init(priv, fw_use);
 	case SCP:
-		return mtk_vcodec_fw_scp_init(dev);
+		return mtk_vcodec_fw_scp_init(priv, fw_use);
 	default:
 		mtk_v4l2_err("invalid vcodec fw type");
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.h
index 16824114657f..d8cfbec323d5 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.h
@@ -25,8 +25,7 @@ struct mtk_vcodec_fw;
 typedef void (*mtk_vcodec_ipi_handler) (void *data,
 	unsigned int len, void *priv);
 
-struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
-					   enum mtk_vcodec_fw_type type,
+struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_type type,
 					   enum mtk_vcodec_fw_use fw_use);
 void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw);
 
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_priv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_priv.h
index b41e66185cec..3438a4917344 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_priv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_priv.h
@@ -12,6 +12,7 @@ struct mtk_vcodec_fw {
 	const struct mtk_vcodec_fw_ops *ops;
 	struct platform_device *pdev;
 	struct mtk_scp *scp;
+	enum mtk_vcodec_fw_use fw_use;
 };
 
 struct mtk_vcodec_fw_ops {
@@ -28,22 +29,20 @@ struct mtk_vcodec_fw_ops {
 };
 
 #if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_VPU)
-struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
-					     enum mtk_vcodec_fw_use fw_use);
+struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use fw_use);
 #else
 static inline struct mtk_vcodec_fw *
-mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
-		       enum mtk_vcodec_fw_use fw_use)
+mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use fw_use)
 {
 	return ERR_PTR(-ENODEV);
 }
 #endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_VPU */
 
 #if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP)
-struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev);
+struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use fw_use);
 #else
 static inline struct mtk_vcodec_fw *
-mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
+mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
 {
 	return ERR_PTR(-ENODEV);
 }
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
index d8e66b645bd8..9a2472442c6f 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
@@ -53,18 +53,21 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
 	.release = mtk_vcodec_scp_release,
 };
 
-struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
+struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use fw_use)
 {
 	struct mtk_vcodec_fw *fw;
+	struct mtk_vcodec_dev *dev = priv;
+	struct platform_device *plat_dev;
 	struct mtk_scp *scp;
 
-	scp = scp_get(dev->plat_dev);
+	plat_dev = dev->plat_dev;
+	scp = scp_get(plat_dev);
 	if (!scp) {
 		mtk_v4l2_err("could not get vdec scp handle");
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_vpu.c
index cfc7ebed8fb7..46a028031133 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_vpu.c
@@ -77,10 +77,11 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
 	.release = mtk_vcodec_vpu_release,
 };
 
-struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
-					     enum mtk_vcodec_fw_use fw_use)
+struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use fw_use)
 {
 	struct platform_device *fw_pdev;
+	struct mtk_vcodec_dev *dev = priv;
+	struct platform_device *plat_dev;
 	struct mtk_vcodec_fw *fw;
 	enum rst_id rst_id;
 
@@ -94,19 +95,22 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
 		break;
 	}
 
-	fw_pdev = vpu_get_plat_device(dev->plat_dev);
+	plat_dev = dev->plat_dev;
+	fw_pdev = vpu_get_plat_device(plat_dev);
 	if (!fw_pdev) {
 		mtk_v4l2_err("firmware device is not ready");
 		return ERR_PTR(-EINVAL);
 	}
+
 	vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_handler, dev, rst_id);
 
-	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
 	if (!fw)
 		return ERR_PTR(-ENOMEM);
 	fw->type = VPU;
 	fw->ops = &mtk_vcodec_vpu_msg;
 	fw->pdev = fw_pdev;
+	fw->fw_use = fw_use;
 
 	return fw;
 }
-- 
2.18.0


