Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F31C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVWBr/nHRC2tYP4GHz+Q26dc8LouI1/mTHjWjyy5lJY=; b=gQ+cvIj0pacDx7
	cIFsDlYU9M0tjGq5ctrlzhFXjOZNEcxIDgetAVbZzaOC+W7DKXz8RmnDw5OxUzUONW4zm75wCEsHv
	03hm1SIKhLEbEs2VyeH0o2HRPQeD+4aMMTqVvJVboP0kvB9cLiNACmkBPe9+okJQTIZtr97CUtc6a
	zekpi4PKVEp63yse6z94CZE+43D4TPjCLPAAlUpxZJSKheM/hoTUapCBodmD8kwhXy6Q4aQSec+pT
	ua7OtEzUSY7AMYgTHWeAwM4QKJcofREzAdn71RSkTyHRz4cz8YRimSHRexOO0ILeMsJMgTkPKTibf
	mWIo+CYDcGQI3v5YREaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEpw-009gsg-6q; Thu, 09 Mar 2023 11:53:32 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEWK-009XnJ-Ul; Thu, 09 Mar 2023 11:33:18 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-17711f56136so1916754fac.12;
        Thu, 09 Mar 2023 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678361594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVWBr/nHRC2tYP4GHz+Q26dc8LouI1/mTHjWjyy5lJY=;
        b=E3Y8S/UvtydBi2xb90Ub5S4kXSGQdXRmiDm6/T3ti5CjjF4yk3XqDiG2BQoYthSZeO
         mxCLl3BdDex+MGfAk9hkp/FpWcZrlTDnxaZCaC4I3v6fw+kKXRqBZP5ZDa5wOsmZlPLD
         AzGcnuh4h3IRpeeaD5q43gZbfVKIXIHgkPCi+2yEMrPqxFGsyviR99270l6z81M1U4RC
         nU6zDqwT7dxUWdz9abqEOwMH/o/sX3ldZ1UVhiysDTeWZDWhZeBkgxeelHe/yODPhvdY
         juJ4EF2KNrVW6cAyuDX99w0UHVJi1G/6CeMPT8r8PBc+A8xbxhckcsQEQTNFzZXBxosG
         bHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVWBr/nHRC2tYP4GHz+Q26dc8LouI1/mTHjWjyy5lJY=;
        b=3cil3okWpLX+ohkeRxH0qVoE/W3o47NcYXXpLW8/0njwPytyvaG3uNgmaTMk87jhgG
         xGY2AMCpZWrHSs76JOVdMx2Ixf78yfGECaqBe+KpPGIGdwrJSEAMLWTENIUDxb1ceoqb
         lC9BRk7jhQyjWOBC0PtbiYdAq6PxkWxmiHlSU44i44UX06B8mpOq8axI4qAOOzoMUvLW
         OVAkG9t7yDJLt3R5yCRXXKOAx9wiaze5JZbe+Clf3KGzWprYSC1cpkWw2LwE7/bbSwOd
         fjVf/87vzxnYds+jJaZSmU+oyrmd0VMPsEnj4UrdAFdrv2pmRdq1zViSxiU8uYTCtUcV
         kTeA==
X-Gm-Message-State: AO0yUKXQCfmjmjlo6Qw2PrG1Ignb0NTVjXEtWuglqo4ZPeJ5Z/9Z6y8d
	+wE9rEKGWpg09G8dvOF9ESNIWOlf1DGjEqZXZtk=
X-Google-Smtp-Source: AK7set/XSrA5enE/PH73VS6AKR9JL5gUiLM25aDZOjVqo4Juj983qp5aKuXczEDYDKwriek9TOjLmAn4vC6x4VmkCfw=
X-Received: by 2002:a05:6870:8c28:b0:16d:fb8e:3ba with SMTP id
 ec40-20020a0568708c2800b0016dfb8e03bamr7334038oab.0.1678361594135; Thu, 09
 Mar 2023 03:33:14 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com> <20230303002850.51858-10-arinc.unal@arinc9.com>
 <20230308210514.GA3767521-robh@kernel.org> <12be053e-b70a-faca-71c8-d8eef69a3b73@arinc9.com>
 <ccdfd262-eaf3-dbbe-7a3c-a911a5ec0fc4@arinc9.com> <9663817e-7f6f-c3b1-8bf9-321f9b067e96@linaro.org>
 <deca532a-bdf5-c49e-1422-ce6124b61882@arinc9.com>
In-Reply-To: <deca532a-bdf5-c49e-1422-ce6124b61882@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 9 Mar 2023 12:33:01 +0100
Message-ID: <CAMhs-H8M3ir+DshHF60W=QMn9WG3Jgbo8GgXZnDKCLhs=+WBoQ@mail.gmail.com>
Subject: Re: [PATCH 09/20] dt-bindings: pinctrl: ralink: {mt7620,mt7621}:
 rename to mediatek
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_033317_052641_FE78DE69 
X-CRM114-Status: GOOD (  28.71  )
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

On Thu, Mar 9, 2023 at 11:34 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> On 9.03.2023 12:52, Krzysztof Kozlowski wrote:
> > On 09/03/2023 08:53, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> >> On 9.03.2023 00:19, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> >>> On 9.03.2023 00:05, Rob Herring wrote:
> >>>> On Fri, Mar 03, 2023 at 03:28:38AM +0300, arinc9.unal@gmail.com wrot=
e:
> >>>>> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >>>>>
> >>>>> This platform from Ralink was acquired by MediaTek in 2011. Then,
> >>>>> MediaTek
> >>>>> introduced these SoCs which utilise this platform. Rename the schem=
as to
> >>>>> mediatek to address the incorrect naming.
> >>>>
> >>>> I said we don't do renames due to acquistions, you said that wasn't =
the
> >>>> reason, but then that's your reasoning here.
> >>>
> >>> It's not a marketing/acquistion rename as the name of these SoCs were
> >>> wrong from the get go. The information on the first sentence is to gi=
ve
> >>> the idea of why these SoCs were wrongfully named as the base platform
> >>> that these new MediaTek SoCs share code with was called Ralink.
> >>>
> >>>>
> >>>> To give you another example, *new* i.MX things are still called
> >>>> 'fsl,imx...' and it has been how many years since merging with NXP?
> >>>
> >>> Ok this is a point I see now. Though, I fail to see how this is calle=
d
> >>> renaming when there's only new SoCs (from NXP in this case) to be add=
ed.
> >>
> >> If I understand correctly, i.MX is a family from Freescale so the name
> >
> > It's the same "family" as your platform, because as you said:
> > "introduced these SoCs which utilise this platform"
> >
> >> was kept the same on new SoC releases from NXP. I believe it's differe=
nt
> >> in this case here. There's no family name. The closest thing on the na=
me
> >> of the SoC model is, it's RT for Ralink, MT for MediaTek.
> >
> > It's not about the name. NXP took Freescale platform and since many
> > years makes entirely new products, currently far, far away from origina=
l
> > platform.
> >
> > That's the same case you have here - Mediatek took existing platform an=
d
> > started making new products with it.
> >
> >>
> >> On top of that, mediatek strings already exist for MT SoCs already, at
> >> least for MT7621.
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tr=
ee/Documentation/devicetree/bindings/mips/ralink.yaml?id=3Ddd3cb467ebb5659d=
6552999d6f16a616653f9933#n83
> >
> > NXP also has compatibles with nxp, thus still not that good reason.
>
> Ok, makes sense. Am I free to call the SoCs MediaTek, change the schema
> name from ralink,mtXXXX-pinctrl.yaml to mediatek,mtXXXX-pinctrl.yaml
> whilst keeping the compatible string ralink?
>
> I plan to do some cleanup on ralink.yaml as well. From what I
> understand, I should change the mediatek,mt7621-soc compatible string to
> ralink,mt7621-soc?

You have to take care of these SoC strings since they are used in the
very beginning of the ralink startup platforms for any single ralink
SoC. See for example [0] and [1] (but they are in all soc init code).
I think it is better to maintain the ralink.yaml file as it is.

Best regards,
    Sergio Paracuellos

[0]: https://elixir.bootlin.com/linux/v6.2.1/source/arch/mips/ralink/mt7621=
.c#L200
[1] https://elixir.bootlin.com/linux/v6.2.1/source/arch/mips/ralink/rt305x.=
c#L161

>
> Ar=C4=B1n=C3=A7

