Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEC2C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 18:54:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98AA12087C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 18:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pSx2AZpQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWf2TTe7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98AA12087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JqB5OPmhydheZfqaYuxXIUapZHrkSekP+M90amLmX+w=; b=pSx2AZpQ2fMTFzz3Fewe/J62k
	xxVYMm8/br78LritDh4iTxxgm5c2UJJu6CcnzDrpw1PiWNd+2B/ALV65vBQemCar3dDzZpZMdteZf
	Q+p/psbP7z6HDdIohQR419HYuqU7w9fGQcvAj/HBnqRK0fSHJPJqinU/bHq1Y6mNF5KMH1vYd4+e9
	++vtUtyCuilJyBs2CkhPBLbtEW8YBW6kMHusnumbj0c1mLwglWRqqwQ1arJbfC90+movH/X+fSvnU
	F74jJUjomGhHl7GdQWedgEOhTdQX1CM89PssBzAtQXVY++EsQ4QnObgCRpM5fLsqyjQZMeZpUdG71
	hq8hGVV2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGRi0-0007u9-IL; Thu, 10 Sep 2020 18:54:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGRhu-0007sr-Gx; Thu, 10 Sep 2020 18:54:07 +0000
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D9A1221E2;
 Thu, 10 Sep 2020 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599764045;
 bh=XhMR0se3B2M3cCm4dG7gM2H1njurlMTbkC88FGhIKJs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NWf2TTe71JDTV5fTFH3pnw3HOYxZ5ivZJJsDunUt35gp25A4mNzl407I2iacg6Psi
 Budl9qFpHKWvZJLdEln1WkpXuBpI3tCHQdwvnqxK5EHBixzH8JD2FeS50pKl/BJZ9Q
 oW6NJfp9FaoUigAD/y/1aDn9KN/rWfhNcmsuNGLQ=
Received: by mail-ed1-f54.google.com with SMTP id n22so7420288edt.4;
 Thu, 10 Sep 2020 11:54:05 -0700 (PDT)
X-Gm-Message-State: AOAM532oELbyl1UsuiuWGWFVQRjAG9kPz0MZCFzmTqfg+pXHHgByU+QL
 cdfs4fvc5Q23xyKwD404+vwLe7S0uTvOy3gsn0g=
X-Google-Smtp-Source: ABdhPJzxOkwjKIRJe1J7RhPZI8K0aJEHMtzOqR5F+V93515rBHAjgLIuO18iiQn+8UTlJNwgheXSwAxcmyXoMHMFYBk=
X-Received: by 2002:a05:6402:180a:: with SMTP id
 g10mr10672940edy.18.1599764043844; 
 Thu, 10 Sep 2020 11:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <20200910182814.veviax3n377undkv@akan>
In-Reply-To: <20200910182814.veviax3n377undkv@akan>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 10 Sep 2020 20:53:52 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
Message-ID: <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To: Nishanth Menon <nm@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_145406_646169_4BD221D0 
X-CRM114-Status: GOOD (  15.15  )
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
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
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

On Thu, 10 Sep 2020 at 20:28, Nishanth Menon <nm@ti.com> wrote:
>
> On 19:57-20200910, Krzysztof Kozlowski wrote:
> [...]
> > +  wakeup-source:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +
> > +patternProperties:
> > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
>
> I wonder if "hog" is too generic and might clash with "something-hog" in
> the future?

This pattern is already used in
Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml. It will
match only children and so far it did not find any other nodes in ARM
and ARM64 dts. I don't expect clashes. Also the question is then - if
one adds a child of GPIO expander named "foobar-hog" and it is not a
GPIO hog, then what is it?

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
