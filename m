Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6379DC77B70
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyjNSXbSbvchuNpv4jAZLgScGa4n3ChSV8F0bi/nRak=; b=bphxrMKBHUa0C25HpnaVep8l4j
	AKJcrpyBph/rS8M652R+47593J3Mti7L1566fguBfqm1TuG553oLGqcp6M6ruVt8yHLj9P0NP1XrF
	WordaZxOAD5+GXOXFJn4gtG/ie9pZ9j6yxlm51PL3cnCurTWYIOlY4GDXPrIpCgrot5rbenOcJx5O
	m9Q/L9Iy8NriTeXG/h+8AsD8co/leGtc/QQXB2yEk7el5sXI3Lydb7rSrP1lO+VU0cwSuMdNomV5a
	GDQLEYN659DJ7rNxE5litsoofICT3O+7/iTkLojZ5SJPWFO8Lu6jV7BIA28fCONMvVzlePl1l9ehs
	YU3pMWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poKqx-00FTSg-1s;
	Mon, 17 Apr 2023 09:08:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poKqr-00FTR8-1p;
	Mon, 17 Apr 2023 09:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681722525; x=1713258525;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=m8aASMkvQM9MGebrTwvix2EO5nQR6qeGOss5wQyHKgw=;
  b=U09Ubh9uJNrDoLTYHw1qI+Z3M3bMA3VZfrUVyhprMWdphQKuKMqSApEs
   tyLu0ZuegKHOPL2ZjRC8+VTImpYqndcyzqYCwB3HPj5bMh30lR2J8UyTb
   9BAp5oAzDKj2As3DhPqship+rN4CwYcl2T7AJLv+BZIy44WhsCaF3fEOJ
   pPiFujQ3C6S55S0O8BFFU/RGqEUNRA6uC60TfzCoTMUj9vpEo8J4dt2Q/
   b4DOPGrEvyy0X/g5MGSykZNcnsDOLMRx7r4sI0ktXa3sSktsqOFb2nL0A
   6YmDSvttJXjc4UYpXL/OUnA42XQ07g1XZdmWGGk7ISRkGI+hq/+vLknMD
   w==;
X-IronPort-AV: E=Sophos;i="5.99,203,1677567600"; 
   d="scan'208";a="147374424"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Apr 2023 02:08:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Apr 2023 02:08:37 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Apr 2023 02:08:28 -0700
Message-ID: <8a76d193-7a01-9ec5-40e8-65fcb039f708@microchip.com>
Date: Mon, 17 Apr 2023 11:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/6] dt-bindings: watchdog: indentation, quotes and
 white-space cleanup
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konrad.dybcio@linaro.org>, Sander Vanheule <sander@svanheule.net>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Nobuhiro Iwamatsu
	<nobuhiro1.iwamatsu@toshiba.co.jp>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Fu Wei
	<fu.wei@linaro.org>, Viresh Kumar <vireshk@kernel.org>, Eugen Hristev
	<eugen.hristev@collabora.com>, Justin Chen <justinpopo6@gmail.com>,
	=?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, Linus Walleij
	<linus.walleij@linaro.org>, Corentin Labbe <clabbe@baylibre.com>, Anson Huang
	<Anson.Huang@nxp.com>, Robert Marko <robert.marko@sartura.hr>, "Sergio
 Paracuellos" <sergio.paracuellos@gmail.com>, Sai Prakash Ranjan
	<quic_saipraka@quicinc.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jamie Iles <jamie@jamieiles.com>, Yannick Fertre
	<yannick.fertre@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@xilinx.com>, Srinivas Neeli <srinivas.neeli@xilinx.com>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-renesas-soc@vger.kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_020845_761315_EBF85479 
X-CRM114-Status: UNSURE (   7.34  )
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

On 15/04/2023 at 11:51, Krzysztof Kozlowski wrote:
> Minor cleanup without functional impact:
> 1. Indent DTS examples to preferred four-spaces (more readable for DTS),
> 2. Drop unneeded quotes,
> 3. Add/drop blank lines to make the code readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[..]

>   .../bindings/watchdog/atmel,sama5d4-wdt.yaml  | 14 ++++----

[..]

For Microchip:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Krzysztof, best regards,
   Nicolas

-- 
Nicolas Ferre


