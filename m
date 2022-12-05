Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6381C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 09:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqNU7BdzxXArJ1hxutAZbvizBnSeo/vOF+Ym8qXlYBw=; b=wnwHcgi+hzkCMSKR1FFQ/6rmM0
	PhdNz1uQCbpzfjReikpnw3GtvWLdonKEJNhdPJLLU3MIygBQYVqYb5uoTLZGbqud3xM5sSTc0KVWd
	1W4QU/TNDnGK/s4F1za14Du3kv6muzsCYvyi78wYivrqU66iKcHX9s87UcPNqNNzzZ0MnuVqZ8z+F
	bOK9Cxhr5X7zDrPyEWs2WXuWg9lC/FHs2QnwL/IayKcFe3tWKkQV1nTdfEiem1JkjFuzcfcUizYcC
	cM4HCh07SJzmpAOUKX+uXNcX5A82L/rZh1IC7mCeu8Q3tlKn0U0ksX6XKYgKfeyRbNwjMsTWfKWiv
	B4lKzPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27QH-00GnL9-Ai; Mon, 05 Dec 2022 09:06:01 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27QB-00GnHm-GZ
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 09:05:58 +0000
Received: by mail-lj1-x232.google.com with SMTP id bn5so12781878ljb.2
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Dec 2022 01:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GqNU7BdzxXArJ1hxutAZbvizBnSeo/vOF+Ym8qXlYBw=;
        b=ml1UTgwnXNIPc0W8ib4GfMRsHG60XL9gSKPj/qRbbV6GJkzlUj1At0dMUzoOFb60iW
         tb6annGiyDBjRt7m54+FeXCJAG1k6zyZpV4PZGuHxYm7VptGQ4HE5z/sdf0nd4XNnbM5
         mqZTLznBvYZ9IvNHoVEltgkurJq2dZTDmC3DBg6SerflSf29uDbJtRwzM6t2VzZKZeKH
         W3Hdrx+z2zDRhEmNvWjcF8C5cjMzT8oFOD2s9Yr7hkx7NoDA25fDHiauNl77Q6m3BHlu
         /XzYeQvCP1vLSSqEuf2R0EKAZk20F6w17K7jjdophOvRCEg7i+u82iAK96sKUi78Hro0
         PT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqNU7BdzxXArJ1hxutAZbvizBnSeo/vOF+Ym8qXlYBw=;
        b=Bwxw3aDnHWbkREeWQ5G8cn1NhePkHDHFM8SSOP2WW108TjaZL2LBbfqfwN4btalGXA
         e4b26dLya5wlfxxgnHsebLMrVMx+W2qyFiHYD1EJYFUfgcl2YD4y1Z8Rpaqmu42h3oc3
         l1PIdClmCFVDvC0LIxYk9fl5cBa2trvrQeIaiClVdPeD2imhGpRbSx74/lpaMBoe3F5Q
         4VyT0Rm1X3ooTHLTIOR2qcdA7+ayS5UgZd0hVRPIriO+YsITXFr0PS+V725i7f5m0wIv
         WtcfYyPZ8glAlZQ3DHbrqmdRGIjdkoaLoh1Xm096odPwIITrQZyKfIfxTBfKLPB7q3pm
         sBdg==
X-Gm-Message-State: ANoB5pnjwJIpGAFYzyDq5PFstGF9NppZ5qb3Yl0yJyeRs6Zqm/kOFv7n
	PApiVfjyDt2dYQ2oXWkF3Uytpg==
X-Google-Smtp-Source: AA0mqf70Cu3Bsc7Sg6w1pGgBN0DBMF+g70wtdk9SSpETzjM7LJKRxqb71DhL1ffyntt/+W0ANkRx6A==
X-Received: by 2002:a2e:a881:0:b0:26f:a855:c415 with SMTP id m1-20020a2ea881000000b0026fa855c415mr12377855ljq.443.1670231152713;
        Mon, 05 Dec 2022 01:05:52 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g22-20020a2eb5d6000000b00267232d0652sm1322528ljn.46.2022.12.05.01.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:05:52 -0800 (PST)
Message-ID: <3e141d37-497b-e9dd-44af-22ec57881b04@linaro.org>
Date: Mon, 5 Dec 2022 10:05:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 5/9] dt-bindings: spi: mtk-snfi: Add compatible for
 MT7986
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-6-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221205065756.26875-6-xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_010555_618657_6A8A3418 
X-CRM114-Status: UNSURE (   8.41  )
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

On 05/12/2022 07:57, Xiangsheng Hou wrote:
> 1. Add dt-bindings documentation of SPI NAND controller
> for MediaTek MT7986 SoC platform.
> 2. Add optional nfi_hclk property which needed for MT7986.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


