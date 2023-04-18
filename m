Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F77C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 21:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SgIob3ZbJ9A9DbSdga+gd14f2Z3RSbkiShhGJVWvl4=; b=4l/WD87Ize151KrWjwFhkIJPFe
	JEGDFmCkbomr4sipPkdNzelIEmfd/ADKwWpuV6P+LZOepKE6Ya4XX5Y5F4Qk1RJ9jQvJr91L7QljT
	cNvbanxTQByhWDe7J455Q9JKPnPoYCmxXQfgItRl2XjFMcsY4NbHe56i5tBqeLpclxEvsY7d5m7cU
	yidpetkpTA+5yDqIMxR3j+ddZ35xxJn1prpy1yN7M8x5rjk1PwA3RV5Z0RH9S3vALVo+kn7lkPMXZ
	HorlAlSykH8DkekZQB6NFbxV39XiU8dRrT18HfhJFqKv/xRYuuIJ+s0p+PWtXBAPZDP4La7PV5KRe
	h7w5ocDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1postz-003O8k-1H;
	Tue, 18 Apr 2023 21:30:15 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1postx-003O7v-0E;
	Tue, 18 Apr 2023 21:30:14 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6a5f21a0604so870622a34.2;
        Tue, 18 Apr 2023 14:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681853410; x=1684445410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SgIob3ZbJ9A9DbSdga+gd14f2Z3RSbkiShhGJVWvl4=;
        b=O/6iq87/hR2d7yZLRHHAkJDSysL6HswVTPG/VwRFTqWhnX8LRJQoQvRKfydUrj3NM7
         G0tTXHrQh+jN+CL1CSXSF80YkI//tb8pqgGGtopZMSugdZx1MGXUX4ModDZlm/ANbbpt
         59Ie5wszwk5xh3tZPOcWbj2OEjscsvZTUasxGkrEbiKO6UColu8mLNqSVyk0TW5N2ut9
         21c7wjcLG2Nc/2YiGZSxv2lJSRf3m7BciVsfNb+IMO9HTPzsj9eeLJIpmP3wxsadINbE
         wi3GcMnBqilBjEciKKSvmHUJzMe+lyLfY/w98048b9Pj3fjByZMuadsuvpu3KSSm+o1w
         hHGA==
X-Gm-Message-State: AAQBX9cMGyrKNTmfvYEI8so16LE5dLnMsvKytZ/+HQAM9Ihtxbw6uuxG
	b19TNxWpdseKtsMLntNy5A==
X-Google-Smtp-Source: AKy350aReJVaibAghZiN+VSoVRy43DPIB7GVh66FFWas1Pk9GeRCRwxzczKHwH8CDiBT6m+naiEd7w==
X-Received: by 2002:a05:6870:2191:b0:187:89c5:1eef with SMTP id l17-20020a056870219100b0018789c51eefmr1880813oae.34.1681853409910;
        Tue, 18 Apr 2023 14:30:09 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q4-20020a056870e60400b0016e49af5815sm5958219oag.51.2023.04.18.14.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 14:30:08 -0700 (PDT)
Received: (nullmailer pid 2366687 invoked by uid 1000);
	Tue, 18 Apr 2023 21:30:07 -0000
Date: Tue, 18 Apr 2023 16:30:07 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sander Vanheule <sander@svanheule.net>, Justin Chen <justinpopo6@gmail.com>, 
	Jamie Iles <jamie@jamieiles.com>, linux-mediatek@lists.infradead.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Julius Werner <jwerner@chromium.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, linux-renesas-soc@vger.kernel.org, 
	Srinivas Neeli <srinivas.neeli@xilinx.com>, linux-stm32@st-md-mailman.stormreply.com, 
	NXP Linux Team <linux-imx@nxp.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-msm@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Shawn Guo <shawnguo@kernel.org>, 
	Robert Marko <robert.marko@sartura.hr>, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-watchdog@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Kevin Hilman <khilman@baylibre.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Anson Huang <Anson.Huang@nxp.com>, 
	linux-amlogic@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Corentin Labbe <clabbe@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Fu Wei <fu.wei@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Evan Benn <evanbenn@chromium.org>
Subject: Re: [PATCH 4/6] dt-bindings: watchdog: fsl-imx7ulp-wdt: simplify
 with unevaluatedProperties
Message-ID: <168185340654.2366635.7606572133355407089.robh@kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230415095112.51257-4-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_143013_115451_06088418 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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


On Sat, 15 Apr 2023 11:51:10 +0200, Krzysztof Kozlowski wrote:
> Allow generic watchdog properties by using unevaluatedProperties: false.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


