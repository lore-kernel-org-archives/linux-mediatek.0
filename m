Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95209C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:24:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DE4820639
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zKL5w2mx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VLKOZlko"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DE4820639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZWB747U4Ad/AZ42MqLYOfPG3Wudp0Z3eQQ+I25P1JFw=; b=zKL5w2mx/94Nt+AQt16a7aWLT
	fdvIXv2Yp3aLaPTZYjY7XgfmdzSP1C03lsPvH8/TYeXKO4SKo7CyR+wmRPi21D/R8gwtlbyMoMhcQ
	W7SyOIhvo/8V5iyqT6inQ7YLod1buXYkV6tAbvAWmFSV1zDMRJXTXhebfwWb3Jtu86ntlLrmGCiwQ
	Coe21dMcaxm34ETKKu9nwyR/AtJ6U/uzqt4S/aUdNEvIdVbiA0mOXfwA0JKX69Xl43FLdlhMNL9XU
	CVlarYqhK0TRPnUq3EiCIszqKgYm8kBpyUatDqvJF39DFpiZm81cgmVOP7nNXyfVAsQ6f5HIDOsNB
	oQbzD2wFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6U4h-0003vf-Ti; Fri, 14 Aug 2020 07:24:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6U3d-0003N2-Te; Fri, 14 Aug 2020 07:23:23 +0000
X-UUID: 2681a67ff5e744569853e4a449d19b11-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=r8y/DmKvGYhZYMlEl59+JiQuu6NOaZ4RGtFLiBKYh3k=; 
 b=VLKOZlkonFDlgCNgseKTXkFuku0ID1krTmNlUARCH1IzH0p/BXDGwROjgF8vlZs3nZAQnhX2yE1ksfkiaUaRK4kKUOXn8rPmc+fii7J1G+EZK6OJuTPE/mySdBloObQShVrZSuWwLJOy7s6IWyQFXTjcnHlDo+hv1lIHsUe+Zgc=;
X-UUID: 2681a67ff5e744569853e4a449d19b11-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1979590845; Thu, 13 Aug 2020 23:23:11 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 00:13:34 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:29 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:28 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v12 22/29] media: platform: Refactor
 mtk_jpeg_set_default_params()
Date: Fri, 14 Aug 2020 15:11:55 +0800
Message-ID: <20200814071202.25067-24-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200814071202.25067-1-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_032322_175983_02DDAC7D 
X-CRM114-Status: GOOD (  12.84  )
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

Call mtk_jpeg_try_fmt_mplane() to replace the original computation of
sizeimage and bytesperline, because that mtk_jpeg_try_fmt_mplane()
already did it.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v12: no changes
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 0376bd3bdbbb..7881e9c93df7 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -844,7 +844,6 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 {
 	struct mtk_jpeg_q_data *q = &ctx->out_q;
-	int i;
 
 	q->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
 	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
@@ -856,8 +855,7 @@ static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 				      MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
 	q->pix_mp.width = MTK_JPEG_MIN_WIDTH;
 	q->pix_mp.height = MTK_JPEG_MIN_HEIGHT;
-	q->pix_mp.plane_fmt[0].bytesperline = 0;
-	q->pix_mp.plane_fmt[0].sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
+	mtk_jpeg_try_fmt_mplane(&q->pix_mp, q->fmt);
 
 	q = &ctx->cap_q;
 	q->fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
@@ -870,13 +868,7 @@ static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 	q->pix_mp.width = MTK_JPEG_MIN_WIDTH;
 	q->pix_mp.height = MTK_JPEG_MIN_HEIGHT;
 
-	for (i = 0; i < q->fmt->colplanes; i++) {
-		u32 stride = q->pix_mp.width * q->fmt->h_sample[i] / 4;
-		u32 h = q->pix_mp.height * q->fmt->v_sample[i] / 4;
-
-		q->pix_mp.plane_fmt[i].bytesperline = stride;
-		q->pix_mp.plane_fmt[i].sizeimage = stride * h;
-	}
+	mtk_jpeg_try_fmt_mplane(&q->pix_mp, q->fmt);
 }
 
 static int mtk_jpeg_open(struct file *file)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
