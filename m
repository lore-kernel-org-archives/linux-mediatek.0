Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1591CD4851
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 08:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mfi3vmziZCkgZK4Pj66Mr9HPjc3VrKkwC6hLHO+X+Ns=; b=Oc4OENZykKRW5/82/w/Talz8uC
	CdqitMRariXD5AZ1m1BMY7jt8p8UPDTxTOFAmGUuaN9o9geH62R9Hof+kFqUWk6RjS//ThqXJirSs
	A5fqPKpVOGOZVFssrDBf19dEwoIQrFaUJ6cY4LMIbT97kCcv7S6zLmYZdcRnyICE/K/5k9brC/obh
	q0hG8t88LElwqHIidvQPd8z++ioiPbJki6+/NZJn7S81gT4+JbJ3ZmyZsi3iuc+XOWHxMDN60FlDg
	mrjq6snoLEO/VmnEm6Vr58aykDIfVHrhkqy2c2bQmfzceAIRVa9bm41WTEM9hIDuJi8oZYe80iI7j
	Fs9AiErg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNRBX-00000004udN-25Xf;
	Thu, 14 May 2026 08:12:47 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNRBR-00000004uc8-45yy
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 08:12:43 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so6742907e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2026 01:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778746360; cv=none;
        d=google.com; s=arc-20240605;
        b=H3mhwI1BBJgrBR11RDKUAcjRlKxiI1owS6a9l7+Y6sf6HyoiekwIQw/sNnmbOdxr9U
         bMvr5DcDiliOd8mT+MPwNqmxSIvNt1zSAuoXI+OlhFEOwGAE88OCe/4AhQdju3z6tCeo
         IXxcoo+KILymUiaisOVJwTgI3HXrH/ZINcnArfTLtNiNkeMyxayO9dj5DNoBeOTivvGe
         iRX1qBZesspR+UjPQ3ZnrMidvtqvl1ETpIL/x2fmYYQyuIQu9n9kV4LIqHaQpp0Hn+Ce
         FeZp9KfRG7MCXX7UJ9d80nbU9a6GnOrTLQXdTZZSEwJ37ymHbyHlWfyogLOtvniErIdI
         0Mng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mfi3vmziZCkgZK4Pj66Mr9HPjc3VrKkwC6hLHO+X+Ns=;
        fh=6eM6FjRo0aX4m8u5GWLCySzGE2byeeEvpI1qE+9Q2gE=;
        b=SBQ4xpOqh4Fwxwz/iXfMI4NTIumnYsHOwMIwOl181wjL5kO243ZPBf7zKYHyh4dZ8f
         LE75bYu9vccBDRjM22+rCNf7GXvNyZhNVoLYV5C3YIhou31amIfcO+cYi338qVA2txqc
         q5Hn66Wt75amokhtmAfu6hlai/RsKq6ufXPkb1p8eamxcPWOrAtIsD/ohhr2vhtbw6Oj
         C7oeLuiVz081bPo4JNiAnDgAZsMXzqx/StVYtQqaIa66KcSA79YWZejqd6G6REHEAwmF
         DnDDPAT/7X8po5Qm3hdH4mVdI2WkA2JOwr/4I3crt2EcLmwjnInx9GmejAh6bIPzXmMV
         HDvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778746360; x=1779351160; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mfi3vmziZCkgZK4Pj66Mr9HPjc3VrKkwC6hLHO+X+Ns=;
        b=Cx97w4wBccycMktS9sy0dvYrPQGimpUCab39QpVXqf5kUzhtCBpnR32LK5Je3ZCmdU
         i8nDutj6dc4Jg5NgAzy741h5Xpcl8HE8IhvdHVGfxvusTWTgP57ZHTIyOVPaZ15Qm1vy
         psuCqMUGCngypNAq/eMyMODL7DkmbUn6jLoR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778746360; x=1779351160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mfi3vmziZCkgZK4Pj66Mr9HPjc3VrKkwC6hLHO+X+Ns=;
        b=D/1oO403lviJ7TcT9namMmos9N3yegJ2Km3Jcq7ONo0g2tkqRXLHWWBTEyPzrqR/QZ
         TLdVg87X5NFx0SYOadQwbhqhYWKY1rFFxDUfg4BkZNmr4goZozsEg58lzferCWq92M9f
         UFBUyu7WoyqNlrT9lDp22I/vEbLXKv4ortwhQ7gPXofoT5jcIrCWovtuvdBdxXk84QbA
         H8YZ8T9WD2SSKm70b/iG62zWWqqgqpHQ26jwkCNhrv4P87uMmaJQeji65EExEjNDUPRR
         RMNVgbiA1zqvFcyvmbYidEccPZfw3yN9Twp/7aJTy+x/4r3gXGMGTpDByWzqg4reLeDI
         m39A==
X-Forwarded-Encrypted: i=1; AFNElJ9oeDqb3buz35/5o087ZDKz1uVQuH/Bh0tB5Qni7bS1tFQj7K9aiqiF3rVZ9x1zhDAaJkDBq9JwfTjZJaoudQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywis2+0dLqmPzBM2Q6gGEJaudVQn8AzOCROkuaocykEo7UO6L2b
	Lz+6dIe8qSRoYw7+rLRXGn7sivH2v8zCr3UyoIqzvToLonQFybxuVAj8+rac7qjBs44WGecrPtW
	nNR1almJcWf4S8J/TeaglK4snAj5wQlYUR+k1+zG6
X-Gm-Gg: Acq92OHF9IgrpoKVjrvwyPdiaeq8ophMs1N69L8uDNmFfFrelDrUlNrSbAHOP2Dg+MI
	6eF7i7SpZce9di7+t6bIW9Hrt2MptH29V+j6EiCVF+pCAoYThATWEaXYnWIymIC1CBB5nydwJ7m
	FedT5GxR9gHw5/hKXhR0Df9ssGc3ohOob1/g+D+Rs63pfZXSHm24hDL0v37ANZYQ2Hby+LI2bc9
	DhbxsF7/zqyXhPXFtm59ss87Ah9WqH5DBYNhiBxjaNAGFixPXw5OOwHRP0rRaI00CaaKbKfE1TN
	wcerrZZgltWGITyRdT+xfLRh0Vj+3VqrXAclaX6JKhTO+Qs+
X-Received: by 2002:a05:6512:2309:b0:5a7:42e2:db4 with SMTP id
 2adb3069b0e04-5a8f37c58abmr1953278e87.15.1778746359826; Thu, 14 May 2026
 01:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <20260513231550.GA2280946-robh@kernel.org>
In-Reply-To: <20260513231550.GA2280946-robh@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 May 2026 16:12:28 +0800
X-Gm-Features: AVHnY4KRPKUvW-Q_3NPzMqxJlma4P7nPyfNutA30R4nWp-TJgNSuE21IDg-csC8
Message-ID: <CAGXv+5EXw4rXD7URhXvotxsPG81EGhhk6wqnFuVWig=dTdNCXA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
To: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_011242_073833_B539956B 
X-CRM114-Status: GOOD (  23.00  )
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

On Thu, May 14, 2026 at 7:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> > controller memory access could be limited to a small region by the
> > firmware configuring a memory protection unit. This memory region
> > must be assigned to the PCIe controller so that the OS knows to
> > use that region. Otherwise PCIe devices would not work properly.
> >
>
> What you are describing is dma-ranges. Why not use that?

Answer from yesterday:

I didn't know about it. I was just moving the property from the WiFi
controller node down to the PCIe controller in the other DT patch [1].

Answer from today:

Also, it doesn't work. See my reply to Mani.


ChenYu

> > Allow the memory-region property with one item pointing to a
> > restricted DMA buffer.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > This patch compliments another patch that moved the memory-region from
> > the PCIe device to the PCIe controller [1].
> >
> > [1] https://lore.kernel.org/all/20260430120725.241779-1-wenst@chromium.=
org/
> >
> >  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.y=
aml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > index 4db700fc36ba..4a9e41d01628 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -115,6 +115,10 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >
> > +  memory-region:
> > +    maxItems: 1
> > +    description: phandle to restricted DMA buffer
> > +
> >    mediatek,pbus-csr:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >      items:
> > --
> > 2.54.0.563.g4f69b47b94-goog
> >

