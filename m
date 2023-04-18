Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F73AC6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 21:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbWVwRDoV9I2kcGoqtOHA4AoHy2tf9k4WaGcKcFo53w=; b=L1SXGzrQPF5sjnuMY7pYifPp0e
	zOF27BNjV1POXSAHv22j3a1FiEIkpnYOQjF8VWR/H9oB0IZqQAX9uUkkaPoxvWfmfsI3fKr3b7hZu
	/ka3Q1svLG1RwdM5kZazgMEmZNrGhqM4ZM9CCRSg6NO4u9LLkvkrGFq9cxN+mmTXYagFicMtbIhPM
	ks3gtX+mcdCQpXobChwY3BW7bVVrCQ6zN+28ZlM2VUG6W3i3QFAY+Rv/5wrb+4r6+gSuFbydrOs5K
	1DoSSPgKJuvPhP5ZsfkxNJY41HyyREWYwul54ulyKNAqTF7DEOXiwgrLIpUmb1Y7caqr/qqs0bsvP
	V9HeJvzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pot0d-003OzY-1Y;
	Tue, 18 Apr 2023 21:37:07 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pot0a-003Oy4-1f;
	Tue, 18 Apr 2023 21:37:05 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6a5f8e1f6d1so484649a34.0;
        Tue, 18 Apr 2023 14:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681853821; x=1684445821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbWVwRDoV9I2kcGoqtOHA4AoHy2tf9k4WaGcKcFo53w=;
        b=FWq7EYMjYlRd1gO2TwLBWMnB2faIbgS6wZx2CWehQFLkIt/XoYSUGZtX0KWbpLNH4B
         ZB5O180my69AKcukWFcKWfFTjR4akTX1gRNPMFkqZLJs9R15UjjsJ73M3WjulnKCa8N2
         oKOwJq4ayLDY6Z99yYJmPPdbrB4RQ8Kh3ZtZBXMP312sxB0GfFrEar/oqAVzwOO3BogB
         NPrsQR3jB7xSY2I2vlSOf/NOd40mTRUQBiFrZnnfUJFUtQohqsEOg60C8QTDihxscPXk
         8DueKVtusSRn+ziPRHvcjRHOcbOPBGSEWIfE5G4opl+QgDfdTSZ8jDSIABT97/NzzyJ7
         lB7Q==
X-Gm-Message-State: AAQBX9fGgjUbyyYfjUpU3p+y2nGwVhR4R46R4kQmDMWVMrCZXM1TOpqO
	mrSf50N0SLwiGT2uDAN9UQ==
X-Google-Smtp-Source: AKy350ajzlK+Nfe2WjS2CiPYlhzjq0hQUI8vA59pqj48sqD1cxE9cnAHbFCnFTn8iDnot1Luwh/ZcQ==
X-Received: by 2002:a9d:69d3:0:b0:6a6:598:b915 with SMTP id v19-20020a9d69d3000000b006a60598b915mr833018oto.8.1681853821579;
        Tue, 18 Apr 2023 14:37:01 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b6-20020a9d7546000000b006a2ce5f3641sm6000241otl.8.2023.04.18.14.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 14:37:00 -0700 (PDT)
Received: (nullmailer pid 2374252 invoked by uid 1000);
	Tue, 18 Apr 2023 21:36:58 -0000
Date: Tue, 18 Apr 2023 16:36:58 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Eugen Hristev <eugen.hristev@collabora.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	linux-watchdog@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Jamie Iles <jamie@jamieiles.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Shawn Guo <shawnguo@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Julius Werner <jwerner@chromium.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, linux-stm32@st-md-mailman.stormreply.com, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Robert Marko <robert.marko@sartura.hr>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Justin Chen <justinpopo6@gmail.com>, 
	Corentin Labbe <clabbe@baylibre.com>, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, 
	Kevin Hilman <khilman@baylibre.com>, Srinivas Neeli <srinivas.neeli@xilinx.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-amlogic@lists.infradead.org, 
	Evan Benn <evanbenn@chromium.org>, linux-mediatek@lists.infradead.org, 
	Sander Vanheule <sander@svanheule.net>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Fu Wei <fu.wei@linaro.org>, Andy Gross <agross@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 5/6] dt-bindings: watchdog: toshiba,visconti-wdt:
 simplify with unevaluatedProperties
Message-ID: <168185381738.2374180.14119161072449587074.robh@kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230415095112.51257-5-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_143704_553551_FD7F7D8B 
X-CRM114-Status: GOOD (  10.23  )
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


On Sat, 15 Apr 2023 11:51:11 +0200, Krzysztof Kozlowski wrote:
> Allow generic watchdog properties by using unevaluatedProperties: false.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml    | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


