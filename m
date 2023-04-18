Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ED6C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 21:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FTQgI3HTIujYCvmdGvbn1iYHKKTz5bkM55o7VU7wfs=; b=Gw76kbU10z8KOWMrxJphDqA5nQ
	joxrIDZJti/93TafWSKNWWmH1xqVYQ6qpJb9bKwkjy6vWbwvK/rsdMC0BhXIsrUPj1eZjBIE3vZoX
	nLc0qPJC2SRGOqTfbjsLM9BrHd/HroeORMeEA2K0xjkiBJA4ByKGvKN45nl/kG9eTcyDcy0QtklCE
	wM9hc+yL4KPCEirQ004Z2femTP4GQAAec4ltrNMMB0pyrIiSKJ2WpWgOsX5XMd/GzpqBfMFbcRRQ+
	NB/IZAdFg/AMSgU57K2r+eKVdIs2eXONwut+NnmTj3PciDNL3qVfd3uj3IV7rnHrRkgXll4V6lNjf
	97u8+K9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pot39-003Pug-1O;
	Tue, 18 Apr 2023 21:39:43 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pot35-003PsL-2a;
	Tue, 18 Apr 2023 21:39:40 +0000
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-38c6bbbeeb3so456174b6e.1;
        Tue, 18 Apr 2023 14:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681853976; x=1684445976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FTQgI3HTIujYCvmdGvbn1iYHKKTz5bkM55o7VU7wfs=;
        b=VrNl+2Xr+uLyBzfLHjZmXGaBbt7mfH9AghmxOXw7YnTOgYom8FiJHTzfcZrK6jp1XY
         eR5uaFRQFADqfr8zTTp/QjWgtvtZhRamzENBDvCH/J6U+2r2Th5NMaxqoRyPRFFRYFlC
         AWMBi9KP57vwEnKqSDwFNpNCiZYzwlY/mpNMfs3aCQdwQXBoqJupfbbsZiNI9ehTPQpn
         ZZE1cPqtb4Y6pQ1wSE6mE4RmM+PZ7anFnTF5dLbETbpyVU/ktDl5L2DLLAZYuN695cTJ
         E5R/zdZJCyJKCKLxBqEuDtHsi4X+DyM/uPN7+VeTa5visik7ER1JsXRpj0ZDXbdatIVZ
         64bg==
X-Gm-Message-State: AAQBX9dy86RqaxtYBmGnuEBngxY5YTpUBv3jlIjz1A12ms45lpRuOTjn
	TerWwAci+UqRfW+P0xVkuQ==
X-Google-Smtp-Source: AKy350ad1gFJziMA7uFDXKgRYHOImiDLZc2+2kux8SA8FrsvhCP7QU7dcKoZR+twA7gAQFYNGfgJUA==
X-Received: by 2002:aca:644:0:b0:378:2df5:49f5 with SMTP id 65-20020aca0644000000b003782df549f5mr1944858oig.2.1681853974837;
        Tue, 18 Apr 2023 14:39:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n3-20020aca2403000000b0038bffe1332dsm3950756oic.57.2023.04.18.14.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 14:39:31 -0700 (PDT)
Received: (nullmailer pid 2376874 invoked by uid 1000);
	Tue, 18 Apr 2023 21:39:29 -0000
Date: Tue, 18 Apr 2023 16:39:29 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Andy Gross <agross@kernel.org>, 
	linux-watchdog@vger.kernel.org, Fu Wei <fu.wei@linaro.org>, 
	Jamie Iles <jamie@jamieiles.com>, linux-renesas-soc@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-stm32@st-md-mailman.stormreply.com, Shawn Guo <shawnguo@kernel.org>, 
	linux-amlogic@lists.infradead.org, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, 
	Julius Werner <jwerner@chromium.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Robert Marko <robert.marko@sartura.hr>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh+dt@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Fabio Estevam <festevam@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Justin Chen <justinpopo6@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Guenter Roeck <linux@roeck-us.net>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-mediatek@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Evan Benn <evanbenn@chromium.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Srinivas Neeli <srinivas.neeli@xilinx.com>, 
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anson Huang <Anson.Huang@nxp.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Corentin Labbe <clabbe@baylibre.com>, Sander Vanheule <sander@svanheule.net>
Subject: Re: [PATCH 6/6] dt-bindings: watchdog: realtek,otto-wdt: simplify
 requiring interrupt-names
Message-ID: <168185396909.2376821.8732982905359058158.robh@kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_143939_838026_758CD6EE 
X-CRM114-Status: GOOD (  11.69  )
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


On Sat, 15 Apr 2023 11:51:12 +0200, Krzysztof Kozlowski wrote:
> Required properties should be listed in "required:" block.  Since
> interrupts are already there, the dependency of interrupt-names on the
> interrupts can be simplified.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/realtek,otto-wdt.yaml        | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


