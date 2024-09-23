Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A48CCF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 06:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5jTK+r41Ph8334euEi90MC38DwR8Kznsi20eXBe15E=; b=CkhhOVQozHxTKkf79EUggaGc6l
	TWN3T+OUVWmYvmIV1KHd3SdYTCsMCuiYf819oyE5XxH/ymc55Y53h7sY3OwJLxPTJVBrBmmiIIhdm
	j7E5IAuNitYmzo9HeKDRlydizvrzAlJTfN2aG5oXFOTnbYmyVSQgWilAst5kLWezJcckHcjxLHymr
	xSdhG69J1iwHlYeOtlIFCWb0N+Ya/ubdGivxSE1+0kaDWlRuo3dnObXOw9hG4KIfAGDMzUcsxc0eZ
	aPMQnIYCfA/IiUcKrqmuBkKhrBXVnN3Np8tiUgRXyn8O4v/KUiZtXMODX+lScSXqFedo0g8i9atYg
	6fDVGzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sscek-0000000GQix-1Zk4;
	Mon, 23 Sep 2024 06:34:46 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sscdb-0000000GQVo-0TNu
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 06:33:36 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5365928acd0so4139941e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Sep 2024 23:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727073212; x=1727678012; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y5jTK+r41Ph8334euEi90MC38DwR8Kznsi20eXBe15E=;
        b=g/KQ30Nx/Y10yFtjQoV0NM7rHsHVNYPgDB2nZvztBHPNebdVXr0A53T72R3eo+mSn1
         rIRqGu3ALf/sR8X/18NwxtHjCkx1W5rnJZz9yu+Dwi7ktnZnWR8g/ViPF0GFSiAgyvNx
         WLtaET3Z88BSR7LoZUFYCZ0qVzu3DELeTo1foveD9axV6z3gD7GGsnqBdSQEnIo0cKqH
         vmBeawzWFqp6SkdHRJnOlBZWJp8hp2tiJ4l1BhQwiAR9DPpBbteR/CzIQIoPLbi+WKy8
         oG1SUwrfByEiOo8xxj/7SS5kws8qKZjAGbdNup1qdoTxoRI5fCTNZfbxMOap1Kl+n4qf
         qxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727073212; x=1727678012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5jTK+r41Ph8334euEi90MC38DwR8Kznsi20eXBe15E=;
        b=llkDQjsTxcZXJvEbgicTSGIKCC90qNZ/7WbsAppuampfBEvxmiPVkmyhh09rw4ei2O
         YtFVF91iqgVbiIx1HolOPvWCXnbhA0/hLYAnbhoK/0qVAoU8CqkdWHtxY+hitdIXmWF8
         fBPlqFNn0NhuXDdqmydwMQdhBW4NGJ68qhyMrPu21asFruq1BaDr90MZF7g8ecsRhfzn
         2+pK6gddq9oqMwhnera60tu/QrQ6LsdogDmqjwDfHmEqZ/Xz4ax5XKwTy5db50PSgOZP
         PxfKTWVO52Z2X1P5aWhIdExbMxaMneg6o1NEFJtw3MoK3H00A6WFhp31IQ8wzF77aJCV
         +NHg==
X-Forwarded-Encrypted: i=1; AJvYcCU2y9xpyYaFVVpMrnbrlgKx4M+rv1kkTw8KsITuPNXFwCxXcsyTYdYMKVTHO5EU2mgqbse4vBkDtYC7kUelEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwotVRfPKEgfd60QKizJdwGoRHaIuXCeq9DgT1FnsL+Ym9Apg1
	2ZI5jBbjR/cP4SdxKdlkQdUSCcYPLUs8kF6qKm4zk8NtdEUsB112ebwS+LkVvGc=
X-Google-Smtp-Source: AGHT+IF0SSg0hB/gqsdKj0/yr4GTl2yjAfBCnM5NlEWIac3bv4HTXek3j/tUDFkeNkN6x6DTtY/72Q==
X-Received: by 2002:a05:6512:110c:b0:52e:be1f:bf7f with SMTP id 2adb3069b0e04-536ad1808d1mr4286439e87.27.1727073212004;
        Sun, 22 Sep 2024 23:33:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870b4255sm3165429e87.259.2024.09.22.23.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 23:33:31 -0700 (PDT)
Date: Mon, 23 Sep 2024 09:33:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
Message-ID: <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830070351.2855919-1-jens.wiklander@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_233335_164008_5ED11228 
X-CRM114-Status: GOOD (  29.90  )
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

Hi,

On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> Hi,
> 
> This patch set is based on top of Yong Wu's restricted heap patch set [1].
> It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
> 
> The Linaro restricted heap uses genalloc in the kernel to manage the heap
> carvout. This is a difference from the Mediatek restricted heap which
> relies on the secure world to manage the carveout.
> 
> I've tried to adress the comments on [2], but [1] introduces changes so I'm
> afraid I've had to skip some comments.

I know I have raised the same question during LPC (in connection to
Qualcomm's dma-heap implementation). Is there any reason why we are
using generic heaps instead of allocating the dma-bufs on the device
side?

In your case you already have TEE device, you can use it to allocate and
export dma-bufs, which then get imported by the V4L and DRM drivers.

I have a feeling (I might be completely wrong here) that by using
generic dma-buf heaps we can easily end up in a situation when the
userspace depends heavily on the actual platform being used (to map the
platform to heap names). I think we should instead depend on the
existing devices (e.g. if there is a TEE device, use an IOCTL to
allocate secured DMA BUF from it, otherwise check for QTEE device,
otherwise check for some other vendor device).

The mental experiment to check if the API is correct is really simple:
Can you use exactly the same rootfs on several devices without
any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualcomm
laptop, etc)?

> 
> This can be tested on QEMU with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
>         -b prototype/sdp-v1
> repo sync -j8
> cd build
> make toolchains -j4
> make all -j$(nproc)
> make run-only
> # login and at the prompt:
> xtest --sdp-basic
> 
> https://optee.readthedocs.io/en/latest/building/prerequisites.html
> list dependencies needed to build the above.
> 
> The tests are pretty basic, mostly checking that a Trusted Application in
> the secure world can access and manipulate the memory.

- Can we test that the system doesn't crash badly if user provides
  non-secured memory to the users which expect a secure buffer?

- At the same time corresponding entities shouldn't decode data to the
  buffers accessible to the rest of the sytem.

> 
> Cheers,
> Jens
> 
> [1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
> [2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/
> 
> Changes since Olivier's post [2]:
> * Based on Yong Wu's post [1] where much of dma-buf handling is done in
>   the generic restricted heap
> * Simplifications and cleanup
> * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
>   support"
> * Replaced the word "secure" with "restricted" where applicable
> 
> Etienne Carriere (1):
>   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> 
> Jens Wiklander (2):
>   dma-buf: heaps: restricted_heap: add no_map attribute
>   dma-buf: heaps: add Linaro restricted dmabuf heap support
> 
> Olivier Masse (1):
>   dt-bindings: reserved-memory: add linaro,restricted-heap
> 
>  .../linaro,restricted-heap.yaml               |  56 ++++++
>  drivers/dma-buf/heaps/Kconfig                 |  10 ++
>  drivers/dma-buf/heaps/Makefile                |   1 +
>  drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
>  drivers/dma-buf/heaps/restricted_heap.h       |   2 +
>  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
>  drivers/tee/tee_core.c                        |  38 ++++
>  drivers/tee/tee_shm.c                         | 104 ++++++++++-
>  include/linux/tee_drv.h                       |  11 ++
>  include/uapi/linux/tee.h                      |  29 +++
>  10 files changed, 426 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
>  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

