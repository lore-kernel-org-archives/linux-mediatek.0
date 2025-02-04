Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1EAC02193
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Feb 2025 18:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tac0SuyxfkJEVndSE8YT8kHaqPS7Ds82fJ/2JoeM9mo=; b=ZHTpPG/gN9LKX1VzodWgua5Biz
	jKpWo4xxuKB6P61jvkB3hP39qbVqSTN4g0qhWVGo5GndCpJaGmZvELs+re7qWBjQ6mkTjQ6MQAgeH
	tNF9nQfZ1uxhfpiVolxWgaFghAGVDdXWvECP7/SMZtg0KghtYkJrmZbAuCiGsM3UFNitSkQX0XT2L
	PAqeCVJgUeixTiPLggXTyCkoyFrEYzUF+8urpz46uU7pd7QbGyKdIfV/eNrIzAUYjZFZFdLMTiJE0
	AylWhlgKr/nh8rNhApjtIEGNjfy8fEfb9APRsPinzeyXaRoekVIu/es/Ec1B37CK2rfKexlF+uMPo
	898OU0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNaE-00000001Ckw-0Jhr;
	Tue, 04 Feb 2025 18:23:38 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNZd-00000001Cf0-3Qs0
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Feb 2025 18:23:03 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6d89a727a19so709146d6.0
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Feb 2025 10:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738693380; x=1739298180; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tac0SuyxfkJEVndSE8YT8kHaqPS7Ds82fJ/2JoeM9mo=;
        b=BXEMUbHUDoYoH2cCSrq1ITmt9DQ6kRp8tlrITGNpBgwR0VxrKr+wwQq6GnS3Kf9aYY
         vIv7UxY4fAeIv2OyMJjzSMeWDrvHlZvuG1SmOIKujwei+caYbifaEtLP+eV+vc5O5lPv
         n9Ih8HRxFNnCkfP6zrAp5neM5YFz7jUe57DAjl5HWlKJqDLZNeS2pqTTlpcjsfaVX9y4
         vOKtNxPxAiK3nQFiOTgzRqF909ikuVdpFhP7fsVjbphpbgnWKhoh0PRznCLajkicnCLa
         957B3dsNbnrfYJwjBSgXOasAO4NQZIO54c94wCVFkWfnewEJ96vv/F7Ekql+dL7Y1JrW
         qQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738693380; x=1739298180;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tac0SuyxfkJEVndSE8YT8kHaqPS7Ds82fJ/2JoeM9mo=;
        b=w3+HK0otUhmp9m6slIT0aVG/GZVtRPkTXqcBgFoqXPKaarLuQK4zHIk3RTT/6s9eGk
         7OGxp8ATDiWq/8jMU2+n8gWwLLXuW8Mqbq3XNWke2GC4IJWfltPBlKvVysRAX7hHvdF9
         O+XoCs/mmDa1yc7sGRwFZaxNvRlm51g9xMi0qdWvoXgN1isBcqELPJcEZMAjt1HJdGMR
         p2P5A3ipxf6xNvJb7k33Cs4Am99Ex7GLDXsV0h1si4Y6Y151yTTg+e58Izc4SYAqXc2f
         PB0oZIUjZQpXOESnYIPhgp/Z7vbhDzHvRQNAVgK0lykDpPmINh+vIvaNYMuldhzHOBje
         CDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAqdEUda6mee0Lh3yuGvIvd0FHVKb3Z61ksTPgkmk7wc32O1Z8gYSCEBe6YQ05lwxbGE9Z2zcXfRTt6gM7gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEeuHAIeJv6bj7NcPEu9IyXLGQldL5256mLpwr6dOWnz+zFSJu
	0/MK/8+/wLhbkUZ2z38rG1btngnQuCbIGVinwyE/dRWYLo3e7kzg25C45/7M2xk=
X-Gm-Gg: ASbGncuyu5nGpdbqSJTDHKJoM3UIKfk0y9cvxKTzvDRcOspoaOk6L6EOL7TPBmXGbVM
	ABAfD8EBa6BKOyJ7jouGSo5x11s192tKkQt4ce4WfpbU/HVE3Hx6S5yZ5sza+aCOlWy6DMiVkiO
	Innetg+YbQYyac2P2PS7WuzwOyquTBfkKQRj8uh5WuE02YAQwk8PRfKNoNCd3MgtMwY8Wy2H5JK
	O4APg8hFoodW5bKBXa3/TZJLu/e5uPtqah4vfOT7/rmwVC58oZpakZNoRdEUFxgxbGYLZy4KuRO
	i6rm7BhthHXazjTg
X-Google-Smtp-Source: AGHT+IE/f1kxzWTc19HByUy9ODx9TdMIUe4LBdJWBN0eGiPy3I/9968X4R31P6i56Rq3iDSVWjRNWA==
X-Received: by 2002:ad4:5ecb:0:b0:6e2:3761:71b0 with SMTP id 6a1803df08f44-6e420f3b728mr78300806d6.5.1738693380393;
        Tue, 04 Feb 2025 10:23:00 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e423ca0476sm9418096d6.124.2025.02.04.10.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:23:00 -0800 (PST)
Message-ID: <c856a7059171bcc6afd6d829c6c025882855778b.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali
 CSF GPUs
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Florent Tomasin <florent.tomasin@arm.com>, Maxime Ripard
	 <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Boris
 Brezillon	 <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>,  Sumit Semwal <sumit.semwal@linaro.org>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey	
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier"	 <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, nd@arm.com, Akash Goel
 <akash.goel@arm.com>
Date: Tue, 04 Feb 2025 13:22:58 -0500
In-Reply-To: <1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
	 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
	 <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
	 <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
	 <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
	 <1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_102301_865602_2E5A5FDC 
X-CRM114-Status: GOOD (  51.64  )
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

Le lundi 03 f=C3=A9vrier 2025 =C3=A0 16:43 +0000, Florent Tomasin a =C3=A9c=
rit=C2=A0:
> Hi Maxime, Nicolas
>=20
> On 30/01/2025 17:47, Nicolas Dufresne wrote:
> > Le jeudi 30 janvier 2025 =C3=A0 17:38 +0100, Maxime Ripard a =C3=A9crit=
=C2=A0:
> > > Hi Nicolas,
> > >=20
> > > On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wrote:
> > > > Le jeudi 30 janvier 2025 =C3=A0 14:46 +0100, Maxime Ripard a =C3=A9=
crit=C2=A0:
> > > > > Hi,
> > > > >=20
> > > > > I started to review it, but it's probably best to discuss it here=
.
> > > > >=20
> > > > > On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > This is a patch series covering the support for protected mode =
execution in
> > > > > > Mali Panthor CSF kernel driver.
> > > > > >=20
> > > > > > The Mali CSF GPUs come with the support for protected mode exec=
ution at the
> > > > > > HW level. This feature requires two main changes in the kernel =
driver:
> > > > > >=20
> > > > > > 1) Configure the GPU with a protected buffer. The system must p=
rovide a DMA
> > > > > >    heap from which the driver can allocate a protected buffer.
> > > > > >    It can be a carved-out memory or dynamically allocated prote=
cted memory region.
> > > > > >    Some system includes a trusted FW which is in charge of the =
protected memory.
> > > > > >    Since this problem is integration specific, the Mali Panthor=
 CSF kernel
> > > > > >    driver must import the protected memory from a device specif=
ic exporter.
> > > > >=20
> > > > > Why do you need a heap for it in the first place? My understandin=
g of
> > > > > your series is that you have a carved out memory region somewhere=
, and
> > > > > you want to allocate from that carved out memory region your buff=
ers.
> > > > >=20
> > > > > How is that any different from using a reserved-memory region, ad=
ding
> > > > > the reserved-memory property to the GPU device and doing all your
> > > > > allocation through the usual dma_alloc_* API?
> > > >=20
> > > > How do you then multiplex this region so it can be shared between
> > > > GPU/Camera/Display/Codec drivers and also userspace ?
> > >=20
> > > You could point all the devices to the same reserved memory region, a=
nd
> > > they would all allocate from there, including for their userspace-fac=
ing
> > > allocations.
> >=20
> > I get that using memory region is somewhat more of an HW description, a=
nd
> > aligned with what a DT is supposed to describe. One of the challenge is=
 that
> > Mediatek heap proposal endup calling into their TEE, meaning knowing th=
e region
> > is not that useful. You actually need the TEE APP guid and its IPC prot=
ocol. If
> > we can dell drivers to use a head instead, we can abstract that SoC spe=
cific
> > complexity. I believe each allocated addressed has to be mapped to a zo=
ne, and
> > that can only be done in the secure application. I can imagine similar =
needs
> > when the protection is done using some sort of a VM / hypervisor.
> >=20
> > Nicolas
> >=20
>=20
> The idea in this design is to abstract the heap management from the
> Panthor kernel driver (which consumes a DMA buffer from it).
>=20
> In a system, an integrator would have implemented a secure heap driver,
> and could be based on TEE or a carved-out memory with restricted access,
> or else. This heap driver would be responsible of implementing the
> logic to: allocate, free, refcount, etc.
>=20
> The heap would be retrieved by the Panthor kernel driver in order to
> allocate protected memory to load the FW and allow the GPU to enter/exit
> protected mode. This memory would not belong to a user space process.
> The driver allocates it at the time of loading the FW and initialization
> of the GPU HW. This is a device globally owned protected memory.

This use case also applies well for codec. The Mediatek SCP firmware needs =
to be
loaded with a restricted memory too, its a very similar scenario, plus Medi=
atek
chips often include a Mali. On top of that, V4L2 codecs (in general) do nee=
d to
allocate internal scratch buffer for the IP to write to for things like mot=
ion
vectors, reconstruction frames, entropy statistics, etc. The IP will only b=
e
able to write if the memory is restricted.

Nicolas

>=20
> When I came across this patch series:
> -
> https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/=
#t
> I found it could help abstract the interface between the secure heap and
> the integration of protected memory in Panthor.
>=20
> A kernel driver would have to find the heap: `dma_heap_find()`, then
> request allocation of a DMA buffer from it. The heap driver would deal
> with the specifities of the protected memory on the system.
>=20
> > >=20
> > > > Also, how the secure memory is allocted / obtained is a process tha=
t
> > > > can vary a lot between SoC, so implementation details assumption
> > > > should not be coded in the driver.
> > >=20
> > > But yeah, we agree there, it's also the point I was trying to make :)
> > >=20
> > > Maxime
> >=20
>=20
> Agree with your point, the Panthor kernel driver may not be aware of the
> heap management logic. As an alternative to the DMA heap API used here,
> I also tried to expose the heap by passing the phandle of a "heap"
> device to Panthor. The reference to the DMA heap was stored as a private
> data of the heap device as a new type: `struct dma_heap_import_info`,
> similar to the existing type: `struct dma_heap_export_info`.
> This made me think it could be problematic, as the private data type
> would have to be cast before accessing it from the importer driver. I
> worried about a mis-use of the types with this approach.
>=20
> Regards,
> Florent


