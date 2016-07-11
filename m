From: tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] vcodec: mediatek: Add g/s_selection support for V4L2
 Encoder
Date: Mon, 11 Jul 2016 16:09:51 +0800
Message-ID: <1468224591.2462.6.camel@mtksdaap41>
References: <1464594768-1993-1-git-send-email-tiffany.lin@mediatek.com>
 <4ca82842-968d-a5e2-587d-752c71713607@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <4ca82842-968d-a5e2-587d-752c71713607-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Hans,

On Mon, 2016-07-11 at 06:32 +0200, Hans Verkuil wrote:
> Hi Tiffany,
> 
> My apologies for the delay, but here is my review at last:
> 
> On 05/30/2016 09:52 AM, Tiffany Lin wrote:
> > This patch add g/s_selection support for MT8173
> > 
> > Signed-off-by: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |   74 ++++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > index 6e72d73..23ef9a1 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > @@ -630,6 +630,77 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
> >  	return vidioc_try_fmt(f, fmt);
> >  }
> >  
> > +static int vidioc_venc_g_selection(struct file *file, void *priv,
> > +				     struct v4l2_selection *s)
> > +{
> > +	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> > +	struct mtk_q_data *q_data;
> > +
> > +	/* crop means compose for output devices */
> > +	switch (s->target) {
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +	case V4L2_SEL_TGT_CROP:
> > +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> > +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> > +	case V4L2_SEL_TGT_COMPOSE:
> > +		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> > +			mtk_v4l2_err("Invalid s->type = %d", s->type);
> > +			return -EINVAL;
> > +		}
> > +		break;
> > +	default:
> > +		mtk_v4l2_err("Invalid s->target = %d", s->target);
> > +		return -EINVAL;
> > +	}
> > +
> > +	q_data = mtk_venc_get_q_data(ctx, s->type);
> > +	if (!q_data)
> > +		return -EINVAL;
> > +
> > +	s->r.top = 0;
> > +	s->r.left = 0;
> > +	s->r.width = q_data->visible_width;
> > +	s->r.height = q_data->visible_height;
> > +
> > +	return 0;
> > +}
> > +
> > +static int vidioc_venc_s_selection(struct file *file, void *priv,
> > +				     struct v4l2_selection *s)
> > +{
> > +	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> > +	struct mtk_q_data *q_data;
> > +
> > +	switch (s->target) {
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +	case V4L2_SEL_TGT_CROP:
> > +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> > +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> > +	case V4L2_SEL_TGT_COMPOSE:
> > +		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> > +			mtk_v4l2_err("Invalid s->type = %d", s->type);
> > +			return -EINVAL;
> > +		}
> > +		break;
> > +	default:
> > +		mtk_v4l2_err("Invalid s->target = %d", s->target);
> > +		return -EINVAL;
> > +	}
> > +
> > +	q_data = mtk_venc_get_q_data(ctx, s->type);
> > +	if (!q_data)
> > +		return -EINVAL;
> > +
> > +	s->r.top = 0;
> > +	s->r.left = 0;
> > +	q_data->visible_width = s->r.width;
> > +	q_data->visible_height = s->r.height;
> 
> This makes no sense.
> 
> See this page:
> 
> https://hverkuil.home.xs4all.nl/spec/media.html#selection-api
> 
> For the video output direction (memory -> HW encoder) the data source is
> the memory, the data sink is the HW encoder. For the video capture direction
> (HW encoder -> memory) the data source is the HW encoder and the data sink
> is the memory.
> 
> Usually for m2m devices the video output direction may support cropping and
> the video capture direction may support composing.
> 
> It's not clear what you intend here, especially since you set left and right
> to 0. That's not what the selection operation is supposed to do.
> 

We only support simple crop, but as you mentioned we need to use
g/s_selection not g/s_crop.
This provide our user space application could get/set encode region to
driver and encode region should always start from (0,0) to (width,
height).
That's why we always set top and left to 0.


best regards,
Tiffany

> Regards,
> 
> 	Hans
> 
> > +
> > +	return 0;
> > +}
> > +
> >  static int vidioc_venc_qbuf(struct file *file, void *priv,
> >  			    struct v4l2_buffer *buf)
> >  {
> > @@ -688,6 +759,9 @@ const struct v4l2_ioctl_ops mtk_venc_ioctl_ops = {
> >  
> >  	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
> >  	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
> > +
> > +	.vidioc_g_selection		= vidioc_venc_g_selection,
> > +	.vidioc_s_selection		= vidioc_venc_s_selection,
> >  };
> >  
> >  static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
> > 
