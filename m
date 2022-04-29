Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDE0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 20:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nplN12T+fsgVhgxwYvtGyy20NWpoQbIhruq5fs4XpZc=; b=UKUw+CKqAzlG/b
	1Ozdep1IhqKls7e4RYH7AqBIzFxQT98cUfUF3ctBTGCcoqe3TK6ZS4UJiJS+XtZs3wvCqEqyYZ0EA
	Kn4wDyO7+QQAzTiyE2edUxCAL8QL4TZgUCdfSdqY0gpyOTi1jab/4LUUJs3gyVEKRJIOWyhDn0wm5
	xOkW48TNndgSNwU1wt8euszakD8tvTXVgB/1bsQ/YtsDqgjw8V11cN7s45pytzVGnDVf6uvkRDZlA
	lJN3RjLVzUvRCUWWTOhpKZda82o2bmeTUu75msO8Z3L0/zz4IIpAUW+bNh6idfCd4x/MVEHSot2Ge
	sang+abaRIBGWh+CdohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkWt5-00CP6H-7z; Fri, 29 Apr 2022 20:06:47 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkWst-00CP38-O3; Fri, 29 Apr 2022 20:06:37 +0000
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so9172213fac.7; 
 Fri, 29 Apr 2022 13:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2lI/TWi2tf2Q7JmUZ2/HVxcNVVbUFx/NU2eKJt3txIU=;
 b=rumEQYDKSmB/rCE8fiP/w0KFegNwWlLhQ4UwNiAIVP7tbKcEC/BC2ZwEP4nQvQKpoQ
 O4YCDjmmOIE2F1HXttpodrZwFN3p8k/t6jtfp5CWeK2yGvBG8RCI7lDBeSVRD+NsrDOw
 nKbTSNaUV5bSOITjbxHxrX8MZLHkbngPJ9U984th1I2LsnIakcdvAGgURDQt4jfdvugv
 RyHR/AlbwnKQrluutQreg+/LCOyJnUH1H3tjRD54RbLYpIWQHlk72tge8qGPCpMknGfk
 2T+406n+dfw2XjqfE95GqSToYiKa25a+kJXu32VOVbIAjD0+cp4bREl+Wp++dqlJGj/3
 EYIg==
X-Gm-Message-State: AOAM5319D0eW7t69ddO2Cm9m7jGM5Dhv2aj24wz3ujR6CpX9Y1o42wyN
 /eHGSHMtU89ykGqihVQt/1y4b5oCcQ==
X-Google-Smtp-Source: ABdhPJylIgWmSsuu4I/a3zDRexm1IDuitX9f8YLbudWq18PfZJulvaKEhEYxJPJKLMbOHCK/46tOnA==
X-Received: by 2002:a05:6870:61d4:b0:df:b74:8de5 with SMTP id
 b20-20020a05687061d400b000df0b748de5mr467807oah.37.1651262792205; 
 Fri, 29 Apr 2022 13:06:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o22-20020a9d7656000000b0060603221258sm65246otl.40.2022.04.29.13.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 13:06:31 -0700 (PDT)
Received: (nullmailer pid 2776081 invoked by uid 1000);
 Fri, 29 Apr 2022 20:06:30 -0000
Date: Fri, 29 Apr 2022 15:06:30 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 airlied@linux.ie, krzysztof.kozlowski+dt@linaro.org, daniel@ffwll.ch,
 xinlei.lee@mediatek.com, devicetree@vger.kernel.org, p.zabel@pengutronix.de,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 cellopoint.kai@gmail.com
Subject: Re: [PATCH v5 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
Message-ID: <YmxFRuBWmPaCyw0I@robh.at.kernel.org>
References: <20220428133753.8348-1-rex-bc.chen@mediatek.com>
 <20220428133753.8348-2-rex-bc.chen@mediatek.com>
 <1651177993.334386.220464.nullmailer@robh.at.kernel.org>
 <9f601c458bd3401b216992e8dd72485a10f34597.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f601c458bd3401b216992e8dd72485a10f34597.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_130635_845863_0D7316F8 
X-CRM114-Status: GOOD (  23.88  )
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

On Fri, Apr 29, 2022 at 09:55:37AM +0800, Rex-BC Chen wrote:
> On Thu, 2022-04-28 at 15:33 -0500, Rob Herring wrote:
> > On Thu, 28 Apr 2022 21:37:50 +0800, Rex-BC Chen wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> > > 
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > > ---
> > >  .../display/mediatek/mediatek,dsi.txt         |  62 ---------
> > >  .../display/mediatek/mediatek,dsi.yaml        | 122
> > > ++++++++++++++++++
> > >  2 files changed, 122 insertions(+), 62 deletions(-)
> > >  delete mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> > > l
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
> > https://urldefense.com/v3/__https://patchwork.ozlabs.org/patch/__;!!CTRNKA9wMg0ARbw!wKbRsUmeUS_4mtOwj1t30buVNEilHYYhsUmEd5MvZ7P9VyDXg6cikERof47mkwETQzFL$
> >  
> > 
> > 
> > dsi@1400c000: compatible: ['mediatek,mt7623-dsi', 'mediatek,mt2701-
> > dsi'] is too long
> > 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
> > 	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb
> > 
> > dsi@14014000: #address-cells:0:0: 2 was expected
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-
> > sku2.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku6.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku7.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> > sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> > 
> > dsi@14014000: 'port' is a required property
> > 	arch/arm64/boot/dts/mediatek/mt8183-evb.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-
> > sku2.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku6.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku7.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> > sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> > 
> > dsi@14014000: #size-cells:0:0: 2 was expected
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-
> > sku2.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku6.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-
> > sku7.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-
> > sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-
> > sku1.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> > 
> > dsi@1401b000: 'port' is a required property
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
> > 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
> > 
> 
> Hello Rob,
> 
> Thanks for your comments.
> The purpose of this series is not to fix dts for previous SoCs.
> Therefore, if there is a chance, we could send another series to fix
> them.

Conversions often find that the actual dts files vary a bit more than 
the binding doc said. You should look at the warnings and decide if they 
should be fixed or the schema relaxed. It's a judgement call. I have no 
idea if you did that already or not, so I send this out on conversions. 
The check runs automatically, but sending it I review briefly.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
