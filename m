Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6055E7F124
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 21:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TA45zhytFPggJ/KNc3nT/s2rZmIFeSaR3+xLqtcK0a4=; b=OiaZpfOrYhlL2Xuow5MF00fUrq
	SdBNQCN3nzph1vbijCfaO/gpIS9U/SQeaeiHoIiEsZIC7C0kbVs6ICt30hFCcsyWQgbOelF25mZAh
	Domrxs4BEq0oDfHx9e7T0hwzuaQHlzglGlKuS/YOz2q2eznlHqcPnz4JV7U5reJjRPXrxThDb7nkk
	gG+E+vf7Ky4QdlKBKUek9kX/BypA1ARlTNbBWa6Ui+9r9Dci44Y+k9CQD1dmSnbNfportHFIvCCyI
	11jSop7WzJNtym2MbcDIdTjUKY96ZezUFm489d57rnJv8wmFVdv1+EaJNlVKw6h4hJGZor72mZkCt
	NyAt+/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlFAA-00H234-1d;
	Tue, 26 Sep 2023 21:00:10 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlFA6-00H21f-2a
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Sep 2023 21:00:09 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-351367c1c24so13605ab.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Sep 2023 14:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695762005; x=1696366805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TA45zhytFPggJ/KNc3nT/s2rZmIFeSaR3+xLqtcK0a4=;
        b=Vok9bo7nhVXqTihuryjoEaLrrpZOBSbjeI/YMZoXcOjhg2cq9nOuJqVFVgqxB09n9w
         HHn/IaIohrsFoevpuwpOfaYrn+6vuAdLHypk8QaJHSLd7d/isqo3rl5ngTVmXlS8FlWp
         KaUY4Uh1K/+AoqbzW4GWA5ivVFc5gVSegfTws3fiypJp4n6UgYSIddO9tpNDSKszIPBh
         CL6GZb54sVSEd5lg2/oJxQLfd8wcwBuP/rmI3gyPr2R0j3I+vkTmwwqgN5+AXpHcz1jd
         zh4SptIzCTDBpxTEZskER1WwOKDUI6jF4D81I3Z+kqOcaMifqIjei4bBNmjiJj3oDb1G
         q/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695762005; x=1696366805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TA45zhytFPggJ/KNc3nT/s2rZmIFeSaR3+xLqtcK0a4=;
        b=XEIcLpd1J0a4yzPy3nJGorDXftXfXn34FclSlEcOvjzcDTWAJoab97xsV1KVKJHYQ1
         JxA0meObswgzaVvTEGI6BlTlhiQVqdFvHRu0IoDodCTa9/To6OXQwvaWpKODWfq9Jo3T
         r6Y1LJrA8QtX7eIkcg97zLWdF58nCnWKlqa4VtmjW0H7JwUGfHMSoUCvPzTkQtBl8wSv
         p0x57iMBMViB9OkfraAhpv7H8P5M3LV9fdow1IwirLhEA8mAXrPkHsddMfyFgG+FlEAt
         u3HnigW6qxfCBFKyFRnZZvz2MtfU6fCIEkPWrVdxALqAeULg9rc19DFD6pDbM5qHPfpO
         Sxhw==
X-Gm-Message-State: AOJu0Yzuvw/gCDlCuVW6zLN4BWC2bRRY2Me4mVM9EPFcsSCwrMWRVBK4
	q7sSGhPA+1OAClnUnKCnYmGld1DdhfuHi0trIf3q
X-Google-Smtp-Source: AGHT+IH0K9jqTlO5uKW9Jk4H1zWznZIkAiTG/Sjcg0WAY719KKeJ9HLq7/pc0+OhaE2YfKwbhRYcwP13j84kzOzGKFA=
X-Received: by 2002:a92:c562:0:b0:351:4dad:4738 with SMTP id
 b2-20020a92c562000000b003514dad4738mr367127ilj.9.1695762004652; Tue, 26 Sep
 2023 14:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230911125936.10648-1-yunfei.dong@mediatek.com>
 <20230911125936.10648-13-yunfei.dong@mediatek.com> <1df3e79b84933dda0313d0d9719220dbc06c9022.camel@collabora.com>
 <d4cedcb0-32ed-495d-a8cd-a635d5105824@xs4all.nl> <5307203d79c0d90cc742a315bb161fa796b9960f.camel@mediatek.com>
 <bafc37e8-96e8-41c0-b805-c6477f0d7c4a@xs4all.nl> <CA+ddPcN6EaFERC60_Z_-ZmWzqyUEwxiDCZwt_U6Y-gpaAu76tA@mail.gmail.com>
 <ff7aa575-c820-4dfa-853f-77438b8b149a@xs4all.nl> <b7d661637eacbda3e83d192b1126fc3970c4f50d.camel@collabora.com>
 <c3d14f64-bf04-46b9-ac7b-af7ef9014335@xs4all.nl> <00302ac675af858eb11d8398f100921af806bc30.camel@mediatek.com>
 <3e053387-4ba6-49bc-a59a-46854e0a7c26@xs4all.nl> <CA+ddPcOaCKq5Nd_3eWwJ3=oAf=5t-Z+w51NqapXN8VBuvbTw3g@mail.gmail.com>
 <71cadec5-06df-4490-9b06-e3af6bb43498@xs4all.nl> <CA+ddPcN0ivYa+vfvs-8PDpkDFkC=1gkM6fkeP7kE8Wqbi1w+dw@mail.gmail.com>
In-Reply-To: <CA+ddPcN0ivYa+vfvs-8PDpkDFkC=1gkM6fkeP7kE8Wqbi1w+dw@mail.gmail.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Tue, 26 Sep 2023 13:59:50 -0700
Message-ID: <CA+ddPcMX=6ek-EVRMxJcRfZxRuLTGL3A-jeeNaifNF0E5AvVHw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230926_140006_842073_2C318471 
X-CRM114-Status: GOOD (  79.65  )
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

Hans,

I've been looking through the v4l2/vbuf2 code to get an idea of the
details for implementing a new memory type for secure buffers.  What
it comes down to essentially is that it would behave just like
V4L2_MEMORY_DMABUF, but then there would be an extra check in
__prepare_dmabuf (in videobuf2-core.c) when the memory type is SECURE
to ensure that it is actually from a secure dma-buf allocation.  So
I'm thinking an alternate solution might be cleaner so we don't have
two memory types that are handled nearly identically in most of the
code. What do you think about a new memory flag like
V4L2_MEMORY_FLAG_SECURE?  This would be set in vb2_queue struct like
the other existing memory flag. Then when it gets into
__prepare_dmabuf and invokes attach_dmabuf on each buffer...that call
could then check for the existence of that flag, and if it's there it
could validate it is actually secure memory.  Then in various other
dmabuf vb2_mem_ops (maybe alloc, get_userptr, vaddr and mmap) those
could also check for the secure flag, and if present return an
error/null.  Then also in the driver specific vb2_ops for queue_setup,
the MTK driver could recognize the flag there and then configure
itself for secure mode.

How does that sound as an overall strategy?

Cheers,
Jeff

On Mon, Sep 25, 2023 at 9:51=E2=80=AFAM Jeffrey Kardatzke <jkardatzke@googl=
e.com> wrote:
>
> On Mon, Sep 25, 2023 at 2:00=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4a=
ll.nl> wrote:
> >
> > On 22/09/2023 21:17, Jeffrey Kardatzke wrote:
> > > On Fri, Sep 22, 2023 at 1:44=E2=80=AFAM Hans Verkuil <hverkuil-cisco@=
xs4all.nl> wrote:
> > >>
> > >> On 22/09/2023 05:28, Yunfei Dong (=E8=91=A3=E4=BA=91=E9=A3=9E) wrote=
:
> > >>> Hi Hans,
> > >>>
> > >>> Thanks for your help to give some good advice.
> > >>> On Wed, 2023-09-20 at 09:20 +0200, Hans Verkuil wrote:
> > >>>>
> > >>>>>>>> In any case, using a control to switch to secure mode and usin=
g
> > >>>> a control
> > >>>>>>>> to convert a dmabuf fd to a secure handle seems a poor choice =
to
> > >>>> me.
> > >>>>>>>>
> > >>>>>>>> I was wondering if it wouldn't be better to create a new
> > >>>> V4L2_MEMORY_ type,
> > >>>>>>>> e.g. V4L2_MEMORY_DMABUF_SECURE (or perhaps _DMABUF_OPTEE). Tha=
t
> > >>>> ensures that
> > >>>>>>>> once you create buffers for the first time, the driver can
> > >>>> switch into secure
> > >>>>>>>> mode, and until all buffers are released again you know that t=
he
> > >>>> driver will
> > >>>>>>>> stay in secure mode.
> > >>>>>>>
> > >>>>>>> Why do you think the control for setting secure mode is a poor
> > >>>> choice?
> > >>>>>>> There's various places in the driver code where functionality
> > >>>> changes
> > >>>>>>> based on being secure/non-secure mode, so this is very much a
> > >>>> 'global'
> > >>>>>>> setting for the driver. It could be inferred based off a new
> > >>>> memory
> > >>>>>>> type for the queues...which then sets that flag in the driver;
> > >>>> but
> > >>>>>>> that seems like it would be more fragile and would require
> > >>>> checking
> > >>>>>>> for incompatible output/capture memory types. I'm not against
> > >>>> another
> > >>>>>>> way of doing this; but didn't see why you think the proposed
> > >>>> method is
> > >>>>>>> a poor choice.
> > >>>>>>
> > >>>>>> I assume you are either decoding to secure memory all the time, =
or
> > >>>> not
> > >>>>>> at all. That's something you would want to select the moment you
> > >>>> allocate
> > >>>>>> the first buffer. Using the V4L2_MEMORY_ value would be the
> > >>>> natural place
> > >>>>>> for that. A control can typically be toggled at any time, and it
> > >>>> makes
> > >>>>>> no sense to do that for secure streaming.
> > >>>>>>
> > >>>>>> Related to that: if you pass a dmabuf fd you will need to check
> > >>>> somewhere
> > >>>>>> if the fd points to secure memory or not. You don't want to mix
> > >>>> the two
> > >>>>>> but you want to check that at VIDIOC_QBUF time.
> > >>>>>>
> > >>>>>> Note that the V4L2_MEMORY_ value is already checked in the v4l2
> > >>>> core,
> > >>>>>> drivers do not need to do that.
> > >>>>>
> > >>>>> Just to clarify a bit, and make sure I understand this too. You a=
re
> > >>>> proposing to
> > >>>>> introduce something like:
> > >>>>>
> > >>>>>    V4L2_MEMORY_SECURE_DMABUF
> > >>>>>
> > >>>>> Which like V4L2_MEMORY_DMABUF is meant to import dmabuf, while
> > >>>> telling the
> > >>>>> driver that the memory is secure according to the definition of
> > >>>> "secure" for the
> > >>>>> platform its running on.
> > >>>>>
> > >>>>> This drivers also allocate secure SHM (a standard tee concept) an=
d
> > >>>> have internal
> > >>>>> allocation for reconstruction buffer and some hw specific referen=
ce
> > >>>> metadata. So
> > >>>>> the idea would be that it would keep allocation using the dmabuf
> > >>>> heap internal
> > >>>>> APIs ? And decide which type of memory based on the memory type
> > >>>> found in the
> > >>>>> queue?
> > >>>>
> > >>>> Yes. Once you request the first buffer you basically tell the driv=
er
> > >>>> whether it
> > >>>> will operate in secure or non-secure mode, and that stays that way
> > >>>> until all
> > >>>> buffers are freed. I think that makes sense.
> > >>>>
> > >>>
> > >>> According to iommu's information, the dma operation for secure and =
non-
> > >>> secure are the same, whether just need to add one memory type in v4=
l2
> > >>> framework the same as V4L2_MEMORY_DMABUF? The dma operation in
> > >>> videobuf2-dma-contig.c can use the same functions.
> > >>
> > >> So if I pass a non-secure dma fd to the capture queue of the codec, =
who
> > >> will check that it can't write the data to that fd? Since doing so w=
ould
> > >> expose the video. Presumably at some point the tee code will prevent=
 that?
> > >> (I sincerely hope so!)
> > >
> > > It is entirely the job of the TEE to prevent this. Nothing in the
> > > kernel should allow exploitation of what happens in the TEE no matter
> > > what goes on in the kernel
> > >
> > >>
> > >> Having a separate V4L2_MEMORY_DMABUF_SECURE type is to indicate to t=
he
> > >> driver that 1) it can expect secure dmabuf fds, 2) it can configure =
itself
> > >> for that (that avoids using a control to toggle between normal and s=
ecure mode),
> > >> and at VIDIOC_QBUF time it is easy for the V4L2 core to verify that =
the
> > >> fd that is passed in is for secure memory. This means that mistakes =
by
> > >> userspace are caught at QBUF time.
> > >>
> > >> Of course, this will not protect you (people can disable this check =
by
> > >> recompiling the kernel), that still has to be done by the firmware, =
but
> > >> it catches userspace errors early on.
> > >>
> > >> Also, while for this hardware the DMA operation is the same, that mi=
ght
> > >> not be the case for other hardware.
> > >
> > > That's a really good point. So one of the other models that is used
> > > for secure video decoding is to send the encrypted buffer into the
> > > video decoder directly (i.e. V4L2_MEMORY_MMAP) and then also send in
> > > all the corresponding crypto parameters (i.e. algorithm, IV,
> > > encryption pattern, etc.). Then the video driver internally does the
> > > decryption and decode in one operation.  That's not what we want to
> > > use here for Mediatek; but I've done other integrations that work tha=
t
> > > way (that was for VAAPI [1], not V4L2...but there are other ARM
> > > implementations that do operate that way).  So if we end up requiring
> > > V4L2_MEMORY_DMABUF_SECURE to indicate secure mode and enforce it on
> > > output+capture, that'll close off other potential solutions in the
> > > future.
> > >
> > > Expanding on your point about DMA operations being different on
> > > various hardware, that also makes me think a general check for this i=
n
> > > v4l2 code may also be limiting. There are various ways secure video
> > > pipelines are done, so leaving these checks up to the individual
> > > drivers that implement secure video decode may be more pragmatic. If
> > > there's a generic V4L2 _CID_SECURE_MODE control, that makes it more
> > > general for how drivers can handle secure video decode.
> >
> > No, using a control for this is really wrong.
> >
> > The reason why I want it as a separate memory type is that that is
> > what you use when you call VIDIOC_REQBUFS, and that ioctl is also
> > when things are locked down in a driver. As long as no buffers have
> > been allocated, you can still change formats, parameters, etc. But
> > once buffers are allocated, most of that can't be changed, since
> > changing e.g. the format would also change the buffer sizes.
> >
> > It also locks down who owns the buffers by storing the file descriptor.
> > This prevents other processes from hijacking the I/O streaming, only
> > the owner can stream buffers.
> >
> > So it is a natural point in the sequence for selecting secure
> > buffers.
> >
> > If you request V4L2_MEMORY_DMABUF_SECURE for the output, then the
> > capture side must also use DMABUF_SECURE. Whether or not you can
> > use regular DMABUF for the output side and select DMABUF_SECURE
> > on the capture side is a driver decision. It can be useful to
> > support this for testing the secure capture using regular video
> > streams (something Nicolas discussed as well), but it depends on
> > the hardware whether you can use that technique.
>
> OK, that does work for the additional cases I mentioned.  And for
> testing...we would still want to use DMABUF_SECURE on both ends for
> Mediatek at least (that's the only way they support it). But rather
> than having to bother with a clearkey implementation...we can just do
> something that directly copies compressed video into the secure
> dmabufs and then exercises the whole pipeline from there. This same
> thing happens with the 'clear lead' that is sometimes there with
> encrypted video (where the first X seconds are unencrypted and then it
> switches to encrypted...but you're still using the secure video
> pipeline on the unencrypted frames in that case).
>
>
> >
> > Regards,
> >
> >         Hans
> >
> > >
> > > [1] - https://github.com/intel/libva/blob/master/va/va.h#L2177
> > >
> > >>
> > >> Regards,
> > >>
> > >>         Hans
> > >>
> > >>>
> > >>> Best Regards,
> > >>> Yunfei Dong
> > >>>
> > >>
> >

