Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F14C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 19:48:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0705E2078D
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 19:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AtnXG94W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0705E2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lFgIMkl/2s2deyVHgy7aOn4255sjPovIETdeX8omwKw=; b=AtnXG94Ww08AFLxhsXogzb3+C
	KX3nN4Cp4mP9bCKj/Zpa7Cw36rGnzKc5Bo7xnfxWdWiq3Tt73TeDWtJ8j38VcpBGi27KP+IoBBfiW
	aEtlfyrVw7X1T3HutWjDrwdq54LyWUdeUJZwVLgpHx4ERB4aGl82DskC8HHBUE5Stdf5t2BQcg7ks
	UNGXBkb3gnN8I0ydSeOE5sKLJorYRcxiaMfKyvX03mdl8snTWndu9eJXCuMxSoNReBmo9wG2miHEG
	5u8zG9R/2powl4XeZwQ1tQibh/n1jmbzWfKcxe8ksS33ksmMUaN5jRd7iRbQ26fGveExEFjnZ0x+9
	/cAnJYjPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIGve-0004Kn-Bq; Tue, 15 Sep 2020 19:47:50 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIGvY-0004Ig-RU; Tue, 15 Sep 2020 19:47:46 +0000
Received: by mail-il1-f195.google.com with SMTP id x2so4220344ilm.0;
 Tue, 15 Sep 2020 12:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vlMe/O0KpaLLn52vRtI2d+InOdmPVFJgxviIiqo487k=;
 b=kHmH5rFnbeP9QI+L36T8D2A47PvTOaDqXjmclgP/Zz0UlQyuVg9OhdUxBM90xuxJcL
 DIPaqyxrE/AeYmaxwKcRxQT8Cf/jTSJ4nfxGNuCuYJKZh8ebhRltTadmMLY+C2jdk/gh
 jkxoyHVO8aprsGYQcJExp7XNR0BiA3g5btlEkuQFmX5qwt376N6nx3YR95a2m0yDFoR5
 +ZAMd++W15nkZWBQGMIsnBkeKBzGzsCdQQzWTPJGpZ0d9rn/o2KspjPdjsXx3XoYRlbQ
 412Vxnd4uM8HAeD0tOwIRxBihM90zig45FEKg3DEOgew4CJcOOh9/F+rRiPZ8lTq90Kx
 Ofiw==
X-Gm-Message-State: AOAM532KBPcBnVn2a+6XhRhs8lvSrj3mMLpPZWx7gZo1QQ0pbBPYO4KK
 JgXop6MrbTyo80TmJv9g5Q==
X-Google-Smtp-Source: ABdhPJyJBucL9yXLzWld+N7C06O44ALNqm0DtTmTngrhGguRJncbPkgBRf60HAkVwNDjrR37f44klQ==
X-Received: by 2002:a92:6901:: with SMTP id e1mr17859827ilc.209.1600199263981; 
 Tue, 15 Sep 2020 12:47:43 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m15sm7972824iow.9.2020.09.15.12.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 12:47:43 -0700 (PDT)
Received: (nullmailer pid 2389041 invoked by uid 1000);
 Tue, 15 Sep 2020 19:47:40 -0000
Date: Tue, 15 Sep 2020 13:47:40 -0600
From: Rob Herring <robh@kernel.org>
To: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200915194740.GA2385241@bogus>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <20200910182814.veviax3n377undkv@akan>
 <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
 <20200910191305.phjtijx2fhkhqavu@akan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910191305.phjtijx2fhkhqavu@akan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_154744_945196_6CEFE387 
X-CRM114-Status: GOOD (  20.72  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-renesas-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 02:13:05PM -0500, Nishanth Menon wrote:
> On 20:53-20200910, Krzysztof Kozlowski wrote:
> > On Thu, 10 Sep 2020 at 20:28, Nishanth Menon <nm@ti.com> wrote:
> > >
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
> Probably a nitpick.. but then,.. I have'nt seen us depend on hierarchy
> for uniqueness of naming.. we choose for example "bus" no matter where
> in the hierarchy it falls in, as long it is a bus.. etc.. same argument
> holds good for properties as well.. "gpio-hog;" is kinda redundant if
> you think of it for a compatible that is already gpio ;)..
> 
> I did'nt mean to de-rail the discussion, but was curious what the DT
> maintainers think..

Not really a fan of gpio-hog binding to have another type of hog nor can 
I imagine what that would be.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
