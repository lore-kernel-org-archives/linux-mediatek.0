From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC PATCH V0 7/7] [media] platform: mtk-isp: Add Mediatek ISP
 Pass 1 driver
Date: Mon, 25 Mar 2019 16:12:02 +0900
Message-ID: <CAAFQd5CU2nTrxaYKW-NOxvc75_D+j+EhLhS9JSnUbqk=1aAW9g@mail.gmail.com>
References: <1549348966-14451-1-git-send-email-frederic.chen@mediatek.com>
 <1549348966-14451-8-git-send-email-frederic.chen@mediatek.com>
 <CAAFQd5CUi9MqZ+j+DhRZtgByvfVH-FBFJHiaxb_JOqsLGNoK2Q@mail.gmail.com>
 <1552460044.13953.114.camel@mtksdccf07>
 <CAAFQd5CAY73b4jR=BFaJnhnHL-4QfEV7kQsiQusf=k-KghO0=g@mail.gmail.com>
 <1553221253.7066.32.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1553221253.7066.32.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= <holmes.chiou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jerry-ch Chen <Jerry-ch.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, yuzhao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, zwisler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
 Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29Tb/PtFMR13I2A@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Mar 22, 2019 at 11:21 AM Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> On Thu, 2019-03-21 at 12:59 +0900, Tomasz Figa wrote:
> > On Wed, Mar 13, 2019 at 3:54 PM Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > >
> > > On Tue, 2019-03-12 at 19:04 +0900, Tomasz Figa wrote:
> > [snip]
> > > > Instead of opencoding most of this function, one would normally call
> > > > mtk_cam_videoc_try_fmt() first to adjust the format struct and then
> > > > just update the driver state with the adjusted format.
> > > >
> > > > Also, similarly to VIDIOC_TRY_FMT, VIDIOC_SET_FMT doesn't fail unless
> > > > in the very specific cases, as described in
> > > > https://www.kernel.org/doc/html/latest/media/uapi/v4l/vidioc-g-fmt.html#return-value
> > > > .
> > > >
> > >
> > > Ok, below is our revised version of this function.
> > >
> > > int mtk_cam_videoc_s_fmt(struct file *file, void *fh,
> > >                          struct v4l2_format *f)
> > > {
> > >         struct mtk_cam_mem2mem2_device *m2m2 = video_drvdata(file);
> > >         struct mtk_cam_dev *cam_dev = mtk_cam_m2m_to_dev(m2m2);
> > >         struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> > >
> > >         /* Get the valid format*/
> > >         mtk_cam_videoc_try_fmt(file, fh, f);
> > >         /* Configure to video device */
> > >         mtk_cam_ctx_fmt_set_img(&cam_dev->pdev->dev,
> > >                                 &node->vdev_fmt.fmt.pix_mp,
> > >                                 &f->fmt.pix_mp,
> > >                                 node->queue_id);
> > >
> > >         return 0;
> > > }
> > >
> >
> > Looks almost good. We still need to signal the -EBUSY error condition
> > if an attempt to change the format is made while streaming is active.
> >
> > [snip]
>
> Ok, we will add streaming status checking in this function.
>
> > > > > +static int mtk_cam_videoc_s_meta_fmt(struct file *file,
> > > > > +                                    void *fh, struct v4l2_format *f)
> > > > > +{
> > > > > +       struct mtk_cam_mem2mem2_device *m2m2 = video_drvdata(file);
> > > > > +       struct mtk_cam_dev *isp_dev = mtk_cam_m2m_to_dev(m2m2);
> > > > > +       struct mtk_cam_ctx *dev_ctx = &isp_dev->ctx;
> > > > > +       struct mtk_cam_dev_video_device *node = file_to_mtk_cam_node(file);
> > > > > +       int queue_id = mtk_cam_dev_get_queue_id_of_dev_node(isp_dev, node);
> > > > > +
> > > >
> > > > No need for this blank line.
> > > >
> > >
> > > We will fix this coding style in next patch.
> > >
> > > > > +       int ret = 0;
> > > >
> > > > Please don't default-initialize without a good reason.
> > > >
> > >
> > > Ok, fix in next patch.
> > >
> > > > > +
> > > > > +       if (f->type != node->vbq.type)
> > > > > +               return -EINVAL;
> > > >
> > > > Ditto.
> > > >
> > >
> > > Ok, fix in next patch.
> > >
> > > > > +
> > > > > +       ret = mtk_cam_ctx_format_load_default_fmt(&dev_ctx->queue[queue_id], f);
> > > > > +
> > > >
> > > > No need for this blank line.
> > > >
> > >
> > > Ok, fix in next patch.
> > >
> > > > > +       if (!ret) {
> > > > > +               node->vdev_fmt.fmt.meta = f->fmt.meta;
> > > > > +               dev_ctx->queue[queue_id].fmt.meta = node->vdev_fmt.fmt.meta;
> > > > > +       } else {
> > > > > +               dev_warn(&isp_dev->pdev->dev,
> > > > > +                        "s_meta_fm failed, format not support\n");
> > > >
> > > > No need for this warning.
> > > >
> > >
> > > Ok, fix in next patch.
> > >
> > > > > +       }
> > > > > +
> > > > > +       return ret;
> > > > > +}
> > > >
> > > > Actually, why do we even need to do all the things? Do we support
> > > > multiple different meta formats on the same video node? If not, we can
> > > > just have all the TRY_FMT/S_FMT/G_FMT return the hardcoded format.
> > > >
> > >
> > > Ok, it is a good idea. We will return the hardcode format for meta video
> > > devices.
> > > Below is the revision version.
> > >
> > > int mtk_cam_meta_enum_format(struct file *file,
> > >                              void *fh, struct v4l2_fmtdesc *f)
> > > {
> > >         struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> > >
> > >         f->pixelformat = node->vdev_fmt.fmt.meta.dataformat;
> > >
> > >         return 0;
> > > }
> >
> > Need to error out if f->index > 0. Also need to initialize the other
> > output fields - flags and description.
> >
> > [snip]
>
> Ok, we will add format index & type checking in the beginning of this
> function. Moreover, we will initialize flags & description based on
> current meta format value.
>
> > > > > +static u32 mtk_cam_node_get_v4l2_cap(struct mtk_cam_ctx_queue *node_ctx)
> > > > > +{
> > > > > +       u32 cap = 0;
> > > > > +
> > > > > +       if (node_ctx->desc.capture)
> > > > > +               if (node_ctx->desc.image)
> > > > > +                       cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE;
> > > > > +               else
> > > > > +                       cap = V4L2_CAP_META_CAPTURE;
> > > > > +       else
> > > > > +               if (node_ctx->desc.image)
> > > > > +                       cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE;
> > > > > +               else
> > > > > +                       cap = V4L2_CAP_META_OUTPUT;
> > > > > +
> > > > > +       return cap;
> > > > > +}
> > > >
> > > > Why not just have this defined statically as node_ctx->desc.cap?
> > > >
> > >
> > > Ok, it is refactoring done.
> > >
> > > > > +
> > > > > +static u32 mtk_cam_node_get_format_type(struct mtk_cam_ctx_queue *node_ctx)
> > > > > +{
> > > > > +       u32 type;
> > > > > +
> > > > > +       if (node_ctx->desc.capture)
> > > > > +               if (node_ctx->desc.image)
> > > > > +                       type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > > > > +               else
> > > > > +                       type = V4L2_BUF_TYPE_META_CAPTURE;
> > > > > +       else
> > > > > +               if (node_ctx->desc.image)
> > > > > +                       type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > > > > +               else
> > > > > +                       type = V4L2_BUF_TYPE_META_OUTPUT;
> > > > > +
> > > > > +       return type;
> > > > > +}
> > > >
> > > > Why not just have this defined statically as node_ctx->desc.buf_type?
> > > >
> > >
> > > Same as above.
> > >
> > > > > +
> > > > > +static const struct v4l2_ioctl_ops *mtk_cam_node_get_ioctl_ops
> > > > > +       (struct mtk_cam_ctx_queue *node_ctx)
> > > > > +{
> > > > > +       const struct v4l2_ioctl_ops *ops = NULL;
> > > > > +
> > > > > +       if (node_ctx->desc.image)
> > > > > +               ops = &mtk_cam_v4l2_ioctl_ops;
> > > > > +       else
> > > > > +               ops = &mtk_cam_v4l2_meta_ioctl_ops;
> > > > > +       return ops;
> > > > > +}
> > > >
> > > > It's also preferable to just put this inside some structure rather
> > > > than have getter functions. (node_ctx->desc.ioctl_ops?)
> > > >
> > >
> > > Same as above.
> > > Below is the new version for struct mtk_cam_ctx_queue_desc
> > >
> > > /*
> > >  * struct mtk_cam_ctx_queue_desc - queue attributes
> > >  *                              setup by device context owner
> > >  * @id:         id of the context queue
> > >  * @name:               media entity name
> > >  * @cap:                mapped to V4L2 capabilities
> > >  * @buf_type:   mapped to V4L2 buffer type
> > >  * @capture:    true for capture queue (device to user)
> > >  *                              false for output queue (from user to device)
> > >  * @image:              true for image, false for meta data
> > >  * @smem_alloc: Using the cam_smem_drv as alloc ctx or not
> > >  * @dma_port:   the dma port associated to the buffer
> > >  * @fmts:       supported format
> > >  * @num_fmts:   the number of supported formats
> > >  * @default_fmt_idx: default format of this queue
> > >  * @max_buf_count: maximum V4L2 buffer count
> > >  * @max_buf_count: mapped to v4l2_ioctl_ops
> > >  */
> > > struct mtk_cam_ctx_queue_desc {
> > >         u8 id;
> > >         char *name;
> > >         u32 cap;
> > >         u32 buf_type;
> > >         u32 dma_port;
> > >         u32 smem_alloc:1;
> > >         u8 capture:1;
> > >         u8 image:1;
> > >         u8 num_fmts;
> > >         u8 default_fmt_idx;
> > >         u8 max_buf_count;
> > >         const struct v4l2_ioctl_ops *ioctl_ops;
> > >         struct v4l2_format *fmts;
> > > };
> >
> > SGTM +/- the missing kerneldoc for the new fields.
> >
> > [snip]
>
> Ok, we will fix the missing part.
>
> > > > Sorry, ran out of time for today. Fourth part will come. :)
> > > >
> > > > Best regards,
> > > > Tomasz
> > > >
> > >
> > > Appreciate your support and hard working on this review.
> > > We will look forward your part 4 review.
> >
> > Thanks for replying to all the comments, it's very helpful.
> >
> > As I mentioned in another reply, I'm going to be busy for the next few
> > days, so I'd suggest addressing the existing comments, fixing any
> > v4l2-compliance issues and also checking if any changes could be
> > applied to the other drivers (DIP, FD, Seninf, MDP) too and then
> > sending RFC V1.
> >
> > Best regards,
> > Tomasz
>
> Ok, we will deliver the RFC V1 next week.
> Btw, for v4l2-compliance testing, we have some questions about this.
> We list these two issues below.
> If you have time, please kindly provide your comments.
> Or we could discuss these two issues in RFC V1.
>
>
> 1. Kernel minor issue for 32 bit test program.
> => fail: v4l2-test-media.cpp(368): check_0(links.reserved,
> sizeof(links.reserved))
> This issue is similar to below patch.
> https://patchwork.kernel.org/patch/8578421/
> The reserved fields of media_links_enum is missing copy from kernel
> space to user space in media_device_enum_links32 function.
> So it makes the above failed.
> Do we provide our patch to fix it?

Yes, it would be nice if you could send a patch fixing it.

>
> 2. Some v4l2-compliance testing results are failed in the sensor
> drivers's sub devices nodes. which are implemented in ov5695 & ov2685
> driver. Do you suggest us to fix them?

Let's look at this off the list and figure out. Please send me an
email with the results.

Other than that, just to make sure we're all on the same page, please
try to fix any remaining v4l2-compliance issues of Mediatek drivers
for RFC V1.

Best regards,
Tomasz
