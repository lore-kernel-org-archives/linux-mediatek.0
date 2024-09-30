Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630C5CF649D
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 06:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/g7wcCRzbGOfKggOUpSf67kFofiDrk/MwfNEDFyqkIs=; b=j1yWb2hOZWbJ8kpANkWPuj37en
	QC24Tuj/Ppn8uBcLnhQQ4zOlPPHVRZPZGJSsQDvF2AmCNFlmhPTiiQL99Y4sBf1l9VoXuimVWkn8v
	LeAhuUwQtwiTcXJtvqN3WMCxK5oF9hc4hIqnWGT75AQdFfnrRRLA+1iPLprAfqlIWEIWhgaCc0HOa
	GfAvZOjwCW1xuyMbUUeBSRSjowlbLqvPhAiYswKaFJZzMAJcQk6VtUlb8LBhGOiU7XkgMxGN/dIbm
	ssuODKQZOCABj4QYTehw6f1xRKoUla6N6Tb2nOpnWbRngKO7j1/edze6nn+VnhKEE70iMNB7OlID/
	idKQCxRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svACT-0000000G6Qz-1ECy;
	Mon, 30 Sep 2024 06:48:05 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svACP-0000000G6Q0-3dqJ
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Sep 2024 06:48:03 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-84e85014badso1249676241.1
        for <linux-mediatek@lists.infradead.org>; Sun, 29 Sep 2024 23:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727678880; x=1728283680; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/g7wcCRzbGOfKggOUpSf67kFofiDrk/MwfNEDFyqkIs=;
        b=u7YAG/uqXB7tBO7cYIBAHR4TkK8OFYjuguTYQZydoqd//qKk6ihE3vRW90p/r1gO0E
         SFZwjVR/0qfA/qsgeDisgyM1eM8hU1c5cMtk1xLaS1dHbnLMYF4tjDIRYRnOjakisEcl
         XvG4X7SKp5VbwrfqTf2EahDpK4Qz4yU+DrwezM93UlaLqM6HI2/2AMjsVGPFr6cqUf9N
         UWPs0fpDhampCfHRN4HoBZHtaoCmxpmEAIfeWreMTQT2v0hXVuLpOLLmOn+PO60QNgFA
         5iok+3b6yvgT4NA7t8sg4/8kZwRDDJwhid2LQzQsWqimzl9XJB5r9DNmJO2YEaNWykT9
         PA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727678880; x=1728283680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/g7wcCRzbGOfKggOUpSf67kFofiDrk/MwfNEDFyqkIs=;
        b=kVwJUSA0hcBIigwpoZKAXYKhLWcrWxDxBUID2rYpB/hqEztQWiQcj8FJUcP0ik7xAb
         rlmRrJ+hEccwkQKX5Q1W39O2IPdkfH/77Oa1RZgjrWdb+U7/ww4DyKl0H2gNaFdbeuw/
         kxfeNaIQWBaIdA1rQqrXUhq/sJkkdZd7KO5Iqvan4S1n6Dvj4rgeLjXuL7da8eaaR4m/
         CymoKKq2f2bzjKvMjr3OQvPAnYuxt+V3rkykyaxCn/kAjzRyT+qevTewkKy5zR70I9qo
         m7HT3HiJolt4fqVtRIOCSgeMF5do5lef569bz0eaD1/j5trsZoYfgziq3x6LimyUHCnr
         qJAg==
X-Forwarded-Encrypted: i=1; AJvYcCU5ODhfHKMCBNQKa3sliu3KAUEbcByghT2WtMsLZvNkq6eVhPkW5SVwX1ge1/W6ZxZR6XL1RwpuuSuzz30Nqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOCPfle1JiPplrpwtNZEB5guzJAHoizxzYXV1GOv0OrGU5vcVR
	+Pjq2piczIHfTiO+nWUF+mcZDrYeQnnU4BRpXcNEbBpaMvCMyBZIZMSZjyqRX4XNL3LzeBOofDk
	YgKkSHYQhgszn6FrQqx5OIBT0oh64SBHKbsNq7Q==
X-Google-Smtp-Source: AGHT+IENLg636fnVEFtXZnVhYI/GV41eTTwvpGWanS5Q2ZuCDFhgWVQXRcNuHd6kGYhdZRRAC+0Sh6m6yruVp+iycL0=
X-Received: by 2002:a05:6102:2ac7:b0:493:f097:e5b7 with SMTP id
 ada2fe7eead31-4a2cefd1c4bmr7333978137.1.1727678880054; Sun, 29 Sep 2024
 23:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com> <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
 <e967e382-6cca-4dee-8333-39892d532f71@gmail.com> <lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas>
 <04caa788-19a6-4336-985c-4eb191c24438@amd.com> <2f9a4abe-b2fc-4bc7-9926-1da2d38f5080@linaro.org>
 <CAFA6WYMd46quafJoGXjkCiPOKpYoDZdXwrNbG3QekyjB3_2FTA@mail.gmail.com> <7c9e3a1a6092f6574c17d7206767ece0bcefc81f.camel@ndufresne.ca>
In-Reply-To: <7c9e3a1a6092f6574c17d7206767ece0bcefc81f.camel@ndufresne.ca>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 30 Sep 2024 12:17:47 +0530
Message-ID: <CAFA6WYPtp3H5JhxzgH9=z2EvNL7Kdku3EmG1aDkTS-gjFtNZZA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [RFC PATCH 0/4] Linaro restricted heap
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Andrew Davis <afd@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_234801_968597_528AB242 
X-CRM114-Status: GOOD (  69.72  )
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

On Sat, 28 Sept 2024 at 01:20, Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
>
> Le jeudi 26 septembre 2024 =C3=A0 19:22 +0530, Sumit Garg a =C3=A9crit :
> > [Resend in plain text format as my earlier message was rejected by
> > some mailing lists]
> >
> > On Thu, 26 Sept 2024 at 19:17, Sumit Garg <sumit.garg@linaro.org> wrote=
:
> > >
> > > On 9/25/24 19:31, Christian K=C3=B6nig wrote:
> > >
> > > Am 25.09.24 um 14:51 schrieb Dmitry Baryshkov:
> > >
> > > On Wed, Sep 25, 2024 at 10:51:15AM GMT, Christian K=C3=B6nig wrote:
> > >
> > > Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
> > >
> > > On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
> > >
> > > On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
> > >
> > > Hi,
> > >
> > > On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> > >
> > > Hi,
> > >
> > > This patch set is based on top of Yong Wu's restricted heap patch set=
 [1].
> > > It's also a continuation on Olivier's Add dma-buf secure-heap patch s=
et [2].
> > >
> > > The Linaro restricted heap uses genalloc in the kernel to manage the =
heap
> > > carvout. This is a difference from the Mediatek restricted heap which
> > > relies on the secure world to manage the carveout.
> > >
> > > I've tried to adress the comments on [2], but [1] introduces changes =
so I'm
> > > afraid I've had to skip some comments.
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
> > > This goes to the heart of why we have dma-heaps in the first place.
> > > We don't want to burden userspace with having to figure out the right
> > > place to get a dma-buf for a given use-case on a given hardware.
> > > That would be very non-portable, and fail at the core purpose of
> > > a kernel: to abstract hardware specifics away.
> > >
> > > Unfortunately all proposals to use dma-buf heaps were moving in the
> > > described direction: let app select (somehow) from a platform- and
> > > vendor- specific list of dma-buf heaps. In the kernel we at least kno=
w
> > > the platform on which the system is running. Userspace generally does=
n't
> > > (and shouldn't). As such, it seems better to me to keep the knowledge=
 in
> > > the kernel and allow userspace do its job by calling into existing
> > > device drivers.
> > >
> > > The idea of letting the kernel fully abstract away the complexity of =
inter
> > > device data exchange is a completely failed design. There has been pl=
enty of
> > > evidence for that over the years.
> > >
> > > Because of this in DMA-buf it's an intentional design decision that
> > > userspace and *not* the kernel decides where and what to allocate fro=
m.
> > >
> > > Hmm, ok.
> > >
> > > What the kernel should provide are the necessary information what typ=
e of
> > > memory a device can work with and if certain memory is accessible or =
not.
> > > This is the part which is unfortunately still not well defined nor
> > > implemented at the moment.
> > >
> > > Apart from that there are a whole bunch of intentional design decisio=
n which
> > > should prevent developers to move allocation decision inside the kern=
el. For
> > > example DMA-buf doesn't know what the content of the buffer is (excep=
t for
> > > it's total size) and which use cases a buffer will be used with.
> > >
> > > So the question if memory should be exposed through DMA-heaps or a dr=
iver
> > > specific allocator is not a question of abstraction, but rather one o=
f the
> > > physical location and accessibility of the memory.
> > >
> > > If the memory is attached to any physical device, e.g. local memory o=
n a
> > > dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose th=
e
> > > memory as device specific allocator.
> > >
> > > So, for embedded systems with unified memory all buffers (maybe excep=
t
> > > PCIe BARs) should come from DMA-BUF heaps, correct?
> > >
> > >
> > > From what I know that is correct, yes. Question is really if that wil=
l stay this way.
> > >
> > > Neural accelerators look a lot stripped down FPGAs these days and the=
 benefit of local memory for GPUs is known for decades.
> > >
> > > Could be that designs with local specialized memory see a revival any=
 time, who knows.
> > >
> > > If the memory is not physically attached to any device, but rather ju=
st
> > > memory attached to the CPU or a system wide memory controller then ex=
pose
> > > the memory as DMA-heap with specific requirements (e.g. certain sized=
 pages,
> > > contiguous, restricted, encrypted, ...).
> > >
> > > Is encrypted / protected a part of the allocation contract or should =
it
> > > be enforced separately via a call to TEE / SCM / anything else?
> > >
> > >
> > > Well that is a really good question I can't fully answer either. From=
 what I know now I would say it depends on the design.
> > >
> >
> > IMHO, I think Dmitry's proposal to rather allow the TEE device to be
> > the allocator and exporter of DMA-bufs related to restricted memory
> > makes sense to me. Since it's really the TEE implementation (OP-TEE,
> > AMD-TEE, TS-TEE or future QTEE) which sets up the restrictions on a
> > particular piece of allocated memory. AFAIK, that happens after the
> > DMA-buf gets allocated and then user-space calls into TEE to set up
> > which media pipeline is going to access that particular DMA-buf. It
> > can also be a static contract depending on a particular platform
> > design.
>
> When the memory get the protection is hardware specific. Otherwise the de=
sign
> would be really straightforward, allocate from the a heap or any random d=
river
> API and protect that memory through an call into the TEE. Clear seperatio=
n would
> be amazingly better, but this is not how hardware and firmware designer h=
ave
> seen it.
>
> In some implementation, there is a carving of memory that be protected be=
fore
> the kernel is booted. I believe (but I'm not affiliated with them) that M=
TK has
> hardware restriction making that design the only usable method.

Yeah I agree with that. The point I am making here is that the TEE
subsystem can abstract all that platform/vendor specific methods for
user-space to allocate restricted memory. We already have a similar
infrastructure for shared memory among Linux and TEE implementation.
The user-space only uses TEE_IOC_SHM_ALLOC [1] where underneath it can
either allocate from static carveout of shared memory (as a reserved
memory region) OR simply allocate from the kernel heap which is
dynamically mapped into the TEE implementation. The choice here
depends on the platform/TEE implementation capability.

[1] https://docs.kernel.org/userspace-api/tee.html

>
> In general, the handling of secure memory is bound to the TEE application=
 for
> the specific platform, it has to be separated from the generic part of te=
e
> drivers anyway,

It is really the TEE implementation core which has the privileges to
mark a piece of memory as restricted/secure. The TEE application in
MTK is likely a pseudo TA (a terminology similar to Linux kernel
modules in the TEE world). So it is rather easier for TEE
implementation drivers to abstract out the communication with the
vendor specific TEE core implementation.

> and dmabuf heaps is in my opinion the right API for the task.

Do you really think it is better for user-space to deal with vendor
specific dmabuf heaps?

>
> On MTK, if you have followed, when the SCP (their co-processor) is handli=
ng
> restricted video, you can't even call into it anymore directly. So to dri=
ve the
> CODECs, everything has to be routed through the TEE. Would you say that b=
ecause
> of that this should not be a V4L2 driver anymore ?

I am not conversant with the MTK hardware/firmware implementation. But
my point is the kernel shouldn't be exposing 10s of vendor specific
DMAbuf heaps to the user-space to choose from which can rather be just
a single TEE device IOCTL used to allocate restricted memory.

>
> >
> > As Jens noted in the other thread, we already manage shared memory
> > allocations (from a static carve-out or dynamically mapped) for
> > communications among Linux and TEE that were based on DMA-bufs earlier
> > but since we didn't required them to be shared with other devices, so
> > we rather switched to anonymous memory.
> >
> > From user-space perspective, it's cleaner to use TEE device IOCTLs for
> > DMA-buf allocations since it already knows which underlying TEE
> > implementation it's communicating with rather than first figuring out
> > which DMA heap to use for allocation and then communicating with TEE
> > implementation.
>
> As a user-space developer in the majority of my time, adding common code =
to
> handle dma heaps is a lot easier and straight forward then having to glue=
 all
> the different allocators implement in various subsystems. Communicating w=
hich
> heap to work can be generic and simple.

Yeah I agree with that notion but IMHO having ifdefry to select vendor
specific DMA heaps isn't something user-space should be dealing with.

-Sumit

>
> Nicolas
>

