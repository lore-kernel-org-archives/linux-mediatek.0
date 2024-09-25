Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0FAC369DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3P64Nuj8GlT9wDKZ+1u3zuMiJRKJGP8MnD/jd+llEk=; b=si43zLiMLR08tbjom0kjlMF9gL
	2gwBK/osWA6BoOBen5ahwEZvMuNwfB2YqGjNQYw31rxjIKWHG1mY8qKbRMmEOWKY3zpFlW91CadSF
	eGR0wh3iNojDr2xOffCEnVIlfkDhTPwl6TT8PiFSurFs4+mXWN76mXVEK2ryKmBYd45R8kPY9AkXP
	xYv9g2rydBOMHdToEo+zWn8GKttOCWY+AmypKXnAcHJw2PyfJ5Qw8z6q2ma0gBcA8OiS8CUdpOQ2y
	sl4xHFh62pMuXrmn4R9BwavuL2Nzne58+cTAn1wG0cveQezufVKzPx5lGQsUYeNIG8djckvrVpqPa
	mOYV4TxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stRXM-00000005FQI-356h;
	Wed, 25 Sep 2024 12:54:32 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stRWe-00000005F8l-0XJP
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 12:53:50 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-277f815e6dcso3490594fac.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 05:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727268827; x=1727873627; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3P64Nuj8GlT9wDKZ+1u3zuMiJRKJGP8MnD/jd+llEk=;
        b=oEvE/+1igWvy+rwfZGnJSXsmr9iMs27ZK4f+6lW+A2oxRf0hxFP6ZQzyeGW1a1GPQd
         kX+DRJIFyiSHaC2R3Qkd/5jHl8NLgVf+hf2G4JZqayDHS0ibPzOLqhB3GZ3EQHd7TYKg
         DgZwamuoG2ojAUulqIOokK+QkzXxBnP/XSRj6+IiGyg6ZU9dq0xZKLZmFKO9e6RR/lOm
         9r4cAmzfTIjvt5JMJPIo36yN7KIg09SlCeCTxjodSj54BCpesOT7+yaUwMXw2/JrwR7K
         leH4YqW4vWourc7gLCLaINCEGK74W+sb37BTpl90jnheyUwy7eANuNZn7qDh/o73F8YH
         CaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727268827; x=1727873627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3P64Nuj8GlT9wDKZ+1u3zuMiJRKJGP8MnD/jd+llEk=;
        b=vUi4eDGNzxRattpPckmSJWNrXraI9MAVp3mWVD4uVmLOL0KKp14VtH+TN/hVexdFAA
         Gd9OAXX6/Ljhc3Fabc8/2BVFw2/FRuy49s5gF/uUjyAGUi01JRRsDMsL5/RyjJNulgJL
         OitTrn8ndYmcoM2mwHRe0neYuolTXpXwASli0HQFsCoNxkcHhpH0eiT3VCgP1rjbPHFW
         Bd1jsMbyvsavOfpSdaXvM+SKfoUwJQlc30b1Pf2+5lSuKmu+f7XtcV4uyPG78xJ2FZxk
         eSefQLofXSoGsQlpyq7NAbyKSdl9N+SS92hSfnWytGUGxq1onomu9hWVJfgoyfItOtIF
         Jf8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEHdxIHmPCO+KP8ZvRvaiK/RKwoXiCey9ySB/D7oB0jJDUheqzPJmvbwQd0jalUHEG+Ae6TMhRe5Jat8ldTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKxxIJhSdhgkPR6phOve2FQ0BWB3kDR2a3p9kwE/NZrn6BfX+K
	mYCsYLzOxUtcC5c3ePGtEc8BAom/33Y4VZVJF8/42rZiGpBLRA+d/ovCys/wOFmJrUbhXhpBxkT
	qRH46lPdweqEhWTQ56Z0ouobirIi9VGtYGILMLw==
X-Google-Smtp-Source: AGHT+IHSJDI5zJNXgia6m+wvn3Z88Lm1Gqvx0KTAh7NQ/EUXrFKHeoOj7pRQGL8LyhcvQBz8DCABmsPEnqj7Sd60oPU=
X-Received: by 2002:a05:6870:5487:b0:277:f329:f111 with SMTP id
 586e51a60fabf-286e141f056mr1950128fac.22.1727268826783; Wed, 25 Sep 2024
 05:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <20240925071504.GA3519798@rayden> <bktt4yanmfn4gjljy2wxmigj6mncpga237oxyf4g4h2vxu2a3q@asnsn7smi4u2>
In-Reply-To: <bktt4yanmfn4gjljy2wxmigj6mncpga237oxyf4g4h2vxu2a3q@asnsn7smi4u2>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 25 Sep 2024 14:53:34 +0200
Message-ID: <CAHUa44EvgcUg0QFvwsgU6BSs_BtZg6bO_5rx3CJbyCUPbiQZXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_055348_218358_A515D882 
X-CRM114-Status: GOOD (  56.48  )
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

On Wed, Sep 25, 2024 at 1:41=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Sep 25, 2024 at 09:15:04AM GMT, Jens Wiklander wrote:
> > On Mon, Sep 23, 2024 at 09:33:29AM +0300, Dmitry Baryshkov wrote:
> > > Hi,
> > >
> > > On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> > > > Hi,
> > > >
> > > > This patch set is based on top of Yong Wu's restricted heap patch s=
et [1].
> > > > It's also a continuation on Olivier's Add dma-buf secure-heap patch=
 set [2].
> > > >
> > > > The Linaro restricted heap uses genalloc in the kernel to manage th=
e heap
> > > > carvout. This is a difference from the Mediatek restricted heap whi=
ch
> > > > relies on the secure world to manage the carveout.
> > > >
> > > > I've tried to adress the comments on [2], but [1] introduces change=
s so I'm
> > > > afraid I've had to skip some comments.
> > >
> > > I know I have raised the same question during LPC (in connection to
> > > Qualcomm's dma-heap implementation). Is there any reason why we are
> > > using generic heaps instead of allocating the dma-bufs on the device
> > > side?
> > >
> > > In your case you already have TEE device, you can use it to allocate =
and
> > > export dma-bufs, which then get imported by the V4L and DRM drivers.
> > >
> > > I have a feeling (I might be completely wrong here) that by using
> > > generic dma-buf heaps we can easily end up in a situation when the
> > > userspace depends heavily on the actual platform being used (to map t=
he
> > > platform to heap names). I think we should instead depend on the
> > > existing devices (e.g. if there is a TEE device, use an IOCTL to
> > > allocate secured DMA BUF from it, otherwise check for QTEE device,
> > > otherwise check for some other vendor device).
> >
> > That makes sense, it's similar to what we do with TEE_IOC_SHM_ALLOC
> > where we allocate from a carveout reserverd for shared memory with the
> > secure world. It was even based on dma-buf until commit dfd0743f1d9e
> > ("tee: handle lookup of shm with reference count 0").
> >
> > We should use a new TEE_IOC_*_ALLOC for these new dma-bufs to avoid
> > confusion and to have more freedom when designing the interface.
> >
> > >
> > > The mental experiment to check if the API is correct is really simple=
:
> > > Can you use exactly the same rootfs on several devices without
> > > any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualc=
omm
> > > laptop, etc)?
> >
> > No, I don't think so.
>
> Then the API needs to be modified.

I don't think that is enough. I would have answered no even without
the secure data path in mind. Communication with the secure world is
still too fragmented.

>
> Or the userspace needs to be modified in the way similar to Vulkan /
> OpenCL / glvnd / VA / VDPU: platform-specific backends, coexisting on a
> single rootfs.

Yes, that's likely a needed step. But the first step is to have
something to relate to upstream, without that there's only an
ever-changing downstream ABI.

>
> It is more or less fine to have platform-specific rootfs when we are
> talking about the embedded, resource-limited devices. But for the
> end-user devices we must be able to install a generic distro with no
> device-specific packages being selected.

I'm not sure we can solve that problem here. But we should of course
not make matters worse. In the restricted heap patch set which this
patchset builds on we define a way to allocate memory from a
restricted heap, but we leave the problem of finding the right heap to
userspace.

Thanks,
Jens

>
> >
> > >
> > > >
> > > > This can be tested on QEMU with the following steps:
> > > > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_=
v8.xml \
> > > >         -b prototype/sdp-v1
> > > > repo sync -j8
> > > > cd build
> > > > make toolchains -j4
> > > > make all -j$(nproc)
> > > > make run-only
> > > > # login and at the prompt:
> > > > xtest --sdp-basic
> > > >
> > > > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > > > list dependencies needed to build the above.
> > > >
> > > > The tests are pretty basic, mostly checking that a Trusted Applicat=
ion in
> > > > the secure world can access and manipulate the memory.
> > >
> > > - Can we test that the system doesn't crash badly if user provides
> > >   non-secured memory to the users which expect a secure buffer?
> > >
> > > - At the same time corresponding entities shouldn't decode data to th=
e
> > >   buffers accessible to the rest of the sytem.
> >
> > I'll a few tests along that.
> >
> > Thanks,
> > Jens
> >
> > >
> > > >
> > > > Cheers,
> > > > Jens
> > > >
> > > > [1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.w=
u@mediatek.com/
> > > > [2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse=
@nxp.com/
> > > >
> > > > Changes since Olivier's post [2]:
> > > > * Based on Yong Wu's post [1] where much of dma-buf handling is don=
e in
> > > >   the generic restricted heap
> > > > * Simplifications and cleanup
> > > > * New commit message for "dma-buf: heaps: add Linaro restricted dma=
buf heap
> > > >   support"
> > > > * Replaced the word "secure" with "restricted" where applicable
> > > >
> > > > Etienne Carriere (1):
> > > >   tee: new ioctl to a register tee_shm from a dmabuf file descripto=
r
> > > >
> > > > Jens Wiklander (2):
> > > >   dma-buf: heaps: restricted_heap: add no_map attribute
> > > >   dma-buf: heaps: add Linaro restricted dmabuf heap support
> > > >
> > > > Olivier Masse (1):
> > > >   dt-bindings: reserved-memory: add linaro,restricted-heap
> > > >
> > > >  .../linaro,restricted-heap.yaml               |  56 ++++++
> > > >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > > >  drivers/dma-buf/heaps/Makefile                |   1 +
> > > >  drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
> > > >  drivers/dma-buf/heaps/restricted_heap.h       |   2 +
> > > >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++=
++++
> > > >  drivers/tee/tee_core.c                        |  38 ++++
> > > >  drivers/tee/tee_shm.c                         | 104 ++++++++++-
> > > >  include/linux/tee_drv.h                       |  11 ++
> > > >  include/uapi/linux/tee.h                      |  29 +++
> > > >  10 files changed, 426 insertions(+), 7 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/reserved-memo=
ry/linaro,restricted-heap.yaml
> > > >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

