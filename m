Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71783C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 11:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KttnO4PIiCaAGSytE92u74iuSMSOKJ5regNQ/EC5WuQ=; b=geT8pFMwiQ8u1PzJVHZvcoQMNb
	iquk0+HLs60hMS58ypLKtZ0hGfflrwmdIygeF3xv2uW/9KdLt85b2LI6VsQXRpNBVX3PlCyFGlUoV
	MIjLV6jEKFqP72xSk30khUlmfPRYvliPQiVjZarfGTyq1RRargHQNhfs7RM0U1k2naPayDCJ61I2u
	D48v489oybdHzhc6lUv/5Y3e64sC7zTTn2tK1FT8FvPVerCVtr4H38tkMhP7FQca7am0UXg6XhZQX
	ClQQc9hMNhj3wqbtrC5aYK8l/uQ4n5XiZEpGcU8qeV8Mn1h5IPcMUla2npiGFSiXHadyxpetQgJh3
	WKANCgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkHc-000DeK-22;
	Thu, 14 Dec 2023 11:53:40 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkHZ-000Dch-0E
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Dec 2023 11:53:39 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50c05ea5805so9462475e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Dec 2023 03:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702554814; x=1703159614; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KttnO4PIiCaAGSytE92u74iuSMSOKJ5regNQ/EC5WuQ=;
        b=ggFX2LykWbKhotiMbQBTDDEW/Pt0HBn5ov/wQE0T4tZlglyp6FgFns5KVtFfFmOOpP
         A1oZmDTpoa1H90vu+y9vyOSGgBtP6Jhyekh1G0EFURr8svA2JwYxBvHOw4vX1iV9gV/J
         VTr3WZzlfJrbcaIMrVuRSPZH37SZCJV/fXdBRqSDVFi2ulPllv9iWYnLMldtvgt9jW5a
         n/QM1jcymIqYmqwvZUiqycQKiXX+u0OzneBLbhMqTmD3qEBMhVPLU78oEGEj45bt+eUe
         0juboK8NJntxlGkH+HdqB/Vm0chI9+SaD7dTC/XN0ygwC/L6DebtNb4M0WFBbrP/Nx1a
         nllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554814; x=1703159614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KttnO4PIiCaAGSytE92u74iuSMSOKJ5regNQ/EC5WuQ=;
        b=GsgphQYhUQN+dDpI1fLE3G4B6A7qlgpSEdOsNxedHEbyU+zmwLbL5bCpw90GDOiTfE
         0MOJE16pbMXWyBS2JDAMe/j//7ticO07zWiVhEv7MExja0HfwlLRQQLtlSUYgUJgchug
         GIBtKq3Rj9Vrsp3ZKxdSCqN6Kdy9KuUvqWF83Wv0P/MsDi7yVp0K561b8ctol109U1bD
         kF5E/TaijLGUOmIowYv4GBintl1mizzatmXo/CsUEUrF2htHXbdBSORUWha3tB9yjWS7
         +WqDBm3qdt1lqZxFE7N998Q83jGGzgkK+TRulV34DSIKgWo07P4NFUIAijzhFYMC/Zz2
         8i0A==
X-Gm-Message-State: AOJu0Yz1cHgFojOIzj2WeIWQNbo6myreHFNMKBeSuAQP7DcddQTvkarg
	inU+adEN51/hHLXT6KOT9VZCpg==
X-Google-Smtp-Source: AGHT+IFKAUpNpfuAuwpUiHGvkKtTTxlNLOoY8GwwQiOzDKup6y8DvTMvl5/GS7Uobt3Q4SD5/EbY3A==
X-Received: by 2002:ac2:4219:0:b0:50b:f305:7802 with SMTP id y25-20020ac24219000000b0050bf3057802mr3932763lfh.129.1702554814419;
        Thu, 14 Dec 2023 03:53:34 -0800 (PST)
Received: from [172.30.204.158] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y14-20020ac2446e000000b0050e1633748dsm183444lfl.206.2023.12.14.03.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 03:53:34 -0800 (PST)
Message-ID: <2890ae71-aed0-451d-a7fb-7db30c30b72b@linaro.org>
Date: Thu, 14 Dec 2023 12:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] arm: arm64: dts: Enable cros-ec-spi as wake source
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Hasemeyer <markhas@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Andre Przywara <andre.przywara@arm.com>,
 Andy Gross <agross@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
 Bjorn Andersson <andersson@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Jisheng Zhang
 <jszhang@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Paul Barker <paul.barker@sancloud.com>,
 Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20231213110009.v1.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
 <20231213110009.v1.2.I274b2d2255eb539cc9d251c9d65a385cc4014c79@changeid>
 <e5625051-e9e2-4a75-a11a-cf5b40606fa4@collabora.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e5625051-e9e2-4a75-a11a-cf5b40606fa4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_035337_158215_240CB5EF 
X-CRM114-Status: GOOD (  10.75  )
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



On 12/14/23 11:55, AngeloGioacchino Del Regno wrote:
> Il 13/12/23 19:00, Mark Hasemeyer ha scritto:
>> The cros_ec driver currently assumes that cros-ec-spi compatible device
>> nodes are a wakeup-source even though the wakeup-source property is not
>> defined.
>>
>> Add the wakeup-source property to all cros-ec-spi compatible device
>> nodes to match expected behavior.
>>
>> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> 
> I received only patch [2/6] - please send the entire series to the relevant
> maintainers, as otherwise it's difficult to understand what's going on.
> 
> As for this patch alone:
>   1. arch/arm stuff goes to a different commit
>   2. I would prefer if you split per-arch and per-SoC.
+1, otherwise *somebody* will get merge conflicts that - even
if trivial - take additional time to resolve :(

Konrad

