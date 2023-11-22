Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5858C072A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gha+lhz98cqfqHPVBYNZIJYx9aE1nB2ARipNu2FhWYQ=; b=YS+5lcL8NZ2lK0bmj4KylbSwim
	9+rVSe3uisuqL5OFIFQx1+RkCorqDWXkUu/RiuUMgCN/ZHwQ5qSflB/Meck4Ec0QCpoQh18Vm0FGD
	O51IqUqDHuu2ERpvgW8zynky1QVmplRKa6lxE61rPksr0AdORJU+GEnun4ti7ks8BMdj2OoMCxfqp
	ksosAkL5wBD5smricyEREBZbykgeRdkePwlVmto/LqeQ/dZ2YuvpM59+x96aLh+bASwrro18A8COF
	HPPxMSv/LaomFGUmtaA1CYwQ8VYPmRrhji7XwvG1WZU73cZhvTDsf85YfzJT5O87t258t6GzmB/8y
	wt7ekqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ibJ-0013Y5-1q;
	Wed, 22 Nov 2023 08:28:49 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ibG-0013WW-1N;
	Wed, 22 Nov 2023 08:28:47 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5c85e8fdd2dso50850727b3.2;
        Wed, 22 Nov 2023 00:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700641721; x=1701246521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gha+lhz98cqfqHPVBYNZIJYx9aE1nB2ARipNu2FhWYQ=;
        b=aojB6oIibT+KRMhkXwCOtwkKI6hyd7JomQLdVUPLQZrzaSaWxi/iCV1f2NY+lujjNN
         zBjj6G6ACp3Eo07LXSq8E+DoBIOo2s4MAM2/xEGAiWidMT6Sa0ScEzSjq39mD1tWP/1D
         ZUsj3zYmf3CbO/HcoqZNnxwCsKDHRrN2xRMjUdEiwwkxNdznTM+nHUl7DA2IZeV9CNB9
         ncBjVFcFibTgi2L2xa9w+gxewvJAn8hJec61NX5KSZwiDyGowMSVrhM7nM+0A/RdObdn
         bX2nDBAY9H8YLK3O7po70F62YyVMl9jiiek/yAz3h4vfwoFE7/O45zNO46q7EiwZD8nk
         xwmw==
X-Gm-Message-State: AOJu0Yz6PaILQd4e2DQjSM1VVa9xXgKlJYr1tjhgXBGiq9wFFzNQUyNG
	oy+Clg+rEbKTc1sGY4AzhBPF1aTBoblhhA==
X-Google-Smtp-Source: AGHT+IHyBh02cCo+CFPiZb3pe+qTI+CpnsToJwqWDpf8/QmB3C+Foc+kTs7vg0x+dgeLd3FZYLcoEQ==
X-Received: by 2002:a81:8485:0:b0:5ca:81ff:b5e5 with SMTP id u127-20020a818485000000b005ca81ffb5e5mr1646071ywf.12.1700641721468;
        Wed, 22 Nov 2023 00:28:41 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id w202-20020a0dd4d3000000b005ca265f0c68sm20545ywd.42.2023.11.22.00.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 00:28:41 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-daf7ed42ea6so6374260276.0;
        Wed, 22 Nov 2023 00:28:41 -0800 (PST)
X-Received: by 2002:a25:cec5:0:b0:d9b:dae4:63fa with SMTP id
 x188-20020a25cec5000000b00d9bdae463famr1414014ybe.34.1700641720963; Wed, 22
 Nov 2023 00:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com> <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
 <CAGb2v64Vf5dDwq=KTrxwc=+w+0KUD2KVPMjmHg68Y_yukES5dQ@mail.gmail.com> <7232a48b-b9ad-44b5-ae6a-d12dad70b3c4@linaro.org>
In-Reply-To: <7232a48b-b9ad-44b5-ae6a-d12dad70b3c4@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 09:28:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXDUF7i9GdXSyHbmUtwmCCXf-sXQDbrGAKTtQ9=TSNFjA@mail.gmail.com>
Message-ID: <CAMuHMdXDUF7i9GdXSyHbmUtwmCCXf-sXQDbrGAKTtQ9=TSNFjA@mail.gmail.com>
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: wens@kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_002846_463863_2DB46880 
X-CRM114-Status: GOOD (  35.13  )
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

On Wed, Nov 22, 2023 at 9:21=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 22/11/2023 09:09, Chen-Yu Tsai wrote:
> > On Wed, Nov 22, 2023 at 4:05=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 21/11/2023 14:50, Rafa=C5=82 Mi=C5=82ecki wrote:
> >>>> +Order of Nodes
> >>>> +--------------
> >>>> +
> >>>> +1. Nodes within any bus, thus using unit addresses for children, sh=
all be
> >>>> +   ordered incrementally by unit address.
> >>>> +   Alternatively for some sub-architectures, nodes of the same type=
 can be
> >>>> +   grouped together (e.g. all I2C controllers one after another eve=
n if this
> >>>> +   breaks unit address ordering).
> >>>> +
> >>>> +2. Nodes without unit addresses should be ordered alpha-numerically=
 by the node
> >>>> +   name.  For a few types of nodes, they can be ordered by the main=
 property
> >>>> +   (e.g. pin configuration states ordered by value of "pins" proper=
ty).
> >>>> +
> >>>> +3. When extending nodes in the board DTS via &label, the entries sh=
ould be
> >>>> +   ordered alpha-numerically.
> >>>
> >>> Just an idea. Would that make (more) sense to make &label-like entrie=
s
> >>> match order of nodes in included .dts(i)?
> >>>
> >>> Adventages:
> >>> 1. We keep unit address incremental order that is unlikely to change
> >>>
> >>> Disadventages:
> >>> 1. More difficult to verify
> >>
> >> Rob also proposed this and I believe above disadvantage here is crucia=
l.
> >> If you add new SoC with board DTS you are fine. But if you add only ne=
w
> >> board, the order of entries look random in the diff hunk. Reviewer mus=
t
> >> open SoC DTSI to be able to review the patch with board DTS.
> >>
> >> If review is tricky and we do not have tool to perform it automaticall=
y,
> >> I am sure submissions will have disordered board DTS.
> >>
> >>>
> >>>
> >>>> +Example::
> >>>> +
> >>>> +    // SoC DTSI
> >>>> +
> >>>> +    / {
> >>>> +            cpus {
> >>>> +                    // ...
> >>>> +            };
> >>>> +
> >>>> +            psci {
> >>>> +                    // ...
> >>>> +            };
> >>>> +
> >>>> +            soc@ {
> >>>> +                    dma: dma-controller@10000 {
> >>>> +                            // ...
> >>>> +                    };
> >>>> +
> >>>> +                    clk: clock-controller@80000 {
> >>>> +                            // ...
> >>>> +                    };
> >>>> +            };
> >>>> +    };
> >>>> +
> >>>> +    // Board DTS
> >>>> +
> >>>> +    &clk {
> >>>> +            // ...
> >>>> +    };
> >>>> +
> >>>> +    &dma {
> >>>> +            // ...
> >>>> +    };
> >>>> +
> >>>> +
> >>>> +Order of Properties in Device Node
> >>>> +----------------------------------
> >>>> +
> >>>> +Following order of properties in device nodes is preferred:
> >>>> +
> >>>> +1. compatible
> >>>> +2. reg
> >>>> +3. ranges
> >>>> +4. Standard/common properties (defined by common bindings, e.g. wit=
hout
> >>>> +   vendor-prefixes)
> >>>> +5. Vendor-specific properties
> >>>> +6. status (if applicable)
> >>>> +7. Child nodes, where each node is preceded with a blank line
> >>>> +
> >>>> +The "status" property is by default "okay", thus it can be omitted.
> >>>
> >>> I think it would really help to include position of #address-cells an=
d
> >>> #size-cells here. In some files I saw them above "compatible" that se=
ems
> >>> unintuitive. Some prefer putting them at end which I think makes sens=
e
> >>> as they affect children nodes.
> >>>
> >>> Whatever you choose it'd be just nice to have things consistent.
> >>
> >> This is a standard/common property, thus it goes to (4) above.
> >
> > It's probably a mix, but AFAIK a lot of the device trees in tree have
> > #*-cells after "status". In some cases they are added in the board
> > .dts files, not the chip/module .dtsi files.
>
> Existing DTS is not a good example :)
>
> >
> > +1 that it makes sense at the end as they affect child nodes.
>
> I still insist that status must be the last, because:
> 1. Many SoC nodes have address/size cells but do not have any children
> (I2C, SPI), so we put useless information at the end.
> 2. Status should be the final information to say whether the node is
> ready or is not. I read the node, check properties and then look at the e=
nd:
> a. Lack of status means it is ready.
> b. status=3Ddisabled means device still needs board resources/customizati=
on

+1 for status at the end (before children), so it's easy to find.
Also, reality can look like the example in the bindings, with an optional
status property appended.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

