From: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH v2] media: mtk-vcodec: remove unneeded proxy functions
Date: Fri, 14 Jun 2019 19:18:09 +0900
Message-ID: <CAPBb6MVRA_tBwg_r-Z8Rx7pUkR8W47CN1dqWH5uk+_1ONhViog@mail.gmail.com>
References: <20190614075640.106709-1-acourbot@chromium.org> <9fd990d12ea1488592c5a590046f001a187b9c3f.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9fd990d12ea1488592c5a590046f001a187b9c3f.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Jun 14, 2019 at 6:11 PM Joe Perches <joe@perches.com> wrote:
>
> On Fri, 2019-06-14 at 16:56 +0900, Alexandre Courbot wrote:
> > We were getting the codec interface through a proxy function that does
> > not bring anything compared to just accessing the interface definition
> > directly, so just do that. Also make the decoder interfaces const.
> []
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> []
> > @@ -485,16 +485,9 @@ static int vdec_h264_get_param(void *h_vdec, enum vdec_get_param_type type,
> >       return 0;
> >  }
> >
> > -static struct vdec_common_if vdec_h264_if = {
> > +const struct vdec_common_if vdec_h264_if = {
>
> probably better to fixup whatever chains prevent
> this (if any) from being static const

These are defined in per-codec source files and selected at runtime by
vdec_drv_if.c, so I don't think we can avoid declaring at least
something? The previous approach was to declare a function, but as you
can see we can remove quite some code by exporting the structs
directly.
