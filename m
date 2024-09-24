Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E06CF9C71
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 23:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NzgyJCmofpDvlL2LY7vWR+4GwIElX0CvHm/QEXv8qs=; b=AoWfd3XUjiSdBgeus7ioH4/EL0
	y65GfewIjiV/K/QqyorT0YjUeWzOt7LPz+c9NEP1DI5xUd6h9WuenIvBLGpOHd2E0jwQ+9L+bASal
	i9UYsfLQJlwB9x9FIhkh34YZmuh/QfdMn419pwlhNoWNRQ99drXzIMKtC0pYvA19SxfxWJxpvpxo2
	sM1DetOURPDKjamOioKI2jjGJxWuwh31NZECxz6DLhTJCFWaWMz+y5slqs8qFTUcUNGXxdBddI/xV
	X9DOE4Ke8usTugYr3KocVbTWkWTwlBKhrDcC6TP6ZdVUg/48AwzPbKloWa33Wn6vYEp6ierf3Yp6X
	+s7XLqtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stEcY-00000003Wlf-1IY9;
	Tue, 24 Sep 2024 23:07:02 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stEbM-00000003WTC-3qWc
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Sep 2024 23:05:50 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2f75f116d11so61637201fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Sep 2024 16:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727219147; x=1727823947; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9NzgyJCmofpDvlL2LY7vWR+4GwIElX0CvHm/QEXv8qs=;
        b=QnuPs+ArTkxMSHdU9O3nYlzPx9Y58gnDJRNdkxXSwHqS0+FQuuJr2dxq2+cgXiaURi
         8MsiZVnOMpx3HqqbqEwDSxcAlQazLqeQ1FtP8sMfEA4FmR1IrPdjvbiaT+C4f8FSnkF9
         +VH065WGeUoTiZFn1dEOfkPOf2Xwp5nVvLWdcOdNsw6EqoPciJmVZvNpiwYtMRsU2JgX
         yn69vCOK+rOz9LjoGh1o1nNDyvdQJOpJH7IQ+UZD/zSLJNp+B00gumaucH3j6YV4C7kY
         Yus17wpvxKmn6ThH/kyu+GKBdw92yESsOuD+aaUPViXKJdNMH0QEw5ReRlHccmkrAq69
         UStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727219147; x=1727823947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NzgyJCmofpDvlL2LY7vWR+4GwIElX0CvHm/QEXv8qs=;
        b=W6/USt4CgYDozWGgDONxo8bOB/3KnlCNEJqS9RahlpE5DLCKQquzFtAysIThPXaE8V
         hIpEXxaO0MBeFGoZFMBMVFdTRO86WqZknHl3jRI8TOaAvd/YlwEuVBbTfL+9BlXYcMN1
         cV6TVeQDu9EknsLuJ4LKv7vO3VH8VjlmfSkeTKM+BdM+7yi+dtkdFK8AZvWROPs0slE4
         rwCvxODyhbcmIiq+Y+42QrYluOnv0gZrHBdrZgGbWGpdNNuUKq7PEtKWVJb1DtoRVAzh
         riWJLSfxIGh54FQ/cpnU3jiFOuNkGMdTk70DfTbsitEUezJRY4PT/i+jQGleEn3Uo6Fs
         BxJA==
X-Forwarded-Encrypted: i=1; AJvYcCXVeicQp51TstD/DwXjjwVCJwjn9nogwiGY80mu/1TrYk/LNddtVFR0wuolFGVLWkVmiLGBebldvDv4L85tdw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj5ILOng/O45XRZ8wz37BWD/KWZVr2d/h+7AZFOVm6PtXMIAL8
	J4mMNQRasqQTfkzvopVib23Bjc2rp7dOgTi64KhMiV5S7Cx4gwgOvfjAVpNIwwo=
X-Google-Smtp-Source: AGHT+IE5l1Rs+vPP0d46dRQ8kpFdT22PznwS2FzcBc27LRW1aZnDwn4h9lV6Lj8kxoQctlNMzBsynA==
X-Received: by 2002:a05:651c:210c:b0:2f7:5cd3:7235 with SMTP id 38308e7fff4ca-2f904a6fc6bmr5492391fa.0.1727219146549;
        Tue, 24 Sep 2024 16:05:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d282fe23sm3485591fa.20.2024.09.24.16.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:05:45 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:05:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Sumit Garg <sumit.garg@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
Message-ID: <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_160549_016521_4A63B05D 
X-CRM114-Status: GOOD (  68.29  )
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

On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
> On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
> > Hi,
> > 
> > On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> > > Hi,
> > > 
> > > This patch set is based on top of Yong Wu's restricted heap patch set [1].
> > > It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
> > > 
> > > The Linaro restricted heap uses genalloc in the kernel to manage the heap
> > > carvout. This is a difference from the Mediatek restricted heap which
> > > relies on the secure world to manage the carveout.
> > > 
> > > I've tried to adress the comments on [2], but [1] introduces changes so I'm
> > > afraid I've had to skip some comments.
> > 
> > I know I have raised the same question during LPC (in connection to
> > Qualcomm's dma-heap implementation). Is there any reason why we are
> > using generic heaps instead of allocating the dma-bufs on the device
> > side?
> > 
> > In your case you already have TEE device, you can use it to allocate and
> > export dma-bufs, which then get imported by the V4L and DRM drivers.
> > 
> 
> This goes to the heart of why we have dma-heaps in the first place.
> We don't want to burden userspace with having to figure out the right
> place to get a dma-buf for a given use-case on a given hardware.
> That would be very non-portable, and fail at the core purpose of
> a kernel: to abstract hardware specifics away.

Unfortunately all proposals to use dma-buf heaps were moving in the
described direction: let app select (somehow) from a platform- and
vendor- specific list of dma-buf heaps. In the kernel we at least know
the platform on which the system is running. Userspace generally doesn't
(and shouldn't). As such, it seems better to me to keep the knowledge in
the kernel and allow userspace do its job by calling into existing
device drivers.

> 
> Worse, the actual interface for dma-buf exporting changes from
> framework to framework (getting a dma-buf from DRM is different
> than V4L, and there would be yet another API for TEE, etc..)

But if the app is working with the particular subsystem, then it already
talks its language. Allocating a dma-buf is just another part of the
interface, which the app already has to support.

> Most subsystem don't need an allocator, they work just fine
> simply being only dma-bufs importers. Recent example being the
> IIO subsystem[0], for which some early posting included an
> allocator, but in the end, all that was needed was to consume
> buffers.
> 
> For devices that don't actually contain memory there is no
> reason to be an exporter. What most want is just to consume
> normal system memory. Or system memory with some constraints
> (e.g. contiguous, coherent, restricted, etc..).

... secure, accessible only to the camera and video encoder, ... or
accessible only to the video decoder and the display unit. Who specifies
those restrictions? Can we express them in a platform-neutral way?

> 
> > I have a feeling (I might be completely wrong here) that by using
> > generic dma-buf heaps we can easily end up in a situation when the
> > userspace depends heavily on the actual platform being used (to map the
> > platform to heap names). I think we should instead depend on the
> > existing devices (e.g. if there is a TEE device, use an IOCTL to
> > allocate secured DMA BUF from it, otherwise check for QTEE device,
> > otherwise check for some other vendor device).
> > 
> > The mental experiment to check if the API is correct is really simple:
> > Can you use exactly the same rootfs on several devices without
> > any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualcomm
> > laptop, etc)?
> > 
> 
> This is a great north star to follow. And exactly the reason we should
> *not* be exposing device specific constraints to userspace. The constrains
> change based on the platform. So a userspace would have to also pick
> a different set of constraints based on each platform.

Great, I totally agree here.

> Userspace knows which subsystems it will attach a buffer, and the
> kernel knows what constraints those devices have on a given platform.
> Ideal case is then allocate from the one exporter, attach to various
> devices, and have the constraints solved at map time by the exporter
> based on the set of attached devices.
> 
> For example, on one platform the display needs contiguous buffers,
> but on a different platform the display can scatter-gather. So
> what heap should our generic application allocate from when it
> wants a buffer consumable by the display, CMA or System?
> Answer *should* be always use the generic exporter, and that
> exporter then picks the right backing type based on the platform.

The display can support scather-gather, the GPU needs bigger stride for
this particular format and the video encoder decoder can not support SG.
Which set of constraints and which buffer size should generic exporter
select?

> Userspace shouldn't be dealing with any of these constraints
> (looking back, adding the CMA heap was probably incorrect,
> and the System heap should have been the only one. Idea back
> then was a userspace helper would show up to do the constraint
> solving and pick the right heap. That has yet to materialize and
> folks are still just hardcoding which heap to use..).
> 
> Same for this restricted heap, I'd like to explore if we can
> enhance the System heap such that when attached to the TEE framework,
> the backing memory is either made restricted by fire-walling,
> or allocating from a TEE carveout (based on platform).

Firewalling from which devices? Or rather allowing access from which
devices? Is it possible to specify that somehow?

> This will mean more inter-subsystem coordination, but we can
> iterate on these in kernel interfaces. We cannot iterate on
> userspace interfaces, those have to be correct the first time.
> 
> Andrew
> 
> [0] https://www.kernel.org/doc/html/next/iio/iio_dmabuf_api.html
> 
> > > 
> > > This can be tested on QEMU with the following steps:
> > > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> > >          -b prototype/sdp-v1
> > > repo sync -j8
> > > cd build
> > > make toolchains -j4
> > > make all -j$(nproc)
> > > make run-only
> > > # login and at the prompt:
> > > xtest --sdp-basic
> > > 
> > > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > > list dependencies needed to build the above.
> > > 
> > > The tests are pretty basic, mostly checking that a Trusted Application in
> > > the secure world can access and manipulate the memory.
> > 
> > - Can we test that the system doesn't crash badly if user provides
> >    non-secured memory to the users which expect a secure buffer?
> > 
> > - At the same time corresponding entities shouldn't decode data to the
> >    buffers accessible to the rest of the sytem.
> > 
> > > 
> > > Cheers,
> > > Jens
> > > 
> > > [1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
> > > [2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/
> > > 
> > > Changes since Olivier's post [2]:
> > > * Based on Yong Wu's post [1] where much of dma-buf handling is done in
> > >    the generic restricted heap
> > > * Simplifications and cleanup
> > > * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
> > >    support"
> > > * Replaced the word "secure" with "restricted" where applicable
> > > 
> > > Etienne Carriere (1):
> > >    tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> > > 
> > > Jens Wiklander (2):
> > >    dma-buf: heaps: restricted_heap: add no_map attribute
> > >    dma-buf: heaps: add Linaro restricted dmabuf heap support
> > > 
> > > Olivier Masse (1):
> > >    dt-bindings: reserved-memory: add linaro,restricted-heap
> > > 
> > >   .../linaro,restricted-heap.yaml               |  56 ++++++
> > >   drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > >   drivers/dma-buf/heaps/Makefile                |   1 +
> > >   drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
> > >   drivers/dma-buf/heaps/restricted_heap.h       |   2 +
> > >   .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
> > >   drivers/tee/tee_core.c                        |  38 ++++
> > >   drivers/tee/tee_shm.c                         | 104 ++++++++++-
> > >   include/linux/tee_drv.h                       |  11 ++
> > >   include/uapi/linux/tee.h                      |  29 +++
> > >   10 files changed, 426 insertions(+), 7 deletions(-)
> > >   create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
> > >   create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 

-- 
With best wishes
Dmitry

