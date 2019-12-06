Return-Path: <SRS0=uEYr=Z4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C584FC43603
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2019 08:07:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A93C2466E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2019 08:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H+qchgks";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JjUwosIi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A93C2466E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgwlcOCjTXPpJYXcEvPWZy2Rm82yU8sTvHyDWN5Q1EI=; b=H+qchgkslASrQI
	I6kTdjK+Sbcbmsg3T4bna+g7bLfB8ibXFQe3MszqJuvfr91y2oucf2K539Hs35xLJMA51bC88nFw6
	iVMberFy0g7l+i8f+MGj9tgnB3SEf+X3QuQLg0REMzCUmT/C35a8MetAj3rnX0Y99pIY5PyLlessU
	w+wWL+bWmArk5+4zfNPuUonp22UJKdzjqSJlWlZnRGk3NBUJbVDBwyb8DECXwEfYvknqHLm5HVTPi
	rb2OMy/lBuTr0+sqEPfaESHe9h7GPln13YnMgVgTBfP2eiVuwYss2TsHThgB60p8P4doWRMe5SHQw
	oUeVBYkQBrufqHICA2tA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1id8dh-0005FH-4b; Fri, 06 Dec 2019 08:07:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id8dZ-00057I-7M; Fri, 06 Dec 2019 08:06:54 +0000
X-UUID: ba47a2fd43c24fab8f74f5f9062a2fa4-20191206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lVZrCUbqLoiMSbjwNFA0HHxnz+mVQqg4nD2qHvV3jxo=; 
 b=JjUwosIigrqrNMSo7X6lD2hG7u//9qAdGptzrFB1HR5x5i/8Vrtn4N2MtvfZqos0DbRR+sbMH/orYW7Y8JlRJP7yO/eWSJclBQQZJUB0L7t2qvtnMksOR808INHTsraWKnMNMH4j6dUPVqpI5qX5Ry9ZruwNSnz2jHFEaBqcIbE=;
X-UUID: ba47a2fd43c24fab8f74f5f9062a2fa4-20191206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 886913013; Fri, 06 Dec 2019 00:06:49 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 00:07:41 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 16:06:33 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Dec 2019 16:06:32 +0800
Message-ID: <1575619605.17879.3.camel@mhfsdcap03>
Subject: Re: [PATCH v4 5/5] media: platform: Add jpeg dec/enc feature
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date: Fri, 6 Dec 2019 16:06:45 +0800
In-Reply-To: <a2e66e05-3248-de84-85d5-b0c7e5a080f1@xs4all.nl>
References: <20191017084033.28299-1-xia.jiang@mediatek.com>
 <20191017084033.28299-6-xia.jiang@mediatek.com>
 <a2e66e05-3248-de84-85d5-b0c7e5a080f1@xs4all.nl>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191206_000653_273470_1224012B 
X-CRM114-Status: GOOD (  23.51  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Rick Chang <Rick.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2019-10-21 at 17:23 +0800, Hans Verkuil wrote:
> Hi Xia,
> 
> Some comments about the selection code:
> 
> On 10/17/19 10:40 AM, Xia Jiang wrote:
> > Add mtk jpeg encode v4l2 driver based on jpeg decode, because that jpeg
> > decode and encode have great similarities with function operation.
> > 
> > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > ---
> > v4: split mtk_jpeg_try_fmt_mplane() to two functions, one for encoder,
> >     one for decoder.
> >     split mtk_jpeg_set_default_params() to two functions, one for
> >     encoder, one for decoder.
> >     add cropping support for encoder in g/s_selection ioctls.
> >     change exif mode support by using V4L2_JPEG_ACTIVE_MARKER_APP1.
> >     change MTK_JPEG_MAX_WIDTH/MTK_JPEG_MAX_HEIGH from 8192 to 65535 by
> >     specification.
> >     move width shifting operation behind aligning operation in
> >     mtk_jpeg_try_enc_fmt_mplane() for bug fix.
> >     fix user abuseing data_offset issue for DMABUF in
> >     mtk_jpeg_set_enc_src().
> >     fix kbuild warings: change MTK_JPEG_MIN_HEIGHT/MTK_JPEG_MAX_HEIGHT
> >                         and MTK_JPEG_MIN_WIDTH/MTK_JPEG_MAX_WIDTH from
> >                         'int' type to 'unsigned int' type.
> >                         fix msleadingly indented of 'else'.
> > 
> > v3: delete Change-Id.
> >     only test once handler->error after the last v4l2_ctrl_new_std().
> >     seperate changes of v4l2-ctrls.c and v4l2-controls.h to new patch.
> > 
> > v2: fix compliance test fail, check created buffer size in driver.
> > ---
> >  drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
> >  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 731 +++++++++++++++---
> >  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   | 123 ++-
> >  .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |   7 +-
> >  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 175 +++++
> >  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  60 ++
> >  .../platform/mtk-jpeg/mtk_jpeg_enc_reg.h      |  49 ++
> >  7 files changed, 1004 insertions(+), 146 deletions(-)
> >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
> >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h
> > 
> 
> <snip>
> 
> > @@ -455,11 +679,19 @@ static int mtk_jpeg_g_selection(struct file *file, void *priv,
> >  				struct v4l2_selection *s)
> >  {
> >  	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
> > +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> >  
> > -	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > +	if (jpeg->mode == MTK_JPEG_ENC && s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > +		return -EINVAL;
> > +
> > +	if (jpeg->mode == MTK_JPEG_DEC &&
> > +	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> >  		return -EINVAL;
> >  
> >  	switch (s->target) {
> > +	case V4L2_SEL_TGT_CROP:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> 
> This is wrong...
> 
> >  	case V4L2_SEL_TGT_COMPOSE:
> >  	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> >  		s->r.width = ctx->out_q.w;
> > @@ -484,11 +716,17 @@ static int mtk_jpeg_s_selection(struct file *file, void *priv,
> >  				struct v4l2_selection *s)
> >  {
> >  	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
> > +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> >  
> > -	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > +	if (jpeg->mode == MTK_JPEG_ENC && s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > +		return -EINVAL;
> > +
> > +	if (jpeg->mode == MTK_JPEG_DEC &&
> > +	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> >  		return -EINVAL;
> >  
> >  	switch (s->target) {
> > +	case V4L2_SEL_TGT_CROP:
> 
> ...and so is this.
> 
> The decoder only supports COMPOSE, the encoder only supports CROP.
> 
> This signals support for both cropping and composition for both encoder and
> decoder, and that's wrong. You can see this in the compliance output as well:
> it says that both cropping and composition are 'OK', meaning that both features
> are implemented.
> 
> It also claims that the decoder supports scaling. Is that correct? Is there a
> scaler in the JPEG decoder? Usually codecs do not have a scaler.
> 
> Regards,
> 
> 	Hans
Dear Hans,
Crop only for encoder and compose only for decoder in the latest vesion.

Best Regards,
Xia Jiang
> 
> >  	case V4L2_SEL_TGT_COMPOSE:
> >  		s->r.left = 0;
> >  		s->r.top = 0;
> > @@ -658,10 +896,92 @@ static void mtk_jpeg_set_queue_data(struct mtk_jpeg_ctx *ctx,
> >  		 param->dec_w, param->dec_h);
> >  }
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
