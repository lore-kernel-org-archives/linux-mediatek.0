Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA523C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 21:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yT4GcMjbrel2c9kDi9IQ9tl5o6MfO8exlHC9/eKTb0=; b=Md+7K+XKFBfg+ChEeuWtdKR1Hl
	0Me2WaPoaCfJh3PO+2BxBgcceuS8itrTexilXn49eNRSuOqcS+atBjpBhJi32rmFLphl+WdEPsFSZ
	pQWrcbo+c+UcHYtMbOjRtqoYWR9Y1gLBtdV0S3xH7dZVON45isa7nTBdgddjNJKhf588p7/mRoTpT
	9j5bY5SZpjfVCQAJmjHqT8d8qjBh6g7ZK2XVFvfZPP4gfsJkCHjEqJFFCszsTHoVUjoX4czWm5EPq
	rOUfW+tnJih5ECNved2ImcPJyIii85KaNcfakT3oLwF0N+Lyu3xhbO4BztE3cF0AC5gzAdoNEztT3
	zXEvDoiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pospU-003NZa-00;
	Tue, 18 Apr 2023 21:25:36 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pospQ-003NVt-16;
	Tue, 18 Apr 2023 21:25:33 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-546de76c250so638839eaf.3;
        Tue, 18 Apr 2023 14:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681853130; x=1684445130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yT4GcMjbrel2c9kDi9IQ9tl5o6MfO8exlHC9/eKTb0=;
        b=ii1JfRvSX1YdzQEjEHLSrpN6p8JG667cpufPKp332VtynFJ2vMoioGr/5l1lIbyH7F
         aWpgy33MaYChDeAr/9dvNQ9iBFIaC0hZD+cqmWXUmD0n7VG2ae1HFR840nG+8T00aSWu
         qxHqRioWC1RXz7h5WUA6BGICo9PaIjvRMdhfwtFxpxBtiYNPfOVSl9iZdhB4i+ZQx4HX
         BEk4xkR4781Qi74R0PbdaXXMW8uztfUViedgze74hc7uSiGySLM2421OHPhCRZHI7ihg
         0Nydf1nV5tBd/tdqhaOs8wfmMOtdHN5MdM76yJi9Q6XV414qUzRHao+4AEMRm3GPQhEJ
         4Lxw==
X-Gm-Message-State: AAQBX9dSe9UFBa83LftmSAG110Yl/t1ymo9y1tfLkIdji8seak813y25
	jQXyKsbJzODFu/fvVBJTzw==
X-Google-Smtp-Source: AKy350bJbf7E4XDwA3/8131dQDn0lBGN26VByKnBFlDX2ebpKxcur0FYvrpyn2ImyGuSOquucrCuNQ==
X-Received: by 2002:a05:6808:ab7:b0:38c:17a7:5b80 with SMTP id r23-20020a0568080ab700b0038c17a75b80mr1621062oij.37.1681853130221;
        Tue, 18 Apr 2023 14:25:30 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v124-20020a4a5a82000000b0051ffe0fe11bsm6369196ooa.6.2023.04.18.14.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 14:25:29 -0700 (PDT)
Received: (nullmailer pid 2361549 invoked by uid 1000);
	Tue, 18 Apr 2023 21:25:27 -0000
Date: Tue, 18 Apr 2023 16:25:27 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Srinivas Neeli <srinivas.neeli@xilinx.com>, 
	Kevin Hilman <khilman@baylibre.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Robert Marko <robert.marko@sartura.hr>, 
	Corentin Labbe <clabbe@baylibre.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
	NXP Linux Team <linux-imx@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Eugen Hristev <eugen.hristev@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Andy Gross <agross@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, linux-amlogic@lists.infradead.org, 
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Jamie Iles <jamie@jamieiles.com>, Evan Benn <evanbenn@chromium.org>, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sander Vanheule <sander@svanheule.net>, 
	Fu Wei <fu.wei@linaro.org>, linux-watchdog@vger.kernel.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, devicetree@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Justin Chen <justinpopo6@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/6] dt-bindings: watchdog: indentation, quotes and
 white-space cleanup
Message-ID: <168185312747.2361485.10895999899602826593.robh@kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_142532_380538_43D50368 
X-CRM114-Status: GOOD (  10.62  )
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


On Sat, 15 Apr 2023 11:51:08 +0200, Krzysztof Kozlowski wrote:
> Minor cleanup without functional impact:
> 1. Indent DTS examples to preferred four-spaces (more readable for DTS),
> 2. Drop unneeded quotes,
> 3. Add/drop blank lines to make the code readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../watchdog/amlogic,meson-gxbb-wdt.yaml      | 10 +++---
>  .../bindings/watchdog/arm,sbsa-gwdt.yaml      |  1 -
>  .../bindings/watchdog/arm,twd-wdt.yaml        |  6 ++--
>  .../bindings/watchdog/arm-smc-wdt.yaml        |  7 ++--
>  .../bindings/watchdog/atmel,sama5d4-wdt.yaml  | 14 ++++----
>  .../bindings/watchdog/brcm,bcm7038-wdt.yaml   |  6 ++--
>  .../bindings/watchdog/faraday,ftwdt010.yaml   | 16 +++++-----
>  .../watchdog/mediatek,mt7621-wdt.yaml         |  6 ++--
>  .../bindings/watchdog/qcom-wdt.yaml           | 32 +++++++++----------
>  .../bindings/watchdog/renesas,wdt.yaml        | 14 ++++----
>  .../bindings/watchdog/snps,dw-wdt.yaml        | 32 +++++++++----------
>  .../bindings/watchdog/st,stm32-iwdg.yaml      | 10 +++---
>  .../watchdog/xlnx,xps-timebase-wdt.yaml       | 12 +++----
>  13 files changed, 83 insertions(+), 83 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


