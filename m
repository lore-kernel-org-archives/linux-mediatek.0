Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E3FCDD1D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 19:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2tg8OU6eAd7XdNvSYc+LJitu1DCYWL+a/jnG4hrEak=; b=BFHqDMSPXRyRhSDQef5naXG2Gu
	fwXUNkV4sZ3QBZF7HZE9x+1qzV9Bo8hPz/BWDcVyM7GALawSg4w6EGWnSS57/3EvUYUeYSWjddC7f
	CuzO0xrTNLoU2r4/geDQzatmpUw/IfaM83iNaXyseNyVd3fQLnh2KvyqIzPt4ZrKi3qeBJ/jiASR/
	VZQNQBoHlbwWs0FHOEehNeyk58AR80Amer5GympqKO9c2Sxwe1GlOIQOiiZNknmiNNEOOi7dBT/qn
	09HZBO55BjQC4VtceX/GbDh2A0H9TVPl8KJuFS4TuwCIiR4c4UwMKlCleNw49em+dhwNalshMbv9F
	FGRUJVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suGyi-0000000Byqx-0eEZ;
	Fri, 27 Sep 2024 19:50:12 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suGyf-0000000Bypo-17MY
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Sep 2024 19:50:11 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6c548eb3354so18960506d6.2
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Sep 2024 12:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1727466607; x=1728071407; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U2tg8OU6eAd7XdNvSYc+LJitu1DCYWL+a/jnG4hrEak=;
        b=1HSl24hNORduLC0234RpD+s6k66tjR4FVDmcffG0T0RYzx9pX4WVsO/6lsegALaJyl
         i17h5VVk52fmVF20sSs+KaXQfnztgPVhSs2lQm3oUFBbj1zulCUx3DMzZ3AbRyTHSXDC
         gxTvvBd9OauOMX/A5rz9BN2p8fJxORQCOhzukhxuuC3r8rjose/ntrpXbS2wtofSuuxk
         5KJXpj0eDp+zVTIkLEtVk2vNeUFvLRglXwSdiKBAGTmNz5PwXPVxoT6PkXTvugBTB6/C
         W+97UygNnCVRFGwfKJQ8jMu+CjYzhqlcrapZLt5SA8e7B4Z0HfVGXE6O5++dF7SjsOez
         MsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727466607; x=1728071407;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U2tg8OU6eAd7XdNvSYc+LJitu1DCYWL+a/jnG4hrEak=;
        b=v/DcaZcO3gl4wXsaBRUQ5R8ICmcWfvx6PIP6EcudExqA5fMG9299UrJwpB6oEVnm+4
         R/p705j/vFlVqTpEPdLAGcc8gMbSvHEwRFI1SRbe1sHqwhNWAIw7G0pyswFGf6q0YycI
         zecScj1d3GTosxl86EFV3gOx7KLBoVBK+wedQhpd//HDtKBlXPK+WB7ieMjPcZgJHG8V
         98ui+o0UqaqgvGTtvwbAr+xokZKY3BNYHX96oeSukj+mcxevbQ6WL7No64gP/4Zl2Z1R
         f6EXlb7nNql2jm83rS5X2AYi/yedy4/p7sT/iHokMTI7L7H6fyZ6plgFsnLA0fc88HCl
         wrDA==
X-Forwarded-Encrypted: i=1; AJvYcCXJwy9KYzQnruOWQWLDtiAOkSZjl5K9QuLwYluyA1IJp11CzwDNTuNyLr7NEjE4GIGkSAL8uqYCFDUQ2639dw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxZodS7Hz6Bkb3sLgSQqjo1W6PPAX2K7bmm1iWrzUxcgwDSi2B
	AsDyRxTagxKc5fbnAthondAg2RFlMq+hNiT1Yyt3br8mQ2/ElccLB5sHXD79/7k=
X-Google-Smtp-Source: AGHT+IE8GLjUnXh75USL6POTL0wF3GhP3RbPQsW20Tmjvx9gUrkr/ENH4ZzNWvAis54wTSGF58cLZw==
X-Received: by 2002:a05:6214:3d8a:b0:6cb:32ef:d55f with SMTP id 6a1803df08f44-6cb3b5b7ef0mr80052226d6.6.1727466607342;
        Fri, 27 Sep 2024 12:50:07 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::580])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b610b12sm12230896d6.39.2024.09.27.12.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 12:50:06 -0700 (PDT)
Message-ID: <7c9e3a1a6092f6574c17d7206767ece0bcefc81f.camel@ndufresne.ca>
Subject: Re: [Linaro-mm-sig] Re: [RFC PATCH 0/4] Linaro restricted heap
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sumit Garg <sumit.garg@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
  Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Andrew Davis <afd@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,  Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Date: Fri, 27 Sep 2024 15:50:05 -0400
In-Reply-To: <CAFA6WYMd46quafJoGXjkCiPOKpYoDZdXwrNbG3QekyjB3_2FTA@mail.gmail.com>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
	 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
	 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
	 <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
	 <e967e382-6cca-4dee-8333-39892d532f71@gmail.com>
	 <lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas>
	 <04caa788-19a6-4336-985c-4eb191c24438@amd.com>
	 <2f9a4abe-b2fc-4bc7-9926-1da2d38f5080@linaro.org>
	 <CAFA6WYMd46quafJoGXjkCiPOKpYoDZdXwrNbG3QekyjB3_2FTA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_125009_345063_2FB02A2B 
X-CRM114-Status: GOOD (  59.50  )
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

Le jeudi 26 septembre 2024 =C3=A0 19:22 +0530, Sumit Garg a =C3=A9crit=C2=
=A0:
> [Resend in plain text format as my earlier message was rejected by
> some mailing lists]
>=20
> On Thu, 26 Sept 2024 at 19:17, Sumit Garg <sumit.garg@linaro.org> wrote:
> >=20
> > On 9/25/24 19:31, Christian K=C3=B6nig wrote:
> >=20
> > Am 25.09.24 um 14:51 schrieb Dmitry Baryshkov:
> >=20
> > On Wed, Sep 25, 2024 at 10:51:15AM GMT, Christian K=C3=B6nig wrote:
> >=20
> > Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
> >=20
> > On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
> >=20
> > On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
> >=20
> > Hi,
> >=20
> > On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> >=20
> > Hi,
> >=20
> > This patch set is based on top of Yong Wu's restricted heap patch set [=
1].
> > It's also a continuation on Olivier's Add dma-buf secure-heap patch set=
 [2].
> >=20
> > The Linaro restricted heap uses genalloc in the kernel to manage the he=
ap
> > carvout. This is a difference from the Mediatek restricted heap which
> > relies on the secure world to manage the carveout.
> >=20
> > I've tried to adress the comments on [2], but [1] introduces changes so=
 I'm
> > afraid I've had to skip some comments.
> >=20
> > I know I have raised the same question during LPC (in connection to
> > Qualcomm's dma-heap implementation). Is there any reason why we are
> > using generic heaps instead of allocating the dma-bufs on the device
> > side?
> >=20
> > In your case you already have TEE device, you can use it to allocate an=
d
> > export dma-bufs, which then get imported by the V4L and DRM drivers.
> >=20
> > This goes to the heart of why we have dma-heaps in the first place.
> > We don't want to burden userspace with having to figure out the right
> > place to get a dma-buf for a given use-case on a given hardware.
> > That would be very non-portable, and fail at the core purpose of
> > a kernel: to abstract hardware specifics away.
> >=20
> > Unfortunately all proposals to use dma-buf heaps were moving in the
> > described direction: let app select (somehow) from a platform- and
> > vendor- specific list of dma-buf heaps. In the kernel we at least know
> > the platform on which the system is running. Userspace generally doesn'=
t
> > (and shouldn't). As such, it seems better to me to keep the knowledge i=
n
> > the kernel and allow userspace do its job by calling into existing
> > device drivers.
> >=20
> > The idea of letting the kernel fully abstract away the complexity of in=
ter
> > device data exchange is a completely failed design. There has been plen=
ty of
> > evidence for that over the years.
> >=20
> > Because of this in DMA-buf it's an intentional design decision that
> > userspace and *not* the kernel decides where and what to allocate from.
> >=20
> > Hmm, ok.
> >=20
> > What the kernel should provide are the necessary information what type =
of
> > memory a device can work with and if certain memory is accessible or no=
t.
> > This is the part which is unfortunately still not well defined nor
> > implemented at the moment.
> >=20
> > Apart from that there are a whole bunch of intentional design decision =
which
> > should prevent developers to move allocation decision inside the kernel=
. For
> > example DMA-buf doesn't know what the content of the buffer is (except =
for
> > it's total size) and which use cases a buffer will be used with.
> >=20
> > So the question if memory should be exposed through DMA-heaps or a driv=
er
> > specific allocator is not a question of abstraction, but rather one of =
the
> > physical location and accessibility of the memory.
> >=20
> > If the memory is attached to any physical device, e.g. local memory on =
a
> > dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose the
> > memory as device specific allocator.
> >=20
> > So, for embedded systems with unified memory all buffers (maybe except
> > PCIe BARs) should come from DMA-BUF heaps, correct?
> >=20
> >=20
> > From what I know that is correct, yes. Question is really if that will =
stay this way.
> >=20
> > Neural accelerators look a lot stripped down FPGAs these days and the b=
enefit of local memory for GPUs is known for decades.
> >=20
> > Could be that designs with local specialized memory see a revival any t=
ime, who knows.
> >=20
> > If the memory is not physically attached to any device, but rather just
> > memory attached to the CPU or a system wide memory controller then expo=
se
> > the memory as DMA-heap with specific requirements (e.g. certain sized p=
ages,
> > contiguous, restricted, encrypted, ...).
> >=20
> > Is encrypted / protected a part of the allocation contract or should it
> > be enforced separately via a call to TEE / SCM / anything else?
> >=20
> >=20
> > Well that is a really good question I can't fully answer either. From w=
hat I know now I would say it depends on the design.
> >=20
>=20
> IMHO, I think Dmitry's proposal to rather allow the TEE device to be
> the allocator and exporter of DMA-bufs related to restricted memory
> makes sense to me. Since it's really the TEE implementation (OP-TEE,
> AMD-TEE, TS-TEE or future QTEE) which sets up the restrictions on a
> particular piece of allocated memory. AFAIK, that happens after the
> DMA-buf gets allocated and then user-space calls into TEE to set up
> which media pipeline is going to access that particular DMA-buf. It
> can also be a static contract depending on a particular platform
> design.

When the memory get the protection is hardware specific. Otherwise the desi=
gn
would be really straightforward, allocate from the a heap or any random dri=
ver
API and protect that memory through an call into the TEE. Clear seperation =
would
be amazingly better, but this is not how hardware and firmware designer hav=
e
seen it.=20

In some implementation, there is a carving of memory that be protected befo=
re
the kernel is booted. I believe (but I'm not affiliated with them) that MTK=
 has
hardware restriction making that design the only usable method.

In general, the handling of secure memory is bound to the TEE application f=
or
the specific platform, it has to be separated from the generic part of tee
drivers anyway, and dmabuf heaps is in my opinion the right API for the tas=
k.

On MTK, if you have followed, when the SCP (their co-processor) is handling
restricted video, you can't even call into it anymore directly. So to drive=
 the
CODECs, everything has to be routed through the TEE. Would you say that bec=
ause
of that this should not be a V4L2 driver anymore ?

>=20
> As Jens noted in the other thread, we already manage shared memory
> allocations (from a static carve-out or dynamically mapped) for
> communications among Linux and TEE that were based on DMA-bufs earlier
> but since we didn't required them to be shared with other devices, so
> we rather switched to anonymous memory.
>=20
> From user-space perspective, it's cleaner to use TEE device IOCTLs for
> DMA-buf allocations since it already knows which underlying TEE
> implementation it's communicating with rather than first figuring out
> which DMA heap to use for allocation and then communicating with TEE
> implementation.

As a user-space developer in the majority of my time, adding common code to
handle dma heaps is a lot easier and straight forward then having to glue a=
ll
the different allocators implement in various subsystems. Communicating whi=
ch
heap to work can be generic and simple.

Nicolas


