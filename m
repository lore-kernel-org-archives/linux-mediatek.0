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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1602C433E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:17:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DE5F20723
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:17:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="onB4Ga74";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Jl2ExJrc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DE5F20723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mrXbawbj1WPszNwQQaIhwq8YMLuAAEx3VP+alBb3MIs=; b=onB4Ga74acOpmrvWTx0uzUNCi
	1EzDzXmf2bW+lgXXIp+vOCgI1uMq0ysTwwAT4mmFFb6EnPmlo7D6gvPod+EPyV/76S60TBGzdt3Vq
	5SMFT+JmwE42FkWW7JFB1UHP7PbqNJO7tgw6VibOBP33yQAhh2rW6p9zsSu3Ox4Buu+81l6vX/f0f
	VGKn+zK/pvUSKszbpLXzYhFkwACjZJdpJES4NBeuB331LhGJoF6UR+jCADnyCByWgSe6hPFQ8IknN
	1QIJ/HTkQN/doJGI82ZFVRJi/HMbCVRlVkF938eNVuF8XpHKKthimbpuLV6PzJ0H7vZkYvpDWkJ9h
	/yzci7P6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRj6-0005Ao-Pk; Thu, 23 Jul 2020 03:16:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRiX-0004to-7F; Thu, 23 Jul 2020 03:16:22 +0000
X-UUID: 3605d97e1e9c485a8e3d09d207f4473b-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=m+PYwDq9m4ydkI5HQVsA3oE1KhP89Uo0ZwOHHo0fFLQ=; 
 b=Jl2ExJrcWRF8x9kzZZhTi5I/mlurEXfKk+C8edPQWW0FcLTkN+aXlWzihlyT4witU8YeXlHUEnWQmToPM1+83wpJMqJ3oPYgJL5L9nzDfqYIGVFlID415uvKANMISJiDyy0103+EQ2FwHievo26fh69UUI44mS4R3K8hqYq9scg=;
X-UUID: 3605d97e1e9c485a8e3d09d207f4473b-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1268784613; Wed, 22 Jul 2020 19:16:13 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:06:22 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:21 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:16 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v10 10/28] media: platform: Delete zeroing the reserved fields
Date: Thu, 23 Jul 2020 11:04:33 +0800
Message-ID: <20200723030451.5616-11-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_231621_407597_BDE55E0F 
X-CRM114-Status: GOOD (  10.04  )
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

Delete zeroing the reserved fields because that the core already
does it.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v10: no changes
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index ffb486e537b6..0153d57af466 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -198,7 +198,6 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	int i;
 
-	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
 	pix_mp->field = V4L2_FIELD_NONE;
 
 	if (ctx->state != MTK_JPEG_INIT) {
@@ -217,7 +216,6 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 					   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
 					   MTK_JPEG_MAX_HEIGHT, 0);
 
-		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
 		pfmt->bytesperline = 0;
 		/* Source size must be aligned to 128 */
 		pfmt->sizeimage = mtk_jpeg_align(pfmt->sizeimage, 128);
@@ -237,7 +235,6 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 		u32 stride = pix_mp->width * fmt->h_sample[i] / 4;
 		u32 h = pix_mp->height * fmt->v_sample[i] / 4;
 
-		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
 		pfmt->bytesperline = stride;
 		pfmt->sizeimage = stride * h;
 	}
@@ -270,7 +267,6 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 
 	q_data = mtk_jpeg_get_q_data(ctx, f->type);
 
-	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
 	pix_mp->width = q_data->w;
 	pix_mp->height = q_data->h;
 	pix_mp->field = V4L2_FIELD_NONE;
@@ -294,7 +290,6 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 
 		pfmt->bytesperline = q_data->bytesperline[i];
 		pfmt->sizeimage = q_data->sizeimage[i];
-		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
 
 		v4l2_dbg(1, debug, &jpeg->v4l2_dev,
 			 "plane[%d] bpl=%u, size=%u\n",
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
