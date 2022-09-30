Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B99C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 09:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSqoEVotgmjM+vKbcyqTnmnsL1AtbCbSLlqCZ9LYa+I=; b=JCsY50hQmSeyDOPE9qlqc3Gi5y
	V+pJwz3koCZhUOk5PG5rap7uw4tSsnnXVp/5eeUiLd2RZfqtEXxYO5s8p/VHiLyqIJyWsOEctBfnc
	56oUN3qNVFtUM52QIQ5rCO5ossijcg1d/duqjB7DE7Q8+NMsDVsGuclLi0hXnSDa1CSFFnjxezxfe
	t5CR8OR9ibeLGb75IIEylLozvC5DKcvMHrjYQ3qN/2vFRbEH+uQrZlnN1oCGBjVW/LgtWYTB3+W0e
	EvZhisE3mKNve/JD86IS00PVncGAmCUmYENbOfVd6AVuZU6L5MYDFMBnxtJrD2sr3nAmvH7ouIeYo
	Ih3nJxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBub-008E77-Oi; Fri, 30 Sep 2022 09:02:25 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBuZ-008E5j-JW
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 09:02:25 +0000
Received: by mail-vk1-xa32.google.com with SMTP id s192so1914599vkb.9
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Sep 2022 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=PSqoEVotgmjM+vKbcyqTnmnsL1AtbCbSLlqCZ9LYa+I=;
        b=kAIczKy6ILtAWOt6uc/yYPESwoBRujTEBY7Pu4c/LbbLxYgCq9yfbVMd2MfttwGxEL
         oEzMaPyjKDvAQgWqUT+PS46hPZuVhu7mO96PVcmjULwrmkLz3+/kyg4pVyl7iSJS1x+5
         WrsKXgLmzhtGP5eWBkf0F77QQlhFYm4JLyWhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PSqoEVotgmjM+vKbcyqTnmnsL1AtbCbSLlqCZ9LYa+I=;
        b=gRWuRGFRfEQvqh62PGxVhO3pVn42hedGf9WQkWqBCBUPl+jyzWAef27GDirbMnWBeB
         aXuJMr9oAB1sX7CXWACpA4tXPsiho0yGXG7u2d2TSbpgUrk7AhF7pUWfI9wSu7LvnOGE
         dEVI6obzPb9nU4RxqgkpDPrAWuBmoe3e15cczwVeRC/kMh534/NNDwg3ImrakX5Afhbl
         gCXetOpBITutaxYETvtV402oR894IzAnxUU2MlVNeuSoYsPEG4zbBjlT1BGGnRkMisbq
         LOXE81p3a6jqlD5qjXhD5VbCzn1Gs79qQRN1n5ZcvIp8QG3jq2B77Cr86vyMSbjjx4aW
         GbzA==
X-Gm-Message-State: ACrzQf2ayGvRCGKqWs/bBaBgQjciKHVK1H57q4ExQA2bbjqSQVD9WBE3
	H/GTIc7pZgvffkfVjvC4IdN398+cpo15YZygwoKoFg==
X-Google-Smtp-Source: AMsMyM5V7CeePFmL7SoCh0B05e+v9Y3Oa9k4tJJBheukGXk3m1Nb8OFy00tgLDNtRzVOTBAwoYP0OjoVoXJK0rVpDwQ=
X-Received: by 2002:a1f:9cc5:0:b0:3a2:bd20:8fc6 with SMTP id
 f188-20020a1f9cc5000000b003a2bd208fc6mr3818193vke.22.1664528541609; Fri, 30
 Sep 2022 02:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
 <20220927101128.44758-9-angelogioacchino.delregno@collabora.com>
 <79490e834466628a1b92e51f65aeb9e9ce82ddce.camel@mediatek.com>
 <5d8af9a1-3afc-bd69-8f34-164284a452c2@collabora.com> <CAGXv+5EfsdjqH-gG=wcU4mGxWKmODMw3xJpNsugZJG9hdt1jcw@mail.gmail.com>
 <5d62200e-e058-29ea-063f-91dd1fd92cf7@collabora.com>
In-Reply-To: <5d62200e-e058-29ea-063f-91dd1fd92cf7@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Sep 2022 17:02:10 +0800
Message-ID: <CAGXv+5F-P0D5G2ydxUbwDPaW-GgDSYOUGv5+3yx8JbHL_px=EA@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] clk: mediatek: clk-mt8195-topckgen: Drop
 univplls from mfg mux parents
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?TWFuZHlKSCBMaXUgKOWKieS6uuWDlik=?= <MandyJH.Liu@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"jose.exposito89@gmail.com" <jose.exposito89@gmail.com>, "drinkcat@chromium.org" <drinkcat@chromium.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	=?UTF-8?B?Q2h1bi1KaWUgQ2hlbiAo6Zmz5rWa5qGAKQ==?= <Chun-Jie.Chen@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?B?TWlsZXMgQ2hlbiAo6Zmz5rCR5qi6KQ==?= <Miles.Chen@mediatek.com>, 
	=?UTF-8?B?V2VpeWkgTHUgKOWRguWogeWEgCk=?= <Weiyi.Lu@mediatek.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	=?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"nfraprado@collabora.com" <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_020223_688445_EF16B265 
X-CRM114-Status: GOOD (  40.17  )
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

On Fri, Sep 30, 2022 at 4:58 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 30/09/22 10:44, Chen-Yu Tsai ha scritto:
> > On Fri, Sep 30, 2022 at 4:29 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 30/09/22 07:59, MandyJH Liu (=E5=8A=89=E4=BA=BA=E5=83=96) ha scritt=
o:
> >>> On Tue, 2022-09-27 at 12:11 +0200, AngeloGioacchino Del Regno wrote:
> >>>> These PLLs are conflicting with GPU rates that can be generated by
> >>>> the GPU-dedicated MFGPLL and would require a special clock handler
> >>>> to be used, for very little and ignorable power consumption benefits=
.
> >>>> Also, we're in any case unable to set the rate of these PLLs to
> >>>> something else that is sensible for this task, so simply drop them:
> >>>> this will make the GPU to be clocked exclusively from MFGPLL for
> >>>> "fast" rates, while still achieving the right "safe" rate during
> >>>> PLL frequency locking.
> >>>>
> >>>> Signed-off-by: AngeloGioacchino Del Regno <
> >>>> angelogioacchino.delregno@collabora.com>
> >>>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >>>> ---
> >>>>    drivers/clk/mediatek/clk-mt8195-topckgen.c | 9 ++++++---
> >>>>    1 file changed, 6 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c
> >>>> b/drivers/clk/mediatek/clk-mt8195-topckgen.c
> >>>> index 4dde23bece66..8cbab5ca2e58 100644
> >>>> --- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
> >>>> +++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
> >>>> @@ -298,11 +298,14 @@ static const char * const ipu_if_parents[] =3D=
 {
> >>>>       "mmpll_d4"
> >>>>    };
> >>>>
> >>>> +/*
> >>>> + * MFG can be also parented to "univpll_d6" and "univpll_d7":
> >>>> + * these have been removed from the parents list to let us
> >>>> + * achieve GPU DVFS without any special clock handlers.
> >>>> + */
> >>>>    static const char * const mfg_parents[] =3D {
> >>>>       "clk26m",
> >>>> -    "mainpll_d5_d2",
> >>>> -    "univpll_d6",
> >>>> -    "univpll_d7"
> >>>> +    "mainpll_d5_d2"
> >>>>    };
> >>>>
> >>>>    static const char * const camtg_parents[] =3D {
> >>> There might be a problem here. Since the univpll_d6 and univpll_d7 ar=
e
> >>> available parents in hardware design and they can be selected other
> >>> than kernel stage, like bootloader, the clk tree listed in clk_summar=
y
> >>> cannot show the real parent-child relationship in such case.
> >>
> >> I agree about that, but the clock framework will change the parent to
> >> the "best parent" in that case... this was done to avoid writing compl=
icated
> >> custom clock ops just for that one.
> >>
> >> This issue is present only on MT8195, so it can be safely solved this =
way,
> >> at least for now.
> >>
> >> Should this become a thing on another couple SoCs, it'll then make sen=
se
> >> to write custom clock ops just for the MFG.
> >
> > Would CLK_SET_RATE_NO_REPARENT on the fast mux coupled with forcing
> > the clk tree to a state that we like (mfgpll->fast_mux->gate) work?
>
> I'm not sure that it would, and then this would mean that we'd have to ad=
d
> assigned-clock-parents to the devicetree and the day we will introduce th=
e
> "complicated custom clock ops" for that, we'll most probably have to chan=
ge
> the devicetree as well... which is something that I'm a bit reluctant to =
do
> as a kernel upgrade doesn't automatically mean that you upgrade the DT wi=
th
> it to get the "new full functionality".

You can also do it by doing clk_set_parent() in the clock driver after the
clocks are registered, or just write to the register before the clock is
registered.

We do the latter in some of the sunxi-ng drivers, though IIRC it was to
force a certain divider on what we expose as a fixed divider clock.

ChenYu

> Introducing the new clock ops for the mfg mux is something that will happ=
en
> for sure, but if we don't get new SoCs with a similar "issue", I don't fe=
el
> confident to write them, as I fear these won't be as flexible as needed a=
nd
> will eventually need a rewrite; that's why I want to wait to get the same
> situation on "something new".
>
> In my opinion, it is safe to keep this change as it is, even though I do
> understand the shown concerns about the eventual unability to show the tr=
ee
> relationship in case the bootloader chooses to initialize the mfg mux wit=
h
> a univpll parent.
>
> Regards,
> Angelo
>

