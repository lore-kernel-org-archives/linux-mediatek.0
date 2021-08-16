Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB459C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 15:38:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C4FB61038
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 15:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C4FB61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeXPmzbGp1bMQNLgSYKtypaz2hDm/Z9hww/e7DIPRKU=; b=e6AC5yBKdvEL/Q
	RrB+GcYLFiohskmSkm2y3aMGrBnWzxurZtjo+tlZUmadmKgxleen17xhRHG8B31HiFHfYr6g9YUPr
	0wGG8SxznIWiV8qc+wAtwyRwrHHHvxzispLBBAuK8vKN7F2TaeCod/VmHkxBKnjN4IPmpxM9gD+f/
	LeR6JWRk3rYcbwIOc4GkWOKdcA0/AgT4KkYcN7cvGHNo7ZYAhvypV7SeuTchaPDkfBigIxChAmh+g
	9VieBRK+jhVHbT5sk+C2ClKjCcb7jWahTrTurzhDYpUSr+/Md4YxllMacclaXVF92FUA3FI7YjEXd
	zq5UsMav8CJxB+7rfdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFegk-00HMz9-7n; Mon, 16 Aug 2021 15:38:10 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFege-00HMyV-IX
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 15:38:08 +0000
Received: by mail-lf1-x129.google.com with SMTP id k5so7462874lfu.4
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bm8tYluwE2tHBRzqwzgJszhrItkJk+y3RCcuMDJTmI8=;
 b=OT95Md82WHgRGyLWmxE6nitIx0C8BB1adlzRDuzRT9M2zqetzj87ra3kpFm3KgMYga
 8RIHvMHWlEO+gCYykxVaQ3u+tQvAxFx9yTJkeOeM0wj3hI/3jYP76ODLd+t8d7vyCUu9
 YqAXy0/NlJDrv+x2x/UfYn7oZho6vLBJ3zIdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bm8tYluwE2tHBRzqwzgJszhrItkJk+y3RCcuMDJTmI8=;
 b=mloUYQU6U9LzazcNpKT2GiqdOo+gP5bZGwq6SmFgnfkoTHWEbkK6FwqmcdFco/SnG/
 ZBxJMp3AeaxpNHBLwCLHcjAPipjwO9a24n697tZHp0hZkQvvs9j5Lelcxxj4Uru7Sgkd
 TKKuLbbOIHUosSPTQvmLpZT9RoqMLg28y6r+BxfkWFX9GExz7DAXus1oNxjfOOpBaNWa
 LsR5oo9x38FRKcTy1Bo3t/g+4IqY6ZL+zo3wgreimLbY6bVubxFwQRAFHmoW3A4Hkmw2
 /QllEShxOOaptaG2yg1JSEuwbSD1wOh5z0x420Xi+bdHMFKdAX1mf6zAP4DkpdO0cDyA
 uKhA==
X-Gm-Message-State: AOAM530v7depRqaZfXMWR7dGUcUd8XPjVx/WYu8Cd86Y1wYm31rOp/Cc
 uYF14zeusjmr7/nLmBwLTzxDlg7QdvqnPTrn4sLipA==
X-Google-Smtp-Source: ABdhPJwM3WmrduknwaHuwv1oS/UWCa6rCVwvP8lSpnbJ99wYVLFaUwqD8adqCCp2RUVXMwg7jhadsyw/D/byN4yaDyY=
X-Received: by 2002:ac2:51dc:: with SMTP id u28mr10792613lfm.444.1629128282504; 
 Mon, 16 Aug 2021 08:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com>
 <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03>
 <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
 <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
 <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
 <CAGXv+5HohMwU8jow5QXO5MK1tO+u=5YsfhArBWCP4Dgm1Q8igg@mail.gmail.com>
 <4fd12d5c53f6492e5fa3ba94a78b9a149f5b6ed9.camel@mediatek.com>
In-Reply-To: <4fd12d5c53f6492e5fa3ba94a78b9a149f5b6ed9.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 16 Aug 2021 23:37:51 +0800
Message-ID: <CAGXv+5GCuNK=-z9VAOjkpJdZLUSZFPfUsQ09m1FhfTsbCYLLRw@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
 Devicetree List <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_083804_685979_1B90ED28 
X-CRM114-Status: GOOD (  29.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 16, 2021 at 6:48 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Mon, 2021-08-16 at 14:10 +0800, Chen-Yu Tsai wrote:
> > On Thu, Aug 5, 2021 at 7:02 AM Linus Walleij <
> > linus.walleij@linaro.org> wrote:
> > >
> > > On Thu, Jul 29, 2021 at 11:43 AM Chen-Yu Tsai <wenst@chromium.org>
> > > wrote:
> > > > On Thu, Jul 29, 2021 at 4:23 PM zhiyong.tao <
> > > > zhiyong.tao@mediatek.com> wrote:
> > > > > The rsel actual bias resistance of each setting is different in
> > > > > different IC. we think that the define "MTK_PULL_SET_RSEL_000"
> > > > > is more
> > > > > common for all different IC.
> > > >
> > > > I see. I personally prefer having things clearly described. I can
> > > > understand this might be an extra burden to support different
> > > > chips
> > > > with different parameters, though this should be fairly
> > > > straightforward
> > > > with lookup tables tied to the compatible strings.
> > > >
> > > > Let's see if Rob and Linus have anything to add.
> > >
> > > Not much. We have "soft pushed" for this to be described as generic
> > > as possible, using SI units (ohms). But we also allow vendor-
> > > specific
> > > numbers in this attribute. Especially when reverse engineering SoCs
> > > that the contributor don't really have specs on (example M1 Mac).
> > >
> > > The intent with the SI units is especially for people like you
> > > folks working
> > > with Chromium to be able to use different SoCs and not feel lost
> > > to a forest of different ways of doing things and associated
> > > mistakes because vendors have hopelessly idiomatic pin configs.
> >
> > I'll take that as "use SI units whenever possible and reasonable".
>
> ==> so It doesn't need to change the define, is it right?
> we will keep the common define.

Actually I think it would be possible and reasonable to use SI units
in this case, since you are the vendor and have the resistor values
to implement the support. Having different sets of values for different
chips is nothing out of the ordinary. We already have to account for
different number of pins and different pin functions. That is what
compatible strings are for.

Now if you have _many_ different sets of values within the same chip,
that could make things more difficult. However the clearness of having
the real values visible in the device tree would likely benefit both
software and hardware engineers outside of Mediatek. That is what we
should be aiming for.


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
