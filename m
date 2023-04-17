Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94580C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 07:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syZbPEWLfzOhgdzjVf4hmjv0J9HBk5GQyc3y8S0TDc4=; b=ckH7pLlBRtC7CJMjXu41CEqEZy
	rChmorpwgQNS8eAxQ+dzicFPhkrMW84q3hUAX9rlXSzKrqhg9JvwNwtfNsUcmslm3GmUivxiEScj4
	XWpEs2pFue3l8bNx7yv/CbRT4jfQDVq7KtjC6AnjYkaLLU5NDZZl+1d3tpvtSuEvX210Rs0g/tmkP
	sI55+qCPfv8iRx9bo8b4uOMudsqF53Yw6QM5DVMCQWnp0DPyCxJZn8SQXrrDy06KySzhRLuXlJ+R5
	ZzxnJnUzbqaxCptYtU1CtcrfCpOhps9qfSm8Yc0q8jCwCddKBgLEupOweCEEfcTmDNCDYTEKpqPn4
	ABu8TufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poJ3n-00F93C-27;
	Mon, 17 Apr 2023 07:13:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poJ3k-00F91g-0Y
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Apr 2023 07:13:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id v3so214333wml.0
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Apr 2023 00:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681715633; x=1684307633;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=syZbPEWLfzOhgdzjVf4hmjv0J9HBk5GQyc3y8S0TDc4=;
        b=ErwpGeDXQCLbGoJpUzuBlwXDGW4gHDKcKbcgLaP0EzlSVyPp50lO5ooqBdjE3mtkX2
         H2XzQq4AmdkQaQKCTJ5r06lgTJg1ByduAJ1tL3tMNtwbHfzDey2VbApJbGNaRFMz2jNp
         8s7kwtHw0z4SeVhSxT3zXFEtmcHueaD5kI+f3juqL4AFkRPA4gNlob1Pef6A93PMmq+D
         XgvW6g6j3AigR2RLokz0R/ncUngcqoEaXLeqSSyZgD8N9FLV+d9ZQZ2qEpdQV7F6Czns
         JIPuEKoZXl2LC8lq5BkZUE7Zs3N9b0ufy19M06r3imp3TU1r78GETkd+Zr9f3FjtByK/
         5RoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681715633; x=1684307633;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syZbPEWLfzOhgdzjVf4hmjv0J9HBk5GQyc3y8S0TDc4=;
        b=ThIT9UTKmwzVqvbMku/S0jXpjZ+QcemWfR+a16IDzhhJNrLlnlA2gYW4gVi8dUri5U
         6gBzi4zdSFK8B0jJDur0NPo5gjLCMST6JGyK8IUZbK28pBp71MnVJcQHMhe5ZmZtWUib
         +FNQyg59HM8yy631C78jgh6W1Pj96uPkekFBARIPOAIa1m2EU+a0bEqt7jW6j9jP0E9D
         fMgQ/pirniG6nF2l8vJRegUzLUyxdNluiV18HM2X4hE8kJlEBmCPqbzoLjqOjyJMU1ix
         YJ3CNPaI7FO5Hl0nyakXuzeDeVAFq2juf1WKMAyKF8eMr/E/BZ2uSM2HnKVt8cTE99+w
         iAKQ==
X-Gm-Message-State: AAQBX9ewgmX+5yZG147WLzbTLX6p3YJng2m7w/VKX3XwZDOfy+Ll7kCk
	1vCGRdAG1+QgHa29kgwCmVudLg==
X-Google-Smtp-Source: AKy350ZHevnEBLBB3tRQ66QQs/GmR4ej4PyHyYePKfXjn1BO5mfXXrncGDy2Oi214fEc1IZq/Eb4Bw==
X-Received: by 2002:a1c:cc07:0:b0:3f0:9c6c:54a0 with SMTP id h7-20020a1ccc07000000b003f09c6c54a0mr10416635wmb.2.1681715632706;
        Mon, 17 Apr 2023 00:13:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91? ([2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91])
        by smtp.gmail.com with ESMTPSA id iz19-20020a05600c555300b003f1733feb3dsm2772876wmb.0.2023.04.17.00.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:13:52 -0700 (PDT)
Message-ID: <e065768f-f9cf-9d8b-a7da-80557b7c9f6f@linaro.org>
Date: Mon, 17 Apr 2023 09:13:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/6] dt-bindings: watchdog: indentation, quotes and
 white-space cleanup
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 Eugen Hristev <eugen.hristev@collabora.com>,
 Justin Chen <justinpopo6@gmail.com>, =?UTF-8?B?77+9ZWNraQ==?=
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
Organization: Linaro Developer Services
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_001356_237673_578E6361 
X-CRM114-Status: UNSURE (   8.24  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 15/04/2023 11:51, Krzysztof Kozlowski wrote:
> Minor cleanup without functional impact:
> 1. Indent DTS examples to preferred four-spaces (more readable for DTS),
> 2. Drop unneeded quotes,
> 3. Add/drop blank lines to make the code readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../watchdog/amlogic,meson-gxbb-wdt.yaml      | 10 +++---

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

<snip>

