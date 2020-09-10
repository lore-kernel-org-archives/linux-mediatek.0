Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E79C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 18:02:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5357420C09
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 18:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CJUtHuR6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5357420C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itavF/yIdJBt/7cVN2KB57BV1skkM+8DspM9SJKzeRM=; b=CJUtHuR6tQWq/+3nDA7YRnbc1B
	6jmqWVZ8GBh163hCtuaFrb3qXp2pozkFmEO+tkRuzwgf946EpqFQDjxH40y3cABH5Zo+DSHGWhJeb
	lENDIG86f4FdiNUCqjP+dDhY/RNGXUYcNM6FWDAQ3CS5Uw4MxeCSo7nMz6sdLRv8/uZU08VSVG0mw
	hlsQV/jJtfFCP4ezvdfJKpYCxOT8gDPEZtrZn4twDWdspe8K4E4QPOUnGL2mAjqkjPKDtEHebUu8f
	bFFZ2+Pvvejx7qu7tmVswy0D1AOKeBkvK6rmW9wx0Jwyp7FoPmvNWxJ4iHr3ICMjHANUhkpkZlQH+
	bc9JBu3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGQuC-00056z-0N; Thu, 10 Sep 2020 18:02:44 +0000
Received: from mail-ej1-f66.google.com ([209.85.218.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGQtD-0004Ox-RZ; Thu, 10 Sep 2020 18:01:46 +0000
Received: by mail-ej1-f66.google.com with SMTP id gr14so10092599ejb.1;
 Thu, 10 Sep 2020 11:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vzlILYYSQksxsWvenp+0BQ/ZzGG+3vsuxeefhQwKuys=;
 b=gNC6u9KhaIuSWNVohbwbtJ0bv//Id1BRZr2Io2ObNUt/+s0+UbXnfNzoK/ClywQuEx
 SpJiusi3zHxvZxah/DJv5DfymVTyfO0lo7c5uDP60oe02B3J1tXttkAyDo+pWQKL6osK
 XzHJR+gtOa6SSysv9egl/ZmBUJEIYBvEBjZJVmz3jhUgdAU13FC7JVey4z+QwTKrwwKQ
 SVe4nMTcDY4WVdFvAwucW2bfkzc7MBFaX/ePMeBAS/WRLgnLJ289Ppyfo4naGgTHTWpx
 xChl4shLoYY/d6bzMrSQY4ZbqLIrxFrvihGhB6Zl3wai0VKFBqsbiPnqnUJ0di+7kHRz
 f2WQ==
X-Gm-Message-State: AOAM5339CEzNoHKhkeDTYGyj0zCakUV5ayE3GA53nEwaCEKl55tUmqXV
 bkNoHIgTu7PzxtWX4u3ztYs=
X-Google-Smtp-Source: ABdhPJwT6JbyXfUrGZCRSOFBx+boMTdYFSDTFrULKEN0eqYHOZ15ua7zgfpIH84oBBIKMt8Sze2wOQ==
X-Received: by 2002:a17:906:a4b:: with SMTP id
 x11mr10673914ejf.368.1599760899958; 
 Thu, 10 Sep 2020 11:01:39 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
 by smtp.googlemail.com with ESMTPSA id 1sm7839797ejn.50.2020.09.10.11.01.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Sep 2020 11:01:38 -0700 (PDT)
Date: Thu, 10 Sep 2020 20:01:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 Nishanth Menon <nm@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 08/15] ARM: dts: am335x: lxm: fix PCA9539 GPIO
 expander properties
Message-ID: <20200910180135.GA11154@kozik-lap>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-9-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910175733.11046-9-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_140143_964260_906DAE46 
X-CRM114-Status: GOOD (  12.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 07:57:26PM +0200, Krzysztof Kozlowski wrote:
> The PCA9539 GPIO expander requires GPIO controller properties to operate
> properly.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I forgot to add here Ack from v1:
Acked-by: Tony Lindgren <tony@atomide.com>

Tony,

I think it should go through sub-architecture maintainers, not as entire
series.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
