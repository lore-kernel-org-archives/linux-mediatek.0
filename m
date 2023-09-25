Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3807CE7AA6
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 16:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guHH5XwkYZghkYXHEacdf4rVrJmI+x6l8REN2+UZc1Q=; b=vrhldL8SazY3LK5lTINtd63khx
	AUQxHbTbT87ySGBog189wQx+n8P5zMPCvpUYRTDVFSncQ3XdjkX4azhVpu9KxmUOoR44/qUyyh8uZ
	JHb3oPSerYtIpECG37huLymKWky03q2dJbqW4oLWRbtOKD51iHUAjMPBpQLB9uE8lhcTHwyhOjkZg
	TzcbI5r9UfesPwl80jiJf0ggpPpYn0mQBqYOE45OhwkaPAqnFHli2UFC7aUfz+6uG5QgA9g1YdzvL
	DmftKYq9EdoDZQcqEjvTSn6ixuK2WTiEINXdKeFQjWBspip/ZorD2UAbg4vM8tccSGwGqarKR8l1t
	ppH4obxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkoo5-00EhT7-1Y;
	Mon, 25 Sep 2023 16:51:37 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkoo2-00EhQz-0O
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 16:51:36 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-351367c1c24so1325ab.1
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695660690; x=1696265490; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guHH5XwkYZghkYXHEacdf4rVrJmI+x6l8REN2+UZc1Q=;
        b=vuKdAfQVIkm5lZagdEk7udsAY7+L9gxvgaFMvw3mHEhu84DbFWuceeAJG2FAKxRZEQ
         /dj9F7iF3Xv0Mb1wZs9eO4i41eEQEZnXZEWF07fls+WU6psX8G2luKYGozvGJubr90lm
         eccS3x4364wYH0dZYQ7FOXVChsSpgJ+0bqU6G1jMQoTbUPBIhfGLxn3QG0Frthc1yHw+
         x2W03W94Z0Tpz4hn3LfyjM4fxuhx0KquYDZF2qETsosx6Rxk3Hfb7OgYuMQ64zO1JyH9
         Yrj9QCMU3lCWHgOIxioUPTDC/UbrazXlkPpWviuRjBtLwEss35J1aAdewGkB0MkwBER4
         Sylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695660690; x=1696265490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guHH5XwkYZghkYXHEacdf4rVrJmI+x6l8REN2+UZc1Q=;
        b=NdlJnaqe151H3AcsqAKqdTkyrq5xmf+H8VMbJ03pm2Zacng9bbInkC9XqEASTBq30S
         oF5t/jHKk2++VQYrrpGdOgNWLTuXqZ+OXWzZPg3krRrL+XYYC4Rc6xBEuvkLgzvH5vJG
         AyzZ+PA9mv/FQYzEnhe2lVDg5F91wxSYVzBS00066jhTcOCxOXQX4TAgzn5On1oWKmiK
         RpOmvVQRy2KjbhPSbXC+XHzOQ9ciO4ztVZWkgq4wXwpq4piMFoQfanPO6O0lBzk2s1TS
         UGkTyYdq+b7cpJka5DR4Z9mLj2EiCbwcitFEJMcTQWjjsU7X1WiYEEUpdFd+9NneMHEw
         7KVQ==
X-Gm-Message-State: AOJu0Yx2uw99zemLw0x3J4Cfwz9OhGUA71hRhC3RoxoQ5oEbip2ZzlTS
	Z5GgX5/tymdhedtxkK693ZJckBJNlJXv5+f4Yc9s
X-Google-Smtp-Source: AGHT+IGGuzThpvoikYBTyyNGTXvsV15y4Fxa6YHncRwzBR705mTRYD3Oop/HwBiBhTmdrvlpEY1m89f4rvx2mMAO+CE=
X-Received: by 2002:a92:c545:0:b0:340:502b:1487 with SMTP id
 a5-20020a92c545000000b00340502b1487mr10796ilj.12.1695660690206; Mon, 25 Sep
 2023 09:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230911125936.10648-1-yunfei.dong@mediatek.com>
 <20230911125936.10648-13-yunfei.dong@mediatek.com> <1df3e79b84933dda0313d0d9719220dbc06c9022.camel@collabora.com>
 <d4cedcb0-32ed-495d-a8cd-a635d5105824@xs4all.nl> <5307203d79c0d90cc742a315bb161fa796b9960f.camel@mediatek.com>
 <bafc37e8-96e8-41c0-b805-c6477f0d7c4a@xs4all.nl> <CA+ddPcN6EaFERC60_Z_-ZmWzqyUEwxiDCZwt_U6Y-gpaAu76tA@mail.gmail.com>
 <ff7aa575-c820-4dfa-853f-77438b8b149a@xs4all.nl> <b7d661637eacbda3e83d192b1126fc3970c4f50d.camel@collabora.com>
 <c3d14f64-bf04-46b9-ac7b-af7ef9014335@xs4all.nl> <00302ac675af858eb11d8398f100921af806bc30.camel@mediatek.com>
 <3e053387-4ba6-49bc-a59a-46854e0a7c26@xs4all.nl> <CA+ddPcOaCKq5Nd_3eWwJ3=oAf=5t-Z+w51NqapXN8VBuvbTw3g@mail.gmail.com>
 <71cadec5-06df-4490-9b06-e3af6bb43498@xs4all.nl>
In-Reply-To: <71cadec5-06df-4490-9b06-e3af6bb43498@xs4all.nl>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Mon, 25 Sep 2023 09:51:15 -0700
Message-ID: <CA+ddPcN0ivYa+vfvs-8PDpkDFkC=1gkM6fkeP7kE8Wqbi1w+dw@mail.gmail.com>
Subject: Re: [PATCH 12/14] media: medkatek: vcodec: set secure mode to decoder driver
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>, 
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org" <stevecho@chromium.org>, 
	"wenst@chromium.org" <wenst@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>, 
	"hsinyi@chromium.org" <hsinyi@chromium.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"nfraprado@collabora.com" <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_095134_169574_9ED2570E 
X-CRM114-Status: GOOD (  66.83  )
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

On Mon, Sep 25, 2023 at 2:00=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 22/09/2023 21:17, Jeffrey Kardatzke wrote:
> > On Fri, Sep 22, 2023 at 1:44=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs=
4all.nl> wrote:
> >>
> >> On 22/09/2023 05:28, Yunfei Dong (=E8=91=A3=E4=BA=91=E9=A3=9E) wrote:
> >>> Hi Hans,
> >>>
> >>> Thanks for your help to give some good advice.
> >>> On Wed, 2023-09-20 at 09:20 +0200, Hans Verkuil wrote:
> >>>>
> >>>>>>>> In any case, using a control to switch to secure mode and using
> >>>> a control
> >>>>>>>> to convert a dmabuf fd to a secure handle seems a poor choice to
> >>>> me.
> >>>>>>>>
> >>>>>>>> I was wondering if it wouldn't be better to create a new
> >>>> V4L2_MEMORY_ type,
> >>>>>>>> e.g. V4L2_MEMORY_DMABUF_SECURE (or perhaps _DMABUF_OPTEE). That
> >>>> ensures that
> >>>>>>>> once you create buffers for the first time, the driver can
> >>>> switch into secure
> >>>>>>>> mode, and until all buffers are released again you know that the
> >>>> driver will
> >>>>>>>> stay in secure mode.
> >>>>>>>
> >>>>>>> Why do you think the control for setting secure mode is a poor
> >>>> choice?
> >>>>>>> There's various places in the driver code where functionality
> >>>> changes
> >>>>>>> based on being secure/non-secure mode, so this is very much a
> >>>> 'global'
> >>>>>>> setting for the driver. It could be inferred based off a new
> >>>> memory
> >>>>>>> type for the queues...which then sets that flag in the driver;
> >>>> but
> >>>>>>> that seems like it would be more fragile and would require
> >>>> checking
> >>>>>>> for incompatible output/capture memory types. I'm not against
> >>>> another
> >>>>>>> way of doing this; but didn't see why you think the proposed
> >>>> method is
> >>>>>>> a poor choice.
> >>>>>>
> >>>>>> I assume you are either decoding to secure memory all the time, or
> >>>> not
> >>>>>> at all. That's something you would want to select the moment you
> >>>> allocate
> >>>>>> the first buffer. Using the V4L2_MEMORY_ value would be the
> >>>> natural place
> >>>>>> for that. A control can typically be toggled at any time, and it
> >>>> makes
> >>>>>> no sense to do that for secure streaming.
> >>>>>>
> >>>>>> Related to that: if you pass a dmabuf fd you will need to check
> >>>> somewhere
> >>>>>> if the fd points to secure memory or not. You don't want to mix
> >>>> the two
> >>>>>> but you want to check that at VIDIOC_QBUF time.
> >>>>>>
> >>>>>> Note that the V4L2_MEMORY_ value is already checked in the v4l2
> >>>> core,
> >>>>>> drivers do not need to do that.
> >>>>>
> >>>>> Just to clarify a bit, and make sure I understand this too. You are
> >>>> proposing to
> >>>>> introduce something like:
> >>>>>
> >>>>>    V4L2_MEMORY_SECURE_DMABUF
> >>>>>
> >>>>> Which like V4L2_MEMORY_DMABUF is meant to import dmabuf, while
> >>>> telling the
> >>>>> driver that the memory is secure according to the definition of
> >>>> "secure" for the
> >>>>> platform its running on.
> >>>>>
> >>>>> This drivers also allocate secure SHM (a standard tee concept) and
> >>>> have internal
> >>>>> allocation for reconstruction buffer and some hw specific reference
> >>>> metadata. So
> >>>>> the idea would be that it would keep allocation using the dmabuf
> >>>> heap internal
> >>>>> APIs ? And decide which type of memory based on the memory type
> >>>> found in the
> >>>>> queue?
> >>>>
> >>>> Yes. Once you request the first buffer you basically tell the driver
> >>>> whether it
> >>>> will operate in secure or non-secure mode, and that stays that way
> >>>> until all
> >>>> buffers are freed. I think that makes sense.
> >>>>
> >>>
> >>> According to iommu's information, the dma operation for secure and no=
n-
> >>> secure are the same, whether just need to add one memory type in v4l2
> >>> framework the same as V4L2_MEMORY_DMABUF? The dma operation in
> >>> videobuf2-dma-contig.c can use the same functions.
> >>
> >> So if I pass a non-secure dma fd to the capture queue of the codec, wh=
o
> >> will check that it can't write the data to that fd? Since doing so wou=
ld
> >> expose the video. Presumably at some point the tee code will prevent t=
hat?
> >> (I sincerely hope so!)
> >
> > It is entirely the job of the TEE to prevent this. Nothing in the
> > kernel should allow exploitation of what happens in the TEE no matter
> > what goes on in the kernel
> >
> >>
> >> Having a separate V4L2_MEMORY_DMABUF_SECURE type is to indicate to the
> >> driver that 1) it can expect secure dmabuf fds, 2) it can configure it=
self
> >> for that (that avoids using a control to toggle between normal and sec=
ure mode),
> >> and at VIDIOC_QBUF time it is easy for the V4L2 core to verify that th=
e
> >> fd that is passed in is for secure memory. This means that mistakes by
> >> userspace are caught at QBUF time.
> >>
> >> Of course, this will not protect you (people can disable this check by
> >> recompiling the kernel), that still has to be done by the firmware, bu=
t
> >> it catches userspace errors early on.
> >>
> >> Also, while for this hardware the DMA operation is the same, that migh=
t
> >> not be the case for other hardware.
> >
> > That's a really good point. So one of the other models that is used
> > for secure video decoding is to send the encrypted buffer into the
> > video decoder directly (i.e. V4L2_MEMORY_MMAP) and then also send in
> > all the corresponding crypto parameters (i.e. algorithm, IV,
> > encryption pattern, etc.). Then the video driver internally does the
> > decryption and decode in one operation.  That's not what we want to
> > use here for Mediatek; but I've done other integrations that work that
> > way (that was for VAAPI [1], not V4L2...but there are other ARM
> > implementations that do operate that way).  So if we end up requiring
> > V4L2_MEMORY_DMABUF_SECURE to indicate secure mode and enforce it on
> > output+capture, that'll close off other potential solutions in the
> > future.
> >
> > Expanding on your point about DMA operations being different on
> > various hardware, that also makes me think a general check for this in
> > v4l2 code may also be limiting. There are various ways secure video
> > pipelines are done, so leaving these checks up to the individual
> > drivers that implement secure video decode may be more pragmatic. If
> > there's a generic V4L2 _CID_SECURE_MODE control, that makes it more
> > general for how drivers can handle secure video decode.
>
> No, using a control for this is really wrong.
>
> The reason why I want it as a separate memory type is that that is
> what you use when you call VIDIOC_REQBUFS, and that ioctl is also
> when things are locked down in a driver. As long as no buffers have
> been allocated, you can still change formats, parameters, etc. But
> once buffers are allocated, most of that can't be changed, since
> changing e.g. the format would also change the buffer sizes.
>
> It also locks down who owns the buffers by storing the file descriptor.
> This prevents other processes from hijacking the I/O streaming, only
> the owner can stream buffers.
>
> So it is a natural point in the sequence for selecting secure
> buffers.
>
> If you request V4L2_MEMORY_DMABUF_SECURE for the output, then the
> capture side must also use DMABUF_SECURE. Whether or not you can
> use regular DMABUF for the output side and select DMABUF_SECURE
> on the capture side is a driver decision. It can be useful to
> support this for testing the secure capture using regular video
> streams (something Nicolas discussed as well), but it depends on
> the hardware whether you can use that technique.

OK, that does work for the additional cases I mentioned.  And for
testing...we would still want to use DMABUF_SECURE on both ends for
Mediatek at least (that's the only way they support it). But rather
than having to bother with a clearkey implementation...we can just do
something that directly copies compressed video into the secure
dmabufs and then exercises the whole pipeline from there. This same
thing happens with the 'clear lead' that is sometimes there with
encrypted video (where the first X seconds are unencrypted and then it
switches to encrypted...but you're still using the secure video
pipeline on the unencrypted frames in that case).


>
> Regards,
>
>         Hans
>
> >
> > [1] - https://github.com/intel/libva/blob/master/va/va.h#L2177
> >
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> Best Regards,
> >>> Yunfei Dong
> >>>
> >>
>

