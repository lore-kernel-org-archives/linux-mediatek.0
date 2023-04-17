Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C455C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 06:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJzj86LhSJdAtbDEWAVBqUw/9fJfGhViwtTg9bTQuwI=; b=fq7excpxAR7iUV32W65JmtHFmS
	LJ517k1neLcT+53Dn73T3aYbcR72wCizP5cyej9u4Hx135ZpE1NGcOh1mXYbMIv0jYU7tyYJ011yU
	UDXYXeXhCuXbG9W63K2zkkZY5FkqdvVUa93PdB+ZOLdBS+U99M9afWl+nVvXOLrNieqSbZ6ygipr/
	u6lM+gQJYFaCQTXbmyhgcP3AUSLw7LaNJm1bt6pBbH9X1oXOPymdf2iYc/Q8AMN17Yh0GtHBVwMTY
	RaER0fiECUx9R1dYL3n30tf5IQTCpNPEDEj9YiJjf6MPhA0Cqblw5iQFkmthASO/B1inj+U71qokY
	rP1N2oZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poIDm-00F22R-23;
	Mon, 17 Apr 2023 06:20:14 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poIDj-00F1zV-0S
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Apr 2023 06:20:13 +0000
Received: by mail-ej1-x632.google.com with SMTP id c9so22367265ejz.1
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Apr 2023 23:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681712407; x=1684304407;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cJzj86LhSJdAtbDEWAVBqUw/9fJfGhViwtTg9bTQuwI=;
        b=UwxNUHi1Q2SgXqIq3683UkBdctv5eKKX4T6cw2UjfsXc5YW6Z3PBE6NlPjLW6oVX8G
         kwN3WLBuMU05G6+iRNYz4AZAV6bHlfUVNFqrywbO0pBt8oD6KYzVcHpeWoGmx1hDTw2Z
         KDBCiGit5JahQBASnL1rzyGRy43I70DwwKGxJ2LI1rlRjLOC+s/4sO1GLMxjvOkb1b/T
         5+39CQS1xToB6e9McpvQoD7TYUklpGa9WnUh/ubH/roqVLknUgjocOXkSxqtFtXXR0PP
         dC31xa56ppER0VHU4Dpk+mo3NIAVMs1Nf0+pr4opnCQ2wUQ7Noh4n4hLAjs8xQFRm2bX
         ct0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681712407; x=1684304407;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJzj86LhSJdAtbDEWAVBqUw/9fJfGhViwtTg9bTQuwI=;
        b=c9hD4Csfp/21MNoT9glOkABMfMQrJ+3JTe1a49IlVZd9eeTo9LNKHNCu/z9+qmMt+5
         kLdGbV/Z0ZPIr2GDvQYE8asCDc8giGHr9SQPjV3yyQf+xiYrnfNoV+eaqsAeOsl28pOX
         wRl6a9rqdexrKg8SMTXe/a5Ydcz4kzk2Jp5mCxDe9wcrbKEsbNTPnZpQMybLi9JQZtwz
         YoijMwczO/X260WU3lbY4SWiBRNSZXTHT9PMj7Yp93h0aQPv8PxyQIsMj2ycKASAMQyT
         rQbJxY9L5FdQin/QW9FOJfiO88/omiAMkmBGlpfpz86yOVk5Ewki0P0trZye/iUqj5+I
         rVFg==
X-Gm-Message-State: AAQBX9eEqD8pYhybtldmPaOCpLKHSZ8ClzTJrASjKMAL/C8afV51pC/5
	rZvgwQrGRu/aX+tDDUnXr80r/Q==
X-Google-Smtp-Source: AKy350b8SXOaVHs71B0PzryL6gYZwUkAWF9/MWVAL9BYOIq7rQp8WPjgG4lUStlvKPn23FMl4BQA3g==
X-Received: by 2002:a17:907:a08d:b0:94f:8f37:d4e with SMTP id hu13-20020a170907a08d00b0094f8f370d4emr707144ejc.65.1681712407414;
        Sun, 16 Apr 2023 23:20:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b0ac:4d3b:966c:b33d? ([2a02:810d:15c0:828:b0ac:4d3b:966c:b33d])
        by smtp.gmail.com with ESMTPSA id s15-20020a1709060c0f00b0094ca077c985sm6072788ejf.213.2023.04.16.23.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 23:20:06 -0700 (PDT)
Message-ID: <9edfca01-4191-8eca-32c6-c95f7c7601ae@linaro.org>
Date: Mon, 17 Apr 2023 08:20:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/6] dt-bindings: watchdog: realtek,otto-wdt: simplify
 requiring interrupt-names
Content-Language: en-US
To: Sander Vanheule <sander@svanheule.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Fu Wei <fu.wei@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Justin Chen <justinpopo6@gmail.com>, ?ecki <rafal@milecki.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>, Anson Huang <Anson.Huang@nxp.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jamie Iles <jamie@jamieiles.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Srinivas Neeli <srinivas.neeli@xilinx.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
 <75148300a158ceb0f86043535b089838e1d1bb61.camel@svanheule.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <75148300a158ceb0f86043535b089838e1d1bb61.camel@svanheule.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_232011_245123_C8909CD9 
X-CRM114-Status: GOOD (  11.97  )
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

On 16/04/2023 21:00, Sander Vanheule wrote:
> Hi Krzysztof,
> 
> On Sat, 2023-04-15 at 11:51 +0200, Krzysztof Kozlowski wrote:
>> Required properties should be listed in "required:" block.  Since
>> interrupts are already there, the dependency of interrupt-names on the
>> interrupts can be simplified.
> 
> Maybe I'm not reading this right, but isn't the dependency stated in the binding
> "interrupts requires interrupt-names to be present"? resource-names.txt
> describes the reverse dependency ("interrupt-names is only meaningful with an
> associated interrupts").

The interrupts are already required by the binding, so the dependency,
which makes interrupts depending on presence of interrupt-names,
effectively was making the names required.

Best regards,
Krzysztof


