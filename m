Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1516DC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 06:24:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AACF5221EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 06:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ynaQrji0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="iwxNNRSq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AACF5221EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kKxvQai+R5RSSJJsDRoyF5Ix9VP86RTkWA6ra7gRCx8=; b=ynaQrji0jbX8hM9aNtB9ch3ii
	5L50X2urUM583wrkuat1R1o0MSqyxZL3hoSkm2Vv6No4r/OtErWX4t4N3h1QjOzVj9nc6q9/SjkbD
	hU01FQL5e6i7LWX/3shp4YYDJzybje8PJ9DVs5NbfiwxWyj3feBLIqiocaEm/cFvz9kaGqWknRoBl
	jwjrF+Cqsz22QDOt6RBJaqkDgZawJN+dL1AVC8SD6j7vOVABzx4ymc0AAdytdpSBqvzVBgEWr4Hii
	w+L99E3+nkXVLfk80+46E3j7fA7vV9Q0ltCXYxsU6ETdperWzhHMH7vsas7FIIh9mlL0jv3+Oy/vu
	bmZIpKNUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGcUE-000593-HM; Fri, 11 Sep 2020 06:24:42 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGcUA-00057z-Kd; Fri, 11 Sep 2020 06:24:39 +0000
Received: by mail-ej1-x641.google.com with SMTP id i22so12239484eja.5;
 Thu, 10 Sep 2020 23:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F8q8VZI/KqEdOVJ9DW+ecexrsQ8uO8xdnTiT3lh40GY=;
 b=iwxNNRSqHQPPw7NRN3+AJDPYeet1cIe/BlZC9CmOPEmivDcmkXwVg6nAsHooODEeC8
 9EO7FQ5VufnzEfm3/j4+SKpqHNDE2sPor9HObeojQJ7mkcSDKAYX3+dgbzEnwAmX/zt5
 EgDmsRXXN/ycose+Vtdl1SotJHnNGv/5q06uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F8q8VZI/KqEdOVJ9DW+ecexrsQ8uO8xdnTiT3lh40GY=;
 b=or3IhsTHYVQVJeFjG4DSLJbtA3Zm0NFoUBCHZpVeD7AgD51uO5iKg5ikkCSJdVIctS
 +SOmJaKSeth8DzSiYV/tqHDseTyPSplrxuZRCug4JIUaPissNYm4WewKnzpWD6BjIr5V
 Nuc3MLXzOyxS0AHZCuw6hm2N5Vo71leJg47/0079PFRJcGkq6TjgqG3ZSqi6yGSWJ037
 TVlpyNx5hFAmUTur1F0SSVsl+jdCuNvboibuDsyQpzLLyhl/ZN/nOlLFQSZxSGWWjoDD
 XhAgXG3sMJfPtvYwd8paav4mV6dxUliEXgLG6ZQB6aqtz6DnO1I6ALl9grez1GSqvmR3
 HCQA==
X-Gm-Message-State: AOAM530RawmMHtbIU8WGpG7+SPt8snT18Dz7d5y1Oa4aV+I9xx6NU25j
 rbR4piu82mBN9iUkVQ5Psmm4T1yXotw66rRwwmw=
X-Google-Smtp-Source: ABdhPJwGsIFct6xD49icnIdRIUypp1dR0gXkCjgcK8V0N6s7a11zNG7uif/vfB4uystoNpvqg7tfhllyjz2DhzvlA5Y=
X-Received: by 2002:a17:906:4c58:: with SMTP id
 d24mr630416ejw.108.1599805477428; 
 Thu, 10 Sep 2020 23:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
In-Reply-To: <20200910175733.11046-2-krzk@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 06:24:25 +0000
Message-ID: <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_022438_992038_8474C2F2 
X-CRM114-Status: GOOD (  14.33  )
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

On Thu, 10 Sep 2020 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> schema.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

> +patternProperties:
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> +    type: object
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name: true
> +
> +    required:
> +      - gpio-hog
> +      - gpios
> +

> +            usb3-sata-sel-hog {
> +                gpio-hog;
> +                gpios = <4 GPIO_ACTIVE_HIGH>;
> +                output-low;
> +                line-name = "usb3_sata_sel";

I would prefer we didn't require the addition of hte -hog prefix. It's
mostly just a matter of taste, but I can think of a few more concrete
reasons:

We don't require -high or -low prefixes, so the node name doesn't need
to describe the properties that will be found below.

Changing around node names for existing boards carries with it the
chance of userspace breakage (as sysfs paths change). I would prefer
we avoid that if possible.

Cheers,

Joel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
