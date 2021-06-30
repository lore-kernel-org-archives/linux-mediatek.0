Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF74C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 08:54:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41FFE61628
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 08:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41FFE61628
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H03d5BDP+VDyQvbthpL5sUs40+8p/UG3j1KaeElxqY4=; b=fgDSOKeJyoD6L9
	efpILVazsBz/KGr6L2dFI589rtnH/CMkbXTN5YwRzJAfZWDADeH8yTWLgqWOSRIo0HImDOhBN+GIO
	s/M76/fHKDpUZzdACv78VSvJD90eEyObJnNYsRqwL7/UU+jyrtBGgvo6vwMsLslBDB8wNGmMLVS3N
	9DyuxwREEniE+0PpZLOKJW/k4prrNB753anCqSgH26Um9SppeCLktIugfvdpeSfOF+xiAorHkwxhP
	i5Zll1RFlHTkvxMFZdOWwkT3R5d+6lS9SuWbE/tIqE95n1x3Mu0uZn2bFKF//4E/vx/qftvR+eb/e
	dlBOWpA5PLlEbymWezYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyVzC-00DMqD-KK; Wed, 30 Jun 2021 08:54:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyVxz-00DMOm-MM; Wed, 30 Jun 2021 08:53:11 +0000
X-UUID: cf6e34e927d5453899234ef82c45c3ef-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ENyI0dForS9SrsajZtYB6EHcIf1wE8g8b3HViojDoZA=; 
 b=L4UVvBFnj++dy69swx54xOtRz8cn4RoaiGcIlj3fQclxuGcjIfH4O84vGdQYFD+XwRridOTfhj7S+QBDw5oX3eFCHeMMVtqVwduGW+plYoDcIVeuhghmZP1tsGtWYl1mZLoNcPd+hkePsdd5h4d/rnQum03s6d6W8yqbP1ad8wg=;
X-UUID: cf6e34e927d5453899234ef82c45c3ef-20210630
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 853617996; Wed, 30 Jun 2021 01:52:57 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 01:52:55 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 16:52:53 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 16:52:52 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 1/3] media: mtk-vcodec: Clean redundant encoder format
 definition
Date: Wed, 30 Jun 2021 16:52:45 +0800
Message-ID: <20210630085247.27554-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630085247.27554-1-irui.wang@mediatek.com>
References: <20210630085247.27554-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_015309_228899_B517D96A 
X-CRM114-Status: GOOD (  14.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The supported capture/output formats don't depend on models,
clean redundant definitions and nameing with type instead.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 50 ++++++++-----------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 45d1870c83dd..4489a9744cd7 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -26,7 +26,7 @@
 module_param(mtk_v4l2_dbg_level, int, S_IRUGO | S_IWUSR);
 module_param(mtk_vcodec_dbg, bool, S_IRUGO | S_IWUSR);
 
-static const struct mtk_video_fmt mtk_video_formats_output_mt8173[] = {
+static const struct mtk_video_fmt mtk_video_formats_output[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12M,
 		.type = MTK_FMT_FRAME,
@@ -49,7 +49,7 @@ static const struct mtk_video_fmt mtk_video_formats_output_mt8173[] = {
 	},
 };
 
-static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_avc[] =  {
+static const struct mtk_video_fmt mtk_video_formats_capture_h264[] =  {
 	{
 		.fourcc = V4L2_PIX_FMT_H264,
 		.type = MTK_FMT_ENC,
@@ -57,7 +57,7 @@ static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_avc[] =  {
 	},
 };
 
-static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_vp8[] =  {
+static const struct mtk_video_fmt mtk_video_formats_capture_vp8[] =  {
 	{
 		.fourcc = V4L2_PIX_FMT_VP8,
 		.type = MTK_FMT_ENC,
@@ -65,14 +65,6 @@ static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_vp8[] =  {
 	},
 };
 
-static const struct mtk_video_fmt mtk_video_formats_capture_mt8183[] =  {
-	{
-		.fourcc = V4L2_PIX_FMT_H264,
-		.type = MTK_FMT_ENC,
-		.num_planes = 1,
-	},
-};
-
 /* Wake up context wait_queue */
 static void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
 {
@@ -392,10 +384,10 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
 static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 	.chip = MTK_MT8173,
-	.capture_formats = mtk_video_formats_capture_mt8173_avc,
-	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8173_avc),
-	.output_formats = mtk_video_formats_output_mt8173,
-	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.capture_formats = mtk_video_formats_capture_h264,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
+	.output_formats = mtk_video_formats_output,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 1,
 	.max_bitrate = 4000000,
 	.core_id = VENC_SYS,
@@ -403,10 +395,10 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 
 static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 	.chip = MTK_MT8173,
-	.capture_formats = mtk_video_formats_capture_mt8173_vp8,
-	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8173_vp8),
-	.output_formats = mtk_video_formats_output_mt8173,
-	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.capture_formats = mtk_video_formats_capture_vp8,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_vp8),
+	.output_formats = mtk_video_formats_output,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 4000000,
 	.core_id = VENC_LT_SYS,
@@ -415,11 +407,10 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 	.chip = MTK_MT8183,
 	.uses_ext = true,
-	.capture_formats = mtk_video_formats_capture_mt8183,
-	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
-	/* MT8183 supports the same output formats as MT8173 */
-	.output_formats = mtk_video_formats_output_mt8173,
-	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.capture_formats = mtk_video_formats_capture_h264,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
+	.output_formats = mtk_video_formats_output,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 40000000,
 	.core_id = VENC_SYS,
@@ -428,16 +419,15 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
 	.chip = MTK_MT8192,
 	.uses_ext = true,
-	/* MT8192 supports the same capture formats as MT8183 */
-	.capture_formats = mtk_video_formats_capture_mt8183,
-	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
-	/* MT8192 supports the same output formats as MT8173 */
-	.output_formats = mtk_video_formats_output_mt8173,
-	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.capture_formats = mtk_video_formats_capture_h264,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
+	.output_formats = mtk_video_formats_output,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output),
 	.min_bitrate = 64,
 	.max_bitrate = 100000000,
 	.core_id = VENC_SYS,
 };
+
 static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8173-vcodec-enc",
 			.data = &mt8173_avc_pdata},
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
