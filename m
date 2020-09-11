Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A72DC43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 06:55:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2E18221EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 06:55:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ap7S5Q/7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiQ0HGMp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2E18221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5EPAFqcqns3RFMZVlI6W2TggsML8DK59bkklzVs9DEk=; b=ap7S5Q/7KFNZ4Ar1UA2jCz6YK
	Uoa9DO54wfimQEyzuQGOct/XdpPY6CkXwArQcNJcFgMst5nAgv8n/CSTsbxDKL4hQVPk372mztDMI
	yS36X4S0on5UfWb+4JrdE3pDla8bQzZKZcUkBFJBQ3HhUiezEtAjcw/mjbGkGQ/HFzskfpGCWiFgc
	0IrZChzS4EjBX8vQgAvOBSY48d3HTWbEByjTFLDTFhKkLcYlhaFk0uDCkeOAfS+elvvCNURO61Ab8
	AhcAKjEkQ74ET9bZ7d5Qtm1xVe4ywq1V0JjaITUr7fp3wffdFG02MfceFtgIP0jpBwZsV7HDD2vDc
	lQJUZHXiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGcxX-0000jC-SF; Fri, 11 Sep 2020 06:54:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGcxT-0000hw-Ua; Fri, 11 Sep 2020 06:54:56 +0000
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F394022206;
 Fri, 11 Sep 2020 06:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599807295;
 bh=LYU8Tb5GMA6mmuFbZxVtsFi/egUHKAmHaWZZIbnXOvo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JiQ0HGMpnHYgpuekKtUf+8YvvWXHzJEvW2KhxPV1s5oG+08DzzajE6E5TXHZ0XXAn
 GD28lSc5mGYQpc+tH2JXNbqpTqYfAtLUFNTrchaT69hRx45fzt/oWcj542xAqWz2U6
 +nsbHt0tt1JmvAU8oVP2XU3yOLPlFIHlOTX7QtZ4=
Received: by mail-ej1-f51.google.com with SMTP id u21so12336881eja.2;
 Thu, 10 Sep 2020 23:54:54 -0700 (PDT)
X-Gm-Message-State: AOAM532OgF73gyUxyrjSHbmczC3ktxomhOeJWS/Nu5Nlhn0vlcDKHAAS
 MkzNkpk+J8YI69e3sfkDR9lUM4nAQiSZzIIOOLs=
X-Google-Smtp-Source: ABdhPJwFL/7j5w+fjQzCHgD8gJxiV9FGUB6o363qCx8Mfmt5a32puUoIjMf+DBJD/BgaOz8YT/NIs5ONHQziHSJrLOA=
X-Received: by 2002:a17:906:4046:: with SMTP id
 y6mr730092ejj.148.1599807293350; 
 Thu, 10 Sep 2020 23:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <20200910182814.veviax3n377undkv@akan>
 <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
 <CAMuHMdVG6+BsTUxb4wcAwj1WK982S0k2RCxmb3x9gsOS2TphNw@mail.gmail.com>
In-Reply-To: <CAMuHMdVG6+BsTUxb4wcAwj1WK982S0k2RCxmb3x9gsOS2TphNw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 11 Sep 2020 08:54:40 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcSUY6aqvix7R0YkzQL9Mze9O8jrWLLxKoRyjHTRhrYLA@mail.gmail.com>
Message-ID: <CAJKOXPcSUY6aqvix7R0YkzQL9Mze9O8jrWLLxKoRyjHTRhrYLA@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_025456_148568_B9AB2F88 
X-CRM114-Status: GOOD (  22.80  )
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
 Michal Simek <michal.simek@xilinx.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 11 Sep 2020 at 08:42, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Krzysztof,
>
> On Thu, Sep 10, 2020 at 8:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Thu, 10 Sep 2020 at 20:28, Nishanth Menon <nm@ti.com> wrote:
> > > On 19:57-20200910, Krzysztof Kozlowski wrote:
> > > [...]
> > > > +  wakeup-source:
> > > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > > +
> > > > +patternProperties:
> > > > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> > >
> > > I wonder if "hog" is too generic and might clash with "something-hog" in
> > > the future?
> >
> > This pattern is already used in
> > Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml. It will
> > match only children and so far it did not find any other nodes in ARM
> > and ARM64 dts. I don't expect clashes. Also the question is then - if
> > one adds a child of GPIO expander named "foobar-hog" and it is not a
> > GPIO hog, then what is it?
>
> Perhaps you didn't find any other nodes as children of pca953x
> controllers?

There shouldn't be.. unless one makes some i2c-gpio controller under
such GPIO expander. But now it wouldn't be instantiated as expander is
not a bus.

> There are other hog nodes in other types of GPIO controllers. Typically
> they're named after the purpose, e.g. "wifi-disable", "i2c3_mux_oe_n",
> "pcie_sata_switch", "lcd0_mux".
>
> IMHO it's a hog if it contains a "gpio-hog" property, regardless of node
> naming.

Yes. The question is then whether to expect the "hog" in name. Just
like we expect for all other device nodes to represent the class.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
