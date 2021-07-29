Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43107C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 09:43:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CB3861058
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 09:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CB3861058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPVU/PYYGuSusoVuumZnBwv4W2pZwibh/cJWPES3ayk=; b=gO4G4rn4EFxiRX
	qXmUOmPGkupa8oydoBGQICAnYMm5LZu7vaICRkK7A/vHaBx+egeQai9vJq/pQ/eOQuXULQqP2sUQ3
	uX/aVnKSqhx0hvIWyWvR7uvEklx0y3Q1iE7H9BBs2Uv1bZ9Z5ZUtq86Hk2pJmy6JZ3K/a1bnDmweT
	lKgBn5TJJwQbBEtGR4e/4OOb0wVnNl0Tu7CAqDM12J0cjim87re1eZe9fSWvACEm/12lgS0YRUoH8
	RaYamFPmnERx8RHm6nvkT4imenJD2M0p8ED3xcKklljA9VAUFDG04bauE5rAP5ZvrgFSLC4HFHpGm
	QupNn8tnhV9i/YJYjQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m92Zv-003h4z-G9; Thu, 29 Jul 2021 09:43:47 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m92Zs-003h3R-4f
 for linux-mediatek@lists.infradead.org; Thu, 29 Jul 2021 09:43:46 +0000
Received: by mail-lf1-x12c.google.com with SMTP id bp1so9891772lfb.3
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Jul 2021 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rsaad1GJ/XkOm8cfftebiAxoVa/TpWToS62izuGJ9pY=;
 b=ROFh5zsDdjGB7xsZ3gfN08X4TCqyLE5GcRkJ/K9oEApY7i/IignrvExID9mp+hgOyH
 m+q2hwtfQ3PcGy4Zu1LihgEvq5qWFR/OkQ+71zz+O8nUDZjw76nkxxU3HSuT73irF7KN
 57aQnO2wW+VyKNylkZJkCNV4eqIcS2Gdtt3M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rsaad1GJ/XkOm8cfftebiAxoVa/TpWToS62izuGJ9pY=;
 b=hen6/2atINrO1qhP4wbVZMOeAtILZBhbTmQtalaO55qMJA/yW6mV1s9lWmbSipMF3s
 5vCBXs+oHeHjV+kcBC2gvp0I21pBtPnVrNdwcRWcMWmsKDLmaVUihuzyOQt32GIhaDWG
 n+WboduEEAgHMulpxryipaKuLyFUrqQlwzTt5ov14FnV2+ihe/2VPUDUFBzuf0/1E+T2
 r3z0vbixUqq5gjVrJQ3BQF0qo15ZJ6Jj0t6rLLT81LsjRfqF3izrzs9lJG0K6qV6E5KA
 +T90uqaP1SDcDoaWC4/9dzHaU4huKNuPiP15O6OukrbzM5IReaqXrTg4sE0WrN1MxsKk
 DLrA==
X-Gm-Message-State: AOAM530r0+cj5W8lqQ3dKsU8jt4I6+y9jZAQodF3Z0emW+V27/KLClR7
 RuruaTUZRAmq859bNvKKBus9zx9iOnpCC+J6SUVttA==
X-Google-Smtp-Source: ABdhPJxZA8w1PV7njkB8YqwoZbP8na6AFtXiJ942E2I1irAuG8V7nC6e8Ne+qo+7pXOc9OavLte6E41ZTbaK5boATXU=
X-Received: by 2002:a05:6512:a89:: with SMTP id
 m9mr3260592lfu.342.1627551821389; 
 Thu, 29 Jul 2021 02:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com>
 <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03>
 <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
In-Reply-To: <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Jul 2021 17:43:30 +0800
Message-ID: <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 mark.rutland@arm.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, light.hsieh@mediatek.com, 
 biao.huang@mediatek.com, hongzhou.yang@mediatek.com, 
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
 Devicetree List <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_024344_258138_A422D410 
X-CRM114-Status: GOOD (  48.53  )
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

On Thu, Jul 29, 2021 at 4:23 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Mon, 2021-07-26 at 16:02 +0800, Chen-Yu Tsai wrote:
> > On Thu, Jul 22, 2021 at 3:54 PM zhiyong tao <zhiyong.tao@mediatek.com
> > > wrote:
> > >
> > > On Tue, 2021-07-13 at 15:17 +0800, Chen-Yu Tsai wrote:
> > > > Hi,
> > > >
> > > > On Sat, Jul 10, 2021 at 4:17 PM Zhiyong Tao <
> > > > zhiyong.tao@mediatek.com> wrote:
> > > > >
> > > > > This patch adds rsel define for mt8195.
> > > > >
> > > > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > > > ---
> > > > >  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
> > > > >  1 file changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-
> > > > > bindings/pinctrl/mt65xx.h
> > > > > index 7e16e58fe1f7..f5934abcd1bd 100644
> > > > > --- a/include/dt-bindings/pinctrl/mt65xx.h
> > > > > +++ b/include/dt-bindings/pinctrl/mt65xx.h
> > > > > @@ -16,6 +16,15 @@
> > > > >  #define MTK_PUPD_SET_R1R0_10 102
> > > > >  #define MTK_PUPD_SET_R1R0_11 103
> > > > >
> > > > > +#define MTK_PULL_SET_RSEL_000  200
> > > > > +#define MTK_PULL_SET_RSEL_001  201
> > > > > +#define MTK_PULL_SET_RSEL_010  202
> > > > > +#define MTK_PULL_SET_RSEL_011  203
> > > > > +#define MTK_PULL_SET_RSEL_100  204
> > > > > +#define MTK_PULL_SET_RSEL_101  205
> > > > > +#define MTK_PULL_SET_RSEL_110  206
> > > > > +#define MTK_PULL_SET_RSEL_111  207
> > > > > +
> > > >
> > > > Instead of all the obscure macros and the new custom "rsel"
> > > > property,
> > > > which BTW is not in the bindings, can't we just list the actual
> > > > bias
> > > > resistance of each setting? We could also migrate away from R1R0.
> > > >
> > >
> > > ==>Hi Chenyu,
> > > The rsel actual bias resistance of each setting:
> > >
> > > MTK_PULL_SET_RSEL_000:75K in PU, 75k in PD;
> > > MTK_PULL_SET_RSEL_001:10k in PU, 5k in PD;
> > > MTK_PULL_SET_RSEL_010:5k in PU, 75k in PD;
> > > MTK_PULL_SET_RSEL_011:4k in PU, 5K in PD;
> > > MTK_PULL_SET_RSEL_100:3k in PU, 75k in PD;
> > > MTK_PULL_SET_RSEL_101:2k in PU, 5K in PD;
> > > MTK_PULL_SET_RSEL_110:1.5k in PU, 75k in PD;
> > > MTK_PULL_SET_RSEL_111:1k in PU, 5k in PD.
> > >
> > > The rsel actual bias resistance is different between PU and PD.
> >
> > Thanks. Somehow I missed this when looking through the datasheet.
> > This
> > encoding is interesting. Since it doesn't make sense to have both
> > pull-up and pull-down, even though the hardware seems capable of
> > doing
> > so, I suppose the intent is to support 75k or 5k for pull-down, and
> > (75k, 10k, 5k, 4k, 3k, 2k, 1.5k, 1k) for pull-up?
> >
> > We could add these values to the binding so we could check for
> > misuse.
> >
> > The range of values seems to also cover those supported by the
> > alternative R0/R1 settings. The values for kprow[01] and kpcol[01]
> > seem to be different though.
> >
> > We should get rid of the MTK_PUPD_SET_R1R0_* macros at the same time.
> > They seem to be some magic values used with bias-pull-*, which is not
> > how the properties should be used. At the same time, they overlap
> > with
> > mediatek,pull-* properties.
> >
> > It would be great if we could standardize on the generic pinconf
> > properties, and also use real values that fit the requirements of the
> > properties, i.e. using real resistance values. I'm not sure if it
> > would make sense to enumerate which pins support which configurations
> > though.
> >
> >
> > Thanks
> > ChenYu
> >
> >
> The rsel actual bias resistance of each setting is different in
> different IC. we think that the define "MTK_PULL_SET_RSEL_000" is more
> common for all different IC.

I see. I personally prefer having things clearly described. I can
understand this might be an extra burden to support different chips
with different parameters, though this should be fairly straightforward
with lookup tables tied to the compatible strings.

Let's see if Rob and Linus have anything to add.


ChenYu


> Thanks.
>
> > > > Then we can specify the setting with the standard bias-pull-
> > > > up/down
> > > > properties [1].
> > > >
> > > > Also, please ask internally if Mediatek could relicense all the
> > > > header
> > > > files that Mediatek has contributed under include/dt-
> > > > bindings/pinctrl/ [2]
> > > > to GPL-2.0 and BSD dual license. These files are part of the DT
> > > > bindings
> > > > and we really want them to be dual licensed as well, and not just
> > > > the
> > > > YAML files.
> > > >
> > >
> > > ==> We will confirm it internally and reply it later.
> > >
> > > Thanks.
> > > >
> > > > Regards
> > > > ChenYu
> > > >
> > > >
> > > > [1]
> > > > https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml#L37
> > > > [2] Note that a few files were contributed by other people
> > > >
> > > > >  #define MTK_DRIVE_2mA  2
> > > > >  #define MTK_DRIVE_4mA  4
> > > > >  #define MTK_DRIVE_6mA  6
> > > > > --
> > > > > 2.18.0
> > > > > _______________________________________________
> > > > > Linux-mediatek mailing list
> > > > > Linux-mediatek@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
