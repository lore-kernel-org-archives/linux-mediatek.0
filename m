Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE39C02198
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2025 18:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewgPkFmEX3mInvEnIhY/6iT5VC+yD3hq+wlM8kNCGHw=; b=pnHlz7GBXghH6IlqHaBSJZPNGo
	diHC5FrDxrFpAEqLc2Oj8/re4cKK/TUZ4P/9B/oHgylwWuv1Bp9zL0ROIcdHxax+JtfgY99pDHeoZ
	pGq28MTc+haDlgfTokB4MdqwtLEH1ahf66GbHtY9Py0XoyUSNutNx+oP/fZED3MMHW8bEL8rOM4Km
	U8gWJWYIFUkDt3qmT/hDMvxmKbI7ybK5dZCaGc0tZRX7i0gOtHwDlbFvcYbjrK3nticAkaMekvWYC
	6TtTwcd4yhJqO41OqkXsjctdyc4lwwCus35M8ffAPwsFmbk5CgqUS4bLzi09NM86cnNDi13TJnXkC
	UIHDIZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjun-00000004DgT-1Smb;
	Wed, 05 Feb 2025 18:14:21 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjuj-00000004Deo-30IN
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Feb 2025 18:14:20 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7b6edb82f85so1003993085a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Feb 2025 10:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738779256; x=1739384056; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ewgPkFmEX3mInvEnIhY/6iT5VC+yD3hq+wlM8kNCGHw=;
        b=vcBCyiiD+OghxCIuXCUf9Zh2ExO5bpjkIh2q9GBZS3nTHXcxIj3Twky2Fh5cxS/DKg
         bugp7xIO0AMAUQG12bSQxvQ+6hD2WsENy4zAZsqiEJDqxKGu1hJVlrE04YZAbBc5XN/q
         E9vi213rRabEHDdEPgSrPXIadpGEajW8Ao/PFJ5/zNQb6MLmisr71BIXKKX7k9Do0x5i
         68cMSCgHi7NO8xcuBlsFN93e2xo4tiDqiQtaQE8549BujHWyvrPHaeNbtLaSxRkx3sRQ
         qUaf5Ctexzv1pORykeeCbLCraRD3GphvaISkWSid/lEDCkaMOPyFwZcqek0KnV4TV6sG
         X1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738779256; x=1739384056;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ewgPkFmEX3mInvEnIhY/6iT5VC+yD3hq+wlM8kNCGHw=;
        b=mJ5sz7cbOpRVZWLeDJYs7HAfXZeXBL1LM9slMR31/hDwj0hJGKuPeaqwjDvSe5AGYs
         PjlO4fOMi1DCrjc21uil14OYNJWcTiZlBD6KxKnKPZlBKMjF8vKig11bdZjChU8lKt3q
         cLKNGVXWs+0S2YJ6bBnrN4rAe7puriGfdtqFK5W8b7sPXPYIO9zbtUHkK1uv6Wd+Izgb
         OIxEsyXF1s8cn6wOzl+fuSr79CI+OeXIHiYFaWwXu1+/NR4x0wKYfaUjkWQNjdaxVT5X
         vWV52JgSYMBlYVNHV+UOKxz4jYk+d+4mI7CeSu+83sAVgbHniIvZeUSElZqip2nLCQd8
         jy2w==
X-Forwarded-Encrypted: i=1; AJvYcCWXlIei52Ed9dAP/JI2umrdihxsGKQ9+KlJFdMfTMZ3d0QgE0a6QWu1//X6xzv6oUMQB3x3Qk4UuYizmsgRGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAK+ZAwZImobn2raBCi3e0tbp8EboiEKa0D80XIFRHpX/KVJuP
	pHrjKwMjvs9d9Z8xVlZ8pXCU2H3w924CB22Wv3vYB3uWFzkL55EgxAqX6IMn+JQ=
X-Gm-Gg: ASbGncvMZ1t2xgc+U4Anh99YQ0CcIdjZNcBRlWcxVQ2oTVmWusv+RPQlB1lKnileiNA
	oEABNvWOSg+n+hZC12x8Et3N83IgQmB0kCkrEfsqyrcF2IXBsr/2IFUgVKqcv2kBzM3TwVkap9i
	3nAYnJf6/DjR6qixpWRhCmxHdJac73GBe9PzQxTItrQiFuHJhYgh2KLiOspNx7ZFPYFo3eysPrN
	Xt2gQ2cxDtE6UIqVlam0jPtdxYAVOaIs3SuGrj6DV89ALUda3NH6cAggrwIf4Hc/xdIwIxA9tkC
	LJ/w8zCNyw5vbBOX
X-Google-Smtp-Source: AGHT+IFnnl9J6glnO7ave49R6IT/Ma233dmOTJ29e9pjZONK8+NxUm972OtvZRgYYQ8KwgzNcY3a5Q==
X-Received: by 2002:a05:620a:d8c:b0:7be:3d2f:16fc with SMTP id af79cd13be357-7c03a029359mr549685385a.51.1738779255841;
        Wed, 05 Feb 2025 10:14:15 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a9047eesm781781685a.72.2025.02.05.10.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 10:14:15 -0800 (PST)
Message-ID: <2085fb785095dc5abdac2352adfb3e1e1c8ae549.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali
 CSF GPUs
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maxime Ripard <mripard@kernel.org>, Florent Tomasin
	 <florent.tomasin@arm.com>
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
Date: Wed, 05 Feb 2025 13:14:14 -0500
In-Reply-To: <20250205-amorphous-nano-agouti-b5baba@houat>
References: <cover.1738228114.git.florent.tomasin@arm.com>
	 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
	 <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
	 <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
	 <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
	 <1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
	 <20250205-amorphous-nano-agouti-b5baba@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_101417_758257_ED843B58 
X-CRM114-Status: GOOD (  49.02  )
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

Le mercredi 05 f=C3=A9vrier 2025 =C3=A0 15:52 +0100, Maxime Ripard a =C3=A9=
crit=C2=A0:
> On Mon, Feb 03, 2025 at 04:43:23PM +0000, Florent Tomasin wrote:
> > Hi Maxime, Nicolas
> >=20
> > On 30/01/2025 17:47, Nicolas Dufresne wrote:
> > > Le jeudi 30 janvier 2025 =C3=A0 17:38 +0100, Maxime Ripard a =C3=A9cr=
it=C2=A0:
> > > > Hi Nicolas,
> > > >=20
> > > > On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wrote:
> > > > > Le jeudi 30 janvier 2025 =C3=A0 14:46 +0100, Maxime Ripard a =C3=
=A9crit=C2=A0:
> > > > > > Hi,
> > > > > >=20
> > > > > > I started to review it, but it's probably best to discuss it he=
re.
> > > > > >=20
> > > > > > On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote=
:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > This is a patch series covering the support for protected mod=
e execution in
> > > > > > > Mali Panthor CSF kernel driver.
> > > > > > >=20
> > > > > > > The Mali CSF GPUs come with the support for protected mode ex=
ecution at the
> > > > > > > HW level. This feature requires two main changes in the kerne=
l driver:
> > > > > > >=20
> > > > > > > 1) Configure the GPU with a protected buffer. The system must=
 provide a DMA
> > > > > > >    heap from which the driver can allocate a protected buffer=
.
> > > > > > >    It can be a carved-out memory or dynamically allocated pro=
tected memory region.
> > > > > > >    Some system includes a trusted FW which is in charge of th=
e protected memory.
> > > > > > >    Since this problem is integration specific, the Mali Panth=
or CSF kernel
> > > > > > >    driver must import the protected memory from a device spec=
ific exporter.
> > > > > >=20
> > > > > > Why do you need a heap for it in the first place? My understand=
ing of
> > > > > > your series is that you have a carved out memory region somewhe=
re, and
> > > > > > you want to allocate from that carved out memory region your bu=
ffers.
> > > > > >=20
> > > > > > How is that any different from using a reserved-memory region, =
adding
> > > > > > the reserved-memory property to the GPU device and doing all yo=
ur
> > > > > > allocation through the usual dma_alloc_* API?
> > > > >=20
> > > > > How do you then multiplex this region so it can be shared between
> > > > > GPU/Camera/Display/Codec drivers and also userspace ?
> > > >=20
> > > > You could point all the devices to the same reserved memory region,=
 and
> > > > they would all allocate from there, including for their userspace-f=
acing
> > > > allocations.
> > >=20
> > > I get that using memory region is somewhat more of an HW description,=
 and
> > > aligned with what a DT is supposed to describe. One of the challenge =
is that
> > > Mediatek heap proposal endup calling into their TEE, meaning knowing =
the region
> > > is not that useful. You actually need the TEE APP guid and its IPC pr=
otocol. If
> > > we can dell drivers to use a head instead, we can abstract that SoC s=
pecific
> > > complexity. I believe each allocated addressed has to be mapped to a =
zone, and
> > > that can only be done in the secure application. I can imagine simila=
r needs
> > > when the protection is done using some sort of a VM / hypervisor.
> > >=20
> > > Nicolas
> > >=20
> >=20
> > The idea in this design is to abstract the heap management from the
> > Panthor kernel driver (which consumes a DMA buffer from it).
> >=20
> > In a system, an integrator would have implemented a secure heap driver,
> > and could be based on TEE or a carved-out memory with restricted access=
,
> > or else. This heap driver would be responsible of implementing the
> > logic to: allocate, free, refcount, etc.
> >=20
> > The heap would be retrieved by the Panthor kernel driver in order to
> > allocate protected memory to load the FW and allow the GPU to enter/exi=
t
> > protected mode. This memory would not belong to a user space process.
> > The driver allocates it at the time of loading the FW and initializatio=
n
> > of the GPU HW. This is a device globally owned protected memory.
>=20
> The thing is, it's really not clear why you absolutely need to have the
> Panthor driver involved there. It won't be transparent to userspace,
> since you'd need an extra flag at allocation time, and the buffers
> behave differently. If userspace has to be aware of it, what's the
> advantage to your approach compared to just exposing a heap for those
> secure buffers, and letting userspace allocate its buffers from there?

Unless I'm mistaken, the Panthor driver loads its own firmware. Since loadi=
ng
the firmware requires placing the data in a protected memory region, and th=
at
this aspect has no exposure to userspace, how can Panthor not be implicated=
 ?

>=20
> > When I came across this patch series:
> > -
> > https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.co=
m/#t
> > I found it could help abstract the interface between the secure heap an=
d
> > the integration of protected memory in Panthor.
> >=20
> > A kernel driver would have to find the heap: `dma_heap_find()`, then
> > request allocation of a DMA buffer from it. The heap driver would deal
> > with the specifities of the protected memory on the system.
>=20
> Sure, but we still have to address *why* it would be a good idea for the
> driver to do it in the first place. The mediatek series had the same
> feedback.

Which got pretty clear replies iirc. The drivers needs scratch buffers and
secondary buffers to be protected, and these are not visible to userspace. =
No
one have made a proper counter argument yet. In MTK, the remote-proc driver=
 for
the SCP (a multi-purpose multimedia co-processor) will also need to place t=
he
firmware data into a protected buffer (with the help of the tee to copy the=
 data
into it of course).

Nicolas

>=20
> Maxime


