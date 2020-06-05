Return-Path: <SRS0=fggR=7S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E3BC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 06:05:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6A2F207F7
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 06:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s2dfV+1P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZSzwOxeV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6A2F207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NXb0oUyyEZ0tPhBz/Lpdsb6P4WfnaRqY06lso/3n+I=; b=s2dfV+1POk9/4A
	8ITzaADwPlHggJypi7Uh7YP1IESTXaT0NqDMog0AwrzgFZVEESzf2VHR0fd1ci8ZoK3tIWkhhtmii
	fv3iRdSVH+g66dgmkB8GDV8+Yw1LzmbUPHFbWE8F0wgCArNVnLwHphj6Hohxt+iGfeNTkXUSfa4ly
	PtiynL6ERAAZUPpGdVeTtDWvXIHEqnAr/0pGzeey4EI0hlxefbOxM0uIuMQdL4fowTFFYHhws2J0T
	tRFEkHBfjX+jv7gPlrPldaY449FqkaE6o7GyCLfPCEs2U7Ycgm5jrZjpJDIKIzz4KHuY9+OpQecoW
	aCkzHX/xA9e3LH6oZczQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jh5Tr-0001rO-QR; Fri, 05 Jun 2020 06:05:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jh5Tm-0001p6-5R; Fri, 05 Jun 2020 06:05:24 +0000
X-UUID: 21f5842ebd5c446f93652317d12ae062-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NswnMBEYCB0ATqA+z8ftWgQH27FC9O8GRg7nuiNH9lw=; 
 b=ZSzwOxeVGLQC7llW/m8kKGil0p405CRXv6I+Jnt87x1FcQ82xIa3bertIlbSbQ5BIJoss4Po7WE3XpSo++lUYqXueEkRpyyPj5mSnuzz+UbQkNgFMc3UVx+dDqAtTcdD21pKtK9FPuhq9HAd9PqUYGOMcHHFrz66GGj7qBfLCMY=;
X-UUID: 21f5842ebd5c446f93652317d12ae062-20200604
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1440447240; Thu, 04 Jun 2020 22:05:09 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 23:05:10 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 5 Jun 2020 14:05:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 14:05:04 +0800
Message-ID: <1591336981.31802.3.camel@mhfsdcap03>
Subject: Re: [PATCH v8 05/14] media: platform: Improve power on and power
 off flow
From: Xia Jiang <xia.jiang@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 5 Jun 2020 14:03:01 +0800
In-Reply-To: <20200521152253.GE209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-6-xia.jiang@mediatek.com>
 <20200521152253.GE209565@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D4D85237458B3F37009A20C7C482D59AA2A1276C3CD07436513B69A34E50B8692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_230522_212360_CFDFDAA8 
X-CRM114-Status: GOOD (  18.63  )
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
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org, mojahsu@chromium.org,
 srv_heupstream@mediatek.com, Rick Chang <rick.chang@mediatek.com>,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 sj.huang@mediatek.com, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-05-21 at 15:22 +0000, Tomasz Figa wrote:
> Hi Xia,
> 
> On Fri, Apr 03, 2020 at 05:40:24PM +0800, Xia Jiang wrote:
> > Call pm_runtime_get_sync() before starting a frame and then
> > pm_runtime_put() after completing it. This can save power for the time
> > between processing two frames.
> > 
> > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > ---
> >  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 27 +++++--------------
> >  1 file changed, 6 insertions(+), 21 deletions(-)
> > 
> 
> Thank you for the patch. Please see my comments inline.
> 
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > index a536fa95b3d6..dd5cadd101ef 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > @@ -710,23 +710,6 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(struct mtk_jpeg_ctx *ctx,
> >  		return v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> >  }
> >  
> > -static int mtk_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
> > -{
> > -	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
> > -	struct vb2_v4l2_buffer *vb;
> > -	int ret = 0;
> > -
> > -	ret = pm_runtime_get_sync(ctx->jpeg->dev);
> > -	if (ret < 0)
> > -		goto err;
> > -
> > -	return 0;
> > -err:
> > -	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
> > -		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_QUEUED);
> > -	return ret;
> > -}
> > -
> >  static void mtk_jpeg_stop_streaming(struct vb2_queue *q)
> >  {
> >  	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
> > @@ -751,8 +734,6 @@ static void mtk_jpeg_stop_streaming(struct vb2_queue *q)
> >  
> >  	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
> >  		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> > -
> > -	pm_runtime_put_sync(ctx->jpeg->dev);
> >  }
> >  
> >  static const struct vb2_ops mtk_jpeg_qops = {
> > @@ -761,7 +742,6 @@ static const struct vb2_ops mtk_jpeg_qops = {
> >  	.buf_queue          = mtk_jpeg_buf_queue,
> >  	.wait_prepare       = vb2_ops_wait_prepare,
> >  	.wait_finish        = vb2_ops_wait_finish,
> > -	.start_streaming    = mtk_jpeg_start_streaming,
> >  	.stop_streaming     = mtk_jpeg_stop_streaming,
> >  };
> >  
> > @@ -812,7 +792,7 @@ static void mtk_jpeg_device_run(void *priv)
> >  	struct mtk_jpeg_src_buf *jpeg_src_buf;
> >  	struct mtk_jpeg_bs bs;
> >  	struct mtk_jpeg_fb fb;
> > -	int i;
> > +	int i, ret;
> >  
> >  	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> >  	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > @@ -832,6 +812,10 @@ static void mtk_jpeg_device_run(void *priv)
> >  		return;
> >  	}
> >  
> > +	ret = pm_runtime_get_sync(jpeg->dev);
> > +	if (ret < 0)
> > +		goto dec_end;
> > +
> >  	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
> >  	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
> >  		goto dec_end;
> > @@ -957,6 +941,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
> >  	v4l2_m2m_buf_done(src_buf, buf_state);
> >  	v4l2_m2m_buf_done(dst_buf, buf_state);
> >  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> > +	pm_runtime_put_sync(ctx->jpeg->dev);
> 
> The _sync variant explicitly waits until the asynchronous PM operation
> completes. This is usually undesired, because the CPU stays blocked for
> no good reason. In this context it is actually a bug, because this is an
> interrupt handler and it's not allowed to sleep. I wonder why this
> actually didn't crash in your testing. Please change to the regular
> pm_runtime_put().
Done.
> 
> Best regards,
> Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
