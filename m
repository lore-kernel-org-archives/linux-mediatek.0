Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CDAC433EB
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 14:12:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96EF72073E
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 14:12:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MF86g5Ep";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="B8ffA7US"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96EF72073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vqq3QHrVLNQ7ls5Ri29iLEVBiWOcQLlR/R4bF9cH+tA=; b=MF86g5EpJVZsLOje8vnlDBPQt
	zh3cfS8tc6vcpkOaK1EwpFdrj9qaCaxEFIQXPVu2APNYptQf5tk+R7UUOohMjuEnlxgS76BhoeeHb
	VdZtctF5t9CU/MxhyhfNLU5If3bVJakoWuwUitwF9zHW0bIRJOM+CVwEqDW9V4s4LnJInHtYgClUV
	F2dy+6xcHSpn/x/dZMZvst1IuJNwbVdF80xwBRklgRJv/NMF0QT/3nPFcLuYLZkR2lgjLVZW10VDy
	CelTPaxoxoFGYUhEaKA4vCjxlO5c6RM+y2ODMuF8g9s7LWj8A1R8k/RjOf8qF1Z6sMti84uM3oHyF
	5/Pkw568w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k03rx-0006CA-Rc; Mon, 27 Jul 2020 14:12:45 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k03ru-0006Bb-Vp
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 14:12:44 +0000
Received: by mail-ed1-x543.google.com with SMTP id di22so5077036edb.12
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bHapzJ0P6xUuZ32/Fm3FmLxN3+W0YiwvdWtul3bH0zc=;
 b=B8ffA7US+1YKsKILPUPB+8nSLr6m3RTdAtBDehe3oxJyYQ7mRu0QiHt38w+fEdoQLG
 jdtbJLjSnRSRs/U27O/03LK5W+gje6bfwur455MeP9VxwLT2oacer2EFrUSWfGQTiLPB
 4h1da6SxVTQRL/KFHQX9UU1+yoqZj9ixBqaNUTqHfI65CDLmTa5U4K/qYpJ+TliA0tp2
 JVZQcMqIOpnHq74+mduHT8TTmn6SyfFisCcaQWuKE/+ebwlkl0D/ua+qRPGv0qGwiZcL
 3yq6hBbdW9Ougv+EJhJsaYgbOO5xj0GXvY97kJG3ZLX1bVQmX4PiZjuEtSHUsYJRo6n/
 vhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bHapzJ0P6xUuZ32/Fm3FmLxN3+W0YiwvdWtul3bH0zc=;
 b=gW5aPiVey0vY9sq1hSP8Vh2oRvpsZVp+kl1p0dm4ibPMuNsQAPWIg2otHqulMJZwRF
 0ocb/hEIc7Qk5FR2By1Lp8kWs5rGfAzGS0+bcviyDvO6lHl84HkKbp8HJCnS/4hwGd+E
 SQ+I8n52pStGZ0VVQ0hdfLuQWJumqmgNqDk4MexGteNL1Sbi8WuBv03H38SPNVbQJN83
 zNd0cNJhc4fjraY91pbBQXLde841qmW5guXiKvfcWAVwVz4ekaX4MXSZthiCQAtP+s1Z
 CEZXsQ04aeMGb3Fo0JKpWuM0B5qpWPg6wkSj73bLDMUjFTKtJKkIhbM/agIbT1D3LY7D
 KROQ==
X-Gm-Message-State: AOAM532zdNBP0ocoKHQLNBaRW2SKqtqjTmejQuMC1v+r8VyHz8qWCheG
 mNiCFUpAI6dgdvv76S2P+GaFFmSV8pGsa7HBldGyHw==
X-Google-Smtp-Source: ABdhPJzL6g6Q0QOmH9j7dy280O/qkgraYf1W+MBlD2oMwuVrryHQjjWkm7mAfQzWBU2TtCCTk/dPSXhirg3BW3/hgPg=
X-Received: by 2002:a05:6402:947:: with SMTP id
 h7mr21787651edz.213.1595859161489; 
 Mon, 27 Jul 2020 07:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-3-acourbot@chromium.org>
 <CAAEAJfD8yfdTptkmXoPzrw6S=6eKr=K4yL9-5aq2JtWF7M3=7w@mail.gmail.com>
 <CAPBb6MW3AC2savGCHk8w98u1oRuZAs9m6sqz++ksJ58DGvJ5nQ@mail.gmail.com>
In-Reply-To: <CAPBb6MW3AC2savGCHk8w98u1oRuZAs9m6sqz++ksJ58DGvJ5nQ@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 27 Jul 2020 11:12:30 -0300
Message-ID: <CAAEAJfB1cBM-QCg1Sg6iwyQps7r6osY69p68Q-0_YzmSPhNgXw@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: media: mtk-vcodec: document SCP node
To: Alexandre Courbot <acourbot@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_101243_409562_9A13940D 
X-CRM114-Status: GOOD (  29.75  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 27 Jul 2020 at 06:06, Alexandre Courbot <acourbot@chromium.org> wrote:
>
> On Thu, Jul 23, 2020 at 6:37 AM Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > On Mon, 13 Jul 2020 at 03:09, Alexandre Courbot <acourbot@chromium.org> wrote:
> > >
> > > The mediatek codecs can use either the VPU or the SCP as their interface
> > > to firmware. Reflect this in the DT bindings.
> > >
> > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > > ---
> > >  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > > index b6b5dde6abd8..7aef0a4fe207 100644
> > > --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > > +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > > @@ -19,7 +19,9 @@ Required properties:
> > >  - iommus : should point to the respective IOMMU block with master port as
> > >    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > >    for details.
> > > -- mediatek,vpu : the node of video processor unit
> > > +One of the two following nodes:
> > > +- mediatek,vpu : the node of the video processor unit, if using VPU.
> > > +- mediatek,scp : the noode of the SCP unit, if using SCP.
> > >
> >
> > This interface doesn't enforce the fact only one of the two
> > should be present, but not both (which is the case, right?).
>
> That's correct.
>
> >
> > I hope I'm not bikeshedding here, but from an interface POV,
> > would it be cleaner to just have a single mediatek,coprocessor
> > property, and then use of_device_is_compatible
> > to distinguish VPU from SCP type?
>
> From an interface point of view maybe, however doing so would
> introduce a backward-incompatible change with the existing MT8173
> bindings. I also feel like it is less error-prone to have the property
> explicitly state what it is expecting at the other end of the phandle
> (vpu or scp) instead of the more generic "coprocessor".
>
> >
> > Moreover, I'd argue you don't need a dt-binding change
> > and should just keep the current mediatek-vpu property,
> > and then rely on of_device_is_compatible.
>
> VPU and SCP are different kinds of processors, so I'm not sure whether
> it is desirable to use VPU interchangeably like this. Note that I'm
> not strongly against it either, but for things like bindings I tend to
> prefer precise language to avoid confusions.

Yeah, I guess that makes sense.

Not only from a language precision point of view (after all
DT are not designed to be human readable).

But as you mention, given the processors will have different compatible
strings it would make sense to not allow overloading the property.

In any case, I don't have a strong opinion either.

Thanks,
Ezequiel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
