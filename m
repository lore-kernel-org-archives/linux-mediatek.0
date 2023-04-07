Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C098FC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 08:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHSNmp7SMG0lrPLl4FoS04Pn0k06DM3nkel0fhy8S6I=; b=tEZ79ibeqaKvWt7qXbfsveqrOl
	+Q1qJqD0Wn8om7m/R3GoztyhrqPqwaBKZA3tjL9lS39gALavrIV3LRXG76UfgDS6oQh2ve3u1JWEq
	5zOQ6kMu8N2xbMdWhpXhTHLU+ujHsNoJ9MAfhjfAwIHflo57Ya81+YsKLU/MTDErmVillQ4CIKP4j
	RsLO0D4td46eeHyWsNipJRToo8NLUHkoEHOriVNxXSHnt3cdwWBktUKMsKT+FYm+/pGVr0uiCkKQb
	7yWKCEmHzv5Xiqn+WDwAlwPOBlgdgqCGGtwn0T9pYLkSUIm+HXeJCqg6XG5G7H97YWf5OplocY7PH
	DjOZZ7rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhaZ-009WO9-1C;
	Fri, 07 Apr 2023 08:36:55 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhaV-009WMV-1o
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 08:36:53 +0000
Received: by mail-ej1-x62d.google.com with SMTP id l15so6947265ejq.10
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 01:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680856607;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHSNmp7SMG0lrPLl4FoS04Pn0k06DM3nkel0fhy8S6I=;
        b=Y+C+ULbsml8lP/9KuITu37jbMIR3cQ3ePn66AI8gqoWVPcWrkiJY0Xa5/L6WGTM/Sw
         yXWUNAQ1RR40eJBG65Du6qL8Sl1el8LAuiunk02cFC+7mhyFlDTHR3GSL+Z/LJPgV2ZS
         pI8rL9xJjR7hrI0xMV/sDituxY0hQ59R8wd421XC+jHtMkF3EbJHcV/8HeDTSrDX6YgV
         JPCXgRhZc6ZKJQO0b+YpGC2fr7zXl49/8H7z8EmbIY1tRSSYhw44yUPeSL/oU7FWgEZA
         tcXWCx5GLFhLNfn0OssWL9P1OzHYAssG/UznLUw/ZXGozRiBObhWSAzEqDGkNbykfgbx
         eE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680856607;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHSNmp7SMG0lrPLl4FoS04Pn0k06DM3nkel0fhy8S6I=;
        b=yBUSYVzmLDX4h6MqpRnzdbzzLSYO0YbwCrj2KFZF6FM/TgVq49rB6EtNR0mEeWtvhq
         uNDebdQlcRsh3jBQKxVai00G2WRKh6jE/TP+f8k1dZ0x81gkDaokmbtx8Azdz7L0B4K1
         ZEdI0hjB6vta7/nPfJqUEfubG+6jeJKyt3boh8bgqYJuBdOyuIhtKO9YYkwPs5zcwZvc
         AaztOuJ3HC0dbZuaN4PPj87AAIXIKCEh1ccEzhkEKzSPCvFd6TpJWO5JDAwT3jyjDOKI
         yyPTXg2yCAVcgIvKL8lY27mN7GT23pLGw+SI4bl+7sj6xeGtpH1aaQzBgaDav5W0/Vaj
         W+dg==
X-Gm-Message-State: AAQBX9ed8lVbt3f99XdaqlaFJra2hdrRMAZDD9cenz7DOkGis5x3VgXf
	//ko7lF+lZ8j7o756tl6aKy14w==
X-Google-Smtp-Source: AKy350YppXdVXmmSPqTDg+9apafRJyLRTwt34FsDVmaVa+DPxzzk6jQ+f210ptRaWN1NbFN73cr/8Q==
X-Received: by 2002:a17:907:8e8d:b0:8f0:143d:ee34 with SMTP id tx13-20020a1709078e8d00b008f0143dee34mr1218902ejc.1.1680856607523;
        Fri, 07 Apr 2023 01:36:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:14a3:366:3172:3c37? ([2a02:810d:15c0:828:14a3:366:3172:3c37])
        by smtp.gmail.com with ESMTPSA id k6-20020a17090646c600b00949173bdad1sm1801199ejs.213.2023.04.07.01.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 01:36:47 -0700 (PDT)
Message-ID: <d626f476-3236-676d-b25d-87b71520219b@linaro.org>
Date: Fri, 7 Apr 2023 10:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] dt-bindings: i2c: i2c-mt65xx: add binding for MT7981
 SoC
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Shih <sam.shih@mediatek.com>
References: <cover.1680817105.git.daniel@makrotopia.org>
 <31957e15116027afd154f0d91e799028e2400bb2.1680817105.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <31957e15116027afd154f0d91e799028e2400bb2.1680817105.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_013651_628757_BB3664A9 
X-CRM114-Status: UNSURE (   8.21  )
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

On 06/04/2023 23:41, Daniel Golle wrote:
> Add binding documentation for the I2C controllers found in the
> MediaTek MT7981 SoC.

Subject: drop second/last, redundant "binding". The "dt-bindings" prefix
is already stating that these are bindings.

Bindings come before patches using them.

BTW, I did not get previous patch at all, but your cover letter suggests
these are compatible.

Best regards,
Krzysztof


