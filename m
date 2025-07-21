Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDA3C83F25
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 20:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1Evg1hMcS2lFe2FWgE2HGBuWpCsCs05VIKODyvEC8Q=; b=GdUgRwuF9tF4EmPwBtsoHSe9JL
	miuAnThwPwCKLDkZYW+Z557sFBD+VUFtEMARtPX8BEqcoJwJsy1ZBgP9NotgZbfPYLy7ObSrgbmor
	jUk7yulqV6e7clbRV/h0Nw74QVrcMW/46DLbHNxZQ7A/97NKjq09KXTtHjtr9lRlsIF58ZCwTEJb/
	mZ/6k3bfhWHXGRm4W2wWdA3CDjjpkx0Zexzr/79UNLDaW94z5CjfjFdQA5FFYJOOV9UROAfOeByes
	EQY5/5rEKCWa2bBDj+95wL65UVHNPht4hs2UrSPkanqlziQ1PV0kfzROFZBOVDAdJ3HeVXnR3phnd
	zpXu22bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udx4s-00000000ck9-2T7m;
	Mon, 21 Jul 2025 20:25:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwv2-00000000awk-1Pam
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Jul 2025 20:15:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45629703011so32960505e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Jul 2025 13:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753128927; x=1753733727; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1Evg1hMcS2lFe2FWgE2HGBuWpCsCs05VIKODyvEC8Q=;
        b=zWNt0TDyPAWbAOEKib2+x/34T1hlFuhmxOkmMTEyfTT1Yf595SP/hsMC4QSRPclh3g
         htAK4oOOJIPod+lcSLkdA7OYPiu8et/pALZvxMT0HXFsSbWfXJQ1pssqkBclpTjzxXtl
         +zI8Mlzfd/TOM96A+RE7syprQ4kk+lxJZE1GlIZC5PGeN7H2dis+V27lwEs4ShdyLFJM
         CaNX5kzxrSCM3ZLt853zMlJSj2EtsWjCg5+h/jY15OccBJbyHqwbc7LDcVnNdXI2P5G3
         hCEAZnqLirpyhbX6f7T5tjzteiiJw/uraeE4Atjb9xA3c9MRG3rebdALRCFMo9YCzFne
         uBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753128927; x=1753733727;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1Evg1hMcS2lFe2FWgE2HGBuWpCsCs05VIKODyvEC8Q=;
        b=XIkYvt//+dAZ8qGmkH050dDSnGzcc9lFxqYPaZqv+TtwS5NCZ1qoRfsUunbhMk2Zhe
         qqtlJ8DfREhcdFl7hRNAca/W2SrTegfxJPHPnYbafsxqJebU+ntk8lfRoFGgEKFAsuUG
         zNubwaHz+/biYPIshTpu7Wk4Yzi83Qheg0nJAjUBJiFlsE1UucBsEbAyldJksmxctHdw
         1rpUWhSVOsjf5EaxZiIfeviUD7yah4ReF5ETH90xWmoGtC+KM40ngZAOnci2xc5IcLZQ
         KH4PGcDodsahVd7xFlzEhy9p1eZGKH3XBrQeiEa6UjGjLlPP/trt9tv6Sd+jpoBswPNj
         06UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKL6ooOe0nVQfK+T3vMH8v0UY3OeqGq7uTxPB3Ufm36H9riG0GAD/ZVGq9Cy6LTXFYAdTZL62iA4tDHJhhyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp8tXzdOAmUMa4uLiyeEWt0EuTPQfdO8gOAv2/BoQRH4ayeMi0
	juROAyGRdimp2ylWyv2EwpoSW/Xt80X2hA+boepsBzwTea6HgRxiqLTI/vzZedjJ1vE=
X-Gm-Gg: ASbGnctME6P940Il1wqY41d68DCiMf1QAQpK5/+U1jbP0jeTRbNF2k2kGMsgYY+6gh1
	/TrqSYBRa0iEqpHWqbwMkNKLoTmI2Rol+KiTDVrqCL58iXls10EYARF2dRlc+5H3LBfbkAfFnC5
	vNHP0uyGoxtd1zlPlnVpzgIJ3A9/xqlmUjGsaB06Msm8ZjLTHfJ9j7nDlpa0u6eqcXRoCuGNzOs
	f6qpjknIXvJ3BgljOfju4fVGRyZTygpCVVYMbrB6b2P8GyD3cu9TKywhxTs9+ySO1+nKGaCEBRh
	p+XD+DYEgc1qoDdVqxv94g5VM86J09UHcAlniKJdG1RexHRdrJGDdonSD6Qn32z4PzjNwZl2aU4
	6kqukgHcM5hHtkgHYLi4FFAEEalWystDodG1levjwD6cZmKZjxLJOz6Yiogq9R/xDyXEpv//BWh
	JnsVE=
X-Google-Smtp-Source: AGHT+IEs1SpeNsDlcNXymDwIPuOqH8vWQgXR2g+gfxRhvnHjkxrNi9d6JZdyI8+CcSx2oE6sMotV4Q==
X-Received: by 2002:a05:6000:4701:b0:3a6:d92f:b7a0 with SMTP id ffacd0b85a97d-3b60ddc8c3emr13360626f8f.58.1753128926796;
        Mon, 21 Jul 2025 13:15:26 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:135f:abd:1f99:991c:5b07:cd28? ([2a0d:e487:135f:abd:1f99:991c:5b07:cd28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca4d92csm11380731f8f.74.2025.07.21.13.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 13:15:25 -0700 (PDT)
Message-ID: <151ac9e9-19e4-40d3-b6fa-cebc9978b9ae@linaro.org>
Date: Mon, 21 Jul 2025 22:15:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add thermal sensors support for MT7981
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, s.hauer@pengutronix.de,
 rafal@milecki.pl, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250712195904.6988-1-olek2@wp.pl>
 <23b3cd9e-50e2-4888-81a3-c6d340bb9583@linaro.org>
Content-Language: en-US
In-Reply-To: <23b3cd9e-50e2-4888-81a3-c6d340bb9583@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_131528_378471_FD106B51 
X-CRM114-Status: GOOD (  11.66  )
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

On 7/21/25 22:14, Daniel Lezcano wrote:
> On 7/12/25 21:59, Aleksander Jan Bajkowski wrote:
>> This patch adds support for the temperature sensor in the MT7981 SoC.
>> This sensor is exactly the same as the one in the MT7986.
>>
>> Changes in v4:
>>   - sorted bindings by fallback names
>>   - dropped accepted patch
>>
>> Changes in v3:
>>   - added fallback in bindings
>>
>> Changes in v2:
>>   - added fallback to an existing compatible string
>>   - removed second patch as obsolete
>>
>> Aleksander Jan Bajkowski (2):
>>    dt-bindings: thermal: mediatek: add falback compatible string for
>>      MT7981 and MT8516
>>    arm64: dts: mediatek: add thermal sensor support on mt7981
>>
>>   .../bindings/thermal/mediatek,thermal.yaml    | 27 ++++++++++------
>>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 31 ++++++++++++++++++-
>>   2 files changed, 47 insertions(+), 11 deletions(-)
> 
> Applied, thanks

Sorry, I meant applied patch 1/2

Thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

