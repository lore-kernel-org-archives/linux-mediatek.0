Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55624C43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 11:09:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F178821655
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 11:09:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OpNfh4ob"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F178821655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=84nHKWi6fIVUthq/4JY3AXUkLQJQHQUs2Tw+3TLQ7X0=; b=OpNfh4obxbuEa30FhlBmhrmwK
	fvuHnlOU1cLoP5fgIXZ1Cf5eIWQ/wBxYlnpEP7FKIPMMeKIeNU2pXBvTfnp8ZagXZVeYRokm9EFdw
	N4Ex4N/FdUbaegmZv0frREiHR40IvceEmHT5SLIWtiS47GCMlkqiafnOYnY6Pdc6YvD1spHmcsJMJ
	D+15oFBBvBjwMxMaucWuIAhE3Y3MU6y/pKu5JwmydWglvAq7miSW2R1dAinp8xfnq4iVzJ/ObpXIw
	g7uFFjHrqCQ6vy4Oy7R61aj2xQHYp+M5/I3La666ynFU86YpvvLN4S9oD9Uze0uKLN6zjC8GFA7u1
	BZkTL2l1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIVJW-0003sg-Ey; Wed, 16 Sep 2020 11:09:26 +0000
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIVJR-0003qs-DH; Wed, 16 Sep 2020 11:09:22 +0000
Received: by mail-wm1-f68.google.com with SMTP id a9so2552441wmm.2;
 Wed, 16 Sep 2020 04:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wXAbzU7xs3GHOx4VbALatUig0WdQIdhicYVb4LS021Q=;
 b=ITh93RcCxuQRnoFEHo21zEcvIIeh7BJrkuMCuErj3D6qdAxSGXEm7c0IUDSPeA807q
 9SnCT2rDBdXrKgd3WyGEUm/PUiHkFzC0T3jwi2qWKv/EEhFGu4CZuuPsXdwOCNSp5uFt
 aK/Fih4ZWR53bsvSfkH2wdR1fxp2yMNX0fKEKC2JK5Lqj6Qduit30aCkjDkM7d/5uU+k
 BzAP4GR1G5CjC/e94gWU9R0EDtiZjwrUh0k05pgKnB3OuhtClTFrXTlfnAePb9fydLVI
 SL/ygtN3UyTncYFbwzMNWDstsxeoK4wEXj/Mi9s6QhQSmcr3FMfW6Hb207E7eVjxbaY5
 ugrA==
X-Gm-Message-State: AOAM531R1/RAGh+qydxqOrrvUb/yYl0a89CzYBybRQU5hAtne7Md451f
 45kWr1w/3EwpAAMTqSIywuY=
X-Google-Smtp-Source: ABdhPJz6nAcPpzE0Afvi4kc8Wd3d/N2pmOcJi2+gV9N28HTCz/M5xCuuIuDYCxyhmfn+uomSVR6/sQ==
X-Received: by 2002:a1c:152:: with SMTP id 79mr4146687wmb.90.1600254559712;
 Wed, 16 Sep 2020 04:09:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
 by smtp.googlemail.com with ESMTPSA id n2sm4944652wma.29.2020.09.16.04.09.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Sep 2020 04:09:18 -0700 (PDT)
Date: Wed, 16 Sep 2020 13:09:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/15] dt-bindings: gpio: convert bindings for Maxim
 MAX732x family to dtschema
Message-ID: <20200916110915.GA17710@kozik-lap>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-3-krzk@kernel.org>
 <CACRpkdZXu2J4z=1j-syxSbz2x-QiLeTBpwHSOVNfmZ31RgM6Ng@mail.gmail.com>
 <20200916061511.GA5719@kozik-lap>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916061511.GA5719@kozik-lap>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_070921_463147_73A11A51 
X-CRM114-Status: GOOD (  18.54  )
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

On Wed, Sep 16, 2020 at 08:15:11AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Sep 12, 2020 at 11:58:22AM +0200, Linus Walleij wrote:
> > On Thu, Sep 10, 2020 at 7:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > 
> > > Convert the Maxim MAX732x family of GPIO expanders bindings to device
> > > tree schema by merging it with existing PCA95xx schema.  These are quite
> > > similar so merging reduces duplication.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > Can I just apply this one patch to the GPIO tree?
> 
> No, this requires the previous one (1/15) because it merges the max732x
> into pca95xx.
> 
> Although now Rob reviewed both so you can pick them up.

I found now one comment from Rob so I will send a v3.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
