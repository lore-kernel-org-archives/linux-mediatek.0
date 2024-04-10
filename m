Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61984CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 17:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EH9Pxm+MZUB9uIJB2EAX8UISWeLkvrbIq4NwMfK/no=; b=1ylyPT/qpMZDAluxsqy9Tkt4K1
	mxJhv2Yses3dcahmxBPiKDcKcmv/vkzqln35Y4iFGUfLbSzwtEJXOajbXzCSL31vdEnONvlxYwYwK
	gKtmwxD22oVwyQxdlpFHGL8u9vaqPbgWBzvC7yPgzqCS61ToKKZ51pkpkdZegNSG39H2PUKSlWKtm
	p8F/ANZCZUekCimhXnDSSgRENxXcYg+1jojwpk1sed5LPu701CRtJLMdxUNbQJua9GDG/fLuHXPs+
	A/jd03Fk8K5Mew2ItjZCNYYW5+26GXbCr79Pe8Ovez9TBBfZWKrfoUoBuBSEIqop+nGIBmHz2dbjS
	/jtjV4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruc7E-00000008MLV-35qr;
	Wed, 10 Apr 2024 17:52:08 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruc7A-00000008MFK-3qfa
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 17:52:07 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-516cbf3fd3dso8128331e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 10:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712771512; x=1713376312; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8EH9Pxm+MZUB9uIJB2EAX8UISWeLkvrbIq4NwMfK/no=;
        b=hf5PZAhn3Ods4TWyzLQ5eC8APxBIesRFiAwI3Ya/8CkOnOqPzuZ1WDx5W62mXqMsl3
         plSxkYkxk3xRq8tD/BxDDEs8eiN6UcU3rcZCpxHSu6IJttmuidfDmH2Sq6XJww11299i
         EKgLTuRLswhE8z16EIKt88uUJYioXGwzldmG7/5qINUZNZ474JftJ/qCgXLaWyDljQKa
         U2KkJHSl6ReeWShxXXQ9X/WbI+F2ej8NowTHhPku2NeMBpFkZRbeiwgFFic9wq6wjRel
         pJis0Vvv091N61VQVBCba8eZadClBzPji8FC9RYjJmhB4G24LLsLlUd9T2W3PP0PbA6D
         YWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712771512; x=1713376312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EH9Pxm+MZUB9uIJB2EAX8UISWeLkvrbIq4NwMfK/no=;
        b=hEQSMwzwOFxEXJpqP5UG88Cn/NxpNF95pypiaI7q/TV0k7kn5nXKRY1tYmESModN25
         8IHdgHuSrLfeiGge9Q4tKAGK5V8rwBTVfUQ6B3y7JmmIwb1UVpykD0hrpneatmxBvPP0
         DuQr06P0V4f/rkVF02AcbbMzvvO2YmKO+D7ly88lPhfXyjp0olNtxphFm+sMkx9OTb3d
         XEoXlSCFY2FqCBb2/3BthjiAGkf66YNtIe1hbENJvoLhS5+Ud54d9lo0WzJsKSdl0+Of
         sjEMUCXthgF4Fu1Wf2/GQGerHO7am5hyhsDMdKBPKugEe/MRonLdojCgaBl8pbCXuNZ2
         E22Q==
X-Forwarded-Encrypted: i=1; AJvYcCXL0yuHjHiHuDyjgNP2c234i6arsvLFjGowQSY86eEI7Ml+6sk7dU8QRoBL5Uaht7KHppNtMx1Sq3LMnQNC5c/E1R1iHzATCHQTvu0Xwgk5DULW
X-Gm-Message-State: AOJu0Yxeo6AmB1Ez7xBNA2VpL/HHGhFhJqvXJTEsOewj7GiEm+OjZ9La
	+XxMuGXQUD4yRAUxP/d0uGlIg43SDQYBGX7UdA4/snF82RkCgdMpGSj6tdwTnts=
X-Google-Smtp-Source: AGHT+IFEmuU/yIHrAY8NuucyCaQFKu+VnZxGulNdN7KpD4j1m+7zPUv7hS0ZitZBToM3exxMIntetw==
X-Received: by 2002:a05:6512:2c95:b0:516:c600:64e8 with SMTP id dw21-20020a0565122c9500b00516c60064e8mr2674529lfb.1.1712771512162;
        Wed, 10 Apr 2024 10:51:52 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x26-20020a19e01a000000b00515a87668a1sm1905343lfg.77.2024.04.10.10.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 10:51:51 -0700 (PDT)
Message-ID: <3ae3891c-32cf-450c-a68d-0f80f9192bea@linaro.org>
Date: Wed, 10 Apr 2024 19:51:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] pinctrl: qcom: sm7150: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>, Dong Aisheng
 <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhanghongchen <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Bjorn Andersson <andersson@kernel.org>, linux-gpio@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20240410170150.248428-1-krzk@kernel.org>
 <20240410170150.248428-4-krzk@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410170150.248428-4-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_105204_993078_7BF04DC8 
X-CRM114-Status: UNSURE (   6.71  )
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



On 4/10/24 19:01, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> can be built and used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

