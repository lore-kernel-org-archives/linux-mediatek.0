Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82138C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 19:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbkbCBX5qiptsKPuD7ofnI+kwIIikXEjEFfIdyuhodk=; b=lTg+OCxOxWLRuRm4N7WFeCHxuY
	S7OCaeY7MbhpdTk7PTK3ypdkp4ubFZUEoOOrA2EjHrxzmZK9N38E9dqtGOIHmCwyDdK6+w7RN8ue5
	eIEHF5Ah8x9xV2G9VEOztu/C2f+tQ+aTzucClfIAnoh/iOvezwGhBGOfUOj+dyKAFtMX32NAMSFLX
	YD/qPDwYMKZUmudEPp2H1s8fpyXR6S1uKzZCGJh1GFE7Sdpiq5Z9sdRPCuxfdNwVoPFCWWrOyDiy5
	IbXVIDfkJLiCa6S7jyermjMgu+fu7UxS/hhy3Qu6eoCstjNP8rXX4CAId65lRvBhTYaM+3DfG1OvL
	x9HB4Rdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeLM0-00B8aV-HY; Fri, 30 Sep 2022 19:07:20 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeLLp-00B8Wm-5B; Fri, 30 Sep 2022 19:07:10 +0000
Received: by mail-oi1-f169.google.com with SMTP id v130so5671596oie.2;
        Fri, 30 Sep 2022 12:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=lbkbCBX5qiptsKPuD7ofnI+kwIIikXEjEFfIdyuhodk=;
        b=htgIO0Pdx4UXQ7o0vzOZ2T23DI8oXvHtAwA1Gf76GS9EiaV2DicRWE0Sha8Wm5mkpb
         yiyVzHnFsekCSNHAUA/WuhpwNQd15x4jEErrfKagJwpt+eTMklGuwfnp7qnmNCxPL7+L
         Yrsu+Ng7OuCHfC0fuB7r3LWO45bBQTE3cJ5OBsPN/SijuUv4ieYHa2t9Gj+6CTf0Oe3t
         VvofFD3jqHLoodaB38iL0E0fTBPX16+lvM2dXQ7iYtvCyyZlA/ooE7HWwmj+/C3G5BR3
         MRZFmNGIT7dDz91+OqZJScz2VryEMOqEqS7aKy52/Ltpvbxr6cHQIDWRQIMS7s8XcnSM
         4GRA==
X-Gm-Message-State: ACrzQf13+D3OIp6Ri9Pmw+J1DZL7XG742qfnjDhBZRAS363jlpxevBfR
	HuGbob//MgRebgP8XHkCsg==
X-Google-Smtp-Source: AMsMyM4by+DiFSSmhyZnJykHeNEQHgTg1raTX3hQcjvnazl1Cm8fmz9jDXP3QHvNJr8TJkL1A01tdQ==
X-Received: by 2002:aca:1912:0:b0:350:504b:ee13 with SMTP id l18-20020aca1912000000b00350504bee13mr9677907oii.256.1664564824871;
        Fri, 30 Sep 2022 12:07:04 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c130-20020aca3588000000b00344a22e71a9sm699006oia.9.2022.09.30.12.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:07:04 -0700 (PDT)
Received: (nullmailer pid 688099 invoked by uid 1000);
	Fri, 30 Sep 2022 19:07:03 -0000
Date: Fri, 30 Sep 2022 14:07:03 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Johnson Wang <johnson.wang@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, kuan-hsin.lee@mediatek.com, yu-chang.wang@mediatek.com, Edward-JW Yang <edward-jw.yang@mediatek.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Message-ID: <20220930190703.GA657929-robh@kernel.org>
References: <20220929114624.16809-1-johnson.wang@mediatek.com>
 <20220929114624.16809-3-johnson.wang@mediatek.com>
 <ed723cb2-ba79-55d7-7869-abf153e4af0a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed723cb2-ba79-55d7-7869-abf153e4af0a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_120709_222174_248023A6 
X-CRM114-Status: GOOD (  20.61  )
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

On Thu, Sep 29, 2022 at 03:07:49PM +0200, AngeloGioacchino Del Regno wrote:
> Il 29/09/22 13:46, Johnson Wang ha scritto:
> > Add the new binding documentation for MediaTek frequency hopping
> > and spread spectrum clocking control.
> > 
> > Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> > Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > ---
> >   .../arm/mediatek/mediatek,mt8186-fhctl.yaml   | 53 +++++++++++++++++++
> >   1 file changed, 53 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml
> > new file mode 100644
> > index 000000000000..258dff7ce6bc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-fhctl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek frequency hopping and spread spectrum clocking control
> > +
> > +maintainers:
> > +  - Edward-JW Yang <edward-jw.yang@mediatek.com>
> > +
> > +description: |
> > +  Frequency hopping control (FHCTL) is a piece of hardware that control
> > +  some PLLs to adopt "hopping" mechanism to adjust their frequency.
> > +  Spread spectrum clocking (SSC) is another function provided by this hardware.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8186-fhctl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: Phandles of the PLL with FHCTL hardware capability.
> > +    minItems: 1
> > +    maxItems: 30
> > +
> > +  mediatek,hopping-ssc-percent:
> > +    description: The percentage of spread spectrum clocking for one PLL.
> > +    minItems: 1
> > +    maxItems: 30
> > +    items:
> > +      default: 0
> > +      minimum: 0
> > +      maximum: 8
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8186-clk.h>
> > +    fhctl: fhctl@1000ce00 {
> > +        compatible = "mediatek,mt8186-fhctl";
> > +        reg = <0x1000c000 0xe00>;
> > +        clocks = <&apmixedsys CLK_APMIXED_MSDCPLL>;
> > +        mediatek,hopping-ssc-percent = <3>;
> > +    };
> 
> 
> .... a more realistic example:

One or 2 cells is really outside the scope of the binding as either is 
valid. If the parent bus only has 32-bits of address space, there's 
little reason to use 2 cells.

> 
>     #include <dt-bindings/clock/mt8186-clk.h>
> 
>     soc {
>         #address-cells = <2>;
>         #size-cells = <2>;
> 
>         fhctl: fhctl@1000ce00 {
>             compatible = "mediatek,mt8186-fhctl";
>             reg = <0 0x1000c000 0 0xe00>;
>             clocks = <&apmixedsys CLK_APMIXED_MSDCPLL>;
>             mediatek,hopping-ssc-percent = <3>;
>         };
>     };
> 
> After which...
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

