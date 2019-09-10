From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC PATCH V2 4/6] platform: mtk-isp: Add Mediatek DIP driver
Date: Tue, 10 Sep 2019 12:45:18 +0900
Message-ID: <CAAFQd5BKxg9xhJLfM_xqbo-tGihr==PzrPvVScaj89s8HY=FMQ@mail.gmail.com>
References: <20190708110500.7242-1-frederic.chen@mediatek.com>
 <20190708110500.7242-5-frederic.chen@mediatek.com>
 <20190731071014.GA43159@chromium.org>
 <1566875772.10064.99.camel@mtksdccf07>
 <CAAFQd5B7WM-uExpo-qpEyDMNXLQkvqO=qBDrkpNvERr+iXVhtw@mail.gmail.com>
 <1567761407.31117.12.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1567761407.31117.12.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frederic Chen <frederic.chen@mediatek.com>
Cc: "yuzhao@chromium.org" <yuzhao@chromium.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "zwisler@chromium.org" <zwisler@chromium.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Sep 6, 2019 at 6:17 PM Frederic Chen <frederic.chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> Thank you for your comments.
>
>
> On Fri, 2019-08-30 at 16:14 +0900, Tomasz Figa wrote:
> > Hi Frederic,
> >
> > On Tue, Aug 27, 2019 at 12:16 PM Frederic Chen
> > <frederic.chen@mediatek.com> wrote:
> > >
> > > Dear Tomasz,
> > >
> > > I appreciate your comment. I will collaborate more closely with Jungo
> > > to solve the common issues in DIP and Pass 1(CAM) drivers.
> > >
> >
> > Thank you!
> >
> > Also thanks for replying to all the comments, it's very helpful.
> > Please check my replies inline. I've snipped out the parts that I
> > don't have further comments on.
> >
> > >
> > > On Wed, 2019-07-31 at 15:10 +0800, Tomasz Figa wrote:
> > > > Hi Frederic,
> > > >
> > > > On Mon, Jul 08, 2019 at 07:04:58PM +0800, frederic.chen@mediatek.com wrote:
> >
> > [snip]
> >
> > > >
> > > > > +                   dev_buf->vbb.vb2_buf.timestamp =
> > > > > +                           in_buf->vbb.vb2_buf.timestamp;
> > > > > +
> > > > > +           vb2_buffer_done(&dev_buf->vbb.vb2_buf, vbf_state);
> > > > > +
> > > > > +           node = mtk_dip_vbq_to_node(dev_buf->vbb.vb2_buf.vb2_queue);
> > > > > +           spin_lock(&node->buf_list_lock);
> > > > > +           list_del(&dev_buf->list);
> > > > > +           spin_unlock(&node->buf_list_lock);
> > > > > +
> > > > > +           dev_dbg(&pipe->dip_dev->pdev->dev,
> > > > > +                   "%s:%s: return buf, idx(%d), state(%d)\n",
> > > > > +                   pipe->desc->name, node->desc->name,
> > > > > +                   dev_buf->vbb.vb2_buf.index, vbf_state);
> > > > > +   }
> > > >
> > > > This looks almost the same as what's being done inside
> > > > mtk_dip_hw_streamoff(). Could we just call this function from the loop
> > > > there?
> > >
> > > I would like to call the function from mtk_dip_hw_streamoff(). The only
> > > difference is mtk_dip_pipe_job_finish() also remove the buffer from the
> > > node's internal list.
> > >
> >
> > Would anything wrong happen if we also remove the buffer from the
> > node's internal list in mtk_dip_hw_streamoff()?
> >
> > Actually, do we need that internal node list? If we have a list of
> > requests and each request stores its buffer, wouldn't that be enough?
> >
>
> We use the buffer list in the following cases:
> 1. media_pipeline_start() failed when streaming on video device
> 2. Video device stream off
>
> If the some video device is streamed on ,but the entire pipe has not
> started streaming (for example, MDP 0 is streamed on, but RAW input has
> not been streamed on), we use the list to return the buffers.
>
> Should we handle this cases? or we expect that the user will request
> buffers again to ensure all buffers are removed from the video device in
> this error case.
>

However, if we only support the Request API, there wouldn't be any
buffers outside of any request. For a request that isn't queued, the
buffers are not passed to the driver, so it doesn't need to do
anything. The only thing left to handle is when there are some
requests queued and those requests already include the buffer request
objects inside, so we can handle them without a separate internal
buffer list.

> > > > > +/* Plane size that is accepted by MDP HW */
> > > > > +static u32
> > > > > +dip_mdp_fmt_get_plane_size(const struct mtk_dip_dev_format *fmt,
> > > > > +                      u32 stride, u32 height,
> > > > > +                      unsigned int plane)
> > > > > +{
> > > > > +   enum mdp_color c = fmt->mdp_color;
> > > > > +   u32 bytesperline;
> > > > > +
> > > > > +   bytesperline = (stride * fmt->row_depth[0])
> > > > > +           / MDP_COLOR_BITS_PER_PIXEL(c);
> > > >
> > > > Hmm, stride and bytesperline should be exactly the same thing. Could you
> > > > explain what's happening here?
> > >
> > > The stride here is specific for MDP hardware (which uses the same MDP
> > > stride setting for NV12 and NV12M):
> > >
> > >         bytesperline = width * row_depth / 8
> > >         MDP stride   = width * MDP_COLOR_BITS_PER_PIXEL /8
> > >
> > > Therfore,
> > >
> > >         bytesperline = MDP stride * row_depth / MDP_COLOR_BITS_PER_PIXEL
> > >         MDP stride   = bytesperline * MDP_COLOR_BITS_PER_PIXEL/ row_depth
> > >
> >
> > I'm sorry I'm still confused. Is there an intermediate buffer between
> > DIP and MDP that has stride of |MDP stride| and then MDP writes to the
> > final buffer that has the stride of |bytesperline|?
> >
>
> No, there is no intermediate buffer between DIP and MDP that has stride
> of |MDP stride|. DIP connects to MDP in hardware level, so MDP writes
> the buffer with |MDP stride|.
>
> As I know, V4L2's bytesperline means bytes per line of the first
> plane(*), but mdp hw needs y, u, v stride (it is different from V4L2).
> Therefore we calculate the |MDP stride| here.
>
> *:
> https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/pixfmt-v4l2.html#c.v4l2_pix_format
> "When the image format is planar the bytesperline value applies to the
> first plane and is divided by the same factor as the width field for the
> other planes."

However, we're using v4l2_pix_fmt_mplane, not v4l2_pix_format. If the
pixelformat is the M variant (e.g. V4L2_PIX_FMT_NV12M), the
v4l2_pix_fmt_mplane::planes[] contains bytesperline and sizeimage for
each plane separately. That's the reason I'm strongly suggesting
abandoning the non-M formats and supporting only the M ones.

>
> > [snip]
> >
> > > >
> > > > > +           u32 sizeimage;
> > > > > +
> > > > > +           if (bpl < min_bpl)
> > > > > +                   bpl = min_bpl;
> > > > > +
> > > > > +           sizeimage = (bpl * mfmt_to_fill->height * dev_fmt->depth[i])
> > > > > +                   / dev_fmt->row_depth[i];
> > > >
> > > > Shouldn't this be bpl * fmt->height?
> > >
> > > Row_depth is the bits of the pixel.
> > > Depth means the bytes per pixel of the image format.
> > >
> > > For example,
> > > Image: 640 * 480
> > > YV12: row_depth = 8, depth = 12
> >
> > YV12 has 3 planes of 8 bits per pixel. Not sure where does this 12 come from.
> >
>
> Let me elaborate more about the 12 depth.
>
> depth: pixel bit number
>
> For 420,
>
> y = w * h
> u = (w/2) * (h/2)
> v = (w/2) * (h/2)
>
> Therefore,
>
> y = 8,
> u = 8/2/2 = 2
> v = 8/2/2 = 2
>
> depth (y + u + v) = 8 + 2 + 2 = 12
>

Yes, that's what I understood, but it is by no means associated with
any physical depth. It's more like "total_bits_per_pixel". That's
however a very error prone way to express pixel formats, as for
example it can't handle the case when plane strides alignments are not
proportional.

Please see the v4l2_format_info struct for the recommended way of
describing pixel formats. Actually, the struct itself could be reused
in this driver, even if we don't end up using the helpers for some
reason.

>
> > > Bytes per line = width * row_depth / 8 = 640 * 8/ 8 = 640
> > > Image size = Bytes per line * height * (depth/ row_depth)
> > >            = 640 * 480 * 1.5
> > >
> >
> > I think we might be having some terminology issue here. "row" is
> > normally the same as "line", which consists of |width| pixels +
> > padding, which is |bytesperline| bytes in total.
> >
> > Perhaps you want to store a bits_per_pixel[] and vertical and
> > horizontal subsampling arrays for all planes of the formats in the
> > format descriptor.
> >
> > By the way, have you considered using the V4L2 format helpers [1]?
> >
> > [1] https://elixir.bootlin.com/linux/v5.3-rc6/source/drivers/media/v4l2-core/v4l2-common.c#L561
>
> Would it be possible to keep row_depth and depth? It is already used in
> MDP drivers.
>
> https://elixir.bootlin.com/linux/v5.3-rc6/source/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
>

I'd suggest cleaning up the MDP driver instead. :)
(Could be done as a follow up later, of course.)

Best regards,
Tomasz
