Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5CFC02194
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 21:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DxvZdZPg1+c/4MiY+1eFG+nW41sRJmolNY7AFhKpW0=; b=IXOw03t0+ko0QzRb6e8ypaKLbJ
	nqYA6DjHRedMmBpjgOBZKA9zyS6nFU5nNim+5+0jWpgX+xbplFwpXvyeA4tpwJivpRs1N3CuvjaSJ
	ZtTke6vxSvoV6RmZ5GsaDaPQk0IKXb0GdepSBAShjm3Zw4fLkzUsxNSGpSX4zzoKs42vgYlT3sJ1L
	BDPavDMgj6xYgxM6nkdWsMW0IZDNCpdAG0n94aduMApBXoCz3qqWAFPGX6Z2zroUncXsHghaGkSv9
	zENXJSR/Sj8/Bl1m5iqUtycNkPNABqDjGa0bEg4Y6o6sZForEDM6f1QnP+AgGUSX90bvotZxAtHnB
	8Ylga4FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg9JG-00000007ZOt-06zJ;
	Thu, 06 Feb 2025 21:21:18 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg9JD-00000007ZO2-0u91
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Feb 2025 21:21:16 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-46c7855df10so23714321cf.3
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2025 13:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738876874; x=1739481674; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6DxvZdZPg1+c/4MiY+1eFG+nW41sRJmolNY7AFhKpW0=;
        b=XFB3IHaDZ0z0ciMyZr37lb04JpnCt1PadZABABB7CTVxIv1s1Bc+j28VfxyZ3USab6
         P6xM4VFwSm6YjWryz+yy6KOv3Li4fqYpl+WRAN71Km+rxuTVHzo32si48sisVanuKFan
         BKwxYO+EzwdV+hIxh8hEbvZbOPW76sXgJKERln8DfgiG7ZA9XBcbAB6CqPip+vWuVpog
         /AU3b317cb3+6LIomD/K42wi3XEyKQim/t0iiJUc0pcxbfGQRmHSCv6FDPDhcLnQGXGq
         5GGwDC+mcN4UJC4rvgHnU/r19TEtJELeigqnqe8gcbqu315znxJPZVWG2TOCq+b/CM6s
         5hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738876874; x=1739481674;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6DxvZdZPg1+c/4MiY+1eFG+nW41sRJmolNY7AFhKpW0=;
        b=p5D6MLLIcugCubJaS2XEAKifgDp8dCF2i9D9LtnZdeH/6rmEmp94wIPwZ7hjXgfni4
         w2TX8AFdMPhGHRmxmUn+zwksLq/Ks8O0pa7O9D6/PpO2Wp//FCEcKhUX6mHtjkiBKCzP
         ue8qdGhiYQPHldRi2rUg3tXrrRHaldw/z2mGrE2T1lGs/2kY3naLHEFVMq6kzIxRBHf+
         2AWA+f01Nq7ihgI3/PyXRmrPuxSl5J5OC+Gx/92H6MPHEjv7Nq2PMhd08Mt6FN9hoRc2
         BF+UPZ0jzZ+KGGmFcqtVCQuB4yXSqbPi7+5tpWTMaGkQSrCxL9gWeUCq32eeeM+rRKiX
         o1tw==
X-Forwarded-Encrypted: i=1; AJvYcCWGGjZVJjONtOHgdcmsI6o8SBrI8E3NOHufUebVDbCwAmcgukmkLFNz3Xfv0BmSMbKss8Sfm8kRbTHqr4oSgA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4cmw0W68lfg/WjxDgOE1b+wHXGJHxB7Q3ssumDqofJ+2JtW3W
	HVfKVwC/Oz4RQ/iftBz6HfRs+M2lhTiOKP1dyiDwu9aR4ZXu1TAor3Ex2/YKv+4=
X-Gm-Gg: ASbGncterK/Qs26ePGGhCJmJDwg14Kn4TO9CNd/oXsISi+gr0ef6QrX2QK9aUC/FkEZ
	RQ2bcovq8tqlcZkpqkRBwu4B2+7cHXnCaqc1vOajX4l0DUgt8ms3yc9KHcQtV10A5J66zcCW/1o
	IG50CUgf4SYsEDlQPgd2sugW2scSHcCzLe5IUnfuFLVvKIbCiY1r+OK86/02Ysbtb4WfDlKUCgy
	3QQmoumGi/u5uaFMZIYhDZR7PpUj7StG+pHUUncwzPqi3yGPQVZeU2eF0goAszoNWBpDEezxIRO
	CYkHwkCw4bS3XttE
X-Google-Smtp-Source: AGHT+IHI8yMd/5aYfmfZcfbDFH3h4Fy2Z99LYvivEu182Bj0ddc/CD4GBHcML5OVdc/uP/LZDxsEvA==
X-Received: by 2002:a05:622a:5a95:b0:466:a06f:ae0a with SMTP id d75a77b69052e-47167ae29c0mr13578771cf.32.1738876873855;
        Thu, 06 Feb 2025 13:21:13 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47153bc741asm9168671cf.62.2025.02.06.13.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 13:21:12 -0800 (PST)
Message-ID: <5e0e2fbb22c2ffb0c5281727cd95d70f5f5ba696.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 3/5] dt-bindings: gpu: Add protected heap name to
 Mali Valhall CSF binding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Krzysztof Kozlowski <krzk@kernel.org>, Florent Tomasin	
 <florent.tomasin@arm.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier"	
 <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	nd@arm.com, Akash Goel <akash.goel@arm.com>
Date: Thu, 06 Feb 2025 16:21:10 -0500
In-Reply-To: <c0aad911-ecc4-4b04-a453-6da226f76ed2@kernel.org>
References: <cover.1738228114.git.florent.tomasin@arm.com>
	 <36b57dcf20860398ba83985e1c5b6f6958d08ba7.1738228114.git.florent.tomasin@arm.com>
	 <7234f25c-a2aa-4834-931b-aeeb7a49dfa7@kernel.org>
	 <4b9deab1-e330-4c93-8260-75276c2bc9ff@arm.com>
	 <c0aad911-ecc4-4b04-a453-6da226f76ed2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_132115_441846_88871F82 
X-CRM114-Status: GOOD (  30.83  )
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

Le mercredi 05 f=C3=A9vrier 2025 =C3=A0 10:13 +0100, Krzysztof Kozlowski a =
=C3=A9crit=C2=A0:
> On 03/02/2025 16:31, Florent Tomasin wrote:
> > Hi Krzysztof
> >=20
> > On 30/01/2025 13:25, Krzysztof Kozlowski wrote:
> > > On 30/01/2025 14:08, Florent Tomasin wrote:
> > > > Allow mali-valhall-csf driver to retrieve a protected
> > > > heap at probe time by passing the name of the heap
> > > > as attribute to the device tree GPU node.
> > >=20
> > > Please wrap commit message according to Linux coding style / submissi=
on
> > > process (neither too early nor over the limit):
> > > https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/proces=
s/submitting-patches.rst#L597
> > Apologies, I think I made quite few other mistakes in the style of the
> > patches I sent. I will work on improving this aspect, appreciated
> >=20
> > > Why this cannot be passed by phandle, just like all reserved regions?
> > >=20
> > > From where do you take these protected heaps? Firmware? This would
> > > explain why no relation is here (no probe ordering, no device links,
> > > nothing connecting separate devices).
> >=20
> > The protected heap is generaly obtained from a firmware (TEE) and could
> > sometimes be a carved-out memory with restricted access.
>=20
> Which is a reserved memory, isn't it?
>=20
> >=20
> > The Panthor CSF kernel driver does not own or manage the protected heap
> > and is instead a consumer of it (assuming the heap is made available by
> > the system integrator).
> >=20
> > I initially used a phandle, but then I realised it would introduce a ne=
w
> > API to share the heap across kernel driver. In addition I found this
> > patch series:
> > -
> > https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.co=
m/#t
> >=20
> > which introduces a DMA Heap API to the rest of the kernel to find a
> > heap by name:
> > - dma_heap_find()
> >=20
> > I then decided to follow that approach to help isolate the heap
> > management from the GPU driver code. In the Panthor driver, if the
> > heap is not found at probe time, the driver will defer the probe until
> > the exporter made it available.
>=20
>=20
> I don't talk here really about the driver but even above mediatek
> patchset uses reserved memory bindings.
>=20
> You explained some things about driver yet you did not answer the
> question. This looks like reserved memory. If it does not, bring
> arguments why this binding cannot be a reserved memory, why hardware is
> not a carve out memory.

I think the point is that from the Mali GPU view, the memory does not need =
to be
within the range the Linux Kernel actually see, even though current integra=
tion
have that. From Mali GPU driver stand point (or codec drivers and what's no=
t),
the memory range is not useful to allocate protected/restricted memory. On =
top
of which, its not reserved specifically for the Mali GPU.

What's your practical suggestion here ? Introduce dma_heap_find_by_region()=
 ?

Nicolas

>=20
> Best regards,
> Krzysztof
>=20


