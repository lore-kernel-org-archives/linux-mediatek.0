Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BA1ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 09:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEXQPbFYUmyLFpItRto0dJ/tByAUIKacMuPLqwHCo+s=; b=3oDkyMroqAKKCZ98aByK/JQx4m
	yddehBfBgQcwUH581+T6x8gh0L0qegxEeUCb6i37ilpvT42Ch5oLMIRwe1H/J0wYBdOhUqxsAn0xh
	o9KqQOARdObGtYEMUl4jKjkcvREFqG2rMgw+11n1adsp3MxzFSdBcZnjoP3D86Yl5suQRmebsrn3F
	RY68dIwAsgSfuuS2B1cloBPIh5XEsoI2aqgPRABbkHzni28SeYk/4DmkrYR52dQFkM9ujVjAM0Vm7
	yN7BMtvuZjPVlNerbvMzgX3m4KntuLCixZQ1TH7JvQYUDKSNdZddIXlIeV8XYfl/op7AtYAL9y3aq
	j/io83Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTgjj-00Arh6-Aq; Thu, 01 Sep 2022 09:43:47 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTgjY-00Are6-5N
	for linux-mediatek@lists.infradead.org; Thu, 01 Sep 2022 09:43:37 +0000
Received: by mail-lf1-x12e.google.com with SMTP id bt10so23600139lfb.1
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Sep 2022 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=XEXQPbFYUmyLFpItRto0dJ/tByAUIKacMuPLqwHCo+s=;
        b=Gfpfg8Sf0jfSEIFCwMWjk3s/aMXgKh97v8gftg2tIeA0hFhfcr9sF82fGNdBg60CS8
         6QOTX1cQ0bOzLBNDeN0xpUCY/VfhGfKzFpUEC/anMa9dbPhSiKlNvCnaFCxks7sdT5v8
         mu+7BgT8JYpHUGRxUGpPMI/IpPmcrFmdGbmvEdNPySVhZEmZq3M1o65Xm+/1Q8KhJGPq
         gSpai+QkPC6f8g6yyRsfgH3oBouVnCSfHT3IBO/K1+1H2ytY7teisWFsxQH/6V6BC3Ns
         KeIyllpNim/cEtVMwepqRgJmRRGfFaOta1JxIPQp3zn1QG/05V5mBT1hQRJOQqnQCov6
         pkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XEXQPbFYUmyLFpItRto0dJ/tByAUIKacMuPLqwHCo+s=;
        b=vDwlQlswni8TGT+V1rypUFkzwNYCs7wLUrytjqGSPg7rPxRZ8ws1YsvU2KCHotoYO4
         pF+izk6UKim280z53UoryaoLhAnXHOMjIaUdYolv2UqDw3fja+rhJIiH31b1dInR9nPj
         RO6G1acp90COS2F/YZ2iIF9+JYo7Tv+NMC6Q0DDqgRdcCdkI7dqz7ts1PgvNnEkGI0al
         HL53jq2wwscFTMBUBHTW0rG1Dj544IVrhbR+ldqetJnxAg3ARgFe7RnmxI9spgdRVWsf
         B3FSBew8c95iy7XwklmqwWmVGqBWW0V2Bs5Og6gcJRwxH5R0DmjzmvET+vFiU0n6UR0u
         +xQA==
X-Gm-Message-State: ACgBeo0JQ4Tpc+vw0iG2w9Kb+jfCem6p5GpjTyP/fLglggAU37lJm72L
	HXfkx8FuixM7t/6zxUtgjgZjog==
X-Google-Smtp-Source: AA6agR4UzJqQQVStYvJ8JDhqeBGqAZuikeg2f1LAfkytqNgMWk4O3K4J51+OxtTxriFWxC20JQQqcg==
X-Received: by 2002:a19:505b:0:b0:494:6549:ade7 with SMTP id z27-20020a19505b000000b004946549ade7mr6436821lfj.62.1662025413899;
        Thu, 01 Sep 2022 02:43:33 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id u1-20020a05651220c100b0048b4690c78esm1180497lfr.288.2022.09.01.02.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 02:43:32 -0700 (PDT)
Message-ID: <91ed22e5-41c3-8a09-101f-7d3b7555cd7b@linaro.org>
Date: Thu, 1 Sep 2022 12:43:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20220831124850.7748-1-johnson.wang@mediatek.com>
 <20220831124850.7748-3-johnson.wang@mediatek.com>
 <b1296c37-5283-81f7-1939-7ea20e1f4d0d@linaro.org>
 <1fae0c47-fff9-89e9-c849-536d167d741d@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1fae0c47-fff9-89e9-c849-536d167d741d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_024336_241839_269A63C6 
X-CRM114-Status: UNSURE (   9.31  )
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

On 01/09/2022 11:04, AngeloGioacchino Del Regno wrote:
> I know it's going to be a long read, but the entire conversation is on the list [1]
> 
> Cheers,
> Angelo
> 
> [1]: 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220612135414.3003-3-johnson.wang@mediatek.com/

I see there hundreds of lines of quoted text without trimming to actual
parts, so no, no one is going to read it.

Best regards,
Krzysztof

