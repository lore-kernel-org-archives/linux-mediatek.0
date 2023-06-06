Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05902C7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 06:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fEU/R7uNwrXrN5ufRI3K2w4J1jDo62wX5QshySlKS8=; b=pPyPcky6jgBIiZ55ii2j+kaqee
	/GyV3fWzh2yl+7Q3s+EFJQuKMKlez7NH/VrGR1EDZK8nfDyI5sRfBN+2rRnytre7NkXP3R/l1xPhw
	vIJFKD1gMDt6n02uxojbqYIySHC3oQknpIQXrBMoYOPgYlOODaz2k06EUWECFEZ/1+c+BbidksuPK
	m/9/DfWBEtP7HlV5qeaQLsIu2jB7BaPs85CgG0HkbeZzDARfVo7SvLDjHDOyRPMDTMQJTm0S8WV+O
	5+vz43ziyfKCaDbDKkYmaB2JBaGEw4hm0S22Vhabo7yE0wH4xaVBncrryj2xJ53yHOoSCdFeq6OTN
	fccPUS6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QLB-000Oe7-2E;
	Tue, 06 Jun 2023 06:38:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QL8-000Od4-2l;
	Tue, 06 Jun 2023 06:38:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f6d3f83d0cso57581555e9.2;
        Mon, 05 Jun 2023 23:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686033525; x=1688625525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6fEU/R7uNwrXrN5ufRI3K2w4J1jDo62wX5QshySlKS8=;
        b=DwTa7+n95K1HQKKXsmzPr9gwM9zVzm4EZkE46cS0gVQdUMKT9aXwvsP+6sBT34NavM
         5uiomYMmuRlRv7b8eWQE38KIVR6ro+YkduDcBoqzrKYe01jmcSFTwCwsLUeIXr32BAEf
         WwQ6i3rXE8Wqc3AhzehQeBQg24EGKzT+gN8f8dptZkua+mhPB1UFasY+Rm529PTSXv1s
         wgFqzRDeMQD8WGFuDk3cMN2+hyFKI7K35JcbycWRrqXX6QKcrJ0xLC3RodO674Yp7l5h
         tvRVxJKYJ+Xx9+3avlD8tqrjGMRNJ+nADQ56US1cOvQu0lUpr4QWI2QIEA1e4rzY1sD6
         vuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686033525; x=1688625525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6fEU/R7uNwrXrN5ufRI3K2w4J1jDo62wX5QshySlKS8=;
        b=Y5j/n7PaVKGA0JbWCCWpO/VFpal878NpFM5uHK9Ze7uopTk+9dEqGjNhg8FOWDrN9H
         0w7qSHd6I/9GVSU+TeMd3My/4zUSW5OC5PZ8B4cLvXex/XHAIWoVciwJGCmw9rmnJyKU
         HCV1zZuvLcPjcV8b8iNoj7v8kB0M0KmIeX16NsRCzAl0rBR0Q2iHVCYLsXpyCVKGi8b/
         xcku7kUfpAxbRShWRfoNsU4n6BBPAkYtsUUG6w0cCbDy9DJIxp855X/utcKmomRQyo/R
         POLVmZq8whDT/xD0FjpTiQ2leo7pXr5f8YiNRjPuZ8sPYFbIMWToOfbN803BB2Guk/mD
         1Z/Q==
X-Gm-Message-State: AC+VfDyZc4onH8dJKgeKBrVRKFcp9M80cGSRzVujpdKIf4e2+dxowkQG
	Mz0m3eMHYmE5pyIwNiSuQNs=
X-Google-Smtp-Source: ACHHUZ6McQEZGjaQQTvaXPkSyIOv0cPTfkqYwCLndHUKJE5szBrihG/e54vaM6kpFk9nYG4TidsD4A==
X-Received: by 2002:a7b:c857:0:b0:3f4:447d:f74a with SMTP id c23-20020a7bc857000000b003f4447df74amr1365631wml.26.1686033524788;
        Mon, 05 Jun 2023 23:38:44 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k16-20020a056000005000b003079986fd71sm11707026wrx.88.2023.06.05.23.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:38:43 -0700 (PDT)
Message-ID: <4b2fdd36-0871-ecc7-5d64-e088d7f51987@gmail.com>
Date: Tue, 6 Jun 2023 08:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192: Fix CPUs capacity-dmips-mhz
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230602183515.3778780-1-nfraprado@collabora.com>
 <01c88a42-274c-f8cf-73a6-29741579d9db@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <01c88a42-274c-f8cf-73a6-29741579d9db@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_233846_896218_A8D586B7 
X-CRM114-Status: GOOD (  11.29  )
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



On 05/06/2023 10:21, AngeloGioacchino Del Regno wrote:
> Il 02/06/23 20:35, Nícolas F. R. A. Prado ha scritto:
>> The capacity-dmips-mhz parameter was miscalculated: this SoC runs
>> the first (Cortex-A55) cluster at a maximum of 2000MHz and the
>> second (Cortex-A76) cluster at a maximum of 2200MHz.
>>
>> In order to calculate the right capacity-dmips-mhz, the following
>> test was performed:
>> 1. CPUFREQ governor was set to 'performance' on both clusters
>> 2. Ran dhrystone with 500000000 iterations for 10 times on each cluster
>> 3. Calculated the mean result for each cluster
>> 4. Calculated DMIPS/MHz: dmips_mhz = dmips_per_second / cpu_mhz
>> 5. Scaled results to 1024:
>>     result_c0 = dmips_mhz_c0 / dmips_mhz_c1 * 1024
>>
>> The mean results for this SoC are:
>> Cluster 0 (LITTLE): 12016411 Dhry/s
>> Cluster 1 (BIG): 31702034 Dhry/s
>>
>> The calculated scaled results are:
>> Cluster 0: 426.953226899238 (rounded to 427)
>> Cluster 1: 1024
>>
>> Fixes: 48489980e27e ("arm64: dts: Add Mediatek SoC MT8192 and evaluation board 
>> dts and Makefile")
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
> 

Applied, thanks
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> 

