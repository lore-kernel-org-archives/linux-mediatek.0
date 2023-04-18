Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7215EC6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 21:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKdLQJ2WfynsAnQi4i43G4jU69vCcdQQMLvbvIaqAHQ=; b=TXqW90hQyHWpYt7nFMnx3IRtQz
	10y3nKtQUNbTcrF07OJHzBth4fZZFMi4qDjEt3+Fgq8WjEakCDBrAwN3jlBr4iWsdFIOhnYbvC9S3
	Vkg2tDWLBNC9U6IAxFx7bz5fSNZfDCtQRP3oqiIjxS0++zdLTYsKpZTPbkgYPmQUjS4zJBs0+cEMN
	0TymnlM9VvOZOO0fCE+lOvuiFWT9iiuhNkUS5Gv/cBb+hySkiXvEwMyqDBq4pR7wm1A0A3zd+hiZQ
	GsNFhdtVd1a0Jl7yihm71cDs74Z+h8xsZJ/XhpHqQ8wBqJOQFDteE7LpI80M3ya7ssZQSyO2GMF5w
	Vlfl6J2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1posnG-003NEE-0O;
	Tue, 18 Apr 2023 21:23:18 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1posnC-003NDU-1D;
	Tue, 18 Apr 2023 21:23:15 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-18777914805so6246615fac.1;
        Tue, 18 Apr 2023 14:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681852993; x=1684444993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKdLQJ2WfynsAnQi4i43G4jU69vCcdQQMLvbvIaqAHQ=;
        b=FK47f4qr2QnnRYOEfURJq09Hv86QfXF8OR7oIaas5SOADarqm3a+D4pRSlxiz3nlQj
         hweoW3PmyOA5NQh/+3SCgN9AV7fSl29CQx3+n2dw1Un6IWiZK8ctdRt9fKtVYiE0k0At
         bawqt7ivEBoZu0O004poYpCNN0UkmQWp1BQn8GDEFcw2pFOXYHf8Dn1d89RHyHIPFnN4
         CI5w1RFL3n4ZyXFJ0B8HjYQGufar7489y78kyHWXpMhKixh3TsUFJFlah3i5FVWy+Hy2
         Bwf+af0K6nSMp6KJ0VpkLbE4OstFF9DHWZWFnbH1bU0e18RPKk525BvsQgORl2a23WVG
         ysBQ==
X-Gm-Message-State: AAQBX9egG/YlUZT8fk4eW/Uy+ep1Y0pa3ycAV+8ahLyEuD3IpOfhPJ4s
	NxCBWBBvU59oZbEIRdwHHA==
X-Google-Smtp-Source: AKy350bdmvWWvs8e3IniLnnX6QWq/ARMeVjy2OYmobsGssJEfW0Lm1T3KwueQwpXlw4Lj4ZiKOdsBA==
X-Received: by 2002:aca:c256:0:b0:38e:3d5a:abb5 with SMTP id s83-20020acac256000000b0038e3d5aabb5mr114233oif.9.1681852991281;
        Tue, 18 Apr 2023 14:23:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e190-20020a4a55c7000000b0054542d3219asm3883392oob.11.2023.04.18.14.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 14:23:10 -0700 (PDT)
Received: (nullmailer pid 2358722 invoked by uid 1000);
	Tue, 18 Apr 2023 21:23:08 -0000
Date: Tue, 18 Apr 2023 16:23:08 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, 
	linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Eugen Hristev <eugen.hristev@collabora.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Robert Marko <robert.marko@sartura.hr>, 
	linux-renesas-soc@vger.kernel.org, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mediatek@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Julius Werner <jwerner@chromium.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Anson Huang <Anson.Huang@nxp.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Corentin Labbe <clabbe@baylibre.com>, Jamie Iles <jamie@jamieiles.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Evan Benn <evanbenn@chromium.org>, 
	Andy Gross <agross@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-amlogic@lists.infradead.org, Sander Vanheule <sander@svanheule.net>, 
	Justin Chen <justinpopo6@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Viresh Kumar <vireshk@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Srinivas Neeli <srinivas.neeli@xilinx.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fu Wei <fu.wei@linaro.org>, linux-watchdog@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/6] dt-bindings: watchdog: drop duplicated GPIO watchdog
 bindings
Message-ID: <168185298846.2358657.13423905325582795303.robh@kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_142314_417647_78E80029 
X-CRM114-Status: GOOD (  11.12  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Sat, 15 Apr 2023 11:51:07 +0200, Krzysztof Kozlowski wrote:
> Two conversions to DT schema of GPIO watchdog binding happened and came
> through different trees.  Merge them into one:
> 1. Combine maintainers,
> 2. Use more descriptive property descriptions and constraints from
>    gpio-wdt.yaml,
> 3. Switch to unevaluatedProperties:false, to allow generic watchdog
>    properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/watchdog/gpio-wdt.yaml           | 55 -------------------
>  .../bindings/watchdog/linux,wdt-gpio.yaml     | 17 +++++-
>  2 files changed, 15 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


