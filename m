Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FD5C4828F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NN/ggxE6zp/Y1IoNQERPdWJUv6afgR+QSAVhmKfAOOw=; b=oWqwH8QzXq16xW3ou1o84lRY9i
	7jfdAosyEWSoGc2FSaNa2MlYHB9KrzMmZystQzljEY5glq6RqRv0an3GCqNGpRtv8a+ghkUNRkLdm
	I79o2wvtYykC0Fxd4ZI0zllCfYBvkKptYxblAF8mAXzHFz1boIaz89XR4q4i8cFHoNCRX9bV6QOtq
	/vZF50F3aCrqrW4rOs9oTuqXEOGH6PPMPOp9j2BBQw8sihmdy6UsqvYWgyPRf5+E2iNm167X94xlq
	RrPUhW6ritxWL+SRWpOL5Bdax84jYQ+mI/LLMu6dbNTMLmSUVuDkAFoX1rVHQ/1oOxZNIK6/RU9j4
	kq4834lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXipY-0000000AtKo-0W3z;
	Wed, 07 Feb 2024 14:23:16 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXipV-0000000AtK0-17AD
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Feb 2024 14:23:14 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-60498c31743so4431407b3.3
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Feb 2024 06:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707315791; x=1707920591; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NN/ggxE6zp/Y1IoNQERPdWJUv6afgR+QSAVhmKfAOOw=;
        b=tIU1NUvjDkH7KuteHPd8u8nMjOJh0ETcmj0ejW5Vau/Vl/meeyzQc6z5QSRnRwUuyl
         3Pm+88SoonZcUOOgrZ/JrxGOpINY3AKotONkvARJYRWfQe4ifx4U4Wlvj8Hrp9wH8YTD
         T9pDBilbiE2ouDBaHWilXzJW7moxZw2rKJD8Wc6cAoSRInEXR/m5nvRcH38MxmIBguY7
         2zjVmojgnNl27XC9urMm2QeCAMSzm4pVq/8W4B/p/37zuBV/wMD0JfcHac+ieEVuqYnx
         9Z8S/MvwfSmlefc8ImTv5XYJhvC8SALq3sy1GnyxHq/Ee/2yrjyWrWaZEWOLzO7VAfOi
         BAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707315791; x=1707920591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NN/ggxE6zp/Y1IoNQERPdWJUv6afgR+QSAVhmKfAOOw=;
        b=hZVe8/r930qD3ie7Xrjdawl6a/cmpygIt5OqkggOoScyrStc7ovsqtyQHvLD887NOr
         4GUXkILAmtMo2JQRV5kHIbB2ETTCTZS7STcgYxlNRMrRsD7i0nEeXjTf0Mg4Mkj1c+gK
         Bihb10hTBuYEFuk84vftqA5fmQ8KSwkCe9cmlNWg/MDD/8gK4P+5u+l67bcFVMNAV/Ju
         oH+adx0q/mCEB0KjnsoFfNqYJn3HUFhguGqMkbUT4XRbIgAg5zAZHXHMANyTxsaD/DTW
         A4yYMc9Xr2WsYVUDeaetZg8K8PxOTn7OUkLls6OHhmc1d6lccWgxN2Et5U2S+nouLh8B
         8pYA==
X-Gm-Message-State: AOJu0Yyc8Sk3X0Whbl3QPPMgIB/dwHK+nZI+9+9POTM7iAAu7YEW2RR8
	7abO47WIYiVHcd9XA9So/LJxvSLKtubvchNnt9488ZlfdzLSmL5HFBTorZhg9ZopEhIcg1kwoR+
	Kl8W1ijEepvdi6i9ByfkqadeK5LjXWX9+51wkVA==
X-Google-Smtp-Source: AGHT+IEsEJHF3eE74QW4d9YvkhCZ3ENkFCjw3eZ4LAzUtI+jLHojONNq4/nJ0gGQ3kI/P9NFLLSds3yeJ1sOEIAlb5s=
X-Received: by 2002:a81:e345:0:b0:604:4597:b904 with SMTP id
 w5-20020a81e345000000b006044597b904mr4948767ywl.31.1707315791482; Wed, 07 Feb
 2024 06:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
 <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
 <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>
 <ZcMvFtAwQQjAZhk6@linaro.org> <CAA8EJprqWLX7_yWZzKp3FAKFGkSkk041f9hj1uXuRBrbH5APyQ@mail.gmail.com>
 <ZcNIddeG6VHxBEOQ@linaro.org> <CAA8EJpo-16u34Yc6MLmHSqFrQ0VrZAq6TwGeVc5WFwMmhruqoA@mail.gmail.com>
 <b4018932-2fcb-4a15-9ec4-e29e5761d3e0@collabora.com>
In-Reply-To: <b4018932-2fcb-4a15-9ec4-e29e5761d3e0@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 16:22:59 +0200
Message-ID: <CAA8EJpo5bb+AWJra26MoDPKE_vF+eBAJAGoxenkMtGWz2N5Tuw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] spmi: Add support for multi-master
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_062313_335975_9E8D4744 
X-CRM114-Status: GOOD (  31.02  )
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

On Wed, 7 Feb 2024 at 14:46, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/02/24 12:45, Dmitry Baryshkov ha scritto:
> > On Wed, 7 Feb 2024 at 11:08, Abel Vesa <abel.vesa@linaro.org> wrote:
> >>
> >> On 24-02-07 09:23:09, Dmitry Baryshkov wrote:
> >>> On Wed, 7 Feb 2024 at 09:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> >>>>
> >>>> On 24-02-07 01:55:39, Dmitry Baryshkov wrote:
> >>>>> On Wed, 7 Feb 2024 at 01:34, Abel Vesa <abel.vesa@linaro.org> wrote:
> >>>>>>
> >>>>>> Some newer SPMI controllers support multiple bus masters.
> >>>>>> Such a master can control multiple slave devices. The generic
> >>>>>> framework needs to be able to pass on the master id to the
> >>>>>> controller-specific driver. So do that. The framework will
> >>>>>> check if the devicetree child nodes are actually bus masters
> >>>>>> and will register the devices for each master. The legacy
> >>>>>> approach will still be supported for backwards compatibility.
> >>>>>
> >>>>> Please remind me, are those two actual bus musters driving a single
> >>>>> bus in parallel or two SPMI buses being handled by a single device? In
> >>>>> the latter case this implementation is incorrect. There should be
> >>>>> multiple spmi_controller instances, one for each bus. Allocate them in
> >>>>> a loop and set ctrl->dev.of_node after allocating.
> >>>>
> >>>> It's two SPMI buses (two sets of wires) handled by the same controller,
> >>>> HW-wise.
> >>>>
> >>>> If we register two spmi controllers with the kernel framework, it will
> >>>> be HW inaccurate, because there is just one controller which has
> >>>> multiple masters.
> >>>
> >>> struct spmi_controller is a controller for a single bus. Inside your
> >>> device you have two SPMI buses, each can be controlled by its own
> >>> struct spmi_controller. Just like devices that control multiple I2C,
> >>> SPI or USB busses register a separate instance of the bus controller.
> >>
> >> Well, this is what this patchset is trying to do in the generic part.
> >> The SPMI controller supports multiple buses (HW-wise) and therefore SW
> >> implementation shouldn't be tied to single bus requirement.
> >
> > So, after the off-line discussion:
> > - add new compatible string for sm8450+
> > - register two spmi controller instances
>
> Well, I don't know about the actual hardware that you're trying to implement
> but, in my opinion, the "idea" of this series does actually make sense.
>
> The SPMI specification says that SPMI supports up to 4 masters, and up to
> 16 slaves.

So, that is my main question: whether this supports multiple masters
on a same bus or multiple buses. From the SoC pins description I
assume the latter is the case.

>
> Just my two cents.
>
> Cheers,
> Angelo
>
> > - drop the master-id from the SPMI interface
> > - optionally: think about having a new separate driver for v7 SPMI.
> >
> >>
> >>>
> >>>>
> >>>> I'm not saying it might not work. But, to me, it looks more like a hack.
> >>>>
> >>>> Basically, we would be mapping HW bus masters to kernel controllers.
> >>>
> >>> Buses, not just masters.
> >>>
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> >>>>>> ---
> >>>>>>   drivers/spmi/spmi-mtk-pmif.c |  6 ++--
> >>>>>>   drivers/spmi/spmi-pmic-arb.c | 10 +++---
> >>>>>>   drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
> >>>>>>   include/linux/spmi.h         | 10 +++---
> >>>>>>   4 files changed, 67 insertions(+), 35 deletions(-)
> >>>>>
> >>>>> --
> >>>>> With best wishes
> >>>>> Dmitry
> >>>
> >>>
> >>>
> >>> --
> >>> With best wishes
> >>> Dmitry
> >
> >
> >
>
>


-- 
With best wishes
Dmitry

