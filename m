Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15765C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 14:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14xAR8hSCk6+/CeiTkWMg28Vemlf4rPIjnlZV3N7530=; b=tDRjIlGSREvBTy
	RKN8Q7O0hj70Vrr38dN52Pg5JA0hGNobdTIESIULJqCY/O4xO8NAXzErbrs2n7TyP3UWtjwGhedfQ
	wBrREJC/9Vsfoy7rpN2yhITHTH/VRrlI3SIK/HBySxsNWP76NGBdHxY+2+/MCF9WB9ZgA/Jpx9rj1
	DqW7hvTCXdrBarMgUFSs5l2s0JeyrEPSEhDKOtV9qTM/QBg5iG7/8zUoCtvCvX4lv2XyeOUDQxfk5
	48leUSWbz5B/U6euba0uDJcPzw67aRJGigbPn04dD6e4g1ONdEH5R4+TLfcmKtjHLvMziZTgkvpzD
	601gl+KUZvq1aTdOuqxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx7tY-007cIq-4G; Fri, 03 Jun 2022 14:03:20 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx7tH-007cAO-P4; Fri, 03 Jun 2022 14:03:05 +0000
Received: by mail-oi1-f176.google.com with SMTP id s8so5244112oib.6;
        Fri, 03 Jun 2022 07:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L4KrDpSYq99VolrzPQGxB5l5hpx3haeHuOlN9SEwbx0=;
        b=by2Bdzcamci1h8sHi78s6KIk0gpg+dvpmTrZNx5hzqw8jDaD2DVZ9z6TRDgkSnh9FR
         S6VGiBtXGSGfSDobkF/Q91YwkyAcuiu/0HX+pQ6Cev1LZIsxdDQTs1rqSgGYsuRruHID
         5r3F0bF48i+B59zZaSR0iyT2wkp8Mi1puuycWvv8p63ClDGsvq5+96HR77TxdDlvqtht
         7RHm7oPYuFmKqBN89Gw5MSiugOpiWzwNfl+QCpxum7q4yTNA50Gq9KPGYpW6SKwXmdQR
         FI0ezf3TGAsXTDyKl0rQSNniEBvtYX+zB3dGKE0GwwLfa4NQ4DAUD2eIRtYSI5NXB50C
         N2DQ==
X-Gm-Message-State: AOAM530gCN69k1cEgbLzKHpGVb+cGWhFnvOw2XwHR57w087X3/E+Jmn4
	y6uI0CLXcerTWaSlZtUsDg==
X-Google-Smtp-Source: ABdhPJzNWAcrfALGI9WFStd6O7bU+uyoCscDf+bymPZkJRN1miqnpseIhlLZQcf+wmB4Pok3H4FeGA==
X-Received: by 2002:a05:6808:144d:b0:32b:7fbc:9440 with SMTP id x13-20020a056808144d00b0032b7fbc9440mr5607304oiv.226.1654264980296;
        Fri, 03 Jun 2022 07:03:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p3-20020acad803000000b0032e5209af19sm891448oig.31.2022.06.03.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 07:02:59 -0700 (PDT)
Received: (nullmailer pid 275907 invoked by uid 1000);
	Fri, 03 Jun 2022 14:02:58 -0000
Date: Fri, 3 Jun 2022 09:02:58 -0500
From: Rob Herring <robh@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Axe Yang <axe.yang@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>, angelogioacchino.delregno@collabora.com, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [RESEND v12 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Message-ID: <20220603140258.GB243231-robh@kernel.org>
References: <20220525015140.384-1-axe.yang@mediatek.com>
 <20220525015140.384-2-axe.yang@mediatek.com>
 <CAPDyKFr25qbAb9DdCpu6Cp9NyK35YAv745Duw_ht7BQc+pQF=A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFr25qbAb9DdCpu6Cp9NyK35YAv745Duw_ht7BQc+pQF=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_070303_853193_C954D457 
X-CRM114-Status: GOOD (  20.27  )
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

On Fri, Jun 03, 2022 at 09:28:37AM +0200, Ulf Hansson wrote:
> On Wed, 25 May 2022 at 03:51, Axe Yang <axe.yang@mediatek.com> wrote:
> >
> > Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> > This feature allow SDIO devices alarm asynchronous interrupt to host
> > even when host stop providing clock to SDIO card. An extra wakeup
> > interrupt and pinctrl states for SDIO DAT1 pin state switching are
> > required in this scenario.
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > ---
> >  .../devicetree/bindings/mmc/mtk-sd.yaml       | 50 ++++++++++++++++++-
> >  1 file changed, 49 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > index 2a2e9fa8c188..e83bf10281d6 100644
> > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > @@ -72,12 +72,27 @@ properties:
> >        - const: ahb_cg
> >
> >    interrupts:
> > -    maxItems: 1
> > +    description:
> > +      Should at least contain MSDC GIC interrupt. To support SDIO in-band wakeup, an extended
> > +      interrupt is required and be configured as wakeup source irq.
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: msdc
> > +      - const: sdio_wakeup
> >
> >    pinctrl-names:
> > +    description:
> > +      Should at least contain default and state_uhs. To support SDIO in-band wakeup, dat1 pin
> > +      will be switched between GPIO mode and SDIO DAT1 mode, state_eint and state_dat1 are
> > +      mandatory in this scenarios.
> > +    minItems: 2
> >      items:
> >        - const: default
> >        - const: state_uhs
> > +      - const: state_eint
> 
> Don't you need something along the lines of the below instead? I mean
> the "state_eint" isn't always needed, right?
> 
> oneOf:
>   - items:
>       - const: default
>       - const: state_uhs
>     - items:
>         - const: default
>         - const: state_uhs
>         - const: state_eint

This is equivalent to what was done. The 'minItems: 2' makes the 3rd 
item optional.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
