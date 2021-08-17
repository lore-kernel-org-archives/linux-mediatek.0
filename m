Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2493C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 05:44:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB31360F22
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 05:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB31360F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnPdFrwBz4v5lhF2zpubACoy0QhFAtDDslH6S/sr6AU=; b=H9ASK8zi9piX7I
	qpaSDYfAbzeT8CfSfyRGaF1tqAFHtMaWgCdIdCyWfqTNtwSkzmNmLXGNvRo1kyLyVap5kqL3dzfHf
	GWUF9kXyUdjquI6g7coSGTTMV2aH0TR8snSD/Bn5QNxjiDet9XKTnFY44Np05w47XZSLNPKFI5knU
	yJ84WSwtT7G3qqz9pzQGTpNFK5BoZNGoWyS49ngUKijUvJxIHMorQs68+RV5k67X2o1ACBSKOhn3P
	tW9836fUhI4kKIbBE7jfdalZjiroWy052t+iSxdYquwnhglP5zJ3868Jh4rQcqfjZpZN0k4lOvgFA
	kQg2brUPbcGmbiztuDDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFrto-001D2T-A0; Tue, 17 Aug 2021 05:44:32 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFrtj-001D10-21
 for linux-mediatek@lists.infradead.org; Tue, 17 Aug 2021 05:44:31 +0000
Received: by mail-lj1-x236.google.com with SMTP id c12so18007303ljr.5
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 22:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YOKejl87y0ski0VdMRkyNRA2v7H+vqyupx7Esp13/wE=;
 b=a6IvKzyOyIQZqQYz+g/aLPoRbm5h20bCZsjIxf2QcwFz0VIyf7oEIDWaVkrgyH8dVy
 h4m6QRA7pfehKCUKoALq+XGDZt5U7OBbb0gKEDtP7fuIogf7goHUm/xLrW3OSFHRYE/2
 l/S0skrt0NKW06MSkEcsSsY+vfCoBhM6F24NE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YOKejl87y0ski0VdMRkyNRA2v7H+vqyupx7Esp13/wE=;
 b=i00Wx5PLRc7FgmKSGlPueUpr56uH51CGqWPKD8XXEbDS54a6/IT3FTFSdNX0dmgcw7
 G3Q3U7n+3kYKJRjgD/LNbdxZJGpoxR0OrTHiDXTKBhVt7psRKLcsm05rHhNErQUFIyco
 qKypwZg/qC95j8MSOXp1le0tWQaMK69MevmQZgPW4Xl0zPSXb069k4PRnysvOD3go9nv
 TZzVHM4lna217f2ZTyh6I+AZynMqbCzp0LHixBjE6ug8beOLAEZrAhzWiYfvVnPsitc/
 QECeQlxMGQxZsT8G5UIA4E3TBrkSjM9Sc1fJtya5yL02zJw+AC90x1IQM64gmXP8wGcu
 matg==
X-Gm-Message-State: AOAM5312iQ+GqDp5ryT2ECWuI8mtkNrNXHclrjFyFx8J+EL8l1tFtEIA
 9yaLGqvTYTQcZhANRqMvJEtXPRlcsqIrRrvWzK/OiA==
X-Google-Smtp-Source: ABdhPJwDdjRJIqMRTx/tVA7vEY9ayN6r0dWnuWHx5K0aCWGb+5ATkAUHpOt5qq3zzCPruae3ZI8O0IO36YD+eRA8lIM=
X-Received: by 2002:a05:651c:1785:: with SMTP id
 bn5mr1677465ljb.18.1629179065185; 
 Mon, 16 Aug 2021 22:44:25 -0700 (PDT)
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
 <CAGXv+5GCuNK=-z9VAOjkpJdZLUSZFPfUsQ09m1FhfTsbCYLLRw@mail.gmail.com>
 <CACRpkdbZKh8cqqiDRUik6Ooo33e+feGwYsLjcLRvBQnT3x5M3A@mail.gmail.com>
 <a7c8ab68ac3513865698cde27e665bdd554f459e.camel@mediatek.com>
In-Reply-To: <a7c8ab68ac3513865698cde27e665bdd554f459e.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 17 Aug 2021 13:44:13 +0800
Message-ID: <CAGXv+5FtL2zaSWx4tUymx6mpCSb5dXG4XNWM9AJL+b6Ok3dxMg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210816_224427_157835_978EDE3C 
X-CRM114-Status: GOOD (  34.49  )
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

On Tue, Aug 17, 2021 at 10:21 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Tue, 2021-08-17 at 01:00 +0200, Linus Walleij wrote:
> > On Mon, Aug 16, 2021 at 5:38 PM Chen-Yu Tsai <wenst@chromium.org>
> > wrote:
> > > On Mon, Aug 16, 2021 at 6:48 PM zhiyong.tao <
> > > zhiyong.tao@mediatek.com> wrote:
> > > > > I'll take that as "use SI units whenever possible and
> > > > > reasonable".
> > > >
> > > > ==> so It doesn't need to change the define, is it right?
> > > > we will keep the common define.
> > >
> > > Actually I think it would be possible and reasonable to use SI
> > > units
> > > in this case, since you are the vendor and have the resistor values
> > > to implement the support. Having different sets of values for
> > > different
> > > chips is nothing out of the ordinary. We already have to account
> > > for
> > > different number of pins and different pin functions. That is what
> > > compatible strings are for.
> >
> > I fully agree with Chen-Yu's analysis here.
> >
> > Zhiyong can you make an attempt to use SI units (Ohms) and see
> > what it will look like? I think it will look better for users and it
> > will
> > be less risk to make mistakes.
> >
> > Yours,
> > Linus Walleij
>
> Hi Linus & chen-yu,
>
> The rsel actual bias resistance of each setting is different in
> different IC. For example, in mt8195, the rsel actual bias resistance
> setting like as:
> MTK_PULL_SET_RSEL_000:75K in PU, 75k in PD;
> MTK_PULL_SET
> _RSEL_001:10k in PU, 5k in PD;
> MTK_PULL_SET_RSEL_010:5k in PU, 75k in
> PD;
> MTK_PULL_SET_RSEL_011:4k in PU, 5K in PD;
> MTK_PULL_SET_RSEL_100:3k in
> PU, 75k in PD;
> MTK_PULL_SET_RSEL_101:2k in PU, 5K in PD;
> MTK_PULL_SET_RSE
> L_110:1.5k in PU, 75k in PD;
> MTK_PULL_SET_RSEL_111:1k in PU, 5k in PD.
>
> but in mt8192, the rsel actual bias resistance setting like as:
> MTK_PULL_SET_RSEL_000:75K in PU, 75k in PD;
> MTK_PULL_SET_RSEL_001:3k in PU, 5k in PD;
> MTK_PULL_SET_RSEL_010:10k in PU, 75k in PD;
> MTK_PULL_SET_RSEL_011:1k in PU, 5K in PD;
>
> Can you help me to provide a suggestion common define for the all
> different IC?
> It seems that we should add a new define, if we upstream a new IC
> pinctrl driver in the future.

I assume you mean the macros used in the device tree?

The point of using SI units is to get rid of the macros. Instead of:

    bias-pull-up = <MTK_PULL_SET_RSEL_000>;

and

    bias-pull-down = <MTK_PULL_SET_RSEL_011>;

We want:

    bias-pull-up = <75000>;

and

    bias-pull-down = <5000>;

And the pinctrl driver then converts the real values in the device tree
into register values using some lookup table.

The DT schema could then enumerate all the valid resistor values,
and get proper validity checking.

Now if you really wanted to keep some symbols for mapping hardware
register values to resistor values, you could have

    #define MT8192_PULL_UP_RSEL_001      75000
    #define MT8192_PULL_DOWN_RSEL_001     5000

or have them all named MTK_PULL_{UP,DOWN}_RSEL_NNN, but split into
different header files, one per SoC.

Personally I think having the macros is a bad idea if proper values
are available. It just adds another layer of indirection, and another
area where errors can creep in.


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
