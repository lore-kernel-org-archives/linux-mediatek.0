Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7513C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 00:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rGhQNj8uyI81ckYT+VVXENe31UkgplONZDpQgE07Oc=; b=GTcrW4GTtYXnv8SEn4IMjWsTg2
	zmxykzoXJZ9LyseC4kWFr0wr/3mbpjy7gJAIbl/cS5F/3i4FUKttEvEec3tTpmv3K7bY4ZOWAsC05
	MWldXjEZil+BlLaKOiVHJ8Ax2SLscg3Cvkvmuo1zPQOc1YeOk65OIS4lfyIraGqqs3PvWek3axIla
	PIJ/ySPLvTjJG+6AHcX6fNoLe/APU6nu68err6DR8+SZckvmlxMchhKNmDLpnR6QjbUK8lhqW8TCu
	15tYHnyBOJUPBK3ayRA7DDpDfkkLZgblI2irROc9LjTyYlDVQq/evpmEr/OXvBbz5N8hQqtcXuKSF
	iX7oP7tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC9Hq-002nPx-Kr; Fri, 15 Jul 2022 00:34:30 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC9Hf-002nOe-Kj; Fri, 15 Jul 2022 00:34:21 +0000
Received: by mail-lf1-x12e.google.com with SMTP id y11so5432816lfs.6;
        Thu, 14 Jul 2022 17:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0rGhQNj8uyI81ckYT+VVXENe31UkgplONZDpQgE07Oc=;
        b=OJvE62rheMLYWZq+X7rgvtv16ZB7jTNFNFTOzPn3VF3TfaBbnFxZ7IcnTWLufUQ/Sq
         8vmpblIw2uB79k1hSM2nwB07SXvqn6klzDQB34zD1XTfDNtq03IT2fawwG3vB5e/UaEc
         54TuWDF5+IQ+KiUz8cQjzsG/f2QlCcOC0Axf4na2Px8iuAeSrx0AceCEDc5vaSet/QeZ
         K0EeyoPlMBA4XDc++rpu/50E7Tw/+/fbMm/1nC0+Hju6U82QQp5czw/YiB2KDZqwOg9P
         oPrxYP7pvPn3t6ypHzYdAUlaNvWOlgZEcbDwL7LSzbynJ62+TnFojVdYpekd1dp9cY8Z
         uQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0rGhQNj8uyI81ckYT+VVXENe31UkgplONZDpQgE07Oc=;
        b=Rg8TtuBmhAl9h2WwGJguxowThBnMIJhv2rgw5f+90ScGBSgbxpp+RoWRxx+g9qMkIA
         P9rDt1ik177EULtgzTOTF8roV3vhHWX51loxkEZUmrfvA7ivq2dEv2oDXywoVspuM00w
         0O3fSuKPGtj1aHKNzraFixb16b7NbFJwz7SbDLh4mzs9xAWXJs/JgNC8jJkzvYE7YdNn
         B2Sn1AcBOolV8BU3nFYXtR1U/y/rQIS7erCrm9iE1MMYcYAxEP2id5fYmx3FvJ+rfpTh
         lTnTHd+/i5ZtA0IcZy7Y47mF8xFr7hr/DVq6ajDSbwkzeQCQDDm5OiEJdTR15UxXVURv
         /ZjQ==
X-Gm-Message-State: AJIora9LmZDrjMPJBj7BjxKDvdQzezKA/az+EET2YtykJEoH6zqsMpfL
	vWeNpRWu+C8YyqQAObShioU=
X-Google-Smtp-Source: AGRyM1usyJz6kpmTfXzeczUPK2/IMjlyR5QuGEBBFmZFCHYqMZWb9dUAwwdgAB08tbdMcnN2jXnxrA==
X-Received: by 2002:a05:6512:a8b:b0:48a:14b1:e7a6 with SMTP id m11-20020a0565120a8b00b0048a14b1e7a6mr3587523lfu.634.1657845255029;
        Thu, 14 Jul 2022 17:34:15 -0700 (PDT)
Received: from pc ([104.28.230.247])
        by smtp.gmail.com with ESMTPSA id n27-20020a05651203fb00b0047fae90bfb4sm610293lfq.56.2022.07.14.17.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 17:34:14 -0700 (PDT)
Date: Fri, 15 Jul 2022 03:34:09 +0300
From: Boris Lysov <arz65xx@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Edward-JW Yang <edward-jw.yang@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, "Johnson Wang (=?UTF-8?B?546L6IGW6ZGr?=)"
 <Johnson.Wang@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "Yu-Chang Wang (
 =?UTF-8?B?546L54Wc5qif?=)" <Yu-Chang.Wang@mediatek.com>, "Kuan-Hsin Lee (
 =?UTF-8?B?5p2O5Yag5paw?=)" <Kuan-Hsin.Lee@mediatek.com>
Subject: Re: [RFC PATCH 2/2] clk: mediatek: Add frequency hopping support
Message-ID: <20220715033409.553ce65c@pc>
In-Reply-To: <a1d36cba-a58a-326a-70dc-3578f183a249@collabora.com>
References: <20220612135414.3003-1-johnson.wang@mediatek.com>
	<20220612135414.3003-3-johnson.wang@mediatek.com>
	<ca4b9a0e-b1ca-6861-e4c0-30a8c8a5c99c@collabora.com>
	<9addc9fb0c949e921f915fcf128783393214bfde.camel@mediatek.com>
	<30e07350-ff56-a361-121e-3cb3a27643a1@collabora.com>
	<CAGXv+5F3YK51eL60-SD6pfW90xSZYoVvLXvbQ1oq+8zQmfkKwA@mail.gmail.com>
	<946e6d8fd14151277f00521e1373057a403021b0.camel@mediatek.com>
	<a1d36cba-a58a-326a-70dc-3578f183a249@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_173419_755143_5014857E 
X-CRM114-Status: GOOD (  34.82  )
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

On Thu, 14 Jul 2022 13:04:49 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Il 06/07/22 15:07, Edward-JW Yang ha scritto:
> > On Wed, 2022-06-29 at 16:54 +0800, Chen-Yu Tsai wrote:
> >> On Tue, Jun 28, 2022 at 6:09 PM AngeloGioacchino Del Regno
> >> <angelogioacchino.delregno@collabora.com> wrote:
> >>>
> >>> Il 24/06/22 09:12, Edward-JW Yang ha scritto:
> >>>> Hi AngeloGioacchino,
> >>>>
> >>>> Thanks for all the advices.
> >>>>
> >>>> On Mon, 2022-06-13 at 17:43 +0800, AngeloGioacchino Del Regno wrote:
> >>>>> Il 12/06/22 15:54, Johnson Wang ha scritto:
> >>>>>> Add frequency hopping support and spread spectrum clocking
> >>>>>> control for MT8186.
> >>>>>>
> >>>>>> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> >>>>>> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> >>>>>
> >>>>> Before going on with the review, there's one important consideration:
> >>>>> the Frequency Hopping control is related to PLLs only (so, no other
> >>>>> clock types get in the mix).
> >>>>>
> >>>>> Checking the code, the *main* thing that we do here is initializing the
> >>>>> FHCTL by setting some registers, and we're performing the actual
> >>>>> frequency hopping operation in clk-pll, which is right but, at this
> >>>>> point, I think that the best way to proceed is to add the "FHCTL
> >>>>> superpowers" to clk-pll itself, instead of adding multiple new files
> >>>>> and devicetree bindings that are specific to the FHCTL itself.
> >>>>>
> >>>>> This would mean that the `fh-id` and `perms` params that you're setting
> >>>>> in the devicetree get transferred to clk-mt8186 (and hardcoded there),
> >>>>> as to extend the PLL declarations to include these two: that will also
> >>>>> simplify the driver so that you won't have to match names here and
> >>>>> there.
> >>>>>
> >>>>> Just an example:
> >>>>>
> >>>>>       PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x0224, 0x0230, 0,
> >>>>>
> >>>>>           PLL_AO, 0, 22, 0x0228, 24, 0, 0, 0, 0x0228, 2,
> >>>>> FHCTL_PERM_DBG_DUMP),
> >>>>>
> >>>>> Besides, there are another couple of reasons why you should do that
> >>>>> instead, of which:
> >>>>>     - The devicetree should be "generic enough", we shall not see the
> >>>>> direct value to write to the registers in there (yet, perms assigns
> >>>>> exactly that)
> >>>>>     - These values won't change on a per-device basis, I believe?
> >>>>> They're SoC-related, not board-related, right?
> >>>>>
> >>>>> In case they're board related (and/or related to TZ permissions), we
> >>>>> can always add a bool property to the apmixedsys to advertise that
> >>>>> board X needs to use an alternative permission (ex.:
> >>>>> `mediatek,secure-fhctl`).
> >>>>
> >>>> I think we should remain clk-fhctl files because FHCTL is a independent
> >>>> HW and is not a necessary component of clk-pll.
> >>>
> >>> I know what FHCTL is, but thank you anyway for the explanation, that's
> >>> appreciated. In any case, this not being a *mandatory* component doesn't
> >>> mean that when it is enabled it's not changing the way we manage the
> >>> PLLs..........
> >>>
> >>>> Frequency hopping function from FHCTL is not used to replace original
> >>>> flow of set_rate in clk-pll. They are two different ways to change PLL's
> >>>> frequency. The
> >>>
> >>> I disagree: when we want to use FHCTL, we effectively hand-over PLL
> >>> control from APMIXEDSYS to the Frequency Hopping controller - and we're
> >>> effectively replacing the set_rate() logic of clk-pll.
> > 
> > Do you mean we need to drop the current set_rate() logic (direct register
> > write) and use Frequency Hopping Controller instead?
> > 
> 
> On PLLs that are supported by the Frequency Hopping controller, yes: we should
> simply use a different .set_rate() callback in clk-pll.c, and we should return
> a failure if the FHCTL fails to set the rate - so we should *not* fall back to
> direct register writes, as on some platforms and in some conditions, using
> direct register writes (which means that we skip FHCTL), may lead to unstable
> system.
> 
> This means that we need logic such that, in mtk_clk_register_pll(), we end up
> having something like that:
> 
> if (fhctl_is_enabled(pll))
> 	init.ops = &mtk_pll_fhctl_ops;
> else
> 	init.ops = &mtk_pll_ops;

Looks like accepting my patch [1] wouldn't be a bad idea, after all.
[1] https://lists.infradead.org/pipermail/linux-mediatek/2022-May/041293.html

