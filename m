Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1971C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 15:48:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7081C21741
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 15:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BIjapk6B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7081C21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MRHdCUyiHbsnfq4ZwQv/Uy96DrzpQpiXHcNXQg+zwt4=; b=BIjapk6BO5DNEvkxmO7FFzzQ3
	7YO5ToPcaDMhu+vxNgo/qDqjU1IlGmNgBwJPj/5yLh5r7vZVuylA+5jzoJjDsV2m9j9aO1+OlpUrZ
	sIPqB38OMRidm1z5qMsIBvuV6IfsLJqO6avIHmbgGFE9NUV9uqJEimJzfwgdSf7CWLXPsSGTKACcL
	WgyvBPwMB0k+DpCXsn50hVMbha0gZcB9KbH6S4oY8XQooiF6SLWlUZGIl4qa8j2f+mUSQJ8J67prI
	QbxNzPrRLp2gzxXD58fCAbcVp34bNq4mvRvT5QCna/AyzS3zwAm/Kakk4nMAoPdI7qVO/vvFZCoaZ
	zB1yMKpfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLpxH-0002mX-39; Fri, 25 Sep 2020 15:48:15 +0000
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLpxC-0002lR-TM; Fri, 25 Sep 2020 15:48:11 +0000
Received: by mail-wr1-f67.google.com with SMTP id c18so4087593wrm.9;
 Fri, 25 Sep 2020 08:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7Qh5+ZRjYoXTfTyMdsphNx4+wbs2iln0Dg7bJktrLac=;
 b=ACGvgGCAmNAwJXi68zxLXpOSnX1E/GnKynBgvCozGIBucRSGhcN+sp/T0ooW9vBYno
 DZ2wKSdhMWB65qnBknQJV4C6wPOhrrLvPLQVuLMrcR9YH9JnewRANGiOHNIQB/a4f/oy
 s6VU5OJlkuluGNsi7jzpQcqbO2Hd9X+T+DHzNDK15Gm/CMwb70b3OVHRR4KLueS9sV61
 J+Un/1BhEHpnm1xT8O1KAvJT/ANnMFuln/RCex66R/pm/2uLI1L7u9lK5VP1qejlI1qU
 wzhRwAvvcDhOZpQ7b/mL6bWX5ZdC8WG+K/9mHeZRqwsiKuUhuD1hDSAJoCyJkvfu51fe
 X0pA==
X-Gm-Message-State: AOAM531G4KUab6pu18abgczONAe0edDif9bjJ5h5aJud7A357NgI+qlC
 ccjmKFkmRVSbc5VFrr0si50=
X-Google-Smtp-Source: ABdhPJw0NxnpCAb54EdTsCUv1oA2JhAAx01jYuFmqouNOz5V/9GWfo7kcmF2Z8f+IMYVxGIHsAi2tA==
X-Received: by 2002:adf:f082:: with SMTP id n2mr5158088wro.35.1601048889557;
 Fri, 25 Sep 2020 08:48:09 -0700 (PDT)
Received: from kozik-lap ([194.230.155.132])
 by smtp.googlemail.com with ESMTPSA id k8sm3477035wma.16.2020.09.25.08.48.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 25 Sep 2020 08:48:08 -0700 (PDT)
Date: Fri, 25 Sep 2020 17:48:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200925154804.GB16392@kozik-lap>
References: <20200916155715.21009-1-krzk@kernel.org>
 <20200916155715.21009-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916155715.21009-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_114810_955955_E00C7992 
X-CRM114-Status: GOOD (  15.72  )
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

On Wed, Sep 16, 2020 at 05:57:01PM +0200, Krzysztof Kozlowski wrote:
> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Add Rob's review tag
> 
> Changes since v1:
> 1. Use additionalProperties.
> 2. Add wakeup-source.
> 3. Add hogs.
> 4. Extend example with hogs.
> ---
>  .../devicetree/bindings/gpio/gpio-pca953x.txt |  90 ----------
>  .../bindings/gpio/gpio-pca95xx.yaml           | 166 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   4 -
>  3 files changed, 166 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml

Hi Linus,

The first two patches (bindings) have Rob's ack/review. Could you pick
them via GPIO tree?

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
