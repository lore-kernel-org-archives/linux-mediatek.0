Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B17E732FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 17:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lc7tMjE9TqzKqjNwesj3iwB/DY3hf+maktURRWmeOo=; b=g2fr2yYV0YmPi2U3fTmuRFgTaV
	thoeqMIipUdyHkj3PrzrSZvtbtsWHhKYXnQWpr3rWUnwm06tN5UcWeb1reL1IooMSwdrEs1wkFPjc
	FcqRyl49Cu/9yrrlFqyYi2Kz5EAvLC9opAktYbk7ptsqxFcJqjYekmP8BmrElp7ZICPK9Q9bwkCU7
	C3hTgujd2VE7vhxQU0PcHSjhZl7MX+TqQXkJRLHlcYb999tY/b38FSgODJwhjbE52bf2uYrZrBNXM
	EH0hZr56xYdOx1/ZmTyY/l2/IuVlm328A7MoqErlDHiJqvsZmDKUojO/rtkagUC3/9fOB73BE3FuD
	4wJHW1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlv7p-006SaA-2u;
	Thu, 28 Sep 2023 17:48:33 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlv7m-006SYl-1c
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Sep 2023 17:48:33 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3514ece5ed4so12525ab.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Sep 2023 10:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695923307; x=1696528107; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lc7tMjE9TqzKqjNwesj3iwB/DY3hf+maktURRWmeOo=;
        b=xQbXXUAJerhA5fdtz0z42cLWlgutjiGE17DXLLxVNbnbv1PO3JFvRUUrr4enbTnGnK
         VK+uMpNfZCknmK+C4xziOyQltob8LLzhsZybgk+lcf/L/x/3qmDidLCaA2R+1mxZw08K
         IeQodKWTBo8uyT4vD0gCcrB35O7VzJk4NhfMXJuke2vTDlpnIPrSIz7feNvMe58sznKp
         aPBrdFa7GCLYS69pu99UZ96kvX8d9ZdfvYWaGaumVHJb7ivuU+B9z1tAngYR294ptGnp
         S1Sy9E3RQZhem9M8fCK7+RXoZTTgl2fwMEMBriSh8JAVYezbrf7XqaKsNmqcEXsK3IU7
         s4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695923307; x=1696528107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lc7tMjE9TqzKqjNwesj3iwB/DY3hf+maktURRWmeOo=;
        b=I+sw64cLpTWqvc5lNISFHlzZkLpzjlIcws6XVf2i8tF2JTN+VoQhzIFZGDFulJOCZ1
         NdxTrxZod0/uOl63PCC6Y5T4AD8oCS98HxVIQF2zsJaEv/JzuHnTiH68No9RLO4pK2kA
         2parYoIMJVn9VKJtPWTDJFccg68TZt24Z6km1KciVUEa851OqHRW85v37E2+QFGqLl9Z
         Ln7JtiR91Nt8S6lAgD5uaEvDcCMBGAkOchOuZ7KO6otBz0KX0hZLYxh0708Ukyk4/+B0
         d54pHVa7huV0OC2HTdXQQuthc0229N3972A2slQaIXAtN5Dd2WGaNkTPj/i7rx02Ndqg
         /FGQ==
X-Gm-Message-State: AOJu0YzXiZeGdavn8qVbR7uEhQ1we/oItmvltveIk3IbYOLFxsLr73BV
	VqCUARUJvbxLaCNLKHKiO/+du1DVpwA4ux87BUTx
X-Google-Smtp-Source: AGHT+IEKTkNfxDliwI/2EJS9nYa/IghQB0LorE6+1+ZjJfiK83nWSSutkNVwiV47LmZ4lKR2ji8rXU0JRU5ZMy5AJDw=
X-Received: by 2002:a05:6e02:1486:b0:34f:5587:4353 with SMTP id
 n6-20020a056e02148600b0034f55874353mr1062211ilk.25.1695923307247; Thu, 28 Sep
 2023 10:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230911023038.30649-1-yong.wu@mediatek.com> <20230911023038.30649-6-yong.wu@mediatek.com>
 <d0373c02-9b22-661f-9930-ca720053c2a0@collabora.com> <a115a2a5d3ac218e6db65ccdb0a1876f9cfca02b.camel@mediatek.com>
 <d798b15b-6f35-96db-e3f7-5c0bcc5d46a2@collabora.com> <a4ecc2792f3a4d3159e34415be984ff7d5f5e263.camel@mediatek.com>
 <20230927134614.kp27moxdw72jiu4y@pop-os.localdomain> <3aaafe47-3733-a4d5-038d-a7e439309282@collabora.com>
 <CA+ddPcP4=p37cV5Tbn5zTUbiL4ou+Yqb=5rS+O_ff8ZUw64D3Q@mail.gmail.com> <80695726-1a98-12d4-ad7d-d731f2f3caeb@collabora.com>
In-Reply-To: <80695726-1a98-12d4-ad7d-d731f2f3caeb@collabora.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Thu, 28 Sep 2023 10:48:15 -0700
Message-ID: <CA+ddPcPES=4FcQRkvVnW=C9mL6hCxVfCcoLDJSjb58UiDmS_Mg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230928_104830_538958_7E156A01 
X-CRM114-Status: GOOD (  49.58  )
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

On Thu, Sep 28, 2023 at 1:30=E2=80=AFAM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 27/09/2023 =C3=A0 20:56, Jeffrey Kardatzke a =C3=A9crit :
> > On Wed, Sep 27, 2023 at 8:18=E2=80=AFAM Benjamin Gaignard
> > <benjamin.gaignard@collabora.com> wrote:
> >>
> >> Le 27/09/2023 =C3=A0 15:46, Joakim Bech a =C3=A9crit :
> >>> On Mon, Sep 25, 2023 at 12:49:50PM +0000, Yong Wu (=E5=90=B4=E5=8B=87=
) wrote:
> >>>> On Tue, 2023-09-12 at 11:32 +0200, AngeloGioacchino Del Regno wrote:
> >>>>> Il 12/09/23 08:17, Yong Wu (=E5=90=B4=E5=8B=87) ha scritto:
> >>>>>> On Mon, 2023-09-11 at 11:29 +0200, AngeloGioacchino Del Regno
> >>>>>> wrote:
> >>>>>>> Il 11/09/23 04:30, Yong Wu ha scritto:
> >>>>>>>> The TEE probe later than dma-buf heap, and PROBE_DEDER doesn't
> >>>>>>>> work
> >>>>>>>> here since this is not a platform driver, therefore initialise
> >>>>>>>> the
> >>>>>>>> TEE
> >>>>>>>> context/session while we allocate the first secure buffer.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> >>>>>>>> ---
> >>>>>>>>      drivers/dma-buf/heaps/mtk_secure_heap.c | 61
> >>>>>>>> +++++++++++++++++++++++++
> >>>>>>>>      1 file changed, 61 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c
> >>>>>>>> b/drivers/dma-
> >>>>>>>> buf/heaps/mtk_secure_heap.c
> >>>>>>>> index bbf1c8dce23e..e3da33a3d083 100644
> >>>>>>>> --- a/drivers/dma-buf/heaps/mtk_secure_heap.c
> >>>>>>>> +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
> >>>>>>>> @@ -10,6 +10,12 @@
> >>>>>>>>      #include <linux/err.h>
> >>>>>>>>      #include <linux/module.h>
> >>>>>>>>      #include <linux/slab.h>
> >>>>>>>> +#include <linux/tee_drv.h>
> >>>>>>>> +#include <linux/uuid.h>
> >>>>>>>> +
> >>>>>>>> +#define TZ_TA_MEM_UUID          "4477588a-8476-11e2-ad15-
> >>>>>>>> e41f1390d676"
> >>>>>>>> +
> >>>>>>> Is this UUID the same for all SoCs and all TZ versions?
> >>>>>> Yes. It is the same for all SoCs and all TZ versions currently.
> >>>>>>
> >>>>> That's good news!
> >>>>>
> >>>>> Is this UUID used in any userspace component? (example: Android
> >>>>> HALs?)
> >>>> No. Userspace never use it. If userspace would like to allocate this
> >>>> secure buffer, it can achieve through the existing dmabuf IOCTL via
> >>>> /dev/dma_heap/mtk_svp node.
> >>>>
> >>> In general I think as mentioned elsewhere in comments, that there isn=
't
> >>> that much here that seems to be unique for MediaTek in this patch
> >>> series, so I think it worth to see whether this whole patch set can b=
e
> >>> made more generic. Having said that, the UUID is always unique for a
> >>> certain Trusted Application. So, it's not entirely true saying that t=
he
> >>> UUID is the same for all SoCs and all TrustZone versions. It might be
> >>> true for a family of MediaTek devices and the TEE in use, but not
> >>> generically.
> >>>
> >>> So, if we need to differentiate between different TA implementations,
> >>> then we need different UUIDs. If it would be possible to make this pa=
tch
> >>> set generic, then it sounds like a single UUID would be sufficient, b=
ut
> >>> that would imply that all TA's supporting such a generic UUID would b=
e
> >>> implemented the same from an API point of view. Which also means that
> >>> for example Trusted Application function ID's needs to be the same et=
c.
> >>> Not impossible to achieve, but still not easy (different TEE follows
> >>> different specifications) and it's not typically something we've done=
 in
> >>> the past.
> >>>
> >>> Unfortunately there is no standardized database of TA's describing wh=
at
> >>> they implement and support.
> >>>
> >>> As an alternative, we could implement a query call in the TEE answeri=
ng,
> >>> "What UUID does your TA have that implements secure unmapped heap?".
> >>> I.e., something that reminds of a lookup table. Then we wouldn't have=
 to
> >>> carry this in UAPI, DT or anywhere else.
> >> Joakim does a TA could offer a generic API and hide the hardware speci=
fic
> >> details (like kernel uAPI does for drivers) ?
> > It would have to go through another layer (like the tee driver) to be
> > a generic API. The main issue with TAs is that they have UUIDs you
> > need to connect to and specific codes for each function; so we should
> > abstract at a layer above where those exist in the dma-heap code.
> >> Aside that question I wonder what are the needs to perform a 'secure' =
playback.
> >> I have in mind 2 requirements:
> >> - secure memory regions, which means configure the hardware to ensure =
that only
> >> dedicated hardware blocks and read or write into it.
> >> - set hardware blocks in secure modes so they access to secure memory.
> >> Do you see something else ?
> > This is more or less what is required, but this is out of scope for
> > the Linux kernel since it can't be trusted to do these things...this
> > is all done in firmware or the TEE itself.
>
> Yes kernel can't be trusted to do these things but know what we need coul=
d help
> to define a API for a generic TA.
>
> Just to brainstorm on mailing list:
> What about a TA API like
> TA_secure_memory_region() and TA_unsecure_memory_region() with parameters=
 like:
> - device identifier (an ID or compatible string maybe)
> - memory region (physical address, size, offset)
> - requested access rights (read, write)
>
> and on kernel side a IOMMU driver because it basically have all this info=
rmation already
> (device attachment, kernel map/unmap).
>
> In my mind it sound like a solution to limit the impact (new controls, ne=
w memory type)
> inside v4l2. Probably we won't need new heap either.
> All hardware dedicated implementations could live inside the TA which can=
 offer a generic
> API.

The main problem with that type of design is the limitations of
TrustZone memory protection. Usually there is a limit to the number of
regions you can define for memory protection (and there is on
Mediatek). So you can't pass an arbitrary memory region and mark it
protected/unprotected at a given time. You need to establish these
regions in the firmware instead and then configure those regions for
protection in the firmware or the TEE.

>
> >> Regards,
> >> Benjamin
> >>

