Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94DDC25B42
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 03:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qw1btiZ333bAN44lEgVrM+yrorPYgbtgiIqxNf6E304=; b=xC/vcnt55+6AZ6YA+owKmvDum2
	DMuRfTwuLQ06x/yLeGWZFHKyCUJQB1VRMHI4/+3kBEliim/Cb6aLiNRNfQnlqIIKcnMCl5taKmyeD
	RHc/WBh2TPwO6kk0JoWxxhnADzH7fIEmNCKt6SqFVK/zzL8dj4mamA+gw6/sGZUQyuYR4pf736gF/
	8NZltrwHPlHHQ4B+k00jlb4OYlKBZ5DnU9po0TT/8oOD/tAYNYWbuboRkuFU02b87D9+4oL4Qxcbg
	b0j9kqpamHuItTTb7C8IQox1PIiqMvYonsv1TDMKVwumHyrONcuVH01asc9QGMUTl2Wmc5+GbOTnS
	xvoTeFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qulHO-006IIz-1p;
	Mon, 23 Oct 2023 03:06:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qulHJ-006IFi-1x;
	Mon, 23 Oct 2023 03:06:55 +0000
X-UUID: 33662d40715111ee86758d4a7c00f3a0-20231022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qw1btiZ333bAN44lEgVrM+yrorPYgbtgiIqxNf6E304=;
	b=kLRmfs9IRCKq7gYqlFQffXentBIJ/OemIMUbUSMqZ32nGtSGxwmo3uQcP7U0NSCTexHLPPQ+YmSqqQh03w+vxHSxE64y5xcuKdzeQ7+7peZPVqHEhnQQCm30sm3LZ5KpsssvZ9ZMmfcwlJg3HJ6MUzNdjrndVKyjoP/SC5J0ZsA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:59649d51-2810-454b-8235-b46a0adca83b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:c2ec8094-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 33662d40715111ee86758d4a7c00f3a0-20231022
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1614048801; Sun, 22 Oct 2023 20:06:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 11:06:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 11:06:42 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve
 Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,1/7] media: mediatek: vcodec: Get the chip name for each platform
Date: Mon, 23 Oct 2023 11:06:34 +0800
Message-ID: <20231023030640.16393-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023030640.16393-1-yunfei.dong@mediatek.com>
References: <20231023030640.16393-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_200653_661476_8F25CC45 
X-CRM114-Status: GOOD (  18.51  )
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

Store the name of the chip in the context of the driver in order
to be able to choose the correct configuration values for the
different codecs.
Use a enum value instead of an integer to store a more descriptive name.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 24 +----------------
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       | 26 +++++++++++++++++++
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       | 14 ++++++++++
 3 files changed, 41 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 91ed576d6821..ba742f0e391d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -208,36 +208,14 @@ static int vidioc_vdec_dqbuf(struct file *file, void *priv,
 	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
 }
 
-static int mtk_vcodec_dec_get_chip_name(void *priv)
-{
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
-	struct device *dev = &ctx->dev->plat_dev->dev;
-
-	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-dec"))
-		return 8173;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-dec"))
-		return 8183;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-dec"))
-		return 8192;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-dec"))
-		return 8195;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8186-vcodec-dec"))
-		return 8186;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-dec"))
-		return 8188;
-	else
-		return 8173;
-}
-
 static int vidioc_vdec_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
 	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
 	struct device *dev = &ctx->dev->plat_dev->dev;
-	int platform_name = mtk_vcodec_dec_get_chip_name(priv);
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
-	snprintf(cap->card, sizeof(cap->card), "MT%d video decoder", platform_name);
+	snprintf(cap->card, sizeof(cap->card), "MT%d video decoder", ctx->dev->chip_name);
 
 	return 0;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 0a89ce452ac3..f47c98faf068 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -326,6 +326,26 @@ static const struct v4l2_file_operations mtk_vcodec_fops = {
 	.mmap		= v4l2_m2m_fop_mmap,
 };
 
+static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev *vdec_dev)
+{
+	struct device *dev = &vdec_dev->plat_dev->dev;
+
+	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-dec"))
+		vdec_dev->chip_name = MTK_VDEC_MT8173;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-dec"))
+		vdec_dev->chip_name = MTK_VDEC_MT8183;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-dec"))
+		vdec_dev->chip_name = MTK_VDEC_MT8192;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-dec"))
+		vdec_dev->chip_name = MTK_VDEC_MT8195;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8186-vcodec-dec"))
+		vdec_dev->chip_name = MTK_VDEC_MT8186;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-dec"))
+		vdec_dev->chip_name = MTK_VDEC_MT8188;
+	else
+		vdec_dev->chip_name = MTK_VDEC_INVAL;
+}
+
 static int mtk_vcodec_probe(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dec_dev *dev;
@@ -341,6 +361,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&dev->ctx_list);
 	dev->plat_dev = pdev;
 
+	mtk_vcodec_dec_get_chip_name(dev);
+	if (dev->chip_name == MTK_VDEC_INVAL) {
+		dev_err(&pdev->dev, "Failed to get decoder chip name");
+		return -EINVAL;
+	}
+
 	dev->vdec_pdata = of_device_get_match_data(&pdev->dev);
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
 				  &rproc_phandle)) {
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 7e36b2c69b7d..849b89dd205c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -18,6 +18,16 @@
 #define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
 #define IS_VDEC_INNER_RACING(capability) ((capability) & MTK_VCODEC_INNER_RACING)
 
+enum mtk_vcodec_dec_chip_name {
+	MTK_VDEC_INVAL = 0,
+	MTK_VDEC_MT8173 = 8173,
+	MTK_VDEC_MT8183 = 8183,
+	MTK_VDEC_MT8186 = 8186,
+	MTK_VDEC_MT8188 = 8188,
+	MTK_VDEC_MT8192 = 8192,
+	MTK_VDEC_MT8195 = 8195,
+};
+
 /*
  * enum mtk_vdec_format_types - Structure used to get supported
  *		  format types according to decoder capability
@@ -249,6 +259,8 @@ struct mtk_vcodec_dec_ctx {
  * @vdec_racing_info: record register value
  * @dec_racing_info_mutex: mutex lock used for inner racing mode
  * @dbgfs: debug log related information
+ *
+ * @chip_name: used to distinguish platforms and select the correct codec configuration values
  */
 struct mtk_vcodec_dec_dev {
 	struct v4l2_device v4l2_dev;
@@ -289,6 +301,8 @@ struct mtk_vcodec_dec_dev {
 	/* Protects access to vdec_racing_info data */
 	struct mutex dec_racing_info_mutex;
 	struct mtk_vcodec_dbgfs dbgfs;
+
+	enum mtk_vcodec_dec_chip_name chip_name;
 };
 
 static inline struct mtk_vcodec_dec_ctx *fh_to_dec_ctx(struct v4l2_fh *fh)
-- 
2.18.0


