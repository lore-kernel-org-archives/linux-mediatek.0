Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21354C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 22:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLEDL+G7aX3Y4fRU26LLhNvvGtvMvsrcMGTR1rtP7yw=; b=wowE6NV442IrDh8+Vv0ojREC3S
	Y8omHega7276Sg3HZaTH5LnZXGch/Oii8VXpSJQ7uHvUB1RWDp8Ga1zG1LtR/uUIUL8vIrkdge/8D
	PzdLcOlzNNugl1uTvIEqV+2JxCg6UIzulgenHVspQ2p2qsYLtAvnTsNU2TC64H6JLTWahru+0KwX9
	y39INSrbW0AmG6RTVWsnfJe9CjJ2mNOlVozGBG76amrfYylWo+mzf8ZYDtO/aTXr1xy12Alyolunb
	7Ltgds8OTgIhyqsdymV/5+os8XYAFsvEqELQjfanse4VADAF0jfKJ68tP16T7iZcsCbZEAvTz6TS/
	3ddsauFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1bRJ-00Gfih-14; Wed, 15 Jun 2022 22:24:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1bR8-00Gfgz-J0
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 22:24:31 +0000
Received: by mail-pl1-x62b.google.com with SMTP id i15so11590620plr.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 15:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uLEDL+G7aX3Y4fRU26LLhNvvGtvMvsrcMGTR1rtP7yw=;
        b=DTJF3smWA3fB95jgkWeMgAeL3z2fFHk8fPHUNEallNDdQff3BPuIcBZS65ZbGBPUXE
         K6BOf3/c2HA+EFOtIuA+4DajkWGkAzMQmZeFz2jKNsM4hfaGAPiXCWlPadUXuzDTRnoI
         5Jt7riLi+7en25sCaSe8ZlYJ4cSXRdC1Vyxf7RUHS8uGg2SzfkxnsOr9+1jAnQEIk7TL
         1pkdH0HOOKTr1NWiSFW3u7QG+uol9RhSdTluUF1Cj6vP5+yL/pDTlqwaBjjoyWk5zd8u
         evUfILLDx8rbTd29hitOx5f87S0CYWd3ZPpYWIVzsTuXC34ir4vWVGv0pfGro8jz7KmU
         XOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uLEDL+G7aX3Y4fRU26LLhNvvGtvMvsrcMGTR1rtP7yw=;
        b=iGozONoUm2xBhlaUIGrwH4MUnXZkN8S2b5NU2aK4KFRbR81CmjM+E77en9DCANvUrj
         S4glsnB6knadSY6arvsmjeFrmzfd6FtF4RYpCwQnPon44RC0hJRD5JGKLrIb99AympT8
         IQZ+NyGFbLEwFzt/vCSV2kkS/8zIHdF1G7N9PFvHMXSomRNfFhkuJbIQVERHAM4wUQnZ
         AA1rMFRFf0FjTl9NNFmjZZIVnshDos1fch41zxzxIXgPFYQEcrr0RptHqQX4EQz1f8xR
         +Dv+JcQwygiw12N2TWzwDzEtxD2Jij8v071KIJYorU2Rr88+m60C6TH70C1BTnWARl0V
         OSDg==
X-Gm-Message-State: AJIora+jp9HJVnTJD9b5pj+ezc8/uGIyStCjps5eR/JgCxkQmdfAdwqY
	Wo1hP+Zmm0/KbRXPwgVYZwjfuQ==
X-Google-Smtp-Source: AGRyM1twcw/WY5Xe4Nnxhw4M0Mco1frKQyTuE637zz53WB/TZIzLMkuT2IwpfthyharuE1mZ8MJLtg==
X-Received: by 2002:a17:90b:11c5:b0:1ea:9747:28ba with SMTP id gv5-20020a17090b11c500b001ea974728bamr12696060pjb.22.1655331867581;
        Wed, 15 Jun 2022 15:24:27 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p9-20020a62b809000000b0051c79bd5047sm128311pfe.139.2022.06.15.15.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 15:24:27 -0700 (PDT)
Date: Wed, 15 Jun 2022 23:24:24 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: mfd: mt6397: add binding for MT6357
Message-ID: <YqpcGLIhD2FsPLdi@google.com>
References: <20220531124959.202787-1-fparent@baylibre.com>
 <20220531124959.202787-2-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220531124959.202787-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_152430_651920_4922972D 
X-CRM114-Status: UNSURE (   9.93  )
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

On Tue, 31 May 2022, Fabien Parent wrote:

> Add binding documentation for the MT6357 PMIC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
>  1 file changed, 1 insertion(+)

Doesn't seem to apply.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

