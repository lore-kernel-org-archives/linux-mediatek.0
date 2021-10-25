Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8140FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 05:06:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D69161040
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 05:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D69161040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvBUEt/hpNPRBW+XMNkmN/N8QxafM+jiDLO1jvtqKgk=; b=kJGzzPUYZaX2q4
	8EbjrdIwXBID+9TuroduVAFaPwKRXW+eq46Uw6ux5AuM7i+RlG904itTjKC111FNgYdd6HPfMLaWI
	HCdjLu99kpHkTU2WFcliQdrlfdQx1CZN4ECYdvxXpijX0DCAtoQkiTXq2kZOIf30Ok5MUkyK58Uug
	92qzbC61oLRCjbnrjy4VIwkKx7K7LzwOzyUsKVl33BdmpTF2uz8fbY9JcSun3eJn+3SsZo62+UeMN
	a65bgJ3TcO5J9KGgLamkLb6ogZ8HhFI4xqBEyH4aIwl2piCDnXlnUCkWlzMjQC64r+lp12/arPEDK
	x/6b1wTepb+b+ZHbZHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mesBS-00FI7j-TR; Mon, 25 Oct 2021 05:06:06 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mesBF-00FI6J-M5
 for linux-mediatek@lists.infradead.org; Mon, 25 Oct 2021 05:05:55 +0000
Received: by mail-pf1-x430.google.com with SMTP id v8so9572328pfu.11
 for <linux-mediatek@lists.infradead.org>; Sun, 24 Oct 2021 22:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JA+P5A/sB4KzKsxDYjkyZmdfTZPWFEA1bTgclSJrZHw=;
 b=KiE1qXXhWLLbW4vwLmlblzb3wQokb4W7dv086jJ8+hR4oxplQJsQxQtLqdDFO36jDh
 yeFPmAygk8PKy/qe22rLWlu9GlOSwHI0wsZHKTmvoCN9nFiQAzj7N/2RgnpRWZChBh5L
 rF1o1gTosZ1RUTjANl2Mo7CJGeBf5PC0yzWZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JA+P5A/sB4KzKsxDYjkyZmdfTZPWFEA1bTgclSJrZHw=;
 b=jM5XX1swidNgFttnfAehYphUIq6bbugD+kUI32MJj/iXfh3njfncNHNdsYHZHLYyFB
 ZQhTggn6eI3HxxyJ8LhJpXyyBiFrTrBgIBVpEO5shmxK7Bo2xAZlEWSNC9aGexlOvA1c
 DS4sR1fYImzXJhc6SZMoeBUWJQEs4d+4dLLq2psePCfX8yYdILgrBZ/InKjwoqBDNCyv
 tnqxSGQKHdsygSeTms2bas29I1ItQN13ODw8JN7qgnSfE6cfaHRTIZSBSDlKwNsy6GwC
 KRnKxJGf5hTaAa+Yc6cPLhapXFB1OfxObe4+h8sav9xrbcQ6eqeVbKsZIi/ihkQ4Lpxb
 O66g==
X-Gm-Message-State: AOAM5334RVnjLrzU87d5BHVGlv3dtfD2gWXR6Vz1TOkMdhaA8SWKOFka
 SYsrVdytead1HOyy3Z5cnUGNKIxIxS0woQ==
X-Google-Smtp-Source: ABdhPJyqU3hwJnfdKOxLp3uxn3gpJ/PR9WrDnHIrnhlGHU0CQX3l3seXcjJbhCmVAgZveer/71z7qw==
X-Received: by 2002:a05:6a00:cc6:b0:44d:e2fb:3ef6 with SMTP id
 b6-20020a056a000cc600b0044de2fb3ef6mr16158019pfv.54.1635138351588; 
 Sun, 24 Oct 2021 22:05:51 -0700 (PDT)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com.
 [209.85.215.176])
 by smtp.gmail.com with ESMTPSA id m10sm19934607pjs.21.2021.10.24.22.05.51
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 22:05:51 -0700 (PDT)
Received: by mail-pg1-f176.google.com with SMTP id m21so9717814pgu.13
 for <linux-mediatek@lists.infradead.org>; Sun, 24 Oct 2021 22:05:51 -0700 (PDT)
X-Received: by 2002:a05:6602:2e95:: with SMTP id
 m21mr9431453iow.21.1635138339804; 
 Sun, 24 Oct 2021 22:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-10-jason-jh.lin@mediatek.com>
 <8b509551-7cfa-f55c-fc0f-db7d0a3886eb@collabora.com>
 <29992126d39a7f381a516fdb9cd6e39f1e51afdb.camel@mediatek.com>
In-Reply-To: <29992126d39a7f381a516fdb9cd6e39f1e51afdb.camel@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 25 Oct 2021 13:05:03 +0800
X-Gmail-Original-Message-ID: <CAC=S1niq+b4ue6nPLNT5JEiugh5UFDDL3hEYrUua0AzQ_+YeXA@mail.gmail.com>
Message-ID: <CAC=S1niq+b4ue6nPLNT5JEiugh5UFDDL3hEYrUua0AzQ_+YeXA@mail.gmail.com>
Subject: Re: [PATCH v11 09/16] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, hsinyi@chromium.org,
 moudy.ho@mediatek.com, 
 roy-cw.yeh@mediatek.com, Fabien Parent <fparent@baylibre.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, nancy.lin@mediatek.com, 
 singo.chang@mediatek.com, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_220554_012316_22AD4F6D 
X-CRM114-Status: GOOD (  29.15  )
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

On Fri, Oct 22, 2021 at 6:13 PM Jason-JH Lin <jason-jh.lin@mediatek.com> wrote:
>
> Hi Angelo,
>
> Thanks for the reviews.
>
>
> On Thu, 2021-10-14 at 16:05 +0200, AngeloGioacchino Del Regno wrote:
> > > Add mt8195 vdosys0 clock driver name and routing table to
> > > the driver data of mtk-mmsys.
> > >
>
> [snip]
>
> > >
> > > ---
> >
> > Hello Jason,
> > thanks for the patch! However, there are a few things to improve:
> >
>
> [snip]
>
> > > +#define MT8195_VDO0_SEL_IN                                 0xf34
> > > +#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT         (0 <<
> > > 0)
> >
> > Bitshifting 0 by 0 bits == 0, so this is simply 0.
> >
> > > +#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1          (1 <<
> > > 0)
> >
> > I would write 0x1 here
> >
> > > +#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0         (2 <<
> > > 0)
> >
> > ....and 0x2 here: bitshifting of 0 bits makes little sense.
> >
> > > +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
> > > (0 << 4)
> >
> > Bitshifting 0 by 4 bits is still 0, so this is again 0.
> > This is repeated too many times, so I will not list it for all of the
> > occurrences.
> >
> > > +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE          (1 <<
> > > 4)
> >
> > This is BIT(4).
> >
> > > +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1
> > > (0 << 5) > +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE
> > >     (1 << 5)
> >
> > ...and this is BIT(5)
> >
> > > +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE         (0 <<
> > > 8)
> > > +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT
> > > (1 << 8)
> >
> > BIT(8)
> >
> > > +#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT
> > > (0 << 9)
> > > +#define MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT          (0 <<
> > > 12)
> > > +#define MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE
> > > (1 << 12)
> >
> > BIT(12)
> >
> > > +#define MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0          (2 <<
> > > 12)
> >
> > BIT(13)
> >
> > ... and please, use the BIT(nr) macro for all these bit definitions,
> > it's way more
> > readable like that.
> >
> > Regards,
> > - Angelo
>
> Because the HW register design of MT8195_VDO0_SEL_IN 0xf34 is like
> this:
>
> bit[1:0] as MT8195_SEL_IN_VPP_MERGE and
>   value: 0 as MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
>   value: 1 as MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1
>   value: 2 as MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0
> bit[4:4] as MT8195_SEL_IN_DSC_WRAP0_IN and
>   value 0 as MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
>   value 1 as MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE
> bit[5:5] as MT8195_SEL_IN_DSC_WRAP1_IN and
>   value 0 as
> MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1
>   value 1 as
> MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE
> and so on...
>
> I think using BIT(nr) macro directly is not easy to debug.
>
>
> Is it better to define another MACRO like this?
>
> #define BIT_VAL(val, bit)  ((val) << (bit))
> #define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0  BIT_VAL(0, 4)
> #define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE  BIT_VAL(1, 4)
> ...
>
> or
>
> #define MT8195_SEL_IN_DSC_WRAP0_IN (4)
> #define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0  (0
> << MT8195_SEL_IN_DSC_WRAP0_IN)
> #define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE  (1 <<
> MT8195_SEL_IN_DSC_WRAP0_IN)
> ...
>
> What do you think?

Hi Jason,

If that's the case you can still use BIT(nr) for the definitions and
describe their usage in the comment, so both code readability and the
ease of maintenance are preserved, and people can easily tell if there
are duplicated/missing definitions while reading through the code.
Adding informative comments is never a bad thing.

I would do something like this (and further split the definitions into
sections by their functionalities with blank lines for visual
comfort):

/*
 * MT8195_VDO0_SEL_IN[1:0]: VPP_MERGE
 *   0x0 : DSC_WRAP0_OUT
 *   0x1 : DISP_DITHER1
 *   0x10: VDO1_VIRTUAL0
 */
#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT           0
#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1            BIT(0)
#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0           BIT(1)

/*
 * MT8195_VDO0_SEL_IN[4:4]: DSC_WRAP0_IN
 *   0x0: DISP_DITHER0
 *   0x1: VPP_MERGE
 */
#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0         0
#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE            BIT(4)
... and so on.

Regards,
Fei

>
>
> Regards,
> Jason-JH Lin <jason-jh.lin@mediatek.com>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
