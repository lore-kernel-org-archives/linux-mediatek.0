Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C571BC77B7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 14:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFiBEzqnUEk+6sTrPSpLHjEFJM2vHqqsIpaf2EaeOcM=; b=D2F02AnqOcClcLfse7rF0/oZiE
	DPy/ceR0XaRBIe0Q8gwOJZTdVO8yk9tGzff90gcFk/McDLTBmi8MoAcQbjFiXLp4PWrvGgm2gbQZf
	DHIXfDbJVuQZe4Vax38tx8w7KH68Bp1OtLB0+7d2vYd4PTPEPoiB9wGQokSmk8nXSt8rH8xeToBf8
	uhZeSkvdoDdyLLW0EvZiEDuGvJCxtMVKjoaYQ8veM+qAgWHcecVYYjcTXUoWkQG7OrTxB5xbbT748
	aKXBcx9XHCYnuTWqhejlmdES7k/THrQ7ko5daAZU/g3Cx7gJQkPNH/sfEpKOwyCl3XsLsjLUSTfT6
	MRVdlKug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTYc-00C8Z0-2C;
	Fri, 12 May 2023 14:15:42 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTYZ-00C8Xe-01
	for linux-mediatek@lists.infradead.org;
	Fri, 12 May 2023 14:15:40 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7577ef2fa31so1941619785a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 May 2023 07:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683900934; x=1686492934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFiBEzqnUEk+6sTrPSpLHjEFJM2vHqqsIpaf2EaeOcM=;
        b=mAe4xJ12zMC51JhqQtIhJ+YbA6UZG/M06UxtdCrRjY89OkSXZxpe7xdClrt+Th+iCT
         QgZGyP7Y1Ta5AW8GXfGXiGLrBbAGTtyUzICPodevsVOTUrQcJZzYoEO8loAviUFrkKez
         rDJEv/O3cx/HrKswmV0DRnOKw25rkiOSEgEKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683900934; x=1686492934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFiBEzqnUEk+6sTrPSpLHjEFJM2vHqqsIpaf2EaeOcM=;
        b=RCsIcvwijFYJS8Q4Gx8hS2V1GmEP/ga2qsjNN7RYglkcWKZvMticyYaVmpUjFNYDzl
         ZWRJUP8FSgBQHd4ootv64XVetG8Zr9lJRlIphZTiGgpDQ/JqUYwJaEOuojeriWeF69q7
         nfji2E/GV1eXjojLbayX5znVIQgWulawsMMIVSDEVpZZIro8DTYlppxG9QLRoYB4kUtT
         o/1mraeog/vdeVlqySFn2fE6kuP9wP4IGiOwMCLuSKlUuc3Rm4yfE33cBVjOd0Zcdin/
         yf9DAffi6Z/wpIrBqa84TYUYGDaUPwKiibfMM3ktXP7dczwz9BZs0ES2On088GyaeJAI
         tkyg==
X-Gm-Message-State: AC+VfDzOnQnEem0qGbOvMg3GPWuUZDUKAHcVRssnw6Ai6s/mwSh9lRiW
	is3IUZgmGYIZHWrPgaC4Bj5pGOOwxM2P5p8V91U=
X-Google-Smtp-Source: ACHHUZ6Pi4zB0zFCLeisynZr0MIner/bkIPZ2avXC7BksoiD859cSxYEtONvdYFJTNpxuibcY8P33w==
X-Received: by 2002:a05:6214:529c:b0:621:6bd7:4429 with SMTP id kj28-20020a056214529c00b006216bd74429mr9078785qvb.21.1683900934234;
        Fri, 12 May 2023 07:15:34 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id z17-20020a0cfed1000000b0061b5a3d1d54sm3014381qvs.87.2023.05.12.07.15.33
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 07:15:33 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-3f396606ab0so1067191cf.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 May 2023 07:15:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1188:b0:3ef:a55:7f39 with SMTP id
 m8-20020a05622a118800b003ef0a557f39mr473643qtk.12.1683900932805; Fri, 12 May
 2023 07:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
 <20230511150539.3.I525a2ed4260046d43c885ee1275e91707743df1c@changeid> <86ttwim0h9.wl-maz@kernel.org>
In-Reply-To: <86ttwim0h9.wl-maz@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 12 May 2023 07:15:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U63oWO+jSdSPN9ruRyyaFKQOMPOGHwio5+6j4vvygS-Q@mail.gmail.com>
Message-ID: <CAD=FV=U63oWO+jSdSPN9ruRyyaFKQOMPOGHwio5+6j4vvygS-Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: mediatek: mt8183: Add mediatek,gicr-save-quirk
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, wenst@chromium.org, 
	Eddie Huang <eddie.huang@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
	Ben Ho <Ben.Ho@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Tinghan Shen <tinghan.shen@mediatek.com>, jwerner@chromium.org, 
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, yidilin@chromium.org, 
	Seiya Wang <seiya.wang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_071539_069186_2DF9D960 
X-CRM114-Status: GOOD (  24.45  )
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

Hi,

On Fri, May 12, 2023 at 1:13=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Thu, 11 May 2023 23:05:37 +0100,
> Douglas Anderson <dianders@chromium.org> wrote:
> >
> > Firmware shipped on mt8183 Chromebooks is affected by the GICR
> > save/restore issue as described by the patch ("dt-bindings:
> > interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/
> > broken FW"). Add the quirk property.
> >
> > Fixes: e526c9bc11f8 ("arm64: dts: Add Mediatek SoC MT8183 and evaluatio=
n board dts and Makefile")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8183.dtsi
> > index 5169779d01df..39545172fce5 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -709,6 +709,7 @@ gic: interrupt-controller@c000000 {
> >                             <0 0x0c400000 0 0x2000>,   /* GICC */
> >                             <0 0x0c410000 0 0x1000>,   /* GICH */
> >                             <0 0x0c420000 0 0x2000>;   /* GICV */
> > +                     mediatek,gicr-save-quirk;
>
> Is that something you can safely generalise at the SoC level? Are
> these SoC solely used on Chromebooks, and/or

Hmmm, I thought I checked to make sure that the only users of these
upstream were Chromebooks, but I just double-checked and I obviously
was blind yesterday. You're right that I need to fix this. I will move
these to:

mt8195-cherry.dtsi
mt8192-asurada.dtsi
mt8183-kukui.dtsi

...it looks as if the common "baseboard" dtsi for mt8186 Chromebooks
hasn't been upstreamed yet, so we'll have to keep an eye on that and
make sure it gets the property.

When I spin this series early next week I'll make that change.


> without any hope of
> seeing any alternative FW being already in use?

I haven't seen anyone try to fully replace the firmware of a
Chromebook in the past. It would be a lot of work, certainly. More
common, I'd think, would be someone chaining an extra level of loader
between the existing firmware and the OS. I _think_ I've seen people
use a stripped down U-Boot for this. However, the "resident" firmware
would still be the one that the Chromebook ships with.

Certainly someone could prove me wrong and re-implement the firmware
on one of these Chromebooks. That person would need to follow the same
convention or accept that their kernel won't be enabling pseudoNMIs.

-Doug

