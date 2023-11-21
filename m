Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A52C61D85
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 16:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHWSZ/KZJKkzc0j50L+hOmQiyYp8HOj7xmv0toivCHY=; b=wa1HC6/WMj2r2bLktLLPvyeyHX
	2nJdMtUYplvwjErVtpDfFJKUXCrtk4RqHf8//AEFGtg3ObVxkTn7zHgqIIPShyMA2zyFcNRMsxG2u
	UrbQsqEnaOlw8kNXZ1nWzmHbm7aZthcWpfNblWUSRGPFYL7LHV4Zpmraw+97jIptDjIObarYixWsy
	3zOf5RZX9JFy06aXE2huwy2wbbcr2Swl3X4o3QQGrPXzkz7FJCbQRJuMWhF+vcDBEV8fDsUm+3oBL
	jWLtz+Ic+smr42KXFyh/9Fe0Z9Xzi+v9GPBv1ATffgy+kkJ1CD6JnYKArt91luqGTGvzvS8gIN04r
	MtpL+XOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TEu-00HEfD-23;
	Tue, 21 Nov 2023 16:04:40 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TEq-00HEeM-0o;
	Tue, 21 Nov 2023 16:04:38 +0000
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-587b1231dbeso3222251eaf.3;
        Tue, 21 Nov 2023 08:04:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582672; x=1701187472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHWSZ/KZJKkzc0j50L+hOmQiyYp8HOj7xmv0toivCHY=;
        b=WTE6kbBd9QHq72kF1fXBDfcfxZqz0C7lVFOCGSMviUd0n1bPwr9I4nLfDT0B92kr11
         YgI530+PEXLBBwDV33yxrDYVl8V8NJpru/NR8OO1QqnXtmBvXVYwBNWn3rQwIdietoUU
         Z/h4XCs3KQXp7Jd3gjH4B9U7MDPp1CTXKnX8gV3g2WwwHrcNNAJ61raYbGkbeWN3Ebiq
         TvR+I02QeSbOWboJzEhkePyjFyxqhSjq9xZW6ksqIZ6UykTbn0lcjVdX4+g2dOXSk5dD
         85rObvCMEYmOZK4Xa+s1S7hi5ebE05ZrmaJ2S+qcXO55oh8kuz6kqooEqCWSm509Huna
         Jy5g==
X-Gm-Message-State: AOJu0YzBuGH2iLKe9vV4uUR5QXhRhNW4Rq43YilPb1RQCWhPZy+LP46d
	nM1vC/3p3NG32O0g/HbmgbTTPmCXNIhBirke
X-Google-Smtp-Source: AGHT+IF8DvVML4ww18gqgnlm2/fDoBd8MP62HzkkBXaekUGsRV+kQaRiaCz/nw3HanGkmILiO3Clxg==
X-Received: by 2002:a05:6820:823:b0:582:1477:8362 with SMTP id bg35-20020a056820082300b0058214778362mr11580104oob.4.1700582672342;
        Tue, 21 Nov 2023 08:04:32 -0800 (PST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id f138-20020a4a5890000000b00584017f57a9sm1901099oob.30.2023.11.21.08.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 08:04:26 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3b6d80daae8so3755750b6e.2;
        Tue, 21 Nov 2023 08:04:25 -0800 (PST)
X-Received: by 2002:a05:6808:1201:b0:3b2:ee79:c0fd with SMTP id
 a1-20020a056808120100b003b2ee79c0fdmr14276293oil.1.1700582665655; Tue, 21 Nov
 2023 08:04:25 -0800 (PST)
MIME-Version: 1.0
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <19358871-009d-4498-9c13-90d5338b1e9f@amd.com> <76fa8f61-fe31-4040-a38d-cc05be3f4f17@linaro.org>
 <6c80a285-27fc-4d61-9eef-af4744a9decc@amd.com> <cc57dcf1-3c32-426e-920c-6f0741027797@linaro.org>
In-Reply-To: <cc57dcf1-3c32-426e-920c-6f0741027797@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Nov 2023 17:04:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGyXizPw9Rggj8fQeNdbx3udRcsHFhz_sqYZzjN1CnZQ@mail.gmail.com>
Message-ID: <CAMuHMdVGyXizPw9Rggj8fQeNdbx3udRcsHFhz_sqYZzjN1CnZQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231121_080436_287590_8E568C7A 
X-CRM114-Status: GOOD (  25.20  )
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

On Tue, Nov 21, 2023 at 1:36=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 21/11/2023 12:55, Michal Simek wrote:
> >>> device-tree specification v0.4. Chapter 2.2.1/Table 2.1 is describing=
 much more
> >>> valid characters for node names.
> >>> It means above description is not accurate or DT spec should be updat=
ed.
> >>
> >> Spec allows way to much. dtc doesn't.
> >> One thing is the spec, second
> >> thing is coding style.
> >
> >  From my point of view spec is primary source of truth. If spec is sayi=
ng name
> > can use upper case then I can use it. If upper case is not
> > recommended/deprecated because of whatever reason spec should be update=
d to
> > reflect it.
> > I know that DTC is reporting other issues but isn't it the right way to=
 reflect
> > it back to the spec?
>
> Then why aren't you putting Linux Coding Style into C spec? I do not see
> any relation between specification of the language and the coding style
> chosen for given project.
>
> Zephyr can go with upper-case. Why it should be disallowed by the spec?

I thought there was only One DT to bind them all?
IMHO it would be better to align DT usage of Zephyr and Linux (and
anything else).


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

