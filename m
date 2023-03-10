Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648A6C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 02:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKQNhHm6N//epT/kKKmOBAV+Pxos4Bzj8k8OKQmEryU=; b=YmqjGG8DONKo/MKgvLWPsQM1Mv
	eR3inJr10KI+YG+yjG7OLCH96fvr2Qj+/KiIGpKTaqNN2FlO+sv11HJaH49rm69EzMBT0wsAYFvnv
	M3GKzYYgKBYujMXdQBpGnCyHKSs2uyMp8eHYH26VEMWJzLoCrFvq/ASya5PIxprJ3Tb2sRwkDlpfO
	whBx366A/FhJv3BCtoYGfxNeYNSRBmP6/WHAOpvRqrg+YzTleur8HSCCq9iNQ8lL3NbpqoiPkAmkT
	SJUrLcUlKxKkipqThUhXFt0UIqdK6d1QThC6N6kdqUR9m8WnmolnBd0M9QYkZRLkKXuQ6fw5A/WJI
	vgQ7Vvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paScb-00Cjr0-VR; Fri, 10 Mar 2023 02:36:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paSbm-00CjLG-HC; Fri, 10 Mar 2023 02:35:52 +0000
X-UUID: 41a34ae0beec11eda799af78a38f2b8e-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zKQNhHm6N//epT/kKKmOBAV+Pxos4Bzj8k8OKQmEryU=;
	b=Ctf4WPxNB6rYDMc2NpV1Soy4L4dIc/cUorCpvh+KPLObasN82uRRXWlrIFDFOj0Xt2mJuzzSlVZvYI5sht2ng5YrGjxVWeHNd2+3AWr+6LalkogHaf0tPFVjeEoZqfFuJcv4wiRvfbanoKRNkqOUqpbv1IpwTWUt/142hWscQaI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:97751277-96ee-4ea4-bc56-ffda3058828e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.20,REQID:97751277-96ee-4ea4-bc56-ffda3058828e,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:25b5999,CLOUDID:d7a958f5-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230310103510Q3O6T2A5,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 41a34ae0beec11eda799af78a38f2b8e-20230309
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1369903769; Thu, 09 Mar 2023 19:35:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 10 Mar 2023 10:35:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 10 Mar 2023 10:35:05 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Tomasz Figa <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
	<maoguang.meng@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [V2,1/7] media: mtk-jpeg: Fixes jpeghw multi-core judgement
Date: Fri, 10 Mar 2023 10:34:55 +0800
Message-ID: <1678415701-1691-2-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1678415701-1691-1-git-send-email-kyrie.wu@mediatek.com>
References: <1678415701-1691-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_183550_602087_46471F7C 
X-CRM114-Status: GOOD (  15.72  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

some chips have multi-hw, but others have only one,
modify the condition of multi-hw judgement

Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 5 ++++-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 969516a940ba..6d052747a15e 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1692,7 +1692,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	if (list_empty(&pdev->dev.devres_head)) {
+	if (!jpeg->variant->multi_core) {
 		INIT_DELAYED_WORK(&jpeg->job_timeout_work,
 				  mtk_jpeg_job_timeout_work);
 
@@ -1874,6 +1874,7 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
 	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
 	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.multi_core = false,
 };
 
 static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
@@ -1885,6 +1886,7 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
 	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
 	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.multi_core = true,
 };
 
 static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
@@ -1896,6 +1898,7 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
 	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+	.multi_core = true,
 };
 
 #if defined(CONFIG_OF)
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index b9126476be8f..f87358cc9f47 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -60,6 +60,7 @@ enum mtk_jpeg_ctx_state {
  * @ioctl_ops:			the callback of jpeg v4l2_ioctl_ops
  * @out_q_default_fourcc:	output queue default fourcc
  * @cap_q_default_fourcc:	capture queue default fourcc
+ * @multi_core:		mark jpeg hw is multi_core or not
  */
 struct mtk_jpeg_variant {
 	struct clk_bulk_data *clks;
@@ -74,6 +75,7 @@ struct mtk_jpeg_variant {
 	const struct v4l2_ioctl_ops *ioctl_ops;
 	u32 out_q_default_fourcc;
 	u32 cap_q_default_fourcc;
+	bool multi_core;
 };
 
 struct mtk_jpeg_src_buf {
-- 
2.18.0


