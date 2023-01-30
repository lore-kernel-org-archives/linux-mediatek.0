Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC46BC54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 11:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLtIKfrQlP60j4+DiH/uXns1J7cBM/abFHLneyBahMs=; b=uqB9O4Yx3zlXR1ht3jCMEIiVeS
	GPFDYr4441I11h72Y5FkK60NXiX3IR2C1Iv1uORLmxSec3zx7jL7a8av29dqImz8cY/+g6O3u68OO
	Bb5bzqpgVUIzHd9L20lX8IpOFWBE3+sfbMf0mqemuPYLugTYWZshNEO/1D2UaBqghPd9vuhLkqTtM
	zYvlwh+6Qb4uGzZmN8qz15qrZSuab+o0XKNFRai15R/D7swrXBI69tkkfBIv9IJlv+QJzlwZgvU/j
	BPCpaH/4FAcBdCu9/Mt1k+4aeXhl6hremhAXoqgz4QiAEBjXqPXpETeLs6C/qtYNWlbkWUPJ//FMp
	XoqTs8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSLX-003IDe-5a; Mon, 30 Jan 2023 11:29:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSKM-003I86-OC; Mon, 30 Jan 2023 11:27:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso1793569wms.0;
        Mon, 30 Jan 2023 03:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OLtIKfrQlP60j4+DiH/uXns1J7cBM/abFHLneyBahMs=;
        b=Irt249mnGvQvO23P85fhdsJ7dvOLw4yemt9EXkUwsHhP610YrgXtEsxLJBHhJb+zIv
         vH3kXhG0fNhEuqOzY0vjpH3qn3+KYxn/uhJeYUsOHEk8ekF/668EGj3xjF6hQLPjABOr
         iAMHcFoM17QRWeqQmSY2ySPZs9NQjQjpXrchvTmVpgNYHFafmgmWUwz53BbUZa0r59+q
         fQJm+MUm55/BO/Y0RiFE0IwR8S8jgOhP3qHCoyjwgA3Fk2Z60tWXo4CP8tWIT60IlLC9
         Gh8MK2Awpq+5ZUwR/wzPhZEHQFFeVOiUfGBlBxYp0scx9MbJjodnA8g5+B0JZYSH1tpC
         NGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLtIKfrQlP60j4+DiH/uXns1J7cBM/abFHLneyBahMs=;
        b=dCwEAKg2KTzylm9EkR49Gzz5/p6tlpIye0LcFia0RAhihN/xrCIHUF2TxXs9e1x3r9
         oLBLBzOuF9QUCeF8A1CVe6gSeOnW1K4CkZtxAhEFl8cUGhyxS/RyUflWrMr2qErt4+bi
         E1UqW/R4RUEzdlE5pYKowZEh0ptMC2J6hilu6vnaeNuhJt6Btb4XV2uAsYGutDpM9ezC
         /mHAqy8+qAh/o4mAMN6tu51JINhB5d7R0vUe5CCjMdbTUWqX8trV7yqLMo2EUqBcsms8
         OvvCm2EVvWb6AEbykxhypjxTLureVosxikJVlqQAhPYtUn/wfpUKQO5Y2zOeRvlR14DE
         Ec3g==
X-Gm-Message-State: AO0yUKXneK6Grl0PUpcaEMxKkRBDC9zpUr2N5PNBwSiOAc4MG6VyxuxS
	V13g5fDT8wIGjTiYb2om4KY=
X-Google-Smtp-Source: AK7set/5iNsvsM5ybxrTH5ZpW/0KUhjubVlqPz+QI8m2RB1wvXMRG7KKhUq0WeLIHNH7pCYanD2Oqw==
X-Received: by 2002:a7b:c7ce:0:b0:3dc:42d2:aeee with SMTP id z14-20020a7bc7ce000000b003dc42d2aeeemr10296508wmk.25.1675078074261;
        Mon, 30 Jan 2023 03:27:54 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id bd16-20020a05600c1f1000b003d1f3e9df3csm16557501wmb.7.2023.01.30.03.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 03:27:53 -0800 (PST)
Message-ID: <c8023960-3361-91a3-6fdb-7c66bcabd2e9@gmail.com>
Date: Mon, 30 Jan 2023 12:27:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 2/4] dt-bindings: arm: mediatek: mmsys: Add support for
 MT8195 VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230118031509.29834-1-moudy.ho@mediatek.com>
 <20230118031509.29834-3-moudy.ho@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118031509.29834-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_032758_831421_F3391FA1 
X-CRM114-Status: GOOD (  14.16  )
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



On 18/01/2023 04:15, Moudy Ho wrote:
> For MT8195, VPPSYS0 and VPPSYS1 are 2 display pipes with
> hardware differences in power domains, clocks and subsystem counts,
> which should be determined by compatible names.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Applied, thanks!

> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 84de12709323..b08ae7405b1a 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -33,6 +33,8 @@ properties:
>                 - mediatek,mt8186-mmsys
>                 - mediatek,mt8188-vdosys0
>                 - mediatek,mt8192-mmsys
> +              - mediatek,mt8195-vppsys0
> +              - mediatek,mt8195-vppsys1
>                 - mediatek,mt8365-mmsys
>             - const: syscon
>   

