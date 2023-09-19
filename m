Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D627ECE79AA
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 19:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjZ5BN29vyJcDpPakjHo+LE2E50zmXdK3wyq4bXrB04=; b=vMH4alZVc0a8UsFxIKuO2WbYwY
	O+uWf52/azowEz9oBIHccZDKXWGcTNdSgVN2qNUcp3pfEaEi/evgzBBbZGWq9rf657fQ3bfpSqqt4
	EeLhcGqfUbpZrP3OIYFowv2BUDwclvj4uTnQ0guaUjYyZyB+N+C3M2JFMw0tam8X4ecgZSgTeyBP1
	LIP44UPDtXWjumM0HVZp01MLR+gxABR/87Es2FS5oDbAoDlTx1O6XxdHoVtX1jl5KJem7AaYBPw/U
	BTVmMt1MYmk32aLVttFjK4BF6MmACGDjAAdcCpqkajED1fQPYHvzTSWJJ0/VQBCbx3VjNVmXaijYM
	tLd4QWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qigZ9-001Act-0s;
	Tue, 19 Sep 2023 19:39:23 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qigZ4-001Abl-2J
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 19:39:21 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-34f1ffda46fso21605ab.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 12:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695152356; x=1695757156; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjZ5BN29vyJcDpPakjHo+LE2E50zmXdK3wyq4bXrB04=;
        b=QaR3V8rmvUS8NwsNsjwFd3jTBd6zSf0BkJICIc+AVDR3T0ybM99+V6/NW1L0+YimgL
         O7N6Ajf7ogBQwj59gVEcbextvPx+l35OK4r5+XkoQKSO1+iAH99+GJR7ya/MWEJE0JV4
         FnHjmYivFNGuHQr9cs700JPR9WxohPOS0TyFVk4pAlXYtbzmTs9FjSguutTbfB6oZZLb
         j4h5iPTaSn00oln/2t/X/XPNDQaPe26xoeB49k9/TGN3pjr+kZyZbIzLjWr1WOKbCVAw
         0rM1XcgK7M9zwdx8hkjBqLuFXOrZ4ZiDF3+O+7vFA+Y5yLmTZ3yvU1QM9j7pXfbQviks
         0cDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695152356; x=1695757156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjZ5BN29vyJcDpPakjHo+LE2E50zmXdK3wyq4bXrB04=;
        b=IWYCfhwmQRgB2JGyvu2DAESmoxBZBtE2g1nI3ys4ELR2W+oMZLOZtmrt+nkrQLr82v
         4zc2UL8u+G15rE3ltemjTQ7AVCfuSbp6ZEv+QgMVs5Fnn0kMZZCrIgzcKrYeew231WBg
         4cgYoMKulBLRqQgKXMkcB3CJMlBxZ6/u66c5AsN9YbN9+Wx6zZWLnWpYTyMU2jfYalU3
         lHAH2Ar8dHVMd0QikIpruKwU7aHOlbyqneXNVO7tO71wMJ6402oTwhUIZ2aDJZ7E3a1G
         yjNyFbYEedxLKgJT9E/JnmHYWmQ6Z3AB9AUF9dP9ObcoLYvuPu/4Z+B3z6PAN/KGs3gj
         zCUg==
X-Gm-Message-State: AOJu0YyrPMvD9mf9DLKEckN8CRocXxl/LQ923vpOWZ57Sm4AtY3kheGg
	XzcytLXgU7W5NrV0gieDhUcENWIaCqRNeRSUpjDm
X-Google-Smtp-Source: AGHT+IE6uj+t1GvpBFwLO1O0zIiOblpkK9eIqTXl6wGzmmbWWI7kmXAE5LtHzMpajdUfYl3KEaHbIMoZKOiJxkQXVZ8=
X-Received: by 2002:a92:8704:0:b0:346:139d:4549 with SMTP id
 m4-20020a928704000000b00346139d4549mr36881ild.1.1695152356128; Tue, 19 Sep
 2023 12:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230911125936.10648-1-yunfei.dong@mediatek.com>
 <20230911125936.10648-13-yunfei.dong@mediatek.com> <1df3e79b84933dda0313d0d9719220dbc06c9022.camel@collabora.com>
 <d4cedcb0-32ed-495d-a8cd-a635d5105824@xs4all.nl> <5307203d79c0d90cc742a315bb161fa796b9960f.camel@mediatek.com>
 <bafc37e8-96e8-41c0-b805-c6477f0d7c4a@xs4all.nl> <CA+ddPcN6EaFERC60_Z_-ZmWzqyUEwxiDCZwt_U6Y-gpaAu76tA@mail.gmail.com>
 <ff7aa575-c820-4dfa-853f-77438b8b149a@xs4all.nl>
In-Reply-To: <ff7aa575-c820-4dfa-853f-77438b8b149a@xs4all.nl>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Tue, 19 Sep 2023 12:39:01 -0700
Message-ID: <CA+ddPcP+dfG_mQ54gBh-3sn+d6Owdi5xEg6V5uBs0-hEJV3A-A@mail.gmail.com>
Subject: Re: [PATCH 12/14] media: medkatek: vcodec: set secure mode to decoder driver
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>, 
	"nhebert@chromium.org" <nhebert@chromium.org>, 
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>, 
	"nfraprado@collabora.com" <nfraprado@collabora.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org" <stevecho@chromium.org>, 
	"wenst@chromium.org" <wenst@chromium.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"hsinyi@chromium.org" <hsinyi@chromium.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_123918_773763_2179D877 
X-CRM114-Status: GOOD (  76.11  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 19, 2023 at 1:53=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 18/09/2023 22:57, Jeffrey Kardatzke wrote:
> > On Fri, Sep 15, 2023 at 1:56=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs=
4all.nl> wrote:
> >>
> >> On 15/09/2023 10:25, Yunfei Dong (=E8=91=A3=E4=BA=91=E9=A3=9E) wrote:
> >>> Hi Hans & Nicolas,
> >>>
> >>> Thanks for your advice.
> >>>
> >>> On Tue, 2023-09-12 at 11:30 +0200, Hans Verkuil wrote:
> >>>>
> >>>> External email : Please do not click links or open attachments until
> >>>> you have verified the sender or the content.
> >>>>  Hi,
> >>>>
> >>>> On 9/11/23 17:54, Nicolas Dufresne wrote:
> >>>>> Hi,
> >>>>>
> >>>>> Le lundi 11 septembre 2023 =C3=A0 20:59 +0800, Yunfei Dong a =C3=A9=
crit :
> >>>>>> Setting secure mode flag to kernel when trying to play secure
> >>>>
> >>>> video,
> >>>>>> then decoder driver will initialize tee related interface to
> >>>>
> >>>> support
> >>>>>> svp.
> >>>>>
> >>>>>
> >>>>> This is not what the patch is doing, please rework. This patch is
> >>>>
> >>>> an vendor API
> >>>>> addition introducing V4L2_CID_MPEG_MTK_SET_SECURE_MODE. I should
> >>>>
> >>>> not have to
> >>>>> read your patch to understand this.
> >>>>>
> >>>>>>
> >>>>>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> >>>>>> ---
> >>>>>>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c     | 15
> >>>>
> >>>> ++++++++++++++-
> >>>>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         |  5 +++++
> >>>>>>  include/uapi/linux/v4l2-controls.h                |  1 +
> >>>>>>  3 files changed, 20 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git
> >>>>
> >>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stat=
e
> >>>> less.c
> >>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stat=
e
> >>>> less.c
> >>>>>> index d2b09ce9f1cf..a981178c25d9 100644
> >>>>>> ---
> >>>>
> >>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stat=
e
> >>>> less.c
> >>>>>> +++
> >>>>
> >>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stat=
e
> >>>> less.c
> >>>>>> @@ -535,6 +535,17 @@ static int mtk_vdec_s_ctrl(struct v4l2_ctrl
> >>>>
> >>>> *ctrl)
> >>>>>>  ctrl->val =3D mtk_dma_contig_get_secure_handle(ctx, ctrl->val);
> >>>>>>  mtk_v4l2_vdec_dbg(3, ctx, "get secure handle: %d =3D> 0x%x",
> >>>>
> >>>> sec_fd, ctrl->val);
> >>>>>>  break;
> >>>>>> +case V4L2_CID_MPEG_MTK_SET_SECURE_MODE:
> >>>>>
> >>>>> Stepping back a little and focusing on the API, what makes your
> >>>>
> >>>> driver so
> >>>>> special that it should be the only one having a "secure mode" ? We
> >>>>
> >>>> are touching
> >>>>> in gap in the media pipeline in Linux, and this should come with
> >>>>
> >>>> consideration
> >>>>> of the global API.
> >>>>>
> >>>>> Why is this API better then let's say Google Android one, were they
> >>>>
> >>>> expose 2
> >>>>> device nodes in their fork of the MFC driver (a secure and a non
> >>>>
> >>>> secure one) ?
> >>>>
> >>>> Perhaps it is a good idea to first post an RFC with an uAPI proposal
> >>>> on how to
> >>>> handle secure video. I suspect this isn't mediatek specific, other
> >>>> SoCs with
> >>>> tee support could use this as well.
> >>>>
> >>>> As Nicolas said, it's long known to be a gap in our media support, s=
o
> >>>> it is
> >>>> really great that you started work on this, but you need to look at
> >>>> this from
> >>>> a more generic point-of-view, and not mediatek-specific.
> >>>>
> >>>
> >>> Whether your have any advice about how to do a more generic driver to
> >>> handle secure video playback?
> >>>
> >>> There are several kind of buffer: output queue buffer/capture queue
> >>> buffer/working buffer.
> >>>
> >>> output and capture queue buffer: user space will call tee related
> >>> interface to allocate secure handle. Will convert to secure handle wi=
th
> >>> v4l2 framework, then send secure handle to optee-os.
> >>>
> >>> working buffer: calling dma_heap and dma_buf to get secure memory
> >>> handle, then covert secure iova in optee-os.
> >>>
> >>> Using the same kernel driver for svp and non-svp playback, just the
> >>> buffer type are different. Normal is iova and secure is secure handle=
.
> >>>
> >>> User driver will tell the kernel driver with CID control whether the
> >>> current playback is svp or non-svp.
> >>
> >> My understanding is that when you switch to secure mode, the driver ma=
kes
> >> some optee calls to set everything up. And userspace needs a way conve=
rt a
> >> dmabuf fd to a 'secure handle', which appears to be the DMA address of=
 the
> >> buffer. Who uses that handle?
> >
> > The only user space usage for getting the 'secure handle' from an fd
> > is when that memory is written to. This is done when the TEE decrypts
> > the video contents. User space sends the encrypted video + 'secure
> > handle' to the TEE, and the TEE decrypts the contents to the memory
> > associated with the 'secure handle'. Then the 'secure handle' is
> > passed into the TEE again with the v4l2 driver to use as the source
> > for video decoding (but w/ v4l2, user space is passing in fds).
>
> I think I need some more background. This series is to support a 'Secure =
Video
> Processor' (at least, that's what svp stands for I believe, something tha=
t
> is not mentioned anywhere in this series, BTW) which is used to decode an
> encrypted h264 stream.
SVP =3D Secure Video Path, which is explained in what you linked to below.
>
> First question: how is that stream encrypted? Is that according to some s=
tandard?
> Nothing is mentioned about that.
The TEE does the decryption of the incoming stream to the secure
buffer...and that is then fed into the output queue of v4l2. So
there's no handling of encrypted content in the kernel patches...it's
just about handling secure buffers and secure surfaces.
>
> I gather that the encrypted stream is fed to the codec as usual (i.e. jus=
t put it
> in the output buffer and queue it to the codec), nothing special is neede=
d for that.
> Except, how does the hardware know it is encrypted? I guess that's where =
the
> control comes in, you have to turn on SVP mode first.
Yeah, the driver does need to know if the FDs are from secure or
non-secure memory...which is what the SVP control was about.
>
> For the capture buffers you need to provide buffers from secure/trusted m=
emory.
> That's a dmabuf fd, but where does that come from?
That fd is allocated from the secure dma-buf heap which is being
proposed in another patchset.
https://lore.kernel.org/linux-mediatek/20230911023038.30649-1-yong.wu@media=
tek.com/
>
> I saw this message:
>
> https://lore.kernel.org/linux-media/CAPj87rOHctwHJM-7HiQpt8Q0b09x0WWw_T4X=
sL0qT=3DdS+XzyZQ@mail.gmail.com/T/#u
>
> so I expect that's where it comes from. But I agree that getting this fro=
m dma-heaps
> seems more natural.
>
> I assume that those capture buffers are inaccessible from the CPU? (Hence=
 'secure')
Correct
>
> For actually displaying these secure buffers you would use drm, and I ass=
ume that
> the hardware would mix in the contents of the secure buffer into the vide=
o output
> pipeline? I.e., the actual contents remain inaccessible. And that the vid=
eo output
> (HDMI or DisplayPort) is using HDCP?
Correct
>
> >
> >>
> >> In any case, using a control to switch to secure mode and using a cont=
rol
> >> to convert a dmabuf fd to a secure handle seems a poor choice to me.
> >>
> >> I was wondering if it wouldn't be better to create a new V4L2_MEMORY_ =
type,
> >> e.g. V4L2_MEMORY_DMABUF_SECURE (or perhaps _DMABUF_OPTEE). That ensure=
s that
> >> once you create buffers for the first time, the driver can switch into=
 secure
> >> mode, and until all buffers are released again you know that the drive=
r will
> >> stay in secure mode.
> >
> > Why do you think the control for setting secure mode is a poor choice?
> > There's various places in the driver code where functionality changes
> > based on being secure/non-secure mode, so this is very much a 'global'
> > setting for the driver. It could be inferred based off a new memory
> > type for the queues...which then sets that flag in the driver; but
> > that seems like it would be more fragile and would require checking
> > for incompatible output/capture memory types. I'm not against another
> > way of doing this; but didn't see why you think the proposed method is
> > a poor choice.
>
> I assume you are either decoding to secure memory all the time, or not
> at all. That's something you would want to select the moment you allocate
> the first buffer. Using the V4L2_MEMORY_ value would be the natural place
> for that. A control can typically be toggled at any time, and it makes
> no sense to do that for secure streaming.
Ahh ok, good point about the control being able to be toggled at any
time. So adding a new V4L2_MEMORY_ type would make sense relating to
that.
>
> Related to that: if you pass a dmabuf fd you will need to check somewhere
> if the fd points to secure memory or not. You don't want to mix the two
> but you want to check that at VIDIOC_QBUF time.
>
> Note that the V4L2_MEMORY_ value is already checked in the v4l2 core,
> drivers do not need to do that.
>
> >
> >>
> >> For converting the dmabuf fd into a secure handle: a new ioctl similar=
 to
> >> VIDIOC_EXPBUF might be more suited for that.
> >
> > I actually think the best way for converting the dmabuf fd into a
> > secure handle would be another ioctl in the dma-heap driver...since
> > that's where the memory is actually allocated from. But this really
> > depends on upstream maintainers and what they are comfortable with.
>
> That feels like a more natural place of doing this.
>
> Regards,
>
>         Hans
>
> >
> >>
> >> Note that I am the first to admit that I have no experience with secur=
e
> >> video pipelines or optee-os, so I am looking at this purely from an uA=
PI
> >> perspective.
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> Best Regards,
> >>> Yunfei Dong
> >>>> Regards,
> >>>>
> >>>> Hans
> >>>>
> >>>>>
> >>>>> regards,
> >>>>> Nicolas
> >>>>>
> >>>>> p.s. you forgot to document your control in the RST doc, please do
> >>>>
> >>>> in following
> >>>>> release.
> >>>>>
> >>>>>> +ctx->is_svp_mode =3D ctrl->val;
> >>>>>> +
> >>>>>> +if (ctx->is_svp_mode) {
> >>>>>> +ret =3D mtk_vcodec_dec_optee_open(ctx->dev->optee_private);
> >>>>>> +if (ret)
> >>>>>> +mtk_v4l2_vdec_err(ctx, "open secure mode failed.");
> >>>>>> +else
> >>>>>> +mtk_v4l2_vdec_dbg(3, ctx, "decoder in secure mode: %d", ctrl-
> >>>>>
> >>>>> val);
> >>>>>> +}
> >>>>>> +break;
> >>>>>>  default:
> >>>>>>  mtk_v4l2_vdec_dbg(3, ctx, "Not supported to set ctrl id:
> >>>>>> 0x%x\n",
> >>>>
> >>>> hdr_ctrl->id);
> >>>>>>  return ret;
> >>>>>> @@ -573,7 +584,7 @@ static int mtk_vcodec_dec_ctrls_setup(struct
> >>>>
> >>>> mtk_vcodec_dec_ctx *ctx)
> >>>>>>  unsigned int i;
> >>>>>>  struct v4l2_ctrl *ctrl;
> >>>>>>
> >>>>>> -v4l2_ctrl_handler_init(&ctx->ctrl_hdl, NUM_CTRLS + 1);
> >>>>>> +v4l2_ctrl_handler_init(&ctx->ctrl_hdl, NUM_CTRLS + 2);
> >>>>>>  if (ctx->ctrl_hdl.error) {
> >>>>>>  mtk_v4l2_vdec_err(ctx, "v4l2_ctrl_handler_init failed\n");
> >>>>>>  return ctx->ctrl_hdl.error;
> >>>>>> @@ -592,6 +603,8 @@ static int mtk_vcodec_dec_ctrls_setup(struct
> >>>>
> >>>> mtk_vcodec_dec_ctx *ctx)
> >>>>>>
> >>>>>>  ctrl =3D v4l2_ctrl_new_std(&ctx->ctrl_hdl,
> >>>>
> >>>> &mtk_vcodec_dec_ctrl_ops,
> >>>>>>   V4L2_CID_MPEG_MTK_GET_SECURE_HANDLE, 0, 65535, 1, 0);
> >>>>>> +ctrl =3D v4l2_ctrl_new_std(&ctx->ctrl_hdl,
> >>>>
> >>>> &mtk_vcodec_dec_ctrl_ops,
> >>>>>> + V4L2_CID_MPEG_MTK_SET_SECURE_MODE, 0, 65535, 1, 0);
> >>>>>>
> >>>>>>  v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> >>>>>>
> >>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>
> >>>> b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>>> index d8cf01f76aab..a507045a3f30 100644
> >>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>>> @@ -1042,6 +1042,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >>>>>>  case V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES:return
> >>>>>> "Reference
> >>>>
> >>>> Frames for a P-Frame";
> >>>>>>  case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:return "Prepend
> >>>>
> >>>> SPS and PPS to IDR";
> >>>>>>  case V4L2_CID_MPEG_MTK_GET_SECURE_HANDLE:return "MediaTek
> >>>>>> Decoder
> >>>>
> >>>> get secure handle";
> >>>>>> +case V4L2_CID_MPEG_MTK_SET_SECURE_MODE:return "MediaTek Decoder
> >>>>
> >>>> set secure mode";
> >>>>>>
> >>>>>>  /* AV1 controls */
> >>>>>>  case V4L2_CID_MPEG_VIDEO_AV1_PROFILE:return "AV1 Profile";
> >>>>>> @@ -1442,6 +1443,10 @@ void v4l2_ctrl_fill(u32 id, const char
> >>>>
> >>>> **name, enum v4l2_ctrl_type *type,
> >>>>>>  *type =3D V4L2_CTRL_TYPE_INTEGER;
> >>>>>>  *flags |=3D V4L2_CTRL_FLAG_WRITE_ONLY;
> >>>>>>  break;
> >>>>>> +case V4L2_CID_MPEG_MTK_SET_SECURE_MODE:
> >>>>>> +*type =3D V4L2_CTRL_TYPE_INTEGER;
> >>>>>> +*flags |=3D V4L2_CTRL_FLAG_WRITE_ONLY;
> >>>>>> +break;
> >>>>>>  case V4L2_CID_USER_CLASS:
> >>>>>>  case V4L2_CID_CAMERA_CLASS:
> >>>>>>  case V4L2_CID_CODEC_CLASS:
> >>>>>> diff --git a/include/uapi/linux/v4l2-controls.h
> >>>>
> >>>> b/include/uapi/linux/v4l2-controls.h
> >>>>>> index 7b3694985366..88e90d943e38 100644
> >>>>>> --- a/include/uapi/linux/v4l2-controls.h
> >>>>>> +++ b/include/uapi/linux/v4l2-controls.h
> >>>>>> @@ -957,6 +957,7 @@ enum v4l2_mpeg_mfc51_video_force_frame_type {
> >>>>>>  /*  MPEG-class control IDs specific to the MediaTek Decoder
> >>>>
> >>>> driver as defined by V4L2 */
> >>>>>>  #define V4L2_CID_MPEG_MTK_BASE(V4L2_CTRL_CLASS_CODEC | 0x2000)
> >>>>>>  #define
> >>>>
> >>>> V4L2_CID_MPEG_MTK_GET_SECURE_HANDLE(V4L2_CID_MPEG_MTK_BASE+8)
> >>>>>> +#define
> >>>>
> >>>> V4L2_CID_MPEG_MTK_SET_SECURE_MODE(V4L2_CID_MPEG_MTK_BASE+9)
> >>>>>>
> >>>>>>  /*  Camera class control IDs */
> >>>>>>
> >>
> >>
> >> _______________________________________________
> >> linux-arm-kernel mailing list
> >> linux-arm-kernel@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

