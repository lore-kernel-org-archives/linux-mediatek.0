Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2B6C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 06:52:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB809221ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 06:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l8AHG+1c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkCscqbJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB809221ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MSE6pGlUDGsIRdmJGurnjwa/h//FUq5AzRomhEgGo2c=; b=l8AHG+1c+g/HvW1+wuSUnWQ8t
	MRYMa/B36v5fJXDk1/+gP2KwKb3J9eIe51d8LydMQmPQifWnd0YcUv14QfsiVo2G4jMq2xSdpbG8W
	mR/8m/SYzcOXjJyGRON9ibE1afBYJmdr4WouNN/Qrf1D9kQ5HXilsvQX8XaxuYwkTbIEhuEBx0lDj
	2Alskr7TLWNJfxOu+28FbJz2Ig0a0WJuVWTzspU5fj2NcSl7tQWpMHaaLUbqMms3AYLbvx70h4LzC
	MrSr2v40pMejen+ayTfo0nikR2BP32O36GtvqEv1yHG0SgSLVpBiCwnfU9vi/oEWYeji+KByW5pxn
	luVBguqvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGcv0-0000Ep-7U; Fri, 11 Sep 2020 06:52:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGcuu-0000DA-W2; Fri, 11 Sep 2020 06:52:17 +0000
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D03922225;
 Fri, 11 Sep 2020 06:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599807135;
 bh=PvPqMWHR4rTZyg0mx7guwNSzHx2gYCEab6A1OsvoQGs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dkCscqbJ3BxxdnaZ/s6BEfah6323j4W+ukH0h4kgXUSZBGSjPNCszgETLQuOlSPY+
 hHHXjPeIlp/SzfcWA71QsgsxVyqpB3JKnaxx/jDzyjpc1piRf3TCeZ52f9cJLoW0M9
 h+RhyvvwFCHIqbOUMC6NMBXmO6EsGTjTqgCsKeBo=
Received: by mail-ej1-f42.google.com with SMTP id gr14so12358180ejb.1;
 Thu, 10 Sep 2020 23:52:15 -0700 (PDT)
X-Gm-Message-State: AOAM533OxeKLIZjoRNdd6yLtADr84eThW6ONVaxlMZ8hO3G7u6kzHkT6
 pxOuPD3+RYXIIvJQlbKf286IpewSSOZWnWK2bBU=
X-Google-Smtp-Source: ABdhPJyQsp18R1aO6xomXKrS4P4TBW8oLLN/MwZ/kE/MYbR5zlnBByW56Q9pS5gbWiZx5BgY7fQIaaEpv0zAcIPIrGc=
X-Received: by 2002:a17:906:4046:: with SMTP id
 y6mr722021ejj.148.1599807133943; 
 Thu, 10 Sep 2020 23:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
In-Reply-To: <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 11 Sep 2020 08:52:01 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
Message-ID: <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To: Joel Stanley <joel@jms.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_025217_157948_4EA72553 
X-CRM114-Status: GOOD (  20.75  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-renesas-soc@vger.kernel.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 11 Sep 2020 at 08:24, Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 10 Sep 2020 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> > schema.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> > +patternProperties:
> > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> > +    type: object
> > +    properties:
> > +      gpio-hog: true
> > +      gpios: true
> > +      input: true
> > +      output-high: true
> > +      output-low: true
> > +      line-name: true
> > +
> > +    required:
> > +      - gpio-hog
> > +      - gpios
> > +
>
> > +            usb3-sata-sel-hog {
> > +                gpio-hog;
> > +                gpios = <4 GPIO_ACTIVE_HIGH>;
> > +                output-low;
> > +                line-name = "usb3_sata_sel";
>
> I would prefer we didn't require the addition of hte -hog prefix. It's
> mostly just a matter of taste, but I can think of a few more concrete
> reasons:
>
> We don't require -high or -low prefixes, so the node name doesn't need
> to describe the properties that will be found below.

Thanks for the comments.

It is not about properties (high or low) but the role of a device
node. The node names should represent a generic class of device (ePAPR
and device tree spec) and "hog" is such class.

The Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml already
uses such naming so the best would be to unify.

>
> Changing around node names for existing boards carries with it the
> chance of userspace breakage (as sysfs paths change). I would prefer
> we avoid that if possible.

The impact on userspace is indeed important, but are you sure that
hogs are visible to user-space via sysfs and configurable? I guess you
think of deprecated CONFIG_GPIO_SYSFS?

Rob,
Any hints from you about hog-naming?

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
