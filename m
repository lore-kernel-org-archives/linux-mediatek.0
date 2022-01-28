Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 03:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MzTJVJ9EugrDUOAWGAcKdHSBa+UtfeB03Rp073seOX8=; b=Xp3XyiRnhcmErt
	9gFHB2sXn0JFvizAHmwPeadvfzEpGWwEwe/CTJ/hq3kgvwFekuFGewkWJoRbFyBvw1JtWBOgDhwu1
	1Do817dqTa/GI3caB2w+UqAmJiLZQZ7Q0nFslpLDLT14ubdWsDkVf397JeF8suGnZAcLKmlWzIbDL
	g19ml6HiOMvp8KPgg+qWLg8cBEL+UhWC2mDmPPdTE2nM34A3XcgmlAQaZ8dqye19EZ/FWA/t1Xh3i
	HZIxV61TljOBMsQ/2xsKyajKa/1sLBcJ0Leq3HPXvoYv7ebL42FtmiQ0dqvSW6jPu9gxv+wT7aZrx
	oXQCzXrXZOi+HMmbxdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDI7V-000DHI-A0; Fri, 28 Jan 2022 03:40:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDI7I-000DFf-Vm; Fri, 28 Jan 2022 03:40:06 +0000
X-UUID: 11f8bf526be34395a1d6202539e878dd-20220127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2NuN+TKv19hNfqp/PCN6p9uPXLZd6ziay2h5iZe4sQE=; 
 b=GuonCBnVIKew0WshEEVZZjJnxg5D/kS2jMScLWH55vb+yrUpOzAhlyHo0v4Ns9pWiA3GbJyKoEG/3yzkYPfL2BVRQa6vaHYgfy8PDnIiooy71ZpTtrQni3ax9DMeSL/O29qmo37lhedTtEckleaIT1mfBGdTSBiNIkcs0kwHtBk=;
X-UUID: 11f8bf526be34395a1d6202539e878dd-20220127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1248811506; Thu, 27 Jan 2022 20:40:00 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 19:29:58 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 28 Jan 2022 11:29:49 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 11:29:48 +0800
Message-ID: <f1a722ca06545c8fcb23707356b889e7c963ea7a.camel@mediatek.com>
Subject: Re: [PATCH v1, 7/8] media: uapi: Init VP9 stateless decode params
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 28 Jan 2022 11:29:48 +0800
In-Reply-To: <07468ddd-22a8-c2a5-21fd-8468e0e77d74@collabora.com>
References: <20220127025544.10854-1-yunfei.dong@mediatek.com>
 <20220127025544.10854-8-yunfei.dong@mediatek.com>
 <07468ddd-22a8-c2a5-21fd-8468e0e77d74@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_194005_058203_EE379459 
X-CRM114-Status: GOOD (  19.82  )
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

Hi AngeloGioacchino,

Thanks for your suggestion,

Separate this patch with mt8195 support, and sent it again.
On Thu, 2022-01-27 at 11:35 +0100, AngeloGioacchino Del Regno wrote:
> Il 27/01/22 03:55, Yunfei Dong ha scritto:
> > Init some of VP9 frame decode params to default value.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Hello Yunfei,
> 
> This patch is not strictly related to MediaTek SoCs, since it's
> modfying v4l2-core.
> Can you please send this patch separately?
> 
> Thanks,
> Angelo
> 
Best Regards,
Yunfei Dong
> > ---
> >   drivers/media/v4l2-core/v4l2-ctrls-core.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index 54abe5245dcc..b25c77b8a445 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -112,6 +112,7 @@ static void std_init_compound(const struct
> > v4l2_ctrl *ctrl, u32 idx,
> >   	struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
> >   	struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quant;
> >   	struct v4l2_ctrl_vp8_frame *p_vp8_frame;
> > +	struct v4l2_ctrl_vp9_frame *p_vp9_frame;
> >   	struct v4l2_ctrl_fwht_params *p_fwht_params;
> >   	void *p = ptr.p + idx * ctrl->elem_size;
> >   
> > @@ -152,6 +153,13 @@ static void std_init_compound(const struct
> > v4l2_ctrl *ctrl, u32 idx,
> >   		p_vp8_frame = p;
> >   		p_vp8_frame->num_dct_parts = 1;
> >   		break;
> > +	case V4L2_CTRL_TYPE_VP9_FRAME:
> > +		p_vp9_frame = p;
> > +		p_vp9_frame->profile = 0;
> > +		p_vp9_frame->bit_depth = 8;
> > +		p_vp9_frame->flags |= V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING
> > |
> > +			V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING;
> > +		break;
> >   	case V4L2_CTRL_TYPE_FWHT_PARAMS:
> >   		p_fwht_params = p;
> >   		p_fwht_params->version = V4L2_FWHT_VERSION;
> > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
