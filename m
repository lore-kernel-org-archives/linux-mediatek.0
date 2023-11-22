Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFF2C61D92
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKNq1+43WKmgnPE7SgZwNlFfmw6va9njWwTwjft8dSg=; b=k1seffqtqGSNRL9a9No1SQKa/M
	q5gFEd4PdyfF9Og9NkbfaQqPokG6l5ijWTz4QmXH4N+TE7KP9nUfKEmcJQz3z8Zq7nWU+Em/zaRdW
	o+0CVewCN0soUYpBqK9jTytQD05wVTkOgr6kdErPkxTmBWVD7bkUUxmR4TLe8Oclg7teK/1ytdxaO
	L5QgDf3XEdknIz5plSr1GKEGAY3ZktIfj2hwr3Uc5d23S5HVfYQwOLkM6fFd+VxhIPskMo/KHazjm
	omw/g9oba5Pul1Rc0+ZZMJid/7T8Uytzs8BY+5DsqREto+gmnxGF1kccbF1hIkXnnenZVmzCmFnmT
	Z9i5wjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5izM-00178N-1I;
	Wed, 22 Nov 2023 08:53:40 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5izI-001777-2O;
	Wed, 22 Nov 2023 08:53:38 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5cc589c0b90so5132707b3.2;
        Wed, 22 Nov 2023 00:53:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700643213; x=1701248013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKNq1+43WKmgnPE7SgZwNlFfmw6va9njWwTwjft8dSg=;
        b=Fr4cNg/5jM6EWKOXtzdEJWojpyDUlJKj8MsjYKp/T5qemUVR7rfpkOErVmDbQ0nWUs
         JLGngdLPy5GHGhBiU0yA7qPa5RgF+a8GUwTNOi5gcoq3v0aZLjiw5hPIg40xFDwJ1TN9
         iQBekFedapoCeh+OmeiMAss5A5NOS+8yGyFFSyCq3HY92G1N4Bh+JJ6It4EL0B3mp/Iv
         sRrnRHiPNp+/9g1MsuNLYJ+4uzeIvTmb6F4icxIIOytAjNaE2oeQJr5T6NvVsCOC7LQe
         m4P70D+hWpNkto6IJfvFWlZdzvSdn6fhcYGPGLfmeLoywGf2wKY+AyhgSN8fPXNa3pAu
         jd6g==
X-Gm-Message-State: AOJu0YxKuQzUehirGRsawzpJS2h4KBmMqDr8fQhqeQFRGetXR5EiWoBG
	xLCX2gHPwlk/MIL2BbmkEFpHKGtG+6ZqZw==
X-Google-Smtp-Source: AGHT+IG7DBXL8FSlzYPZwjDdLbyRmnkkIxPN6a+o+GVPmosZFCSSZ4nveHPxT2w4Rsb94hswZ00BWg==
X-Received: by 2002:a0d:d343:0:b0:5c8:d5d5:3e51 with SMTP id v64-20020a0dd343000000b005c8d5d53e51mr1197428ywd.44.1700643213501;
        Wed, 22 Nov 2023 00:53:33 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id j127-20020a819285000000b005cc9cc5c722sm118828ywg.25.2023.11.22.00.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 00:53:32 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-da077db5145so5984770276.0;
        Wed, 22 Nov 2023 00:53:32 -0800 (PST)
X-Received: by 2002:a25:218a:0:b0:da0:48df:cafa with SMTP id
 h132-20020a25218a000000b00da048dfcafamr1276867ybh.16.1700643211907; Wed, 22
 Nov 2023 00:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com> <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
 <CAGb2v64Vf5dDwq=KTrxwc=+w+0KUD2KVPMjmHg68Y_yukES5dQ@mail.gmail.com>
 <7232a48b-b9ad-44b5-ae6a-d12dad70b3c4@linaro.org> <58a9caacc1226c7c3a2bdfe73ef1791f@manjaro.org>
 <cc4c789c-b595-41eb-b543-9e03549c6e61@amd.com>
In-Reply-To: <cc4c789c-b595-41eb-b543-9e03549c6e61@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 09:53:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWm-gRPHeHyuX3_eR+9chJEw3iiZwCNBnoiRPHzoMAs6w@mail.gmail.com>
Message-ID: <CAMuHMdWm-gRPHeHyuX3_eR+9chJEw3iiZwCNBnoiRPHzoMAs6w@mail.gmail.com>
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
To: Michal Simek <michal.simek@amd.com>
Cc: Dragan Simic <dsimic@manjaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, wens@kernel.org, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_005336_783528_C4205262 
X-CRM114-Status: GOOD (  32.29  )
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

Hi Michal,

On Wed, Nov 22, 2023 at 9:50=E2=80=AFAM Michal Simek <michal.simek@amd.com>=
 wrote:
> On 11/22/23 09:29, Dragan Simic wrote:
> > On 2023-11-22 09:21, Krzysztof Kozlowski wrote:
> >> On 22/11/2023 09:09, Chen-Yu Tsai wrote:
> >>> On Wed, Nov 22, 2023 at 4:05=E2=80=AFPM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 21/11/2023 14:50, Rafa=C5=82 Mi=C5=82ecki wrote:
> >>>>>> +Order of Properties in Device Node
> >>>>>> +----------------------------------
> >>>>>> +
> >>>>>> +Following order of properties in device nodes is preferred:
> >>>>>> +
> >>>>>> +1. compatible
> >>>>>> +2. reg
> >>>>>> +3. ranges
> >>>>>> +4. Standard/common properties (defined by common bindings, e.g. w=
ithout
> >>>>>> +   vendor-prefixes)
> >>>>>> +5. Vendor-specific properties
> >>>>>> +6. status (if applicable)
> >>>>>> +7. Child nodes, where each node is preceded with a blank line
> >>>>>> +
> >>>>>> +The "status" property is by default "okay", thus it can be omitte=
d.
> >>>>>
> >>>>> I think it would really help to include position of #address-cells =
and
> >>>>> #size-cells here. In some files I saw them above "compatible" that =
seems
> >>>>> unintuitive. Some prefer putting them at end which I think makes se=
nse
> >>>>> as they affect children nodes.
> >>>>>
> >>>>> Whatever you choose it'd be just nice to have things consistent.
> >>>>
> >>>> This is a standard/common property, thus it goes to (4) above.
> >>>
> >>> It's probably a mix, but AFAIK a lot of the device trees in tree have
> >>> #*-cells after "status". In some cases they are added in the board
> >>> .dts files, not the chip/module .dtsi files.
> >>
> >> Existing DTS is not a good example :)
> >>
> >>>
> >>> +1 that it makes sense at the end as they affect child nodes.
> >>
> >> I still insist that status must be the last, because:
> >> 1. Many SoC nodes have address/size cells but do not have any children
> >> (I2C, SPI), so we put useless information at the end.
> >> 2. Status should be the final information to say whether the node is
> >> ready or is not. I read the node, check properties and then look at th=
e end:
> >> a. Lack of status means it is ready.
> >> b. status=3Ddisabled means device still needs board resources/customiz=
ation
> >
> > I agree with the "status" belonging to the very end, because it's both =
logical
> > and much more readable.  Also, "status" is expected to be modified in t=
he
> > dependent DT files, which makes it kind of volatile and even more deser=
ving to
> > be placed last.
>
> I am just curious if having status property at the end won't affect
> execution/boot up time. Not sure how it is done in Linux but in U-Boot at=
 least
> (we want to have DTs in sync between Linux and U-Boot) of_find_property i=
s
> pretty much big loop over all properties. And status property defined at =
the end
> means going over all of them to find it out to if device is present.
> Not sure if Linux works in the same way but at least of_get_property is d=
one in
> the same way.

As the default is "okay", you have to loop over all properties anyway.

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

