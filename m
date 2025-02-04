Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B12C02194
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Feb 2025 18:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FLDKP+B1KLmToqN0+wbXjgRxetp1/agS67Xma08wWo=; b=Wg3qknZfxHKmIB5VxhpOJvVgXx
	Fa2mCOGNTl4h1sRbXzF58fxn0xp5Yue+nNh5vfuQJQhpJnZGYttg/kgQiD55Ue9y+vw0UqKvts81K
	BP9/ABS8PrTb3G75FtQeVmdlHDPS49BCYvV/BUUHuOMw2khE+nuurPh2dHRjVoX2l9zGeko4oYj7B
	LqMy2I2r/oFozGka2fippL0d+i9Dryas9j+qSRicSUeFw+ZxHutWHj5sFsJ3gbofg0xVCBiRsTkEK
	uJydDoFjhTMcBDkBSm28lUoNAXDHfnvH06AumM83Y26nopktmoJpPQIevqZxztQaWXP1NDrWf3XY7
	2C82fB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNR6-00000001BTH-2iER;
	Tue, 04 Feb 2025 18:14:12 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNPk-00000001BFj-2UmA
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Feb 2025 18:12:49 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6e4295b72b5so8903916d6.2
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Feb 2025 10:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738692767; x=1739297567; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7FLDKP+B1KLmToqN0+wbXjgRxetp1/agS67Xma08wWo=;
        b=dPEXx6OJK+wzJfTNRDBGFHaPd2y22B6vTFRYcEoZfnhvVxLJLiM77j7estrK//RZRp
         IKnjCMmtoV/0dZjvKyhWL8KABJnB0Yxba7wacLY/leTVgbiAy9fh1NTqPB3DcLd2ScGq
         SwZdFwI4n4um8kUx0MY0mj+276xyNghc+t6JC3dwdmiB9PVOgeAPHrJF7Stc6oqM6ZFF
         bsEdEt3F7y4SOyHtPkqZ5vAHH4XoI7IK1lyKZ5+cmTElsYR4lu0H4fqDJc0E50SWK0G+
         JDpJB8f3PWK7AKRPGM5OAa/Jv+FZm0Ol3mZts53QS/ps1CEiwbsbRn2zbIbcszUyC0yP
         KYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738692767; x=1739297567;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7FLDKP+B1KLmToqN0+wbXjgRxetp1/agS67Xma08wWo=;
        b=YDt7YTZntPkDOU0l7ivK6WCZ45vCYkGHcNu2ru7O/8SGP7/igNrMn7vOifhm75Lm/M
         M8FBPMN5KRvldROW7vkxVLz22nMu93sfholErX0VYTs1D6ZzndR04LLRhsrXt94edQPg
         +y/QxbF3nTLnvmI2J/UYskLyRfmtU3P+HqRSR7Y4I8ZlCCXJEudtT5MS2hIt5/PJimQI
         unLSHrzZIB6dxLoTnGJnVl19aIblg8IIJf+o/TPYztuwR0FBEDWZlyC/36fwzGw/GPFX
         b7ItBd6WOEmMr1TC2M+35FuB4UcsFDTs+ebGTFCHa2Z+tRmcdcEk4YHunduO80FzE1B7
         jKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3ORHtkNJSJBnLEM613QUzokvvqU8A44KycgSsj5Br8pJYJXJl6ZmOTVKR4By+klRJDFcJVfRNKu48e3LpNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxq5wppmUr2OKDWuMQ6X3nxxXQ6JvNjvgufoNVSV5KFNIKMXFu
	4bpRSvVVoVfYmGdvN5z/igAPlEshtYSMpbHhRn5VTzDD63H2JONYlEpGK2HEb4w=
X-Gm-Gg: ASbGnct5kUzmqRjoa8ZnpYQtHMtlWn5konMIM/kYeCe8JJ8KzPkGCd/Q6gQi0qA6cK1
	54BH2W5bT2e6T99PM+YvY6MjXScE+6uodBtlNyt2oa+sJoH15cJnNIwK2wmffplG9/Rg62wBB/1
	ppaY4/3t3HS9ElgcRkKqEydbv5HsD1MjUym39rNtJ+KhNywDhA303atI3ux2W4PSJ6GnYU73qan
	VztNHZ345ySzsdV70zjJyFvw7KgdbI0QrZDFOP4nAseDe+fQMPTW0XqiHZt8QPbeLQWKfVB9/Vt
	2/N+kBzZZQY28rUy
X-Google-Smtp-Source: AGHT+IEUFtl7TqQiYVbLC5fRURyW+Ho5rjSwqMbAkbu0qwIuaYAMXRJbz+FDijkjOelVbHDYm/RAhg==
X-Received: by 2002:a05:6214:3291:b0:6e1:a4d6:185f with SMTP id 6a1803df08f44-6e243c9b8c2mr427636956d6.34.1738692766625;
        Tue, 04 Feb 2025 10:12:46 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2548143c4sm64370106d6.35.2025.02.04.10.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:12:46 -0800 (PST)
Message-ID: <b02711c901e8acf2bc47926919de7673a0cb0b98.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
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
Date: Tue, 04 Feb 2025 13:12:44 -0500
In-Reply-To: <be8e6b9f-c3c6-41d1-af9c-3dcd102f0fe3@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
	 <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
	 <ats2unrml5a7vbpdrqrzowodrsfj44bnubpbujg2igk3imeklx@nrpmg5oeq3gz>
	 <be8e6b9f-c3c6-41d1-af9c-3dcd102f0fe3@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_101248_626930_28C715D4 
X-CRM114-Status: GOOD (  38.00  )
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

Hi Florent,

Le lundi 03 f=C3=A9vrier 2025 =C3=A0 13:36 +0000, Florent Tomasin a =C3=A9c=
rit=C2=A0:
>=20
> On 30/01/2025 13:28, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Jan 30, 2025 at 01:08:57PM +0000, Florent Tomasin wrote:
> > > Introduce a CMA Heap dt-binding allowing custom
> > > CMA heap registrations.
> > >=20
> > > * Note to the reviewers:
> > > The patch was used for the development of the protected mode

Just to avoid divergence in nomenclature, and because this is not a new sub=
ject,
perhaps you should also adhere to the name "restricted". Both Linaro and
Mediatek have moved from "secure" to that name in their proposal. As you ar=
e the
third proposing this (at least for the proposal that are CCed on linux-medi=
a), I
would have expected in your cover letter a summary of how the other require=
ment
have been blended in your proposal.

regards,
Nicolas

> > > feature in Panthor CSF kernel driver and is not initially thought
> > > to land in the Linux kernel. It is mostly relevant if someone
> > > wants to reproduce the environment of testing. Please, raise
> > > interest if you think the patch has value in the Linux kernel.
> > >=20
> > > Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> > > ---
> > >  .../devicetree/bindings/dma/linux,cma.yml     | 43 +++++++++++++++++=
++
> > >  1 file changed, 43 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/dma/linux,cma.y=
ml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/dma/linux,cma.yml b/Do=
cumentation/devicetree/bindings/dma/linux,cma.yml
> > > new file mode 100644
> > > index 000000000000..c532e016bbe5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/dma/linux,cma.yml
> > > @@ -0,0 +1,43 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/dma/linux-cma.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Custom Linux CMA heap
> > > +
> > > +description:
> > > +  The custom Linux CMA heap device tree node allows registering
> > > +  of multiple CMA heaps.
> > > +
> > > +  The CMA heap name will match the node name of the "memory-region".
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - linux,cma
> > > +
> > > +  memory-region:
> > > +    maxItems: 1
> > > +    description: |
> > > +      Phandle to the reserved memory node associated with the CMA He=
ap.
> > > +      The reserved memory node must follow this binding convention:
> > > +       - Documentation/devicetree/bindings/reserved-memory/reserved-=
memory.txt
> > > +
> > > +examples:
> > > +  - |
> > > +    reserved-memory {
> > > +      #address-cells =3D <2>;
> > > +      #size-cells =3D <2>;
> > > +
> > > +      custom_cma_heap: custom-cma-heap {
> > > +        compatible =3D "shared-dma-pool";
> > > +        reg =3D <0x0 0x90600000 0x0 0x1000000>;
> > > +        reusable;
> > > +      };
> > > +    };
> > > +
> > > +    device_cma_heap: device-cma-heap {
> > > +      compatible =3D "linux,cma";
> > > +      memory-region =3D <&custom_cma_heap>;
> > > +    };
> >=20
> > Isn't it redundant with the linux,cma-default shared-dma-pool property
> > already?
> >=20
> > Maxime
>=20
> Hi Maxime,
>=20
> Please correct me if my understanding is wrong,
>=20
> The existing properties: linux,cma-default and shared-dma-pool, do not
> allow the creations of multiple standalone CMA heaps, those will create
> a single CMA heap: `dma_contiguous_default_area`? Other CMA heaps will
> be bound to a driver.
>=20
> I introduced the "linux,cma" to allow creating multiple standalone CMA
> heaps, with the intention of validating the protected mode support on
> Mali CSG GPUs. It was included in the RFC in there are interests in
> this approach.
>=20
> Since the Panthor CSF kernel driver does not own or manage a heap,
> I needed a way to create a standalone heap. The idea here is for the
> kernel driver to be an importer. I relied on a patch series to retrieve
> the heap and allocate a DMA buffer from it:
> - dma_heap_find()
> - dma_heap_buffer_alloc()
> - dma_heap_put()
>=20
> Ref:
> https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/=
#t
>=20
>=20
> Since the protected/secure memory management is integration specific,
> I needed a generic way for Panthor to allocate from such heap.
>=20
> In some scenarios it might be a carved-out memory, in others a FW will
> reside in the system (TEE) and require a secure heap driver to allocate
> memory (e.g: a similar approach is followd by MTK). Such driver would
> implement the allocation and free logic.
>=20
> Florent
>=20
>=20
>=20


