Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6640C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 11:39:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F4A321775
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 11:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipQKB6UG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F4A321775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dcQlxxUaejrzrRBPaYdH+Defcfr5cxKLxLG6k94Hm68=; b=ipQKB6UG82wRiGPA9Ei7PgXTe
	0HFlFI56y73m9nI6ReLT3N+hkHpJadVgBkQt4FM2Af6LiLidqu2Aqj7DmjV7D7l4AP7IzSBHt9ild
	/cossiQNh8uQxBsa73fRwZCwpROX/71O0HpYzvHnkmNH8Gps2t+O6pJsvoYR566yW02awruKJs6F1
	McKQBCwiVuDVCURbkfoWZ7bU+0UAU+pnBX7hO7Xmy99stWYIk3F7tliRsMD6aj6Nub+4LP5gx0d5+
	1jTLm/M+SR/AJxjqILzAKf6cgEQf9FK7/96dmYJ8q4qUTKXMsrl3apqvYFeWQ0VUtkkkcw83BOAN8
	Pkb7bmg7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLm4U-0006tV-Dp; Fri, 25 Sep 2020 11:39:26 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLm44-0006k9-Me; Fri, 25 Sep 2020 11:39:06 +0000
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 802E18106;
 Fri, 25 Sep 2020 11:38:58 +0000 (UTC)
Date: Fri, 25 Sep 2020 14:38:52 +0300
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 10/15] ARM: dts: am3874: iceboard: fix GPIO expander
 reset GPIOs
Message-ID: <20200925113852.GL9471@atomide.com>
References: <20200916155715.21009-1-krzk@kernel.org>
 <20200916155715.21009-11-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916155715.21009-11-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_073900_884329_68ABCDDD 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, Fabio Estevam <festevam@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

* Krzysztof Kozlowski <krzk@kernel.org> [200916 18:58]:
> Correct the property for reset GPIOs of the GPIO expander.

Picking up this too thanks.

Tony

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
