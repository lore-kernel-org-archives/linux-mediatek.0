Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C61C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 07:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Apt9Dk2CoziEfGeeXSNDKcm/bw3e59igOKBoc9kqRQ=; b=qqbzEp0NcLR92y
	xrGorTZ58nX0FiuFbsK4vLWGwJrIWKg0yTe8C6d/f1T1a2SzA5+eybqF/RfAm+4WSX0wU9yFg9ZO4
	mq6QYsM/hJjnsI0+N3C++61pHlPBBkexteaVKQsmtbHr58I3UECnvNgla+UU66F3UqWLba4InN4QL
	WmMIoJJNaKS8xAXqdrJvccLkr3zn7BLCmbCJypP8lVshSIPPU3RPBICLl31GnjimH8znvU3fpAgnz
	bP9wu7e4ADceL7yY/z+TsAlW0VhTeEGL0vOYFrt8Sqg5mxi3i3o6XrJArhlpo4ehAMcjK98OrWG2/
	8dP3QmAB6Oj+pkOjTtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paWp6-00DLka-JO; Fri, 10 Mar 2023 07:05:52 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paWp2-00DLgC-4D; Fri, 10 Mar 2023 07:05:50 +0000
Received: by mail-oi1-x22f.google.com with SMTP id y184so3541505oiy.8;
        Thu, 09 Mar 2023 23:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678431944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Apt9Dk2CoziEfGeeXSNDKcm/bw3e59igOKBoc9kqRQ=;
        b=cODHW23nSAnCvbakw46m/53/O/w9otESK75OxxEupLEIYQIdR5uoOiqe+IUMmsIrfa
         sLA8+U1GZJFly3Kc+O8qM5/LBChLX50Z3lCRKw0rgG0A4ZAOAtgo6+isHaMY4gw3yT2G
         dDqTa2VDHWzd8jb1rs0+Lh85Il5qBhBx4RrX1dkfIDyR8HDzCuK0a3qkVknpWSAwauHN
         +i/kRmInCOlH6JsXxKSn1ODbPiLwZmeaDpDTsvQOXWh0UMDhFvjHw3AjszKczXdEFXCB
         rPaGakwJyuvhSQ7lfiHdBmdDZzALeQSFF9SQEyZIPeDGODuUhiXCh8Djelf2BVmzqwZY
         eiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678431944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Apt9Dk2CoziEfGeeXSNDKcm/bw3e59igOKBoc9kqRQ=;
        b=mM2QrlhrwkHs9Fdf/W+sdSgDxONH1VWP7nz45pQFwUpguBHTJYbXIQVJ9+TjWv9360
         oHRYVkxildrVDGe2hxVV3VgJ3qgH+9EA3jLJWWMOgHdr50/AOXtjCWRi405OXEEMxQni
         B475z/MDS9ShlmKOnhfk5JcKF1vbZqIuYerLlCtRypinEF2pKEuLFRA531EqwOAkOiLM
         69yX6oqB00ZkZPNoiweWbNt2COvTR0g+eeXVddt8nPWqrjcuhSkAvqqG5dJ24Y2dWQmK
         wucZ71EKoHc8VgfrBeGhE3dFu/Q2CjXOSfzrkpJ/VXxTtzNlGFMxxtK6SUFJc6gpk1Fs
         HS3Q==
X-Gm-Message-State: AO0yUKUc5HYQpOEnNkTTZsYGA+PfmH/5yF2szu+5zH7DR3v2AxQKM+ON
	Joubo0veDXBfuHUbz9MWjuVz+QmCctpBCuGqJFg=
X-Google-Smtp-Source: AK7set+Dm/R3lBw0fzhFuTzV5Lb+E9hla4HLfDXtL8iri21EzQdxnwTyxFKAsn39JI7FHQUQeGMGpEFMqrEAbnm3Bcg=
X-Received: by 2002:a05:6808:aa1:b0:384:2022:f9b1 with SMTP id
 r1-20020a0568080aa100b003842022f9b1mr8254384oij.2.1678431944516; Thu, 09 Mar
 2023 23:05:44 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com> <20230303002850.51858-10-arinc.unal@arinc9.com>
 <20230308210514.GA3767521-robh@kernel.org> <12be053e-b70a-faca-71c8-d8eef69a3b73@arinc9.com>
 <ccdfd262-eaf3-dbbe-7a3c-a911a5ec0fc4@arinc9.com> <9663817e-7f6f-c3b1-8bf9-321f9b067e96@linaro.org>
 <deca532a-bdf5-c49e-1422-ce6124b61882@arinc9.com> <CAMhs-H8M3ir+DshHF60W=QMn9WG3Jgbo8GgXZnDKCLhs=+WBoQ@mail.gmail.com>
 <81cf9e50-d626-cbb3-ebb1-56d080eca66d@arinc9.com>
In-Reply-To: <81cf9e50-d626-cbb3-ebb1-56d080eca66d@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 10 Mar 2023 08:05:31 +0100
Message-ID: <CAMhs-H_YkdacZXE2xqn=_JQtitLvqRFB20s7rjS63dFabAL4qw@mail.gmail.com>
Subject: Re: [PATCH 09/20] dt-bindings: pinctrl: ralink: {mt7620,mt7621}:
 rename to mediatek
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_230548_212409_E0A29DB4 
X-CRM114-Status: GOOD (  32.20  )
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
Cc: Rob Herring <robh@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, devicetree@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 9, 2023 at 10:09 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> On 9.03.2023 14:33, Sergio Paracuellos wrote:
> > On Thu, Mar 9, 2023 at 11:34 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@a=
rinc9.com> wrote:
> >>
> >> On 9.03.2023 12:52, Krzysztof Kozlowski wrote:
> >>> On 09/03/2023 08:53, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> >>>> On 9.03.2023 00:19, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> >>>>> On 9.03.2023 00:05, Rob Herring wrote:
> >>>>>> On Fri, Mar 03, 2023 at 03:28:38AM +0300, arinc9.unal@gmail.com wr=
ote:
> >>>>>>> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >>>>>>>
> >>>>>>> This platform from Ralink was acquired by MediaTek in 2011. Then,
> >>>>>>> MediaTek
> >>>>>>> introduced these SoCs which utilise this platform. Rename the sch=
emas to
> >>>>>>> mediatek to address the incorrect naming.
> >>>>>>
> >>>>>> I said we don't do renames due to acquistions, you said that wasn'=
t the
> >>>>>> reason, but then that's your reasoning here.
> >>>>>
> >>>>> It's not a marketing/acquistion rename as the name of these SoCs we=
re
> >>>>> wrong from the get go. The information on the first sentence is to =
give
> >>>>> the idea of why these SoCs were wrongfully named as the base platfo=
rm
> >>>>> that these new MediaTek SoCs share code with was called Ralink.
> >>>>>
> >>>>>>
> >>>>>> To give you another example, *new* i.MX things are still called
> >>>>>> 'fsl,imx...' and it has been how many years since merging with NXP=
?
> >>>>>
> >>>>> Ok this is a point I see now. Though, I fail to see how this is cal=
led
> >>>>> renaming when there's only new SoCs (from NXP in this case) to be a=
dded.
> >>>>
> >>>> If I understand correctly, i.MX is a family from Freescale so the na=
me
> >>>
> >>> It's the same "family" as your platform, because as you said:
> >>> "introduced these SoCs which utilise this platform"
> >>>
> >>>> was kept the same on new SoC releases from NXP. I believe it's diffe=
rent
> >>>> in this case here. There's no family name. The closest thing on the =
name
> >>>> of the SoC model is, it's RT for Ralink, MT for MediaTek.
> >>>
> >>> It's not about the name. NXP took Freescale platform and since many
> >>> years makes entirely new products, currently far, far away from origi=
nal
> >>> platform.
> >>>
> >>> That's the same case you have here - Mediatek took existing platform =
and
> >>> started making new products with it.
> >>>
> >>>>
> >>>> On top of that, mediatek strings already exist for MT SoCs already, =
at
> >>>> least for MT7621.
> >>>>
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/=
tree/Documentation/devicetree/bindings/mips/ralink.yaml?id=3Ddd3cb467ebb565=
9d6552999d6f16a616653f9933#n83
> >>>
> >>> NXP also has compatibles with nxp, thus still not that good reason.
> >>
> >> Ok, makes sense. Am I free to call the SoCs MediaTek, change the schem=
a
> >> name from ralink,mtXXXX-pinctrl.yaml to mediatek,mtXXXX-pinctrl.yaml
> >> whilst keeping the compatible string ralink?
> >>
> >> I plan to do some cleanup on ralink.yaml as well. From what I
> >> understand, I should change the mediatek,mt7621-soc compatible string =
to
> >> ralink,mt7621-soc?
> >
> > You have to take care of these SoC strings since they are used in the
> > very beginning of the ralink startup platforms for any single ralink
> > SoC. See for example [0] and [1] (but they are in all soc init code).
> > I think it is better to maintain the ralink.yaml file as it is.
>
> I'd really rather address this inconsistency everywhere possible. The
> code you pointed out looks different than what I did on the pinctrl
> driver but, surely it's possible on the code to introduce ralink and
> keep the mediatek string for the sake of old DTs, no?

In any case, the changes you might have in mind for this should be a
different patch series.

Best regards,
     Sergio Paracuellos
>
> Ar=C4=B1n=C3=A7

