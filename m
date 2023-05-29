Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105BAC77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CIOFGe7y3rWt6si5E9BP0VcQBh+5HMdpBhv4DRUuO0=; b=X0QdToBwFtw+mkgErjjDyW7jbh
	5m0kt/DFloEbNP1lekQkmi6YcP+YDAd21Fuxa57rcLuhwnNkTDfUO048qXmMRZ20ouLIOdWox59Kx
	7deVGAA5guqxBNdg923TzCLUwOZ3jncyzVXdqmYW+K9HB+449TDuwp8y/BxUmsq0qEiw05I+/3Z8V
	HRGgA2DeAmTg22M5SFr8x/PjC6kj3QgUTCw5NNMCxAmvkE2zHJLWMdJLXemEWEzv9Z59oYygT1XvZ
	ho+LG8d3mMkSxgUX3Xj+jVvmxISQ2m9Zp8V7LL20+QT2dWRG3DkiP/UVgBWZWCkBfKcnS0rTlfDEx
	ucz0HRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cuc-00Aazn-0g;
	Mon, 29 May 2023 13:27:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cuZ-00Aays-0y;
	Mon, 29 May 2023 13:27:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f6da07feb2so33986435e9.0;
        Mon, 29 May 2023 06:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685366865; x=1687958865;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3CIOFGe7y3rWt6si5E9BP0VcQBh+5HMdpBhv4DRUuO0=;
        b=eCCayJxWUTEimpttr2ZIbM0u+5IGFNEzXBe5ebbmqJZOVQA7YvD5OMZ3XpaGyzpv8D
         QPGqMQo7fTvYkpffVPYW6Nb5WPC255XBC9Hhrbl1TueurluafP1aaMnaP1caBspGYhrp
         ha7p7nl/OLe0NzMUHNa4EyxDreW8AoMDo1c5C8yrtZpyo58+t1HrnJupmB9C0uAK+lvM
         WdvfeiBW4UDeDXgYq8cCD6KOMfKuknVhNEWPkWAwd1Bz/fkmJA5pKPTcFy5l6V5NJR8S
         hcci1Ou6s63JYsKvcWFWyKFl6/Sgtc+r6uEbcV80CwrM9YsvUa0FKoxpCLQEeg6JKbuC
         k5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685366865; x=1687958865;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3CIOFGe7y3rWt6si5E9BP0VcQBh+5HMdpBhv4DRUuO0=;
        b=G/W3MjOmSy5JIw/HdOeSUN6QWfHcoJbmQs9PQRpGEYbZdLmITZSTLTG3JvRHJVCWXd
         ayubk6UThDcb1n1rLdUbFrM7Rq7kz3hXJZOtSeiPzcd1aPN4sQOt2Uc9ppBZv0r0b0ix
         Hs8/bL18E1hCezVSPiM9XDmsX3DhD7JGxEOpcTt4+/wNZFfqmVB+cL+Lc5Gv9B769gH/
         ykw025w5g77hcLp1lrTJjBhmLPmaFDGuWE6wrx0qt6b5WGiXpAN2sRxzFdOC2zXbkEfh
         oQXIbMUSrAxS/FCo5E3P+PrmzgJFhZSF4j6Yb3iwtJ0trJfcCyjvWv/eSuFTQuMn8XN0
         REPQ==
X-Gm-Message-State: AC+VfDxk/OYZZRoQZJrTuGPlNY8ZO7Hp2Jpmj2ma8ObGR+fMIKbKvEsD
	bqW5rx8EPMxqGZwhyFL65a8=
X-Google-Smtp-Source: ACHHUZ6QGigJaj58LjESMCDN1wlhyA70hT7yuoX/bRK6/8yR/ACx7ZmkK8SgpAOgB3P1CR2icPsNfg==
X-Received: by 2002:a05:600c:208:b0:3f4:271a:8aaf with SMTP id 8-20020a05600c020800b003f4271a8aafmr9529902wmi.38.1685366864884;
        Mon, 29 May 2023 06:27:44 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n26-20020a7bcbda000000b003f60482024fsm14336309wmi.30.2023.05.29.06.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 06:27:43 -0700 (PDT)
Message-ID: <b6d2f1cd-1d0c-da86-cef9-38350a2f4d12@gmail.com>
Date: Mon, 29 May 2023 15:27:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/6] MediaTek Helio X10 MT6795 - MT6331/6332 PMIC
 Wrapper
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 amergnat@baylibre.com, flora.fu@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412131216.198313-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412131216.198313-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_062747_360125_20242362 
X-CRM114-Status: GOOD (  18.20  )
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



On 12/04/2023 15:12, AngeloGioacchino Del Regno wrote:
> Changes in v3:
>   - Rebased on next-20230412
>   - Changed if branch to switch in pwrap_init() as suggested
>     by Matthias and Alexandre.
> 
> Changes in v2:
>   - Rebased on next-20230323
>   - Changed pwrap.txt addition to new yaml file addition
> 
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
> 
> This series introduces support in the PMIC Wrapper for a different PMIC
> topology, which is commonly found on smartphone boards, using one main
> PMIC and one Companion/Sub PMIC, both accessible *only* through the pwrap;
> be aware that this kind of topology is not *specific to* the Helio X10
> SoC, but common across many kinds of MediaTek smartphone oriented SoCs
> and board designs.
> 
> That said, support for the PMIC combo MT6331+MT6332 is provided in this
> series in a form that will be able to initialize the PMICs with crypto
> and DualIO but nothing else: these PMICs are very featureful, so I have
> decided to add this support in more than just one step, as there will
> be multiple patches for multiple different subsystems (..it's a mfd!..).
> 
> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
> 
> AngeloGioacchino Del Regno (6):
>    dt-bindings: soc: mediatek: pwrap: Add compatible for MT6795 Helio X10
>    soc: mediatek: pwrap: Move PMIC read test sequence in function
>    soc: mediatek: pwrap: Add kerneldoc for struct pwrap_slv_type
>    soc: mediatek: mtk-pmic-wrap: Add support for companion PMICs
>    soc: mediatek: mtk-pmic-wrap: Add support for MT6331 w/ MT6332
>      companion
>    soc: mediatek: pwrap: Add support for MT6795 Helio X10
> 
>   .../bindings/soc/mediatek/mediatek,pwrap.yaml |   1 +
>   drivers/soc/mediatek/mtk-pmic-wrap.c          | 292 ++++++++++++++++--
>   2 files changed, 267 insertions(+), 26 deletions(-)
> 

Applied thanks!

