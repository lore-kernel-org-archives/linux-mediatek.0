Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AD8C4321E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 13:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymMQqhpUEMJO+b52K8VIsBNlBPxjfHjs+nxko8CCAkA=; b=01k13WqC87JYqALhB78AKqRV6A
	HB4UeWP60CVCZgsOG/qAfEk+DZMLXUdZzKL1pjNg6z+fOIRXSs/IvxiD7CN1QehkF5etinuGE0XrG
	Dp+oYco182QTZGG2JjtE5zUkI/gGpNv0rBqLDxL1DnvVvRRTkicTKYDNRYA4DdhUc3TE5v4pqhu8n
	uu/nw8rA6kRslvBGsVZvghA5ldzji4Vem1Jh8lAhLBq1s/p79bY/Ss3RhzqDdTX1fEPG5TW/pfJB6
	Ukldd15Nk3Jlay7XQnT4bzgW3DUBqa6RUb+7mVC8sBoe1pueJCowxHnh6wJIaA6emKgaveI1TaiSl
	y8iDU6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHTK-00BM90-Ek; Sun, 27 Nov 2022 13:13:26 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHTA-00BM6A-3J
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 13:13:17 +0000
Received: by mail-lf1-x132.google.com with SMTP id g7so13569234lfv.5
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Nov 2022 05:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ymMQqhpUEMJO+b52K8VIsBNlBPxjfHjs+nxko8CCAkA=;
        b=JSJGXxblDGy1qS3qoTAjnackIDa+wZQBCsH0kr+qVnprwKK4TvbG4yjfrTjRMcLql1
         1/e+fiJF3Z/UVAeIUWKRj6FaNjBu9wi9TrKIRBtQxz/IZqBeGexTtdjndE7H5zu6iqO9
         7lXjgqaJXGArz2D0S4kx3cW8vYTaGZ0lDqJv7aNL9FkECn4XUPIicchnBYJX4sM0vE15
         ATZw2hWO7+IGJTSvZaatmyjY/pFguaRyguEdPBt/uSX106j6vbVhNh6EE12222/w6SBM
         24tGqUVwQIkAJDrip3cPHR6Y5HcWJxtWyj4tRTOnxuY9YpevZ2nvnY8vuljqbbwEH9Di
         Z7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymMQqhpUEMJO+b52K8VIsBNlBPxjfHjs+nxko8CCAkA=;
        b=NSEJ+1vwRChxYYtZ3nvB1M9WR2Xt/SWekyaBaXucsgJSm4B92IIV983EG0rSFBlMR3
         tLBOEEijIArxPqogHHFuqFcLfJW6kZllrvsZ1KYvlhIEO3nbNm0w/XxNXl43SWhuTHPe
         zmJ1m07miUJTEbtwDkNcRdULAY9oT0wHSO+rRRdc66kmcmaPLe6GdDrztQllP1WB+GVA
         9W/QGbBPsAFAJiiOmz6PMtPyALKQ6jFP53gX0oUFoJT1cZkm0K7Dr+KM+X5BCSn5+5ZW
         7THoLgic/D68s2JQiuGjH3nSUvZUEYh972hHWEJ09NxQ5c/e+phDiZkRDprtX1RzHTFc
         iJ9Q==
X-Gm-Message-State: ANoB5pm/EhOCrdAO6cb/vsz+RPMoF8Bh+XslGjMwtaPJBcSPO1alNd7k
	YV0QeCMNbjf0J3OIxkg9EGHWIQ==
X-Google-Smtp-Source: AA0mqf7qTvx4Q0DD8LmdqDNmzQypbQWAj1Cy/SzOTvxmHHY8KN/okl4/hczpu04jclcNSh1fjuMl9g==
X-Received: by 2002:ac2:58d7:0:b0:4b4:fbce:606b with SMTP id u23-20020ac258d7000000b004b4fbce606bmr4336087lfo.27.1669554794552;
        Sun, 27 Nov 2022 05:13:14 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 6-20020ac25f46000000b004ac393ecc32sm1297941lfz.304.2022.11.27.05.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 05:13:13 -0800 (PST)
Message-ID: <f893330f-8fcd-044b-5bc9-f2c80813bb40@linaro.org>
Date: Sun, 27 Nov 2022 14:13:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 06/10] dt-bindings: mfd: mediatek: Add bindings for
 MT6357 PMIC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Flora Fu <flora.fu@mediatek.com>, Tianping Fang
 <tianping.fang@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org
References: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
 <20221005-mt6357-support-v6-6-4f589756befa@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005-mt6357-support-v6-6-4f589756befa@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_051316_191510_CBFCB8E8 
X-CRM114-Status: GOOD (  10.40  )
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

On 25/11/2022 16:10, Alexandre Mergnat wrote:
> Currently, almost all MT63XX PMIC are documented mfd/mt6397.txt.
> Unfortunately, the PMICs haven't always similar HW sub-features.
> To have a better human readable schema, I chose to make one PMIC schema
> to match the exact HW capabilities instead of convert mt6397.txt to
> mediatek,mt63xx.yaml and put a bunch of properties behind
> "if contain ... then ..."
> 
> - add interrupt property
> - change property refs to match with new yaml documentation
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


