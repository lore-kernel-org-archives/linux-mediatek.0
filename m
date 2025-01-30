Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC1C02193
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jan 2025 17:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2KnSOALVun40U0rx69PL5LHkQdFIbv2CoISnegMh7s=; b=tDTiP+dTGryXeixZGk12TSJu7t
	Ow/RxPfTJXUbgPCKfQfo8w2BvN54sRxEUjUIcJuvtlEsUyXsgqFwIILyk6Rb4jdv6vTeFQ9XglL3O
	FT+UrO6ahZML97eMJI1dGzkiXSEO5oYmksxmBOlRGQPnMc5yiA0OX26zKBySigvY056QMwkI/SvVq
	k0FKaF9FtICnCyreeCZKgR6lv6Is8IHns5SvCPzJyXtyYK1+xy4aybrasxE8Ly6l2lO+F6aYHsM3S
	M0xiL29jFlFaoZbQlf6Tm5OhrSOTRGA8o8a5dinYA1YsXmJEvB27mrLSfUj4UwL/DSMpDQxaliuOA
	OcDdbcGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYpM-00000009Lgd-2xAS;
	Thu, 30 Jan 2025 17:59:44 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYd8-00000009KBt-12I6
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Jan 2025 17:47:07 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6dd1b895541so22274346d6.0
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jan 2025 09:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738259225; x=1738864025; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M2KnSOALVun40U0rx69PL5LHkQdFIbv2CoISnegMh7s=;
        b=URbvoVXyycyfDBTIQw7RVC4VUGabuFSJCDYLoTyaDV89OIBUTxeKLPTgJentKxlIXM
         QMOj6NdeQdrhyoqrFBj75SpwLVVHolvlZT4soZJ6wHOM7i5oVLH6MlW4scltSC0dSuWv
         7zvBETIiyEHDyZMVvYSdgM/FqKm5GQk3X/yYomldh7Rs13Mooy/yOA4O1YzDB3fu4ucW
         jAACuvyYFoCB7pmH6cbPIBv36tdeczx72x9MBYn+iBw8Vjq31h9/UcQyiBoZsVdHe7ur
         r79U5LbD03tYLqlOhgCzC+xeOZ5urBUOgX9UtJIfWcV+XQsSL59NohdHrrXbDZlLaaRs
         Y8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738259225; x=1738864025;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2KnSOALVun40U0rx69PL5LHkQdFIbv2CoISnegMh7s=;
        b=rejOindgv66qeQn6o4vlq/+svNuI8ZVPHEHLBR3esIovjKyDBc65UyCqvHsmgEs48Z
         1eKaq9q5TVfDj5EVBSrSoESM2iv5gwDSBV3oqq6LWgCJOFQvJvH0gEVnySl6j4r3UijY
         rsTwC3CsnquMIYdinOmcBCUVUHqHkwW65YXXenvWxjiv07LPhFdvAKCpZKxN1uMt0BzB
         UgdKDwLS2Q8XrhkY20h/qtVg7hTHEMm2B/cMGR26+5RVVnXwxv4IrCx8pWpMUnyB5Mm0
         wUKdRJ88ZmbkUdO8DhICYyhYe5O+Ryur7NuhNT60O6ulEenrZYRyXtnQDAcYnfS/2V8R
         Nzhw==
X-Forwarded-Encrypted: i=1; AJvYcCWQFeR7p+DTkzJk7hNaSefWMMigrzH2SOezwbO3BGcSJWmgy+j1c8vH1Q1iv20FB2L4D7LgSZ1yoiHhUuQfcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyepP/0ShJptMY+69zYgipyu/8SwMxY2w+sJagngx6l4p9/rfgy
	5jYLcU8MnxhZ/qS8KuhLRnmBc2MB91mS0yv8ObLYDaOGkYLEKLnNcojnWtwK6Dc=
X-Gm-Gg: ASbGncsvMw0z9RgP5Gqbg5izcnXFKGeI1ZphzLjANF+5QEJgPoc5IogT94Lc22TqpIg
	cnUSG4q3qRH37ul/LH/48Ho7NIS2UzWVG9HNWlPLIuGumxVrXcRQrYmJMnFwO/pfTJi1AQ2ag82
	D0qwkcp9+7/ukXCQFshb9vPYmJY5kXX8a+52CLAHY7tQBl5semO+Qgl3/seyajo//vYlJWD8Hdb
	j4pKzVkypCFI234WLjhv5cNeSSgKJQbLPddOTdQ5xmaEYp8QIqR8Hg9kJcjwelnWSAylcNhJrbs
	EilAN/6TRffDdfoQ
X-Google-Smtp-Source: AGHT+IFb98ThAFaKwElwJF/sopgUxhTZjXeuvxkotRwiLF8RhVhCp7fJLzKCy+1eOfFzQ+qv/2X0Lw==
X-Received: by 2002:a05:6214:1d0e:b0:6d8:9124:8795 with SMTP id 6a1803df08f44-6e243b94159mr102405256d6.1.1738259224602;
        Thu, 30 Jan 2025 09:47:04 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e25481419fsm8430276d6.27.2025.01.30.09.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 09:47:04 -0800 (PST)
Message-ID: <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali
 CSF GPUs
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maxime Ripard <mripard@kernel.org>
Cc: Florent Tomasin <florent.tomasin@arm.com>, Vinod Koul
 <vkoul@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Boris Brezillon
 <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau	 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Benjamin
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
Date: Thu, 30 Jan 2025 12:47:02 -0500
In-Reply-To: <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
References: <cover.1738228114.git.florent.tomasin@arm.com>
	 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
	 <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
	 <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_094706_552336_0EDCBEEE 
X-CRM114-Status: GOOD (  32.45  )
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

Le jeudi 30 janvier 2025 =C3=A0 17:38 +0100, Maxime Ripard a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wrote:
> > Le jeudi 30 janvier 2025 =C3=A0 14:46 +0100, Maxime Ripard a =C3=A9crit=
=C2=A0:
> > > Hi,
> > >=20
> > > I started to review it, but it's probably best to discuss it here.
> > >=20
> > > On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote:
> > > > Hi,
> > > >=20
> > > > This is a patch series covering the support for protected mode exec=
ution in
> > > > Mali Panthor CSF kernel driver.
> > > >=20
> > > > The Mali CSF GPUs come with the support for protected mode executio=
n at the
> > > > HW level. This feature requires two main changes in the kernel driv=
er:
> > > >=20
> > > > 1) Configure the GPU with a protected buffer. The system must provi=
de a DMA
> > > >    heap from which the driver can allocate a protected buffer.
> > > >    It can be a carved-out memory or dynamically allocated protected=
 memory region.
> > > >    Some system includes a trusted FW which is in charge of the prot=
ected memory.
> > > >    Since this problem is integration specific, the Mali Panthor CSF=
 kernel
> > > >    driver must import the protected memory from a device specific e=
xporter.
> > >=20
> > > Why do you need a heap for it in the first place? My understanding of
> > > your series is that you have a carved out memory region somewhere, an=
d
> > > you want to allocate from that carved out memory region your buffers.
> > >=20
> > > How is that any different from using a reserved-memory region, adding
> > > the reserved-memory property to the GPU device and doing all your
> > > allocation through the usual dma_alloc_* API?
> >=20
> > How do you then multiplex this region so it can be shared between
> > GPU/Camera/Display/Codec drivers and also userspace ?
>=20
> You could point all the devices to the same reserved memory region, and
> they would all allocate from there, including for their userspace-facing
> allocations.

I get that using memory region is somewhat more of an HW description, and
aligned with what a DT is supposed to describe. One of the challenge is tha=
t
Mediatek heap proposal endup calling into their TEE, meaning knowing the re=
gion
is not that useful. You actually need the TEE APP guid and its IPC protocol=
. If
we can dell drivers to use a head instead, we can abstract that SoC specifi=
c
complexity. I believe each allocated addressed has to be mapped to a zone, =
and
that can only be done in the secure application. I can imagine similar need=
s
when the protection is done using some sort of a VM / hypervisor.

Nicolas

>=20
> > Also, how the secure memory is allocted / obtained is a process that
> > can vary a lot between SoC, so implementation details assumption
> > should not be coded in the driver.
>=20
> But yeah, we agree there, it's also the point I was trying to make :)
>=20
> Maxime


