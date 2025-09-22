Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC1CCAC5A7
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Sep 2025 11:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAYqFXyWYf/ovOGnjUFnZWmVgk9QvSIoobQEOgia090=; b=blqU/DTKxSYxwwIc/3SjhqIJgz
	+VpcBP0jXOKjC+dLLy/WaJKRqHVE68Xlr2dlhGj8Pf7XLh31LzUGZGIm3S2DzO7uo4ZbmB/3W70OF
	LDmYJE5xxxHHZ71HO335W2QEVUFfqtzHU9i6m4lnmBfO1ecf+3npB0fjhhrDJuDft8xc27szb7Zz2
	chMqdxARrderlOw1IcNJ47ev4T+ngJP8BDQjQKPkyvZJMQV/4RCMDU0sopIKKA7FA28XGkvMV+0hH
	W2doutzY86ZfMtqpfzB/gxrL44iQoNCSV1F2TcG1DC3ph4mmmmq3FvnaD6g3sclwz2fATpqb/GlxS
	lYlh8jPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eqh-0000000AEQJ-2R0U;
	Mon, 22 Sep 2025 11:36:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eqe-0000000AEOd-3Dg2
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Sep 2025 11:36:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46d40c338b8so6330125e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Sep 2025 04:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758541007; x=1759145807; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oAYqFXyWYf/ovOGnjUFnZWmVgk9QvSIoobQEOgia090=;
        b=MwO4f7zz7nY6rzH3e6UbF90Nd69oZ9seNPZUkgZwtKIn8N0+1YItGpFACP1Nerp/nN
         PiOMY54D0QrvObmzTtKnmBJ61tlXW0F0muCOP/j5EatGcaj9OXB1dgWgBqFcx7MeKqBU
         gdysV28G0iFFt/yVqZjCncKUxVRIFb/NvDyX7JXDPRaAq6qeRfmqEcBJUt6kbIWp0wme
         vHMHKXa1P4FjY3vOkoMhVL3BWidnFRWm3yKsAxHkDlz6InlXfPaGrOZxgEuslm/er4bc
         QcfxCX6VDfuESZEzmEBcv8l08U6pXyXpgJQDsCQN/OnjVjaLv8x1PdfzIgMBypK4j/+j
         haRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758541007; x=1759145807;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAYqFXyWYf/ovOGnjUFnZWmVgk9QvSIoobQEOgia090=;
        b=gg/ONKOuz6f5tNkc5ev27GCOL4FuhmQUQlj4tqBFxuOM7+YHPnbv5NsOfIFFJeeA2H
         21WF/VXL8H+xog8PJBt7Npw2Ixct6R8LPKfrqCHGO8rH8G+Gi9PTtlLdSHD+aWT16v1/
         aVrNv25CsTAADHJDBf8xqeq6AQGAzMLPHoMMIa/f3Nwf8WE8NCN/r0FGisRo034Geg4l
         rBMNET2LM5J4ggU0zWFY/OLhBA70wnla0DNVAi4NRe2tqJVcAdpdbVojGGt1WU1manKS
         5ew9M963XGOeypajKI9q4WDJT3AbfM92nj/0z2gIKsd5Lzpl9SfiBVU2Sj16Q5zFrdsv
         eZ2g==
X-Forwarded-Encrypted: i=1; AJvYcCVF1ykAea503rduilCuOD3YO61rKwkSr1Y2A5kvIuhmvL+pRpRIJaktXKU1B6P4Isdqa6jf83m+8EJj/fCXMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys5NuaYDwp/oxLR5vk7zjYD4MJahgfd+kRauZJhZqoekEgHV09
	USPM47GXC91WQoBDlPIPz+Kl1CySF/Uve5o6uXgXUd1x3QpiwbPRnuLH
X-Gm-Gg: ASbGnctU2bPB3tzTmXvCfQ0EwPzfo600UhR1S4wgxSSWeKph5zJRbZ+dNk76Rqs+3oW
	W3g+UQdeXUosDpDVp0E4bmbSRO8CGt3d6DXwa/daaFEaEcxRyHiQGQvr9CBlzNOMAFoP6kuljti
	AQ+DHuoUiILdmSutBzpcohneS3S1/5p22OwtE5gYXb2F2nqGdGOH+zc8ZtwFndCQHJDnanlampP
	wZk07MLM4yXHlqJCM91lDp/1xD6lsvQn9NfFVKK9qT0QQrICp9nbogEznsuXPJJ3mxXSMPZ8R4W
	otLEJaR+Bx1kuHP8lTEP48tS3Vh6uxvzbpi5m5xF7qCLzSVdggiKZh3lzaFpb1pYJSXKK5P7xY3
	VH1wi4dl5Hbj8i3u7XTNsAoNU/UolUB2o059kVXDckTepWhvIVNoR5vMesRPxkkEmLcaeeA==
X-Google-Smtp-Source: AGHT+IFxQTXNVAZvfC1AemnurHgjd7bW6AIxc0GLyxTk076fV2qzgcWwb7RLdq+XPS4PWKkuqKxXTg==
X-Received: by 2002:a05:600c:a48:b0:45d:d19c:32fc with SMTP id 5b1f17b1804b1-467e78caa13mr132278155e9.10.1758541006439;
        Mon, 22 Sep 2025 04:36:46 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f326133a8sm132690315e9.6.2025.09.22.04.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:36:45 -0700 (PDT)
Message-ID: <68d134ce.050a0220.375eef.da87@mx.google.com>
X-Google-Original-Message-ID: <aNE0yMvIzvPc3W_O@Ansuel-XPS.>
Date: Mon, 22 Sep 2025 13:36:40 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 Airoha AN7583
References: <20250920092612.21464-1-ansuelsmth@gmail.com>
 <40efb310-e63b-47ea-b62b-cc3d614c47b4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40efb310-e63b-47ea-b62b-cc3d614c47b4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_043648_814851_0B58E1DD 
X-CRM114-Status: GOOD (  19.60  )
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

On Mon, Sep 22, 2025 at 01:34:06PM +0200, AngeloGioacchino Del Regno wrote:
> Il 20/09/25 11:25, Christian Marangi ha scritto:
> > Introduce Airoha AN7583 SoC compatible in mediatek-gen3 PCIe controller
> > binding.
> > 
> > This differ from the Airoha EN7581 SoC by the fact that only one Gen3
> > PCIe controller is present on the SoC.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >   .../bindings/pci/mediatek-pcie-gen3.yaml      | 21 +++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > index 0278845701ce..3f556d1327a6 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -59,6 +59,7 @@ properties:
> >         - const: mediatek,mt8192-pcie
> >         - const: mediatek,mt8196-pcie
> 
> "an" comes before "en", please move it here.
> 
> Also, for consistency with all of the other compatibles, this should be just
> "airoha,an7583-pcie": please rename it.
>

Thanks for the review. The "gen3" wasn't added randomly. On AN7583 they
put both gen2 and gen3 PCIe. One line is gen3, the other gen2. So either
we differenciate for gen2 or we add the gen3 tag.

I decided to add it here to follow the naming pattern with
mediatek-pcie-gen3.

If you have better idea on this, I'm all open.

> >         - const: airoha,en7581-pcie
> > +      - const: airoha,an7583-pcie-gen3
> 
> 
> 
> >     reg:
> >       maxItems: 1
> > @@ -298,6 +299,26 @@ allOf:
> >               - const: phy-lane1
> >               - const: phy-lane2
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: airoha,an7583-pcie-gen3
> 
> same for this if block, please put it before en7583.
> 
> Everything else looks good.
> 
> Cheers,
> Angelo
> 
> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 1
> > +
> > +        clock-names:
> > +          items:
> > +            - const: sys-ck
> > +
> > +        resets:
> > +          minItems: 1
> > +
> > +        reset-names:
> > +          items:
> > +            - const: phy-lane0
> > +
> >   unevaluatedProperties: false
> >   examples:
> 
> 
> 

-- 
	Ansuel

