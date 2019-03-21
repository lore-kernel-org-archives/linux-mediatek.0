From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC PATCH V0 7/7] [media] platform: mtk-isp: Add Mediatek ISP
 Pass 1 driver
Date: Thu, 21 Mar 2019 12:45:31 +0900
Message-ID: <CAAFQd5C+Syovzh14PAppyC5gmWqx=Tr_yGpLdgaWHXYXQGCX+g@mail.gmail.com>
References: <1549348966-14451-1-git-send-email-frederic.chen@mediatek.com>
 <1549348966-14451-8-git-send-email-frederic.chen@mediatek.com>
 <CAAFQd5BGFmTbRF+LdRvXs0MBZifRd9zB_+OT6Xwo=dzwqajgGA@mail.gmail.com>
 <1552378607.13953.71.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1552378607.13953.71.camel@mtksdccf07>
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
Cc: =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng@mediatek.com>, Frederic Chen <frederic.chen@mediatek.com>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>, =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>, srv_heupstream@mediatek.com, =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= <holmes.chiou@mediatek.com>, Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>, yuzhao@chromium.org, Sj Huang <sj.huang@mediatek.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-mediatek@lists.infradead.org, zwisler@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.ke>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Mar 12, 2019 at 5:16 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
>
> On Thu, 2019-03-07 at 19:04 +0900, Tomasz Figa wrote:
[snip]
> > > diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem-drv.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem-drv.c
> > > new file mode 100644
> > > index 0000000..020c38c
> > > --- /dev/null
> > > +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem-drv.c
> >
> > I don't think we need any of the code that is in this file. We should
> > just use the DMA API. We should be able to create appropriate reserved
> > memory pools in DT and properly assign them to the right allocating
> > devices.
> >
> > Skipping review of this file for the time being.
> >
>
> For this file, we may need your help.
> Its purpose is same as DIP SMEM driver.
> It is used for creating the ISP P1 specific vb2 buffer allocation
> context with reserved memory. Unfortunately, the implementation of
> mtk_cam-smem-drive.c is our best solution now.
>
> Could you give us more hints how to implement?
> Or do you think we could leverage the implementation from "Samsung S5P
> Multi Format Codec driver"?
> drivers/media/platform/s5p-mfc/s5p_mfc.c
> - s5p_mfc_configure_dma_memory function
>   - s5p_mfc_configure_2port_memory
>      - s5p_mfc_alloc_memdev

I think we can indeed take some ideas from there. I need some time to
check this and give you more details.

[snip]
> > > +               }
> > > +
> > > +               dev_dbg(&isp_dev->pdev->dev, "streamed on sensor(%s)\n",
> > > +                       cio->sensor->entity.name);
> > > +
> > > +               ret = mtk_cam_ctx_streamon(&isp_dev->ctx);
> > > +               if (ret) {
> > > +                       dev_err(&isp_dev->pdev->dev,
> > > +                               "Pass 1 stream on failed (%d)\n", ret);
> > > +                       return -EPERM;
> > > +               }
> > > +
> > > +               isp_dev->mem2mem2.streaming = enable;
> > > +
> > > +               ret = mtk_cam_dev_queue_buffers(isp_dev, true);
> > > +               if (ret)
> > > +                       dev_err(&isp_dev->pdev->dev,
> > > +                               "failed to queue initial buffers (%d)", ret);
> > > +
> > > +               dev_dbg(&isp_dev->pdev->dev, "streamed on Pass 1\n");
> > > +       } else {
> > > +               if (cio->sensor) {
> >
> > Is it possible to have cio->sensor NULL here? This function would have
> > failed if it wasn't found when enabling.
> >
>
> In the original design, it is protected to avoid abnormal double stream
> off (s_stream) call from upper layer. For stability reason, it is better
> to check.

If so, having some state (e.g. field in a struct) for tracking the
streaming state would make the code much easier to understand.
Also, the error message on the else case is totally misleading,
because it complains about a missing sensor, rather than double
s_stream.

[snip]
> Thanks for your valued comments on part 2.
> It is helpful for us to make our driver implementation better.
>
> We'd like to know your opinion about the schedule for RFC V1.
> Do you suggest us to send RFC V1 patch set after revising all comments
> on part 1 & 2 or wait for part 3 review?

I'm going to be a bit busy for the next few days, so it may be a good
idea to address the comments for parts 1, 2 and 3 and send RFC V1.
Also, for the more general comments, please check if they don't apply
to the other drivers too (DIP, FD, Seninf, MDP). Thanks in advance!

Best regards,
Tomasz
