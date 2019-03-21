From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC PATCH V0 7/7] [media] platform: mtk-isp: Add Mediatek ISP
 Pass 1 driver
Date: Thu, 21 Mar 2019 12:59:41 +0900
Message-ID: <CAAFQd5CAY73b4jR=BFaJnhnHL-4QfEV7kQsiQusf=k-KghO0=g@mail.gmail.com>
References: <1549348966-14451-1-git-send-email-frederic.chen@mediatek.com>
 <1549348966-14451-8-git-send-email-frederic.chen@mediatek.com>
 <CAAFQd5CUi9MqZ+j+DhRZtgByvfVH-FBFJHiaxb_JOqsLGNoK2Q@mail.gmail.com>
 <1552460044.13953.114.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1552460044.13953.114.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jungo Lin <jungo.lin@mediatek.com>
Cc: =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng@mediatek.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>, srv_heupstream@mediatek.com, Mauro Carvalho Chehab <mchehab@kernel.org>, =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= <holmes.chiou@mediatek.com>, Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>, Sj Huang <sj.huang@mediatek.com>, yuzhao@chromium.org, =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>, zwisler@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Frederic Chen <frederic.chen@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kern>
List-Id: linux-mediatek@lists.infradead.org

On Wed, Mar 13, 2019 at 3:54 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
>
> On Tue, 2019-03-12 at 19:04 +0900, Tomasz Figa wrote:
[snip]
> > Instead of opencoding most of this function, one would normally call
> > mtk_cam_videoc_try_fmt() first to adjust the format struct and then
> > just update the driver state with the adjusted format.
> >
> > Also, similarly to VIDIOC_TRY_FMT, VIDIOC_SET_FMT doesn't fail unless
> > in the very specific cases, as described in
> > https://www.kernel.org/doc/html/latest/media/uapi/v4l/vidioc-g-fmt.html#return-value
> > .
> >
>
> Ok, below is our revised version of this function.
>
> int mtk_cam_videoc_s_fmt(struct file *file, void *fh,
>                          struct v4l2_format *f)
> {
>         struct mtk_cam_mem2mem2_device *m2m2 = video_drvdata(file);
>         struct mtk_cam_dev *cam_dev = mtk_cam_m2m_to_dev(m2m2);
>         struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
>
>         /* Get the valid format*/
>         mtk_cam_videoc_try_fmt(file, fh, f);
>         /* Configure to video device */
>         mtk_cam_ctx_fmt_set_img(&cam_dev->pdev->dev,
>                                 &node->vdev_fmt.fmt.pix_mp,
>                                 &f->fmt.pix_mp,
>                                 node->queue_id);
>
>         return 0;
> }
>

Looks almost good. We still need to signal the -EBUSY error condition
if an attempt to change the format is made while streaming is active.

[snip]
> > > +static int mtk_cam_videoc_s_meta_fmt(struct file *file,
> > > +                                    void *fh, struct v4l2_format *f)
> > > +{
> > > +       struct mtk_cam_mem2mem2_device *m2m2 = video_drvdata(file);
> > > +       struct mtk_cam_dev *isp_dev = mtk_cam_m2m_to_dev(m2m2);
> > > +       struct mtk_cam_ctx *dev_ctx = &isp_dev->ctx;
> > > +       struct mtk_cam_dev_video_device *node = file_to_mtk_cam_node(file);
> > > +       int queue_id = mtk_cam_dev_get_queue_id_of_dev_node(isp_dev, node);
> > > +
> >
> > No need for this blank line.
> >
>
> We will fix this coding style in next patch.
>
> > > +       int ret = 0;
> >
> > Please don't default-initialize without a good reason.
> >
>
> Ok, fix in next patch.
>
> > > +
> > > +       if (f->type != node->vbq.type)
> > > +               return -EINVAL;
> >
> > Ditto.
> >
>
> Ok, fix in next patch.
>
> > > +
> > > +       ret = mtk_cam_ctx_format_load_default_fmt(&dev_ctx->queue[queue_id], f);
> > > +
> >
> > No need for this blank line.
> >
>
> Ok, fix in next patch.
>
> > > +       if (!ret) {
> > > +               node->vdev_fmt.fmt.meta = f->fmt.meta;
> > > +               dev_ctx->queue[queue_id].fmt.meta = node->vdev_fmt.fmt.meta;
> > > +       } else {
> > > +               dev_warn(&isp_dev->pdev->dev,
> > > +                        "s_meta_fm failed, format not support\n");
> >
> > No need for this warning.
> >
>
> Ok, fix in next patch.
>
> > > +       }
> > > +
> > > +       return ret;
> > > +}
> >
> > Actually, why do we even need to do all the things? Do we support
> > multiple different meta formats on the same video node? If not, we can
> > just have all the TRY_FMT/S_FMT/G_FMT return the hardcoded format.
> >
>
> Ok, it is a good idea. We will return the hardcode format for meta video
> devices.
> Below is the revision version.
>
> int mtk_cam_meta_enum_format(struct file *file,
>                              void *fh, struct v4l2_fmtdesc *f)
> {
>         struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
>
>         f->pixelformat = node->vdev_fmt.fmt.meta.dataformat;
>
>         return 0;
> }

Need to error out if f->index > 0. Also need to initialize the other
output fields - flags and description.

[snip]
> > > +static u32 mtk_cam_node_get_v4l2_cap(struct mtk_cam_ctx_queue *node_ctx)
> > > +{
> > > +       u32 cap = 0;
> > > +
> > > +       if (node_ctx->desc.capture)
> > > +               if (node_ctx->desc.image)
> > > +                       cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE;
> > > +               else
> > > +                       cap = V4L2_CAP_META_CAPTURE;
> > > +       else
> > > +               if (node_ctx->desc.image)
> > > +                       cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE;
> > > +               else
> > > +                       cap = V4L2_CAP_META_OUTPUT;
> > > +
> > > +       return cap;
> > > +}
> >
> > Why not just have this defined statically as node_ctx->desc.cap?
> >
>
> Ok, it is refactoring done.
>
> > > +
> > > +static u32 mtk_cam_node_get_format_type(struct mtk_cam_ctx_queue *node_ctx)
> > > +{
> > > +       u32 type;
> > > +
> > > +       if (node_ctx->desc.capture)
> > > +               if (node_ctx->desc.image)
> > > +                       type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > > +               else
> > > +                       type = V4L2_BUF_TYPE_META_CAPTURE;
> > > +       else
> > > +               if (node_ctx->desc.image)
> > > +                       type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > > +               else
> > > +                       type = V4L2_BUF_TYPE_META_OUTPUT;
> > > +
> > > +       return type;
> > > +}
> >
> > Why not just have this defined statically as node_ctx->desc.buf_type?
> >
>
> Same as above.
>
> > > +
> > > +static const struct v4l2_ioctl_ops *mtk_cam_node_get_ioctl_ops
> > > +       (struct mtk_cam_ctx_queue *node_ctx)
> > > +{
> > > +       const struct v4l2_ioctl_ops *ops = NULL;
> > > +
> > > +       if (node_ctx->desc.image)
> > > +               ops = &mtk_cam_v4l2_ioctl_ops;
> > > +       else
> > > +               ops = &mtk_cam_v4l2_meta_ioctl_ops;
> > > +       return ops;
> > > +}
> >
> > It's also preferable to just put this inside some structure rather
> > than have getter functions. (node_ctx->desc.ioctl_ops?)
> >
>
> Same as above.
> Below is the new version for struct mtk_cam_ctx_queue_desc
>
> /*
>  * struct mtk_cam_ctx_queue_desc - queue attributes
>  *                              setup by device context owner
>  * @id:         id of the context queue
>  * @name:               media entity name
>  * @cap:                mapped to V4L2 capabilities
>  * @buf_type:   mapped to V4L2 buffer type
>  * @capture:    true for capture queue (device to user)
>  *                              false for output queue (from user to device)
>  * @image:              true for image, false for meta data
>  * @smem_alloc: Using the cam_smem_drv as alloc ctx or not
>  * @dma_port:   the dma port associated to the buffer
>  * @fmts:       supported format
>  * @num_fmts:   the number of supported formats
>  * @default_fmt_idx: default format of this queue
>  * @max_buf_count: maximum V4L2 buffer count
>  * @max_buf_count: mapped to v4l2_ioctl_ops
>  */
> struct mtk_cam_ctx_queue_desc {
>         u8 id;
>         char *name;
>         u32 cap;
>         u32 buf_type;
>         u32 dma_port;
>         u32 smem_alloc:1;
>         u8 capture:1;
>         u8 image:1;
>         u8 num_fmts;
>         u8 default_fmt_idx;
>         u8 max_buf_count;
>         const struct v4l2_ioctl_ops *ioctl_ops;
>         struct v4l2_format *fmts;
> };

SGTM +/- the missing kerneldoc for the new fields.

[snip]
> > Sorry, ran out of time for today. Fourth part will come. :)
> >
> > Best regards,
> > Tomasz
> >
>
> Appreciate your support and hard working on this review.
> We will look forward your part 4 review.

Thanks for replying to all the comments, it's very helpful.

As I mentioned in another reply, I'm going to be busy for the next few
days, so I'd suggest addressing the existing comments, fixing any
v4l2-compliance issues and also checking if any changes could be
applied to the other drivers (DIP, FD, Seninf, MDP) too and then
sending RFC V1.

Best regards,
Tomasz
