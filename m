Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B8BC432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 09:48:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA2DA20661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 09:48:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HnGcYW0s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rk9LL81A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA2DA20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwRHF4vNO0HOCeYQYTkCV1iaCQH64i+s5GSxzUNNCOc=; b=HnGcYW0sVVhYSL
	n3boAEr/RcOui3qyRROp7WLsboR78w2aZ5tZVYTs5qlJ65Z8YqlLs7s4uc2nvqgWkicuJZ1FbZXZF
	vSRzSCHQBh7beBVlzxGTCa4tMudC3lXA069MRYwz3WoK2QJPY8lw73d16rmCP1r+bbhfYFuWfDLUM
	/psPNo1/yIfayiJAhX3dWCBwM5mCCiYF8MuUh3XpWB7vqUvfLZklb3InJEmgdZuNLMhF/t/MYxdNk
	7u12RAm8a5Fce+FfGrFn7l4iE8b6EPAy2xinjGGbLJyrq1nW9AThBi8EwbtltILUxHY7Z9hSx666C
	EmqEto/EBS2cdnrQfqbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibiJz-0005xR-JL; Mon, 02 Dec 2019 09:48:47 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibiJv-0005wo-Eo
 for linux-mediatek@lists.infradead.org; Mon, 02 Dec 2019 09:48:45 +0000
Received: by mail-ed1-x544.google.com with SMTP id s10so31576258edi.5
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2019 01:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s1zlZMarLi4nAUCn1GIvPXbRFhUOTq04Huhogccl8tM=;
 b=Rk9LL81AeGldv3idTvopx1eq3lGmYB1xNoBlcTAr6Gc7YipmeLPUtYeZRUxmMdxAtM
 HmYf9gQljxw/wr8tzQlTUm/175gP09W8/L7YZ8/tdeGz73hCPKWJDVZl9TcPNFlao5H3
 KYri1VkZSoZ/7r4sg4Q3irewd8m3kkgtWOEDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s1zlZMarLi4nAUCn1GIvPXbRFhUOTq04Huhogccl8tM=;
 b=bER3VwAzJoIti8uRtugm6qal4hdpPLhCnC/aLX+Wq5I8r0TGgC4e04o9o1gEkilj/A
 XrqzQ3EosobHXDhe3UxXTTTbPJ0IKfd/3tA++Q30I+Wdq9KkUwAAIjfD2P5OGFdaUY5Z
 1jMipapKxkRB4E6Fve9e6AXfR0vjHxvHrEYpdQ6OU0/gz9kelr1r9b2tBi8rkmRoPRVb
 m2f756dtCD6yRm/ZpOwQhkZttbHP825rQ2dTNRembHEczxhIDKMD0uder1MAdC8uPnnG
 1W+9Pl8hmGF4It+2mbKU5oGhwGro0RqusWrkRFHGyBUT2Nt35OsxBATvQbqIHebi7d7f
 T0XQ==
X-Gm-Message-State: APjAAAWgkvIRmUpgF0HL3PtnlQ9VDiCqpR3cXI3niV6Tv9xOVz4ZpPM3
 C3CfiNXRNpPq5IKbMPk/1s4BdwbNCHw=
X-Google-Smtp-Source: APXvYqzYY7cIHq+SHe0nXVXvBB/4AOEhs/sNg8wuTNzUMXWiwmDS63pULZC7tDDj0Sy2/ZKdIhYYQg==
X-Received: by 2002:a17:906:e0c3:: with SMTP id
 gl3mr924901ejb.172.1575280121078; 
 Mon, 02 Dec 2019 01:48:41 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id l16sm808636ejq.75.2019.12.02.01.48.38
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 01:48:38 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id b6so13714035wrq.0
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2019 01:48:38 -0800 (PST)
X-Received: by 2002:adf:dfc1:: with SMTP id q1mr9118440wrn.155.1575280117799; 
 Mon, 02 Dec 2019 01:48:37 -0800 (PST)
MIME-Version: 1.0
References: <20190906101125.3784-1-Jerry-Ch.chen@mediatek.com>
 <20190906101125.3784-4-Jerry-Ch.chen@mediatek.com>
 <1571109375.3706.40.camel@mtksdccf07>
 <20191025035211.GA67000@chromium.org> <1574237450.20087.17.camel@mtksdccf07>
 <CAAFQd5DPErhL0_1f6BzDMMOVhxNfJdctBsK=mcBP6oNcmw-r=w@mail.gmail.com>
 <1575046535.22859.12.camel@mtksdccf07>
In-Reply-To: <1575046535.22859.12.camel@mtksdccf07>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 2 Dec 2019 18:48:23 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D-F1C4RyVeTzX=z72h6x0P5Gyb2X0EsH0YRQVAP6hGmQ@mail.gmail.com>
Message-ID: <CAAFQd5D-F1C4RyVeTzX=z72h6x0P5Gyb2X0EsH0YRQVAP6hGmQ@mail.gmail.com>
Subject: Re: [RFC PATCH V3 3/3] platform: mtk-isp: Add Mediatek FD driver
To: Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_014843_523204_AD5820D5 
X-CRM114-Status: GOOD (  40.24  )
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
 =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng@mediatek.com>,
 =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <Frederic.Chen@mediatek.com>,
 =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
 =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
 =?UTF-8?B?UG8tWWFuZyBIdWFuZyAo6buD5p+P6Zm9KQ==?= <po-yang.huang@mediatek.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
 "yuzhao@chromium.org" <yuzhao@chromium.org>, "lkml@metux.net" <lkml@metux.net>,
 "zwisler@chromium.org" <zwisler@chromium.org>,
 "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 30, 2019 at 1:55 AM Jerry-ch Chen
<Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Wed, 2019-11-20 at 18:28 +0900, Tomasz Figa wrote:
> > On Wed, Nov 20, 2019 at 5:11 PM Jerry-ch Chen
> > <Jerry-ch.Chen@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Fri, 2019-10-25 at 11:52 +0800, Tomasz Figa wrote:
> > > > On Tue, Oct 15, 2019 at 11:16:15AM +0800, Jerry-ch Chen wrote:
> > > > > Hi Tomasz,
> > > > >
> > > > > On Fri, 2019-09-06 at 18:11 +0800, Jerry-ch Chen wrote:
> > > > > > From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > > > > >
> > > > > > This patch adds the driver of Face Detection (FD) unit in
> > > > > > Mediatek camera system, providing face detection function.
> > > > > >
> > > > > > The mtk-isp directory will contain drivers for multiple IP
> > > > > > blocks found in Mediatek ISP system. It will include ISP Pass 1
> > > > > > driver (CAM), sensor interface driver, DIP driver and face
> > > > > > detection driver.
> > > > > >
> > > > > > Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > > > > > ---
> > > > > >  drivers/media/platform/Kconfig                |    2 +
> > > > > >  drivers/media/platform/Makefile               |    2 +
> > > > > >  drivers/media/platform/mtk-isp/fd/Kconfig     |   19 +
> > > > > >  drivers/media/platform/mtk-isp/fd/Makefile    |    5 +
> > > > > >  drivers/media/platform/mtk-isp/fd/mtk_fd.h    |  148 ++
> > > > > >  drivers/media/platform/mtk-isp/fd/mtk_fd_40.c | 1219 +++++++++++++++++
> > > > > >  include/uapi/linux/mtk-fd-v4l2-controls.h     |   69 +
> > > > > >  include/uapi/linux/v4l2-controls.h            |    4 +
> > > > > >  8 files changed, 1468 insertions(+)
> > > > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/Kconfig
> > > > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/Makefile
> > > > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd.h
> > > > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
> > > > > >  create mode 100644 include/uapi/linux/mtk-fd-v4l2-controls.h
> > > > > >
> > > >
> > > > [snip]
> > > >
> > > > > > +static int mtk_fd_job_abort(struct mtk_fd_dev *fd)
> > > > > > +{
> > > > > > + u32 ret;
> > > > > > +
> > > > > > + ret = wait_for_completion_timeout(&fd->fd_irq_done,
> > > > > > +                                   msecs_to_jiffies(MTK_FD_HW_TIMEOUT));
> > > > > > + /* Reset FD HW */
> > > > > > + if (!ret) {
> > > > > > +         struct ipi_message fd_ipi_msg;
> > > > > > +
> > > > > > +         fd_ipi_msg.cmd_id = MTK_FD_IPI_CMD_RESET;
> > > > > > +         if (scp_ipi_send(fd->scp_pdev, SCP_IPI_FD_CMD, &fd_ipi_msg,
> > > > > > +                          sizeof(fd_ipi_msg), MTK_FD_IPI_SEND_TIMEOUT))
> > > > > > +                 dev_err(fd->dev, "FD Reset HW error\n");
> > > > > > +         return -ETIMEDOUT;
> > > > > > + }
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > >
> > > > > Continue the discussion about job abort in RFC v2,
> > > > >
> > > > > I think the job_abort callback in v4l2_m2m_ops() might be useful.
> > > > >
> > > > > ref:
> > > > > https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/media/v4l2-core/v4l2-mem2mem.c#L398
> > > > > https://elixir.bootlin.com/linux/v5.4-rc2/source/include/media/v4l2-mem2mem.h#L43
> > > > >
> > > > > in drivers/media/v4l2-core/v4l2-mem2mem.c #398 v4l2_m2m_cancel_job()
> > > > > ...
> > > > > if (m2m_ctx->job_flags & TRANS_RUNNING) {
> > > > >     spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> > > > >     if (m2m_dev->m2m_ops->job_abort)
> > > > >             m2m_dev->m2m_ops->job_abort(m2m_ctx->priv);
> > > > >     dprintk("m2m_ctx %p running, will wait to complete\n", m2m_ctx);
> > > > >     wait_event(m2m_ctx->finished,
> > > > >                     !(m2m_ctx->job_flags & TRANS_RUNNING));
> > > > > } ...
> > > > >
> > > > > If this operation is set, we might use the v4l2_m2m_cancel_job() when
> > > > > suspend, and it will do mtk_fd_job_abort() here.
> > > > >
> > > >
> > > > The expectation for .job_abort() is that signals the hardware to
> > > > instantly abandon the current job. Do we have a way to tell the
> > > > firmware/hardware to do so?
> > > >
> > > > Also, suspend must not abort the current job. Anything that was already
> > > > running is expected to complete successfuly and further jobs should
> > > > continue executing once the system resumes.
> > > >
> > > I appreciate your comments and Pi-Hsun's patch,
> > >
> > > Ok, I see.
> > > For FD40, we can't tell the firmware/hardware to instantly abandon the
> > > current job.
> > > Therefore, for suspend, we stop sending further jobs to hardware and
> > > wait for the completion of the running job.
> > > For resume, we continue sending jobs to hardware.
> > >
> > > > [snip]
> > > >
> > > > > > +
> > > > > > +static int mtk_fd_suspend(struct device *dev)
> > > > > > +{
> > > > > > + struct mtk_fd_dev *fd = dev_get_drvdata(dev);
> > > > > > +
> > > > > > + if (pm_runtime_suspended(dev))
> > > > > > +         return 0;
> > > > > > +
> > > > > > + if (fd->fd_stream_count)
> > > > > > +         if (mtk_fd_job_abort(fd))
> > > > > > +                 mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
> > > > > > +
> > > > >
> > > > > To avoid mtk_fd_hw_job_finish() trigger the next job,
> > > > > I suppose that we could use v4l2_m2m_cancel_job instead of job_abort and
> > > > > job_finish here.
> > > > >
> > > > > /**
> > > > >  * v4l2_m2m_cancel_job() - cancel pending jobs for the context
> > > > >  * @m2m_ctx: m2m context with jobs to be canceled
> > > > >  *
> > > > >  * In case of streamoff or release called on any context,
> > > > >  * 1] If the context is currently running, then abort job will be called
> > > > >  * 2] If the context is queued, then the context will be removed from
> > > > >  *    the job_queue
> > > > >  */
> > > > >
> > > > > or another way,
> > > > > we may add a flag and implement mtk_fd_job_ready() that reads the flag
> > > > > if we suspend, we set the flag and do job_abort and job_finish, even if
> > > > > it try enqueue, it will still not really queue the job, until we reset
> > > > > the flag in mtk_fd_resume().
> > > > >
> > > > > how do you think?
> > > > >
> > > >
> > > > As per my comment above, suspend must just pause the execution of the
> > > > jobs. It must not cause any jobs to be skipped.
> > > >
> > > > After analyzing the m2m framework and existing m2m drivers I realized
> > > > that they currently provide no way to correctly handle suspend/resume.
> > > > Pi-Hsun has been looking into fixing this in crrev.com/c/1878112 and
> > > > we'll send it upstream as soon as we get something that should handle
> > > > all the cases correctly.
> > > >
> > > Ok, thanks for the patches.
> > >
> > > > > > + /* suspend FD HW */
> > > > > > + writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_INT_EN);
> > > > > > + writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_HW_ENABLE);
> > > > > > + clk_disable_unprepare(fd->fd_clk);
> > > > > > + dev_dbg(dev, "%s:disable clock\n", __func__);
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int mtk_fd_resume(struct device *dev)
> > > > > > +{
> > > > > > + struct mtk_fd_dev *fd = dev_get_drvdata(dev);
> > > > > > + int ret;
> > > > > > +
> > > > > > + if (pm_runtime_suspended(dev))
> > > > > > +         return 0;
> > > > > > +
> > > > > > + ret = clk_prepare_enable(fd->fd_clk);
> > > > > > + if (ret < 0) {
> > > > > > +         dev_dbg(dev, "Failed to open fd clk:%d\n", ret);
> > > > > > +         return ret;
> > > > > > + }
> > > > > > +
> > > > > > + /* resume FD HW */
> > > > > > + writel(MTK_FD_SET_HW_ENABLE, fd->fd_base + MTK_FD_REG_OFFSET_HW_ENABLE);
> > > > > > + writel(0x1, fd->fd_base + MTK_FD_REG_OFFSET_INT_EN);
> > > > > > + dev_dbg(dev, "%s:enable clock\n", __func__);
> > > >
> > > > By the way, we need to kick the m2m framework here to schedule further
> > > > jobs. Pi-Hsun's patch will also take care of this.
> > > >
> > > Ok, I see.
> > > I would like to use Pi-Hsun's patch, otherwise I would need to call
> > > v4l2_m2m_try_run() here.
> > >
> >
> > Yes, please include Pi-Hsun's patch (with original author, sign-off +
> > your sign-off added) at the beginning of the next version of your
> > series.
> >
> Done.
>
> > > > [snip]
> > > >
> > > > > > +/* Set the face angle and directions to be detected */
> > > > > > +#define V4L2_CID_MTK_FD_DETECT_POSE              (V4L2_CID_USER_MTK_FD_BASE + 1)
> > > > > > +
> > > > > > +/* Set image widths for an input image to be scaled down for face detection */
> > > > > > +#define V4L2_CID_MTK_FD_SCALE_DOWN_IMG_WIDTH     (V4L2_CID_USER_MTK_FD_BASE + 2)
> > > > > > +
> > > > > > +/* Set image heights for an input image to be scaled down for face detection */
> > > > > > +#define V4L2_CID_MTK_FD_SCALE_DOWN_IMG_HEIGHT    (V4L2_CID_USER_MTK_FD_BASE + 3)
> > > > > > +
> > > > > > +/* Set the length of scale down size array */
> > > > > > +#define V4L2_CID_MTK_FD_SCALE_IMG_NUM            (V4L2_CID_USER_MTK_FD_BASE + 4)
> > > > > > +
> > > > > > +/* Set the detection speed, usually reducing accuracy. */
> > > > > > +#define V4L2_CID_MTK_FD_DETECT_SPEED             (V4L2_CID_USER_MTK_FD_BASE + 5)
> > > > > > +
> > > > > > +/* Select the detection model or algorithm to be used. */
> > > > > > +#define V4L2_CID_MTK_FD_DETECTION_MODEL          (V4L2_CID_USER_MTK_FD_BASE + 6)
> > > > > > +
> > > > > > +/* We reserve 16 controls for this driver. */
> > > > > > +#define V4L2_CID_MTK_FD_MAX                      16
> > > > > > +
> > > > >
> > > > > For these control IDs, I think the following should be remained as chip
> > > > > specific controls.
> > > > > V4L2_CID_MTK_FD_SCALE_DOWN_IMG_WIDTH,
> > > > > V4L2_CID_MTK_FD_SCALE_DOWN_IMG_HEIGHT and V4L2_CID_MTK_FD_SCALE_IMG_NUM
> > > > >
> > > > > Hope there would be standardizing face detection api that cover the rest
> > > > > controls: V4L2_CID_MTK_FD_DETECT_POSE, V4L2_CID_MTK_FD_DETECT_SPEED and
> > > > > V4L2_CID_MTK_FD_DETECTION_MODEL
> > > > >
> > > > > Would you have any suggestions on how to propose the standard face
> > > > > detection apis?
> > > > >
> > > >
> > > > Given no follow up feedback from the community, I think we can keep them
> > > > as driver-specific, but should make sure that they have some reasonable
> > > > default values in case an application doesn't recognize them.
> > > >
> > > > Best regards,
> > > > Tomasz
> > > >
> > > Should I keep the file "mtk-fd-v4l2-controls.h" which defines the
> > > control ids under the folder "/include/uapi/linux"?
> >
> > We should define the CID base for the FD driver in v4l2-controls.h,
> > but the controls themselves should be only defined inside the driver.
> >
> > For example:
> > https://elixir.bootlin.com/linux/v5.4-rc8/source/include/uapi/linux/v4l2-controls.h#L178
> > https://elixir.bootlin.com/linux/v5.4-rc8/source/drivers/media/i2c/adv7180.c#L181
> >
> > Best regards,
> > Tomasz
>
> Appreciate for providing the example,
> Would it be fine for me to put the private CID in the mtk_fd.h(which is
> similar to before...) or follow the example to define inside
> mtk_fd_40.c??
>
> The next version is almost ready, maybe I can send it when I ready in a
> few days?

Since mtk_fd_40.c is the only place the definitions from mtk_fd.h are
used, I'd suggest just moving all the contents to the .c file.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
