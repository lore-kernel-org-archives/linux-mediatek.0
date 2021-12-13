Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34312C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 20:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zb8YkQOI7rvUglkv4nWAWr6GfqeEOoXSK/maVrqZVFY=; b=1uHwIWSDHrDYyh
	sBE0ifsrDHdLpxyXsWOHKPGkeaTnjudlzTCjaT+g7IE6pc54g6qJ793W06BrUdF6xv+ejztGRRGz2
	6Eu+Sb/SsfLjlFasA9XyBVAcKJ1q4qfBIWayzw+n2hnn4gyjcDYuk0DeGRJnOT4fViSFl5T0Kz9vw
	XygsrjtIiK1MzkBonsnqrmQxjehhLnyjebEhPcQkPXocc38uVsk4w4xQaTwbmr6MqGwF1JUbPclrH
	74aSxbw1JjDl9xc/f3lrVZEeQmu7hj8njkbJ/YXxhrFGrQeRXvuFZy6D5TKr/OdHgusmFxIWWgcP4
	MjQCuO6SYUeQwRQxMjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwrya-00BKXK-Rl; Mon, 13 Dec 2021 20:31:12 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwryL-00BKSZ-Ph; Mon, 13 Dec 2021 20:30:59 +0000
Received: by mail-oi1-f178.google.com with SMTP id o4so24731663oia.10;
 Mon, 13 Dec 2021 12:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sfYJREk4LthXDmYH+mm6RPH7Unbt5mdqH4JPAcOL8jM=;
 b=ldPMQFp/38qEdH4YcyxmQmsuvsvLpXqlArhjNJi6mcTei5Agb+cc6By602yEB3uNZM
 mRdQTHU1eGTeFuy6hn62DRz7+cp2fSzadfP8oQdDRrLp+AIW06/vnIvcUC89hddwDpxK
 veipsEJlbzw4JDtc5Ryfp1t4yqPTpdfBFP9Kk5Jhd6jY+T1h9eM8vdsgoUbNL50Yom9G
 ANDGb2Ek6REoEYIhhaXfg9ZMXruGwvdquY3qPiHylFRIOCL/cF23DW1VoMalmwbCjSam
 W73Ob6bIR3xsESPZ86nNdf0YJOR032Oylkia7LvGs6ptqgOeBy8NuhwL6EcbKhtxm5+Q
 Q80g==
X-Gm-Message-State: AOAM5326Lx5yS3XF3r1GaOOFMou7zSSdYKScOLDI+peK1lFMAhJLPAkg
 uw+LvQFzUaenpl780DDriQ==
X-Google-Smtp-Source: ABdhPJypg8D572vna64ZqsehAGwqHTe6foFXFeIhphG+rwK2thl/QHujnSj1sQrfMN3EvOBZVoRK9g==
X-Received: by 2002:aca:1a04:: with SMTP id a4mr752400oia.153.1639427454528;
 Mon, 13 Dec 2021 12:30:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j20sm2305218ota.76.2021.12.13.12.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 12:30:53 -0800 (PST)
Received: (nullmailer pid 1519622 invoked by uid 1000);
 Mon, 13 Dec 2021 20:30:52 -0000
Date: Mon, 13 Dec 2021 14:30:52 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 Tomasz Figa <tfiga@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, yi.kuo@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, anthony.huang@mediatek.com,
 lc.kan@mediatek.com, srv_heupstream@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 youlin.pei@mediatek.com
Subject: Re: [PATCH 1/4] dt-bindings: memory: mediatek: Correct the minItems
 of clk for larbs
Message-ID: <YbetfPEoHdyqyo8H@robh.at.kernel.org>
References: <20211203064027.14993-1-yong.wu@mediatek.com>
 <20211203064027.14993-2-yong.wu@mediatek.com>
 <1638574455.281202.1043012.nullmailer@robh.at.kernel.org>
 <5d1ebe0089acd28032b74e3a180466f418580805.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d1ebe0089acd28032b74e3a180466f418580805.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_123057_869713_1E50535F 
X-CRM114-Status: GOOD (  24.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 13, 2021 at 02:48:52PM +0800, Yong Wu wrote:
> On Fri, 2021-12-03 at 17:34 -0600, Rob Herring wrote:
> > On Fri, 03 Dec 2021 14:40:24 +0800, Yong Wu wrote:
> > > If a platform's larb support gals, there will be some larbs have a
> > > one
> > > more "gals" clock while the others still only need "apb"/"smi"
> > > clocks.
> > > then the minItems is 2 and the maxItems is 3.
> > > 
> > > Fixes: 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to
> > > DT schema")
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > ---
> > >  .../bindings/memory-controllers/mediatek,smi-larb.yaml          |
> > > 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > 
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> > 
> > Note that it is not yet a requirement to have 0 warnings for
> > dtbs_check.
> > This will change in the future.
> > 
> > Full log is available here: 
> > https://patchwork.ozlabs.org/patch/1563127
> > 
> > 
> > larb@14016000: 'mediatek,larb-id' is a required property
> > 	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml
> 
> I will fix this in next version. This property is not needed in mt8167.
> 
> > 
> > larb@14017000: clock-names: ['apb', 'smi'] is too short
> > 	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-
> > burnet.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-
> > fennel14.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku1.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku6.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> > sku16.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku0.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku1.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dt.yaml
> > 	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dt.yaml
> 
> Some larbs only have two clocks(apb/smi) in mt8183. thus it is
> reasonable for me. I won't fix this in next version.

You also need to adjust 'clock-names' to allow for 2 items.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
