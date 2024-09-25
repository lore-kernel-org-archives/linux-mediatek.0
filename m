Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEA9C369CF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmGZlGs+csivCGtXApnSxfbFdZdlXt+4aKJTW7tsJ8A=; b=fFKwk146vXkeddoGgfMzGGMK87
	KHtl5Q9SmkhJUEj8HcPY+czRKDwCXjkO4suJAK0Tczeo9DthORBkL4oHAcsmGX7jjQXBBQKeoNGTD
	tGRhMkeOLcbAAECiWZ0Cb2e5ABPjBv4KvKQAwPhA77RKorqWDFc2ekV4rBk6wAi27l7e70O8z5PkM
	1RTsTqSlj9J8Y7YyDbU6GDx3XJzN4CaGGywHLcKW4hu2WasCzAFEXEfwPV/oqW6iBV2It8m8jO2go
	BaQ1GDhF+YGuRUvWEJCQ4Ji7YN3/Zqy6oGWZZsf2TQcGDbe0vzAIkF9wx+uSw0F8YpBTMvQ+Wht1d
	cmN81c9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPv0-00000004qMB-1lFe;
	Wed, 25 Sep 2024 11:10:50 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPrQ-00000004pb8-0nBo
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 11:07:09 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-501269674daso1940148e0c.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727262423; x=1727867223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmGZlGs+csivCGtXApnSxfbFdZdlXt+4aKJTW7tsJ8A=;
        b=EApLc1ncfs/YCrvcRKbr1vHD8I58uiaKPlMzGO9l2yyErFfu4hSmY/TCPXV25zWrs8
         X1O8WSECN0NFqKhmbFiQW9Yhsv5b/m7Zmir3H1XYiGQjvCGotTIpmw0libm0R5rwLboM
         a0+Lf7XTkgl9+O7OpSjbMCwu3X7sdvsnOZQOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727262423; x=1727867223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmGZlGs+csivCGtXApnSxfbFdZdlXt+4aKJTW7tsJ8A=;
        b=gRzohwFPBLMWG3PxPR9CzaCLtYKO55ns+1CEmTwQCRPoAi2zP7Yz8mEnV2aCiur7Hp
         rKwW+kywQt8PA+9D/bZ7kzCO8tRj+IktFIrwUpcwWJfBzUjV4KP/fuWVRsD0qo5EtZeN
         WSAXG0cD0sCPyuWJXdiECffXpgCJZMZXi8Tkz2R7qunn82MBe6UOQfNiwcTgMEg6/uCB
         nY78qyTyT6+pDDmb0I5gJUY2kVbgdXKEaFWQb2+queUZgCda+mK21i6YVAYdJHBPK24x
         nDoS4SE6HI+M7Xi14Ba7jgCNkjhcrSbp10IgKXSQ5eY1aHlsKYlGxs9ZCeppJ0QFuiA+
         uP6w==
X-Forwarded-Encrypted: i=1; AJvYcCU5L3K5jndBeF6UK3pvSdGzT/HEC/qUlXu0Nm8LNB6H/NoDEgrl7RTSQX5GRiylCHyQWFU2m2yRA/sY7fJwrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuFE7gr6B3yrM/4qFpzu+EO+zIJ014W93jVniPIwe0f//DokIP
	kmR3oOw+EQFJ0+FN/PKNGm2WMDwcYXCNnDpkxdHSCqpZOUhFfeP3VwDGBlg7vjCeVUZGkylyIQA
	wSw==
X-Google-Smtp-Source: AGHT+IFP5zYhI2DLRYcjg0TsLBjbFzV5xaBZcGdhPX5fNZ8UEbGqQTJob8EB5+vTI6MAABB/+rBezQ==
X-Received: by 2002:a05:6122:32cc:b0:4f5:199b:2a61 with SMTP id 71dfb90a1353d-505c20922a8mr1814182e0c.9.1727262422904;
        Wed, 25 Sep 2024 04:07:02 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-505a9f40e1csm1916380e0c.14.2024.09.25.04.06.46
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 04:07:02 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-501269674daso1940075e0c.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 04:06:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoYLCFAs6qM0OFVZTEesZV2+bcctd6KJ56T4OSNKCeQdLvHfGSQYn4K1C3KiGazbDpwE9FQUpILAeUifLgrw==@lists.infradead.org
X-Received: by 2002:a05:6122:32cc:b0:4f5:199b:2a61 with SMTP id
 71dfb90a1353d-505c20922a8mr1813469e0c.9.1727262405347; Wed, 25 Sep 2024
 04:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240909111535.528624-1-fshao@chromium.org> <20240909111535.528624-7-fshao@chromium.org>
 <11bc2522-bc10-4dcf-8142-708b57d181cf@kernel.org> <CAC=S1nhiJ=7yAucJsaYKUUBrwrxOVBMB2CF=bFwyLa2o-5RmWw@mail.gmail.com>
 <64cc35c8-30df-4882-a933-f42119270f48@kernel.org> <CAC=S1ni+pJJZhbjvVqhba5u1JqGv=dZTv8+KH4xburea2AG4Qg@mail.gmail.com>
 <a9a7038c-4478-4366-831a-81dca8fa5afc@kernel.org>
In-Reply-To: <a9a7038c-4478-4366-831a-81dca8fa5afc@kernel.org>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 25 Sep 2024 19:06:08 +0800
X-Gmail-Original-Message-ID: <CAC=S1njoAwU+7aveWziJBD760k2LGD=D89Wwb9FmdaPp-sA5nw@mail.gmail.com>
Message-ID: <CAC=S1njoAwU+7aveWziJBD760k2LGD=D89Wwb9FmdaPp-sA5nw@mail.gmail.com>
Subject: Re: [PATCH 06/13] arm64: dts: mediatek: mt8188: Update VPPSYS node
 name and compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_040708_245431_A680016D 
X-CRM114-Status: GOOD (  24.08  )
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

On Mon, Sep 16, 2024 at 6:02=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/09/2024 13:06, Fei Shao wrote:
> > On Tue, Sep 10, 2024 at 3:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 10/09/2024 07:12, Fei Shao wrote:
> >>> On Mon, Sep 9, 2024 at 7:41=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>>>
> >>>> On 09/09/2024 13:14, Fei Shao wrote:
> >>>>> Use and add "syscon" in VPPSYS node names and compatible to fix err=
ors
> >>>>> from `make CHECK_DTBS=3Dy mediatek/mt8188-evb.dtb`.
> >>>>>
> >>>>> Signed-off-by: Fei Shao <fshao@chromium.org>
> >>>>> ---
> >>>>>
> >>>>>  arch/arm64/boot/dts/mediatek/mt8188.dtsi | 8 ++++----
> >>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8188.dtsi
> >>>>> index 2900d78b7ceb..14e51a11f688 100644
> >>>>> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> >>>>> @@ -1799,8 +1799,8 @@ mfgcfg: clock-controller@13fbf000 {
> >>>>>                       #clock-cells =3D <1>;
> >>>>>               };
> >>>>>
> >>>>> -             vppsys0: clock-controller@14000000 {
> >>>>> -                     compatible =3D "mediatek,mt8188-vppsys0";
> >>>>> +             vppsys0: syscon@14000000 {
> >>>>> +                     compatible =3D "mediatek,mt8188-vppsys0", "sy=
scon";
> >>>>
> >>>> If this was working before, it looks like this is not a syscon and
> >>>> bindings need to be fixed.
> >>>
> >>> I guess it's because the binding was later updated in commit
> >>> 26bcd8a53098 ("dt-bindings: arm: mediatek: mmsys: Add VPPSYS
> >>> compatible for MT8188"), and the corresponding DT update was unnotice=
d
> >>> at the time.
> >>> If that makes sense then this should be a valid fix.
> >>
> >> Not necessarily. Why not fixing bindings? Prove that bindings are
> >> correct, not DTS, first.
> >
> > MediaTek's mmsys doesn't merely control clocks, it also provides
> > display pipeline routing control and other misc control registers, so
> > it's appropriate to categorize it as a system controller over a clock
> > controller.
> > As for vdosys and vppsys, they are likely variants or aliases of mmsys
> > introduced in their newer SoCs.
>
> Nothing like that was in the commit msg...

Just for a record, I've revised the commit message in the newer series:
https://lore.kernel.org/all/20240925110044.3678055-7-fshao@chromium.org/

Thanks,
Fei

