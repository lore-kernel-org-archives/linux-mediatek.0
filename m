Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68141C369A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 07:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDaNdhjF6czZwZ8GYJQ+xlqUWHjP+ROLSrQsWDOJZts=; b=Ofd+KOxsgKnn1mFg1tlZBYvnxh
	Pf987egFKKlh6g+apXiOLiz2opW7gk3rbzDWLw03whlx1e6GsyvW4Uw6TtFGbW+FBOl7b6KeJenTm
	UhUqqEFe8OKMnKgCo2DP5HEUh4Lb6lzTHqFSjp1ogm9d8KQ/qWYzh6ldF7AwM/R7zcv0W/hDl+IhN
	tmwwxNzDDgJqmpWbZUoiF3PHBTZVXNfsMDk5HLu8gYfOPdLOOQWhp1x2P7zinwWJCYMNSoCN3yOQE
	rZoGQ0gVNFlMZqOeodDB2zyi+RqMzCUO8kJ9nLEwGF3bGA9PHxZZ+AqY1dB948c2AQ0q0YMkgPL3C
	G4VTg9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMEz-00000004H4T-1VJ3;
	Wed, 25 Sep 2024 07:15:13 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stMEw-00000004H3c-2Jb3
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 07:15:12 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a8d2b4a5bf1so889791966b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 00:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727248508; x=1727853308; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TDaNdhjF6czZwZ8GYJQ+xlqUWHjP+ROLSrQsWDOJZts=;
        b=V7ejo840Um9q0EbEPGnoNxd4Xhn2C5Z85QN3RmX2V3x0+sjRC9vsc5VtdCxeY/wLnc
         c41gd8ZO9GggtVbJuLBa2PqxYpqKsipajGS+aF+iYWauZ7pTWYG7hJoB5uMhYGYoManI
         3cXuB3nIl/Qj/VWccrUYRKVx0G29CMhr/P2h1OhBGsTj1pD46NX0A64nZyDg/100EJ51
         I5eRXRXhd1subdlfJm5hxcVkSkEL5yf3etAoG06Wp70BDniop0F0TldjUp9dVR2A79JP
         y7JVjFvsbsFIBXqEd/6tYlTG7LOk67DqXcqSI9h6pcFKtIj0GLhwqZyI4ZJOkrMbL4Up
         sGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248508; x=1727853308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDaNdhjF6czZwZ8GYJQ+xlqUWHjP+ROLSrQsWDOJZts=;
        b=H2z1nDu3aErlUeXs5m1uKIhMc2LufZWbBWAgAcRJGsiyTuG72oDZrJoxQSsfcgVGnw
         BxoKI2j7Dsh3aaMverPmcaBWfURILNd33xBH12noDgZQzYCWhKOrjIYamUjjSSyMA8sd
         6S5UTcycFxWLVWl1RfDdq5TsM+ohD+NE7afDFJR7HGTD3U8yjrbSr9yqek0ossjV6AD/
         UfCOLWxb05eN42AUNlyDfFh1fXnH3ZRskqueB81GJ5DyMZ7IpcENbDIIc2Jh+eWCUnlj
         SztiheHblTWW+garPzgxHv21E3sxZs7rWQEigXiYq7vhtLyuEe7yBk+r402SqsOc5VCl
         iQfA==
X-Forwarded-Encrypted: i=1; AJvYcCV1CUxfNUN1sBgfkbF8STAf1o5pDNoTzp/yG9MFmypyYXbR1t5brrG1t3y3ocK0rhb3lOtnsHgDNywKGqT6Ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUKlHJasKsQ6VDp8Q0cRZgGFKLtPMuFqyliMV7l9l+ySIcMzrL
	90pxpdEGE6GX2mHRUr1M8nRuk6OOkyawlI71bJqTYrD/pejl+UJ4k6xMn5qOPUk=
X-Google-Smtp-Source: AGHT+IHv93X+9j84xZuTxFkaqtse2mqrU5kPecB2WQv7iIqPArSVbHN4jb/WWw/ItxeQzBtjVNzB3Q==
X-Received: by 2002:a17:907:e656:b0:a86:9644:2a60 with SMTP id a640c23a62f3a-a93a03200d0mr161368666b.6.1727248508395;
        Wed, 25 Sep 2024 00:15:08 -0700 (PDT)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9393138bd5sm174570466b.205.2024.09.25.00.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:15:06 -0700 (PDT)
Date: Wed, 25 Sep 2024 09:15:04 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
Message-ID: <20240925071504.GA3519798@rayden>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_001510_634495_F11846C0 
X-CRM114-Status: GOOD (  42.95  )
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

On Mon, Sep 23, 2024 at 09:33:29AM +0300, Dmitry Baryshkov wrote:
> Hi,
> 
> On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> > Hi,
> > 
> > This patch set is based on top of Yong Wu's restricted heap patch set [1].
> > It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
> > 
> > The Linaro restricted heap uses genalloc in the kernel to manage the heap
> > carvout. This is a difference from the Mediatek restricted heap which
> > relies on the secure world to manage the carveout.
> > 
> > I've tried to adress the comments on [2], but [1] introduces changes so I'm
> > afraid I've had to skip some comments.
> 
> I know I have raised the same question during LPC (in connection to
> Qualcomm's dma-heap implementation). Is there any reason why we are
> using generic heaps instead of allocating the dma-bufs on the device
> side?
> 
> In your case you already have TEE device, you can use it to allocate and
> export dma-bufs, which then get imported by the V4L and DRM drivers.
> 
> I have a feeling (I might be completely wrong here) that by using
> generic dma-buf heaps we can easily end up in a situation when the
> userspace depends heavily on the actual platform being used (to map the
> platform to heap names). I think we should instead depend on the
> existing devices (e.g. if there is a TEE device, use an IOCTL to
> allocate secured DMA BUF from it, otherwise check for QTEE device,
> otherwise check for some other vendor device).

That makes sense, it's similar to what we do with TEE_IOC_SHM_ALLOC
where we allocate from a carveout reserverd for shared memory with the
secure world. It was even based on dma-buf until commit dfd0743f1d9e
("tee: handle lookup of shm with reference count 0").

We should use a new TEE_IOC_*_ALLOC for these new dma-bufs to avoid
confusion and to have more freedom when designing the interface.

> 
> The mental experiment to check if the API is correct is really simple:
> Can you use exactly the same rootfs on several devices without
> any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualcomm
> laptop, etc)?

No, I don't think so.

> 
> > 
> > This can be tested on QEMU with the following steps:
> > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> >         -b prototype/sdp-v1
> > repo sync -j8
> > cd build
> > make toolchains -j4
> > make all -j$(nproc)
> > make run-only
> > # login and at the prompt:
> > xtest --sdp-basic
> > 
> > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > list dependencies needed to build the above.
> > 
> > The tests are pretty basic, mostly checking that a Trusted Application in
> > the secure world can access and manipulate the memory.
> 
> - Can we test that the system doesn't crash badly if user provides
>   non-secured memory to the users which expect a secure buffer?
> 
> - At the same time corresponding entities shouldn't decode data to the
>   buffers accessible to the rest of the sytem.

I'll a few tests along that.

Thanks,
Jens

> 
> > 
> > Cheers,
> > Jens
> > 
> > [1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
> > [2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/
> > 
> > Changes since Olivier's post [2]:
> > * Based on Yong Wu's post [1] where much of dma-buf handling is done in
> >   the generic restricted heap
> > * Simplifications and cleanup
> > * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
> >   support"
> > * Replaced the word "secure" with "restricted" where applicable
> > 
> > Etienne Carriere (1):
> >   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> > 
> > Jens Wiklander (2):
> >   dma-buf: heaps: restricted_heap: add no_map attribute
> >   dma-buf: heaps: add Linaro restricted dmabuf heap support
> > 
> > Olivier Masse (1):
> >   dt-bindings: reserved-memory: add linaro,restricted-heap
> > 
> >  .../linaro,restricted-heap.yaml               |  56 ++++++
> >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> >  drivers/dma-buf/heaps/Makefile                |   1 +
> >  drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
> >  drivers/dma-buf/heaps/restricted_heap.h       |   2 +
> >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
> >  drivers/tee/tee_core.c                        |  38 ++++
> >  drivers/tee/tee_shm.c                         | 104 ++++++++++-
> >  include/linux/tee_drv.h                       |  11 ++
> >  include/uapi/linux/tee.h                      |  29 +++
> >  10 files changed, 426 insertions(+), 7 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
> >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

