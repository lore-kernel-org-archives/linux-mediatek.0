Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C65C001B2
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heyMuzHz04KriYj72sAHJedD18+iTfhlMb4XPvSBspg=; b=W9CRNW9uLYY2g0a2BuofBjTQdC
	g7HQzCPKY3yeWrKW15FNaarrchO9t4an97uMCiyvdImH+HhcczaEZRt+fVFZ9aWILu1+OesCCl0Oo
	FRrCllRVctrJVNuDIAvgIJayO9EkzVIdwbHhIN6Fcey8GqSVNBDFedqOIT9hDktETY/SCAiWP6HTd
	l3yOtp1uEA4ANYhczMRkwlMX43MZ6uj5fknjcSiGO6fR4kS7dBxu2Q3CLGW2Xq/UYZM1DUgZ5Y2kL
	YmakNcaRoxnRQ8+u55PHaq321wwwddzJPTGf8Z9V+na+YCMekafNmri9Uq+RQnCvDShjpibwJlH15
	Vc8/Qv1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68ky-00EQ9s-Ex; Fri, 16 Dec 2022 11:20:00 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68ku-00EQ6f-In; Fri, 16 Dec 2022 11:19:57 +0000
Received: by mail-wr1-x42a.google.com with SMTP id co23so2168956wrb.4;
        Fri, 16 Dec 2022 03:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=heyMuzHz04KriYj72sAHJedD18+iTfhlMb4XPvSBspg=;
        b=PrqKoAa/RVDC8IMImj4wqKQxVWkq8wfzQa29ZFtEpLDU9FmIUYj3VwkcGJd4xAyt6L
         p1OMPIMyFJ8IPhtzPx+gLKIIwH1tdfcGlc8uO/bu1XyWXQdaZ4XRa7k7UYkxb8mnMCbu
         PpTXRVyi2xoTiUOPNsE5OAgI4gTozuMhfptawGg+a/6g3ojEmT2iQXrl2ELKje8Ea8PD
         jPugDooGQdPs4w7mp9qKcSXwZnik241zUG9WUm3mo2rKmc/seZxQd6IzHCD1pHfIP1h+
         ALgw5PldIQBOh4YFG3GRGC+WGqxbUrMe8rLDZL8tjgDUdxjYVM76w8OJDfR6ejpfyeOv
         lyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heyMuzHz04KriYj72sAHJedD18+iTfhlMb4XPvSBspg=;
        b=euciljew3vCC3gv9WlXjz8+bS/1+xtsIZr37kI/NoiFYT58j1fqp7U59VvN9eg4gml
         h03Ye5dOrYCYVcVr6BELzfLH92T6CuDe79ly549gUjXVVxEiUQhwzLO3isMj1v8B43t9
         oXkLUzolBk/d0+pbZIjNXDth3d2FuTfD3SP3CoAEXFvvYU6C3c0AE9GSASVv19uMXb+0
         Heaop3QPXCmzEL1qgAJyft+qyx6uYpnbue3Byx+oapVkYb62GeRq3MRZ68Km5UVgARbF
         Ud+mCp7NpfjOEtoxyaZvQLAb2W+SLONqX7HqmzkXE4i/4Bea2b2G0BctiU7zUbe0okJu
         B+Mg==
X-Gm-Message-State: ANoB5pmCrLrVBCFX433hfafsWfqTcKzqyzIzc2Qo0osI3EbBW6sRh9B2
	iWtnbVW2cM9vi4d57coc9U///s4k9pg=
X-Google-Smtp-Source: AA0mqf6qzujekHT6IZcXXelCTj2i4HPROM7svglyHpI3TSb5uzFdzhe0cPZAq932XfbYKkwkU9S+ZQ==
X-Received: by 2002:adf:ed05:0:b0:242:1ea7:2bba with SMTP id a5-20020adfed05000000b002421ea72bbamr20885675wro.49.1671189595136;
        Fri, 16 Dec 2022 03:19:55 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i13-20020adfefcd000000b0024216d2e386sm2102009wrp.16.2022.12.16.03.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:19:54 -0800 (PST)
Message-ID: <b0e5d510-9947-b54c-a8a9-c20555818bb1@gmail.com>
Date: Fri, 16 Dec 2022 12:19:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 3/7] dt-bindings: mfd: syscon: Add mt8365-syscfg
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 angelogioacchino.delregno@collabora.com, khilman@baylibre.com
References: <20221213234346.2868828-1-bero@baylibre.com>
 <20221213234346.2868828-4-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221213234346.2868828-4-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_031956_642080_9E684BCA 
X-CRM114-Status: GOOD (  10.88  )
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



On 14/12/2022 00:43, Bernhard Rosenkränzer wrote:
> Document Mediatek mt8365-syscfg
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 1b01bd0104316..7beeb0abc4db0 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -50,6 +50,7 @@ properties:
>                 - marvell,armada-3700-usb2-host-misc
>                 - mediatek,mt8135-pctl-a-syscfg
>                 - mediatek,mt8135-pctl-b-syscfg
> +              - mediatek,mt8365-syscfg
>                 - microchip,lan966x-cpu-syscon
>                 - microchip,sparx5-cpu-syscon
>                 - mstar,msc313-pmsleep

