Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F132C61DCB
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 14:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BQwW3MX7INivSrsHmDm9zXMIwP0LHR3yDP5aFEwWB4=; b=TLyLJvinnZvuEzbePosBGosy1l
	3MGheG5tlO1+REDwlBpBTfvrznx3VHfhY0rH8DrZF4hoU77kJp965/bzJOYaTv/cc8WiF0DFor0Bp
	88i4TrBVIqZIulSf3sY92L2rGmHyHhBu74mWj+YOVMFV1Vi+8LWHism0Dn/i8ovD+R8R2XL1X1VLe
	x4bQ65Y9lI3OuWvTkPqyzoXpG4bxy+iDrsHIoadCZnfFSi9SiEQeTg+P9J27PyjDaCW9uNQFp5ZZo
	xMW7xNrMVINYf70WTARxOaudp5nniYovX8Z0/gnSXOkhLJDpkDchf/CunxyUcy+RcVeSsoSLNPVXW
	cM7y+6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxeI-00000005zvV-0Fm1;
	Fri, 28 Aug 2026 14:33:42 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxeF-00000005zuq-3Fo0
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 14:33:40 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-39266382df6so1117622a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 07:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787927618; x=1788532418; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7BQwW3MX7INivSrsHmDm9zXMIwP0LHR3yDP5aFEwWB4=;
        b=W7qqW3iKirp2kWLB4VtUOCMjkIVpoDM2leZSfRje2X7FVtJIMgIrPrl/TPJ+aHJCfX
         M9B2y0qOu2qtvWr/EUPl9T04mcDiKH2vsu+BpNDMFKDkhqdShm0ZFkaitTr9JOjf3Rmc
         uyQ9yHhoYCs5oZFuPhH0dSW+ebH2Og2NxxjOmxYM+hXlbhaa0BCi55v2gOqGAe2Xne+j
         c5QU5TRDMQP3HLpezahQKKO+BvXkSLTj5070uYO8LVkEbMXdRIvcA6exU6qKH4UDeSYe
         iRcT1m0CBIz6Y0zh0R6ryko/mt9lDUO2E9ZhJbdrZUljIXJq3fKmwmKqk8C0LHRXTpvR
         lrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927618; x=1788532418;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BQwW3MX7INivSrsHmDm9zXMIwP0LHR3yDP5aFEwWB4=;
        b=ZGjRl6Zd1aNVO3wcN6mEYwCTrupmI8g/osr05LHBoJqOgunmU5JaBwt5rT0/fVDuJX
         WiskD3YPX6hjBL5p2auLOZVyYEUI9j5U7O5UtWSd5GprbHmZTE5IwrlbKsHG8vSxMhuO
         M2GeV+c25CxMpxHyyicX+HwJGYVchj7Lhkv7wqoKdkZqZogqlmY0NGuSy+S0sXXToyCO
         50tRK0aSggT1cYjeLEl04r/u7RWB7hoOCUgm+JRfHK43fvetZnEjnR5sqavBPwUez+UN
         rT+zja08M2OBftXtE+wqUEu+wqISqsDLJuRrNIrfzQFrCP60sW8znLu1HYJrM6r45Rfn
         NvXg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2KjUvE0yUDPSpmrygTde52QKOUBNNRHDd81l6vpWTjAQU+6SmPxI+MvmuXluU8ddZWluO6NmesZJu9jg+Sw==@lists.infradead.org
X-Gm-Message-State: AFuF++lN1vWsCklOouPvH9y48I3W4nypWqI2vDfbuHbnfBEiHIOPu8UQ
	SCvOWFEJ3tB7VMtqoG823VYT+1fp54MQ9ZIsEg7A1TeAahxe0QI3Zv8n
X-Gm-Gg: AR+sD11vaGho5orl+BzH0Grnx+mHGhWJQrCitghrme3aVrjV/GdPyw84lYEFg8vlmHo
	yek9R8jErUue0kFrZnRmMrN9sZ7FPZ2SYlg2jHBvCHooGMnfIo33tWEf4+ZsAnHV5DmADFdSn4c
	Ox3P+WT+/9kKxXwvkOyyqGjn2yzj0Ihs+eb9zqZryetezPme19MNAFJBh4uwYnLaYhpp5CE9hFL
	O8KlxIaOCM0iRAw4gJYSMCi+NAycsPGlrk6WcvPKHPS6VIu894Us41MOAVlYa3ZXmH7vHBioEUa
	xk+GOZTtY721hVJF/HFR5S/kYYfZAmWTiaxgrLhE62xakJVMqaXK1B9OXVUDe6PufEfaOUq+c0h
	rYOKDv2+c7teXe3m29PbhvO6kRjmwoTcToC86z0wQBSf+5NQao/G6s19XkNsZX7dYhPsAm0a2bp
	K3wxtctmxLCBNXMiDUi1AkFTJw4eKg3udLjY/bDnOrZLZKumwtgpZau6ip3Mite+6OUO1DPRvH+
	g+02WYVIA==
X-Received: by 2002:a17:90a:d2c6:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-396d0f6cb36mr15006187a91.11.1787927617279;
        Fri, 28 Aug 2026 07:33:37 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([157.51.225.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda36ed6sm2793476a91.2.2026.08.28.07.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:33:36 -0700 (PDT)
Date: Fri, 28 Aug 2026 18:33:28 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
Message-ID: <apGcOAUpb6XZ2Iud@DESKTOP-TIT0J8O.localdomain>
References: <cover.1786262697.git.naseefkm@gmail.com>
 <7e6150b186c2d16820d7382bce065596a0854a47.1786262697.git.naseefkm@gmail.com>
 <20260828-adorable-bug-from-arcadia-fcad00@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828-adorable-bug-from-arcadia-fcad00@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_073339_818922_04BC83EA 
X-CRM114-Status: GOOD (  18.39  )
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

On Fri, Aug 28, 2026 at 08:59:57AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Aug 09, 2026 at 12:04:59PM +0400, Ahmed Naseef wrote:
> > +maintainers:
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +
> > +description:
> > +  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
> > +  IP with the Airoha pin controllers, but its IOMUX and pin configuration
> > +  registers have a different layout.
> > +
> > +properties:
> > +  compatible:
> > +    const: econet,en7528-pinctrl
> > +
> > +  airoha,chip-scu:
> > +    description: phandle to the chip SCU syscon
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> 
> If the entire address space is part of the SCU, then this device should
> be part of the SCU, e.g. its subnode.

It is not: the registers are split over two blocks. The GPIO, interrupt
and PWM flash-mode registers are in the block the node sits under, and
the IOMUX and pin configuration registers are in the SCU. Both are
needed, so whichever of the two is the parent, the other one has to come
in by phandle.

> 
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 2
> > +
> > +allOf:
> 
> This goes to the end of the file, before the additionalProperties.
> 
Will address in v2.

> > +  - $ref: pinctrl.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - airoha,chip-scu
> > +  - interrupts
> > +  - gpio-controller
> > +  - gpio-ranges
> > +  - "#gpio-cells"
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +patternProperties:
> > +  '-pins$':
> > +    type: object
> 
> "patternProperties" should follow "properties"
> 

Will address in v2.

Thanks for the review!

Ahmed
> > +
> > +    patternProperties:
> > +      '^mux(-|$)':
> > +        type: object
> > +
> > +        description:
> > +          pinmux configuration nodes.
> > +
> > +        $ref: /schemas/pinctrl/pinmux-node.yaml
> > +
> > +        properties:
> > +          function:
> > +            description:
> > +              A string containing the name of the function to mux to the group.
> > +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
> > +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
> > +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]
> 
> Best regards,
> Krzysztof

