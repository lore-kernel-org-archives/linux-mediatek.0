Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C2AC369DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGma69Sr28MXVjXEqnOY6cy8Xe0bfhYxw2mh4o1EehI=; b=rzufPQDuQvZHVPQH2doftuHv7C
	BmoLjjI5kzL7VwE4afPVP7sPJSyss/jLID+pi5S+M2uO5tXrYKwN8eWUCQ1+pLTR+GfB0HqD8jEIl
	1QLGie61FMsO24P8vEPspOYXdb9OxoyR4Zd9jhGS+mNprkNc31ykdPDMDshV1YQzRh6zHobWAbcCE
	9rsCWjtxMOGWO1pEtuCEjYg/1jzUJaQwObcT8CKtp2LNZ89cWUB06iC8fi5JSqlXjcGLVzuylr7oH
	yQgkoBjBC/FTIBGOz5Lr5Vhvuy1TVZlilPYwWcDN75ot0hvpNbIQfQ6xvIOmmcRnFGPTQmgDqqKfE
	GG1YwBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stRXC-00000005FM2-0j4r;
	Wed, 25 Sep 2024 12:54:22 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stRUO-00000005EWI-4483
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 12:51:31 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2f75f116d11so68893461fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727268687; x=1727873487; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LGma69Sr28MXVjXEqnOY6cy8Xe0bfhYxw2mh4o1EehI=;
        b=qTTf+pQEF53GVWIMHqRo9cKBOpxLpkudwddRN4otHROqv4rpdcxD4ovPzV/rEmPINx
         PS6lYu11XPcs1zLmwJkHkfknZVTf0zNFLSHCd8phGHuHxJxVPNqYL/8cAnSP6lPTsWFo
         nf4cVqMwpCkI7LPBGfoVrW4GWelAjd8IpQngaiZJnLTP136lv5YPcpIs2w2rdheA3hkL
         53+rvDGvhLekLuRs2eVrptIQhnJ3cHuiQYxpcfaubvLnQZ+E5eKuWQtBwkXHyxJ2LVR+
         hJkkzlVaQyWX7JpQ82ijxJ1Q8sRSweP98gHWUfOcu+axechEa8IeXwyq6FDaU+YIE7pO
         UKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727268687; x=1727873487;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGma69Sr28MXVjXEqnOY6cy8Xe0bfhYxw2mh4o1EehI=;
        b=BbQB/yc3zvprUpVrwMdvpi0vtF3KK8+kdv9Agm+xB9HUsERismNO5pDb+ROFxjQH6H
         58wS7SrhIZsb29dC9E3+xDvXeeBKcm/vCSdCcCDln3AlUtTSqbtjVVywMaoEt0iRVu+4
         MiAO177E99Ewd4jefi5pnVrk4VAHCN/8YbgOlRLC98mt+oVH+FVOtNzLc/OxO7Za64u8
         KtJHKHeIEGRKG5d7VCvtGXqlhzGg40MhFuPQwgxd5YRrNRXNU01dsEJFZcjXb0aEfquK
         iWbUk9qfMOg6Gv3WvpR9lRs0RjWF6BBg9T3O9UayiCi+p2hcWjVkwATpylkOvFzusvJk
         nhBg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ8jaj58kz5tCq/FOWTOKO0ZSdz1zklZPznnWj/d1stXdBvQnoomxNUkTPY7ZjQYeyW01Z3WC/HD4gVjnWLg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5e0M60FVfND0cie7VKFBMBrNav722ptsWU6TJfZdLwc9buFEm
	lN67d7dHeTj39ctSN5sx4vjgV5s/1TJf9uHYGt15H5HsZdJHBE/Fex/T4TE2I54=
X-Google-Smtp-Source: AGHT+IEGQnkRVJDhYLTjRbwCd1JcWlry2TnoRPviQ16wlDbXpkXhhkV0VphxcyVjJS5vqRD4q2JN9A==
X-Received: by 2002:a2e:90c3:0:b0:2f6:649e:bf70 with SMTP id 38308e7fff4ca-2f916012799mr14524141fa.26.1727268686577;
        Wed, 25 Sep 2024 05:51:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d28998e5sm4935891fa.101.2024.09.25.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 05:51:25 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:51:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc: Andrew Davis <afd@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>, 
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
Subject: Re: [Linaro-mm-sig] Re: [RFC PATCH 0/4] Linaro restricted heap
Message-ID: <lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
 <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
 <e967e382-6cca-4dee-8333-39892d532f71@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e967e382-6cca-4dee-8333-39892d532f71@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_055129_140883_DF790347 
X-CRM114-Status: GOOD (  45.83  )
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

On Wed, Sep 25, 2024 at 10:51:15AM GMT, Christian König wrote:
> Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
> > On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
> > > On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
> > > > Hi,
> > > > 
> > > > On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> > > > > Hi,
> > > > > 
> > > > > This patch set is based on top of Yong Wu's restricted heap patch set [1].
> > > > > It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
> > > > > 
> > > > > The Linaro restricted heap uses genalloc in the kernel to manage the heap
> > > > > carvout. This is a difference from the Mediatek restricted heap which
> > > > > relies on the secure world to manage the carveout.
> > > > > 
> > > > > I've tried to adress the comments on [2], but [1] introduces changes so I'm
> > > > > afraid I've had to skip some comments.
> > > > I know I have raised the same question during LPC (in connection to
> > > > Qualcomm's dma-heap implementation). Is there any reason why we are
> > > > using generic heaps instead of allocating the dma-bufs on the device
> > > > side?
> > > > 
> > > > In your case you already have TEE device, you can use it to allocate and
> > > > export dma-bufs, which then get imported by the V4L and DRM drivers.
> > > > 
> > > This goes to the heart of why we have dma-heaps in the first place.
> > > We don't want to burden userspace with having to figure out the right
> > > place to get a dma-buf for a given use-case on a given hardware.
> > > That would be very non-portable, and fail at the core purpose of
> > > a kernel: to abstract hardware specifics away.
> > Unfortunately all proposals to use dma-buf heaps were moving in the
> > described direction: let app select (somehow) from a platform- and
> > vendor- specific list of dma-buf heaps. In the kernel we at least know
> > the platform on which the system is running. Userspace generally doesn't
> > (and shouldn't). As such, it seems better to me to keep the knowledge in
> > the kernel and allow userspace do its job by calling into existing
> > device drivers.
> 
> The idea of letting the kernel fully abstract away the complexity of inter
> device data exchange is a completely failed design. There has been plenty of
> evidence for that over the years.
> 
> Because of this in DMA-buf it's an intentional design decision that
> userspace and *not* the kernel decides where and what to allocate from.

Hmm, ok.

> 
> What the kernel should provide are the necessary information what type of
> memory a device can work with and if certain memory is accessible or not.
> This is the part which is unfortunately still not well defined nor
> implemented at the moment.
> 
> Apart from that there are a whole bunch of intentional design decision which
> should prevent developers to move allocation decision inside the kernel. For
> example DMA-buf doesn't know what the content of the buffer is (except for
> it's total size) and which use cases a buffer will be used with.
> 
> So the question if memory should be exposed through DMA-heaps or a driver
> specific allocator is not a question of abstraction, but rather one of the
> physical location and accessibility of the memory.
> 
> If the memory is attached to any physical device, e.g. local memory on a
> dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose the
> memory as device specific allocator.

So, for embedded systems with unified memory all buffers (maybe except
PCIe BARs) should come from DMA-BUF heaps, correct?

> 
> If the memory is not physically attached to any device, but rather just
> memory attached to the CPU or a system wide memory controller then expose
> the memory as DMA-heap with specific requirements (e.g. certain sized pages,
> contiguous, restricted, encrypted, ...).

Is encrypted / protected a part of the allocation contract or should it
be enforced separately via a call to TEE / SCM / anything else?

-- 
With best wishes
Dmitry

