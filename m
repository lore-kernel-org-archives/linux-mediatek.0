Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AB6C433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:23:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2F5C20639
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:23:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipZ7xgUv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b0DJoj0Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2F5C20639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=noKZm1hiAaCFb9z5JoJzscZALAbgQEOGPo0qe4/XJog=; b=ipZ7xgUv8F3QNFCHUXu/yeRaR
	BDz6T3Ey3WaAAIQAt+1l8eLbuTdDLnaXgtmfR5H8MJlHPXk7HJsIlZNfyYE9x1CbtZ0AvRSRm/2qB
	1om4rpTdNB6c9oskDzHrEEMSB2li+yCQfk+qNA7lAmtFdHC6dly9Gj6dLTtiLi3FIdJhmyLApjlMh
	cXMm1xoLe1I+0vvN3sI08mK9/nuVgQpreUJLtsAZw2ed7pNCX4IlZ7UmDd0dEStRDPEOp8TBEZp75
	V+35psvmDmPKc4P4Ezp2xoOxdlTvKZ69t9drXyZv4JZ0ixxNUzuJIVNjt/eO+tOiJW9Zplh++YBfS
	93QVISQTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6U43-0003dZ-Iy; Fri, 14 Aug 2020 07:23:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6U3a-0003N2-7R; Fri, 14 Aug 2020 07:23:19 +0000
X-UUID: cd902e4f5aaa4531aab42bd36ccf3d05-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=L1y9pPxdA0pzcOflsm1/2eGbT5uGkzxv9JWPGmzEw9Q=; 
 b=b0DJoj0YqADKBaXpxk+vmcVrEluKyj3Cdj3OI4B09zTfR2N+C04BPqu4n470ubi0Xr6TVeVgTx/F1RtaSIHcxHlEwfaa6+o7TDGWkw1fwvEGEsvgTlYvp3V9FAARengNWXZEeEreKoJGPhVNTEveuS8A7mpTgOc8rL73fpsJyRg=;
X-UUID: cd902e4f5aaa4531aab42bd36ccf3d05-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 285386415; Thu, 13 Aug 2020 23:23:11 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 00:13:26 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:21 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v12 16/29] media: platform: Delete vidioc_s_selection ioctl of
 jpeg dec
Date: Fri, 14 Aug 2020 15:11:49 +0800
Message-ID: <20200814071202.25067-18-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200814071202.25067-1-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_032318_488741_D1F41A86 
X-CRM114-Status: GOOD (  11.93  )
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

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v12: no changes
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
