Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91E2C83F01
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Aug 2023 11:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2edGeLLjwmBS5v07/x8wBG8ynN8bGWmxjzGyhRyL4R4=; b=zbs+MpJJR8SPv1v0IpbHBnRt1F
	I2xgXTftQ8fRaB0j1KFBGOYYpEZ94bS+IRvKdEfNI26PSC/JQhJLQj1K3sB7nrAPVvD1I/L1Fstcg
	4XqjybcF12eC6VQWswUbvAbBkZxizSTfZWdPnbBC8SweW55nL/0W5i08TDdpOn1mCKDn6z2zfPuXa
	hPO7evVlxOI4MJyZxm9gGLU2qVPISac7TQ7BSiNWOvpWfB2UqdFSNPk4AlYDyYtNwq+n8LWkgo9Ui
	MaJxPOgLziGqhm5+Bk+qicXLWdNYiP7u2tHfa4buodcfDTC1ZTRmybV3uWnjZ5ftVKc98Ug7W1BS9
	O7R0RAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbJFR-00DNRd-2S;
	Wed, 30 Aug 2023 11:20:33 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbJFO-00DNQX-2O
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Aug 2023 11:20:32 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so1614757a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Aug 2023 04:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693394428; x=1693999228; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2edGeLLjwmBS5v07/x8wBG8ynN8bGWmxjzGyhRyL4R4=;
        b=Hz4OJ0axs+e+o+kWu4DaLCi66DNMS7NslfkT+vtQFR5CObM+Tb4E7lWVWGYO2ih/z/
         TktZmhcsw5rvmz4/tS745in+BjfUwUNRv3wccyN7QGZ4VP9yuXKKtPMKOiruvWsLOi+M
         bdZOkt5BmGpLuw69H5VUHVaa427Z8m810IVnbCE7PcXTyAYCpZ8QbTbNoXg5eWswBxdi
         6SJQDrY9pQ+5Kah+Pde+dVxX78twdjq8lBK4XPxnsrGqwwhdNmo/hGi+iGY2HBRMJLFS
         vE5GGsOjN1lmXlCwUOTIATgYDzEwSJ++x84xQRUHoE/RVAq/3BeDRXZFGtW5QVfPFny9
         AkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693394428; x=1693999228;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2edGeLLjwmBS5v07/x8wBG8ynN8bGWmxjzGyhRyL4R4=;
        b=LXj49fFtZeP9lfUVXECGctom0WidtI2Bqr6EQx8AXt3gXDHPQWm3BT81vG/qy+E3aS
         XcBuggevXyUl+EvqDTAwiKfe5v8EB+tl1Rf/v4PS04pPPUUjGemPWVhL1Ejd5zHCPGvG
         NrsGrKzeOBCk54SQ7Q1lqVcD+xp43kBzVB6eJCh9RGWAEg8EycQ3mHMcThlwH7ymsYEy
         xiDWmv0ZqxbRy+lIeDGvNjzxuP/zqO7pissavpMXgt/IWpZ0usP4BwLEs1T5bIYyp5Hr
         XqOZy9RoJBoS1TkLXZeX5KZLdw1DohsDVo2NYXfKWjtt9w9FGyO6ZCIKNGkViXNnO2Gx
         tsMA==
X-Gm-Message-State: AOJu0YzdTCqAxq184NzuN8mbvAPCtSmxmt6OGpvZXVctGs0Gzqjf169e
	CbPwfCvNnqTjrhqRbiON2PNLdQ==
X-Google-Smtp-Source: AGHT+IGWmLI8SNyABERgpk/JQhn4b2kn6YcGVWoqyPZlcujUm5Gv0Gjrq5MgGtIM1CvqGV3TUZIN6w==
X-Received: by 2002:a17:906:6a19:b0:9a1:bb8f:17d5 with SMTP id qw25-20020a1709066a1900b009a1bb8f17d5mr2988524ejc.30.1693394428553;
        Wed, 30 Aug 2023 04:20:28 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id c11-20020a170906924b00b0099297c99314sm7126710ejx.113.2023.08.30.04.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 04:20:27 -0700 (PDT)
Message-ID: <7cba182f-2b35-84e5-16c7-770a6aff5062@linaro.org>
Date: Wed, 30 Aug 2023 13:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: mt6360: add PMIC MT6360
 related nodes
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20230825114623.16884-1-macpaul.lin@mediatek.com>
 <20230830111532.9048-1-macpaul.lin@mediatek.com>
 <20230830111532.9048-3-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830111532.9048-3-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_042030_822405_AF6A08C5 
X-CRM114-Status: UNSURE (   8.37  )
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

On 30/08/2023 13:15, Macpaul Lin wrote:
> +
> +	led {
> +		compatible = "mediatek,mt6360-led";
> +	};
> +
> +	regulator {
> +		compatible = "mediatek,mt6360-regulator";
> +		LDO_VIN3-supply = <&mt6360_emi_vddq_buck2_reg>;
> +
> +		mt6360_emi_vdd2_buck1_reg: buck1-emi-vdd2 {

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Best regards,
Krzysztof


