Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984ECC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 19:57:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3605B20809
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 19:57:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wc8PmRua"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3605B20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I2M7UPspDWdWGsb5tVO7vC+ZKXtUQyLBzN9wxvB99ME=; b=Wc8PmRuaVDLyy0iB3NAihuKVR
	G54u++O7J1cMzoBw1jqmTD1DPao6wHAPD+na7mJTuZQHf7eL6QA8ZZ7tSelWQaEsEoGih3Mo66j25
	X8m2IyR22zVi3rPcNJv1K4LvN+9lgx6/8xj0dbjrVMWOiFfoeWqxElz8GLLZ0FX9WbXOFYCtG2XDb
	152ubYYSrEtkUNBgKe12RGI5/hfyDQ8hIfeYNm+RnOKcnHde8+T7iSYAZYgxXN1eJhQwzMS3+T2CJ
	Ahm6fmEQ43upLZ7rwzPKzztyWMUOz+38gDQzaoRRLPZYstlgYT3vkPPEsYEMhSthDnvqYzP7q0Eth
	j7bmRvahw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIH4d-0006Da-M7; Tue, 15 Sep 2020 19:57:07 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIH4Y-0006Bw-6h; Tue, 15 Sep 2020 19:57:03 +0000
Received: by mail-io1-f68.google.com with SMTP id z13so5510216iom.8;
 Tue, 15 Sep 2020 12:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fnB3WXd3CVX86l4oOXnRMqvub51IFEMuC66CQlN98to=;
 b=It0L4Dm9vhOP+kowySFFSleUNAZP2D0XTAKlr8EdjSl04jX4SNxHeIx2XY5T7z2TzU
 Hh+O+qAvAMovsHCaocMznls4Lc2oFmrfb6HcHeDZkxhCpLptegzUuEpcrDmsV+R4Y/R4
 UADnkEcsJxUBE3q9AvdWoePtDlQt8Iwl+I7S81xFIkhjkTyuZnIkXcH5CKhKBbyTDjOw
 fsVpWNuIdlDCTem9pQUXICas2MVBjD2XMjRgdmUt6XNuve7yl/Byhssgs8EP2QTAqPsa
 dF8YnKSaEPJMcsxCktnmghp10w9P+fK5lqHOYKNKfV7M0zchksBD3Z+OXJKEvxoM0BrR
 pJcg==
X-Gm-Message-State: AOAM530sjOW+kMXPcec6qK9WuS6rrdE6bSo1607dFHNvY53k00mxB2Lv
 AZ9gjtvCxRSV987Mb8bD4g==
X-Google-Smtp-Source: ABdhPJyXC7MAHBd+l614l66gdacLiXXbyiJ4NpMgA0JFmeY2XbfsqSS7arJJq3e+Rj2HINzyPMBI/w==
X-Received: by 2002:a05:6602:15c5:: with SMTP id
 f5mr15689559iow.42.1600199821359; 
 Tue, 15 Sep 2020 12:57:01 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 64sm8345119iob.36.2020.09.15.12.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 12:57:00 -0700 (PDT)
Received: (nullmailer pid 2403540 invoked by uid 1000);
 Tue, 15 Sep 2020 19:56:56 -0000
Date: Tue, 15 Sep 2020 13:56:56 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200915195656.GB2385241@bogus>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
 <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
 <c162b6ad-57f1-a75a-11e3-9c80c60bd845@ti.com>
 <CACRpkdbrrzkYVW13V89PJ5_WRGhxSL0rOxAHA_7hYSyw28Shvg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdbrrzkYVW13V89PJ5_WRGhxSL0rOxAHA_7hYSyw28Shvg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_155702_287679_FB7EF516 
X-CRM114-Status: GOOD (  16.05  )
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
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree <devicetree@vger.kernel.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Jason Cooper <jason@lakedaemon.net>, Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Sep 12, 2020 at 12:07:59PM +0200, Linus Walleij wrote:
> On Fri, Sep 11, 2020 at 11:54 AM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> 
> > More over, there is already generic schema for gpio hogs: gpio-hog.yaml
> 
> Where is this? I don't have it in my GPIO devel branch for sure, and
> it is not in linux-next either so not in Bartosz' tree.

https://github.com/devicetree-org/dt-schema/tree/master/schemas/gpio

> 
> I did suggest that I want a gpio-common.yaml file which includes the
> hogs.

Already there, but not wired together ATM.

> > Originally, gpio bindings were defined without restricting gpio hog node names and,
> > generic schema follows this.

Originally, almost all node names were a free-for-all even for classes 
defined 20 years ago. Now the names are getting enforced.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
