Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEB3C433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:17:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D14F207E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:17:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jpmzdKYF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="p6B1oltj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D14F207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6/fXPxxkOaEPau1l+3CDpJ+AqIh/KKuuKbteuqjcu0A=; b=jpmzdKYFBkqOnwGb4niBNTFRC
	2Sm/wWf71c3W/YXg2DsOMLvCjOjs8Jx/twWuAX0FzxxhRK13CkGZKcxsoVpb4vZAkRToohbDc5J7f
	2DtWWjJrOfwY25e0DkmHnH2IgxIvuQ56QeyPuCKwRPtvxdIUUntTWuqPn7HZnh7H+wph5/2JZJ+H3
	PSlHku/WudetnTf5nMgZCLdkO42MMKqwXH+GmCkw0liuXke1zJZRnX1vG3lRm//xEMjevRSBhaFQk
	PFvofpikV1M9BVs5WvAP42Ti4ltI99zjoBmIkyIIZ1P1Yi15la5/3d7IX5pPLPavkYi29QkxxFN1o
	Irsv8r/iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRjS-0005LH-RQ; Thu, 23 Jul 2020 03:17:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRif-0004yz-Ku; Thu, 23 Jul 2020 03:16:32 +0000
X-UUID: c856ecae188f4515ba7c761453cf3ca2-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6YeQsKZFLpRIg37VRCeJrmPmN5uETM4lokDx2hE/OLg=; 
 b=p6B1oltj3nkPG/wtgi91ittyLzqC/qSnKcKOWqL85KN6kkLMqEvluQU9KW9+x2U12CLk4LpDjQojjb1mEA6f1q+W5sOMs1ql2vfV04olzXul+NOpZUu6vm/xXQPVVKmRLi2290SxjWgVTQ8GWPK+MJk2x7Mdf4m51peOfgubqMI=;
X-UUID: c856ecae188f4515ba7c761453cf3ca2-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 367078087; Wed, 22 Jul 2020 19:16:26 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:06:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:34 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:30 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v10 20/28] media: platform: Change the colorspace of jpeg to
 the fixed value
Date: Thu, 23 Jul 2020 11:04:43 +0800
Message-ID: <20200723030451.5616-21-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_231630_946581_B517AB84 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Jpeg doesn't support colorspace conversion, so it shouldn't accept any
other colorspace in S_FMT.
Change the colorspace of jpeg to the fixed value.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v10: new add patch
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 01f4656fe2b3..0376bd3bdbbb 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -320,10 +320,10 @@ static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
 					   pix_mp->pixelformat, fmt_type);
 	q_data->pix_mp.width = pix_mp->width;
 	q_data->pix_mp.height = pix_mp->height;
-	q_data->pix_mp.colorspace = pix_mp->colorspace;
-	q_data->pix_mp.ycbcr_enc = pix_mp->ycbcr_enc;
-	q_data->pix_mp.xfer_func = pix_mp->xfer_func;
-	q_data->pix_mp.quantization = pix_mp->quantization;
+	q_data->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
+	q_data->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	q_data->pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
+	q_data->pix_mp.quantization = V4L2_QUANTIZATION_FULL_RANGE;
 
 	v4l2_dbg(1, debug, &jpeg->v4l2_dev, "(%d) s_fmt:%c%c%c%c wxh:%ux%u\n",
 		 f->type,
@@ -846,10 +846,10 @@ static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 	struct mtk_jpeg_q_data *q = &ctx->out_q;
 	int i;
 
-	q->pix_mp.colorspace = V4L2_COLORSPACE_JPEG,
-	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	q->pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
-	q->pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	q->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
+	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	q->pix_mp.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	q->pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
 
 	q->fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
 				      V4L2_PIX_FMT_JPEG,
@@ -863,10 +863,10 @@ static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 	q->fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
 				      V4L2_PIX_FMT_YUV420M,
 				      MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
-	q->pix_mp.colorspace = V4L2_COLORSPACE_JPEG,
-	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	q->pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
-	q->pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	q->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
+	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	q->pix_mp.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	q->pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
 	q->pix_mp.width = MTK_JPEG_MIN_WIDTH;
 	q->pix_mp.height = MTK_JPEG_MIN_HEIGHT;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
