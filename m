Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B0CC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 20:00:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02DA02067C
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 20:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oGJeuJWZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02DA02067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hwhVOu3/kay6EfbkP8LWtR/slm1qv3993gQuYVweRxw=; b=oGJeuJWZ9dMcE/AlmXTWibkmb
	2U8XFYUmMOL9tHpE8nhHtjNj73kg9kTY93PS2oTYpiiUBDzHBayK5YhpC/SZG/vQSCE0I4dzPIIZE
	H7O0FndEpbHMz4Z2y0U2TKBJMPLTQok2QASDZPs7sEe5tNiE4LSsYDUZEiGFMrrripQWL3RKIXppI
	ROU5riyMJgyYxNTZJeiZKk+ICFAsCsiD7B9HKsHw2adSz2yra2FgaFfhNWYmmbt8u747Y693Elw+a
	KGSFgHRZkWqUtotAVfSTD+Vvehdsy+7MaZOtlazILXc2J1vuy3O7g8GFrholvgTVx7IjoGr9jQBjj
	b0RL4AY4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIH85-0007Fh-IJ; Tue, 15 Sep 2020 20:00:41 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIH83-0007EN-9M; Tue, 15 Sep 2020 20:00:40 +0000
Received: by mail-io1-f67.google.com with SMTP id y74so5478462iof.12;
 Tue, 15 Sep 2020 13:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L7om6RUUpmy9Tp9WTJ6hem3a68ltpv04YXLuQ+XuUpg=;
 b=Vk7rprRZE1FWtdC9qelOrhfPXTYNYZYRVz04HiakSr/hDw70x9s8aucPyLSGcav4oh
 Z4uiHuqVn8UoO/SYw+naxLlpEq0FCHt4Ix9IcjkXsgvUUvAePE94NvqKArMqOuc+4aR5
 8SPusIGZ3bZFUoyHCAb10jDDuUO0BfM4JSglp+yLMmrFuC5gOTsodtDKMKLdFAYUYoDm
 zYaHEc1kelQxaWSmouMOxtufQIp8GwVjPFoyDd8SkQyPnZYSLVXu5QfjawYoSHLYtLHP
 qA1hR1mrUGzZnG84aOSE/9E5ESvisDJX10KI1a5nK6km/5hEjCqH1KrXXQFIeFm3XL6g
 mq3w==
X-Gm-Message-State: AOAM5321NkVX1Ot2ddpI6RSBprhWqzpJ+LiFPcBbOmgc+mtOhjczRxG7
 0MQj3ePWS7UWQ6baIcM9BQ==
X-Google-Smtp-Source: ABdhPJyJashEW2xOKvfkZqHZZXucxwlHXqNC9JTw65ZlLFsAeTHaT5GzkbPEe9aLJArEiug2L8iMqA==
X-Received: by 2002:a6b:590c:: with SMTP id n12mr17087310iob.25.1600200038094; 
 Tue, 15 Sep 2020 13:00:38 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id d71sm9595617ill.52.2020.09.15.13.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 13:00:37 -0700 (PDT)
Received: (nullmailer pid 2409290 invoked by uid 1000);
 Tue, 15 Sep 2020 20:00:32 -0000
Date: Tue, 15 Sep 2020 14:00:32 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 02/15] dt-bindings: gpio: convert bindings for Maxim
 MAX732x family to dtschema
Message-ID: <20200915200032.GA2409250@bogus>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910175733.11046-3-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_160039_356013_78A88FB7 
X-CRM114-Status: GOOD (  13.63  )
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
 linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Jason Cooper <jason@lakedaemon.net>, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 10 Sep 2020 19:57:20 +0200, Krzysztof Kozlowski wrote:
> Convert the Maxim MAX732x family of GPIO expanders bindings to device
> tree schema by merging it with existing PCA95xx schema.  These are quite
> similar so merging reduces duplication.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/gpio/gpio-max732x.txt | 58 ---------------
>  .../bindings/gpio/gpio-pca95xx.yaml           | 72 ++++++++++++++++++-
>  2 files changed, 70 insertions(+), 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max732x.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
