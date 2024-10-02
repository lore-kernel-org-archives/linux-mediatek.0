Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C81CF3194
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 03:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwiLVnc0Ymap70LQ2v/RfJC1Ad9ePUxHXG7oryVkvlE=; b=XLOr5drETcy/vkcLbRL4Nnv+kJ
	PWyoL/VvsW/1tQE9wcpJd7Xt4vIz6QKmZ/J3ziy3/bsJZJj8KvLM7vFNABdhmiyiUBrvanwtcjbh8
	byMfBj27K8vD4yALsJ7nvA9lE+1Xw392ngd5GPm8eNGn3XdmKGJdIJsbapwLzNGkAYR/scKj9dGYG
	Gw4leB7KSKsiAxdkPVeXtL+QYkU9/ZpVbrl3IHPpvnkMGZxZE7ljgqHXulIphW0aqHC5PsBQU0OJh
	20I+TEhkrPysVoKj/WrE6zbLHKdB5hm8aClnykfgbHvkI5UaGrXmzZVYld8HkGUrsTi0pjjssZ8oH
	3nxo0xfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svqBM-00000004i6q-3qzn;
	Wed, 02 Oct 2024 03:37:44 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svq9y-00000004huh-2Zbg
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 03:36:20 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-50abc034f6aso891053e0c.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 20:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727840177; x=1728444977; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwiLVnc0Ymap70LQ2v/RfJC1Ad9ePUxHXG7oryVkvlE=;
        b=hUqedNr9btokTO5cKE9hQEDHLpcRCDLQ2btWNRL2MAJgy2WbD0TSF5w6hjv08ZRB4Y
         LLyXoSN/eyRMou8q25UJ8RzIIa1U5iRcAaPCmv1AFVpGB+jclj5HdeHwDJMHiU5kZd27
         P3B6i6tM7scVuQ/M/hECe97LPCDBpObO7eLIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727840177; x=1728444977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwiLVnc0Ymap70LQ2v/RfJC1Ad9ePUxHXG7oryVkvlE=;
        b=YUtdL/ty/bkvS14yLcHl5coqU4njKDTluSKxuih/iTY2zEuNmW/ydnFl+5/XIMIWdr
         XhH1niLc8e1L8Oj7JkVHIt3q/CO0EpCnOCGnD3eWCCaz8JaoUgeTVIq1rulrJ1dj8VFC
         49syv2WrudogLEy6Wv+sZ618bjGe7ifN1WLJLPB64klCpg/q/K7LstT8UkprHq+3jV2V
         qf8Lbu2Zoc3L42Mf9vakqLSuqodD1PmXJj68EdRT9lHZBruWM4pQ67OK6K0YoH+OrCfr
         kQdUNf+CzrYX3Zciul3PXPFeubd3LZQeqcLakhneP5ifuJLI/Q7gqGi7Z0uzjx9E6a+h
         7aIA==
X-Forwarded-Encrypted: i=1; AJvYcCVViXLac88k3Pd1Q1w+tqoLJ5mTKYCVtn/R5TAMkoJt7B1tXTd3re3omZMs1ayUDhoLOA2WoRmLwb9xrqipGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwwUXg9766pGagUtDfqzk8P8+OzfOqOgnCufL9Ck5mxL/T0LAx
	0Lr+FiRIADt53tJC2r1YU7w7aqdomU7AJMC/Uuib3h+Y9I2tpRhpV6JkXFuMGFvY4otv+Dj9lB/
	YaQ==
X-Google-Smtp-Source: AGHT+IHHAESP7BBThVDZrWOSvBJB6v26AekP7h58RxVCGQvkroUr/tnJThm4yd4MnxI0f6+4imDjKA==
X-Received: by 2002:a05:6122:3c49:b0:4ef:5744:46a with SMTP id 71dfb90a1353d-50c5810833fmr2133473e0c.1.1727840177085;
        Tue, 01 Oct 2024 20:36:17 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-50abe71e7basm623836e0c.22.2024.10.01.20.36.16
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 20:36:16 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-84ea1042bbeso1792718241.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 20:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhPzi5Ck3F3Vlqc0GFlQM4CdRH+cWt3owhwCFgtRxNc/RkrydHcaIENqoqOqkUXA4B4EE9iQZ8MpjbNCiunA==@lists.infradead.org
X-Received: by 2002:a05:6102:32cc:b0:49b:e3fd:b6d0 with SMTP id
 ada2fe7eead31-4a3e68264a4mr2070117137.5.1727840175839; Tue, 01 Oct 2024
 20:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240925110044.3678055-3-fshao@chromium.org> <20241001195325.GA222000@bhelgaas>
In-Reply-To: <20241001195325.GA222000@bhelgaas>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 2 Oct 2024 11:35:38 +0800
X-Gmail-Original-Message-ID: <CAC=S1niCc5usY4SJ7wqtKAfcUqyTBf3fhRmkk4Sdnr3x2zsuVA@mail.gmail.com>
Message-ID: <CAC=S1niCc5usY4SJ7wqtKAfcUqyTBf3fhRmkk4Sdnr3x2zsuVA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: PCI: mediatek-gen3: Allow exact number
 of clocks only
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_203618_699549_123EA737 
X-CRM114-Status: GOOD (  26.92  )
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

On Wed, Oct 2, 2024 at 3:53=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Wed, Sep 25, 2024 at 06:57:46PM +0800, Fei Shao wrote:
> > In MediaTek PCIe gen3 bindings, "clocks" accepts a range of 1-6 clocks
> > across all SoCs. But in practice, each SoC requires a particular number
> > of clocks as defined in "clock-names", and the length of "clocks" and
> > "clock-names" can be inconsistent with current bindings.
> >
> > For example:
> > - MT8188, MT8192 and MT8195 all require 6 clocks, while the bindings
> >   accept 4-6 clocks.
> > - MT7986 requires 4 clocks, while the bindings accept 4-6 clocks.
> >
> > Update minItems and maxItems properties for individual SoCs as needed t=
o
> > only accept the correct number of clocks.
> >
> > Fixes: c6abd0eadec6 ("dt-bindings: PCI: mediatek-gen3: Add support for =
Airoha EN7581")
> > Signed-off-by: Fei Shao <fshao@chromium.org>
>
> It looks like most changes to this file have been merged via the PCI
> tree.  I don't see dependencies on this in the rest of the series, so
> I'm happy to take this via PCI if it makes sense.  Or if you prefer
> that this be merged with the rest of the series, that's fine and you
> can add my:
>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>
> Let me know if I should pick this one up.
>

Yes please, thank you!

Regards,
Fei



> > ---
> >
> >  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml          | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.y=
aml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > index 898c1be2d6a4..f05aab2b1add 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -149,7 +149,7 @@ allOf:
> >      then:
> >        properties:
> >          clocks:
> > -          minItems: 4
> > +          minItems: 6
> >
> >          clock-names:
> >            items:
> > @@ -178,7 +178,7 @@ allOf:
> >      then:
> >        properties:
> >          clocks:
> > -          minItems: 4
> > +          minItems: 6
> >
> >          clock-names:
> >            items:
> > @@ -207,6 +207,7 @@ allOf:
> >        properties:
> >          clocks:
> >            minItems: 4
> > +          maxItems: 4
> >
> >          clock-names:
> >            items:
> > --
> > 2.46.0.792.g87dc391469-goog
> >

