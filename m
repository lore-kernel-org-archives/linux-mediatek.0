Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F4FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 08:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYOas3VXsXobBgGmtzAVIzPk9FBE1PJp5RKi3UmSRLI=; b=Fd4LvyUGzwyGnwPWUWC1h4eJr3
	TxgNQWFnbXgstJJ3TdM+kiOkoOuSDHWlZvr84NYzUNFQs0MLWRXTUfkZtqGpSa4BsmyA2f/6KvzkR
	3+1hbP6JCtexlGAjGQfwMbYi3hLc7hi0hHmN0KPIaVXg6jyEOv96SyCrk3GLeSZaLchzBR6CBH3mz
	ciQboterptZCKhRfrgWCd2YV+qI4Y3HehfZ7SHm7BUI+9dG0N7BnH25F8/c0ghlKykybnLJLj8afG
	Vw8tG1jka3BSnsjcg8aht0uqtjmTzijidWKM7gO6sJeNw+K+r7Q/rhViAagVt0LmLx9+4hzas6BjZ
	nuVmjmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBe5-0089JS-MT; Fri, 30 Sep 2022 08:45:21 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBe3-0089FJ-17
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 08:45:20 +0000
Received: by mail-vk1-xa34.google.com with SMTP id k14so1925332vkk.0
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Sep 2022 01:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=eYOas3VXsXobBgGmtzAVIzPk9FBE1PJp5RKi3UmSRLI=;
        b=GJCpgpENmZ9VS8Ex8TOfXcdTqJ+A5fhCQuiZf0REpGFr5RiUlW30OmBu6CQ3iBAp9c
         XpttbI4sPkB7xXrID7uUnN5Vp9S+ShdFmrMQtl9TDGda1IacLjQowt6IhjlEwcm3MheE
         Gm9wOf8DRMCL0C37Motg9BOgM+M8HIavdO7hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=eYOas3VXsXobBgGmtzAVIzPk9FBE1PJp5RKi3UmSRLI=;
        b=2eFb1GEd9nzfp5TYY0wlbyMhy4wZKNSQFuM84xoYD49uBUzdLMmc9jpVgaq9hBPBAZ
         f2mkTixjUGTZYSNgmlWHon0NGL6X8VTu3GZAEnewX3e4A/nRq1xJCTdlRYTrZ7ykVU3s
         +WDyJpJi/R2waL1SofHHIwOY3q/4x/sIag5GIcEWh+1ZjW+pvlunjodwHw6Xk+awkB6g
         eElY2qvpXuwqksYCaXfoz2aahQdW+8RapzKIygZGPeaVQs13gYqg0h0pZADgi9dxf+3Q
         vxe3+6OlNLm8uqAOtDLL1lFMJbSHSC+Bo8riN1NxYzwEiqqO0MoChV/cD7ZDW6o6rWUV
         6npQ==
X-Gm-Message-State: ACrzQf1slDlr21O+KLeHIunf6dk0RStJ2i6HXR13KtN7hb3towKK6ekW
	TkOJg3dg1zBW7euL+CwQd6JaUtrMFV0YkbRUF+5ZpA==
X-Google-Smtp-Source: AMsMyM7ZVcX/HQPq3Iutjv+Qs5JQ+qNe+Y9ufGnOT8bZqW5T2N6SQrZRNWY+iEho68J6+dT6Sh4gm031XYqthxUycbU=
X-Received: by 2002:a1f:9116:0:b0:3a2:362b:fea9 with SMTP id
 t22-20020a1f9116000000b003a2362bfea9mr3616390vkd.11.1664527509413; Fri, 30
 Sep 2022 01:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
 <20220927101128.44758-9-angelogioacchino.delregno@collabora.com>
 <79490e834466628a1b92e51f65aeb9e9ce82ddce.camel@mediatek.com> <5d8af9a1-3afc-bd69-8f34-164284a452c2@collabora.com>
In-Reply-To: <5d8af9a1-3afc-bd69-8f34-164284a452c2@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Sep 2022 16:44:58 +0800
Message-ID: <CAGXv+5EfsdjqH-gG=wcU4mGxWKmODMw3xJpNsugZJG9hdt1jcw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220930_014519_089236_1D689E4F 
X-CRM114-Status: GOOD (  28.78  )
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

On Fri, Sep 30, 2022 at 4:29 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 30/09/22 07:59, MandyJH Liu (=E5=8A=89=E4=BA=BA=E5=83=96) ha scritto:
> > On Tue, 2022-09-27 at 12:11 +0200, AngeloGioacchino Del Regno wrote:
> >> These PLLs are conflicting with GPU rates that can be generated by
> >> the GPU-dedicated MFGPLL and would require a special clock handler
> >> to be used, for very little and ignorable power consumption benefits.
> >> Also, we're in any case unable to set the rate of these PLLs to
> >> something else that is sensible for this task, so simply drop them:
> >> this will make the GPU to be clocked exclusively from MFGPLL for
> >> "fast" rates, while still achieving the right "safe" rate during
> >> PLL frequency locking.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <
> >> angelogioacchino.delregno@collabora.com>
> >> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >> ---
> >>   drivers/clk/mediatek/clk-mt8195-topckgen.c | 9 ++++++---
> >>   1 file changed, 6 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c
> >> b/drivers/clk/mediatek/clk-mt8195-topckgen.c
> >> index 4dde23bece66..8cbab5ca2e58 100644
> >> --- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
> >> +++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
> >> @@ -298,11 +298,14 @@ static const char * const ipu_if_parents[] =3D {
> >>      "mmpll_d4"
> >>   };
> >>
> >> +/*
> >> + * MFG can be also parented to "univpll_d6" and "univpll_d7":
> >> + * these have been removed from the parents list to let us
> >> + * achieve GPU DVFS without any special clock handlers.
> >> + */
> >>   static const char * const mfg_parents[] =3D {
> >>      "clk26m",
> >> -    "mainpll_d5_d2",
> >> -    "univpll_d6",
> >> -    "univpll_d7"
> >> +    "mainpll_d5_d2"
> >>   };
> >>
> >>   static const char * const camtg_parents[] =3D {
> > There might be a problem here. Since the univpll_d6 and univpll_d7 are
> > available parents in hardware design and they can be selected other
> > than kernel stage, like bootloader, the clk tree listed in clk_summary
> > cannot show the real parent-child relationship in such case.
>
> I agree about that, but the clock framework will change the parent to
> the "best parent" in that case... this was done to avoid writing complica=
ted
> custom clock ops just for that one.
>
> This issue is present only on MT8195, so it can be safely solved this way=
,
> at least for now.
>
> Should this become a thing on another couple SoCs, it'll then make sense
> to write custom clock ops just for the MFG.

Would CLK_SET_RATE_NO_REPARENT on the fast mux coupled with forcing
the clk tree to a state that we like (mfgpll->fast_mux->gate) work?

ChenYu

