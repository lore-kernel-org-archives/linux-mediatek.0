Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206EEECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 18:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8I23OysfCUx1Xe2YvQAfauLcceZ5Fm8l3YdA4hOzeE=; b=a1w9sHMPcLgsuSEeji0ItedHO5
	YW34in0RoXhB8QZ1uYlWI2r8JjhDlPV4CoB0fzo2HUHVxVrJtxxjFiizyJRGgNFh/tob5vu7KrA7P
	9EkR/Wkx4tTj7zVZZcd6EoTkYRBB55kOpjG8qirqPHA3hnPk22CKvqf9EqFSROahLXHsmNgx0mROT
	3GyqBYd4FFmA052o/JfnMVDrPZ7wjfnX7wjv/Wt148mwmiV8+0/FkD7S2wLY3oqxEVyRe0NYfyGFn
	N5CQRzW/ZvvK1xfFkOWPKQA8O+RQHJe4ktF+RSQX79+bfAN+zhKdHRwEUn4Fx3phgGMYr/2ZEzZrH
	Cdvi77ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opZhN-00Dpph-0t; Mon, 31 Oct 2022 18:39:49 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opZhK-00DpnG-Gp; Mon, 31 Oct 2022 18:39:47 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-13bd2aea61bso14469149fac.0;
        Mon, 31 Oct 2022 11:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8I23OysfCUx1Xe2YvQAfauLcceZ5Fm8l3YdA4hOzeE=;
        b=0x5c80Ie7OY7pgPz6sZsbwfS09CBPd0QL5amW2I3+C7ocWuSrNj+ijeOHKDpLMeq01
         ATpo0l6wOzT5Jfki2U9HbKfCuz44kNARDek/MNlwXFxT+na+jsXKQqk3x53+ma6d8buR
         r9uEgHIITz2P1PtREJDq8mUfWBOpL0vrI4hyS1gxuY2VYcNAw49o3tkSGj0aukR7WdVI
         Zc3FftsBb7TBFw7rHO5Mwqeu/sdsN4aeW2n3csXGBDwm2UTz1lug/TfbP2K7yEf/ykvO
         FVRIpb8RvvKc5BJPYY1whTwQTELb0pFqdYlbrGPieA8ddglSnXJ2MZsJhBi14TSfLSx2
         u4ew==
X-Gm-Message-State: ACrzQf0vv9dzq0H/LxKVbB9O1L/iHMjgd+gh+kZXcrUqrRUj+AoEVffV
	JkboWHhvtR2UyowUjdA6hANhyGrIBg==
X-Google-Smtp-Source: AMsMyM76PZ6E2clfU5MJa4MsDXzGuDNWQDOmvVzuoUlAJbMDTKjf/teIxDgreXo1CZP+otpDeba2ZQ==
X-Received: by 2002:a05:6870:5894:b0:131:b25b:413e with SMTP id be20-20020a056870589400b00131b25b413emr17944734oab.192.1667241584347;
        Mon, 31 Oct 2022 11:39:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i16-20020a056870a69000b0013b8b3710bfsm3396902oam.13.2022.10.31.11.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 11:39:43 -0700 (PDT)
Received: (nullmailer pid 3235802 invoked by uid 1000);
	Mon, 31 Oct 2022 18:39:45 -0000
Date: Mon, 31 Oct 2022 13:39:45 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 1/3] dt-bindings: PCI: mediatek-gen3: Support mt8195
Message-ID: <20221031183945.GA3060184-robh@kernel.org>
References: <20221028094317.29270-1-tinghan.shen@mediatek.com>
 <20221028094317.29270-2-tinghan.shen@mediatek.com>
 <9da05c64-87bb-39c7-6c23-e4918bd5024b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9da05c64-87bb-39c7-6c23-e4918bd5024b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_113946_583312_E66D6B64 
X-CRM114-Status: GOOD (  23.15  )
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

On Mon, Oct 31, 2022 at 02:28:54PM +0100, AngeloGioacchino Del Regno wrote:
> Il 28/10/22 11:43, Tinghan Shen ha scritto:
> > From: Jianjun Wang <jianjun.wang@mediatek.com>
> > 
> > In order to support mt8195 pcie node, update the yaml to support new
> > properties of iommu and power-domain, and update the reset-names
> > property to allow only one 'mac' name.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
> > ---
> >   .../bindings/pci/mediatek-pcie-gen3.yaml         | 16 +++++++++++++---
> >   1 file changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > index c00be39af64e..a9013c10131a 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -70,14 +70,21 @@ properties:
> >       minItems: 1
> >       maxItems: 8
> > +  iommu-map:
> > +    maxItems: 1
> > +
> > +  iommu-map-mask:
> > +    const: 0
> > +
> >     resets:
> >       minItems: 1
> >       maxItems: 2
> >     reset-names:
> > -    minItems: 1
> > -    items:
> > -      - const: phy
> > +    oneOf:
> > +      - items:
> > +          - const: phy
> > +          - const: mac
> >         - const: mac
> 
> Sorry, this looks a bit messy.
> 
> I can propose two solutions, either:
> 
> reset-names:
>   minItems: 1
>   items:
>     - const: mac
>     - const: phy
> ... and change the order in mt8192.dtsi;

That doesn't work because originally 'phy' alone was allowed.

You could do:

minItems: 1
maxItems: 2
items:
  enum: [ phy, mac ]

But for 2 items, either order would be allowed. Not great, but not a 
huge deal.

> otherwise, something like
> allOf:
>   - if:
>      properties:
>        compatible:
>          contains:
>            - const: mediatek,mt8195-pcie
>     ... invert reset-names
> 
> I think that the first solution makes a bit more sense though, as the
> PHY reset may be moved in a PCIE-PHY specific driver instead of being
> managed here in pci-mediatek-gen3.

That either makes sense or it doesn't. If it does, then you should go 
ahead and separate the phy rather than change the ABI twice.

Rob

