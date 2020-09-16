Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC78C43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 06:15:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BDEB2065E
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 06:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tyrLnRWX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BDEB2065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8M9AxPduv5lTzSR/BitvUjQ6NibXwlgtmI2939DhPCk=; b=tyrLnRWX72TOb+5BH2NAAazxr
	ngRFC/k62Z9QLwT4k58ofrJE7DTmGOpx0rgFu0O7Z2SffsuhTIFp8ovVDiNT38kWMjDMEOgHU8b9G
	C23L/R5uYfUYXsiFmEJzd+ymZjbfWtYVHUXy8XnrRNZMUy7rMMPvqtO7kB/+JEv7wb/DRpv3t+RJH
	vXWscvUnm7lLjKecGhgGluG2batdEhnt3oAPsuOKJOtZDrtwYTAFkDmEQwYEP+aaCsVllrGYFPPW+
	R7ofBC1VqIVzdCzqODFVF8GAx3GKiZ3QTraNk9s1/N99OrZh7aSN0Emlmj4CPMwgOIPi244mC8CDU
	Gt30fPzzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIQix-000519-8G; Wed, 16 Sep 2020 06:15:23 +0000
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIQit-0004zF-0E; Wed, 16 Sep 2020 06:15:19 +0000
Received: by mail-wm1-f65.google.com with SMTP id l9so1638240wme.3;
 Tue, 15 Sep 2020 23:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1Uh7Ou5BUk6cJr1eeO8uTrFUHXPcK3jWLNCgC2OA24Q=;
 b=X7WxKOHkH6POjB23p8LtdK2aeASjjDTQJHe+2zIAgj/8Mb3ydmOMcFBW9jGtP0sUX/
 gveYtt6D7u6WjMRJBMnw4xLGy2ugSahccUNtbANjkQBTihrCiIxptnLKRCNRJxDvkkI4
 8IjJxwCjWdOCTuPqIXluZU9zuAcynnFbJktLRiVixOVufe3R5vAGni+GplRfwdw93zmn
 4MKvPKm3BbFJQW3GND+HwgAjfthsBvv2DWuo+8oK/iB4biULio7h29MChIB6IT8oLFuL
 T0maJCWUZJ8TeTPLPklRuQzADHZi5bvsHZ1aw5TinFRysuR7iQIjTQHoos2fkcFhL1WX
 3exQ==
X-Gm-Message-State: AOAM531cfU/hhZFruhZtIt9AowMJQ9Q/tcG58+Ys5Fh9fodt+FdkYDFb
 Usohkk5l8J0zApuCBe7eSEI=
X-Google-Smtp-Source: ABdhPJw7nNn+CFhmnzt169e4rqB2CZP7AUPFZ9UBjFZbfGui7iEULE8AHLZ3m9ra4r8Pv7DiLjNGnw==
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr2849155wml.121.1600236916238; 
 Tue, 15 Sep 2020 23:15:16 -0700 (PDT)
Received: from kozik-lap ([194.230.155.124])
 by smtp.googlemail.com with ESMTPSA id u126sm4022642wmu.9.2020.09.15.23.15.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Sep 2020 23:15:15 -0700 (PDT)
Date: Wed, 16 Sep 2020 08:15:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/15] dt-bindings: gpio: convert bindings for Maxim
 MAX732x family to dtschema
Message-ID: <20200916061511.GA5719@kozik-lap>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-3-krzk@kernel.org>
 <CACRpkdZXu2J4z=1j-syxSbz2x-QiLeTBpwHSOVNfmZ31RgM6Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZXu2J4z=1j-syxSbz2x-QiLeTBpwHSOVNfmZ31RgM6Ng@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_021519_097180_AE0EDCC6 
X-CRM114-Status: GOOD (  16.36  )
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
 Michal Simek <michal.simek@xilinx.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
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

On Sat, Sep 12, 2020 at 11:58:22AM +0200, Linus Walleij wrote:
> On Thu, Sep 10, 2020 at 7:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > Convert the Maxim MAX732x family of GPIO expanders bindings to device
> > tree schema by merging it with existing PCA95xx schema.  These are quite
> > similar so merging reduces duplication.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Can I just apply this one patch to the GPIO tree?

No, this requires the previous one (1/15) because it merges the max732x
into pca95xx.

Although now Rob reviewed both so you can pick them up.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
