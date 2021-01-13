Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C888CC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 05:23:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7230522B37
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 05:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7230522B37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V3x8QdQqpOwuQASr79C6rECjqPw/VNcmMMdh1aXnQ2I=; b=vqDTXKsjLX//N6qOHjetLIUIq
	+dpawLVOIO9ZIo3QcGwbcFLLleG/Df8ZwvdddePoCgnL2UahM6SVlSGBi4UkVHqTYdYQHht+dwLtR
	1VK1CoI+r7qTg+ptQqncWtpz8oYHmmVj7O+KSBBggM8/s91egrlaL9f6g8DQZBu97e5RMqjoOzmK3
	sJKiXFg8AGOZ3gLdR/jjfUzUfBCYzH6BReU6dZsX9AI2JAvAEx2Y95MRXFa7Gd99DfYNlq9T6DPjv
	+20lSrZGIvcwAm7ndMXkDewZoUYvR2G1jZoKi7MVRHcbzQydtTjopXgW+zCD4sXVtiGYWKBpjLZIG
	zuBMBsCGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzYcj-0004SX-Uq; Wed, 13 Jan 2021 05:23:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzYce-0004RC-Jc
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 05:23:12 +0000
Received: by mail-ed1-x532.google.com with SMTP id cm17so550726edb.4
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Jan 2021 21:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2NaZcbwSAFQ15OW65EbbMjqTmOC5Pf2iFjcyvx6UbnA=;
 b=SkyiyzJ28uSjHS90XLoXBBlIMxeQbmNuAEQ8qW3qG/lEq4KSFJGvKCe2uo6om+eCht
 oHNmuAbEj1wylSDgYYohrZowWD1TI2mPSkvtOcj1vM82/8Tsr+ruktT1iu//pIsXdvzB
 +NLLMVs4Ps2w7DhXFnSO9Nbs5cVRzog+Vam+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2NaZcbwSAFQ15OW65EbbMjqTmOC5Pf2iFjcyvx6UbnA=;
 b=VEwf43Ixhmd7cmL3n1Wi5BDy1lKpG9M2OXXztCPaw5kP5k7tyw3lNmIcWJ/klYcNAo
 c8BH/PpJHm7rWkpYQrsmzTCAYmzpdVsZcmwIQLBikR27nyqz8lmKZAdAy4empJFX1+58
 Go2btsvOik9sLq+fuMSQs7Dm2y+cPFm+3Hy1ZTjAmn0y5X5H+GxfUIhC3OTshTJH5qb5
 ik54oDdfQ31FV7xUXaZ2cHAvNZtgTQ/1+bmwGXS05T9G8UzaDpzYiTyspyYVAgOcUFxY
 Xp0n/gPsFWn4ZJHgMIOx4mt3kzuIep+A8BS/w9eZEW6ERSwAIHELzK8KT6LwT9Pjtfxf
 96UA==
X-Gm-Message-State: AOAM530osUQ7QAXmRiDObE/lAGDtiUvPxxgD+o5tCqf4+YbmFS0DAed3
 CgXlMXVVq5j2Ex+K9dJiK5wrmyutZi60dnqO
X-Google-Smtp-Source: ABdhPJyB+alp9INQUkhi3SqOGcltd9DC/yIlJgqwMFmwD+fjVtSKudsLW+g2kxlmDmev59INCuVJRQ==
X-Received: by 2002:aa7:d919:: with SMTP id a25mr379588edr.81.1610515387083;
 Tue, 12 Jan 2021 21:23:07 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
 by smtp.gmail.com with ESMTPSA id g25sm249064ejf.15.2021.01.12.21.23.03
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 21:23:04 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id g10so427742wmh.2
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Jan 2021 21:23:03 -0800 (PST)
X-Received: by 2002:a1c:c308:: with SMTP id t8mr409738wmf.22.1610515383125;
 Tue, 12 Jan 2021 21:23:03 -0800 (PST)
MIME-Version: 1.0
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-5-yong.wu@mediatek.com>
 <X+L8qpO+T7+U2s5r@chromium.org> <1608809212.26323.258.camel@mhfsdcap03>
In-Reply-To: <1608809212.26323.258.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 13 Jan 2021 14:22:50 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CnnHwCUioH52VRWZW=f7V7Q=xBSfbhMM+qJVtaqSf8Pw@mail.gmail.com>
Message-ID: <CAAFQd5CnnHwCUioH52VRWZW=f7V7Q=xBSfbhMM+qJVtaqSf8Pw@mail.gmail.com>
Subject: Re: [PATCH v5 04/27] dt-bindings: memory: mediatek: Add domain
 definition
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_002308_832876_2B959689 
X-CRM114-Status: GOOD (  33.38  )
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
Cc: youlin.pei@mediatek.com, linux-devicetree <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 24, 2020 at 8:27 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> On Wed, 2020-12-23 at 17:15 +0900, Tomasz Figa wrote:
> > Hi Yong,
> >
> > On Wed, Dec 09, 2020 at 04:00:39PM +0800, Yong Wu wrote:
> > > In the latest SoC, there are several HW IP require a sepecial iova
> > > range, mainly CCU and VPU has this requirement. Take CCU as a example,
> > > CCU require its iova locate in the range(0x4000_0000 ~ 0x43ff_ffff).
> >
> > Is this really a domain? Does the address range come from the design of
> > the IOMMU?
>
> It is not a really a domain. The address range comes from CCU HW
> requirement. That HW can only access this iova range. thus I create a
> special iommu domain for it.
>

I guess it's the IOMMU/DT maintainers who have the last word here, but
shouldn't DT just specify the hardware characteristics and then the
kernel configure the hardware appropriately, possibly based on some
other configuration interface (e.g. command line parameters or sysfs)?

How I'd do this is rather than enforcing those arbitrary decisions
onto the DT bindings, I'd add properties to the master devices (e.g.
CCU) that specify which IOVA range they can operate on. Then, the
exact split of the complete address space would be done at runtime,
based on kernel configuration, command line parameters and possibly
sysfs attributes if things could be reconfigured dynamically.

Best regards,
Tomasz

> >
> > Best regards,
> > Tomasz
> >
> > >
> > > In this patch we add a domain definition for the special port. In the
> > > example of CCU, If we preassign CCU port in domain1, then iommu driver
> > > will prepare a independent iommu domain of the special iova range for it,
> > > then the iova got from dma_alloc_attrs(ccu-dev) will locate in its special
> > > range.
> > >
> > > This is a preparing patch for multi-domain support.
> > >
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > Acked-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  include/dt-bindings/memory/mtk-smi-larb-port.h | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/dt-bindings/memory/mtk-smi-larb-port.h b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > > index 7d64103209af..2d4c973c174f 100644
> > > --- a/include/dt-bindings/memory/mtk-smi-larb-port.h
> > > +++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > > @@ -7,9 +7,16 @@
> > >  #define __DT_BINDINGS_MEMORY_MTK_MEMORY_PORT_H_
> > >
> > >  #define MTK_LARB_NR_MAX                    32
> > > +#define MTK_M4U_DOM_NR_MAX         8
> > > +
> > > +#define MTK_M4U_DOM_ID(domid, larb, port)  \
> > > +   (((domid) & 0x7) << 16 | (((larb) & 0x1f) << 5) | ((port) & 0x1f))
> > > +
> > > +/* The default dom id is 0. */
> > > +#define MTK_M4U_ID(larb, port)             MTK_M4U_DOM_ID(0, larb, port)
> > >
> > > -#define MTK_M4U_ID(larb, port)             (((larb) << 5) | (port))
> > >  #define MTK_M4U_TO_LARB(id)                (((id) >> 5) & 0x1f)
> > >  #define MTK_M4U_TO_PORT(id)                ((id) & 0x1f)
> > > +#define MTK_M4U_TO_DOM(id)         (((id) >> 16) & 0x7)
> > >
> > >  #endif
> > > --
> > > 2.18.0
> > >
> > > _______________________________________________
> > > iommu mailing list
> > > iommu@lists.linux-foundation.org
> > > https://lists.linuxfoundation.org/mailman/listinfo/iommu
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
