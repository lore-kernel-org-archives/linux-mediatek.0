Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10F7E82CC5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 18:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MurAOYPXjHwdvk7TTp2tGZ93V7FzPadwfJU/w4cmONw=; b=vUcuzlvnrfyAnJepKTRbDneSTl
	nBGsHm/I7ft56r5XjCmIxNnagkQGHw7z3vxWgndSKfyE3gf8F9x1AldN2qAd3K+nOm5/3cikEH3GK
	LL8a+kb3PCwS1AB9zLR94A+rPA6b0PPcZ3GlpKTysxcNC3YsYGFvopcW/LEUKXx/WK8kHURUPfU/s
	agkPOjdsovfv598IXNuBd2d5R9QVgfKEqkdQYEc2+oxZkLyZGzBHbCDr7G+Iq+wTVBiziNAGx+dGq
	XocUUfYELvpgcob4YNfTsco7xjFG55cFuoCLQhVuqYJEbrGGqnp/qOc0SyFsbLPAOR6Sa0TGyXQVC
	2laJIT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlZi7-001bwa-2I;
	Wed, 27 Sep 2023 18:56:35 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlZi4-001bvD-39
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Sep 2023 18:56:34 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3514ece5ed4so25625ab.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Sep 2023 11:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695840991; x=1696445791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MurAOYPXjHwdvk7TTp2tGZ93V7FzPadwfJU/w4cmONw=;
        b=LBFhPdDgrlUJtR1+fYD2TpQcuEOF8BwmjTPLplLrxotwdYKHrC6lmfvJMSg1KLGaO0
         yxxEdfbPxi0G11bIvnE1Jp95yVCT86kPGCSXPQV4HSZJ2/0lmMX0Bc0Rv3Xp+8pWeQCx
         oMbEabC5NWAJmMq+6/I76nXG2m/Hopq3aOzSJA7qZd/1FMtYfL4zNTlMDLNkb7/OnRti
         ZCTGQCRi2IorkJHHOAQ5aFzxl5DAV6LmscU/Pr+pOgt/kKkznha7qHNZ4wbtAmqmFo9S
         xqR86oyqJp/cgptxw7Ny1ipdpNbVV2d5xqZdF58kHd/+4bc+J9MuW8Z4isKz+dUPthBp
         9aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695840991; x=1696445791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MurAOYPXjHwdvk7TTp2tGZ93V7FzPadwfJU/w4cmONw=;
        b=wpLr+HAQWsQbveaEJyDeaaz2PwjIjUKpCT0eLiBDrbFqN+z/8tj0W4bkurelmZ8pwE
         Tsv1zMvqwOA7C77NJV5bSdpQgVcS3zriiHbMzCWC9ILTaW3c+05jvcCjLiOWm7a+yKDH
         VbuUD6DBvrOU7h33JfX+gAMnvVgpCvccTD3n0gHB7Xp8sW2hVvHvwlD882XrvZY7yQAh
         MZkoWYciEFxai/3o5oy9u3T2w8ux2PTXgu2m8K2DChF6Wb0CBjuIZykLaF6MxQrucHHQ
         TO+CSDd5ZX+rsY/cW9ZEhsrl4E+RcNdeW5/0pKvocMVx+QgLUNWnT6i5FzzvI2cDSeaU
         77fA==
X-Gm-Message-State: AOJu0YyVCKGr9jKbZ3VvUbhW07zhyLtgFq13lAhuYiuOIPFIq9NTYdIe
	/+OV0Dx9tj6+lLcza2/tuzXp0KeSTlE+wyyFSr4C
X-Google-Smtp-Source: AGHT+IHpy0ebrOGWKBvJhgjGq+yQihXMl6pVYmNyHBVx+lU9W2/wuviNywEw1Opgza+nHML4UERjWiWazlDFeUjnHnI=
X-Received: by 2002:a05:6e02:1988:b0:34f:71b0:e72b with SMTP id
 g8-20020a056e02198800b0034f71b0e72bmr693354ilf.27.1695840991320; Wed, 27 Sep
 2023 11:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230911023038.30649-1-yong.wu@mediatek.com> <20230911023038.30649-6-yong.wu@mediatek.com>
 <d0373c02-9b22-661f-9930-ca720053c2a0@collabora.com> <a115a2a5d3ac218e6db65ccdb0a1876f9cfca02b.camel@mediatek.com>
 <d798b15b-6f35-96db-e3f7-5c0bcc5d46a2@collabora.com> <a4ecc2792f3a4d3159e34415be984ff7d5f5e263.camel@mediatek.com>
 <20230927134614.kp27moxdw72jiu4y@pop-os.localdomain> <3aaafe47-3733-a4d5-038d-a7e439309282@collabora.com>
In-Reply-To: <3aaafe47-3733-a4d5-038d-a7e439309282@collabora.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 27 Sep 2023 11:56:20 -0700
Message-ID: <CA+ddPcP4=p37cV5Tbn5zTUbiL4ou+Yqb=5rS+O_ff8ZUw64D3Q@mail.gmail.com>
Subject: Re: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Joakim Bech <joakim.bech@linaro.org>, =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"jstultz@google.com" <jstultz@google.com>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	=?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>, 
	=?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, 
	"tjmercier@google.com" <tjmercier@google.com>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_115633_009711_E74643DE 
X-CRM114-Status: GOOD (  43.09  )
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

On Wed, Sep 27, 2023 at 8:18=E2=80=AFAM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 27/09/2023 =C3=A0 15:46, Joakim Bech a =C3=A9crit :
> > On Mon, Sep 25, 2023 at 12:49:50PM +0000, Yong Wu (=E5=90=B4=E5=8B=87) =
wrote:
> >> On Tue, 2023-09-12 at 11:32 +0200, AngeloGioacchino Del Regno wrote:
> >>> Il 12/09/23 08:17, Yong Wu (=E5=90=B4=E5=8B=87) ha scritto:
> >>>> On Mon, 2023-09-11 at 11:29 +0200, AngeloGioacchino Del Regno
> >>>> wrote:
> >>>>> Il 11/09/23 04:30, Yong Wu ha scritto:
> >>>>>> The TEE probe later than dma-buf heap, and PROBE_DEDER doesn't
> >>>>>> work
> >>>>>> here since this is not a platform driver, therefore initialise
> >>>>>> the
> >>>>>> TEE
> >>>>>> context/session while we allocate the first secure buffer.
> >>>>>>
> >>>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> >>>>>> ---
> >>>>>>     drivers/dma-buf/heaps/mtk_secure_heap.c | 61
> >>>>>> +++++++++++++++++++++++++
> >>>>>>     1 file changed, 61 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c
> >>>>>> b/drivers/dma-
> >>>>>> buf/heaps/mtk_secure_heap.c
> >>>>>> index bbf1c8dce23e..e3da33a3d083 100644
> >>>>>> --- a/drivers/dma-buf/heaps/mtk_secure_heap.c
> >>>>>> +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
> >>>>>> @@ -10,6 +10,12 @@
> >>>>>>     #include <linux/err.h>
> >>>>>>     #include <linux/module.h>
> >>>>>>     #include <linux/slab.h>
> >>>>>> +#include <linux/tee_drv.h>
> >>>>>> +#include <linux/uuid.h>
> >>>>>> +
> >>>>>> +#define TZ_TA_MEM_UUID          "4477588a-8476-11e2-ad15-
> >>>>>> e41f1390d676"
> >>>>>> +
> >>>>> Is this UUID the same for all SoCs and all TZ versions?
> >>>> Yes. It is the same for all SoCs and all TZ versions currently.
> >>>>
> >>> That's good news!
> >>>
> >>> Is this UUID used in any userspace component? (example: Android
> >>> HALs?)
> >> No. Userspace never use it. If userspace would like to allocate this
> >> secure buffer, it can achieve through the existing dmabuf IOCTL via
> >> /dev/dma_heap/mtk_svp node.
> >>
> > In general I think as mentioned elsewhere in comments, that there isn't
> > that much here that seems to be unique for MediaTek in this patch
> > series, so I think it worth to see whether this whole patch set can be
> > made more generic. Having said that, the UUID is always unique for a
> > certain Trusted Application. So, it's not entirely true saying that the
> > UUID is the same for all SoCs and all TrustZone versions. It might be
> > true for a family of MediaTek devices and the TEE in use, but not
> > generically.
> >
> > So, if we need to differentiate between different TA implementations,
> > then we need different UUIDs. If it would be possible to make this patc=
h
> > set generic, then it sounds like a single UUID would be sufficient, but
> > that would imply that all TA's supporting such a generic UUID would be
> > implemented the same from an API point of view. Which also means that
> > for example Trusted Application function ID's needs to be the same etc.
> > Not impossible to achieve, but still not easy (different TEE follows
> > different specifications) and it's not typically something we've done i=
n
> > the past.
> >
> > Unfortunately there is no standardized database of TA's describing what
> > they implement and support.
> >
> > As an alternative, we could implement a query call in the TEE answering=
,
> > "What UUID does your TA have that implements secure unmapped heap?".
> > I.e., something that reminds of a lookup table. Then we wouldn't have t=
o
> > carry this in UAPI, DT or anywhere else.
>
> Joakim does a TA could offer a generic API and hide the hardware specific
> details (like kernel uAPI does for drivers) ?
It would have to go through another layer (like the tee driver) to be
a generic API. The main issue with TAs is that they have UUIDs you
need to connect to and specific codes for each function; so we should
abstract at a layer above where those exist in the dma-heap code.
>
> Aside that question I wonder what are the needs to perform a 'secure' pla=
yback.
> I have in mind 2 requirements:
> - secure memory regions, which means configure the hardware to ensure tha=
t only
> dedicated hardware blocks and read or write into it.
> - set hardware blocks in secure modes so they access to secure memory.
> Do you see something else ?
This is more or less what is required, but this is out of scope for
the Linux kernel since it can't be trusted to do these things...this
is all done in firmware or the TEE itself.
>
> Regards,
> Benjamin
>
> >

