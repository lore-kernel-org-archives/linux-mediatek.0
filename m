Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50457C7619A
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Apr 2023 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c07ixhDHpQnBulkQZ2Nw0JwAr36rnVLPuwgUhNxAuT8=; b=Cquq4hOO/9nzpHbIDoc8oy06vy
	YObqqcBC5u1XPBACnJwWl/pzHDWVeJveWzO7BOtIhtR2FxQcR56jgLwZ+u3/GTpQRuyIgS37bewaq
	tTacji3sVXyNDHxprDwS9XhmKTIUdm3RKHDdf9N1+WZBTHbPKwP2wqs223BAlRifvBjQ4JFBtKBXV
	awd3Wb//ZL9dTbakAL7mzEjO48cuGzMOBQ594I1CsYnm/UBEQirVrPVxmjJir1y2+5h6r5Zh4ONDK
	3X+d447gBJ863X4tXS3p2QBcBFWNBjbGabgJUu3h0f1Q1yr/5KLd1vXB/HrOA/yCNRgp/rNAh91eR
	O3R5Y5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnj4O-00CUEm-35;
	Sat, 15 Apr 2023 16:48:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnj4K-00CUDM-3B;
	Sat, 15 Apr 2023 16:48:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id kc3so4380249plb.6;
        Sat, 15 Apr 2023 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681577287; x=1684169287;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c07ixhDHpQnBulkQZ2Nw0JwAr36rnVLPuwgUhNxAuT8=;
        b=VAm7lLW2qbtDmFHkaygXoNVicYRA7IQ6GgoHgPsyCQNfa+OPX88B/mb3fyqCdcZYlB
         Qb6vBWg9yf0V1FZ1UQn8AGxwQkqUXoHNh66IZq4PycRZbyKno5D9WgQs5jpy9jFw2OXy
         ce4dYeMqFtLPPcZeThBJekZ6hAAsuKU1TctgtzHrqbIhKsI2kAQJ4q4Gs3G6ONvGbrWK
         Ne6ZQXeA5MJrTDw9XVhAgoii6otPIhbaurxAW8ahIEkNhLiakjovuK/CPOrgqQXhSbEn
         qRGynIgdugnm3uE6whko3Q6+snSfYAMf2eC7Dp6jXGfBroLZjjfXXrZ1Yl9zLi2CHTyD
         LS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681577287; x=1684169287;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c07ixhDHpQnBulkQZ2Nw0JwAr36rnVLPuwgUhNxAuT8=;
        b=aWdMZJy+bmEtNXttRi6zQxi7goiQAC7Fw4jlJ6ZD5Vwf7ppCmqHobBfkaAkq5DtrH4
         l9uqeyyLcavbh80aCj/WRuef9Z0bNHeSamPEmC/07m+MHc3PmfjbyXfXmFQey7Y7kj1r
         rGcIB4Kb2JsJ1NLxqsABt6jSf2SualMC/rtlLvueB7DsupVR57ofyyFVBzBcv8KDLa8g
         ktjhnMxevWfDYSP3hQfi0b1nQviBP04j3bPx+6BAoajZ4B1IGHLCujYigwFftQF3Kmeu
         fcU8bNtQ5ufMVD8djx9cC3UNN6xA1808zu+2IdVKGkctXDN41+IoMKXETcwkraGGddga
         d0/g==
X-Gm-Message-State: AAQBX9dyiYNcYn9uCYuRPxu2OLtQsk0GxyZGVfKDVvWPJ13rR+YqCbFx
	WIiU2ZhHlEAOYHCJ3jTgwMI=
X-Google-Smtp-Source: AKy350asRVcaBN4vEj52+Al3i6LdhYun2dQh4zNs0zIu8tfWua87lcM2Lbo7pD9ZdRNAVxvnTiBCow==
X-Received: by 2002:a17:90a:f409:b0:247:900:12db with SMTP id ch9-20020a17090af40900b00247090012dbmr9261041pjb.24.1681577286671;
        Sat, 15 Apr 2023 09:48:06 -0700 (PDT)
Received: from [192.168.86.135] ([136.52.74.64])
        by smtp.gmail.com with ESMTPSA id r11-20020a65498b000000b004e28be19d1csm4492195pgs.32.2023.04.15.09.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 09:48:06 -0700 (PDT)
Message-ID: <f059c09d-b9a4-d86b-e4bb-1aea096263f2@gmail.com>
Date: Sat, 15 Apr 2023 09:48:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/6] dt-bindings: watchdog: indentation, quotes and
 white-space cleanup
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 Sander Vanheule <sander@svanheule.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Fu Wei <fu.wei@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Eugen Hristev <eugen.hristev@collabora.com>, =?UTF-8?B?77+9ZWNraQ==?=
 <rafal@milecki.pl>, Linus Walleij <linus.walleij@linaro.org>,
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
 <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
From: Justin Chen <justinpopo6@gmail.com>
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_094809_049334_60FF3649 
X-CRM114-Status: UNSURE (   7.59  )
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

On 4/15/2023 2:51 AM, Krzysztof Kozlowski wrote:
> Minor cleanup without functional impact:
> 1. Indent DTS examples to preferred four-spaces (more readable for DTS),
> 2. Drop unneeded quotes,
> 3. Add/drop blank lines to make the code readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/watchdog/brcm,bcm7038-wdt.yaml   |  6 ++--

Acked-by: Justin Chen <justinpopo6@gmail.com>

Justin


