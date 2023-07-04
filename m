Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5826EB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 11:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDLpm+deh3FoiE7WvZgKoSPC76z1q3qJIm2/WlmWycE=; b=AoIMmH4awFOoTLTIyNLtYIuXOT
	f1jjtOELJq5eFgsmnOVX05rCHFGXGInbpjNb3vR5bQ7r6bhBhLmaelOjURN67smApdQvyRkepurCq
	5Egx+sT+51TO7Er7RM1IoTk0e+Ovu4yOlP095VO4M5WKGgupCccpMn45tGWnDV4x9KmQNbioGw5mA
	kLmL5vhFEdF31zSjBSFbIGY2heGKmIprXnve5v0T2md7eRwhS4a7ir0hUT/79SOOsdgWOjLis20Xu
	VIi0XIZ3EfU4yEjkKx0qpXT4IbdpkdyuMpzUXNV31XZoV8Jw1GqMLU2r3uaaYKljprF2yDMs+SrCH
	yIJU99sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdyc-00D5OO-1R;
	Tue, 04 Jul 2023 11:13:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdyZ-00D5MM-14;
	Tue, 04 Jul 2023 11:13:44 +0000
X-UUID: d0af5f561a5b11ee912e1518a6540028-20230704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MDLpm+deh3FoiE7WvZgKoSPC76z1q3qJIm2/WlmWycE=;
	b=Sj6zwjJHonwT6TNg9a14+bImXl9pAwv1NkDATANdkwVmnSCGMzXsaMA4gW5gz496GKfnSe11Bh6OLq1le1/nVANRo0map/YqdKoHN35jfbz0ZY4YFVjeSSrGU1UmI9z2KOVMSjvisiHieLBjAvfHE5O43NNQbis0zo/GXKGEYx4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:d00972ce-a57a-486a-8dca-b022d6585ffb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.27,REQID:d00972ce-a57a-486a-8dca-b022d6585ffb,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:01c9525,CLOUDID:96128d0d-26a8-467f-b838-f99719a9c083,B
	ulkID:23070419133324EEIGR0,BulkQuantity:1,Recheck:0,SF:29|28|17|19|48|38,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: d0af5f561a5b11ee912e1518a6540028-20230704
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 797401504; Tue, 04 Jul 2023 04:13:34 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 4 Jul 2023 19:13:31 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 4 Jul 2023 19:13:30 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5,02/11] media: mediatek: vcodec: align fw interface
Date: Tue, 4 Jul 2023 19:13:18 +0800
Message-ID: <20230704111327.7140-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230704111327.7140-1-yunfei.dong@mediatek.com>
References: <20230704111327.7140-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_041343_378511_3FCB3ACF 
X-CRM114-Status: GOOD (  15.56  )
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
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
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


