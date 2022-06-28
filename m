Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D665C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 21:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdmVCCaapks5mqyJeNP/LvsCykQThbQW4f2v+GKWiVI=; b=mGbN9Z/DeCm1ecsJXOquPgigNg
	xiU7kV0H8Sop+JXCKuIRO1vex8cFVWhQxsuL03JgglPzhQjwzFSmBPa/miWepkCJmBychm/dBP13z
	5cERM3eK/yLx5fvcfA0Pzhn55GU7ciaLndYiXLqTTflGMQTIFo8Wv7XQoCLB7FIUvJncN8VRppfxq
	IAVB4Yqprn86K3xHA3BndMr4/j1NDpBcNAQ/jnWVr+bC5Z2JREJNGF19U4WQw4Kv1Y8fiTXVMc7s2
	1+ccSwJeIHpkamEINg3EqkJE0uDBY1pWuxGJ/5/UEIrs15RvYQVX6kD2CA7IWdDirT+pZkaUIfbE0
	bqZmkD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6IQo-008CN8-Jj; Tue, 28 Jun 2022 21:07:34 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6IQb-008CHs-TC; Tue, 28 Jun 2022 21:07:23 +0000
Received: by mail-io1-f48.google.com with SMTP id s17so14130576iob.7;
        Tue, 28 Jun 2022 14:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EdmVCCaapks5mqyJeNP/LvsCykQThbQW4f2v+GKWiVI=;
        b=hMv2v3RM9eET4lyXrYOLg+Kt2YYQYRJkFfJJ0LzuGNNiH7ohbtbGSgT2c9lBrXzYKI
         rr0yh5+ayFjJxKIQphqG+U6/I6VW/wFMARVK3hr+uYNatDvh8SkcMXK8J9airdorsMkg
         hKjxlWTQqqDurI5dDCpq1x646HuoA/KXb+n7h//O1QvOXNBGryBTBbW9s5C2KKqASCp7
         c6EBV3u2S/CPtRexuj5vrYs4bESGDwm/C/C8spb0SXUIMN4XQDAeuZEXpe1l1vX5r16V
         Fcsj4KVCnFy6FYjr9/iXmLezHyakQILhD8k5UhxOEHzTXxFsbQETkOjh/tWqoxJHOVZh
         8wwQ==
X-Gm-Message-State: AJIora80YAsLudFbjk6/iVGRJu/jV5zcABRAifh15GI2/IhrVb3vSqqe
	rvsC9xdWMX9pZZpUk3o8+A==
X-Google-Smtp-Source: AGRyM1uc+XPBhifMAguV92DxPvJZX6j7ZucXINm5C5uMzjXPcIlUdRqzojxywk4dF8WrqVqjSlCHzA==
X-Received: by 2002:a05:6638:2589:b0:333:e976:d0c7 with SMTP id s9-20020a056638258900b00333e976d0c7mr50106jat.16.1656450440054;
        Tue, 28 Jun 2022 14:07:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id b28-20020a026f5c000000b0032e70c4e12fsm6614611jae.28.2022.06.28.14.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 14:07:19 -0700 (PDT)
Received: (nullmailer pid 977856 invoked by uid 1000);
	Tue, 28 Jun 2022 21:07:16 -0000
Date: Tue, 28 Jun 2022 15:07:16 -0600
From: Rob Herring <robh@kernel.org>
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>, angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com, wenst@chromium.org, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com, maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
Subject: Re: [RESEND V9,1/7] dt-bindings: mediatek: Add mediatek,
 mt8195-jpgenc compatible
Message-ID: <20220628210716.GA963202-robh@kernel.org>
References: <20220614121024.31667-1-irui.wang@mediatek.com>
 <20220614121024.31667-2-irui.wang@mediatek.com>
 <20220617231139.GA2610098-robh@kernel.org>
 <329eb655ddb503e4327cbe3cffef625bb44630b1.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <329eb655ddb503e4327cbe3cffef625bb44630b1.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_140721_984647_853433E9 
X-CRM114-Status: GOOD (  28.19  )
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

On Mon, Jun 20, 2022 at 02:04:38PM +0800, kyrie.wu wrote:
> On Fri, 2022-06-17 at 17:11 -0600, Rob Herring wrote:
> > On Tue, Jun 14, 2022 at 08:10:18PM +0800, Irui Wang wrote:
> > > From: kyrie wu <kyrie.wu@mediatek.com>
> > > 
> > > Add mediatek,mt8195-jpgenc compatible to binding document.
> > > 
> > > Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> > > ---
> > >  .../media/mediatek,mt8195-jpegenc.yaml        | 153
> > > ++++++++++++++++++
> > >  1 file changed, 153 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/mediatek,mt8195-
> > > jpegenc.yaml
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > > jpegenc.yaml
> > > b/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > > jpegenc.yaml
> > > new file mode 100644
> > > index 000000000000..a7f9f723d5db
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-
> > > jpegenc.yaml
> > > @@ -0,0 +1,153 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: 
> > > http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: MediaTek JPEG Encoder Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
> > > +
> > > +description: |-
> > > +  MediaTek JPEG Encoder is the JPEG encode hardware present in
> > > MediaTek SoCs
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: mediatek,mt8195-jpgenc
> > > +
> > > +  mediatek,jpegenc-multi-core:
> > > +    type: boolean
> > > +    description: |
> > > +      Indicates whether the jpeg encoder has multiple cores or
> > > not.
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  iommus:
> > > +    maxItems: 4
> > > +    description: |
> > > +      Points to the respective IOMMU block with master port as
> > > argument, see
> > > +      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > > for details.
> > > +      Ports are according to the HW.
> > > +
> > > +  "#address-cells":
> > > +    const: 2
> > > +
> > > +  "#size-cells":
> > > +    const: 2
> > > +
> > > +  ranges: true
> > > +
> > > +# Required child node:
> > > +patternProperties:
> > > +  "^jpgenc@[0-9a-f]+$":
> > > +    type: object
> > > +    description: |
> > > +      The jpeg encoder hardware device node which should be added
> > > as subnodes to
> > > +      the main jpeg node.
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        const: mediatek,mt8195-jpgenc-hw
> > > +
> > > +      reg:
> > > +        maxItems: 1
> > > +
> > > +      hw_id:
> > > +        description: |
> > > +          Current jpegenc hw id.
> > 
> > Same question here. Surely, I asked sometime in the last 8 versions,
> > but 
> > no explanation here and I'm not going to go look for it.
> Dear Rob,
> I'm sorry for not giving an accurate explanation in time.
> The MT8195 has own two encoding hardwares, we use hw_id to 
> represent them.
> hw_id = 0, for hardware 0, and hw_id = 1, repesents another one.
> I will improve the description in the next version.

Why do you care which one is which? 

We generally don't do instance indices in DT, so figure out how not to 
need this.

Rob

