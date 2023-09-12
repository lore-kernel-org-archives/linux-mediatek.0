Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6C8CA0EF2
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 15:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vM3oyGRFxtHxm1neHgA67Osk9iJA5NE4DNejEYZfvZ8=; b=yD8v1XwHHK/ap8o1XH0LW/xypb
	9y+DyPhjQfWnecCMdNnyiEo1DvVzKjDbtBG8w+DL5IrFnmDHagPvu/8dl13WvSWv0P1x9AXcN/LbO
	90cvOR6GyzZgSpQauWOGY/2mWq70nExewYHcCx8Qyo46zTLIj0cqCH7gu6hJxB5Wag4zYR+DYuGAm
	SplpKQGbSkZzeunt/WDmALDmQ3y6CBVtC7dPsofnAoJFm3ptFqX/3972yJIbo73ijm5gT3ImMNLAm
	A/wpiN4dGMaRgeINLB0+Gg9U1TlSTskX48sQQT4wXwsTLDQvi+T0jKnRNukRhdixd8hmwKyuB0z8O
	mURHtg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4xR-003gr1-0d;
	Tue, 12 Sep 2023 15:05:41 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4xO-003gq9-23
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 15:05:40 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7708bfce474so336841985a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 08:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1694531136; x=1695135936; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vM3oyGRFxtHxm1neHgA67Osk9iJA5NE4DNejEYZfvZ8=;
        b=MJ0wPcWU4z1nvJo7RYqgqWdhrFcVFZMoeD2aQWWDx30xVypkNJ3k/jifTR+npmVvv/
         T9Qju9iOlwpJPlprv9Ht/qW95G+E1s6xqm1pn8O941Q12Y9L+OOFVUU6cNoekr0O2G6T
         0eg8mLYlKfiuq6DSF0STcSMaYeX2KpcOBxsEWDosepbuQCCqbSjUpBpmFAttm6ukZZL6
         jrQc7C7wXZdgBn/l++SEkM0P6eiuYfiC1RJj1qnQ6TT1oIid7ygSDm+rKwII6GO2CjOs
         XDQpGYq4k7nnK88+vPXmcVsHowXRvxUlekEMz+pMBa2TlvBelYvKCwQRxbYvCI1POR0K
         Vp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694531136; x=1695135936;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vM3oyGRFxtHxm1neHgA67Osk9iJA5NE4DNejEYZfvZ8=;
        b=U+efNalrzt6NDVD1yM+VVrY9MCcahVfGAY4xbt3xRHP9SQ9RIPqAof3OBVHfp7+egk
         4WKS27JR7VMHSUSAriyazowmfgrZ7OAkLJ44BBQe6NcCXCcus3W1tcD4ir0vwJOAEotP
         5KE3E4COZn4zuWKICkYsczM//qjDMrQbCWEPcePIDY2DUeCUx+47IyRmHeHXMQEOePsz
         JGb1SFfHWNaQXJoyOOY3o7Bh6suhX2Z/SMUYllRFLB9cXJxKne7aLx3U/50ubxWEzAEy
         aMgPk2bRpBrBjFvFovsMsM4hiOCejMuZPGIQeX6Eg+TJgC/zaQnQOUvQwUZ78lYSptyQ
         fytw==
X-Gm-Message-State: AOJu0YzOoHb//98i2K9+nJdIM0CmCH0kuo6kJkDVMSn9pCMaEBE6IFkx
	nN75doWO0dQ4EG7zx9gvkpatig==
X-Google-Smtp-Source: AGHT+IETEyxKiwuQg/hyiHZWR8ejsoB5rvNcCqFck37LlPZlL1+L6Aam0BaJ+MZGh5Xo6lDDiukNdA==
X-Received: by 2002:a05:620a:454c:b0:76c:aff9:9f27 with SMTP id u12-20020a05620a454c00b0076caff99f27mr17152733qkp.59.1694531136409;
        Tue, 12 Sep 2023 08:05:36 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:bae9::7a9])
        by smtp.gmail.com with ESMTPSA id s41-20020a05622a1aa900b004053bcffe49sm3380085qtc.9.2023.09.12.08.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 08:05:36 -0700 (PDT)
Message-ID: <d15067b12571f8868925aace9dc84473cd74ec1f.camel@ndufresne.ca>
Subject: Re: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel
 drivers can allocate dmabufs from specific heaps
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?= <Yong.Wu@mediatek.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jstultz@google.com" <jstultz@google.com>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jianjiao Zeng
 =?UTF-8?Q?=28=E6=9B=BE=E5=81=A5=E5=A7=A3=29?= <Jianjiao.Zeng@mediatek.com>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Date: Tue, 12 Sep 2023 11:05:35 -0400
In-Reply-To: <8e795311ff93c7a336eb688818f055c5c569741e.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
	 <20230911023038.30649-4-yong.wu@mediatek.com>
	 <827b859e3ff8176ef0b18c29bc17481b4105e368.camel@ndufresne.ca>
	 <8e795311ff93c7a336eb688818f055c5c569741e.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_080538_677235_005149FB 
X-CRM114-Status: GOOD (  40.70  )
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

Le mardi 12 septembre 2023 =C3=A0 08:47 +0000, Yong Wu (=E5=90=B4=E5=8B=87)=
 a =C3=A9crit=C2=A0:
> On Mon, 2023-09-11 at 12:12 -0400, Nicolas Dufresne wrote:
> >  	=20
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Hi,
> >=20
> > Le lundi 11 septembre 2023 =C3=A0 10:30 +0800, Yong Wu a =C3=A9crit :
> > > From: John Stultz <jstultz@google.com>
> > >=20
> > > This allows drivers who don't want to create their own
> > > DMA-BUF exporter to be able to allocate DMA-BUFs directly
> > > from existing DMA-BUF Heaps.
> > >=20
> > > There is some concern that the premise of DMA-BUF heaps is
> > > that userland knows better about what type of heap memory
> > > is needed for a pipeline, so it would likely be best for
> > > drivers to import and fill DMA-BUFs allocated by userland
> > > instead of allocating one themselves, but this is still
> > > up for debate.
> >=20
> >=20
> > Would be nice for the reviewers to provide the information about the
> > user of
> > this new in-kernel API. I noticed it because I was CCed, but
> > strangely it didn't
> > make it to the mailing list yet and its not clear in the cover what
> > this is used
> > with.=20
> >=20
> > I can explain in my words though, my read is that this is used to
> > allocate both
> > user visible and driver internal memory segments in MTK VCODEC
> > driver.
> >=20
> > I'm somewhat concerned that DMABuf objects are used to abstract
> > secure memory
> > allocation from tee. For framebuffers that are going to be exported
> > and shared
> > its probably fair use, but it seems that internal shared memory and
> > codec
> > specific reference buffers also endup with a dmabuf fd (often called
> > a secure fd
> > in the v4l2 patchset) for data that is not being shared, and requires
> > a 1:1
> > mapping to a tee handle anyway. Is that the design we'd like to
> > follow ?=20
>=20
> Yes. basically this is right.
>=20
> > Can't
> > we directly allocate from the tee, adding needed helper to make this
> > as simple
> > as allocating from a HEAP ?
>=20
> If this happens, the memory will always be inside TEE. Here we create a
> new _CMA heap, it will cma_alloc/free dynamically. Reserve it before
> SVP start, and release to kernel after SVP done.

Ok, I see the benefit of having a common driver then. It would add to the
complexity, but having a driver for the tee allocator and v4l2/heaps would =
be
another option?

>  =20
> Secondly. the v4l2/drm has the mature driver control flow, like
> drm_gem_prime_import_dev that always use dma_buf ops. So we can use the
> current flow as much as possible without having to re-plan a flow in
> the TEE.

From what I've read from Yunfei series, this is only partially true for V4L=
2.
The vb2 queue MMAP feature have dmabuf exportation as optional, but its not=
 a
problem to always back it up with a dmabuf object. But for internal SHM buf=
fers
used for firmware communication, I've never seen any driver use a DMABuf.

Same applies for primary decode buffers when frame buffer compression or po=
st-
processing it used (or reconstruction buffer in encoders), these are not us=
er
visible and are usually not DMABuf.

>=20
> >=20
> > Nicolas
> >=20
> > >=20
> > > Signed-off-by: John Stultz <jstultz@google.com>
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > [Yong: Fix the checkpatch alignment warning]
> > > ---
> > >  drivers/dma-buf/dma-heap.c | 60 ++++++++++++++++++++++++++++----
> > ------
> > >  include/linux/dma-heap.h   | 25 ++++++++++++++++
> > >  2 files changed, 69 insertions(+), 16 deletions(-)
> > >=20
> [snip]


