Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3A2C3271E
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 15:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWJsmVbnxMDiuFLY+fOlqn//TXBBmUogobIIxAviZlc=; b=xNBA3UPLhXCd8s7UYxnVYpiZja
	X8cMOV9hy0ddV92JoT9oTy4ylpHD0kE/3kFaS/TPOubQTi48GLpyC+ku0OtVVRToEUoK8Ukzj/0tL
	Xp7nZ+4sruBnW2nG458wQUCikqOA67XucS03OBnRTZ0/qeI6Hg8gMZor0oTPToEh0vpfAi82kUN2R
	/YZ9nO5vNn9d2WktffgLN1x5evKW/jn6CevYoz/mDpsuvA/ujoNyNuSmnzO5bPAWLqUa961yFQ1YJ
	QA9x2BCL3O2CxW7qVNHU1dtRzpNH05UABMwdIEyVkADD6rgWd9ncZWLRPQr9LWUsDBjLH351Zufkv
	7JpknyyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPl2l-0000000GM7x-410D;
	Fri, 05 Jul 2024 15:40:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPl2i-0000000GM5p-0Nq9
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 15:40:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-36786081ac8so1069956f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720194010; x=1720798810; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWJsmVbnxMDiuFLY+fOlqn//TXBBmUogobIIxAviZlc=;
        b=aS8ABTULYwHTp4Mx/YdsUgJPrfACpf4eKInAyEaQO9kOQvObCXp6E4pfPIujrvORb1
         axd6qrFj/BJx5mK766tGJuIy0urciIZHidMoVwrxZLlHfgM3YZCpwHxvq8WfeAROKPN3
         h8Z+l1oti7U9cib8aq1n5q02ZvnIOvsTjvv3vtKw+F+ZeI2wSc4dUJk2Ib1NzUZp5OL6
         Da20+FfNHkk0Ysdj3KEGG3CaklepnX5IYWBh/+2vHeqtlMeatY9xBoi7RX7HfDSo5QEm
         2+pj0kx7978VOiYHhYpuUTZuH30CSC3mLH5u/Rgv3wxELpT8iClMwl16R2D0q+RhFT8l
         8jVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720194010; x=1720798810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWJsmVbnxMDiuFLY+fOlqn//TXBBmUogobIIxAviZlc=;
        b=mRgZ6IFN0Z+LzjEHltj+yU4+xLKhQKBuAqEvjI5VqOnCMBy+zqY9bZllhjIbUpx6kb
         SXcp6y69iG+LS4Sycf4XCuMs+J90zO/L9ULbH+2wf3xq/taOj6lYttp6RzEjEd2fHSQF
         Qm3jCCH+nJWLuTwZ7dnzC79/cLlVhx5SWkMHWhaYAe1OnocNmIytbyFdhjH8fWo+xMTI
         xp7cgpuPXTRr4MYDRCuXm2xAnFtyVZ03tkzWvorCu3fS04qfz8uo9vORlJw9E3Os0sbA
         r7jO/dPBSGfhclgjF8WNEcQvfYO/lp802vtpSegnjb2duZCqFB5L9FtDcHlhD3+LyoSt
         3W/A==
X-Forwarded-Encrypted: i=1; AJvYcCXACrVjcudnlpJdOHhkeShusXtXxtas86OB6ONLfX/21ZjDqXV6gVxk/409j9CJFxfN4X9RwA1LrdouQOmkh2kC02gF53x1U0+w2v6/9cn5JKhW
X-Gm-Message-State: AOJu0YyrpjZq/pUr/nCLU3Cyh6d4A/jL71aM057cTSWnDnc6d4cUutF+
	ke1QNj6867VMX058Jjtpz4R+zLuBKqD7I2FLuyeql8PP3Ygdegkf38UpcQPgqgQ=
X-Google-Smtp-Source: AGHT+IFZ5tZcHjh9afQQV6N+UDpsdiCgwUbQuOPcHUbDQTq2FuqnU3hsZXAXDh/UpS3fDJuMgQV8qw==
X-Received: by 2002:adf:a18f:0:b0:366:f469:a8d with SMTP id ffacd0b85a97d-3679dd35e71mr3543623f8f.35.1720194009828;
        Fri, 05 Jul 2024 08:40:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36795d1fc9csm6559538f8f.83.2024.07.05.08.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 08:40:09 -0700 (PDT)
Message-ID: <c7c78d7d-c920-415f-b97b-c3b7c61eb9fe@linaro.org>
Date: Fri, 5 Jul 2024 17:40:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 00/22] dt-bindings: thermal: few cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_084012_139084_EDA3067F 
X-CRM114-Status: UNSURE (   6.05  )
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

On 05/07/2024 11:51, Krzysztof Kozlowski wrote:
> Hi,
> 
> Resending (with added tags) because patchset was still not applied.
> Daniel, can you pick it up?

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


