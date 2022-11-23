Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62ECC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 08:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fL0RQ9V3lsCHjFuI9X5q3hTnnfNaNlsOWbPGogwO7Tk=; b=ZDqeCHHv7vvXmoFmm7ntABbsmJ
	7+Nms+iS0TLbMdqOOdmVuzhC0FLdac5MHSEtfEVLzCfDFM/Yf2Gy84wFgYSI8zDP3q2x3cwSjxEgz
	JScYDHTUjGOagW2jVMn92dmJ89dgjVhS9M2JHaEZZm7RIkHj0WNTxroox9CFkQXIRNLgm6PCt94L5
	mKanbQ1mOCwnw1a41ZA21o8H3ORHpBQLX/BmC186n1w/DmJ4eAsZf8PU5LZYzXYSHFpVEL/WF5glP
	VdGAsNvAEHvbkPiq0UZRYMKrHTwiIWUvC9UBAlzZoUYBheENMAFlUkHgsKF1TvV2bYVNiib/yJDlB
	2gI8dkcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxkxg-00FSxB-IM; Wed, 23 Nov 2022 08:18:28 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxkxW-00FSu9-10
	for linux-mediatek@lists.infradead.org; Wed, 23 Nov 2022 08:18:20 +0000
Received: by mail-lj1-x235.google.com with SMTP id x21so20504486ljg.10
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Nov 2022 00:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fL0RQ9V3lsCHjFuI9X5q3hTnnfNaNlsOWbPGogwO7Tk=;
        b=lgfpAulgNwQyAsUYf92b42NDgYv4N76VOGD/OP/HSSTSBJcxgrReakyMNG+pVkl61t
         9DGBRp5UkjtO4P0q1WDFvUtAe5WlNEYHeSBa6GhXVhoE1+Tr8lt1CGUmNdXv4fRKIMWH
         JbX3V42YRa44xrUiHrH4rZmABG5PpWrxUta/nniWfk/LrKvfAbYwToDFB7lPDlJtchc0
         gQqR3Sr8VfS+mRRfmcXEAlwH/U/MPC3NM0pFspbpOgXNuV+6RQ+FrmMLxuRBNqS+Zqbt
         SUn82DCoy2dD5pLdHTmHjlrCH2aPpgTAs9OgPSB2U5sBqShu4QbKnOFsQRiNY8FGf6gs
         +I5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fL0RQ9V3lsCHjFuI9X5q3hTnnfNaNlsOWbPGogwO7Tk=;
        b=lnxInq0AQgwbQyegQv6M7et54RkXzaWBxqk1MNyTPWWvsXjss6O4k63PkXNkPlpIl5
         A8pafwz/N0Wd8CSrnoBrpiuZ3KW58HsRz/sg+4sYVgBGD3ZFkgsbUUQ9TC10Fp+EmgD8
         y3uTngJiKfWmsPvkqZaX47CmBhKMzm6YdiUEk/TwihLVYpy58so33LR1Qaow0kokUgN4
         d5kisXyBe+lfp2CdxP2nbRouXrVjHFpe8X6GbTsg+FVSQispcCg5k838jTYfi5PlrbQl
         D59GSSdMx7X/uP13gEY0ZJRur/RULQbw8LhoP7Z6IwHhkLgHA11nWcOCEeJzsUvyUebv
         xEAw==
X-Gm-Message-State: ANoB5pkf04OZA4t45mnOGiMSuj7XE0EjkjnAMCmL6AssuPXl78mQyYAv
	Ioet0NKo2dnb3DFsInU8969hAQ==
X-Google-Smtp-Source: AA0mqf6qdnORHkVtPLBs2odty+zr62ZdV3b3E3AHmbLeJ/v/hIe3N/3e/3cwDklJV2X74Rt7spHKmw==
X-Received: by 2002:a05:651c:205d:b0:26f:b445:8c8a with SMTP id t29-20020a05651c205d00b0026fb4458c8amr2918141ljo.156.1669191494829;
        Wed, 23 Nov 2022 00:18:14 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512358600b0049468f9e697sm2766578lfr.236.2022.11.23.00.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 00:18:14 -0800 (PST)
Message-ID: <51389853-35db-5162-e488-f5b3cfc25f27@linaro.org>
Date: Wed, 23 Nov 2022 09:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/7] dt-bindings: pinctrl: mediatek,mt65xx: Deprecate
 pins-are-numbered
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 khilman@baylibre.com
References: <20221122010753.3126828-1-bero@baylibre.com>
 <20221122010753.3126828-4-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122010753.3126828-4-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_001818_098865_2C454683 
X-CRM114-Status: UNSURE (   6.89  )
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

On 22/11/2022 02:07, Bernhard Rosenkränzer wrote:
> Make pins-are-numbered optional and deprecate it
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml | 5 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


