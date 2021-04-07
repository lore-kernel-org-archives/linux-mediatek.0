Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31962C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 17:55:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B952D6128D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 17:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B952D6128D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8KoA6hkEjgWQJzfdAuaG1bv5iumRcBVpjYF/7tABa84=; b=WVtmgcN7THbIl7pt7NQTuEU7p
	DiketHSFgm/18J4GheXvXn99liATmWOvSh3fYKqjISpaJGqXlVZWasiMQu/evjxswHfGaCzOxKdwR
	yYW3LpFad4VeHqXC0jURIn+mmEAx74Arkgu7pQvokH8RMUH8Lkeir1dnQ+e64wMJx9m3hbflkbyS5
	EFng1L2JgvG4Gl6oVwI3WrIhRwsU2lWAfAaHN6hp59Gh8VBrgxb1kZblnTRT0E7iMVjlr5JraPrys
	t4kB6GUp8RKhCpF+cbssa7p24j7DT9+fCFBv0hZ0WFTireP/JM1j6Qy/caf0HY3GTK7rN/+tYyJQ7
	ei1Omyiqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUCP3-005h7b-DX; Wed, 07 Apr 2021 17:55:45 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUCOv-005h6r-Ve; Wed, 07 Apr 2021 17:55:39 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MCXhr-1lLdh73AP5-009hCj; Wed, 07 Apr 2021 19:55:35 +0200
Received: by mail-ot1-f53.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so18898971otk.5; 
 Wed, 07 Apr 2021 10:55:34 -0700 (PDT)
X-Gm-Message-State: AOAM533RUv5ZqXp78Bkti1xvFSAxkyVHHs4sITm9HHTkVDkDpTmuXXos
 Dw/f1RYTs/KPkSXTy5gAdzxdSmOVEWwYaawqFfI=
X-Google-Smtp-Source: ABdhPJzFae5o2sDZdv1GTYiLdAFDJ0G3fZf1iRlU0eP5yGtTc46bhdPOIwOQIpCMXbLmu9KXnz8t04DTE8yeXQij0sE=
X-Received: by 2002:a9d:316:: with SMTP id 22mr3925495otv.210.1617818133281;
 Wed, 07 Apr 2021 10:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <22814673-e9fe-f65b-cc0f-b02be4f90d1a@gmail.com>
 <CAK8P3a0bp3CUzOQHSX5KYt44j-Njk_u2P=0q-ZQ0HcTBiVVVSA@mail.gmail.com>
 <01c82108-64a8-33ee-3984-5bd7056a0002@gmail.com>
In-Reply-To: <01c82108-64a8-33ee-3984-5bd7056a0002@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 7 Apr 2021 19:55:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a37BUdHneO+9+t0Pan3UWZHub-ishcKLNxCbqO0kk0CNw@mail.gmail.com>
Message-ID: <CAK8P3a37BUdHneO+9+t0Pan3UWZHub-ishcKLNxCbqO0kk0CNw@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: changes for v5.13 (second round)
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Fabien Parent <fparent@baylibre.com>, 
 Irui Wang <irui.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 DTML <devicetree@vger.kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Provags-ID: V03:K1:SbY1cRD1lpqjZrXT9mOUTzVzmPjA/Z21EcqTRF5gXQr54BrPLcx
 BD3UD3SsBDeF33MyPhT90W9vl1gL5JO0Bg5GhzmbtRXQzXlkDqfS6SkLpDTFjERF2sNDwhL
 gbhnGeu6BIYjDo91Y5wO2uf8fLKZs4x5O2zKLrEpR1HlBdamAP++DwcPYen4AfJ3FjHKpIh
 wAHE5PH0b0b9d3VK+yPLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bSoGLQBZCew=:DaxU9mJb6kgANQyNLHgoF5
 cCJXF3acdv4z2rNW/2WIUjLiyi7A1pw3v/2V9CrUPxD6xwGZeuaPnN4M/x40oThgXkOV/aCER
 GQC48X9cgyUkpaFZTsEA30tUk28wAHK//G8P+HaRoygwQdj3MiymCAtD2KIYZ+MTFi+HHWMFF
 tHsC80awQlEV/GF8mdaLstY8r91gDsXCMmeb1qdiTUkLMLqNq+2BKae5VNky4fSBByx+t8Rye
 gJ1clH/7e+75hxbvHehtRIgv5g4MvMmiJ/zssROaHVAWoGO5S9jIcuHW/fAsPA9OPbf2ij4VU
 suwwd0dFSXHYeIq3fXr/PjBq7RIT21ct6YK3AM1FPrlrlX0b8RcVSosB1kvS3RWPqIqJM//NC
 U6BANIAGP0IL0zL1mUYPxYSsjzyplx5vHf9fl6a7nYGBNH0QtiIVnm39dHurwbqrfKIcvuJPZ
 Jitask2G2cizztCSU1MBJtW1GOzPLPU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_185538_148312_97A1E9FE 
X-CRM114-Status: GOOD (  29.77  )
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

On Wed, Apr 7, 2021 at 6:34 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> On 07/04/2021 18:06, Arnd Bergmann wrote:
> > On Wed, Apr 7, 2021 at 1:00 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >>
> >> Hi Olof and Arnd,
> >>
> >> Here comes the second round of arm64 DT patches. Hope I'm not too late.
> >> Basically we add several node to MT8167.
> >> ----------------------------------------------------------------
> >> Fabien Parent (6):
> >
> >>       arm64: dts: mediatek: mt8167: add some DRM nodes
> >
> > I stumbled over this patch adding a lot of aliases:
> >
> > +       aliases {
> > +               aal0 = &aal;
> > +               ccorr0 = &ccorr;
> > +               color0 = &color;
> > +               dither0 = &dither;
> > +               dsi0 = &dsi;
> > +               ovl0 = &ovl0;
> > +               pwm0 = &disp_pwm;
> > +               rdma0 = &rdma0;
> > +               rdma1 = &rdma1;
> > +               wdma0 = &wdma;
> > +       };
> >
> >
> > Something doesn't quite feel right about this, and I checked with Rob,
> > who also thinks this looks wrong. I suppose we need to have a set of
> > well documented alias types rather than just having drivers make up
> > new ones on the spot.
>
> These are needed in the DRM driver, see drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>
> I added Chun-Kuang who is the maintainer of the driver. I think it's a good idea
> to have this alias described in the binding. Maybe a good excuse to move to yaml
> as well :)

The aliases certainly need to be described in the binding, I think someone
would likely have complained earlier if that was part of the binding.

Moving it to yaml is also a good idea, and required for any new devices.

> > I also noticed that some of the referenced nodes are missing a DT
> > binding file, so those need to be added and reviewed as well.
>
> I suppose you are talking about "mediatek,mt8173-vcodec-enc-vp8". The binding
> patches are in the media tree [1]. Maybe I supposed wrongly that they will land
> in v5.13? Or perhaps I should have mentioned that in the pull request.
>
> If it wasn't about this compatible and you can still remember, please let me
> know so that we can fix that :)
>
> I double checked and didn't find any missing binding. Some of them only have the
> fallback binding described, maybe that's what you are referring to.

Here is what I see for all compatible strings of the added device nodes in
this patch, as of linux-next-20210407:

$ for i in mediatek,mt8167-disp-mutex mediatek,mt8167-disp-rdma
mediatek,mt2701-disp-rdma mediatek,mt8167-disp-pwm
mediatek,mt8173-disp-pwn mediatek,mt8167-dsi mediatek,mt2701-dsi
mediatek,mt8167-mipi-tx mediatek,mt2701-mipi-tx
mediatek,mt8167-disp-ovl mediatek,mt8173-disp-ovl
mediatek,mt8167-disp-rdma mediatek,mt2701-disp-rdma
mediatek,mt8167-disp-color mediatek,mt8173-disp-color
mediatek,mt8167-disp-ccorr mediatek,mt8183-disp-ccorr
mediatek,mt8167-disp-aal mediatek,mt8167-disp-gamma
mediatek,mt8173-disp-gamma mediatek,mt8167-disp-dither
mediatek,mt8167-disp-wdma ; do echo === $i ;  git grep -wl $i
Documentation/devicetree/ ; done

=== mediatek,mt8167-disp-mutex
=== mediatek,mt8167-disp-rdma
=== mediatek,mt2701-disp-rdma
=== mediatek,mt8167-disp-pwm
Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
=== mediatek,mt8173-disp-pwn
=== mediatek,mt8167-dsi
=== mediatek,mt2701-dsi
=== mediatek,mt8167-mipi-tx
=== mediatek,mt2701-mipi-tx
Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
=== mediatek,mt8167-disp-ovl
=== mediatek,mt8173-disp-ovl
Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
=== mediatek,mt8167-disp-rdma
=== mediatek,mt2701-disp-rdma
=== mediatek,mt8167-disp-color
=== mediatek,mt8173-disp-color
Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
=== mediatek,mt8167-disp-ccorr
=== mediatek,mt8183-disp-ccorr
=== mediatek,mt8167-disp-aal
=== mediatek,mt8167-disp-gamma
=== mediatek,mt8173-disp-gamma
Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
=== mediatek,mt8167-disp-dither
=== mediatek,mt8167-disp-wdma

So five of the strings are documented, the others are missing. I did not check
the other patches in your branch.

         Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
