Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EB0C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 06:48:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F063B20675
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 06:48:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lTEV2l/o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gZRCHLKs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F063B20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DnwNTgLlSdXmUSS6HJTlQ9zfsAd06VeVgFexYvvydEs=; b=lTEV2l/o/OhrZ0jLNuAFj1QL2
	iFVjVOxxIm09+zORs+CW9X1iC/Iycxk0qt+fkw0hVyFovlpyBgMvxdTPjg9/hs0omjPJ7ByLhYdnC
	z88SsTdIZTLvt0JDKSTHD1J/uWhV6sqx2H6wXT9D8p+pOe/yzTMBdoFded2yiW1S72F1skujkShN5
	sQC0PfSKh9ZM+z7LLU9k4e2NU0qDDn6B8+fINW/m/96Zt1kOlDFfMkEt5lsBM0xEJAo9ECTyqz07C
	4fAo8ucYVhbGwwcxKqzqXLZYTPh7gdaDN5dE3VbdkDislk8qhwMFOmSuw4/dhYeVDgnsIiIJwNm3A
	U/edhtZdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jshOS-0006zp-Na; Tue, 07 Jul 2020 06:47:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jshOP-0006xF-LX; Tue, 07 Jul 2020 06:47:51 +0000
X-UUID: 149200ebad2c481998b3d997417518be-20200706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SwVdQetwEhqb0jYOIh2hMXjXY9PYdr+q2F3iUq6pY0Y=; 
 b=gZRCHLKsGR7BbbuihTjkM/CXzCsnO13i+cxGwf983bhMQ3LP78fZFooju0jiZylqQqJoQ8diqinY83IqvlmoU4V80AeT6HR02m3YdydDIE9XDRXkWbg4Vgq1MCvL4SBo7b0/eDZatmLzILSYdIcn5VF/7aFUnLoJFTcKGXXpxew=;
X-UUID: 149200ebad2c481998b3d997417518be-20200706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 914610010; Mon, 06 Jul 2020 22:47:42 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 23:47:31 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 7 Jul 2020 14:45:48 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jul 2020 14:45:46 +0800
Message-ID: <1594104314.4473.24.camel@mhfsdcap03>
Subject: Re: [PATCH RESEND v9 18/18] media: platform: Add jpeg enc feature
From: Xia Jiang <xia.jiang@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 7 Jul 2020 14:45:14 +0800
In-Reply-To: <20200630165301.GA1212092@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-20-xia.jiang@mediatek.com>
 <20200611184640.GC8694@chromium.org> <1593485781.20112.43.camel@mhfsdcap03>
 <20200630165301.GA1212092@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2B1FBE70E9DA5E005A338DB4FF66BB7BFC3DA49459575A0E1C46614499A82EAE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_024749_922905_E1857DE3 
X-CRM114-Status: GOOD (  35.40  )
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

On Tue, 2020-06-30 at 16:53 +0000, Tomasz Figa wrote:
> Hi Xia,
> 
> On Tue, Jun 30, 2020 at 10:56:21AM +0800, Xia Jiang wrote:
> > On Thu, 2020-06-11 at 18:46 +0000, Tomasz Figa wrote:
> > > Hi Xia,
> > > 
> > > On Thu, Jun 04, 2020 at 05:05:53PM +0800, Xia Jiang wrote:
> [snip]
> > > > +static void mtk_jpeg_enc_device_run(void *priv)
> > > > +{
> > > > +	struct mtk_jpeg_ctx *ctx = priv;
> > > > +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> > > > +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > > > +	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> > > > +	unsigned long flags;
> > > > +	struct mtk_jpeg_src_buf *jpeg_src_buf;
> > > > +	struct mtk_jpeg_enc_bs enc_bs;
> > > > +	int ret;
> > > > +
> > > > +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > > > +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > > > +	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> > > > +
> > > > +	ret = pm_runtime_get_sync(jpeg->dev);
> > > > +	if (ret < 0)
> > > > +		goto enc_end;
> > > > +
> > > > +	spin_lock_irqsave(&jpeg->hw_lock, flags);
> > > > +
> > > > +	/*
> > > > +	 * Resetting the hardware every frame is to ensure that all the
> > > > +	 * registers are cleared. This is a hardware requirement.
> > > > +	 */
> > > > +	mtk_jpeg_enc_reset(jpeg->reg_base);
> > > > +
> > > > +	mtk_jpeg_set_enc_dst(ctx, jpeg->reg_base, &dst_buf->vb2_buf, &enc_bs);
> > > > +	mtk_jpeg_set_enc_src(ctx, jpeg->reg_base, &src_buf->vb2_buf);
> > > > +	mtk_jpeg_enc_set_config(jpeg->reg_base, ctx->out_q.fmt->hw_format,
> > > > +				ctx->enable_exif, ctx->enc_quality,
> > > > +				ctx->restart_interval);
> > > > +	mtk_jpeg_enc_start(jpeg->reg_base);
> > > 
> > > Could we just move the above 5 functions into one function inside
> > > mtk_jpeg_enc_hw.c that takes mtk_jpeg_dev pointer as its argument, let's
> > > say mtk_jpeg_enc_hw_run() and simply program all the data to the registers
> > > directly, without the extra level of abstractions?
> > I can move the 5 functions into one function(mtk_jpeg_enc_hw_run()), but
> > this function will be very long, because it contains computation code
> > such as setting dst addr, blk_num, quality.
> > In v4, you have adviced the following architecture:
> > How about the following model, as used by many other drivers:
> > 
> > mtk_jpeg_enc_set_src()
> > {
> >         // Set any registers related to source format and buffer
> > }
> > 
> > mtk_jpeg_enc_set_dst()
> > {
> >         // Set any registers related to destination format and buffer
> > }
> > 
> > mtk_jpeg_enc_set_params()
> > {
> >         // Set any registers related to additional encoding parameters
> > }
> > 
> > mtk_jpeg_enc_device_run(enc, ctx)
> > {
> >         mtk_jpeg_enc_set_src(enc, src_buf, src_fmt);
> >         mtk_jpeg_enc_set_dst(enc, dst_buf, dst_fmt);
> >         mtk_jpeg_enc_set_params(enc, ctx);
> >         // Trigger the hardware run
> > }
> > I think that this architecture is more clear(mtk_jpeg_enc_set_config is
> > equivalent to mtk_jpeg_enc_set_params).
> > Should I keep the original architecture or move 5 functions into
> > mtk_jpeg_enc_hw_run?
> 
> Sounds good to me.
> 
> My biggest issue with the code that it ends up introducing one more
> level of abstraction, but with the approach you suggested, the arguments
> just accept standard structs, which avoids that problem.
> 
> [snip]
> > > > +
> > > > +	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
> > > > +	ctx->colorspace = V4L2_COLORSPACE_JPEG,
> > > > +	ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > > > +	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
> > > > +	ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> > > 
> > > Since we already have a v4l2_pix_format_mplane struct which has fields for
> > > the above 4 values, could we just store them there?
> > > 
> > > Also, I don't see this driver handling the colorspaces in any way, but it
> > > seems to allow changing them from the userspace. This is incorrect, because
> > > the userspace has no way to know that the colorspace is not handled.
> > > Instead, the try_fmt implementation should always override the
> > > userspace-provided colorspace configuration with the ones that the driver
> > > assumes.
> > > 
> > > > +	pix_mp->width = MTK_JPEG_MIN_WIDTH;
> > > > +	pix_mp->height = MTK_JPEG_MIN_HEIGHT;
> > > > +
> > > > +	q->fmt = mtk_jpeg_find_format(V4L2_PIX_FMT_YUYV,
> > > > +				      MTK_JPEG_FMT_FLAG_ENC_OUTPUT);
> > > > +	vidioc_try_fmt(container_of(pix_mp, struct v4l2_format,
> > > > +				    fmt.pix_mp), q->fmt);
> > > > +	q->w = pix_mp->width;
> > > > +	q->h = pix_mp->height;
> > > > +	q->crop_rect.width = pix_mp->width;
> > > > +	q->crop_rect.height = pix_mp->height;
> > > > +	q->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
> > > > +	q->bytesperline[0] = pix_mp->plane_fmt[0].bytesperline;
> > > 
> > > Actually, do we need this custom mtk_jpeg_q_data struct? Why couldn't we
> > > just keep the same values inside the standard v4l2_pix_format_mplane
> > > struct?
> > I think that we need mtk_jpeg_q_data struct.If we delete it, how can we
> > know these values(w, h, sizeimage, bytesperline, mtk_jpeg_fmt) belong to
> > output or capture(output and capture's sizeimages are different, width
> > and height are differnt too for jpeg dec )?We have
> > s_fmt_vid_out_mplane/cap_mplane function to set these values.
> > 
> > But we can use standard v4l2_pix_format_mplane struct replacing the w, h
> > bytesperline, sizeimage in mtk_jpeg_q_data struct like this:
> > struct mtk_jpeg_q_data{
> > 	struct mtk_jpeg_fmt *fmt;
> > 	struct v4l2_pix_format_mplane pix_mp;
> > 	struct v4l2_rect enc_crop_rect
> > }
> > Then delete ctx->colorspace ctx->ycbcr_enc ctx->quantization
> > ctx->xfer_func, becuase v4l2_pix_format_mplane in q_data has contained
> > them and assign them for out_q and cap_q separately.
> > 
> > WDYT?
> 
> Sounds good to me. I was considering just making it like
> 
> struct mtk_jpeg_ctx {
> 	struct mtk_jpeg_fmt *src_fmt;
> 	struct v4l2_pix_format_mplane src_pix_mp;
> 	struct v4l2_rect src_crop;
> 
> 	struct mtk_jpeg_fmt *dst_fmt;
> 	struct v4l2_pix_format_mplane dst_pix_mp;
> 	struct v4l2_rect dst_crop;
> };
> 
> but I like your suggestion as well, as long as custom data structures
> are not used to store standard information.

Dear Tomasz,

I used the structure like below:
 struct mtk_jpeg_q_data{
	struct mtk_jpeg_fmt *fmt;
	struct v4l2_pix_format_mplane pix_mp;
	struct v4l2_rect enc_crop_rect
}
Then delete ctx->colorspace ctx->ycbcr_enc ctx->quantization
ctx->xfer_func, becuase v4l2_pix_format_mplane in q_data has contained
them and assign them for out_q and cap_q separately.

Then the v4l2_compliance test will fail, the fail log as below:
Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
                fail: v4l2-test-formats.cpp(836):
fmt_cap.g_colorspace() != col
        test VIDIOC_S_FMT: FAIL
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

The source code of  v4l2-test-formats.cpp as below:

static int testM2MFormats(struct node *node)
{
	cv4l_fmt fmt_out;
	cv4l_fmt fmt;
	cv4l_fmt fmt_cap;
	__u32 cap_type = node->g_type();
	__u32 out_type = v4l_type_invert(cap_type);
	__u32 col, ycbcr_enc, quant, xfer_func;

	fail_on_test(node->g_fmt(fmt_out, out_type));
	node->g_fmt(fmt_cap, cap_type);
	fail_on_test(fmt_cap.g_colorspace() != fmt_out.g_colorspace());
	fail_on_test(fmt_cap.g_ycbcr_enc() != fmt_out.g_ycbcr_enc());
	fail_on_test(fmt_cap.g_quantization() != fmt_out.g_quantization());
	fail_on_test(fmt_cap.g_xfer_func() != fmt_out.g_xfer_func());
	col = fmt_out.g_colorspace() == V4L2_COLORSPACE_SMPTE170M ?
		V4L2_COLORSPACE_REC709 : V4L2_COLORSPACE_SMPTE170M;
	ycbcr_enc = fmt_out.g_ycbcr_enc() == V4L2_YCBCR_ENC_601 ?
		V4L2_YCBCR_ENC_709 : V4L2_YCBCR_ENC_601;
	quant = fmt_out.g_quantization() == V4L2_QUANTIZATION_LIM_RANGE ?
		V4L2_QUANTIZATION_FULL_RANGE : V4L2_QUANTIZATION_LIM_RANGE;
	xfer_func = fmt_out.g_xfer_func() == V4L2_XFER_FUNC_SRGB ?
		V4L2_XFER_FUNC_709 : V4L2_XFER_FUNC_SRGB;
	fmt_out.s_colorspace(col);
	fmt_out.s_xfer_func(xfer_func);
	fmt_out.s_ycbcr_enc(ycbcr_enc);
	fmt_out.s_quantization(quant);
	node->s_fmt(fmt_out);
	fail_on_test(fmt_out.g_colorspace() != col);
	fail_on_test(fmt_out.g_xfer_func() != xfer_func);
	fail_on_test(fmt_out.g_ycbcr_enc() != ycbcr_enc);
	fail_on_test(fmt_out.g_quantization() != quant);
	node->g_fmt(fmt_cap);
	fail_on_test(fmt_cap.g_colorspace() != col);  // line 836
	fail_on_test(fmt_cap.g_xfer_func() != xfer_func);
	fail_on_test(fmt_cap.g_ycbcr_enc() != ycbcr_enc);
	fail_on_test(fmt_cap.g_quantization() != quant);
}

It needs that cap's colorspace equals out's colorspace when userspace
just set out's colorspace and then get cap's colorspace. However, cap's
colorspace which getted from driver equals V4L2_COLORSPACE_JPEG, because
the code in g_fmt() like this:
pix_mp->colorspace = q_data->pix_mp.colorspace;
pix_mp->ycbcr_enc = q_data->pix_mp.ycbcr_enc;
pix_mp->xfer_func = q_data->pix_mp.xfer_func;
pix_mp->quantization = q_data->pix_mp.quantization;

How should I handle this case? Should I store them(colorspace,
sfer_func, ycbcr_enc, quatization) in ctx as the orinal desin? Then I
can get them from g_fmt() like this:
pix_mp->colorspace = ctx->colorspace;
pix_mp->ycbcr_enc = ctx->ycbcr_enc;
pix_mp->xfer_func = ctx->xfer_func;
pix_mp->quantization = ctx->quantization;

Best Regards,
Xia Jiang
> [snip]
> > > > @@ -1042,8 +1619,12 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
> > > >  		return jpeg_irq;
> > > >  	}
> > > >  
> > > > -	ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_dec_irq, 0,
> > > > -			       pdev->name, jpeg);
> > > > +	if (jpeg->variant->is_encoder)
> > > > +		ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_enc_irq,
> > > > +				       0, pdev->name, jpeg);
> > > > +	else
> > > > +		ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_dec_irq,
> > > > +				       0, pdev->name, jpeg);
> > > 
> > > Rather than having "is_encoder" in the variant struct, would it make more
> > > sense to have "irq_handler" instead? That would avoid the explicit if.
> > Do you mean to delete "is_encoder"? It is used 8 times in the
> > driver.Should I move them all to the match data?
> 
> Yes. It would make the code linear and the varability between the
> decoder and encoder would be self-contained in the variant struct.
> 
> Best regards,
> Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
