Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83369CD37B7
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 05:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akkiEFtz33SlVQRBU3vV8aupDFCE2BQOw1/swe6zPGA=; b=PryV5BMvWV6VLVEwTOD9oMw+yO
	1xDoxw0sRDoMrpjyJpwTtjzfgndQhZjKmtkhs7L0EbHUiq6/9qr9yvilxIfTHo5BqQ8DeEcNPiJEH
	zhSy+dR37tuuTqJohRTLY+lNZJe2VSBQNRlqotWUVlm31UbIYuojS12wrt1w9KUAWw563n+Eujqwd
	ewQisKuZiNhnveumfA3h6aLEUOIjwgWNw8ixVWE0LbSBjoWbKRR4VoZcz+FISXPhUzvoJ8e6O2Hfi
	U64MxHRHmGMx/knNcY/kORSQOU6ynlgxQpM/2uujPU/+R7F7YnuN9XxpA/0zQq4IPBD58Y9vor8VV
	kjr8XwBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIzt-0000000CMes-0xHv;
	Mon, 11 May 2026 05:16:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIzs-0000000CMeS-1Fj4
	for linux-mediatek@bombadil.infradead.org;
	Mon, 11 May 2026 05:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=akkiEFtz33SlVQRBU3vV8aupDFCE2BQOw1/swe6zPGA=; b=oyG/hrmEnfp7WKx8wIlbTKp7Ik
	eBrqetlaMvCOLKNyUJu1c6So2yQBd2plYBWqbD7UcGwPhX0LczKP/XZI2/0bEtqqTJFMFkWMKSF/i
	XY0e3TIQ/IIWLdHSIfDPH56UPUoi1Ek5ErD7p0dIpvyeAyxl4edkk5zaAcPDXswcmGOU5temkbCgi
	XqQD5IwD06LLeBHsdhzy0vHL61f4L8blcAHYmsCv+jOQgdP3EvnzCDXhwXu69KQZdhCc5yXQQAuXq
	q5zMwHqKsI+AJbDSzorxpEjN0/7NcxWV7zBsoGdpOm7FGfP6ST4ydVKs7WQr5UiPXywWl+MPmnciJ
	4IUPQa8A==;
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIzk-0000000Aewq-40iS
	for linux-mediatek@lists.infradead.org;
	Mon, 11 May 2026 05:16:03 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-38e800deae4so29421891fa.0
        for <linux-mediatek@lists.infradead.org>; Sun, 10 May 2026 22:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778476552; cv=none;
        d=google.com; s=arc-20240605;
        b=lyIlpV91MkIHx+OO4v7mqR7l/1hQFvP8lTkfZdQXp8HoJlZDdJvyjg5paGwk3iPAz4
         giunkT78FdTP1j8zhQLp8M5bWauY9eDud6GbfGQzxhJr879ANQ/MQLhv3w7UuQCHvlyc
         tLfoJn5tWDAZ7cVDcEod+AII5i7SmImv4wWHgM7/sWGrYynABjJqBC2lVPd4OwbewggH
         904Y0SHvzF2q+OBew7x3jg3KKJR70PihthqpbygWL4BJljcnq2vI5ix7JSb/O9QHukMR
         7+kOK7MNjNu/lgqmcJIskJCQRApgOSSTTSzOx7YOtWwCBt5ccsChhnvS3kaCHY0nGzLs
         uOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=akkiEFtz33SlVQRBU3vV8aupDFCE2BQOw1/swe6zPGA=;
        fh=51Tx6xHiwg+ptUsyAt3ngV3i1PXL2StQHS8QzzL3yIE=;
        b=eWvuPGxferOMkPHb3qOREGIjG+SNouspk1utqQpOYMqq8pGYWGwvqNklk3pnRFeJ10
         wp7RL36kG331k2hidX8AVnJ3OS3OUUGp5WZlu8QfvdVOUqWNGsi3y7XLFB3tKL6rp1lV
         5GsPm5Jy/qJrfp1FXzq8fgQMih5j+URk54xxSDIZNtoeepo/PMyDDwor2sC+WqXCXbpK
         wRjZ7yGO6W+7y2Jomj7ulzrWQqKCIrrQC8QSX46jzYL/DACH4k/fBdIC9+rHk7HEwRv3
         0Hb5cHFNkZkFYARXER93Ihq7K37N0xW7VLABi1SPdLPmhbGpbG9v/o0f5r3ScFPjU20z
         ONVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778476552; x=1779081352; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akkiEFtz33SlVQRBU3vV8aupDFCE2BQOw1/swe6zPGA=;
        b=KLJgTVkx91/j9Jw7a34LLRUPt3eN1Wf6npyq/xmHz0qmnJou8FnpvLTvZAG8uHitWI
         tQXAuJKwXrh0JnQ/rvDMQwV4BPIDkjrfu3aqgIGJiiWHvM5YHMwUs4xWme0we/2VQFGw
         18xKccUncQCHn/w267QWkBlIWr9Ic/b5eW9Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778476552; x=1779081352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akkiEFtz33SlVQRBU3vV8aupDFCE2BQOw1/swe6zPGA=;
        b=JYkzzBRkHuVuXK74t44RDrgWqYJre+srOuqsKWSD/PqBevAFGdImZb8x6Lti0s6Nck
         XUtvzO9/wKpdO5v7gdu6mxDJKcoNWjREBVV0+4NsUeHuBdgJ4ahpL6McCzYVeLWmQgAE
         MYrFpN6RZrpTzXvea2DZYNJcN0L6HKOJ7fOpOEjgw3V7p69o769xTtPKeBXW8FedwmFG
         GMRF3WJiAgReT2KsLnc9Ht8hYWB7wZEOGor62xCg8R62VlHEJkNkLjMusJdaI7mIJEso
         nqnaAPlLEKeIBHP98gPy1p2i4ass5jD/juty/WQkOfLz/zhhG5zlEbVWj6AIEyrMyOxF
         sJOA==
X-Forwarded-Encrypted: i=1; AFNElJ/Sas1TAE9WC/fOJ04ABg+3tbj6hvgaF62G7l7rrI2vOqSI/ZDbxR2BudsWsErUWlTeoX/i0ZTFlni7+Wb2Eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG4+oaelDU4EOwowrKIxS8vba9LgDKcaCVRC5IsvChdCTQj8pU
	uEI2z3yZbPp5EggcVIHKUiQZGjxhN0hnFR/ahUFXDlWOjAmrTrATSDurRi3pKbRkykyvqgpMlkS
	Nc4p162aeUfYV1ERYv42InokOOIOAI4cUFslS/OoQ
X-Gm-Gg: Acq92OE1IQz3soycNM9+Dy57bYK6v9aeHBDQjq+1Yl13sBMHBy4VNHYYqtKcPCRsHo7
	tLINH5Ck+aXz9WbnjKHpYndMANtJBYikEYPiiQBWUbVJqVqBV70BhYCvC9Ads4jOvS76CGOmbe2
	4KD1cuHLVHmAA3kwRJ+3YXKKHogUXY85YM5Fwb8cKEOVj9rHuwcsoSv+Gcos8K48zTM+fEYyvzg
	Zj297kvRddj/ycqHAZw4PkZVvjVJ1T63CPktA0vRgfJSQt5mlQLeBBFmtbx9yIZchpzS77UODCe
	CCf/HKWz4WbBv3Woqtu58XIZVMaKCod8kxTWbA==
X-Received: by 2002:a05:6512:6d0:b0:5a8:74c3:5d9b with SMTP id
 2adb3069b0e04-5a8b6c5f46fmr2281211e87.0.1778476552163; Sun, 10 May 2026
 22:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <20260508175418.GA97653@bhelgaas>
In-Reply-To: <20260508175418.GA97653@bhelgaas>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 May 2026 13:15:40 +0800
X-Gm-Features: AVHnY4LZjBv6gGSmOK6fCKQuMDYhc9G69oS06Omds3Eto3-e9S9bD2qEZifR9TI
Message-ID: <CAGXv+5GBd_RiAiJRbjE82j_fFPdhan+W2z7tx3o8HAKvsrD0zg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_061557_681056_5650B1A4 
X-CRM114-Status: GOOD (  27.25  )
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

On Sat, May 9, 2026 at 1:54=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> > controller memory access could be limited to a small region by the
> > firmware configuring a memory protection unit. This memory region
> > must be assigned to the PCIe controller so that the OS knows to
> > use that region. Otherwise PCIe devices would not work properly.
> >
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
>
> I guess this is similar to
> https://lore.kernel.org/linux-pci/20250716053950.199079-1-huaqian.li@siem=
ens.com/
> and uses
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/re=
served-memory/shared-dma-pool.yaml?

Correct.

> Looks like those keystone changes were never merged; I don't know what
> happened to them.  But it will be good if everybody does it the same
> way.

Not sure what you mean. "dt-bindings: PCI: ti,am65: Extend for use with
PVU" was merged as commit 57a48a2619c5. Maybe you are referring to the
last patch in that series that adds a DT overlay?

> I wish there were a simple way to grep for this restricted DMA
> concept.  Maybe there is and I just haven't found it :)

Probably just grepping for "restricted" in the PCI bindings. :|


ChenYu

> >    mediatek,pbus-csr:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >      items:
> > --
> > 2.54.0.563.g4f69b47b94-goog
> >

