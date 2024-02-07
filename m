Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FDBC4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 09:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Qq9fKE0PbbyCrGJIA20pSw+ym9q88uvFFEEL0mTROA=; b=1XyssM2wV2RK4wSievgApvVDhi
	5PQVpj7nIGDGTMwdG+QcXBvzGcfUfKdl9rGWfEjTW5izq4CrQv3kRGy2LM9CFxXj/u0LB3Q2yRUga
	SA+oVe6n60jTNA1krWHl76v3SlMX+q23/FAEtE/MvF4fLNEpDp15JEqvrHns6kHOIgak45tHzgzv8
	2WNwsrjjie83IFly/7v4E8ciAic6MhusAOmbOpQJH4xNTxYDN2SDoIiDSjEivdu7Om7OlT3AsWBvp
	VPQ/aPOMv2umOd/EKHNxQ3pzRvW0sV86U14Zyxby5F9Sw4yQuju0xRaixP192ziiiieWBLxogCOAi
	6yh6QEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXeTr-0000000AEsE-15Z2;
	Wed, 07 Feb 2024 09:44:35 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXeTo-0000000AErG-0rTj
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Feb 2024 09:44:33 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6049b3deee8so622137b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Feb 2024 01:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707299071; x=1707903871; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Qq9fKE0PbbyCrGJIA20pSw+ym9q88uvFFEEL0mTROA=;
        b=mIa4k5OPjGwjfIkp+tYRdrsf8mAbvy4Rw0l0GCyg5qbzJYzArHjmCbNLpiQP5gVUd9
         tjdyGBUMwpH4YXDmwOdZ/nUIJmAGLeHHFcKcYbjirrFNdOeLVdy+L0qFhs1UXewv8bzz
         T8sCqHHEEmJWAbWMuHPkn+fa1dt2FNVNh0OwnQLou3VxKMCsYVT5L6sCSy8aTB5YJDdL
         k14pcz/jfb/W3YnkKp9e01JlYmbgzBXs04bXXcIoDUCi3bqg/kMXTlLsbvZjWoSnNdni
         xlkx4r1cr3toGJZRPvg/M/lrVyLOZ6ME0L0zd86lK2RP4KgVfVJlkWcCdzNp9SNGsFXB
         KWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707299071; x=1707903871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Qq9fKE0PbbyCrGJIA20pSw+ym9q88uvFFEEL0mTROA=;
        b=VmGx3nNWgeGqlStoHJ41mDkSbumffeA9HrvGLNopaGGMdNspAoxE/oDU/iJmq1WOV/
         YZAJPgBrsDJNjRS0hUz8VToswVSH45VDaZaEF+xCumH20+XpbL665S7RknUmCgYCaySs
         QytG+AOHO8MJGl4pQ1HvFPpw47t/49xCcgb6V3ebfyxroakQNDeGMPXCUG42MCVFayv/
         OjttvDKFEDKU7Ogf8mX0H58tgHoXt901vCjYHZQT2DBsgSTluzivQJnC0TLju9tnK521
         VgZoi8l+wRbhdqvCLy44AdCEffHr5zCz6iK6kHBvEmyKXyAoxNgaOjPCh5IH6Ut5bo0i
         2BAA==
X-Gm-Message-State: AOJu0YwRJVk8vvdW1EE75H6XMgQpCJr/C16l6mPHINL/2K0qnR0z0zd1
	ek0yhlYWCNvwOYrq3y5xrmS+sX8z9+bJy8avy342xuuMosUawZCL1LLKlcEuBX1zYQrd6B2bLxY
	pWb0dAlkWNLMuIbB2uwGBPFgu2LBsz0Mc1S+lCA==
X-Google-Smtp-Source: AGHT+IGnNsEbsmiOhjkKEnxryb14NGX6I9zOgtrEXZxh49eoiYIjEQ/Cu/1+CeZbgwi0SgrY+47qDSRAYACNAXYqpdQ=
X-Received: by 2002:a81:4893:0:b0:5ff:7cca:a434 with SMTP id
 v141-20020a814893000000b005ff7ccaa434mr3711732ywa.51.1707299070789; Wed, 07
 Feb 2024 01:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
 <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
 <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>
 <ZcMvFtAwQQjAZhk6@linaro.org> <CAA8EJprqWLX7_yWZzKp3FAKFGkSkk041f9hj1uXuRBrbH5APyQ@mail.gmail.com>
 <ZcNIddeG6VHxBEOQ@linaro.org>
In-Reply-To: <ZcNIddeG6VHxBEOQ@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 11:44:19 +0200
Message-ID: <CAA8EJprgkM9fO967Swrzjf4PYuVoSpmXLU-zadN4eKhjez30Gg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] spmi: Add support for multi-master
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_014432_277730_E241AD74 
X-CRM114-Status: GOOD (  31.66  )
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

On Wed, 7 Feb 2024 at 11:08, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-02-07 09:23:09, Dmitry Baryshkov wrote:
> > On Wed, 7 Feb 2024 at 09:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > On 24-02-07 01:55:39, Dmitry Baryshkov wrote:
> > > > On Wed, 7 Feb 2024 at 01:34, Abel Vesa <abel.vesa@linaro.org> wrote:
> > > > >
> > > > > Some newer SPMI controllers support multiple bus masters.
> > > > > Such a master can control multiple slave devices. The generic
> > > > > framework needs to be able to pass on the master id to the
> > > > > controller-specific driver. So do that. The framework will
> > > > > check if the devicetree child nodes are actually bus masters
> > > > > and will register the devices for each master. The legacy
> > > > > approach will still be supported for backwards compatibility.
> > > >
> > > > Please remind me, are those two actual bus musters driving a single
> > > > bus in parallel or two SPMI buses being handled by a single device? In
> > > > the latter case this implementation is incorrect. There should be
> > > > multiple spmi_controller instances, one for each bus. Allocate them in
> > > > a loop and set ctrl->dev.of_node after allocating.
> > >
> > > It's two SPMI buses (two sets of wires) handled by the same controller,
> > > HW-wise.
> > >
> > > If we register two spmi controllers with the kernel framework, it will
> > > be HW inaccurate, because there is just one controller which has
> > > multiple masters.
> >
> > struct spmi_controller is a controller for a single bus. Inside your
> > device you have two SPMI buses, each can be controlled by its own
> > struct spmi_controller. Just like devices that control multiple I2C,
> > SPI or USB busses register a separate instance of the bus controller.
>
> Well, this is what this patchset is trying to do in the generic part.
> The SPMI controller supports multiple buses (HW-wise) and therefore SW
> implementation shouldn't be tied to single bus requirement.

SPMI controller doesn't support multiple buses. You have a device
which has two SPMI controllers inside. Just like all multi-bus
controllers.

>
> >
> > >
> > > I'm not saying it might not work. But, to me, it looks more like a hack.
> > >
> > > Basically, we would be mapping HW bus masters to kernel controllers.
> >
> > Buses, not just masters.
> >
> > >
> > > >
> > > > >
> > > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > > ---
> > > > >  drivers/spmi/spmi-mtk-pmif.c |  6 ++--
> > > > >  drivers/spmi/spmi-pmic-arb.c | 10 +++---
> > > > >  drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
> > > > >  include/linux/spmi.h         | 10 +++---
> > > > >  4 files changed, 67 insertions(+), 35 deletions(-)
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

