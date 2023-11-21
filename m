Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E10AC5ACB3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 08:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeOErr72GGCTbFniaP00vmRzQcGaVer6knTx1tHa9Zo=; b=IoZL6v01FjUEAJdJSFakI1m2Mc
	hFyQe2YBTCaKsuYIf7pr75xFbnmr+lnTz2IqdVoZo88aiJ/wBCnxKwF3lA+fgVGQdR2RcZjnq0gVv
	19txe8LWUFhmW2neKG3tPd14RKVOWr274Lk0IDjeOHnQucvNrPt9NI9h1qSZh2CAR0vMHTbRouioC
	Tbn5sZR2j29fuMzY7G7AqTyOhi6S4iPg0kJ/WvGINFIHuxnW6A/wJxAWjOeXP/k2uBCMNzMmHTBgx
	H2A/zSeL5uaMdjEd+VY5TM034VgQ+072y9UDH2FK7ePDJPNOOuIa+Zxz6Xo/Bs9czyPU5315PdXKj
	e9re3ZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LoX-00FxwS-1e;
	Tue, 21 Nov 2023 08:08:57 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LoU-00Fxve-0f;
	Tue, 21 Nov 2023 08:08:55 +0000
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50970c2115eso7578923e87.1;
        Tue, 21 Nov 2023 00:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700554126; x=1701158926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeOErr72GGCTbFniaP00vmRzQcGaVer6knTx1tHa9Zo=;
        b=psl3KwH5QXmYDdfNgyvOAW8+Es70L/L1xZUm2xgakqEJ2FDT0WohJCxHskMj5gpXWi
         k0V1LGF0p8cwW5lXBeqDhNQAP9G0CcuPbQg5wgoD4xwIqWr+UyRpO1jmQa6iEm2ew10G
         /A4Nps9HtNlKZ5rh0idi73rosKRlLtLKZCa1HQgDeAMVH/V0Tow9iAqH4avGo43DgaBi
         GbSqcsMIqF0Y/tRS9E7j0yTA9c5lOJwGDQ67AIhzlIFFOgtHVLDAGfKUPX5XVWiFu7TK
         kvvn5sSdyQw/PSQWCOUEL7mj7S8pQmRDt9HAJNpGy0JbVvLy4cPGCwLZ0WxVFY1eS//D
         i9cQ==
X-Gm-Message-State: AOJu0YwJHM4pDNwFPteHZQ8pmciYayR/l/X3dvbYwYLfk8pe2/UdbCRc
	Qws2I87V0HZzSeYARDnRiNNZOcHbrosUyV+G
X-Google-Smtp-Source: AGHT+IFjEyNcrp1kGrAz5o65S260jTebtBwfYG1Xn7WCR9ayPio95AbYvBuXNESX/qVgy/9v4+h/gg==
X-Received: by 2002:a05:6512:2394:b0:507:9fe7:f321 with SMTP id c20-20020a056512239400b005079fe7f321mr8917732lfv.54.1700554125889;
        Tue, 21 Nov 2023 00:08:45 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id bp31-20020a056512159f00b0050aa76b984esm1017199lfb.264.2023.11.21.00.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 00:08:45 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50970c2115eso7578844e87.1;
        Tue, 21 Nov 2023 00:08:45 -0800 (PST)
X-Received: by 2002:ac2:599b:0:b0:507:a5e7:724 with SMTP id
 w27-20020ac2599b000000b00507a5e70724mr6535084lfn.38.1700554124979; Tue, 21
 Nov 2023 00:08:44 -0800 (PST)
MIME-Version: 1.0
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <19358871-009d-4498-9c13-90d5338b1e9f@amd.com> <76fa8f61-fe31-4040-a38d-cc05be3f4f17@linaro.org>
 <CAMuHMdW4WPJT0Km7w8RWrGJaztk6QDGoFAn0bdGbrEsw81R1FA@mail.gmail.com>
 <acfdce81-f117-4a1a-a9fe-e2b4b8922adb@linaro.org> <bd49f17c-7ebf-4e19-b77b-b5ec95375f7d@amd.com>
 <b48293f3-16e3-4980-b900-add0cb7d69f6@linaro.org>
In-Reply-To: <b48293f3-16e3-4980-b900-add0cb7d69f6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Nov 2023 09:08:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_gqmf2=cXmZmYgE3aLxvPBr1DVp0cz0C+YrfBVG-8mg@mail.gmail.com>
Message-ID: <CAMuHMdV_gqmf2=cXmZmYgE3aLxvPBr1DVp0cz0C+YrfBVG-8mg@mail.gmail.com>
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_000854_258187_D0D73336 
X-CRM114-Status: GOOD (  26.91  )
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

Hi Krzysztof,

On Tue, Nov 21, 2023 at 8:47=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 21/11/2023 08:33, Michal Simek wrote:
> > On 11/20/23 20:31, Krzysztof Kozlowski wrote:
> >> On 20/11/2023 20:18, Geert Uytterhoeven wrote:
> >>> On Mon, Nov 20, 2023 at 3:53=E2=80=AFPM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>> On 20/11/2023 15:01, Michal Simek wrote:> >
> >>>>> On 11/20/23 09:40, Krzysztof Kozlowski wrote:
> >>>>>> Document preferred coding style for Devicetree sources (DTS and DT=
SI),
> >>>>>> to bring consistency among all (sub)architectures and ease in revi=
ews.
> >>>
> >>>>>> +Organizing DTSI and DTS
> >>>>>> +-----------------------
> >>>>>> +
> >>>>>> +The DTSI and DTS files should be organized in a way representing =
the common
> >>>>>> +(and re-usable) parts of the hardware.  Typically this means orga=
nizing DTSI
> >>>>>> +and DTS files into several files:
> >>>>>> +
> >>>>>> +1. DTSI with contents of the entire SoC (without nodes for hardwa=
re not present
> >>>>>> +   on the SoC).
> >>>>>> +2. If applicable: DTSI with common or re-usable parts of the hard=
ware (e.g.
> >>>>>> +   entire System-on-Module).
> >>>>>
> >>>>> DTS/DTSI - SOMs can actually run as they are that's why it is fair =
to say that
> >>>>> there doesn't need to be DTS representing the board.
> >>>>
> >>>> I have never seen a SoM which can run without elaborate hardware-hac=
king
> >>>> (e.g. connecting multiple wires to the SoM pins). The definition of =
the
> >>>> SoM is that it is a module. Module can be re-used, just like SoC.
> >>>
> >>> /me looks at his board farm...

> >>> I guess there are (many) other examples...
> >>
> >> OK, I never had such in my hands. Anyway, the SoM which can run
> >> standalone  has a meaning of a board, so how exactly you want to
> >> rephrase the paragraph?
> >
> > What about?
> >
> > 2. If applicable: DTSI with common or re-usable parts of the hardware (=
e.g.
> > entire System-on-Module). DTS if runs standalone.
>
> OK, but then it's duplicating the option 3. It also suggests that SoM
> should be a DTS, which is not what we want for such case. Such SoMs must
> have DTSI+DTS.

So you want us to have a one-line <SoM>.dts, which just includes <SoM>.dtsi=
?
IMHO that adds more files for no much gain.
Users of a SoM can easily include <SoM>.dts.
'git grep "#include .*dts\>"' tells you we have plenty of users of that sch=
eme.

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

