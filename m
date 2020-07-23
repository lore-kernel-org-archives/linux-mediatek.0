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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315BAC433EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:17:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F289B207E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:17:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0fLMWNl5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qmWWplJ5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F289B207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ketOp0TR+fhMKi0HvL/r7JmF8WlJSmtZNzRxEF+gG9c=; b=0fLMWNl5WkNEAS1nmO4U+cbDB
	iVKVmAzY818cBjC7GfdI0V8U9OQroD3yj5nwfLdWgcFzCm3sICxwxESa9Z+Y6n87DGGJ5qcRTnFeL
	URvzvtEnkP5jNWXVKg4Tl7pMGjMGB0Y+RQiKYWT8ZF663NeYey3gzA4ERxcRFXRnq//o5mpW7Bnby
	93Bri2ozjcIXoORTdJQ2/6qPFkgvyiwAL9X6Qed6ViifVFX73632HAPgwZuBpSDbw9eRNgwr0HBOg
	NiRya6oUQ18F13yw6jzje33i8wEdvyVTfeNvY7EW8rnZ9A1NNUTbAT1QYWDMPENUIqzzPBgnTvTX1
	lFF+H9Jlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRjc-0005Qc-Hm; Thu, 23 Jul 2020 03:17:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRih-0004yb-6e; Thu, 23 Jul 2020 03:16:32 +0000
X-UUID: 41da4dae9af24638a9f5331b17ac1492-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WkWvv0PERXwP1DwpPxOh+O/ojvXuJoDymeGP7aazNEE=; 
 b=qmWWplJ5dTsIVuGI3RElNXbFK0zxNyac+otP/qDnrVYiWBGlicqgvtCOPyf8+nJT+bJ0+uNmIrCg9b0ddSpzI6xssrPPgIYo5ZdIf60k25KtVXYkWQ/8RiaEvj+OxbKWJRtrAkWHq0yak3jIfsz+MUsy8BasXE4s6B/BQM35xN8=;
X-UUID: 41da4dae9af24638a9f5331b17ac1492-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 864380459; Wed, 22 Jul 2020 19:16:27 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:06:29 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:27 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:23 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v10 15/28] media: platform: Delete vidioc_s_selection ioctl of
 jpeg dec
Date: Thu, 23 Jul 2020 11:04:38 +0800
Message-ID: <20200723030451.5616-16-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_231631_551646_B87969D1 
X-CRM114-Status: UNSURE (   9.43  )
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

JPEG dec does't support setting a compose rectangle, so remove
mtk_jpeg_dec_s_selection().

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v10: new add patch
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 22 -------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index db3a8b22dccd..9d1935d0782b 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -439,27 +439,6 @@ static int mtk_jpeg_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int mtk_jpeg_s_selection(struct file *file, void *priv,
-				struct v4l2_selection *s)
-{
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
-
-	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return -EINVAL;
-
-	switch (s->target) {
-	case V4L2_SEL_TGT_COMPOSE:
-		s->r.left = 0;
-		s->r.top = 0;
-		s->r.width = ctx->out_q.w;
-		s->r.height = ctx->out_q.h;
-		break;
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
 static const struct v4l2_ioctl_ops mtk_jpeg_ioctl_ops = {
 	.vidioc_querycap                = mtk_jpeg_querycap,
 	.vidioc_enum_fmt_vid_cap	= mtk_jpeg_enum_fmt_vid_cap,
@@ -473,7 +452,6 @@ static const struct v4l2_ioctl_ops mtk_jpeg_ioctl_ops = {
 	.vidioc_qbuf                    = v4l2_m2m_ioctl_qbuf,
 	.vidioc_subscribe_event         = mtk_jpeg_subscribe_event,
 	.vidioc_g_selection		= mtk_jpeg_g_selection,
-	.vidioc_s_selection		= mtk_jpeg_s_selection,
 
 	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
 	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
