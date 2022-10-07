Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C7FC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 07:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6pbeOdotLRHHyLhHXUxZEFAlmYdp5RIPKSKkUaT36I=; b=ZdBP0yOvF25Ubp4Y8PM7NvvamL
	mYQwD6OYjm9UYWndY8EOrx6XsMv3mapLTdvcKMfl/lxc5QGHdpEmPV2cIHkuXNAbQlUu/VxA4ht23
	gM1Hh36+WIUUYYYrUKSWdEzwDSa2CbfvwZQEkqfX+8cKi3mjMIJ7Z200a9mO5kcefjrtBRbGaeFl+
	KgGDEOypXXzc763jbhLaJu5UsGlDqGGZyoEO3OzIlZCA+SMs6FTiPVTGAaKFHM3rS9PLMB8wfIoDQ
	qPcmgADO5swRuUJ3x7YobTXxQxOxZhV/KAgD6CeGqzSAIHozbsmBeJz3Z0Edwv/A9qnvefK4ZfDvs
	MBJd1gZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghjL-007tFo-9R; Fri, 07 Oct 2022 07:25:11 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghjJ-007tFU-HF
	for linux-mediatek@lists.infradead.org; Fri, 07 Oct 2022 07:25:10 +0000
Received: by mail-lf1-x12b.google.com with SMTP id j4so6172822lfk.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Oct 2022 00:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=z6pbeOdotLRHHyLhHXUxZEFAlmYdp5RIPKSKkUaT36I=;
        b=kWfYkegF/+NHSvikV88fmsB5HHGNrSmdsbvrlTz+ZjHyvsTnFHTHErFlERfNG4k+mX
         iXEV5AmyM6hlAKwP9J62BWOrqMCDJ11vqIWOx3qBQJ73nvuy4/4nGEwbFjtg99qZLFUD
         5YxJFG8AGtHAiOr2F+fh1i6CKLV81PHMY0PDq1nrfeRxWm9+ySayR865kxIjGHDoWkMg
         YeOBn0+1m2t1a56kyIq7EMWZYkrf7Vixenscdlz9WOaXSwQQMq0utTS0VOEDKTHtdhl2
         yzqG2R74Nq3zEQZqLpKKVRCN1Wb0oZ4yEDgQGJDuD36I9woMxY1p+/LJNE72rey95LPe
         GtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=z6pbeOdotLRHHyLhHXUxZEFAlmYdp5RIPKSKkUaT36I=;
        b=RDMPLBUjZ2kxNaUAXmUr0VezgMxV1Tx6zH6C+dk+94+O0+O62HRojxjFU5iLL8yMfS
         xHKB7yH2K+969ezez1PyCPgnEH+0QG1kXsAjbojwvg+UsHj7zvsFaG/96q1Xe3YSEvRv
         KvCl3z4iuApmYEnJXnoj+0ExqTO1/S5DMYCewga0m4vAW2I0anJMPU+PVROPl1P0f1/I
         iOGv7trT2+MLisFdxJtkpRDV2g5dcEKIPbKZyDQXkyU4UJku8QBdp8YjAblPdOVEeQjG
         IZDSEWDnmCIvmkaVdC48cZTPC1HYlJvl8VG5xPxywYxZpOFvbVE2V4O3meMqCNO0Bj1Q
         D19A==
X-Gm-Message-State: ACrzQf3tqoh5tdpuuzP7f1CSp0WXGnJjtw7qupQ2ZXNMv3vJcGww/D28
	UvTpU+kBXezpSoKJWbxT2v1PVQ==
X-Google-Smtp-Source: AMsMyM7SxRlA7vcJhHDTJ/TZj8w8L3BIV84OHGGZg8Q4LrVBRLncdVeqKKKFwQSWXpyYZn2PkGvmkw==
X-Received: by 2002:ac2:4e03:0:b0:485:74c4:97ce with SMTP id e3-20020ac24e03000000b0048574c497cemr1273773lfr.13.1665127507027;
        Fri, 07 Oct 2022 00:25:07 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a056512118600b00492dadd8143sm182607lfr.168.2022.10.07.00.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 00:25:06 -0700 (PDT)
Message-ID: <e9fe9674-8b33-dd6f-2db4-1ea4ed8d17af@linaro.org>
Date: Fri, 7 Oct 2022 09:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 5/8] dt-bindings: watchdog: mediatek: Convert mtk-wdt to
 json-schema
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221006120715.24815-1-allen-kh.cheng@mediatek.com>
 <20221006120715.24815-6-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221006120715.24815-6-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_002509_614443_38608DB9 
X-CRM114-Status: UNSURE (   9.67  )
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

On 06/10/2022 14:07, Allen-KH Cheng wrote:

Thank you for your patch. There is something to discuss/improve.


> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description:
> +  The watchdog supports a pre-timeout interrupt that fires
> +  timeout-sec/2 before the expiry.
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:

This is just one enum in "items", so no need for the "items".

> +              - mediatek,mt2712-wdt
> +              - mediatek,mt6589-wdt
> +              - mediatek,mt7986-wdt
> +              - mediatek,mt8183-wdt
> +              - mediatek,mt8186-wdt
> +              - mediatek,mt8192-wdt
> +              - mediatek,mt8195-wdt

Best regards,
Krzysztof


