Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F15C38A2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FS6rm9BDQlab5fLy0WIjAlMKCNgvwb6RMvMQ+w+1YTY=; b=QMRe3hFnMi6npHcNrG7smF4ufh
	jEFKRsoDhgU0xfUiEqwhne8UbNKBVgQWHXJz0ktfL81vD5+tE0FbLdQoWQ7vsaXtmAX+4iTWe/dX1
	yvC5WehdaWRS1bgAdnTxfgazrDxPCxsp3qQpYDKLIt0pCNJjG5Md2t2b8GzJrKPydQe/Id+kl2Vi7
	igCOqGDGBs8a4w7x3DOobQuWC0AgpqbcYwDANNGNEVRIZqYfmNhU+kpGy/4iAPh7ztDwTO0NUJnhX
	U4cevnyPmegzUECOWPFlC21tzX9s9fWNJI7AquLeL5uc3TmtZCkXG723KQ2dxe3Oqpv8tEaG+JbE2
	6f/ZRukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onmM2-00AqQK-Li; Wed, 26 Oct 2022 19:46:22 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onmLz-00AqNt-El; Wed, 26 Oct 2022 19:46:20 +0000
Received: by mail-oi1-f180.google.com with SMTP id p127so20062757oih.9;
        Wed, 26 Oct 2022 12:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS6rm9BDQlab5fLy0WIjAlMKCNgvwb6RMvMQ+w+1YTY=;
        b=dbYnY156CuHnutlKTGDVnonJPmr/XZK7EeTsajAxylAfMn8mmVXu1ge19yra3wTU1L
         PnWVPUYZmZ/XnxpQIeQHRA3+WvwAWNcfEWOWWiEwQNqRJlkmPu55E1Bjbr8iKpD8AOpx
         DDtTwB6MEWFqttCXDL5epBz+zVdCCglXrwsu7I0cDzmM/Qso7Yx/cQebjOwdTRNbVreP
         hWdJ2s4ps+4peFD5Dun1IjPvH3EUUJZFrOiy7502k/pzOHqU4ZykZn2E/AgH8HCYta37
         3Zork89JDLMG+bPRutf2tjZRj7DPYvB80issgKc/pgWPOoZZKyqrxkSGetqDbzmeJx0N
         oPRg==
X-Gm-Message-State: ACrzQf0zbAaOHwkhi/rovmdPSDtlJQwBpZXngMCgqHe53Ia88MKZdePS
	JBW3oz6N9M1wYhvhnTH6rw==
X-Google-Smtp-Source: AMsMyM6UXJyWxevgK90NbceQb/Qr6Yzp1ZycrnNhNY0KdyxUpeRsVRHipmEBOMF8TifjGLHUVMsPmQ==
X-Received: by 2002:a05:6808:1384:b0:355:535f:118c with SMTP id c4-20020a056808138400b00355535f118cmr2677393oiw.35.1666813577379;
        Wed, 26 Oct 2022 12:46:17 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x11-20020a056808144b00b00350743ac8eesm2407990oiv.41.2022.10.26.12.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 12:46:16 -0700 (PDT)
Received: (nullmailer pid 1052629 invoked by uid 1000);
	Wed, 26 Oct 2022 19:46:18 -0000
Date: Wed, 26 Oct 2022 14:46:18 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: PCI: mediatek-gen3: add support for
 mt7986
Message-ID: <20221026194618.GA1049502-robh@kernel.org>
References: <20221025072837.16591-1-linux@fw-web.de>
 <20221025072837.16591-3-linux@fw-web.de>
 <22728b06-f460-6dda-21fa-1d7a7ae3b903@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22728b06-f460-6dda-21fa-1d7a7ae3b903@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_124619_513323_46410E83 
X-CRM114-Status: GOOD (  23.85  )
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

On Tue, Oct 25, 2022 at 01:10:56PM +0200, AngeloGioacchino Del Regno wrote:
> Il 25/10/22 09:28, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> > 
> > Add compatible string and clock-definition for mt7986. It needs 4 clocks
> > for PCIe, define them in binding.
> > 
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > v2:
> > - squashed patch 2+3 (compatible and clock definition)
> > ---
> >   .../bindings/pci/mediatek-pcie-gen3.yaml        | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > index 98d3f0f1cd76..57d0e84253e9 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -48,6 +48,7 @@ properties:
> >       oneOf:
> >         - items:
> >             - enum:
> > +              - mediatek,mt7986-pcie
> >                 - mediatek,mt8188-pcie
> >                 - mediatek,mt8195-pcie
> >             - const: mediatek,mt8192-pcie
> > @@ -78,9 +79,11 @@ properties:
> >         - const: mac
> >     clocks:
> > +    minItems: 4
> >       maxItems: 6
> 
> I'm not sure that this is really correct.
> If you have a list of items (const or description, doesn't matter), you don't have
> to specify maxItems, as it is implicitly equal to the number of items.
> Also, specifying minItems means that you're "setting" one or more items as
> optional.
> 
> It looks like you're specifying a specific and definite list of items for both
> clocks and clock-names... and for all of the supported SoCs, so, I don't think
> that having {min,max}Items globally specified on clocks, clock-names make any
> kind of sense.
> 
> .....but I'd like for someone else to give an opinion on this as well.

It does make sense. Globally, we have the full range of possible clocks 
and then the if/then schemas further restrict it.

Rob

